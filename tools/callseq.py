#!/usr/bin/env python3
"""Dump the call-sequence of a function range in RIPTIDE.lst.

Usage: callseq.py <lst> <seg:hexstart> <seg:hexend>
Prints each instruction; groups pushes under the following call so you can
reconstruct the C call + arg order (cdecl right-to-left => last push = arg0).
Robust to IDA's non-ASCII immediate bytes (no grep binary filtering).
"""
import sys, re

def main():
    lst, start, end = sys.argv[1], sys.argv[2], sys.argv[3]
    so = int(start.split(':')[1], 16); eo = int(end.split(':')[1], 16)
    seg = start.split(':')[0]
    lines = open(lst, 'rb').read().decode('latin-1').splitlines()
    seq = []          # pending pushes
    for ln in lines:
        m = re.match(r'(%s):([0-9A-Fa-f]+)\s+(.*)' % seg, ln)
        if not m:
            continue
        off = int(m.group(2), 16)
        if off < so or off > eo:
            continue
        ins = m.group(3).strip()
        if not ins or ins.startswith(';'):
            continue
        if ins.startswith('push'):
            seq.append(ins[4:].strip())
            continue
        if ins.startswith('call'):
            tgt = ins[4:].strip()
            print('call %-52s <- args(rev): %s' % (tgt, ' , '.join(reversed(seq))))
            seq = []
            continue
        # non-push/call: flush pending pushes as raw ops
        if seq:
            print('   [pushes w/o call]: %s' % ' , '.join(seq)); seq=[]
        print('   ', ins)
    if seq:
        print('   [pushes w/o call]: %s' % ' , '.join(seq))

main()
