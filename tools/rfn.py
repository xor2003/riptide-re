#!/usr/bin/env python3
"""Extract one function from RIPTIDE.lst by name or seg:off. Annotates xrefs to names."""
import re, sys

LST = '/home/xor/games/Riptide/RIPTIDE.lst'
MAP = '/home/xor/games/Riptide/RIPTIDE.map'

# load map: segbase(para) -> syms  ; map uses 'segidx:offset' where segidx is paragraph
syms = {}   # (segidx:int, off:int) -> name
segname = {}  # para -> segment name like seg03f9
for line in open(MAP):
    m = re.match(r'\s*([0-9A-Fa-f]{4}):([0-9A-Fa-f]{4})\s+(\S+)\s*$', line)
    if m:
        syms[(int(m.group(1),16), int(m.group(2),16))] = m.group(3)

# map 'segXXXX' names to paragraphs: seg03f9 -> 0x3f9
def seg_para(segname_s):
    return int(segname_s[3:], 16)

# parse lst: find function boundaries
def find_func(target):
    """target: symbol name (e.g. @init_game$qv or init_game) or seg:off"""
    lines = open(LST, errors='replace').read().splitlines()
    # find proc start
    start_i = None
    for i, line in enumerate(lines):
        if re.search(r'\bproc\b', line):
            # extract name token before 'proc'
            m = re.match(r'^(seg\w+):([0-9A-F]+)\s+(\S+)\s+proc', line)
            if m:
                nm = m.group(3)
                if target in (nm, nm.lstrip('@').split('$')[0], f"{m.group(1)}:{m.group(2)}"):
                    start_i = i
                    break
    if start_i is None:
        return None
    # find endp
    out = []
    for i in range(start_i, len(lines)):
        out.append(lines[i])
        if re.search(r'\bendp\b', lines[i]):
            break
    return out

def demangle(mangled):
    """rough Borland C++ demangle"""
    if not mangled.startswith('@'): return mangled
    body = mangled[1:]
    parts = body.split('$q')
    name = parts[0].replace('@','::')
    return name

if __name__ == '__main__':
    if sys.argv[1] == 'list':
        for (s,o),n in sorted(syms.items()):
            print(f"{s:04X}:{o:04X} {n}")
        sys.exit()
    tgt = sys.argv[1]
    r = find_func(tgt)
    if r:
        print('\n'.join(r))
    else:
        print("not found", file=sys.stderr)
