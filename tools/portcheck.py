#!/usr/bin/env python3
"""Verify a reconstructed Riptide routine against the original binary.

Usage:
    python3 tools/portcheck.py <name> [<name> ...]

Example:
    python3 tools/portcheck.py init_game play_game 'game::doit()'

<name> may be a demangled function name ('init_game', 'play_game'), a full
demangled signature ('play_game(unsigned char)'), or a BC3.1 mangled name
('@init_game$qv').

Steps:
  1. resolve the routine's extent in the ORIGINAL binary from
     RIPTIDE.lst.map (IDA-derived map with BC3.1-mangled routine names)
  2. resolve the routine's public offset in the test exe
     (decomp/link/RIPTIDE.EXE + RIPTIDE.MAP, TLINK public map)
  3. mzdiff the two extents (--nocall --loose), report match/mismatch

Prerequisite: a link build exists (decomp/link.sh or build_native.sh).
"""
import os
import re
import struct
import subprocess
import sys

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
DECOMP = os.path.join(ROOT, 'decomp')
MZDIFF = os.environ.get(
    'MZDIFF', '/home/xor/mzretools/build/mzdiff')
REF_MAP = os.path.join(ROOT, 'RIPTIDE.lst.map')
REF_EXE = os.path.join(ROOT, 'RIPTIDE.EXE')
TEST_EXE = os.path.join(DECOMP, 'link', 'RIPTIDE.EXE')
TEST_MAP = os.path.join(DECOMP, 'link', 'RIPTIDE.MAP')

SEG_RE = re.compile(r'^(seg\w+) (CODE|DATA|STACK) ([0-9a-fA-F]+)')
RTE_RE = re.compile(r'^([\w@$?]+): (seg\w+) (NEAR|FAR) '
                    r'([0-9a-fA-F]+)-([0-9a-fA-F]+)')
# TLINK public map: " SSSS:OOOO       demangled(signature)"
PUB_RE = re.compile(r'^\s*([0-9A-Fa-f]+):([0-9A-Fa-f]+)\s+(\S.*)$')


def load_ref_map(path):
    """-> (segs, routines): seg-name -> linear base; demangled/short name
    -> (mangled, linear_start, linear_end)."""
    segs, routines = {}, {}
    for line in open(path, errors='replace'):
        m = SEG_RE.match(line)
        if m:
            segs[m.group(1)] = int(m.group(3), 16) * 16
            continue
        m = RTE_RE.match(line)
        if not m:
            continue
        name, seg, _nf, lo, hi = m.groups()
        if seg not in segs:
            continue
        start, end = segs[seg] + int(lo, 16), segs[seg] + int(hi, 16)
        mangled = name
        if name.startswith('@'):
            # @name$q<args> -> name(args)
            mm = re.match(r'@([\w~]+)\$q(.*)', name)
            if mm:
                routines.setdefault(mm.group(1), []).append(
                    (mangled, start, end))
                continue
        routines.setdefault(name, []).append((mangled, start, end))
    return segs, routines


def load_test_publics(path):
    """-> ordered list of (demangled_name, seg, ofs)."""
    pubs = []
    for line in open(path, errors='replace'):
        m = PUB_RE.match(line.rstrip())
        if m:
            pubs.append((m.group(3).strip(),
                         int(m.group(1), 16), int(m.group(2), 16)))
    return pubs


def resolve_ref(name, routines):
    """name -> (mangled, start, end) or exit with candidate list."""
    cands = routines.get(name, [])
    if not cands and not name.startswith('@'):
        # try signature match: 'play_game(unsigned char)'
        for n, entries in routines.items():
            for m2 in (re.match(r'@([\w~]+)\$q(.*)', e[0]) for e in entries):
                if m2 and name.startswith(m2.group(1) + '('):
                    cands.extend(entries)
    if not cands:
        # substring fallback: unique mangled-name match
        cands = [e for entries in routines.values() for e in entries
                 if name in e[0]]
    if len(cands) != 1:
        print(f'{name}: {"no" if not cands else "ambiguous"} routine match'
              + (f', candidates: {[c[0] for c in cands]}' if cands else ''))
        return None
    return cands[0]


def resolve_test(name, pubs):
    """name -> (seg, ofs) of public in test exe map."""
    for nm, seg, ofs in pubs:
        base = nm.split('(')[0].strip()
        if nm == name or base == name or \
                (name.startswith('@') and base and name[1:].startswith(base)):
            return seg, ofs
    return None


def next_extent_end(seg, ofs, pubs):
    """end = next public's offset in same segment, else ofs."""
    cand = [o for s, o in [(p[1], p[2]) for p in pubs] if s == seg and o > ofs]
    return min(cand) if cand else None


def main():
    names = [a for a in sys.argv[1:] if not a.startswith('-')]
    if not names:
        print(__doc__)
        return 1
    for f in (REF_MAP, REF_EXE, TEST_EXE, TEST_MAP):
        if not os.path.exists(f):
            print(f'missing {f} -- build the decomp link first')
            return 1
    _segs, routines = load_ref_map(REF_MAP)
    pubs = load_test_publics(TEST_MAP)
    rc = 0
    for name in names:
        ref = resolve_ref(name, routines)
        if not ref:
            rc = 1
            continue
        mangled, rstart, rend = ref
        size = rend - rstart
        tgt = resolve_test(name, pubs)
        if tgt is None:
            print(f'{name}: not found in {TEST_MAP}')
            rc = 1
            continue
        tseg, tofs = tgt
        tlin = tseg * 16 + tofs
        tend = next_extent_end(tseg, tofs, pubs)
        spec_tgt = (f'{TEST_EXE}:0x{tlin:x}-0x{tlin + size:x}'
                    if tend is None else
                    f'{TEST_EXE}:0x{tlin:x}-0x{tseg * 16 + tend:x}')
        cmd = [MZDIFF, f'{REF_EXE}:0x{rstart:x}-0x{rend:x}', spec_tgt,
               '--map', REF_MAP, '--nocall', '--loose', '--nostat']
        r = subprocess.run(cmd, capture_output=True, text=True)
        n_err = sum(' != ' in ln or 'ERROR' in ln
                    for ln in r.stdout.splitlines())
        status = 'MATCH' if r.returncode == 0 else f'DIFF({n_err})'
        print(f'{name}: {mangled} ref=0x{rstart:x}-0x{rend:x} '
              f'tgt=0x{tlin:x} {status}')
        if r.returncode != 0 and '-v' in sys.argv:
            print('\n'.join('  ' + ln for ln in r.stdout.splitlines()[:40]))
        if r.returncode != 0:
            rc = 1
    return rc


if __name__ == '__main__':
    sys.exit(main())
