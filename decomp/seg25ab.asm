; decomp/seg25ab.asm — seg25ab (extracted from RIPTIDE_.asm)
		.386p

		public	e087_entry
		public	e087_shortcut
		public	e087_trap
		public	sub_27F80
		public	sub_281DB
		public	sub_28228

seg0000		segment	byte public 'CODE' use16
seg0000		ends

seg2608		segment	para public 'DATA' use16
		extrn	word_28262:word
		extrn	dataseg@:word
		extrn	word_28266:word
		extrn	aDivideErrorAbn:byte
		extrn	word_2826C:word
		extrn	aCopyright1991B:byte
		extrn	word_28268:word
seg2608		ends


; ---- segment seg25ab ----
seg25ab		segment	byte public 'CODE' use16
		assume cs:seg25ab
		assume es:nothing, ss:nothing, ds:seg2608, fs:nothing, gs:nothing
tbyte_27C90	REAL10 0.78539816339744830963 ; DATA XREF: seg25ab:0084r
 					; seg25ab:0157r
tbyte_27C9A	REAL10 1.5707963267948966193 ; DATA	XREF: seg25ab:014Cr
 					; seg25ab:017Dr
flt_27CA4	REAL8 -5.1110893e38	; DATA XREF: seg25ab:0067r
 					; seg25ab:0075r
flt_27CA8	REAL8 -5.1117124e38	; DATA XREF: seg25ab:01D7r
 		db 0, 4Ah, 0C0h, 0FFh
 flt_27CB0	dd 0.5			; DATA XREF: seg25ab:026Cr
tbyte_27CB4	REAL10 1.4142135623730950489 ; DATA	XREF: seg25ab:02CCr
flt_27CBE	REAL8 3.4028237e38		; DATA XREF: seg25ab:011Dr
					; seg25ab:0255r
; ---------------------------------------------------------------------------
		mov	cl, 0
		jmp	loc_27CCC
; ---------------------------------------------------------------------------
		mov	cl, 2
		jmp	loc_27CCC
; ---------------------------------------------------------------------------
		mov	cl, 4

loc_27CCC::				; CODE XREF: seg25ab:0034j
					; seg25ab:0038j
		wait
		fxam
		push	bp
		mov	bp, sp
		lea	sp, [bp-2]
		fstsw	word ptr [bp-2]
		wait
		mov	ah, [bp-1]
		sahf
		jb	loc_27CEF
		jnz	loc_27D10
		cmp	cl, 2
		jnz	loc_27CED
		wait
		fstp	st
		wait
		fld1

loc_27CED::				; CODE XREF: seg25ab:0055j
		jmp	loc_27D0D
; ---------------------------------------------------------------------------

loc_27CEF::				; CODE XREF: seg25ab:004Ej
		jz	loc_27CFF
		jnp	loc_27CFF
		wait
		fstp	st
		wait
		fld	cs:flt_27CA4
		wait
		ftst

loc_27CFF::				; CODE XREF: seg25ab:loc_27CEFj
					; seg25ab:0061j
		jmp	loc_27D0D
; ---------------------------------------------------------------------------

loc_27D01::				; CODE XREF: seg25ab:009Ej
		wait
		fcompp
		wait
		fld	cs:flt_27CA4
		wait
		ftst

loc_27D0D::				; CODE XREF: seg25ab:loc_27CEDj
					; seg25ab:loc_27CFFj
		jmp	loc_27DB7
; ---------------------------------------------------------------------------

loc_27D10::				; CODE XREF: seg25ab:0050j
		wait
		fabs
		wait
		fld	cs:tbyte_27C90
		wait
		fxch	st(1)
		wait
		fprem
		mov	ch, 2
		and	ch, ah
		shr	ch, 1
		fstsw	word ptr [bp-2]
		wait
		mov	ah, [bp-1]
		sahf
		jp	loc_27D01
		mov	al, 3
		and	al, ah
		shl	ah, 1
		shl	ah, 1
		rcl	al, 1
		add	al, 0FCh ; 'ü'
		rcl	al, 1
		cmp	cl, 2
		jnz	loc_27D47
		add	al, cl
		mov	ch, 0

