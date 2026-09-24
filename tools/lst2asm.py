#!/usr/bin/env python3
# lst2asm.py — extract whole segments from RIPTIDE_.asm into standalone
# TASM/MASM modules with auto-generated public/extrn directives.
#
# usage: lst2asm.py <seg,seg,...> <out.asm> [title]

import re, sys, collections

SRC = 'RIPTIDE_.asm'

ID = r'[A-Za-z_.$?@][\w.$?@]*'                 # an identifier (may contain ?)
seg_re   = re.compile(r'^\s*(%s)\s+segment\b' % ID)
ends_re  = re.compile(r'^\s*(%s)\s+ends\b' % ID)
proc_re  = re.compile(r'^\s*(%s)\s+proc\s+(far|near)' % ID)
equ_re   = re.compile(r'^\s*(%s)\s*=\s' % ID)
label_re = re.compile(r'^\s*(%s)::?\s*(;.*)?$' % ID)
data_re  = re.compile(r'^\s*(%s)\s+(?i:(db|dw|dd|dq|dt|df|real4|real8|real10))\b' % ID)
inst_re  = re.compile(r'^\s*(%s)\s+(%s)\s*<' % (ID,ID)) # 'name STRUC <..>' instance
labelt_re= re.compile(r'^\s*(%s)\s+label\s+\w+' % ID)

REGS = set('''ax bx cx dx si di bp sp cs ds es ss fs gs al ah bl bh cl ch dl dh
eax ebx ecx edx esi edi ebp esp st st0 st1 st2 st3 st4 st5 st6 st7'''.split())
KW   = set('''ptr byte word dword qword tbyte fword sbyte sword sdword near far
offset seg short long type size length dup mask width high low large nothing
assume cs ds es ss fs gs'''.split())
# directives that never reference a symbol we must extrn
NOREF = set('''assume segment ends proc endp label equ record group public
extrn extern comm global org align even model title subttl name local macro
endm end struc db'''.split())
# structural keyword as 2nd token marks a definition/directive line
STRUCT = set('''segment ends proc endp label equ struc record group macro endm
db dw dd dq dt df org'''.split())
# instruction mnemonics (never a symbol); covers string ops used with rep*
MNEM = set('''outsb outsw outsd insb insw insd movsb movsw movsd stosb stosw stosd
lodsb lodsw lodsd scasb scasw scasd cmpsb cmpsw cmpsd xlatb int into iret retf
retn pushf popf pusha popa pushad popad cld std cli sti hlt nop wait lock rep
repe repne repz repnz sahf lahf pushf popa cbw cwd cwde cdq leave enter bound'''.split())

def san(s):              # '?' is illegal-ish in emitted idents -> 'q'
    return s.replace('?','q')

# Name reconciliations emitted as `name equ target` (plus matching `public`).
# Two kinds, both same-bytes-different-label cases:
#  * RIPTIDE.lst vs RIPTIDE_.asm come from different IDA sessions, so a few
#    data symbols the C++ names by .lst labels (s1, word_2BA84, word_2BA88)
#    live in the .asm under other names / mid-dd offsets.
#  * BCC emits F_* RTL helper names that the extracted RTL calls ftol@/scopy@.
EXTRA = {
    'seg2608': [('_s1','aDebug_'), ('s1','aDebug_'),
                ('word_2BA84','word ptr _the_map+2'),
                ('_word_2BA84','word ptr _the_map+2'),
                ('word_2BA88','word ptr _tbl_mul_tw+2'),
                ('_word_2BA88','word ptr _tbl_mul_tw+2')],
    'seg0000': [('F_FTOL@','ftol@'), ('F_SCOPY@','scopy@')],
}

segs   = collections.OrderedDict()
order  = []
symtab = {}            # name -> (segname, masm type)
strucs = collections.OrderedDict()   # struc name -> [raw lines]
all_lines = open(SRC, encoding='latin-1').read().splitlines()
# struc names must be known before parsing (to recognise 'name STRUC <..>' insts)
STRUC_L = {m.group(1).lower() for l in all_lines
           for m in [re.match(r'^(\w+)\s+struc\b', l)] if m}
cur = None
in_struc = None
for raw in all_lines:
    sm = re.match(r'^(\w+)\s+struc\b', raw)
    if sm and cur is None:
        in_struc = sm.group(1); strucs[in_struc]=[raw]; continue
    if in_struc:
        strucs[in_struc].append(raw)
        if re.match(r'^%s\s+ends\b' % re.escape(in_struc), raw): in_struc=None
        continue
    m = seg_re.match(raw)
    if m:
        cur = m.group(1)
        if cur not in segs: segs[cur] = []; order.append(cur)
        segs[cur].append(raw); continue
    m = ends_re.match(raw)
    if m and cur == m.group(1):
        segs[cur].append(raw); cur = None; continue
    if cur is None: continue
    segs[cur].append(raw)

    # symbol defs
    for rgx, kind in ((proc_re,'proc'),(equ_re,'equ'),(labelt_re,'label'),
                      (inst_re,'inst'),(data_re,'data'),(label_re,'label')):
        mm = rgx.match(raw)
        if not mm: continue
        if kind=='inst' and mm.group(2).lower() not in STRUC_L:
            continue                          # 'name foo <' isn't a struc inst
        name = san(mm.group(1))
        if name not in symtab:
            if kind=='proc': symtab[name]=(cur,mm.group(2))
            elif kind=='inst': symtab[name]=(cur,mm.group(2))  # struc type
            elif kind=='data': symtab[name]=(cur,mm.group(2).lower())
            elif kind=='label': symtab[name]=(cur,'near')
        break

