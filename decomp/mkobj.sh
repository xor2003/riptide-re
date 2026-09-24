#!/bin/bash
# mkobj.sh — compile decomp/*.cpp -> .obj via BCC -c (large model, 386, opt)
# usage: ./mkobj.sh file.cpp [more.cpp ...]   (produces .obj in ./obj/)
set -e
mkdir -p obj
work=/tmp/bcobj_$$
mkdir -p "$work"
for src in "$@"; do cp "$src" "$work/"; done
cp "$(dirname "$1")/riptide.h" "$work/" 2>/dev/null || true
names=""
for src in "$@"; do names="$names $(basename "$src" .cpp).cpp"; done
printf 'D:\\BIN\\BCC.EXE -c -ml -3 -f -O -r- -vi- -ID:\\INCLUDE -LD:\\LIB %s > cc.log\r\n' "$names" > "$work/go.bat"
SDL_VIDEODRIVER=dummy SDL_AUDIODRIVER=dummy timeout 900 dosbox \
  -c "mount c $work" \
  -c "mount d \"/home/xor/inertia_player/dos_compilers/Borland C++ v3.1\"" \
  -c "c:" \
  -c "go.bat" \
  -c "exit" --noconsole >/dev/null 2>&1
grep -iE "error|warn" "$work"/cc.log 2>/dev/null | head -40 || true
for src in "$@"; do
  f=$(basename "$src" .cpp)
  obj=$(ls "$work" | grep -ix "$f\.obj" | head -1)
  if [ -n "$obj" ]; then cp "$work/$obj" "obj/$f.obj"; echo "OK  $f.obj"
  else echo "FAIL $f.cpp (no .obj)"; fi
done
rm -rf "$work"
