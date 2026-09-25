#!/usr/bin/env python3
# flagdiff.py — compare single-bit flag-test branch polarity between the
# authoritative disasm (RIPTIDE.lst) and generated .gen.asm, per function.
# A flag test looks like:  shr ax,N ; and ax,1 ; (cmp ax,1 | or/test ax,ax) ; jCC
# jump_on = 1 if the JCC branches when flag==1, else 0.  Diff positionally.
import re, sys, subprocess

def norm(l):
    l = l.split(';',1)[0]
    l = re.sub(r'^\s*seg\w+:[0-9A-Fa-f]+\s+','',l)   # lst addr prefix
    l = re.sub(r'^\s*[0-9A-Fa-f]+:\s+','',l)
    return l.strip().lower()

def bit_tests(lines):
    res=[]; i=0; pend_bit=None; base=None
    while i < len(lines):
        ins=norm(lines[i])
        m=re.match(r'shr\s+ax,\s*(\d+)\b',ins)
        if m: pend_bit=int(m.group(1)); base=None; i+=1; continue
        if re.match(r'and\s+ax,\s*1\b',ins):
            base='?' ; i+=1; continue
        if base is not None:
            if re.match(r'cmp\s+ax,\s*1\b',ins): base='cmp1'; i+=1; continue
            if re.match(r'(or|test)\s+ax,\s*ax\b',ins): base='orax'; i+=1; continue
            jc=re.match(r'(jz|je|jnz|jne)\b',ins)
            if jc:
                if base=='cmp1': jump_on = 1 if jc.group(1) in('jz','je') else 0
                elif base=='orax': jump_on = 0 if jc.group(1) in('jz','je') else 1
                else: jump_on=-1
                res.append((pend_bit,jump_on)); pend_bit=None; base=None
            # any other insn breaks the pattern
            elif ins and not ins.startswith(('loc','assume',';')) and not re.match(r'(push|mov|les|jmp|xor)\b',ins):
                base=None; pend_bit=None
        i+=1
    return res

def orig_lines(name):
    raw=subprocess.run(['python3','tools/fnbody.py',name],
                       capture_output=True,text=True).stdout.splitlines()
    # bound to the single fn: start at its '@name:' label, stop at first 'retf'
    lbl=name if name.startswith('@') else '@'+name
    out=[];on=False
    for l in raw:
        if re.search(re.escape(lbl)+r':',l) or re.search(r'\bproc\b',l):
            on=True
        elif on and (re.search(r'\bretf\b',l) or re.search(r'\bproc\b',l)):
            out.append(l); break
        if on: out.append(l)
    return out

def gen_lines(fname,label):
    out=[];on=False
    for l in open(fname):
        if re.match(r'\s*'+re.escape(label)+r'\b',l) and 'proc' in l: on=True
        elif on and 'endp' in l: break
        if on: out.append(l)
    return out

def check(genfile,fns):
    for fn in fns:
        o=bit_tests(orig_lines(fn)); g=bit_tests(gen_lines(genfile,fn))
        bad=False
        for k in range(max(len(o),len(g))):
            oo=o[k] if k<len(o) else None; gg=g[k] if k<len(g) else None
            if oo and gg and oo[0]==gg[0] and oo[1]!=gg[1]:
                bad=True; break
        if bad:
            print('==== %s  (orig flagtests=%d)'%(fn,len(o)))
            for k in range(max(len(o),len(g))):
                oo=o[k] if k<len(o) else None; gg=g[k] if k<len(g) else None
                mark=' <-- POLARITY DIFF' if (oo and gg and oo[0]==gg[0] and oo[1]!=gg[1]) else ''
                if oo!=gg: print('   #%d orig=%s gen=%s%s'%(k,oo,gg,mark))

if __name__=='__main__':
    check(sys.argv[1],sys.argv[2:])
