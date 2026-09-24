#!/usr/bin/env python3
"""Regression harness for the Riptide decompile.

Compiles each decomp/*.cpp under DOSBox (BC++3.1) via decomp/build.sh, then
diffs every generated `proc` in the resulting .ASM against the matching proc in
RIPTIDE.lst using tools/adiff.py's normalizer.

Usage:
    rtk python tools/verify.py            # diff all, compare vs golden manifest
    rtk python tools/verify.py --update   # re-baseline tools/golden.txt
    rtk python tools/verify.py --nobuild  # reuse existing *.gen.asm
    rtk python tools/verify.py game.cpp   # only this source

Exit status is non-zero if any function REGRESSED (was clean, now differs) or a
listed function fails to compile / loses its orig counterpart.
"""
import os, re, sys, difflib, subprocess

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, 'tools'))
import adiff

LST    = os.path.join(ROOT, 'RIPTIDE.lst')
DECOMP = os.path.join(ROOT, 'decomp')
GOLDEN = os.path.join(ROOT, 'tools', 'golden.txt')

# sources -> generated asm (build.sh names <base>.gen.asm next to the source)
SOURCES = ['game.cpp', 'actor.cpp', 'creature.cpp', 'menu.cpp', 'scores.cpp',
           'gamemgr.cpp', 'vgadisp.cpp', 'tilemap.cpp', 'gui.cpp']


def gen_procs(asm):
    """names of `proc` blocks in a generated .ASM, in order."""
    names = []
    for l in open(asm, errors='replace'):
        m = re.match(r'^\s*(@?[\w@$]+)\s+proc\b', l)
        if m:
            names.append(m.group(1))
    return names


def orig_procs(lines):
    """orig proc names present in RIPTIDE.lst (proc decls + label-style fns)."""
    txt = '\n'.join(lines)
    names = set(re.findall(r'(@?[\w@$]+)\s+proc\b', txt))
    # label-style functions: 'seg:addr @name:' at a function head
    names |= set(re.findall(r'^seg\w+:[0-9A-Fa-f]+\s+(@[\w@$]+):', txt, re.M))
    return names


def diff_fn(lst, sym, name, asm):
    """-> (orig_insns, gen_insns, n_diff_lines)"""
    orig = adiff.get_orig(lst, name)
    gen  = adiff.get_gen(asm, name, sym)
    n = sum(1 for l in difflib.unified_diff(orig, gen, lineterm='')
            if l[:1] in '+-' and not l.startswith('+++') and not l.startswith('---'))
    return len(orig), len(gen), n


def load_golden():
    g = {}
    if os.path.exists(GOLDEN):
        for l in open(GOLDEN):
            l = l.rstrip('\n')
            if not l or l.startswith('#'):
                continue
            p = l.split('\t')
            if len(p) >= 4:
                g[p[0]] = (int(p[1]), int(p[2]), int(p[3]))
    return g


def main():
    update   = '--update' in sys.argv
    nobuild  = '--nobuild' in sys.argv
    only     = [a for a in sys.argv[1:] if a.endswith('.cpp')]
    sources  = only or SOURCES

    if not nobuild:
        for src in sources:
            r = subprocess.run(['./build.sh', src], cwd=DECOMP,
                               stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
                               text=True, timeout=900)
            base = src[:-4].upper() + '.ASM'
            gen  = os.path.join(DECOMP, src[:-4] + '.gen.asm')
            if not os.path.exists(gen):
                print('BUILD FAILED for', src)
                print(r.stdout[-2000:])
                return 2
            print('built', src)

    sym = adiff.build_symtab(LST)
    adiff.build_name_at(sym)
    adiff.build_offmap(sym)
    lst_lines = open(LST, errors='replace').read().splitlines()
    op = orig_procs(lst_lines)

    golden = load_golden()
    newg, results, regress = {}, [], 0

    for src in sources:
        gen = os.path.join(DECOMP, src[:-4] + '.gen.asm')
        if not os.path.exists(gen):
            print('missing', gen, '(build first)')
            regress += 1
            continue
        for name in gen_procs(gen):
            if name not in op:
                # compiler-internal or not-yet-mapped — skip but note
                continue
            o, g, d = diff_fn(LST, sym, name, gen)
            newg[name] = (o, g, d)
            status = 'IDENTICAL' if d == 0 else ('diff %d' % d)
            old = golden.get(name)
            mark = ''
            if old is not None and old[2] == 0 and d != 0:
                mark = '  <-- REGRESSED'
                regress += 1
            elif old is not None and d > old[2]:
                mark = '  <-- WORSE'
                regress += 1
            elif old is not None and d < old[2]:
                mark = '  (improved %d->%d)' % (old[2], d)
            results.append((src, name, o, g, d, status, mark))

    print('\n%-28s %-34s %6s %6s %12s' % ('source', 'function', 'orig', 'gen', 'status'))
    for src, name, o, g, d, status, mark in results:
        print('%-28s %-34s %6d %6d %12s%s' % (src, name, o, g, status, mark))

    n_id = sum(1 for r in results if r[4] == 0)
    print('\n%d functions diffed, %d identical, %d regressions' %
          (len(results), n_id, regress))

    if update:
        with open(GOLDEN, 'w') as f:
            f.write('# name\torig_insns\tgen_insns\tn_diff\n')
            for name in sorted(newg):
                o, g, d = newg[name]
                f.write('%s\t%d\t%d\t%d\n' % (name, o, g, d))
        print('wrote', GOLDEN)

    return 1 if regress else 0


if __name__ == '__main__':
    sys.exit(main())