def mtype(name):
    st = symtab[name][1]
    if st.lower() in STRUC_L: return st       # struc-typed extern (name:STRUC)
    return {'db':'byte','dw':'word','dd':'dword','dq':'qword','dt':'tbyte',
            'df':'fword','real4':'dword','real8':'qword','real10':'tbyte',
            'far':'far','near':'near'}.get(st,'near')

def strip_comment(s):
    out=[];q=None
    for c in s:
        if q:
            if c==q:q=None
            out.append(c);continue
        if c in '\'"':q=c;out.append(c);continue
        if c==';':break
        out.append(c)
    return ''.join(out).rstrip()

tok_re = re.compile(r'[A-Za-z_.$?@][\w.$?@]*')

DATAKW = set('db dw dd dq dt df real4 real8 real10'.split())

# IDA renders a relocated-but-NULL pointer as 'offset X - offset X' (==0) or
# 'offset X+k - (offset X+k)'. Collapse these to 0 so no bogus extrn is made
# and the emitted value is the real NULL.
RELOC_IDEM = re.compile(
    r'offset\s+([A-Za-z_.$?@][\w.$?@]*(?:\s*[+-]\s*\w+)?)'
    r'\s*-\s*\(?\s*offset\s+\1\s*\)?')
def collapse(s): return RELOC_IDEM.sub('0', s)

def refs_of(raw):
    """symbol identifiers referenced by an instruction/data line."""
    code = collapse(strip_comment(raw))
    if not code.strip(): return []
    s = code.lstrip()
    # skip label-only lines and directives
    if label_re.match(raw): return []
    head = s.split(None,1)[0].lower().rstrip(':')
    if equ_re.match(raw): return []          # 'name = ...' equate
    parts = s.split(None,1)
    if len(parts)<2: return []
    kw2 = parts[1].split(None,1)[0].lower()
    if head in DATAKW:
        op = parts[1]                        # unlabeled 'dw offset X'
    elif kw2 in DATAKW:
        rest = parts[1].split(None,1)        # labeled  'NAME dw offset X'
        op = rest[1] if len(rest)>1 else ''
    elif kw2 in STRUC_L:
        # struc instance 'NAME STRUC <a,b,...>' -> refs may hide inside <>
        i = parts[1].find('<')
        op = parts[1][i:] if i>=0 else ''
    elif head in NOREF:
        return []
    elif kw2 in STRUCT:
        return []
    else:
        if head in MNEM: return []
        op = parts[1]
    # strip quoted strings ('BS', "msg") and numeric literals before tokenizing
    op = re.sub(r"'[^']*'",' ',op)
    op = re.sub(r'"[^"]*"',' ',op)
    # float literals first (1.0e8, .5, 9.9e63) then ints, so '.'-fractions
    # and exponents aren't mistaken for symbol tokens.
    op = re.sub(r'\b\d+\.\d*(?:[eE][-+]?\d+)?',' ',op)
    op = re.sub(r'\.\d+(?:[eE][-+]?\d+)?',' ',op)
    op = re.sub(r'\b\d+[eE][-+]?\d+\b',' ',op)
    op = re.sub(r'\b[0-9][0-9A-Fa-f]*[hH]\b',' ',op)
    op = re.sub(r'\b0[xX][0-9A-Fa-f]+\b',' ',op)
    op = re.sub(r'\b\d+\b',' ',op)
    out=[]
    for t in tok_re.findall(op):
        if t.startswith('.'): continue            # struc member '.field'
        if '.' in t: t = t.split('.')[0]          # 'base.field' -> base symbol
        tl=t.lower()
        if tl in REGS or tl in KW: continue
        if t in ('$','?','??') or set(t)<= {'?'}: continue
        if t.startswith('seg') and t in segs: continue     # segment name
        out.append(san(t))
    return out