loc_27D47::				; CODE XREF: seg25ab:00B1j
		and	al, 7
		test	al, 1
		jz	loc_27D52
		wait
		fsubp	st(1), st
		jmp	loc_27D55
; ---------------------------------------------------------------------------

loc_27D52::				; CODE XREF: seg25ab:00BBj
		wait
		fstp	st(1)

loc_27D55::				; CODE XREF: seg25ab:00C0j
		wait
		fptan
		cmp	cl, 4
		jz	loc_27D86
		test	al, 3
		jp	loc_27D64
		wait
		fxch	st(1)

loc_27D64::				; CODE XREF: seg25ab:00CFj
		wait
		fld	st(1)
		wait
		fmul	st, st
		wait
		fxch	st(1)
		wait
		fmul	st, st
		wait
		faddp	st(1), st
		wait
		fsqrt
		shr	al, 1
		shr	al, 1
		xor	al, ch
		jz	loc_27D81
		wait
		fchs

loc_27D81::				; CODE XREF: seg25ab:00ECj
		wait
		fdivp	st(1), st
		jmp	loc_27DB7
; ---------------------------------------------------------------------------

loc_27D86::				; CODE XREF: seg25ab:00CBj
		mov	ah, al
		shr	ah, 1
		and	ah, 1
		xor	ah, ch
		jz	loc_27D94
		wait
		fchs

loc_27D94::				; CODE XREF: seg25ab:00FFj
		test	al, 3
		jp	loc_27DB4
		wait
		fxch	st(1)
		wait
		ftst
		fstsw	word ptr [bp-2]
		wait
		test	byte ptr [bp-1], 40h
		jz	loc_27DB4
		wait
		fcompp
		wait
		fld	cs:flt_27CBE
		jmp	loc_27DB7
; ---------------------------------------------------------------------------

loc_27DB4::				; CODE XREF: seg25ab:0106j
					; seg25ab:0117j
		wait
		fdivp	st(1), st

loc_27DB7::				; CODE XREF: seg25ab:loc_27D0Dj
					; seg25ab:00F4j ...
		mov	sp, bp
		pop	bp
		retn
; ---------------------------------------------------------------------------
		wait
		fxam
		push	bp
		mov	bp, sp
		lea	sp, [bp-2]
		fstsw	word ptr [bp-2]
		wait
		mov	ah, [bp-1]
		sahf
		xchg	ax, cx
		jb	loc_27DD4
		jnz	loc_27DEE
		jmp	loc_27E20
; ---------------------------------------------------------------------------

loc_27DD4::				; CODE XREF: seg25ab:013Ej
		jz	loc_27E20
		jnp	loc_27E20
		wait
		fstp	st
		wait
		fld	cs:tbyte_27C9A
		jmp	loc_27E18
; ---------------------------------------------------------------------------

loc_27DE3::				; CODE XREF: seg25ab:0170j
		wait
		fcompp
		wait
		fld	cs:tbyte_27C90
		jmp	loc_27E18
; ---------------------------------------------------------------------------

loc_27DEE::				; CODE XREF: seg25ab:0140j
		wait
		fabs
		wait
		fld1
		wait
		fcom	st(1)
		fstsw	word ptr [bp-2]
		wait
		mov	ah, [bp-1]
		sahf
		jz	loc_27DE3
		jnb	loc_27E07
		wait
		fxch	st(1)

loc_27E07::				; CODE XREF: seg25ab:0172j
		wait
		fpatan
		jnb	loc_27E18
		wait
		fld	cs:tbyte_27C9A
		wait
		fsubp	st(1), st
		xor	ch, 2

loc_27E18::				; CODE XREF: seg25ab:0151j
					; seg25ab:015Cj ...
		test	ch, 2
		jz	loc_27E20
		wait
		fchs

loc_27E20::				; CODE XREF: seg25ab:0142j
					; seg25ab:loc_27DD4j ...
		mov	sp, bp
		pop	bp
		retn
