#!/bin/bash
# Rebuild RIPTIDE from the MASM listing: uasm (native) + alink (native, OMF16 -> MZ exe)
# usage: ./build_asm.sh [RIPTIDE_.asm]   ->  <name>.exe next to source
set -e
src="${1:-RIPTIDE_.asm}"
dir="$(cd "$(dirname "$src")" && pwd)"
base="$(basename "$src" .asm)"
work=/tmp/asmwork_$$
mkdir -p "$work"
uasm -Zi4 -c -Fo="$work/$base.obj" "$dir/$src"
/home/xor/kvikdos/alink/alink -m -o "$work/$base.exe" "$work/$base.obj" 2>&1 | grep -viE "COMENT|LINNUM|COMDAT|Externs|ComDefs" || true
cp "$work/$base.exe" "$dir/$base.rebuilt.exe"
cp "$work/$base.map" "$dir/$base.map" 2>/dev/null || true
echo "==> $dir/$base.rebuilt.exe"
ls -la "$dir/$base.rebuilt.exe"
rm -rf "$work"
