"""Scan every decompiled function for high-signal diffs vs RIPTIDE.lst:
   - conditional-jump polarity flips (je<->jne, jb<->jae, jl<->jge, ...)
   - changed immediate constants in cmp/test/mov
   - changed call targets
Usage: python3 tools/scaninv.py [--all]
Prints only suspicious hunks (not pure codegen noise).
"""
import os, re, sys, difflib
ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, 'tools'))
import adiff

LST = os.path.join(ROOT, 'RIPTIDE.lst')
DECOMP = os.path.join(ROOT, 'decomp')
SOURCES = ['game.cpp', 'actor.cpp', 'creature.cpp', 'menu.cpp', 'scores.cpp',
           'gamemgr.cpp', 'vgadisp.cpp', 'tilemap.cpp', 'gui.cpp']

# conditional jumps by polarity: map each to its opposite
OPP = {'je':'jne','jne':'je','jz':'jnz','jnz':'jz','jb':'jae','jae':'jb',
       'jc':'jnc','jnc':'jc','jbe':'ja','ja':'jbe','jl':'jge','jge':'jl',
       'jle':'jg','jg':'jle','js':'jns','jns':'js','jo':'jno','jno':'jo',
       'jp':'jnp','jnp':'jp','jpe':'jpo','jpo':'jpe','jcxz':'jcxz','loop':'loop'}

def cj(l):
    m = re.match(r'\s*(j\w+|loop)\b', l)
    return m.group(1) if m else None

def gen_procs(asm):
    out=[]
    for l in open(asm, errors='replace'):
        m = re.match(r'^\s*(@?[\w@$]+)\s+proc\b', l)
        if m: out.append(m.group(1))
    return out

def orig_procs(lines):
    txt='\n'.join(lines)
    n=set(re.findall(r'(@?[\w@$]+)\s+proc\b', txt))
    n|=set(re.findall(r'^seg\w+:[0-9A-Fa-f]+\s+(@[\w@$]+):', txt, re.M))
    return n

def interesting(orig, gen):
    """return list of (tag, orig_line, gen_line) for suspicious aligned diffs."""
    hits=[]
    sm=difflib.SequenceMatcher(None, orig, gen, autojunk=False)
    for tag,i1,i2,j1,j2 in sm.get_opcodes():
        if tag=='equal': continue
        ob=orig[i1:i2]; gb=gen[j1:j2]
        oc=[cj(l) for l in ob]; gc=[cj(l) for l in gb]
        ocj=[x for x in oc if x]; gcj=[x for x in gc if x]
        # polarity flip: same position-ish, opposite jcc
        flip=False
        if len(ocj)==len(gcj) and ocj:
            for a,b in zip(ocj,gcj):
                if OPP.get(a)==b or (a!=b and a in OPP and b in OPP and OPP[a]==b):
                    flip=True
        # extract differing lines for context
        if flip:
            hits.append(('JCC-FLIP', ob, gb))
            continue
        # constant changes inside cmp/test lines
        for ol in ob:
            m=re.search(r'(cmp|test|sub|add|mov|and|or|xor|imul|shl|shr|sar)\b.*?([0-9A-Fa-f]+h?|\b\d+)\s*$',ol)
            if not m: continue
        # generic: report replace blocks that mention cmp/immediates differing
        oset=' '.join(ob); gset=' '.join(gb)
        if ('cmp' in oset or 'cmp' in gset) and ob!=gb:
            # crude: if a numeric immediate differs
            on=re.findall(r'\b(?:0x)?[0-9A-Fa-f]+h?\b|(?<![\w.])\d+\b',oset)
            gn=re.findall(r'\b(?:0x)?[0-9A-Fa-f]+h?\b|(?<![\w.])\d+\b',gset)
            if sorted(set(on))!=sorted(set(gn)):
                hits.append(('CONST', ob, gb))
    return hits

def main():
    sym=adiff.build_symtab(LST); adiff.build_name_at(sym); adiff.build_offmap(sym)
    ll=open(LST, errors='replace').read().splitlines()
    op=orig_procs(ll)
    only=[a for a in sys.argv[1:] if a.endswith('.cpp')]
    for src in (only or SOURCES):
        gen=os.path.join(DECOMP, src[:-4]+'.gen.asm')
        if not os.path.exists(gen): print('MISSING',gen); continue
        for name in gen_procs(gen):
            if name not in op: continue
            try:
                o=adiff.get_orig(LST,name); g=adiff.get_gen(gen,name,sym)
            except Exception as e:
                print('ERR',name,e); continue
            hits=interesting(o,g)
            if hits:
                print('\n==== %s  (%s)  orig=%d gen=%d ====' % (name,src,len(o),len(g)))
                for tag,ob,gb in hits:
                    print('  [%s]'%tag)
                    for l in ob: print('   - '+l)
                    for l in gb: print('   + '+l)

main()