; ---------------------------------------------------------------------------
		wait
		fld1
		jmp	loc_27E31
; ---------------------------------------------------------------------------
		wait
		fldlg2
		jmp	loc_27E31
; ---------------------------------------------------------------------------
		wait
		fldln2

loc_27E31::				; CODE XREF: seg25ab:0197j
					; seg25ab:019Cj
		wait
		fxch	st(1)
		push	bp
		mov	bp, sp
		wait
		fxam
		lea	sp, [bp-0Ah]
		fstsw	word ptr [bp-0Ah]
		wait
		mov	ah, [bp-9]
		sahf
		jb	loc_27E54
		jz	loc_27E4F
		test	ah, 2
		jz	loc_27E71

loc_27E4F::				; CODE XREF: seg25ab:01B8j
		wait
		fstp	st
		jmp	loc_27E63
; ---------------------------------------------------------------------------

loc_27E54::				; CODE XREF: seg25ab:01B6j
		jz	loc_27E6C
		wait
		fstp	st(1)
		jnp	loc_27E6C
		wait
		fstp	st(1)
		test	ah, 2
		jz	loc_27E95

loc_27E63::				; CODE XREF: seg25ab:01C2j
		wait
		fstp	st
		wait
		fld	cs:flt_27CA8

loc_27E6C::				; CODE XREF: seg25ab:loc_27E54j
					; seg25ab:01C9j
		wait
		ftst
		jmp	loc_27E95
; ---------------------------------------------------------------------------

loc_27E71::				; CODE XREF: seg25ab:01BDj
		wait
		fld	st
		wait
		fstp	tbyte ptr [bp-0Ah]
		wait
		cmp	word ptr [bp-2], 3FFFh
		jnz	loc_27E92
		cmp	word ptr [bp-4], 8000h
		jnz	loc_27E92
		wait
		fld1
		wait
		fsubp	st(1), st
		wait
		fyl2xp1
		jmp	loc_27E95
; ---------------------------------------------------------------------------

loc_27E92::				; CODE XREF: seg25ab:01EEj
					; seg25ab:01F5j
		wait
		fyl2x

loc_27E95::				; CODE XREF: seg25ab:01D1j
					; seg25ab:01DFj ...
		mov	sp, bp
		pop	bp
		retn
; ---------------------------------------------------------------------------
		sub	cx, cx
		jmp	loc_27EAF
; ---------------------------------------------------------------------------
		wait
		fldl2t
		mov	cl, 1
		wait
		fxch	st(1)
		jmp	loc_27EAF
; ---------------------------------------------------------------------------
		wait
		fldl2e
		mov	cl, 1
		wait
		fxch	st(1)

loc_27EAF::				; CODE XREF: seg25ab:020Bj
					; seg25ab:0215j
		wait
		fxam
		push	bp
		mov	bp, sp
		lea	sp, [bp-4]
		fstsw	word ptr [bp-4]
		jcxz	loc_27EC1
		wait
		fxch	st(1)

loc_27EC1::				; CODE XREF: seg25ab:022Cj
		wait
		mov	ah, [bp-3]
		sahf
		jb	loc_27ED8
		jnz	loc_27EF3
		wait
		fstp	st
		jcxz	loc_27ED2
		wait
		fstp	st

loc_27ED2::				; CODE XREF: seg25ab:023Dj
		wait
		fld1
		jmp	loc_27F7C
; ---------------------------------------------------------------------------

loc_27ED8::				; CODE XREF: seg25ab:0236j
		jcxz	loc_27EDD
		wait
		fstp	st

loc_27EDD::				; CODE XREF: seg25ab:loc_27ED8j
		jz	loc_27EED
		jnp	loc_27EED
		wait
		fstp	st
		wait
		fld	cs:flt_27CBE
		jmp	loc_27F71
; ---------------------------------------------------------------------------

loc_27EED::				; CODE XREF: seg25ab:loc_27EDDj
					; seg25ab:024Fj
		wait
		ftst
		jmp	loc_27F7C
; ---------------------------------------------------------------------------

