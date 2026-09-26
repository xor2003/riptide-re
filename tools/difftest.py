#!/usr/bin/env python3
# difftest.py — differential function tests: original RIPTIDE.EXE vs reconstruction.
#
# Runs one far function in each binary under kvikdos with identical inputs
# (stack args + poked memory), then diffs the result registers and the
# declared memory windows.
#
# Address model:
#   original : RIPTIDE.map segment table maps segNAME -> image byte offset;
#              lst addresses are segNAME:off -> runtime seg = 0x110+(start>>4),
#              off' = off + (start & 0xF).
#   recon    : RIPTIDE.MAP publics are already para:off ->
#              runtime seg = 0x110+para, off unchanged.
#   kvikdos  : loads each EXE at image_para 0x110 (PSP_PARA+0x10).

import os, re, struct, subprocess, sys, tempfile

KVIKDOS = "/home/xor/kvikdos/kvikdos"
ORIG_EXE = "/home/xor/games/Riptide/RIPTIDE.EXE"
ORIG_MAP = "/home/xor/games/Riptide/RIPTIDE.map"
RECON_EXE = "/home/xor/games/Riptide/decomp/link/RIPTIDE.EXE"
RECON_MAP = "/tmp/rpl_clean/RIPTIDE.MAP"
IMAGE_PARA = 0x110

TEST_SS = "0x8000"      # test stack segment (linear 0x80000)
TEST_SP = 0xFF00
SCRATCH = 0x7000        # scratch segment for this-objects / pointed data


def parse_map(path):
    """Return (segs{name:start_byte}, syms{name:(para,off)}, segaddrs{para:name})."""
    segs, syms = {}, {}
    with open(path, errors="replace") as f:
        section = None
        for line in f:
            m = re.match(r"\s*([0-9A-F]+)H\s+([0-9A-F]+)H\s+([0-9A-F]+)H\s+(\S+)\s+(\S+)", line)
            if m:
                segs[m.group(4).lower()] = int(m.group(1), 16)
                section = "pubs" if False else section
                continue
            m = re.match(r"\s*([0-9A-F]+):([0-9A-F]+)\s+(.+?)\s*$", line)
            if m:
                name = m.group(3).strip()
                syms.setdefault(name, (int(m.group(1), 16), int(m.group(2), 16)))
    return segs, syms


ORIG_SEGS, ORIG_SYMS = parse_map(ORIG_MAP)
RECON_SEGS, RECON_SYMS = parse_map(RECON_MAP)


def orig_addr(segname, off):
    """lst addresses segNNNN:off are relative to the segment's paragraph base
    (MAP Start is in bytes; base = Start & ~0xF)."""
    start = ORIG_SEGS[segname.lower()]
    return IMAGE_PARA + (start >> 4), off


def recon_addr(symname):
    para, off = RECON_SYMS[symname]
    return IMAGE_PARA + para, off


def dgroup_para(segs, segname="seg2608"):
    """DGROUP runtime segment = image_para + (dgroup byte start >> 4)."""
    return IMAGE_PARA + (segs[segname] >> 4)


ORIG_DG = dgroup_para(ORIG_SEGS)
RECON_DG = dgroup_para(RECON_SEGS)


SENTINEL = {"ax": 0x1111, "cx": 0x2222, "dx": 0x3333, "bx": 0x4444,
            "si": 0x5555, "di": 0x6666, "bp": 0x7777}

# ax = near return value; memory windows & flags = observable effects -> DIFF.
# dx:ax long/far-ptr returns make dx ambiguous -> WARN tier unless test opts in.
CMP_RESULT = ("ax", "flags")
CMP_SCRATCH = ("bx", "cx", "dx", "si", "di", "bp", "sp")


def run_kvikdos(exe, fn_seg, fn_off, ds, args, pokes, dump_path, extra_poke_files=()):
    cmd = [KVIKDOS, "--diag=off",
           f"--call-far=0x{fn_seg:x}:0x{fn_off:x}",
           f"--call-ds=0x{ds:x}",
           f"--call-ss=0x{int(TEST_SS,16):x}:0x{TEST_SP:x}",
           f"--hlt-dump={dump_path}"]
    for reg, val in SENTINEL.items():
        cmd.append(f"--call-set={reg}:0x{val:x}")
    for a in args:
        cmd.append(f"--call-arg=0x{a & 0xffff:x}")
    for (seg, off, val) in pokes:
        cmd.append(f"--poke-word=0x{seg:x}:0x{off:x}:0x{val & 0xffff:x}")
    for pf in extra_poke_files:
        cmd.append(pf)
    cmd.append(exe)
    p = subprocess.run(cmd, capture_output=True, text=True, timeout=120)
    res = {}
    m = re.search(r"kvikdos-call-result (.*)", p.stdout)
    if m:
        for kv in m.group(1).split():
            k, v = kv.split("=")
            res[k] = int(v, 16)
    return res, p.stdout + p.stderr, p.returncode


def fmt_regs(res):
    keys = ["ax", "bx", "cx", "dx", "si", "di", "bp", "sp", "ds", "es", "ss", "flags"]
    return " ".join(f"{k}={res.get(k, 0):04x}" for k in keys)


class Test:
    def __init__(self, name, orig_loc, recon_loc, args=(), pokes=(), windows=(),
                 pokes_recon_off=None):
        """orig_loc: (segname, off) or int off into seg0000-name.
        recon_loc: public symbol name from recon MAP.
        pokes: list of (seg_or_'dg', off, val); 'dg' resolved per-build.
        windows: list of (seg_or_'dg', off, size) memory regions to diff;
                 (seg,off) absolute or ('dg',off) DGROUP-relative.
        """
        self.name = name
        self.orig_loc = orig_loc
        self.recon_loc = recon_loc
        self.args = list(args)
        self.pokes = list(pokes)
        self.windows = list(windows)


