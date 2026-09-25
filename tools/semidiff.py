#!/usr/bin/env python3
# Semantic SET diff: orig RIPTIDE.lst vs BCC -S output, order-insensitive.
# Reports only set differences (present in one side, absent in the other) of:
#   call targets, mem-read/write operands (field/global by offset), immediates,
#   and signed<->unsigned conditional-jump family mismatches.
# Count-only diffs (codegen re-reuse) are suppressed.
# usage: semidiff.py -a            (all decomp/*.gen.asm, all functions)
#        semidiff.py <gen.asm> [lblregex ...]
import re, sys, os, glob
from collections import Counter
sys.path.insert(0, '/home/xor/games/Riptide/tools')
import adiff

LST = '/home/xor/games/Riptide/RIPTIDE.lst'
REGS = set('ax bx cx dx si di bp sp al ah bl bh cl ch dl dh es ds cs ss '
           'eax ebx ecx edx esi edi ebp esp'.split())
JCC = set('jb jbe ja jae je jne jl jle jg jge js jns jc jnc jo jno jp jnp jcxz loop'.split())
ALIAS = {'jz':'je','jnz':'jne','jc':'jb','jnc':'jae','jnb':'jae','jpe':'jp','jpo':'jnp'}
# signedness families: S = jl/jle/jg/jge, U = jb/jbe/ja/jae ; a swap between them is a bug
SGN = {'jl':'S','jle':'S','jg':'S','jge':'S','jb':'U','jbe':'U','ja':'U','jae':'U'}

SYM = {}   # dseg name -> (offset,size); set in main()

def resolve_addr(k):
    """collapse symbol names inside an address to absolute dseg offsets, so the
    same address written under adjacent label names compares equal.
    e.g. 'bx+the_map+2' -> 'bx+14372'  (the_map@0x3822), 'word_2BA84' -> '14372'."""
    if k is None: return None
    regs = []; tot = 0; names = []
    for t in re.split(r'(?=[+-])', k):
        if t in ('', '+'): continue
        s = 1; tt = t
        if tt[0] == '-': s, tt = -1, tt[1:]
        elif tt[0] == '+': tt = tt[1:]
        if tt in ('bp','bx','si','di','sp','es','ds','cs','ss'):
            regs.append(('-' if s < 0 else '') + tt); continue
        if re.fullmatch(r'\d+', tt): tot += s * int(tt); continue
        if tt in SYM: tot += s * SYM[tt][0]; continue
        if tt.startswith('_') and tt[1:] in SYM: tot += s * SYM[tt[1:]][0]; continue
        names.append(('-' if s < 0 else '') + tt)   # unresolved (locals, fields)
    out = regs + names + ([str(tot)] if tot else [])
    return '+'.join(out).replace('+-', '-') or '0'

def memkey(op):
    """canonical memory-operand key, or None if not a memory operand."""
    o = op
    prev = None
    while prev != o:                     # size/seg prefixes can nest either order
        prev = o
        o = re.sub(r'^(?:byte|word|dword|qword|tbyte):', '', o)
        o = re.sub(r'^(?:es|ds|ss|cs):', '', o)
    if '[' in o:
        return resolve_addr(o.strip('[]'))
    if re.fullmatch(r'-?\d+', o): return None           # immediate
    if o in REGS or o in ('X','S','seg'): return None
    if re.fullmatch(r'[A-Za-z_][\w@$.]*', o):
        return resolve_addr(o)                        # bare global -> offset
    return None