loc_27EF3::				; CODE XREF: seg25ab:0238j
		jcxz	loc_27EF8
		wait
		fmulp	st(1), st

loc_27EF8::				; CODE XREF: seg25ab:loc_27EF3j
		wait
		fabs
		wait
		fcom	cs:flt_27CB0
		fstsw	word ptr [bp-4]
		wait
		test	byte ptr [bp-3], 41h
		jz	loc_27F17
		wait
		f2xm1
		wait
		fld1
		wait
		faddp	st(1), st
		jmp	loc_27F71
; ---------------------------------------------------------------------------

loc_27F17::				; CODE XREF: seg25ab:027Aj
		wait
		fld1
		wait
		fld	st(1)
		fstcw	word ptr [bp-4]
		wait
		fscale
		or	byte ptr [bp-3], 0Fh
		wait
		fldcw	word ptr [bp-4]
		wait
		frndint
		and	byte ptr [bp-3], 0F3h
		wait
		fldcw	word ptr [bp-4]
		wait
		fist	word ptr [bp-2]
		wait
		fxch	st(1)
		wait
		fchs
		wait
		fxch	st(1)
		wait
		fscale
		wait
		fstp	st(1)
		wait
		fsubp	st(1), st
		wait
		f2xm1
		wait
		fld1
		wait
		faddp	st(1), st
		shr	word ptr [bp-2], 1
		jnb	loc_27F64
		wait
		fld	cs:tbyte_27CB4
		wait
		fmulp	st(1), st

loc_27F64::				; CODE XREF: seg25ab:02C9j
		wait
		fild	word ptr [bp-2]
		wait
		fxch	st(1)
		wait
		fscale
		wait
		fstp	st(1)

loc_27F71::				; CODE XREF: seg25ab:025Aj
					; seg25ab:0285j
		test	ah, 2
		jz	loc_27F7C
		wait
		fld1
		wait
		fdivrp	st(1), st

loc_27F7C::				; CODE XREF: seg25ab:0245j
					; seg25ab:0260j ...
		mov	sp, bp
		pop	bp
		retn
		assume es:nothing, ds:seg0000

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

sub_27F80	proc near		; CODE XREF: e087_entry+10p
					; e087_entry:loc_2802Ap
		push	bx
		mov	al, ss:7
		mov	bx, ds

loc_27F87::
		and	bl, 0F8h
		push	ds
		mov	ds, word ptr ss:0Ah
		assume ds:nothing
		xor	[bx+5],	al
		pop	ds
		assume ds:seg0000
		pop	bx
		retn
sub_27F80	endp

		assume ds:seg2608

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

e087_entry	proc far		; DATA XREF: sub_24D9+11Bo

var_2		= word ptr -2
arg_1		= byte ptr  7

		push	bp
		mov	bp, sp
		push	ax
		push	si
		push	ds
		test	[bp+arg_1], 2
		jz	loc_27FA3
		sti

loc_27FA3::				; CODE XREF: e087_entry+Aj
		lds	si, [bp+2]
		assume ds:seg0000
		call	sub_27F80
		mov	ax, [si-1]
		sub	al, 34h	; '4'
		cmp	al, 8
		jnb	loc_28007
		cmp	ax, 0E303h
		jz	loc_27FDC
		cmp	ax, 0E007h
		jnz	loc_27FCD
		cmp	byte ptr ss:6, 2
		jge	loc_27FCD
		fstsw	[bp+var_2]
		inc	word ptr [bp+2]
		jmp	loc_2802A
; ---------------------------------------------------------------------------

loc_27FCD::				; CODE XREF: e087_entry+24j
					; e087_entry+2Cj
		sub	si, 2
		mov	byte ptr [si], 9Bh ; ''
		add	byte ptr [si+1], 0A4h ;	'¤'

loc_27FD7::				; CODE XREF: e087_entry+A7j
		mov	[bp+2],	si
		jmp	loc_2802A
; ---------------------------------------------------------------------------

