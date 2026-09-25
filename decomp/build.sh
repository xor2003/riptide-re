#!/bin/bash
# Compile a .cpp under DOSBox with BC++3.1 -ml -3 -r- -vi- -S, producing .ASM for comparison
# (-r-: register vars off, -vi-: no inline expansion — matches original codegen)
# usage: ./build.sh file.cpp [more.cpp ...]
set -e
work=/tmp/bcwork_$$
mkdir -p "$work"
for src in "$@"; do cp "$src" "$work/"; done
cp "$(dirname "$1")/riptide.h" "$work/" 2>/dev/null || true
names=""
for src in "$@"; do names="$names $(basename "$src" .cpp).cpp"; done
# run via .BAT so DOS `>' captures BCC's diagnostics into cc.log
printf 'D:\\BIN\\BCC.EXE -ml -3 -f -O -r- -vi- -S -ID:\\INCLUDE -LD:\\LIB %s > cc.log\r\n' "$names" > "$work/go.bat"
SDL_VIDEODRIVER=dummy SDL_AUDIODRIVER=dummy timeout 600 dosbox \
  -c "mount c $work" \
  -c "mount d \"/home/xor/inertia_player/dos_compilers/Borland C++ v3.1\"" \
  -c "cycles max" \
  -c "c:" \
  -c "go.bat" \
  -c "exit" --noconsole >/dev/null 2>&1
cat "$work"/cc.log 2>/dev/null | grep -iE "error|warn" | head -40
for src in "$@"; do
  f=$(basename "$src" .cpp)
  asm=$(ls "$work" | grep -ix "$f\.asm" | head -1)
  [ -n "$asm" ] || echo "BUILD FAILED: $f.cpp (no $f.ASM produced)"
done
for src in "$@"; do
  f=$(basename "$src" .cpp)
  asm=$(ls "$work" | grep -ix "$f\.asm" | head -1)
  [ -n "$asm" ] && cp "$work/$asm" "$(dirname "$src")/$f.gen.asm"
done
rm -rf "$work"
