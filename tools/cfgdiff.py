# Decisive polarity check: for every conditional branch, resolve the jump
# target to a content signature. If orig 'jcc T1' and gen 'jcc2 T2' have the
# same test but T2's content matches orig's FALLTHROUGH (not T1), the branch
# sense inverted -> real bug. Complementary encodings keep target semantics.
import re, glob, os
import adiff
LST='/home/xor/games/Riptide/RIPTIDE.lst'
JCC=set('jb jbe ja jae je jne jl jle jg jge js jns jc jnc jo jno jp jnp'.split())
ALIAS={'jz':'je','jnz':'jne','jc':'jb','jnc':'jae','jnb':'jae','jpe':'jp','jpo':'jnp'}
COMP={'jb':'jae','jae':'jb','ja':'jbe','jbe':'ja','jl':'jge','jge':'jl',
      'jg':'jle','jle':'jg','je':'jne','jne':'je','js':'jns','jns':'js',
      'jo':'jno','jno':'jo','jp':'jnp','jnp':'jp'}

def parse(raw_lines):
    """Parse asm body into ordered basic blocks.
       Returns (order, blocks) where blocks[name]=list of instr strings.
       Splits at label lines and after every control-transfer instr."""
    blocks={}; order=[]
    name='B0'; cur=[]
    def close():
        nonlocal cur,name
        blocks[name]=cur; order.append(name); cur=[]
    for l in raw_lines:
        s=l.strip()
        if not s or s.startswith(';'): continue
        # label line?  'name:' or 'name :'
        m=re.match(r'^(@?\w[\w$@]*|\?\?|@@?\w+)[:\s]*$',s)
        if s.endswith(':') and not s.startswith(' '):
            close(); name=s[:-1]; continue
        cur.append(s)
        if re.match(r'^(jmp|j[a-z]+|ret|retf|iret)\b',s):
            close(); name='B'+str(len(order))
    if cur: close()
    return order,blocks

def content_sig(instrs,n=4):
    ops=[]
    for l in instrs:
        m=re.match(r'([a-z]+)\s*(.*)',l)
        if not m: continue
        mn,op=m.group(1),m.group(2)
        if mn in('jmp','call'): op=''  # normalize target away
        ops.append(mn+(' '+op[:14] if mn in('cmp','test','mov','lea','or','and') else ''))
        if len(ops)>=n: break
    return tuple(ops)

def branches(order,blocks):
    res=[]
    for i,b in enumerate(order):
        blk=blocks[b]
        if not blk: continue
        m=re.match(r'(j[a-z]+)\s+(\S+)',blk[-1])
        if not m or m.group(1) not in JCC: continue
        jcc=ALIAS.get(m.group(1),m.group(1)); tgt=m.group(2).rstrip(';')
        test=''
        for k in range(len(blk)-2,-1,-1):
            if re.match(r'(cmp|test|or|and|dec|sub|add)\b',blk[k]): test=blk[k]; break
        taken=content_sig(blocks.get(tgt,['?']))
        ft=content_sig(blocks[order[i+1]]) if i+1<len(order) else ('END',)
        res.append((test,jcc,taken,ft))
    return res

# get raw (label-keeping) bodies
def raw_orig(lbl):
    lines=open(LST,encoding='latin-1').read().split(chr(10))
    out=[]; st=False
    for l in lines:
        if not st and lbl in l and 'proc' in l: st=True; continue
        if st:
            if 'endp' in l and lbl.split('$')[0] in l.replace('@',''): break
            # strip addr+bytes: keep 'seg:off  mnemonic operands' -> mnemonic operands
            m=re.search(r'seg\w+:[0-9A-F]+\s+(.*)',l)
            t=m.group(1) if m else l
            # cut trailing comment
            t=t.split(';')[0].rstrip()
            # drop leading label 'name:'
            mm=re.match(r'\s*((loc_\w+|\?\w+|@?\w[\w$@]*)[:]?)\s*(.*)',t)
            if mm:
                lab=mm.group(1); instr=mm.group(3)
                if lab and instr=='' :
                    out.append(lab+':')
                else:
                    if lab and re.match(r'(loc_|\?\w|@@?\w)',lab):
                        out.append(lab+':')
                    if instr: out.append(instr)
    return out
