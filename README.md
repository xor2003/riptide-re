# riptide-re

Reverse engineering and source reconstruction of
**"In Search of Dr. Riptide"** (1994, DOS) — MindStorm Software / Pack Media
Company, a side-scrolling submarine shooter.

The goal: C++ sources that compile with the original toolchain (Borland C++ 3.1,
large memory model, `-ml -3`) and re-link — together with segments lifted from
the original binary (CRT0/RTL, FP emulator, DGROUP data, stack) — back into a
working `RIPTIDE.EXE`. Each reconstructed function is annotated with its
original `seg:offset` and verified against the original binary (differential
tests under kvikdos, Z3 SSA equivalence proofs).

## Repository layout

- `decomp/` — the reconstruction
  - `*.cpp`, `riptide.h` — reconstructed C++ sources (Borland C++ 3.1 dialect)
  - `seg*.asm`, `fpconst.asm` — segments extracted from the original binary,
    assembled with uasm (RTL/FP-emulator code and the whole DGROUP image)
  - `*.gen.asm` — compiler `-S` output of the `.cpp` files, kept for codegen
    comparison against the original
  - build scripts (see below)
- `tools/` — verification harness: `difftest.py` (kvikdos differential function
  tests), `verify.py` + `golden.txt` (codegen regression baseline),
  `mkproven.py`, asm/lst diff utilities
- `drrip.zip` — the shareware release of the game (redistributable; supplies the
  game data needed to actually run the rebuilt exe)

Original game binaries (`RIPTIDE.EXE`, `RIPTIDE.DAT`, `CATALOG.*`, …) and local
analysis databases (IDA/reko/Ghidra) are **not** distributed.

## Requirements

Native build (no DOSBox):

- Linux + `wine`
- Borland C++ 5.02 (`BCC.EXE`) for compiling, with Borland C++ **3.1** headers
  on the include path (the sources are written against the 3.1 headers)
- `uasm` on PATH (JWasm/UASM fork — MASM-compatible OMF output)
- a 16-bit-capable TLINK (this workspace uses a natively rebuilt `tlink16`,
  symlinked at `./tlink`)

DOSBox build variant:

- dosbox-staging + `xvfb-run`
- a Borland C++ 3.1 installation mounted as `D:` (`D:\BIN\BCC.EXE`,
  `D:\BIN\TLINK.EXE`, `D:\INCLUDE`, `D:\LIB`)

Note: toolchain paths are currently hard-coded at the top of each script —
adjust them to your install.

## Build

```sh
cd decomp
./build_native.sh        # full build: compile + assemble + link
./build_native.sh link   # re-link only, reuse existing obj/
```

Produces `decomp/link/RIPTIDE.EXE` (+ `RIPTIDE.MAP`).

Equivalent DOSBox path (slower, uses the real BC++ 3.1 toolchain end-to-end):

```sh
cd decomp
./mkobj.sh *.cpp         # BCC 3.1 -c -> obj/
./link.sh                # TLINK -> link/RIPTIDE.EXE
```

Auxiliary scripts:

- `build.sh file.cpp …` — emit `file.gen.asm` via BCC `-S` (codegen diffing)
- `build_asm.sh` — reassemble the flat disassembly `RIPTIDE_.asm` with
  uasm + alink into `RIPTIDE_.rebuilt.exe` (comparison artifact only)

## Running

The rebuilt exe still needs the original game data at runtime (`RIPTIDE.DAT`,
`CATALOG.*`, …). Unpack `drrip.zip` (shareware) or use your own copy of the
game, then run under DOSBox:

```sh
unzip drrip.zip -d riptide && cp decomp/link/RIPTIDE.EXE riptide/
dosbox riptide/RIPTIDE.EXE
```

## Verification

- `tools/verify.py` — recompiles every `decomp/*.cpp` and diffs each generated
  proc against the matching proc in the original listing (baseline:
  `tools/golden.txt`)
- `tools/difftest.py` — executes one far function in the original vs the
  reconstructed binary under kvikdos with identical inputs; diffs result
  registers and declared memory windows
- `tools/z3cmp/` (gitignored, generated) — Z3-based SSA equivalence corpus

## Legal

Game code and data copyrights remain with their holders. Only the shareware
release (`drrip.zip`) is redistributed here; the reconstructed sources are
published for preservation and interoperability.