def resolve(seg_or_dg, dg):
    return dg if seg_or_dg == "dg" else seg_or_dg


def run_test(t, verbose=False):
    results = {}
    dgs = {"orig": ORIG_DG, "recon": RECON_DG}
    locs = {"orig": orig_addr(*t.orig_loc),
            "recon": recon_addr(t.recon_loc)}
    for tag, exe in (("orig", ORIG_EXE), ("recon", RECON_EXE)):
        dg = dgs[tag]
        pokes = [(resolve(s, dg), o, v) for (s, o, v) in t.pokes]
        dump = f"/tmp/dt_{t.name}_{tag}.bin"
        res, out, rc = run_kvikdos(exe, *locs[tag], dg, t.args, pokes, dump)
        mem = open(dump, "rb").read() if os.path.exists(dump) else b""
        results[tag] = (res, mem, out, rc)
    # diff regs
    ok = True
    diffs = []
    ro, rr = results["orig"][0], results["recon"][0]
    if not ro:
        diffs.append("orig produced no kvikdos-call-result (crash/timeout?)")
        ok = False
    if not rr:
        diffs.append("recon produced no kvikdos-call-result (crash/timeout?)")
        ok = False
    warns = []
    if ro and rr:
        for k in CMP_RESULT:
            if k in ro and k in rr and ro[k] != rr[k]:
                diffs.append(f"reg {k}: orig={ro[k]:04x} recon={rr[k]:04x}")
                ok = False
        for k in CMP_SCRATCH:
            if k in ro and k in rr and ro[k] != rr[k]:
                warns.append(f"reg {k}: orig={ro[k]:04x} recon={rr[k]:04x}")
    # diff windows
    for (s, o, n) in t.windows:
        ws = resolve(s, dgs["orig"])
        wr = resolve(s, dgs["recon"])
        mo = results["orig"][1]
        mr = results["recon"][1]
        lo = ws * 16 + o
        lr = wr * 16 + o
        wo = mo[lo:lo + n]
        wrb = mr[lr:lr + n]
        if wo != wrb:
            ok = False
            diffs.append(f"mem window dg+{o:x} len={n} differs")
            for i in range(0, min(len(wo), len(wrb)), 2):
                a = wo[i:i + 2]
                b = wrb[i:i + 2]
                if a != b:
                    diffs.append(f"  +{i:03x}: orig={a.hex()} recon={b.hex()}")
                    if sum(1 for d in diffs if d.startswith("  +")) > 8:
                        diffs.append("  ...")
                        break
    status = "PASS" if ok and not warns else ("DIFF" if not ok else "WARN")
    print(f"{status} {t.name}")
    for d in diffs[:16]:
        print(f"     {d}")
    for w in warns[:8]:
        print(f"     ~{w}")
    if verbose:
        for tag in ("orig", "recon"):
            print(f"     {tag}: {fmt_regs(results[tag][0])} rc={results[tag][3]}")
            tail = results[tag][2].strip().splitlines()
            for ln in tail[-3:]:
                print(f"       | {ln}")
    return ok


# ---------------------------------------------------------------------------
# Test specs
# ---------------------------------------------------------------------------

SCR = SCRATCH  # shorthand
TESTS = [
    # --- harness sanity: pure leaf, identical codegen expected --------------
    Test("abs_neg",  ("seg03f9", 0x72A4), "abs(int)", args=[-5]),
    Test("abs_pos",  ("seg03f9", 0x72A4), "abs(int)", args=[37]),
    Test("abs_zero", ("seg03f9", 0x72A4), "abs(int)", args=[0]),
    Test("abs_min",  ("seg03f9", 0x72A4), "abs(int)", args=[-32768]),
    # --- random: exercises nested far call (_rand) + seeded DGROUP state ----
    Test("random_100", ("seg03f9", 0x7280), "random(int)", args=[100]),
    Test("random_1",   ("seg03f9", 0x7280), "random(int)", args=[1]),
    # --- clear_flags: far 'this' write, verifies memory window --------------
    Test("clear_flags", ("seg110e", 0x0480), "game_manager::clear_flags()",
         args=[0x0000, SCR],
         pokes=[(SCR, 8 + 2 * i, 0xAAAA) for i in range(10)],
         windows=[(SCR, 0, 40)]),
    # --- touching: two m_actor far*, all-zero flag words -> geometry path ---
    Test("touching_same", ("seg1224", 0x0CBD),
         "touching(m_actor far*,m_actor far*)",
         args=[0x0000, SCR, 0x0100, SCR],
         pokes=[(SCR, 0x52, 0), (SCR, 0x152, 0)]),
    # bit0 of +0x52 set on arg A -> early-return-0 path
    Test("touching_flag0", ("seg1224", 0x0CBD),
         "touching(m_actor far*,m_actor far*)",
         args=[0x0000, SCR, 0x0100, SCR],
         pokes=[(SCR, 0x52, 1), (SCR, 0x152, 0)]),
]


def main():
    verbose = "-v" in sys.argv
    only = [a for a in sys.argv[1:] if a != "-v"]
    npass = nfail = 0
    for t in TESTS:
        if only and not any(o in t.name for o in only):
            continue
        try:
            ok = run_test(t, verbose)
        except KeyError as e:
            print(f"SKIP {t.name}: unresolved {e}")
            continue
        npass += bool(ok)
        nfail += not ok
    print(f"\n{npass} pass/warn, {nfail} diff")


if __name__ == "__main__":
    main()