def events(insns):
    E = {k: Counter() for k in ('call','memw','memr','imm','jcc')}
    for l in insns:
        p = l.split(None, 1)
        if not p: continue
        mn = p[0]; ops = p[1] if len(p) > 1 else ''
        opsl = ops.split(',') if ops else []
        if mn in JCC:
            E['jcc'][ALIAS.get(mn, mn)] += 1
            continue
        if mn in ('jmp','retf','lea','nop'): continue
        if mn == 'call':
            tgt = opsl[0] if opsl else ops
            E['call'][re.sub(r'\$.*', '', tgt)] += 1
            continue
        if mn == 'push':
            for o in opsl:
                k = memkey(o)
                if k is not None: E['memr'][k] += 1
                elif re.fullmatch(r'-?\d+', o): E['imm'][o] += 1
            continue
        if mn == 'pop':
            for o in opsl:
                k = memkey(o)
                if k is not None: E['memw'][k] += 1
            continue
        if mn in ('cmp','test'):
            for o in opsl:
                k = memkey(o)
                if k is not None: E['memr'][k] += 1
                elif re.fullmatch(r'-?\d+', o): E['imm'][o] += 1
            continue
        for i, o in enumerate(opsl):
            k = memkey(o)
            if k is not None:
                E['memw' if i == 0 else 'memr'][k] += 1
            elif re.fullmatch(r'-?\d+', o) and i > 0:
                E['imm'][o] += 1
    return E

def jfam(c):
    """set of signed/unsigned family letters used."""
    return {SGN[j] for j in c if j in SGN}

def report(lbl, orig, gen):
    eo, eg = events(orig), events(gen)
    out = []
    for cat in ('call','memw','memr','imm'):
        oa = set(eo[cat]) - set(eg[cat])
        ob = set(eg[cat]) - set(eo[cat])
        for x in sorted(oa): out.append(f'  {cat.upper():5} -{x}')
        for x in sorted(ob): out.append(f'  {cat.upper():5} +{x}')
    # signedness-family balance: complementary same-signedness jumps are
    # equivalent codegen (jge-else == jl-then), so only a swap between the
    # signed 'S' and unsigned 'U' families is a real bug signal.
    so = sum(eo['jcc'][j] for j in eo['jcc'] if SGN.get(j) == 'S')
    uo = sum(eo['jcc'][j] for j in eo['jcc'] if SGN.get(j) == 'U')
    sg = sum(eg['jcc'][j] for j in eg['jcc'] if SGN.get(j) == 'S')
    ug = sum(eg['jcc'][j] for j in eg['jcc'] if SGN.get(j) == 'U')
    if (so, uo) != (sg, ug):
        out.append(f'  JCC   signed orig {so}/{uo} -> gen {sg}/{ug}')
    if out:
        print(f'== {lbl}  orig={len(orig)} gen={len(gen)}')
        print('\n'.join(out))

def main():
    global SYM
    sym = adiff.build_symtab(LST)
    SYM = sym
    adiff.build_name_at(sym); adiff.build_offmap(sym)
    args = sys.argv[1:]
    ocache = {}
    def orig_of(lbl):
        if lbl not in ocache:
            ocache[lbl] = adiff.norm_orig(adiff.orig_buf(LST, lbl), sym)
        return ocache[lbl]
    if args and args[0] == '-a':
        for g in sorted(glob.glob('/home/xor/games/Riptide/decomp/*.gen.asm')):
            lbls = [re.match(r'^(\S+)\s+proc', l).group(1)
                    for l in open(g, errors='replace')
                    if re.match(r'^\S+\s+proc\s+far', l)]
            print(f'########## {os.path.basename(g)}  ({len(lbls)} fns) ##########')
            for lbl in lbls:
                orig = orig_of(lbl)
                gen = adiff.get_gen(g, lbl, sym)
                if orig and gen: report(lbl, orig, gen)
                elif orig != gen:
                    print(f'== {lbl}  orig={len(orig)} gen={len(gen)}  BODYLESS')
        return
    asm = args[0]
    lbls = args[1:] or [re.match(r'^(\S+)\s+proc', l).group(1)
                        for l in open(asm, errors='replace')
                        if re.match(r'^\S+\s+proc\s+far', l)]
    for lbl in lbls:
        orig = orig_of(lbl)
        gen = adiff.get_gen(asm, lbl, sym)
        if orig and gen: report(lbl, orig, gen)
        elif orig != gen:
            print(f'== {lbl}  orig={len(orig)} gen={len(gen)}  BODYLESS')

if __name__ == '__main__':
    main()
