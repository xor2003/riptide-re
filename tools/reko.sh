#!/bin/bash
# reko.sh — look up Reko-decompiled C for an IDA function.
#
# Reko (0.12.4, run on debug-stripped RIPTIDE_STR.EXE) produced per-segment
# decompiled C in reko/.  Reko labels segments with its own value that is
# consistently IDA's segment + 0x800, and keeps the same intra-segment offsets:
#
#     IDA  segXXXX:YYYY   <->  reko  fn{XXXX+0x800}_{YYYY}
#
# e.g. IDA seg19df:0151 (save_new_score) == reko fn21DF_0151 (19df+800=21df)
#
# usage: tools/reko.sh <ida_seg> <ida_off>
#        tools/reko.sh 19df 0151      # -> dumps reko's C for save_new_score
seg=$(printf '%04X' $(( 0x$1 + 0x800 )))
off=$(printf '%04s' "$2" | tr 'a-f' 'A-F')
f="reko/RIPTIDE_STR_${seg}.c"
[ -f "$f" ] || { echo "no reko file for segment ${seg} ($f)"; exit 1; }
awk -v a="fn${seg}_${off}(" '
  !infn && $0 !~ /^[ \t]*\/\// && index($0, a) {infn=1}
  infn {print; if ($0 ~ /^}/) exit}
' "$f"