def raw_gen(path,lbl):
    txt=open(path,errors='replace').read().split(chr(10))
    out=[];st=False
    import re
    labl=lbl.replace('@','@').replace('$','$')
    for l in txt:
        if not st and re.match(re.escape(lbl)+r'\b.*proc',l): st=True; continue
        if st:
            if re.match(r'.*\bendp\b',l): break
            t=l.split(';')[0].rstrip()
            if not t.strip(): continue
            mm=re.match(r'^\s*((@?\w[\w$@]*|@@?\w+|\?\w+):)?\s*(.*)',t)
            lab=mm.group(1); instr=mm.group(3)
            if lab: out.append(lab+':')
            if instr: out.append(instr)
    return out


def main():
    LINES=open(LST,encoding='latin-1').read().split(chr(10))
    # index function proc positions once
    fnpos={}
    for i,l in enumerate(LINES):
        m=re.search(r'(@?\w[\w$@]*)\s+proc\s+far',l)
        if m: fnpos.setdefault(m.group(1),i)
    def raw_orig(lbl):
        st=fnpos.get(lbl)
        if st is None:
            # try label form 'name:' inside lst
            base=lbl
            for i,l in enumerate(LINES):
                if base in l and 'proc' in l: st=i; break
        if st is None: return []
        out=[]
        for l in LINES[st+1:st+900]:
            if 'endp' in l: break
            m=re.search(r'seg\w+:[0-9A-F]+\s+(.*)',l)
            t=(m.group(1) if m else l).split(';')[0].rstrip()
            if not t: continue
            mm=re.match(r'\s*((loc_\w+|\?\w+|@@?\w[\w$@]*):)?\s*(.*)',t)
            lab=mm.group(1); instr=mm.group(3)
            if lab: out.append(lab+':')
            if instr: out.append(instr)
        return out
    return _run(raw_orig)

def _run(raw_orig):
    sym=adiff.build_symtab(LST)
    gfiles={os.path.basename(g):g for g in glob.glob('/home/xor/games/Riptide/decomp/*.gen.asm')}
    alllbl={}
    for g,path in gfiles.items():
        for l in open(path,errors='replace'):
            if re.match(r'^\S+\s+proc\s+far',l):
                alllbl[re.match(r'^(\S+)',l).group(1)]=g
    import sys
    targets=sys.argv[1:] if len(sys.argv)>1 else None
    report=0
    from collections import defaultdict
    for lbl,g in sorted(alllbl.items()):
        if targets and lbl not in targets: continue
        o=raw_orig(lbl); gg=raw_gen(gfiles[g],lbl)
        if not o or not gg: continue
        bo,bbo=parse(o); bg,bbg=parse(gg)
        bro,brg=branches(bo,bbo),branches(bg,bbg)
        mo=defaultdict(list); mg=defaultdict(list)
        for test,jcc,taken,ft in bro: mo[test].append((jcc,taken,ft))
        for test,jcc,taken,ft in brg: mg[test].append((jcc,taken,ft))
        flagged=[]
        for test in mo:
            if test not in mg: continue
            for (jcc_o,tk_o,ft_o) in mo[test]:
                matched=False
                for (jcc_g,tk_g,ft_g) in mg[test]:
                    if jcc_g==jcc_o and tk_g==tk_o: matched=True;break
                    if jcc_g==COMP.get(jcc_o) and tk_g==ft_o: matched=True;break
                if not matched: flagged.append((test,jcc_o,tk_o,ft_o))
        if flagged:
            report+=1; print(f'== {lbl}')
            for f in flagged[:6]: print('   ',f)
    print('flagged fns:',report)

if __name__=='__main__':
    main()
