#!/bin/bash
# mkobj.sh — compile decomp/*.cpp -> .obj via BCC -c (large model, 386, opt)
# usage: ./mkobj.sh file.cpp [more.cpp ...]   (produces .obj in ./obj/)
set -e
mkdir -p obj
work=/tmp/bcobj_$$
mkdir -p "$work"
for src in "$@"; do cp "$src" "$work/"; done
cp "$(dirname "$1")/riptide.h" "$work/" 2>/dev/null || true
# one BCC line per source: a single line for many files exceeds the DOS
# ~127-char command limit and silently truncates (e.g. 'scores.cpp'->'scores.c')
: > "$work/go.bat"
for src in "$@"; do
  printf 'D:\\BIN\\BCC.EXE -c -ml -3 -f -Od -r- -vi- -ID:\\INCLUDE -LD:\\LIB %s >> cc.log\r\n' \
    "$(basename "$src" .cpp).cpp" >> "$work/go.bat"
done
printf 'exit\r\n' >> "$work/go.bat"
# dosbox-staging quits cleanly via --exit after the -c commands complete.
timeout 900 xvfb-run -a /opt/dosbox-staging/dosbox \
  --exit --noconsole \
  -c "mount c $work" \
  -c "mount d \"/home/xor/inertia_player/dos_compilers/Borland C++ v3.1\"" \
  -c "cpu_cycles max" \
  -c "c:" \
  -c "go.bat" >/dev/null 2>&1 || true
grep -iE "error|warn" "$work"/cc.log 2>/dev/null | head -40 || true
for src in "$@"; do
  f=$(basename "$src" .cpp)
  obj=$(ls "$work" | grep -ix "$f\.obj" | head -1)
  if [ -n "$obj" ]; then
    # Write BOTH basenames and BOTH extensions: link.sh looks for
    # obj/NAME.obj|NAME.OBJ (uppercase), and on a case-sensitive fs a
    # lowercase-only copy would never match — stale objects shadowed fresh
    # builds.  Keep every case variant in sync.
    F=$(echo "$f" | tr 'a-z' 'A-Z')
    cp "$work/$obj" "obj/$f.obj"
    cp "$work/$obj" "obj/$f.OBJ"
    cp "$work/$obj" "obj/$F.obj"
    cp "$work/$obj" "obj/$F.OBJ"
    echo "OK  $f.obj"
  else echo "FAIL $f.cpp (no .obj)"; fi
done
rm -rf "$work"