loc_27FDC::				; CODE XREF: e087_entry+1Fj
		fninit
		inc	word ptr [bp+2]
		mov	word ptr ss:0, 4100h
		mov	word ptr ss:2, 3Fh ; '?'
		mov	word ptr ss:24h, 0
		mov	ax, ss:10h
		mov	ss:0Ch,	ax
		mov	word ptr ss:4, 0
		jmp	loc_2802A
; ---------------------------------------------------------------------------

loc_28007::				; CODE XREF: e087_entry+1Aj
		ja	loc_28032
		test	ah, 20h
		jnz	loc_2803F
		sub	si, 2
		mov	[bp+2],	si
		mov	byte ptr [si], 9Bh ; ''
		inc	si
		mov	al, ah
		and	ax, 7C0h
		shr	al, 1
		shr	al, 1
		shr	al, 1
		xor	al, 18h
		add	ax, 0D826h
		mov	[si], ax

loc_2802A::				; CODE XREF: e087_entry+35j
					; e087_entry+44j ...
		call	sub_27F80
		pop	ds
		assume ds:seg2608
		pop	si
		pop	ax
		pop	bp
		iret
; ---------------------------------------------------------------------------

loc_28032::				; CODE XREF: e087_entry:loc_28007j
		cmp	al, 9
		ja	loc_2803F
		sub	si, 2
		mov	word ptr [si], 9B90h
		jmp	loc_27FD7
; ---------------------------------------------------------------------------

loc_2803F::				; CODE XREF: e087_entry+76j
					; e087_entry+9Ej
		int	3		; Trap to Debugger
		jmp	loc_2802A
e087_entry	endp

; ---------------------------------------------------------------------------
		db 32h,	0, 36h,	0, 3Ah,	0, 2Bh,	1, 9Eh,	1, 94h,	1, 99h
		db 1, 17h, 2, 9, 2, 0Dh, 2
; ---------------------------------------------------------------------------

e087_shortcut:				; DATA XREF: sub_24D9+125o
		sti
		push	ax
		push	si
		push	es
		push	bp
		mov	bp, sp
		les	si, [bp+8]
		assume es:nothing
		lods	byte ptr es:[si]
		mov	[bp+8],	si
		cbw
		xchg	ax, si
		push	cx
		call	word ptr cs:[si+3C6h]
		pop	cx
		pop	bp
		pop	es
		pop	si
		pop	ax
		iret
; ---------------------------------------------------------------------------
		db 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR e087_trap

loc_28080::				; CODE XREF: e087_trap-2Aj
					; e087_trap+1Dj
		pop	di
		pop	es
		pop	dx
		pop	cx
		pop	bx
		pop	si
		pop	ds
		clc
		retf
; ---------------------------------------------------------------------------

loc_28089::				; CODE XREF: e087_trap+10j
		mov	al, byte ptr word_28262
		mov	ah, byte ptr dataseg@
		fnclex			; (emulator call)
		test	ah, 80h
		jz	loc_28080
		not	al
		and	al, ah
		jmp	loc_281C8
; ---------------------------------------------------------------------------

loc_2809F::				; CODE XREF: e087_trap+40j
		les	di, [si+6]
		test	bl, 8
		jnz	loc_280AF
		mov	bx, es
		and	bx, 0F000h
		mov	es, bx
		assume es:nothing

loc_280AF::				; CODE XREF: e087_trap-1Bj
		test	byte ptr es:[di], 80h
		jnz	loc_280B6
		inc	di

loc_280B6::				; CODE XREF: e087_trap-Dj
		mov	bx, es:[di]
		xchg	bh, bl
		jmp	loc_28102
; END OF FUNCTION CHUNK	FOR e087_trap
; ---------------------------------------------------------------------------
		jmp	loc_28114
; ---------------------------------------------------------------------------
		db 90h

; =============== S U B	R O U T	I N E =======================================


e087_trap	proc far		; CODE XREF: seg0000:02E1P

