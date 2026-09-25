import re, glob, os, sys
from collections import Counter
import adiff
LST='/home/xor/games/Riptide/RIPTIDE.lst'
JCC = set('jb jbe ja jae je jne jl jle jg jge js jns jc jnc jo jno jp jnp jcxz loop'.split())
ALIAS = {'jz':'je','jnz':'jne','jc':'jb','jnc':'jae','jnb':'jae','jpe':'jp','jpo':'jnp'}
def jccmult(body):
    c=Counter()
    for l in body:
        m=re.match(r'\s*([a-z]+)\b',l)
        if m and m.group(1) in JCC:
            c[ALIAS.get(m.group(1),m.group(1))]+=1
    return c
sym=adiff.build_symtab(LST); adiff.build_name_at(sym); adiff.build_offmap(sym)
oc={}
def orig_of(l):
    if l not in oc: oc[l]=adiff.norm_orig(adiff.orig_buf(LST,l),sym)
    return oc[l]
for g in sorted(glob.glob('/home/xor/games/Riptide/decomp/*.gen.asm')):
    lbls=[re.match(r'^(\S+)\s+proc',l).group(1) for l in open(g,errors='replace') if re.match(r'^\S+\s+proc\s+far',l)]
    for lbl in lbls:
        o=orig_of(lbl); gg=adiff.get_gen(g,lbl,sym)
        if not (o and gg): continue
        co,cg=jccmult(o),jccmult(gg)
        # report per-mnemonic diffs (ignore pure complementary pairs: handled by eyeball)
        diff=[]
        for m in set(co)|set(cg):
            if co[m]!=cg[m]: diff.append(f'{m}:{co[m]}->{cg[m]}')
        if diff:
            print(f'{os.path.basename(g):22} {lbl:38} {" ".join(diff)}')
