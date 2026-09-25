#!/usr/bin/env python3
# Constant-only / missing-insn diff: reuse adiff's normalizer, report only
# high-signal divergences (wrong immediate, deleted orig insn, added gen insn).
# usage: constdiff.py <gen.asm> <orig_fn_pattern> <gen_label_regex> [...]
import re, sys, difflib
sys.path.insert(0, '/home/xor/games/Riptide/tools')
import adiff

LST = '/home/xor/games/Riptide/RIPTIDE.lst'

IMM = re.compile(r'\b(\d+)\b')

def sig(l):
    """(mnemonic, operand-template with immediates blanked) for pairing."""
    p = l.split(None, 1)
    mn = p[0]
    ops = p[1] if len(p) > 1 else ''
    return mn, IMM.sub('#', ops)

def imms(l):
    return IMM.findall(l)

def analyze(orig, gen):
    """yield (kind, orig_line, gen_line) high-signal diffs."""
    sm = difflib.SequenceMatcher(None, orig, gen, autojunk=False)
    for tag, i1, i2, j1, j2 in sm.get_opcodes():
        if tag == 'equal':
            continue
        o, g = orig[i1:i2], gen[j1:j2]
        if tag == 'replace':
            # pair up lines by signature (same mnemonic + operand shape)
            used = [False] * len(g)
            for ol in o:
                os_ = sig(ol)
                paired = False
                for k, gl in enumerate(g):
                    if used[k] or sig(gl) != os_:
                        continue
                    used[k] = True; paired = True
                    if imms(ol) != imms(gl):
                        yield ('CONST', ol, gl)
                    break
                if not paired:
                    yield ('DEL', ol, '')
            for k, gl in enumerate(g):
                if not used[k]:
                    yield ('ADD', '', gl)
        elif tag == 'delete':
            for ol in o:
                yield ('DEL', ol, '')
        elif tag == 'insert':
            for gl in g:
                yield ('ADD', '', gl)

def main():
    asm = sys.argv[1]
    pairs = [(sys.argv[i], sys.argv[i+1]) for i in range(2, len(sys.argv)-1, 2)]
    sym = adiff.build_symtab(LST)
    adiff.build_name_at(sym); adiff.build_offmap(sym)
    for fnpat, lblre in pairs:
        orig = adiff.get_orig(LST, fnpat)
        gen = adiff.get_gen(asm, lblre, sym)
        hits = list(analyze(orig, gen))
        if not hits:
            continue
        print(f'==== {fnpat}  (orig={len(orig)} gen={len(gen)}) ====')
        for kind, ol, gl in hits:
            if kind == 'CONST':
                print(f'   CONST  -{ol}\n          +{gl}')
            elif kind == 'DEL':
                print(f'   MISS   -{ol}')
            else:
                print(f'   XTRA   +{gl}')

if __name__ == '__main__':
    main()
