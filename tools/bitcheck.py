#!/usr/bin/env python3
# bitcheck.py — extract single-bit flag tests + branch polarity from a fn body.
# Pattern:  mov al,es:[bx+OFF] ; shr ax,N ; and ax,1 ; cmp ax,1 ; jCC target
#           (or: test ...,N / bt, or: and ax,N; jnz/jz )
# Prints:  offset bit  cond  taken-label   ->  which flag and which way it branches
import sys, re, subprocess

LST = '/home/xor/games/Riptide/RIPTIDE.lst'

def body(name):
    return subprocess.run(['python3','tools/fnbody.py',name],
                          capture_output=True,text=True).stdout.splitlines()

def scan(lines):
    out=[]
    # state
    for i,l in enumerate(lines):
        m=re.search(r'shr\s+ax,\s*([0-9]+)',l)
        if m:
            bit=int(m.group(1))
            # look ahead ~4 lines for 'and ax,1' then 'cmp ax,1' then jcc
            for j in range(i+1,min(i+6,len(lines))):
                if 'and ' in lines[j] and re.search(r'and\s+ax,\s*1',lines[j]):
                    for k in range(j+1,min(j+6,len(lines))):
                        cm=re.search(r'cmp\s+ax,\s*([0-9a-fA-Fh]+)',lines[k])
                        jc=re.search(r'\b(jz|jnz|je|jne|jb|jnb|jae|ja|jbe|jl|jge|jle|jg)\b\s+.*?(loc_\w+|locret_\w+|\w+)',lines[k])
                        if cm:
                            out.append(('shr%d'%bit,'cmp'+cm.group(1),None))
                            break
                        if jc:
                            out.append(('shr%d'%bit,jc.group(1),jc.group(2)))
                            break
                    break
    return out

if __name__=='__main__':
    for fn in sys.argv[1:]:
        print('==== %s ===='%fn)
        for row in scan(body(fn)):
            print('  ',row)
