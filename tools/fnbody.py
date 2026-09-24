#!/usr/bin/env python3
# Dump an original function body from RIPTIDE.lst (handles the binary-safe read).
# usage: fnbody.py <name_or_seg:addr> [name_or_seg:addr ...]
#        fnbody.py @game_manager@\$bctr\$qnuc
#        fnbody.py seg110e:0044
import re, sys

lst = open('RIPTIDE.lst', errors='replace').read().splitlines()

def find(key):
    key = key.replace('@', '@')
    out = False
    for l in lst:
        # function head: 'seg:addr name proc' or 'seg:addr name:'
        if not out:
            m = re.match(r'^(seg[0-9a-fA-F]+):([0-9a-fA-F]+)\s+(\S+)', l)
            if m:
                sym = m.group(3).rstrip(':')
                base = sym.lstrip('@').split('$')[0]      # demangle
                if (sym == key or base == key.lstrip('@').split('$')[0] or
                        ('%s:%s' % (m.group(1), m.group(2))) == key.lower()):
                    out = True
        else:
            # stop at next proc/endp of this fn
            if re.search(r'\bendp\b', l):
                print(l); return
            if re.match(r'^seg[0-9a-fA-F]+:[0-9a-fA-F]+\s+; =+', l) or \
               re.match(r'^seg[0-9a-fA-F]+:[0-9a-fA-F]+\s+@?[\w@$]+\s+proc\b', l):
                return
        if out:
            print(l)

for k in sys.argv[1:]:
    find(k)
    print()
