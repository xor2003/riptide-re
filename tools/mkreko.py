#!/usr/bin/env python3
"""Generate a Reko .dcproject for RIPTIDE.EXE seeded with every procedure
address from RIPTIDE.lst, so reko decompiles all of them."""
import re, sys

LST = 'RIPTIDE.lst'
OUT = 'RIPTIDE.dcproject'
DGROUP = '2608'   # assume ds:seg2608

def clean(name):
    # @m_actor@draw$qv -> m_actor_draw ; @$bnew$qui -> op_bnew
    n = name.lstrip('@')
    n = n.split('$')[0]
    n = n.replace('@', '_')
    n = re.sub(r'[^A-Za-z0-9_]', '_', n)
    if not n or n[0].isdigit():
        n = 'fn_' + n
    return n

procs = []
seen = set()
for line in open(LST, errors='replace'):
    m = re.match(r'\s*(seg[0-9a-fA-F]{4}):([0-9A-Fa-f]{4})\s+(\S+?)\s+proc', line)
    if not m:
        continue
    seg, off, name = m.group(1)[3:], m.group(2), m.group(3)
    addr = '%s:%s' % (seg.upper(), off.upper())
    cn = clean(name)
    if cn in seen:
        cn = cn + '_' + addr.replace(':', '_')
    seen.add(cn)
    procs.append((addr, cn))

with open(OUT, 'w') as f:
    f.write('<?xml version="1.0" encoding="utf-8"?>\n')
    f.write('<project xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns="http://schemata.jklnet.org/Reko/v4">\n')
    f.write('  <arch>x86-real-16</arch>\n')
    f.write('  <platform>ms-dos</platform>\n')
    f.write('  <input>\n')
    f.write('    <filename>RIPTIDE.EXE</filename>\n')
    f.write('    <disassembly>RIPTIDE.reko.asm</disassembly>\n')
    f.write('    <intermediate-code>RIPTIDE.reko.dis</intermediate-code>\n')
    f.write('    <output>RIPTIDE.reko.c</output>\n')
    f.write('    <types-file>RIPTIDE.reko.h</types-file>\n')
    f.write('    <global-vars>RIPTIDE.reko.globals.c</global-vars>\n')
    f.write('    <user>\n')
    f.write('      <processor />\n')
    for addr, cn in procs:
        f.write('      <procedure name="%s">\n' % cn)
        f.write('        <address>%s</address>\n' % addr)
        f.write('        <assume reg="ds" value="%s" />\n' % DGROUP)
        f.write('      </procedure>\n')
    f.write('      <onLoad Enabled="false" />\n')
    f.write('      <registerValues />\n')
    f.write('      <outputFilePolicy>Segment</outputFilePolicy>\n')
    f.write('    </user>\n')
    f.write('  </input>\n')
    f.write('</project>\n')

print('wrote %s with %d procedures' % (OUT, len(procs)))
