# Compare the multiset of conditional-branch TEST OPERANDS per function.
# Ignores jump polarity/encoding entirely: if orig and gen test the same
# operand expressions the same number of times, conditions are equivalent.
# A difference in the tested operands/constant = real divergence.
import re, glob, os
from collections import Counter
import adiff
LST='/home/xor/games/Riptide/RIPTIDE.lst'
JCC=set('jb jbe ja jae je jne jl jle jg jge js jns jc jnc jo jno jp jnp'.split())
def tests(body):
    c=Counter()
    for i,l in enumerate(body):
        if re.match(r'\s*j[a-z]+\s',l) and l.strip().split()[0] in JCC:
            for k in range(i-1,-1,-1):
                mm=re.match(r'\s*(cmp|test|or|and|dec|sub|add)\s+(.+)',body[k])
                if mm:
                    c[mm.group(1)+' '+re.sub(r'\s+','',mm.group(2))]+=1
                    break
    return c
sym=adiff.build_symtab(LST); adiff.build_name_at(sym); adiff.build_offmap(sym)
oc={}
def orig_of(l):
    if l not in oc: oc[l]=adiff.norm_orig(adiff.orig_buf(LST,l),sym)
    return oc[l]
n=0
for g in sorted(glob.glob('/home/xor/games/Riptide/decomp/*.gen.asm')):
    lbls=[re.match(r'^(\S+)\s+proc',l).group(1) for l in open(g,errors='replace') if re.match(r'^\S+\s+proc\s+far',l)]
    for lbl in lbls:
        o=orig_of(lbl); gg=adiff.get_gen(g,lbl,sym)
        if not(o and gg): continue
        co,cg=tests(o),tests(gg)
        d=[]
        for k in set(co)|set(cg):
            if co[k]!=cg[k]: d.append(f'   {k}: orig={co[k]} gen={cg[k]}')
        if d:
            n+=1; print(f'== {os.path.basename(g)[:12]:12} {lbl[:36]}')
            print('\n'.join(d[:6]))
print('fns with operand-of-test diffs:',n)