; FUNCTION CHUNK AT 03F0 SIZE 0000003D BYTES

		push	ds
		push	si
		push	bx
		push	cx
		push	dx
		push	es
		push	di
		mov	ds, ax
		mov	al, byte ptr word_28266
		or	al, al
		mov	bx, ax
		jz	loc_28089
		mov	si, 12h
		fnstenv	byte ptr [si]
		wait
		mov	ax, [si+2]
		test	al, 80h
		jz	loc_28080
		fclex
		mov	dx, ax
		mov	al, [si]
		mov	dh, dl
		or	al, 40h
		and	dl, al
		and	dl, 7Fh
		mov	[si+2],	dl
		wait
		fldenv	byte ptr [si]
		not	al
		and	al, dh
		or	bl, byte ptr word_28266+1
		cmp	bl, 3
		jge	loc_2809F

loc_28102::				; CODE XREF: e087_trap-5j
		and	bh, 7
		mov	dh, bl
		and	dh, 0C0h
		cmp	dh, 0C0h ; 'À'
		jz	loc_28112
		and	bl, 38h

loc_28112::				; CODE XREF: e087_trap+4Dj
		wait
		sti

loc_28114::				; CODE XREF: seg25ab:042Dj
		test	al, 2
		jz	loc_2816D
		mov	cx, 8

loc_2811B::				; CODE XREF: e087_trap+61j
		call	sub_281DB
		wait
		fincstp
		loop	loc_2811B
		mov	ax, bx
		shr	ax, 1
		and	al, 9Ch
		cmp	al, 80h	; ''
		jz	loc_28135
		cmp	al, 94h	; ''
		jz	loc_28135
		and	al, 98h
		cmp	al, 8

loc_28135::				; CODE XREF: e087_trap+6Bj
					; e087_trap+6Fj
		jz	loc_2816B
		fnstcw	word ptr aDivideErrorAbn+1 ; "ivide error\r\nAbnormal program termina"...
		wait
		or	byte ptr aDivideErrorAbn+1, 2 ;	"ivide error\r\nAbnormal program termina"...
		wait
		fldcw	word ptr aDivideErrorAbn+1 ; "ivide error\r\nAbnormal program termina"...
		les	di, [si+0Ah]
		assume es:nothing
		cmp	bx, 30h	; '0'
		jnz	loc_28154
		wait
		fld	dword ptr es:[di]
		jmp	loc_2815E
; ---------------------------------------------------------------------------

loc_28154::				; CODE XREF: e087_trap+8Cj
		cmp	bx, 430h
		jnz	loc_28164
		wait
		fld	qword ptr es:[di]

loc_2815E::				; CODE XREF: e087_trap+92j
		call	sub_281DB
		mov	bx, 0DEF9h

loc_28164::				; CODE XREF: e087_trap+98j
		wait
		mov	di, word_2826C
		jmp	loc_2819E
; ---------------------------------------------------------------------------

loc_2816B::				; CODE XREF: e087_trap:loc_28135j
		jmp	loc_281B6
; ---------------------------------------------------------------------------

loc_2816D::				; CODE XREF: e087_trap+56j
		mov	ah, byte ptr word_28262
		not	ah
		and	ah, al
		and	ah, 7Fh
		jnz	loc_281C8
		test	al, 5
		jnz	loc_2818C
		test	al, 18h
		jz	loc_281BA
		mov	ax, bx
		shr	ax, 1
		and	al, 0E8h
		cmp	al, 88h	; ''
		jnz	loc_281BA

loc_2818C::				; CODE XREF: e087_trap+BCj
		fnstcw	word ptr aDivideErrorAbn+1 ; "ivide error\r\nAbnormal program termina"...
		wait
		mov	ax, word ptr aDivideErrorAbn+1 ; "ivide	error\r\nAbnormal program termina"...
		or	byte ptr aDivideErrorAbn+1, 3Fh	; "ivide error\r\nAbnormal program termina"...
		wait
		fldcw	word ptr aDivideErrorAbn+1 ; "ivide error\r\nAbnormal program termina"...

loc_2819E::				; CODE XREF: e087_trap+A9j
		push	cs
		call	near ptr sub_28228
		add	sp, 0Ah
		fstsw	word ptr aDivideErrorAbn+1 ; "ivide error\r\nAbnormal program termina"...
		fclex
		mov	ax, word ptr aDivideErrorAbn+1 ; "ivide	error\r\nAbnormal program termina"...
		and	al, 3Fh
		or	byte ptr aCopyright1991B+12h, al ; "land Intl."

