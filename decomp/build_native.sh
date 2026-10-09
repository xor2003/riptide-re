#!/bin/bash
# build_native.sh — build RIPTIDE.EXE without DOSBox.
#   compile: real Borland C++ 5.02 BCC.EXE (PE32) under wine — native process,
#            handles BC3.1 headers + extern "C" + __STDC__ correctly.  The
#            *rebuilt* BCC (games/Riptide/bcc) is a comparison artifact: its
#            genBuiltin asserts on ~475 sites incl. `#if __STDC__`, extern "C"
#            linkage specs, and real stdio.h — unusable for this source tree.
#   asm:     native uasm (unchanged from link.sh)
#   link:    rebuilt native tlink16 (games/Riptide/tlink), /3 /c /m @resp.txt
#
# usage: ./build_native.sh            (full build: compile + asm + link)
#        ./build_native.sh link       (skip compile, reuse obj/)
set -e
cd "$(dirname "$0")"

BC5BIN="/home/xor/inertia_player/dos_compilers/Borland C++ v5.02/BC5/BIN"
BCC="$BC5BIN/BCC.EXE"
TLINK=/home/xor/games/Riptide/tlink
# wine maps / -> Z:; use BC3.1 headers — the sources were written against them.
BCINC='Z:\home\xor\inertia_player\dos_compilers\Borland C++ v3.1\INCLUDE'
export WINEDEBUG=-all

CPPS="actor creature game gamemgr gui kbd menu scores tilemap util vgadisp"
ASMS="seg0000 seg2333 seg25ab seg1a3f seg1a88 seg1c64 seg1c75 seg2286 seg2608 seg2b53 fpconst"
# Link order is load-bearing (seg2608=DGROUP base, seg0000='start' entry,
# seg2b53=STACK for MZ SS:SP).  Keep identical to link.sh.
OBJS="seg2608 seg0000 seg2333 seg25ab seg1a3f seg1a88 seg1c64 seg1c75 seg2286 \
ACTOR CREATURE GAME GAMEMGR GUI KBD MENU SCORES TILEMAP UTIL VGADISP NATSHIM fpconst seg2b53"

mkdir -p obj link
W=/tmp/rpnat_$$
rm -rf "$W"; mkdir -p "$W/cc" "$W/lk"
trap 'rm -rf "$W"' EXIT

if [ "${1:-all}" != "link" ]; then
  # 1) compile all .cpp -> .obj in one BCC call.  Flags = mkobj.sh plus -x-
  #    (no C++ exceptions — BC3.1 had none; without it BC5 emits
  #    ___InitExceptBlock refs that the seg0000 RTL can't satisfy).
  #    natshim.cpp supplies the two decls BC5 needs that BC3.1 never emitted:
  #    operator new[] (POD-only arrays -> plain operator new is correct) and
  #    the game_cast dtor (declared in riptide.h, never defined).
  for s in $CPPS; do cp "$s.cpp" "$W/cc/"; done
  cp riptide.h "$W/cc/"
  cat > "$W/cc/natshim.cpp" <<'EOF'
#include "riptide.h"
void far * _Cdecl operator new[](unsigned int n) { return (void far *)operator new(n); }
game_cast::~game_cast() { }
EOF
  names=$(for s in $CPPS natshim; do printf '%s.cpp ' "$s"; done)
  ( cd "$W/cc" && timeout 900 wine "$BCC" \
      -c -ml -3 -f -O -r- -vi- -x- -I"$BCINC" $names > cc.log 2>&1 ) || true
  grep -iE "error|warn" "$W/cc"/cc.log | head -40 || true
  # 2) copy objects into obj/ with every case variant (see mkobj.sh)
  for s in $CPPS natshim; do
    o=$(ls "$W/cc" | grep -ix "$s\.obj" | head -1)
    S=$(echo "$s" | tr 'a-z' 'A-Z')
    if [ -n "$o" ] && [ -s "$W/cc/$o" ]; then
      cp "$W/cc/$o" "obj/$s.obj"; cp "$W/cc/$o" "obj/$s.OBJ"
      cp "$W/cc/$o" "obj/$S.obj"; cp "$W/cc/$o" "obj/$S.OBJ"
      echo "OK  $s.obj"
    else echo "FAIL $s.cpp (no .obj)"; fi
  done
fi

# 3) assemble asm/data modules (native uasm -> OMF .obj)
for s in $ASMS; do
  uasm -c -Zm -Fo "obj/$s.obj" "$s.asm" >/dev/null 2>&1 || echo "ASM FAIL $s"
done

# 4) link with rebuilt native tlink16 (comma response file, same as link.sh)
for o in $OBJS; do
  f=$(ls -t "obj/$o.obj" "obj/$o.OBJ" 2>/dev/null | head -1)
  if [ -n "$f" ]; then
    cp "$f" "$W/lk/$o.OBJ"          # resp uses uppercase basenames
  else
    echo "MISSING OBJ: $o"
  fi
done
printf '%s,RIPTIDE.EXE,RIPTIDE.MAP,\n' "$(echo $OBJS | tr ' ' '+')" > "$W/lk/resp.txt"
( cd "$W/lk" && timeout 300 "$TLINK" /3 /c /m @resp.txt > link.log 2>&1 ) || true

# rebuilt tlink lowercases output names — collect case-insensitively
exe=$(ls "$W/lk" | grep -ix 'riptide\.exe' | head -1)
map=$(ls "$W/lk" | grep -ix 'riptide\.map' | head -1)
[ -n "$exe" ] && cp "$W/lk/$exe" link/RIPTIDE.EXE
[ -n "$map" ] && cp "$W/lk/$map" link/RIPTIDE.MAP
cp "$W/lk/link.log" link/link.log 2>/dev/null || true
echo "=== link.log ==="; cat link/link.log 2>/dev/null | head -60
ls -la link/
