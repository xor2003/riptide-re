#!/bin/bash
# link.sh — link the reconstructed RIPTIDE.EXE.
#   asm/data objs (uasm OMF) + C++ objs (BCC -c) -> TLINK -> RIPTIDE.EXE
# No Borland libs are required for the core image: seg0000 provides CRT0+RTL,
# seg2333/seg25ab the FP-emulator, seg2608 the whole DGROUP.  fpconst.asm supplies
# the FIxRQQ/FJxRQQ FP-emulation fixup descriptors (normally EMU.LIB's FPINIT) so
# TLINK converts the compiled "9B <x87>" ops to the original "CD <int>" traps.
#   /3  = accept 32-bit OMF records (uasm emits one FIXUPP32 in seg0000)
#   /c  = case-sensitive symbols
#   /m  = public map
set -e
cd "$(dirname "$0")"
mkdir -p obj link
# 1) assemble all asm/data modules (native uasm -> OMF .obj)
for s in seg0000 seg2333 seg25ab seg1a3f seg1a88 seg1c64 seg1c75 seg2286 seg2608 seg2b53 fpconst; do
  uasm -c -Zm -Fo obj/$s.obj $s.asm >/dev/null 2>&1 || echo "ASM FAIL $s"
done
# 2) object list. seg2608 first (DGROUP base); seg0000 holds 'start' (entry);
# seg2b53 last (STACK class -> valid SS:SP in the MZ header).
OBJS="seg2608 seg0000 seg2333 seg25ab seg1a3f seg1a88 seg1c64 seg1c75 seg2286 \
ACTOR CREATURE GAME GAMEMGR GUI KBD MENU SCORES TILEMAP UTIL VGADISP fpconst seg2b53"
# 3) build TLINK workdir
W=/tmp/rplink_$$
rm -rf "$W"; mkdir -p "$W"
for o in $OBJS; do
  f=$(ls -t obj/$o.obj obj/$o.OBJ 2>/dev/null | head -1)
  [ -n "$f" ] && cp "$f" "$W/" || echo "MISSING OBJ: $o"
done
# TLINK response file (avoids the ~127-char DOS command-line limit).  No
# Borland libs: the extracted seg0000/seg2333/seg25ab are the original RTL +
# FP emulator, so CL/EMU/MATHL would only duplicate/conflict (fixup overflows).
# TLINK response: single line  objs,exe,map,libs  (multi-line misparses; the DOS
# ~127-char limit applies to .BAT lines, not response-file contents).
printf '%s,RIPTIDE.EXE,RIPTIDE.MAP,\n' \
  "$(echo $OBJS | tr 'a-z' 'A-Z' | tr ' ' '+')" > "$W/resp.txt"
printf 'D:\\BIN\\TLINK.EXE /3 /c /m @resp.txt > link.log\r\n' > "$W/go.bat"
SDL_VIDEODRIVER=dummy SDL_AUDIODRIVER=dummy timeout 600 dosbox \
  -c "mount c $W" \
  -c "mount d \"/home/xor/inertia_player/dos_compilers/Borland C++ v3.1\"" \
  -c "cycles max" \
  -c "c:" -c "go.bat" -c "exit" --noconsole >/dev/null 2>&1
cp "$W"/RIPTIDE.EXE "$W"/RIPTIDE.MAP "$W"/link.log link/ 2>/dev/null || true
echo "=== link.log ==="; cat "$W"/link.log 2>/dev/null | head -80
ls -la link/ 2>/dev/null