loc_281B6::				; CODE XREF: e087_trap:loc_2816Bj
		wait
		fldcw	word ptr [si]
		clc

loc_281BA::				; CODE XREF: e087_trap+C0j
					; e087_trap+CAj ...
		pop	di
		pop	es
		pop	dx
		pop	cx
		pop	bx
		pop	si
		pop	ds
		jb	locret_281C7
		pop	ax
		pop	ax
		pop	ax
		iret
; ---------------------------------------------------------------------------

locret_281C7::				; CODE XREF: e087_trap+101j
		retf
; ---------------------------------------------------------------------------

loc_281C8::				; CODE XREF: e087_trap-24j
					; e087_trap+B8j
		xor	dx, dx
		mov	bx, ax

loc_281CC::				; CODE XREF: e087_trap+10Fj
		inc	dx
		shr	bx, 1
		jnb	loc_281CC
		mov	word_28268, dx
		mov	ax, 8
		stc
		jmp	loc_281BA
e087_trap	endp ; sp-analysis failed


; =============== S U B	R O U T	I N E =======================================


sub_281DB	proc near		; CODE XREF: e087_trap:loc_2811Bp
					; e087_trap:loc_2815Ep
		wait
		fxam
		fstsw	word ptr aDivideErrorAbn+1 ; "ivide error\r\nAbnormal program termina"...
		wait
		mov	ah, byte ptr aDivideErrorAbn+2 ; "vide error\r\nAbnormal program terminat"...
		sahf
		jnb	loc_281EE
		jnz	loc_281F0
		retn
; ---------------------------------------------------------------------------

loc_281EE::				; CODE XREF: sub_281DB+Ej
		jz	loc_281F5

loc_281F0::				; CODE XREF: sub_281DB+10j
		jb	locret_281F4
		jnp	loc_281FC

locret_281F4::				; CODE XREF: sub_281DB:loc_281F0j
		retn
; ---------------------------------------------------------------------------

loc_281F5::				; CODE XREF: sub_281DB:loc_281EEj
		wait
		fstp	st
		wait
		fldz
		retn
; ---------------------------------------------------------------------------

loc_281FC::				; CODE XREF: sub_281DB+17j
		wait
		fstp	tbyte ptr aCopyright1991B+14h ;	"nd Intl."
		wait
		fild	qword ptr aCopyright1991B+14h ;	"nd Intl."
		mov	ax, word ptr aCopyright1991B+1Ch ; ""
		mov	dx, ax
		and	dh, 80h
		wait
		fstp	tbyte ptr aCopyright1991B+14h ;	"nd Intl."
		xor	ah, dh
		wait
		add	ax, word ptr aCopyright1991B+1Ch ; ""
		sub	ax, 403Eh
		xor	ah, dh
		mov	word ptr aCopyright1991B+1Ch, ax ; ""
		wait
		fld	tbyte ptr aCopyright1991B+14h ;	"nd Intl."
		retn
sub_281DB	endp


; =============== S U B	R O U T	I N E =======================================


sub_28228	proc far		; CODE XREF: e087_trap+DFp
		mov	word_2826C, di
		mov	dx, 0EA90h
		push	dx
		mov	dx, bx
		and	bl, 0C0h
		cmp	bl, 0C0h ; 'À'
		jz	loc_2823D
		or	dl, 7

loc_2823D::				; CODE XREF: sub_28228+10j
		or	dh, 0D8h
		xchg	dh, dl
		push	dx
		mov	dx, 269Bh
		push	dx
		mov	dx, ss
		xor	dl, byte ptr word_28266+1
		push	dx
		mov	dx, sp
		add	dx, 2
		push	dx
		les	bx, [si+0Ah]
		retf
sub_28228	endp ; sp-analysis failed

; ---------------------------------------------------------------------------
		db 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
seg25ab		ends
		end