def main():
    want = sys.argv[1].split(','); out = sys.argv[2]
    title= sys.argv[3] if len(sys.argv)>3 else 'extracted'
    wantset=set(want)

    # symbols defined by the emitted set (name -> kind)
    defs={}
    for seg in want:
        for raw in segs[seg]:
            for rgx,kind in ((proc_re,'proc'),(labelt_re,'label'),
                             (inst_re,'inst'),(data_re,'data'),
                             (label_re,'label'),(equ_re,'equ')):
                mm=rgx.match(raw)
                if mm: defs.setdefault(san(mm.group(1)),kind); break

    # symbols referenced by OTHER (non-emitted) segments -> must be public
    ext_ref=set()
    for seg,lines in segs.items():
        if seg in wantset: continue
        for raw in lines:
            for r in refs_of(raw):
                if r in defs: ext_ref.add(r)

    ext=collections.OrderedDict()          # name -> (mtype, homeseg)
    for seg in want:
        for raw in segs[seg]:
            for r in refs_of(raw):
                if r in defs: continue
                ext.setdefault(r,(mtype(r),symtab[r][0]) if r in symtab
                               else ('far',None))

    # segment names referenced by emitted code (assume ds:segX / segY:...) but
    # not emitted -> need a stub segment decl so 'assume' resolves.
    segref=set()
    for seg in want:
        for raw in segs[seg]:
            for t in tok_re.findall(strip_comment(raw)):
                if t in segs and t not in wantset: segref.add(t)
    # any data-extern's home segment is also a needed stub
    for n,(t,home) in ext.items():
        if home and home not in wantset: segref.add(home)

    code_ext=[(n,t) for n,(t,h) in ext.items() if t in ('far','near')]
    data_ext=collections.OrderedDict()     # homeseg -> [ (name,type) ]
    for n,(t,h) in ext.items():
        if t in ('far','near'): continue
        data_ext.setdefault(h or 'seg2608',[]).append((n,t))

    qtok = re.compile(r'\b[A-Za-z_.$@][\w.$?@]*\?[\w.$?@]*')
    def xform(line):
        line = collapse(line)
        # uasm v2.57 rejects bare movsd; emit explicit dword string form
        # (encodes to F3 66 A5, byte-identical to 'rep movsd').
        line = re.sub(r'\bmovsd\b',
                      'movs dword ptr es:[di], dword ptr ds:[si]', line)
        # identifiers containing '?' (e.g. a??????) trip the assembler;
        # substitute '?'->'q' in symbol tokens (lone '?' in 'db ?' untouched).
        return qtok.sub(lambda m: m.group(0).replace('?','q'), line)

    # which strucs does the emitted code instantiate/reference? (incl. the type
    # of any struc-typed extern, e.g. 'extrn stru_2B114:FILE' -> needs FILE)
    ext_types = {t.lower() for n,(t,h) in ext.items()}
    used_strucs = [n for n in strucs
                   if n.lower() in ext_types or
                   any(re.search(r'\b%s\b' % re.escape(n), strip_comment(l))
                       for seg in want for l in segs[seg])]

    with open(out,'w') as o:
        o.write(f'; {out} — {title} (extracted from RIPTIDE_.asm)\n')
        o.write('\t\t.386p\n\n')
        for sn in used_strucs:              # needed struc definitions
            for l in strucs[sn]: o.write(xform(l)+'\n')
            o.write('\n')
        for n,t in code_ext: o.write(f'\t\textrn\t{n}:{t}\n')
        pub = [n for n,k in defs.items() if k!='equ' and
               (k=='proc' or n.startswith('_') or n in ext_ref)]
        for n in sorted(pub): o.write(f'\t\tpublic\t{n}\n')
        # C++ interop: BC prepends '_' to every global, so a data symbol the
        # listing calls `word_2BA84`/`first_time` is seen as `_word_2BA84`/
        # `_first_time`, and `_tmp` becomes `__tmp`.  Emit a leading-underscore
        # twin for every public in a DATA segment so either source convention
        # (`foo` or `_foo`) resolves to the same storage.
        alias = [n for n in pub if '_'+n not in defs
                 for seg in want if "'DATA'" in segs[seg][0]]
        for n in sorted(alias): o.write(f'\t\tpublic\t_{n}\n')
        extra = [p for s in want for p in EXTRA.get(s,[])]
        for n,_ in extra: o.write(f'\t\tpublic\t{n}\n')
        o.write('\n')
        # stub external segments (data) holding this module's data externs;
        # reuse the original 'segment' directive so align/class match exactly.
        for sname in sorted(segref | set(data_ext)):
            decl = segs[sname][0] if sname in segs else \
                   f'{sname}\t\tsegment\tpara public \'DATA\' use16'
            o.write(decl+'\n')
            for n,t in data_ext.get(sname,[]):
                o.write(f'\t\textrn\t{n}:{t}\n')
            o.write(f'{sname}\t\tends\n\n')
        datasegs=[]
        for seg in want:
            o.write('\n; ---- segment '+seg+' ----\n')
            for raw in segs[seg]: o.write(xform(raw)+'\n')
            if "'DATA'" in segs[seg][0]: datasegs.append(seg)
        if datasegs:                      # DATA segs belong to DGROUP
            o.write('\n\t\tDGROUP\tgroup\t' + ','.join(datasegs) + '\n')
        for n in sorted(alias):           # define the leading-underscore twins
            o.write(f'_{n}\t\tequ\t{n}\n')
        for n,t in extra:                 # .lst<->.asm and BCC RTL name aliases
            o.write(f'{n}\t\tequ\t{t}\n')
        # entry point: a module defining 'start' ends with 'end start'
        o.write('\t\tend start\n' if 'start' in defs else '\t\tend\n')
    print(f'{out}: {len(pub)} public, {len(ext)} extrn')

if __name__=='__main__':
    main()
