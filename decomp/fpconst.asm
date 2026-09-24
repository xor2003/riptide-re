; fpconst.asm — Borland FP-emulation fixup descriptor constants.
;
; Compiled with -f (emulation), BCC emits each x87 op as  "9B <opcode> <operand>"
; (fwait + real instruction) plus an  Offset16  fixup whose target is one of the
; FIxRQQ / FJxRQQ "descriptor" externals.  TLINK recognises these names and, instead
; of writing an address, rewrites the instruction in place to the self-patching
; trap form  "CD <int> <operand>"  (int 34h..3Dh) serviced by the e087 emulator.
;
; The original RIPTIDE.EXE uses exactly this encoding, e.g.
;     fild  word ptr [bp-28]   ->  CD 3B 46 D8   (int 3Bh)
;     fdivp st(1),st           ->  CD 3A F9      (int 3Ah)
;     fmul  dword ptr [18B0]   ->  CD 34 0E B0 18
;
; These symbols are the absolute "opcode descriptor" constants normally supplied by
; EMU.LIB's FPINIT module.  Defining them lets TLINK resolve the externs and perform
; the emulation fixups without dragging in a second copy of the emulator runtime
; (which the extracted seg25ab/seg2333 already provide).
	.286
	public	FIARQQ
	public	FICRQQ
	public	FIDRQQ
	public	FIERQQ
	public	FISRQQ
	public	FIWRQQ
	public	FJARQQ
	public	FJCRQQ
	public	FJSRQQ

FIARQQ	=	0FE32h		; add
FICRQQ	=	0E32h		; compare
FIDRQQ	=	5C32h		; divide
FIERQQ	=	1632h		; (emu descriptor)
FISRQQ	=	0632h		; subtract
FIWRQQ	=	0A23Dh		; (emu descriptor)
FJARQQ	=	4000h		; conditional-jump descriptor
FJCRQQ	=	0C000h		; conditional-jump descriptor
FJSRQQ	=	8000h		; conditional-jump descriptor
	end
