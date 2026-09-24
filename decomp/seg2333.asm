; decomp/seg2333.asm — seg2333 (extracted from RIPTIDE_.asm)
		.386p

		extrn	__fpuint:far
		public	e086_entry
		public	e086_shortcut
		public	sub_25522
		public	sub_255FF
		public	sub_25603
		public	sub_257CD
		public	sub_25863
		public	sub_2599A
		public	sub_25D6A
		public	sub_25DE1
		public	sub_25EE9
		public	sub_25FA9
		public	sub_25FE5
		public	sub_2601F
		public	sub_26099
		public	sub_260F6
		public	sub_2619D
		public	sub_2625B
		public	sub_26288
		public	sub_262D1
		public	sub_262F3
		public	sub_26304
		public	sub_26315
		public	sub_26326
		public	sub_26337
		public	sub_2634D
		public	sub_26363
		public	sub_2637B
		public	sub_26397
		public	sub_263B4
		public	sub_263CA
		public	sub_263E7
		public	sub_26408
		public	sub_2644B
		public	sub_264EE
		public	sub_2659A
		public	sub_265F2
		public	sub_266DE
		public	sub_26751
		public	sub_26847
		public	sub_26956
		public	sub_26A5E
		public	sub_26C0F
		public	sub_26C15
		public	sub_26C30
		public	sub_26C33
		public	sub_26C40
		public	sub_26D36
		public	sub_26DE9
		public	sub_26EBE
		public	sub_26FB6
		public	sub_270A6
		public	sub_273C8
		public	sub_273F7
		public	sub_274C2
		public	sub_274E0
		public	sub_27797
		public	sub_2779E
		public	sub_277A5
		public	sub_277A8
		public	sub_277AE
		public	sub_277AF
		public	sub_277B6
		public	sub_277B7
		public	sub_27829
		public	sub_2782F
		public	sub_27838
		public	sub_27843
		public	sub_2786C
		public	sub_27890
		public	sub_278C2
		public	sub_278C7
		public	sub_278EE
		public	sub_278FE
		public	sub_2790E
		public	sub_2791E
		public	sub_2792B
		public	sub_27938
		public	sub_27A70
		public	sub_27A75
		public	sub_27A82
		public	sub_27C24

seg0000		segment	byte public 'CODE' use16
seg0000		ends

seg2608		segment	para public 'DATA' use16
		extrn	word_2826C:word
		extrn	dataseg@:word
		extrn	word_28262:word
		extrn	aDivideErrorAbn:byte
		extrn	word_28264:word
		extrn	off_28270:word
		extrn	off_2826E:word
seg2608		ends


; ---- segment seg2333 ----
seg2333		segment	byte public 'CODE' use16
		assume cs:seg2333
		assume es:nothing, ss:nothing, ds:seg2608, fs:nothing, gs:nothing
		dw 0E287h
		dw 0C00h
		dw 2418h
		dw 3C30h
		dw 5448h
		dw 6C60h
		dw 8478h
		dw 9C90h
		dw 0B4A8h

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

sub_25522	proc near		; CODE XREF: sub_25603-3Dp
					; sub_25603-19p ...
		push	dx
		push	si
		mov	dx, [si+6]
		and	dh, 7Fh
		or	dx, [si]
		or	dx, [si+2]
		or	dx, [si+4]
		jnz	loc_25554
		cmp	bx, 0FFFFh
		jz	loc_25550

loc_25539::
		cmp	word ptr [bx+8], 4001h
		jl	loc_25550
		mov	dx, [bx+6]

loc_25543::
		and	dh, 7Fh
		or	dx, [bx]
		or	dx, [bx+2]
		or	dx, [bx+4]
		jnz	loc_25594

loc_25550::				; CODE XREF: sub_25522+15j
					; sub_25522+1Cj
		clc

loc_25551::				; CODE XREF: sub_25522+82j
		pop	si
		pop	dx
		retn
; ---------------------------------------------------------------------------

loc_25554::				; CODE XREF: sub_25522+10j
		cmp	bx, 0FFFFh
		jz	loc_25596
		cmp	word ptr [bx+8], 4001h
		jl	loc_25596
		mov	dx, [bx+6]
		and	dh, 7Fh
		or	dx, [bx]
		or	dx, [bx+2]
		or	dx, [bx+4]
		jz	loc_25596
		mov	dx, [si+6]
		cmp	dx, [bx+6]
		ja	loc_25596
		jb	loc_25594
		mov	dx, [si+4]
		cmp	dx, [bx+4]
		ja	loc_25596
		jb	loc_25594
		mov	dx, [si+2]
		cmp	dx, [bx+2]
		ja	loc_25596
		jb	loc_25594
		mov	dx, [si]

loc_25590::
		cmp	dx, [bx]
		ja	loc_25596

loc_25594::				; CODE XREF: sub_25522+2Cj
					; sub_25522+56j ...
		mov	si, bx

loc_25596::				; CODE XREF: sub_25522+35j
					; sub_25522+3Cj ...
		push	di
		mov	ch, 1
		call	sub_27C24
		mov	cx, 6
		cld
		rep movsw
		stc
		pop	di
		jmp	loc_25551
sub_25522	endp

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_25603

loc_255A6::				; CODE XREF: sub_25603-32j
					; sub_25603-29j
		mov	al, [si+0Ah]

loc_255A9::				; CODE XREF: sub_25603-14j
		mov	[bp+var_5], al
		mov	[bp+var_4], 4001h
		nop
		jmp	loc_255F1
; ---------------------------------------------------------------------------

loc_255B4::				; CODE XREF: sub_25603-2Bj
		mov	di, [bp+arg_0]
		nop
		call	sub_26363

loc_255BB::				; CODE XREF: sub_25603-38j
					; sub_25603-16j
		jmp	loc_25751
; ---------------------------------------------------------------------------

loc_255BE::				; CODE XREF: sub_25603+24j
		push	bx
		push	di
		mov	bx, di
		mov	di, [bp+arg_0]
		nop
		call	sub_25522
		pop	di
		pop	bx
		jb	loc_255BB
		cmp	bx, 4001h
		jl	loc_255A6
		mov	al, byte ptr [bp+var_6]
		or	al, al
		jnz	loc_255B4
		jmp	loc_255A6
; ---------------------------------------------------------------------------

loc_255DC::				; CODE XREF: sub_25603+2Aj
		mov	bx, 0FFFFh
		mov	al, [di+0Ah]
		xor	al, cl
		mov	si, di
		mov	di, [bp+arg_0]
		nop
		call	sub_25522
		jb	loc_255BB
		jmp	loc_255A9
; ---------------------------------------------------------------------------

loc_255F1::				; CODE XREF: sub_25603-51j
					; sub_25603+48j ...
		mov	ax, [si]
		mov	bx, [si+2]
		mov	cx, [si+4]
		mov	dx, [si+6]
		jmp	loc_2573E
; END OF FUNCTION CHUNK	FOR sub_25603

; =============== S U B	R O U T	I N E =======================================


sub_255FF	proc near		; CODE XREF: sub_26D36+6Ep
					; seg2333:1C67p ...
		mov	cl, 1
		jmp	loc_25605
sub_255FF	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_25603	proc near		; CODE XREF: seg2333:0830p
					; sub_26D36+7Dp ...

var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= word ptr -4
var_2		= byte ptr -2
arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8

; FUNCTION CHUNK AT 0096 SIZE 00000059 BYTES

		mov	cl, 0

loc_25605::				; CODE XREF: sub_255FF+2j
		push	bp
		mov	bp, sp
		lea	sp, [bp-6]
		push	si
		push	di
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_2]
		mov	al, cl
		xor	al, [di+0Ah]
		xor	al, [si+0Ah]
		mov	[bp+var_6], al
		mov	ax, [si+8]
		mov	bx, [di+8]
		cmp	ax, 4001h
		jge	loc_255BE
		cmp	bx, 4001h
		jge	loc_255DC
		cmp	ax, bx
		jge	loc_2563B
		xor	cl, [di+0Ah]
		xchg	ax, bx
		xchg	si, di
		jmp	loc_2563E
; ---------------------------------------------------------------------------

loc_2563B::				; CODE XREF: sub_25603+2Ej
		mov	cl, [si+0Ah]

loc_2563E::				; CODE XREF: sub_25603+36j
		mov	[bp+var_5], cl
		mov	cx, [si+8]
		mov	[bp+var_4], cx
		cmp	bx, 0C001h
		jle	loc_255F1
		sub	ax, bx
		cmp	ax, 41h	; 'A'
		jg	loc_255F1
		mov	bx, [di+2]
		mov	cx, [di+4]
		mov	dx, [di+6]
		mov	di, [di]
		xchg	ax, di
		mov	[bp+var_2], 0
		sub	di, 8
		jl	loc_25681

loc_25669::				; CODE XREF: sub_25603+7Cj
		mov	[bp+var_2], al
		mov	al, ah
		mov	ah, bl
		mov	bl, bh
		mov	bh, cl
		mov	cl, ch
		mov	ch, dl
		mov	dl, dh
		mov	dh, 0
		sub	di, 8
		jge	loc_25669

loc_25681::				; CODE XREF: sub_25603+64j
		and	di, 7
		jz	loc_25694

loc_25686::				; CODE XREF: sub_25603+8Fj
		shr	dx, 1
		rcr	cx, 1
		rcr	bx, 1
		rcr	ax, 1
		rcr	[bp+var_2], 1
		dec	di
		jnz	loc_25686

loc_25694::				; CODE XREF: sub_25603+81j
		cmp	[bp+var_6], 0
		jnz	loc_256B7
		add	ax, [si]
		adc	bx, [si+2]
		adc	cx, [si+4]
		adc	dx, [si+6]
		jnb	loc_2571E
		rcr	dx, 1
		rcr	cx, 1
		rcr	bx, 1
		rcr	ax, 1
		rcr	[bp+var_2], 1
		inc	[bp+var_4]
		jmp	loc_2571E
; ---------------------------------------------------------------------------

loc_256B7::				; CODE XREF: sub_25603+95j
		xor	[bp+var_5], 1
		sub	ax, [si]
		sbb	bx, [si+2]
		sbb	cx, [si+4]
		sbb	dx, [si+6]
		jnb	loc_256E0
		xor	[bp+var_5], 1
		not	dx
		not	cx
		not	bx
		not	ax
		neg	[bp+var_2]
		cmc
		adc	ax, di
		adc	bx, di
		adc	cx, di
		adc	dx, di

loc_256E0::				; CODE XREF: sub_25603+C3j
		mov	si, 8

loc_256E3::				; CODE XREF: sub_25603+FEj
		or	dh, dh
		jnz	loc_2571C
		mov	dh, dl
		mov	dl, ch
		mov	ch, cl
		mov	cl, bh
		mov	bh, bl
		mov	bl, ah
		mov	ah, al
		mov	al, [bp+var_2]
		mov	[bp+var_2], 0
		sub	[bp+var_4], 8
		dec	si
		jge	loc_256E3
		mov	[bp+var_4], 0C001h
		mov	[bp+var_5], 0
		jmp	loc_2573E
; ---------------------------------------------------------------------------

loc_2570E::				; CODE XREF: sub_25603:loc_2571Cj
		dec	[bp+var_4]
		shl	[bp+var_2], 1
		rcl	ax, 1
		rcl	bx, 1
		rcl	cx, 1
		adc	dx, dx

loc_2571C::				; CODE XREF: sub_25603+E2j
		jns	loc_2570E

loc_2571E::				; CODE XREF: sub_25603+A2j
					; sub_25603+B2j
		shl	[bp+var_2], 1
		adc	ax, di
		adc	bx, di
		adc	cx, di
		adc	dx, di
		jnb	loc_25730
		rcr	dx, 1
		inc	[bp+var_4]

loc_25730::				; CODE XREF: sub_25603+126j
		cmp	[bp+var_4], 4001h
		jge	loc_25759
		cmp	[bp+var_4], 0C001h
		jle	loc_25762

loc_2573E::				; CODE XREF: sub_25603-7j
					; sub_25603+109j ...
		cld
		mov	di, [bp+arg_0]
		stosw
		xchg	ax, bx
		stosw
		xchg	ax, cx
		stosw
		xchg	ax, dx
		stosw
		mov	ax, [bp+var_4]
		stosw
		mov	al, [bp+var_5]
		stosb

loc_25751::				; CODE XREF: sub_25603:loc_255BBj
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retn	6
; ---------------------------------------------------------------------------

loc_25759::				; CODE XREF: sub_25603+132j
		mov	ch, 8
		mov	[bp+var_4], 4001h
		jmp	loc_25769
; ---------------------------------------------------------------------------

loc_25762::				; CODE XREF: sub_25603+139j
		mov	ch, 10h
		mov	[bp+var_4], 0C001h

loc_25769::				; CODE XREF: sub_25603+15Dj
		call	sub_27C24
		mov	[bp+var_5], 0
		sub	ax, ax
		mov	bx, ax
		mov	cx, ax
		cwd
		jmp	loc_2573E
sub_25603	endp

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_257CD

loc_25779::				; CODE XREF: sub_257CD-31j
					; sub_257CD-1Bj ...
		mov	ax, 4001h

loc_2577C::				; CODE XREF: sub_257CD-2j
		mov	di, [bp+arg_0]
		mov	cl, [bp+var_6]
		call	sub_2634D

loc_25785::				; CODE XREF: sub_257CD-3Aj
					; sub_257CD-22j ...
		pop	ax
		jmp	loc_2585D
; ---------------------------------------------------------------------------

loc_25789::				; CODE XREF: sub_257CD+21j
		push	di
		mov	bx, di
		mov	di, [bp+arg_0]
		call	sub_25522
		pop	di
		jb	loc_25785
		cmp	word ptr [di+8], 0C001h
		jle	loc_257B4
		jmp	loc_25779
; ---------------------------------------------------------------------------

loc_2579E::				; CODE XREF: sub_257CD+25j
		push	si
		mov	bx, 0FFFFh
		mov	si, di
		mov	di, [bp+arg_0]
		call	sub_25522
		pop	si
		jb	loc_25785
		cmp	word ptr [si+8], 0C001h
		jg	loc_25779

loc_257B4::				; CODE XREF: sub_257CD-33j
		mov	di, [bp+arg_0]
		call	sub_26363
		jmp	loc_25785
; ---------------------------------------------------------------------------

loc_257BC::				; CODE XREF: sub_257CD+35j
		mov	ch, 8
		call	sub_27C24
		jmp	loc_25779
; ---------------------------------------------------------------------------

loc_257C3::				; CODE XREF: sub_257CD:loc_25808j
		mov	ch, 10h
		call	sub_27C24

loc_257C8::				; CODE XREF: sub_257CD+29j
					; sub_257CD+2Dj
		mov	ax, 0C001h
		jmp	loc_2577C
; END OF FUNCTION CHUNK	FOR sub_257CD

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_257CD	proc near		; CODE XREF: sub_26C15+12p
					; sub_26D36+74p ...

var_6		= byte ptr -6
arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8
arg_1A		= word ptr  1Eh

; FUNCTION CHUNK AT 0269 SIZE 00000054 BYTES

		push	bp
		mov	bp, sp
		push	si
		push	di
		cld
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_2]
		mov	cl, [si+0Ah]
		xor	cl, [di+0Ah]
		push	cx
		mov	dx, 4001h
		mov	bx, [di+8]
		mov	cx, 0C001h
		mov	ax, [si+8]
		cmp	ax, dx
		jge	loc_25789
		cmp	bx, dx
		jge	loc_2579E
		cmp	ax, cx
		jle	loc_257C8
		cmp	bx, cx
		jle	loc_257C8
		add	ax, bx
		dec	ax
		cmp	ax, 4001h
		jge	loc_257BC
		inc	ax
		cmp	ax, 0C001h

loc_25808::
		jle	loc_257C3
		push	word ptr [si+6]
		push	word ptr [si+4]
		push	word ptr [si+2]
		push	word ptr [si]
		sub	sp, 4
		push	word ptr [di+6]
		push	word ptr [di+4]
		push	word ptr [di+2]
		push	word ptr [di]
		xchg	ax, di
		mov	bp, sp
		call	sub_25863
		add	sp, 14h
		or	dx, dx
		js	loc_2583B
		dec	di
		shl	si, 1
		rcl	ax, 1
		rcl	bx, 1
		rcl	cx, 1
		rcl	dx, 1

loc_2583B::				; CODE XREF: sub_257CD+61j
		shl	si, 1
		adc	ax, 0
		jnb	loc_2584D
		adc	bx, ax
		adc	cx, ax
		adc	dx, ax
		jnb	loc_2584D
		rcr	dx, 1
		inc	di

loc_2584D::				; CODE XREF: sub_257CD+73j
					; sub_257CD+7Bj
		mov	si, di
		mov	di, [bp+arg_1A]
		stosw
		xchg	ax, bx
		stosw
		xchg	ax, cx
		stosw
		xchg	ax, dx
		stosw
		xchg	ax, si
		stosw
		pop	ax
		stosb

loc_2585D::				; CODE XREF: sub_257CD-47j
		pop	di
		pop	si
		pop	bp
		retn	6
sub_257CD	endp


; =============== S U B	R O U T	I N E =======================================


sub_25863	proc near		; CODE XREF: sub_257CD+59p
					; sub_26A5E+28p
		push	di
		sub	di, di
		mov	cx, di
		mov	si, di
		test	byte ptr [bp+0Fh], 80h
		jz	loc_25876
		mov	cx, [bp+0]
		mov	si, [bp+2]

loc_25876::				; CODE XREF: sub_25863+Bj
		test	byte ptr [bp+3], 80h
		jz	loc_2588B
		add	cx, [bp+0Ch]
		adc	si, [bp+0Eh]
		adc	di, di
		test	byte ptr [bp+0Fh], 80h
		jz	loc_2588B
		dec	di

loc_2588B::				; CODE XREF: sub_25863+17j
					; sub_25863+25j
		sub	bx, bx
		mov	ax, [bp+0Ch]
		mul	word ptr [bp+4]
		add	cx, ax
		adc	si, dx
		adc	di, 0
		mov	ax, [bp+10h]
		or	ax, ax
		jz	loc_258B8
		mul	word ptr [bp+0]
		add	cx, ax
		adc	si, dx
		adc	di, 0
		mov	ax, [bp+10h]
		mul	word ptr [bp+2]
		add	si, ax
		adc	di, dx
		adc	bx, 0

loc_258B8::				; CODE XREF: sub_25863+3Cj
		mov	ax, [bp+0Ch]
		mul	word ptr [bp+6]
		add	si, ax
		adc	di, dx
		adc	bx, 0
		mov	ax, [bp+0Eh]
		mul	word ptr [bp+4]
		add	si, ax
		adc	di, dx
		adc	bx, 0
		mov	ax, [bp+12h]
		or	ax, ax
		jz	loc_258E3
		mul	word ptr [bp+0]
		add	si, ax
		adc	di, dx
		adc	bx, 0

loc_258E3::				; CODE XREF: sub_25863+74j
		sub	cx, cx
		push	si
		mov	si, cx
		mov	ax, [bp+0Eh]
		mul	word ptr [bp+6]
		add	di, ax
		adc	bx, dx
		adc	cx, 0
		mov	ax, [bp+10h]
		or	ax, ax
		jz	loc_25913
		mul	word ptr [bp+4]
		add	di, ax
		adc	bx, dx
		adc	cx, 0
		mov	ax, [bp+10h]
		mul	word ptr [bp+6]
		add	bx, ax
		adc	cx, dx
		adc	si, 0

loc_25913::				; CODE XREF: sub_25863+97j
		mov	ax, [bp+12h]
		or	ax, ax
		jz	loc_2593E
		mul	word ptr [bp+2]
		add	di, ax
		adc	bx, dx
		adc	cx, 0
		adc	si, 0
		mov	ax, [bp+12h]
		mul	word ptr [bp+4]
		add	bx, ax
		adc	cx, dx
		adc	si, 0
		mov	ax, [bp+12h]
		mul	word ptr [bp+6]
		add	cx, ax
		adc	si, dx

loc_2593E::				; CODE XREF: sub_25863+B5j
		mov	dx, si
		xchg	ax, di
		pop	si
		pop	di
		retn
sub_25863	endp

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_2599A

loc_25944::				; CODE XREF: sub_2599A+22j
		mov	si, di
		mov	di, [bp+arg_0]
		nop
		call	sub_25522
		jb	loc_2597E
		cmp	word ptr [bx+8], 4001h
		jl	loc_25986
		call	sub_26363
		jmp	loc_2597E
; ---------------------------------------------------------------------------

loc_2595B::				; CODE XREF: sub_2599A+27j
		mov	si, bx
		mov	bx, 0FFFFh
		mov	di, [bp+arg_0]
		nop
		call	sub_25522
		jb	loc_2597E
		jmp	loc_25970
; ---------------------------------------------------------------------------

loc_2596B::				; CODE XREF: sub_2599A+2Dj
		mov	ch, 4

loc_2596D::				; CODE XREF: sub_2599A-Dj
		call	sub_27C24

loc_25970::				; CODE XREF: sub_2599A-31j
					; sub_2599A:loc_25CEBj
		mov	ax, 4001h

loc_25973::				; CODE XREF: sub_2599A-11j
		mov	cl, [bp+var_7]
		nop
		mov	di, [bp+arg_0]
		nop
		call	sub_2634D

loc_2597E::				; CODE XREF: sub_2599A-4Dj
					; sub_2599A-41j ...
		jmp	loc_25CE2
; ---------------------------------------------------------------------------

loc_25981::				; CODE XREF: sub_2599A+3Ej
		mov	ch, 10h
		call	sub_27C24

loc_25986::				; CODE XREF: sub_2599A-46j
					; sub_2599A+32j
		mov	ax, 0C001h
		jmp	loc_25973
; ---------------------------------------------------------------------------

loc_2598B::				; CODE XREF: sub_2599A+39j
		mov	ch, 8
		jmp	loc_2596D
; ---------------------------------------------------------------------------

loc_2598F::				; CODE XREF: sub_2599A+5Aj
		mov	ax, [bp+var_12]
		or	ax, [bp+var_14]
		jnz	loc_259F6
		jmp	loc_25CEE
; END OF FUNCTION CHUNK	FOR sub_2599A

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_2599A	proc near		; CODE XREF: seg2333:082Ap
					; sub_26D36+Bp	...

var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= byte ptr -8
var_7		= byte ptr -7
var_6		= word ptr -6
arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8

; FUNCTION CHUNK AT 0434 SIZE 00000056 BYTES

		push	bp
		mov	bp, sp
		push	si
		push	di
		lea	sp, [bp-0Ch]
		mov	di, [bp+arg_2]
		mov	bx, [bp+arg_4]
		cld
		mov	al, [bx+0Ah]
		xor	al, [di+0Ah]
		mov	[bp+var_7], al
		mov	si, [di+8]
		mov	ax, [bx+8]
		cmp	si, 4001h
		jge	loc_25944
		cmp	ax, 4001h
		jge	loc_2595B
		cmp	si, 0C001h
		jle	loc_2596B
		cmp	ax, 0C001h
		jle	loc_25986
		sub	ax, si
		cmp	ax, 4001h
		jge	loc_2598B
		cmp	ax, 0C001h
		jle	loc_25981
		mov	dx, [di+6]
		push	dx
		mov	cx, [di+4]
		push	cx
		push	word ptr [di+2]
		push	word ptr [di]
		mov	[bp+var_6], ax
		mov	[bp+var_8], 0
		mov	di, [bx+6]
		mov	si, [bx+4]
		jcxz	loc_2598F

loc_259F6::				; CODE XREF: sub_2599A-5j
		xchg	ax, cx
		mov	cx, [bx+2]
		mov	bx, [bx]
		cmp	di, dx
		jb	loc_25A7A
		mov	[bp+var_8], 1
		sub	bx, [bp+var_14]
		sbb	cx, [bp+var_12]
		sbb	si, ax
		sbb	di, dx
		jnb	loc_25A7A
		sub	ax, ax
		cwd
		sub	ax, si
		sbb	dx, di
		div	[bp+var_E]
		mov	[bp+var_A], ax
		mul	[bp+var_E]
		add	si, ax
		adc	di, dx
		mov	ax, [bp+var_10]
		mul	[bp+var_A]
		add	cx, ax
		adc	si, dx
		adc	di, 0
		mov	ax, [bp+var_12]
		mul	[bp+var_A]
		add	bx, ax
		adc	cx, dx
		adc	si, 0
		adc	di, 0
		mov	ax, [bp+var_14]
		mul	[bp+var_A]
		neg	[bp+var_A]
		sbb	[bp+var_8], 0
		add	bx, dx
		adc	cx, 0
		adc	si, 0
		adc	di, 0
		xchg	ax, di
		jl	loc_25A75
		cmp	si, [bp+var_E]
		jb	loc_25A77
		add	[bp+var_A], 1
		adc	[bp+var_8], 0
		sub	di, [bp+var_14]
		sbb	bx, [bp+var_12]
		sbb	cx, [bp+var_10]
		sbb	si, [bp+var_E]

loc_25A75::				; CODE XREF: sub_2599A+C0j
		jl	loc_25ADD

loc_25A77::				; CODE XREF: sub_2599A+C5j
					; sub_2599A+122j
		jmp	loc_25B46
; ---------------------------------------------------------------------------

loc_25A7A::				; CODE XREF: sub_2599A+64j
					; sub_2599A+74j
		mov	ax, si
		mov	dx, di
		div	[bp+var_E]
		mov	[bp+var_A], ax
		mul	[bp+var_E]
		sub	si, ax
		sbb	di, dx
		mov	ax, [bp+var_10]
		mul	[bp+var_A]
		sub	cx, ax
		sbb	si, dx
		sbb	di, 0
		mov	ax, [bp+var_12]
		mul	[bp+var_A]
		sub	bx, ax
		sbb	cx, dx
		sbb	si, 0
		sbb	di, 0
		mov	ax, [bp+var_14]
		mul	[bp+var_A]
		neg	ax
		sbb	bx, dx
		sbb	cx, 0
		sbb	si, 0
		sbb	di, 0
		xchg	ax, di
		jge	loc_25A77
		mov	dx, si
		neg	dx
		cmp	dx, [bp+var_E]
		jb	loc_25ADD
		sub	[bp+var_A], 1
		sbb	[bp+var_8], 0
		add	di, [bp+var_14]
		adc	bx, [bp+var_12]
		adc	cx, [bp+var_10]
		adc	si, [bp+var_E]
		jge	loc_25B46

loc_25ADD::				; CODE XREF: sub_2599A:loc_25A75j
					; sub_2599A+12Bj
		sub	ax, ax
		cwd
		sub	ax, cx
		sbb	dx, si
		div	[bp+var_E]
		mov	[bp+var_C], ax
		mul	[bp+var_E]
		add	cx, ax
		adc	si, dx
		mov	ax, [bp+var_10]
		mul	[bp+var_C]
		add	bx, ax
		adc	cx, dx
		adc	si, 0
		mov	ax, [bp+var_12]
		mul	[bp+var_C]
		add	di, ax
		adc	bx, dx
		adc	cx, 0
		adc	si, 0
		mov	ax, [bp+var_14]
		mul	[bp+var_C]
		sub	ax, ax
		neg	[bp+var_C]
		sbb	[bp+var_A], ax
		sbb	[bp+var_8], al
		add	di, dx
		adc	bx, ax
		adc	cx, ax
		adc	si, ax
		jl	loc_25BA4
		cmp	cx, [bp+var_E]
		jb	loc_25B43
		add	[bp+var_C], 1
		adc	[bp+var_A], ax
		adc	[bp+var_8], al
		sub	di, [bp+var_12]
		sbb	bx, [bp+var_10]
		sbb	cx, [bp+var_E]
		jl	loc_25BA4

loc_25B43::				; CODE XREF: sub_2599A+192j
		jmp	loc_25BF9
; ---------------------------------------------------------------------------

loc_25B46::				; CODE XREF: sub_2599A:loc_25A77j
					; sub_2599A+141j
		mov	ax, cx
		mov	dx, si
		div	[bp+var_E]
		mov	[bp+var_C], ax
		mul	[bp+var_E]
		sub	cx, ax
		sbb	si, dx
		mov	ax, [bp+var_10]
		mul	[bp+var_C]
		sub	bx, ax
		sbb	cx, dx
		sbb	si, 0
		mov	ax, [bp+var_12]
		mul	[bp+var_C]
		sub	di, ax
		sbb	bx, dx
		sbb	cx, 0
		sbb	si, 0
		mov	ax, [bp+var_14]
		mul	[bp+var_C]
		sub	ax, ax
		sub	di, dx
		sbb	bx, ax
		sbb	cx, ax
		sbb	si, ax
		jge	loc_25BF9
		mov	dx, cx
		neg	dx
		cmp	dx, [bp+var_E]
		jb	loc_25BA4
		sub	[bp+var_C], 1
		sbb	[bp+var_A], ax
		sbb	[bp+var_8], al
		add	di, [bp+var_12]
		adc	bx, [bp+var_10]
		adc	cx, [bp+var_E]
		jge	loc_25BF9

loc_25BA4::				; CODE XREF: sub_2599A+18Dj
					; sub_2599A+1A7j ...
		sub	ax, ax
		cwd
		sub	ax, bx
		sbb	dx, cx
		div	[bp+var_E]
		mov	si, ax
		mul	[bp+var_E]
		add	bx, ax
		adc	cx, dx
		mov	ax, [bp+var_10]
		mul	si
		add	di, ax
		adc	bx, dx
		adc	cx, 0
		mov	ax, [bp+var_12]
		mul	si
		sub	ax, ax
		neg	si
		sbb	[bp+var_C], ax
		sbb	[bp+var_A], ax
		sbb	[bp+var_8], al
		add	di, dx
		adc	bx, ax
		adc	cx, ax
		jl	loc_25C41
		cmp	bx, [bp+var_E]
		jb	loc_25BF6
		add	si, 1
		adc	[bp+var_C], ax
		adc	[bp+var_A], ax
		adc	[bp+var_8], al
		sub	di, [bp+var_10]
		sbb	bx, [bp+var_E]
		jl	loc_25C41

loc_25BF6::				; CODE XREF: sub_2599A+246j
		jmp	loc_25C83
; ---------------------------------------------------------------------------

loc_25BF9::				; CODE XREF: sub_2599A:loc_25B43j
					; sub_2599A+1EAj ...
		mov	ax, bx
		mov	dx, cx
		div	[bp+var_E]
		mov	si, ax
		mul	[bp+var_E]
		sub	bx, ax
		sbb	cx, dx
		mov	ax, [bp+var_10]
		mul	si
		sub	di, ax
		sbb	bx, dx
		sbb	cx, 0
		mov	ax, [bp+var_12]
		mul	si
		sub	ax, ax
		sub	di, dx
		sbb	bx, ax
		sbb	cx, ax
		jge	loc_25C83
		mov	dx, bx
		neg	dx
		cmp	dx, [bp+var_E]
		jb	loc_25C41
		sub	si, 1
		sbb	[bp+var_C], ax
		sbb	[bp+var_A], ax
		sbb	[bp+var_8], al
		add	di, [bp+var_10]
		adc	bx, [bp+var_E]
		jge	loc_25C83

loc_25C41::				; CODE XREF: sub_2599A+241j
					; sub_2599A+25Aj ...
		mov	ax, [bp+var_10]
		shr	ax, 1
		neg	ax
		mov	cx, [bp+var_E]
		add	ax, cx
		sub	dx, dx
		sub	ax, di
		sbb	dx, bx
		mov	bx, [bp+var_C]
		mov	di, [bp+var_A]
		cmp	dx, cx
		jnb	loc_25C78
		div	cx
		sub	dx, cx
		neg	dx
		neg	ax

loc_25C65::				; CODE XREF: sub_2599A+2E2j
		mov	dl, [bp+var_8]
		sbb	si, 0
		jnb	loc_25CA1
		sbb	bx, 0
		sbb	di, 0
		sbb	dl, 0
		jmp	loc_25CA1
; ---------------------------------------------------------------------------

loc_25C78::				; CODE XREF: sub_2599A+2C1j
		sub	ax, ax
		cwd
		stc
		jmp	loc_25C65
; ---------------------------------------------------------------------------

loc_25C7E::				; CODE XREF: sub_2599A+300j
		sub	ax, ax
		cwd
		jmp	loc_25C9E
; ---------------------------------------------------------------------------

loc_25C83::				; CODE XREF: sub_2599A:loc_25BF6j
					; sub_2599A+288j ...
		mov	ax, [bp+var_10]
		shr	ax, 1
		neg	ax
		cwd
		add	ax, di
		adc	dx, bx
		mov	bx, [bp+var_C]
		mov	di, [bp+var_A]
		mov	cx, [bp+var_E]
		cmp	dx, cx
		jnb	loc_25C7E
		div	cx

loc_25C9E::				; CODE XREF: sub_2599A+2E7j
					; sub_2599A+375j
		mov	dl, [bp+var_8]

loc_25CA1::				; CODE XREF: sub_2599A+2D1j
					; sub_2599A+2DCj
		shr	dl, 1
		jnb	loc_25CB2
		rcr	di, 1
		rcr	bx, 1
		rcr	si, 1
		rcr	ax, 1
		rcr	dh, 1
		inc	[bp+var_6]

loc_25CB2::				; CODE XREF: sub_2599A+309j
		shr	cx, 1
		sub	ch, dh
		mov	cx, [bp+var_6]
		adc	ax, 0
		jnb	loc_25CC9
		adc	si, ax
		adc	bx, ax
		adc	di, ax
		jnb	loc_25CC9
		rcr	di, 1
		inc	cx

loc_25CC9::				; CODE XREF: sub_2599A+322j
					; sub_2599A+32Aj
		cmp	cx, 4001h
		jge	loc_25CEB
		mov	dx, di
		mov	di, [bp+arg_0]
		cld
		stosw
		xchg	ax, si
		stosw
		xchg	ax, bx
		stosw
		xchg	ax, dx
		stosw
		xchg	ax, cx
		stosw
		mov	al, [bp+var_7]
		stosb

loc_25CE2::				; CODE XREF: sub_2599A:loc_2597Ej
		lea	sp, [bp-4]
		pop	di
		pop	si
		pop	bp
		retn	6
; ---------------------------------------------------------------------------

loc_25CEB::				; CODE XREF: sub_2599A+333j
		jmp	loc_25970
; ---------------------------------------------------------------------------

loc_25CEE::				; CODE XREF: sub_2599A-3j
		mov	cx, dx
		mov	dx, di
		xchg	ax, si
		cmp	dx, cx
		jb	loc_25CFD
		sub	dx, cx
		mov	[bp+var_8], 1

loc_25CFD::				; CODE XREF: sub_2599A+35Bj
		div	cx
		xchg	ax, di
		mov	ax, [bx+2]
		div	cx
		mov	bx, [bx]
		xchg	ax, bx
		div	cx
		xchg	ax, si
		sub	ax, ax
		div	cx
		jmp	loc_25C9E
sub_2599A	endp ; sp-analysis failed

; ---------------------------------------------------------------------------
		mov	si, word_2826C

loc_25D15::				; DATA XREF: seg2333:2554o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	ax, [si+8]
		cmp	ax, 0C001h
		jle	loc_25D4B
		cmp	ax, 4001h
		jge	loc_25D4F
		cmp	byte ptr [si+0Ah], 0
		jnz	loc_25D59
		call	sub_2637B
		call	sub_25D6A
		mov	di, word_2826C
		push	si
		push	di
		push	si
		call	sub_2599A
		push	di
		push	si
		push	si
		call	sub_25603
		dec	word ptr [si+8]
		add	word_2826C, 0Ch

loc_25D4B::				; CODE XREF: seg2333:0810j
					; seg2333:0847j ...
		pop	di
		pop	si
		pop	bp
		retn
; ---------------------------------------------------------------------------

loc_25D4F::				; CODE XREF: seg2333:0815j
		mov	bx, 0FFFFh
		mov	di, si
		call	sub_25522
		jmp	loc_25D4B
; ---------------------------------------------------------------------------

loc_25D59::				; CODE XREF: seg2333:081Bj
		mov	ch, 1
		call	sub_27C24
		mov	di, si
		call	sub_26337
		mov	word ptr [di+8], 4001h
		jmp	loc_25D4B

; =============== S U B	R O U T	I N E =======================================


sub_25D6A	proc near		; CODE XREF: seg2333:0820p
		push	si
		push	di
		mov	di, word_2826C
		mov	bx, [di+8]
		mov	dx, [di+6]
		mov	ax, [di+4]
		mov	cx, [di+2]
		sar	bx, 1
		jnb	loc_25D87
		inc	bx
		shr	dx, 1
		rcr	ax, 1
		rcr	cx, 1

loc_25D87::				; CODE XREF: sub_25D6A+14j
		cmp	dx, 0FFFEh
		jnb	loc_25DA9
		push	bx
		push	cx
		mov	cx, dx
		mov	bx, ax
		mov	si, dx
		stc
		rcr	si, 1

loc_25D97::				; CODE XREF: sub_25D6A+3Dj
		div	si
		dec	si
		cmp	si, ax
		jbe	loc_25DB0
		inc	si
		add	si, ax
		rcr	si, 1
		mov	dx, cx
		mov	ax, bx
		jmp	loc_25D97
; ---------------------------------------------------------------------------

loc_25DA9::				; CODE XREF: sub_25D6A+20j
		stc
		rcr	dx, 1
		rcr	ax, 1
		jmp	loc_25DC7
; ---------------------------------------------------------------------------

loc_25DB0::				; CODE XREF: sub_25D6A+32j
		inc	si
		cmp	si, ax
		jnb	loc_25DB6
		xchg	ax, si

loc_25DB6::				; CODE XREF: sub_25D6A+49j
		pop	cx
		pop	bx
		xchg	ax, cx
		div	si
		sub	dx, dx
		add	si, cx
		rcr	si, 1
		rcr	ax, 1
		adc	ax, dx
		adc	dx, si

loc_25DC7::				; CODE XREF: sub_25D6A+44j
		cld
		sub	cx, cx
		xchg	ax, cx
		stosw
		stosw
		xchg	ax, cx
		stosw
		xchg	ax, dx
		stosw
		xchg	ax, bx
		stosw
		mov	al, 0
		stosb
		pop	di
		pop	si
		retn
sub_25D6A	endp

; ---------------------------------------------------------------------------
		db 0
; ---------------------------------------------------------------------------
		add	al, [bx+si+42h]
		add	[bp+di], ax
		inc	cx
		inc	bx

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_25DE1	proc near		; CODE XREF: seg2333:1C3Cp
					; DATA XREF: seg2333:2550o

var_A		= word ptr -0Ah
var_4		= word ptr -4
var_2		= byte ptr -2

		push	bp
		mov	bp, sp
		push	word ptr [di+0Ah]
		lea	sp, [bp-6]
		push	si
		push	di
		mov	ax, [di]
		mov	bx, [di+2]
		mov	cx, [di+4]
		mov	dx, [di+6]
		mov	[bp+var_4], 0
		mov	di, [di+8]
		sub	di, [si+8]
		jge	loc_25E1B
		jmp	loc_25E57
; ---------------------------------------------------------------------------

loc_25E06::				; CODE XREF: sub_25DE1+29j
		inc	di
		jmp	loc_25E46
; ---------------------------------------------------------------------------

loc_25E09::				; CODE XREF: sub_25DE1+38j
					; sub_25DE1+3Fj ...
		dec	di
		jl	loc_25E06
		shl	[bp+var_4], 1
		shl	ax, 1
		rcl	bx, 1
		rcl	cx, 1
		adc	dx, dx
		jb	loc_25E34
		jns	loc_25E09

loc_25E1B::				; CODE XREF: sub_25DE1+21j
		cmp	dx, [si+6]
		ja	loc_25E34
		jb	loc_25E09
		cmp	cx, [si+4]
		ja	loc_25E34
		jb	loc_25E09
		cmp	bx, [si+2]
		ja	loc_25E34
		jb	loc_25E09
		cmp	ax, [si]
		jb	loc_25E09

loc_25E34::				; CODE XREF: sub_25DE1+36j
					; sub_25DE1+3Dj ...
		inc	[bp+var_4]
		sub	ax, [si]
		sbb	bx, [si+2]
		sbb	cx, [si+4]
		sbb	dx, [si+6]
		or	di, di
		jg	loc_25E09

loc_25E46::				; CODE XREF: sub_25DE1+26j
					; sub_25DE1+B8j ...
		or	dx, dx
		js	loc_25E57
		jz	loc_25E8F

loc_25E4C::				; CODE XREF: sub_25DE1+74j
		dec	di
		shl	ax, 1
		rcl	bx, 1
		rcl	cx, 1
		adc	dx, dx
		jns	loc_25E4C

loc_25E57::				; CODE XREF: sub_25DE1+23j
					; sub_25DE1+67j
		add	di, [si+8]

loc_25E5A::				; CODE XREF: sub_25DE1+D9j
		push	di
		mov	di, [bp+var_A]
		stosw
		xchg	ax, bx
		stosw
		xchg	ax, cx
		stosw
		xchg	ax, dx
		stosw
		pop	ax
		stosw
		mov	al, [bp+var_2]
		stosb
		and	byte ptr dataseg@+1, 0B8h
		mov	di, 7
		mov	ax, [bp+var_4]
		cmp	[bp+var_2], 1
		jnz	loc_25E7E
		neg	ax

loc_25E7E::				; CODE XREF: sub_25DE1+99j
		and	di, ax
		mov	dl, cs:[di+8C9h]
		or	byte ptr dataseg@+1, dl
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retn
; ---------------------------------------------------------------------------

loc_25E8F::				; CODE XREF: sub_25DE1+69j
		xchg	dx, cx
		xchg	cx, bx
		xchg	ax, bx
		sub	di, 10h
		or	dx, dx
		jnz	loc_25E46
		xchg	dx, cx
		xchg	cx, bx
		sub	di, 10h
		or	dx, dx
		jnz	loc_25E46
		xchg	dx, cx
		sub	di, 10h
		or	dx, dx
		jnz	loc_25E46
		mov	di, 0C001h
		sub	dx, dx
		sub	cx, cx
		sub	bx, bx
		sub	ax, ax
		jmp	loc_25E5A
sub_25DE1	endp

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_25EE9

loc_25EBC::				; CODE XREF: sub_25EE9+14j
		mov	dx, [si+6]
		and	dh, 7Fh
		or	dx, [si]
		or	dx, [si+2]
		or	dx, [si+4]
		jz	loc_25EFF

loc_25ECC::				; CODE XREF: sub_25EE9-4j
		mov	ch, 1
		call	sub_27C24
		mov	ax, 4500h
		jmp	loc_25F67
; ---------------------------------------------------------------------------

loc_25ED7::				; CODE XREF: sub_25EE9+1Aj
		mov	dx, [di+6]
		and	dh, 7Fh
		or	dx, [di]
		or	dx, [di+2]
		or	dx, [di+4]
		jnz	loc_25ECC
		jmp	loc_25F05
; END OF FUNCTION CHUNK	FOR sub_25EE9

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_25EE9	proc near		; CODE XREF: sub_26D36+28p
					; sub_277A8+3j

arg_0		= word ptr  4
arg_2		= word ptr  6

; FUNCTION CHUNK AT 09AC SIZE 0000002D BYTES

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, [bp+arg_2]
		mov	di, [bp+arg_0]
		mov	ax, [si+8]
		mov	bx, [di+8]
		cmp	ax, 4001h
		jge	loc_25EBC

loc_25EFF::				; CODE XREF: sub_25EE9-1Fj
		cmp	bx, 4001h
		jge	loc_25ED7

loc_25F05::				; CODE XREF: sub_25EE9-2j
		mov	dx, ax
		cmp	ax, bx
		jg	loc_25F0D
		mov	dx, bx

loc_25F0D::				; CODE XREF: sub_25EE9+20j
		cmp	dx, 0C001h
		jle	loc_25F4E
		mov	cl, [si+0Ah]
		cmp	cl, [di+0Ah]
		jl	loc_25F64
		jg	loc_25F5A
		cmp	ax, bx
		jl	loc_25F55
		jg	loc_25F5F
		mov	ax, [si+6]
		cmp	ax, [di+6]
		jnz	loc_25F53
		mov	ch, 3
		and	ch, byte ptr word_28262+1
		jz	loc_25F71
		mov	ax, [si+4]
		cmp	ax, [di+4]
		jnz	loc_25F53
		mov	ax, [si+2]
		cmp	ax, [di+2]
		jnz	loc_25F53
		cmp	ch, 2
		jz	loc_25F93
		mov	ax, [si]
		cmp	ax, [di]
		jnz	loc_25F53

loc_25F4E::				; CODE XREF: sub_25EE9+28j
					; sub_25EE9+9Fj ...
		mov	ax, 4000h
		jmp	loc_25F67
; ---------------------------------------------------------------------------

loc_25F53::				; CODE XREF: sub_25EE9+40j
					; sub_25EE9+50j ...
		ja	loc_25F5F

loc_25F55::				; CODE XREF: sub_25EE9+36j
					; sub_25EE9+A1j ...
		cmp	cl, 0
		jnz	loc_25F64

loc_25F5A::				; CODE XREF: sub_25EE9+32j
					; sub_25EE9+79j
		mov	ax, 100h
		jmp	loc_25F67
; ---------------------------------------------------------------------------

loc_25F5F::				; CODE XREF: sub_25EE9+38j
					; sub_25EE9:loc_25F53j	...
		cmp	cl, 0
		jnz	loc_25F5A

loc_25F64::				; CODE XREF: sub_25EE9+30j
					; sub_25EE9+6Fj
		mov	ax, 0

loc_25F67::				; CODE XREF: sub_25EE9-15j
					; sub_25EE9+68j ...
		mov	byte ptr dataseg@+1, ah
		pop	di
		pop	si
		pop	bp
		retn	4
; ---------------------------------------------------------------------------

loc_25F71::				; CODE XREF: sub_25EE9+48j
		mov	bx, [si]
		sub	bx, [di]
		mov	bx, [si+2]
		sbb	bx, [di+2]
		mov	bx, [si+4]
		sbb	bx, [di+4]
		ja	loc_25F8C
		neg	bx
		and	bx, 0FF80h
		jz	loc_25F4E
		jmp	loc_25F55
; ---------------------------------------------------------------------------

loc_25F8C::				; CODE XREF: sub_25EE9+98j
		and	bx, 0FF80h
		jz	loc_25F4E
		jmp	loc_25F5F
; ---------------------------------------------------------------------------

loc_25F93::				; CODE XREF: sub_25EE9+5Dj
		mov	bx, [si]
		sub	bx, [di]
		ja	loc_25FA2
		neg	bx
		and	bh, 0FCh
		jz	loc_25F4E
		jmp	loc_25F55
; ---------------------------------------------------------------------------

loc_25FA2::				; CODE XREF: sub_25EE9+AEj
		and	bh, 0FCh
		jz	loc_25F4E
		jmp	loc_25F5F
sub_25EE9	endp


; =============== S U B	R O U T	I N E =======================================


sub_25FA9	proc near		; CODE XREF: sub_27A82+2Fp
					; sub_27A82+45j ...
		mov	ax, 4000h
		cmp	word ptr [si+8], 0C001h
		jle	loc_25FC6
		cmp	word ptr [si+8], 4001h
		jge	loc_25FCB

loc_25FBA::				; CODE XREF: sub_25FA9+30j
		mov	ax, 100h
		cmp	byte ptr [si+0Ah], 1
		jz	loc_25FC6
		mov	ax, 0

loc_25FC6::				; CODE XREF: sub_25FA9+8j
					; sub_25FA9+18j ...
		mov	byte ptr dataseg@+1, ah
		retn
; ---------------------------------------------------------------------------

loc_25FCB::				; CODE XREF: sub_25FA9+Fj
		mov	dx, [si+6]
		and	dh, 7Fh
		or	dx, [si]
		or	dx, [si+2]
		or	dx, [si+4]
		jz	loc_25FBA
		mov	ch, 1
		call	sub_27C24
		mov	ax, 4500h
		jmp	loc_25FC6
sub_25FA9	endp


; =============== S U B	R O U T	I N E =======================================


sub_25FE5	proc near		; CODE XREF: sub_27A82+2Fp
					; sub_27A82+45j ...
		mov	ax, 4000h
		cmp	word ptr [si+8], 0C001h
		jle	loc_26002
		cmp	word ptr [si+8], 4001h
		jge	loc_26007
		mov	ax, 400h

loc_25FF9::				; CODE XREF: sub_25FE5+33j
					; sub_25FE5+38j
		cmp	byte ptr [si+0Ah], 1
		jnz	loc_26002
		or	ax, 200h

loc_26002::				; CODE XREF: sub_25FE5+8j
					; sub_25FE5+18j
		mov	byte ptr dataseg@+1, ah
		retn
; ---------------------------------------------------------------------------

loc_26007::				; CODE XREF: sub_25FE5+Fj
		mov	ax, 500h
		mov	dx, [si+6]
		and	dh, 7Fh
		or	dx, [si]
		or	dx, [si+2]
		or	dx, [si+4]
		jz	loc_25FF9
		mov	ax, 100h
		jmp	loc_25FF9
sub_25FE5	endp


; =============== S U B	R O U T	I N E =======================================


sub_2601F	proc near		; CODE XREF: seg2333:21A4j
					; seg2333:2222j ...
		mov	ax, [si+4]
		mov	dx, [si+6]
		mov	bx, [si+8]
		mov	cl, [si+0Ah]
		cmp	word ptr [si], 0
		jnz	loc_2603F
		cmp	word ptr [si+2], 0
		jnz	loc_2603F
		test	al, 7Fh
		jnz	loc_2603F
		test	ah, 1
		jz	loc_2604E

loc_2603F::				; CODE XREF: sub_2601F+Fj
					; sub_2601F+15j ...
		add	al, al
		adc	ah, 0
		adc	dx, 0
		jnb	loc_2604E
		rcr	dx, 1
		rcr	ax, 1
		inc	bx

loc_2604E::				; CODE XREF: sub_2601F+1Ej
					; sub_2601F+28j
		add	bx, 7Eh	; '~'
		jle	loc_26085
		cmp	bx, 0FFh
		jge	loc_26070

loc_26059::				; CODE XREF: sub_2601F+64j
					; sub_2601F+78j
		shl	dx, 1
		shr	cl, 1
		rcr	bl, 1
		rcr	dx, 1
		mov	al, ah
		mov	ah, dl
		mov	dl, dh
		mov	dh, bl
		stosw
		xchg	ax, dx
		stosw
		sub	di, 4
		retn
; ---------------------------------------------------------------------------

loc_26070::				; CODE XREF: sub_2601F+38j
		cmp	word ptr [si+8], 4001h
		jge	loc_26080
		mov	ch, 8
		call	sub_27C24
		sub	dx, dx
		sub	ax, ax

loc_26080::				; CODE XREF: sub_2601F+56j
		mov	bx, 0FFh
		jmp	loc_26059
; ---------------------------------------------------------------------------

loc_26085::				; CODE XREF: sub_2601F+32j
		cmp	word ptr [si+8], 0C001h
		jle	loc_26091
		mov	ch, 10h
		call	sub_27C24

loc_26091::				; CODE XREF: sub_2601F+6Bj
		sub	bx, bx
		mov	dx, bx
		mov	ax, bx
		jmp	loc_26059
sub_2601F	endp


; =============== S U B	R O U T	I N E =======================================


sub_26099	proc near		; CODE XREF: seg2333:21A4j
					; seg2333:2222j ...
		mov	ax, es:[si]
		mov	dx, es:[si+2]
		push	si
		sub	si, si
		shl	dx, 1
		rcl	si, 1
		sub	bx, bx
		add	bl, dh
		jz	loc_260DB
		cmp	dh, 0FFh
		jz	loc_260D6
		sub	bx, 7Eh	; '~'

loc_260B5::				; CODE XREF: sub_26099+40j
		stc
		rcr	dl, 1

loc_260B8::				; CODE XREF: sub_26099+51j
					; sub_26099+59j
		mov	dh, dl
		mov	dl, ah
		mov	ch, al
		mov	cl, 0
		sub	ax, ax
		mov	[di], ax
		mov	[di+2],	ax
		mov	[di+4],	cx
		mov	[di+6],	dx
		mov	[di+8],	bx
		xchg	ax, si
		mov	[di+0Ah], al
		pop	si
		retn
; ---------------------------------------------------------------------------

loc_260D6::				; CODE XREF: sub_26099+17j
		mov	bx, 4001h
		jmp	loc_260B5
; ---------------------------------------------------------------------------

loc_260DB::				; CODE XREF: sub_26099+12j
		mov	cx, dx
		or	cx, ax
		jz	loc_260EF
		sub	bx, 7Eh	; '~'
		shr	dl, 1

loc_260E6::				; CODE XREF: sub_26099+54j
		add	ax, ax
		adc	dl, dl
		js	loc_260B8
		dec	bx
		jmp	loc_260E6
; ---------------------------------------------------------------------------

loc_260EF::				; CODE XREF: sub_26099+46j
		mov	bx, 0C001h
		jmp	loc_260B8
sub_26099	endp

; ---------------------------------------------------------------------------
		mov	es, cx

; =============== S U B	R O U T	I N E =======================================


sub_260F6	proc near		; CODE XREF: seg2333:21A4j
					; seg2333:2222j ...
		push	di
		mov	ax, [si+1]
		mov	di, [si+3]
		mov	cx, [si+5]
		mov	dl, [si+7]
		mov	bx, [si+8]
		mov	dh, 3
		and	dh, al
		or	dh, [si]
		jnz	loc_26112
		test	al, 8
		jz	loc_26123

loc_26112::				; CODE XREF: sub_260F6+16j
		add	ax, 4
		adc	di, 0
		adc	cx, 0
		adc	dl, 0
		jnb	loc_26123
		rcr	dl, 1
		inc	bx

loc_26123::				; CODE XREF: sub_260F6+1Aj
					; sub_260F6+28j
		add	bx, 3FEh
		jle	loc_2616B
		cmp	bx, 7FFh
		jge	loc_26178

loc_2612F::				; CODE XREF: sub_260F6+A1j
		and	al, 0F8h
		shl	dl, 1
		shr	bx, 1
		rcr	dl, 1
		or	al, bh
		mov	dh, bl
		mov	bx, di
		shr	di, 1
		rcr	ax, 1
		rcr	dx, 1
		rcr	cx, 1
		rcr	bx, 1
		shr	di, 1
		rcr	ax, 1
		rcr	dx, 1
		rcr	cx, 1
		rcr	bx, 1
		or	al, [si+0Ah]
		shr	di, 1
		rcr	ax, 1
		rcr	dx, 1
		rcr	cx, 1
		rcr	bx, 1

loc_2615E::				; CODE XREF: sub_260F6+9Cj
		pop	di
		cld
		stosw
		xchg	ax, bx
		stosw
		xchg	ax, cx
		stosw
		xchg	ax, dx
		stosw
		sub	di, 8
		retn
; ---------------------------------------------------------------------------

loc_2616B::				; CODE XREF: sub_260F6+31j
		sub	dx, dx
		cmp	word ptr [si+8], 0C001h
		jle	loc_26187
		mov	ch, 10h
		jmp	loc_26184
; ---------------------------------------------------------------------------

loc_26178::				; CODE XREF: sub_260F6+37j
		cmp	word ptr [si+8], 4001h
		jge	loc_26194
		mov	dx, 0FFE0h
		mov	ch, 8

loc_26184::				; CODE XREF: sub_260F6+80j
		call	sub_27C24

loc_26187::				; CODE XREF: sub_260F6+7Cj
		or	dl, [si+0Ah]
		ror	dx, 1
		sub	cx, cx
		mov	bx, cx
		mov	ax, cx
		jmp	loc_2615E
; ---------------------------------------------------------------------------

loc_26194::				; CODE XREF: sub_260F6+87j
		mov	bx, 7FFh
		jmp	loc_2612F
sub_260F6	endp

; ---------------------------------------------------------------------------
		mov	si, bx
		mov	es, ax
		assume es:nothing

; =============== S U B	R O U T	I N E =======================================


sub_2619D	proc near		; CODE XREF: seg2333:21A4j
					; seg2333:2222j ...
		mov	dx, es:[si+6]
		mov	cx, 5
		shl	dx, 1
		rcl	ch, 1
		mov	[di+0Ah], ch
		shr	dx, cl
		jz	loc_26212
		cmp	dx, 7FFh
		jz	loc_261F8
		mov	bl, 10h
		sub	dx, 3FEh

loc_261BB::				; CODE XREF: sub_2619D+73j
					; sub_2619D+8Cj
		mov	[di+8],	dx
		mov	dx, es:[si+5]
		and	dh, 0Fh
		or	dh, bl
		mov	cx, es:[si+3]
		mov	bx, es:[si+1]
		mov	ah, es:[si]
		mov	al, 0
		shl	ax, 1
		rcl	bx, 1
		rcl	cx, 1
		rcl	dx, 1
		shl	ax, 1
		rcl	bx, 1
		rcl	cx, 1
		rcl	dx, 1
		shl	ax, 1
		rcl	bx, 1
		rcl	cx, 1
		rcl	dx, 1

loc_261EC::				; CODE XREF: sub_2619D+BAj
		mov	[di], ax
		mov	[di+2],	bx
		mov	[di+4],	cx
		mov	[di+6],	dx
		retn
; ---------------------------------------------------------------------------

loc_261F8::				; CODE XREF: sub_2619D+16j
		mov	bx, 0Fh
		and	bl, es:[si+6]
		or	bx, es:[si+4]
		or	bx, es:[si+2]
		or	bx, es:[si]
		mov	dx, 4001h
		or	bl, 10h
		jmp	loc_261BB
; ---------------------------------------------------------------------------

loc_26212::				; CODE XREF: sub_2619D+10j
		mov	bx, 0Fh
		and	bl, es:[si+6]
		or	bx, es:[si+4]
		or	bx, es:[si+2]
		or	bx, es:[si]
		jnz	loc_2622B
		mov	dx, 0C001h
		jmp	loc_261BB
; ---------------------------------------------------------------------------

loc_2622B::				; CODE XREF: sub_2619D+87j
		mov	dx, es:[si+5]
		and	dh, 0Fh
		mov	cx, es:[si+3]
		mov	bx, es:[si+1]
		mov	ah, es:[si]
		mov	al, 4

loc_2623F::				; CODE XREF: sub_2619D+ACj
		dec	al
		shl	ah, 1
		rcl	bx, 1
		rcl	cx, 1
		adc	dx, dx
		jns	loc_2623F
		push	ax
		mov	ah, 0
		sub	ax, 4FEh
		mov	[di+8],	ax
		pop	ax
		mov	al, 0
		jmp	loc_261EC
sub_2619D	endp

; ---------------------------------------------------------------------------
		mov	es, cx
		assume es:nothing

; =============== S U B	R O U T	I N E =======================================


sub_2625B	proc near		; CODE XREF: sub_2786C+10p
					; sub_27938+4p
		cld
		movsw
		movsw
		movsw
		movsw
		lodsw
		mov	cl, [si]
		cmp	ax, 4001h
		jge	loc_2627B
		add	ax, 3FFEh
		jl	loc_26280

loc_2626D::				; CODE XREF: sub_2625B+23j
					; sub_2625B+27j
		shl	ax, 1
		shr	cl, 1
		rcr	ax, 1
		stosw
		sub	di, 0Ah
		sub	si, 0Ah
		retn
; ---------------------------------------------------------------------------

loc_2627B::				; CODE XREF: sub_2625B+Bj
		mov	ax, 7FFFh
		jmp	loc_2626D
; ---------------------------------------------------------------------------

loc_26280::				; CODE XREF: sub_2625B+10j
		sub	ax, ax
		jmp	loc_2626D
sub_2625B	endp

; ---------------------------------------------------------------------------
		mov	si, bx
		mov	es, ax
		assume es:nothing

; =============== S U B	R O U T	I N E =======================================


sub_26288	proc near		; CODE XREF: sub_27890+1Cp
					; sub_2790E+7p
		push	si
		mov	cx, ds
		mov	dx, es
		mov	es, cx
		assume es:seg2608
		mov	ds, dx
		assume ds:nothing
		std
		lea	si, [si+8]
		lea	di, [di+0Ah]
		lodsw
		xchg	ax, bx
		sub	ax, ax
		shl	bx, 1
		rcl	ax, 1
		stosb
		dec	di
		shr	bx, 1
		jz	loc_262B9
		sub	bx, 3FFEh
		xchg	ax, bx
		stosw
		movsw
		movsw
		movsw
		movsw

loc_262B0::				; CODE XREF: sub_26288+3Bj
		cld
		mov	es, dx
		assume es:nothing
		mov	ds, cx
		assume ds:seg2608
		inc	di
		inc	di
		pop	si
		retn
; ---------------------------------------------------------------------------

loc_262B9::				; CODE XREF: sub_26288+1Cj
		mov	ax, 0C001h
		stosw
		sub	ax, ax
		stosw
		stosw
		stosw
		stosw
		jmp	loc_262B0
sub_26288	endp

; ---------------------------------------------------------------------------
word_262C5	dw 0			; DATA XREF: sub_262D1o
		dw 0
		dw 0
		dw 8000h
		dw 1
		dw 0

; =============== S U B	R O U T	I N E =======================================


sub_262D1	proc near		; CODE XREF: sub_26D36+77p
					; sub_270A6+14p ...
		mov	ax, offset word_262C5
		jmp	loc_2633A
sub_262D1	endp

; ---------------------------------------------------------------------------
word_262D6	dw 8AFEh		; DATA XREF: seg2333:loc_262E2o
		dw 0CD1Bh
		dw 784Bh
		dw 0D49Ah
		dw 2
		dw 0
; ---------------------------------------------------------------------------

loc_262E2::				; DATA XREF: seg2333:loc_272C8o
					; seg2333:2532o
		mov	ax, offset word_262D6
		jmp	loc_2633A
; ---------------------------------------------------------------------------
word_262E7	dw 0F0BBh		; DATA XREF: sub_262F3o
		dw 5C17h
		dw 3B29h
		dw 0B8AAh
		dw 1
		dw 0

; =============== S U B	R O U T	I N E =======================================


sub_262F3	proc near		; CODE XREF: seg2333:1DC8p
					; DATA XREF: seg2333:loc_272B8o ...
		mov	ax, offset word_262E7
		jmp	loc_2633A
sub_262F3	endp

; ---------------------------------------------------------------------------
byte_262F8	db 35h,	0C2h, 68h, 21h,	0A2h, 0DAh, 0Fh, 0C9h, 2, 3 dup(0)
					; DATA XREF: sub_26304o

; =============== S U B	R O U T	I N E =======================================


sub_26304	proc near		; CODE XREF: seg2333:1C33p
					; seg2333:1C5Bp ...
		mov	ax, offset byte_262F8
		jmp	loc_2633A
sub_26304	endp

; ---------------------------------------------------------------------------
word_26309	dw 0F799h		; DATA XREF: sub_26315o
		dw 0FBCFh
		dw 9A84h
		dw 9A20h
		dw 0FFFFh
		dw 0

; =============== S U B	R O U T	I N E =======================================


sub_26315	proc near		; CODE XREF: seg2333:1D68p
					; DATA XREF: seg2333:2538o
		mov	ax, offset word_26309
		jmp	loc_2633A
sub_26315	endp

; ---------------------------------------------------------------------------
word_2631A	dw 79ACh		; DATA XREF: sub_26326o
		dw 0D1CFh
		dw 17F7h
		dw 0B172h
		dw 0
		dw 0

; =============== S U B	R O U T	I N E =======================================


sub_26326	proc near		; CODE XREF: sub_26EBE+Ep
					; seg2333:1D44p
					; DATA XREF: ...
		mov	ax, offset word_2631A
		jmp	loc_2633A
sub_26326	endp

; ---------------------------------------------------------------------------
word_2632B	dw 0			; DATA XREF: sub_26337o
		dw 0
		dw 0
		dw 0
		dw 0C001h
		dw 0

; =============== S U B	R O U T	I N E =======================================


sub_26337	proc near		; CODE XREF: seg2333:0850p
					; sub_26FB6+58p ...
		mov	ax, offset word_2632B

loc_2633A::				; CODE XREF: sub_262D1+3j
					; seg2333:0DD5j ...
		push	ds
		mov	cx, cs
		mov	ds, cx
		assume ds:seg2333
		xchg	ax, si
		cld
		mov	cx, 5
		rep movsw
		movsb
		sub	di, 0Bh
		xchg	ax, si
		pop	ds
		assume ds:seg2608
		retn
sub_26337	endp


; =============== S U B	R O U T	I N E =======================================


sub_2634D	proc near		; CODE XREF: sub_257CD-4Bp
					; sub_2599A-1Fp ...
		cld
		push	di
		push	ax
		cmp	ax, 0C001h
		mov	ax, 0
		stosw
		stosw
		stosw
		rcr	ax, 1
		stosw
		pop	ax
		stosw
		mov	al, cl
		stosb
		pop	di
		retn
sub_2634D	endp


; =============== S U B	R O U T	I N E =======================================


sub_26363	proc near		; CODE XREF: sub_25603-4Bp
					; sub_257CD-16p ...
		mov	ch, 1
		call	sub_27C24
		push	di
		sub	ax, ax
		cld
		stosw
		stosw
		stosw
		mov	ah, 0C0h ; 'À'
		stosw
		mov	ax, 4001h
		stosw
		mov	al, 1
		stosb
		pop	di
		retn
sub_26363	endp


; =============== S U B	R O U T	I N E =======================================


sub_2637B	proc near		; CODE XREF: seg2333:081Dp sub_26C0Fp	...
		push	di
		push	es
		mov	di, ss
		mov	es, di
		assume es:nothing
		sub	word_2826C, 0Ch
		mov	di, word_2826C
		cld
		mov	cx, 5
		rep movsw
		movsb
		pop	es
		pop	di
		sub	si, 0Bh
		retn
sub_2637B	endp


; =============== S U B	R O U T	I N E =======================================


sub_26397	proc near		; CODE XREF: sub_26A5E+13p
					; sub_26D36+1Ep ...
		push	si
		push	di
		sub	word_2826C, 0Ch
		mov	di, word_2826C
		push	ds
		push	es
		push	ds
		pop	es
		assume es:seg2608
		push	cs
		pop	ds
		assume ds:seg2333
		cld
		mov	cx, 5
		rep movsw
		movsb
		pop	es
		assume es:nothing
		pop	ds
		assume ds:seg2608
		pop	di
		pop	si
		retn
sub_26397	endp


; =============== S U B	R O U T	I N E =======================================


sub_263B4	proc near		; CODE XREF: sub_26DE9+Dp
		push	si
		mov	si, word_2826C
		cld
		mov	cx, 5
		rep movsw
		movsb
		inc	si
		mov	word_2826C, si
		sub	di, 0Bh
		pop	si
		retn
sub_263B4	endp


; =============== S U B	R O U T	I N E =======================================


sub_263CA	proc near		; CODE XREF: sub_26C40+6p
					; sub_270A6+26p ...
		push	si
		push	di
		push	es
		mov	si, word_2826C
		lea	di, [si-0Ch]
		mov	word_2826C, di
		cld
		mov	cx, ss
		mov	es, cx
		mov	cx, 5
		rep movsw
		movsb
		pop	es
		pop	di
		pop	si
		retn
sub_263CA	endp


; =============== S U B	R O U T	I N E =======================================


sub_263E7	proc near		; CODE XREF: seg2333:1CFAp
					; seg2333:loc_2727Bp
		push	si
		push	di
		mov	si, word_2826C
		mov	di, si
		cld
		push	es
		mov	cx, ss
		mov	es, cx
		mov	cx, 5

loc_263F8::				; CODE XREF: sub_263E7+16j
		lodsw
		xchg	ax, [di+0Ch]
		stosw
		loop	loc_263F8
		lodsb
		xchg	al, [di+0Ch]
		stosb
		pop	es
		pop	di
		pop	si
		retn
sub_263E7	endp


; =============== S U B	R O U T	I N E =======================================


sub_26408	proc near		; CODE XREF: sub_264EE+1Ep
					; sub_26FB6+96p ...
		mov	ax, es:[si]
		sub	cx, cx
		cwd
		xor	ax, dx
		sub	ax, dx
		jz	loc_26446
		and	dl, 1

loc_26417::				; CODE XREF: sub_26408+3Cj
		mov	bx, cx
		xchg	ax, cx
		shl	ax, 1

loc_2641C::				; CODE XREF: sub_26408+20j
		rcr	ax, 1
		inc	bx
		shr	cx, 1
		rcr	ax, 1
		jcxz	loc_2642C
		inc	bx
		shr	cx, 1
		jnz	loc_2641C
		rcr	ax, 1

loc_2642C::				; CODE XREF: sub_26408+1Bj
					; sub_26408+41j
		mov	[di+0Ah], dl
		mov	[di+8],	bx
		mov	[di+6],	ax
		mov	[di+4],	cx
		mov	[di+2],	cx
		mov	[di], cx
		retn
; ---------------------------------------------------------------------------
		sub	cx, cx
		mov	dx, cx
		or	ax, ax
		jnz	loc_26417

loc_26446::				; CODE XREF: sub_26408+Aj
		mov	bx, 0C001h
		jmp	loc_2642C
sub_26408	endp


; =============== S U B	R O U T	I N E =======================================


sub_2644B	proc near		; CODE XREF: seg2333:1E07p
					; seg2333:21A4j ...
		mov	cx, [si+8]
		cmp	cx, 10h

loc_26451::				; CODE XREF: seg2333:0FDBj
		jg	loc_264C3
		cmp	cx, 0C001h
		jle	loc_264CD
		mov	bx, [si+6]
		sub	ax, ax
		or	cx, cx
		jge	loc_26466
		shr	bx, 1
		rcr	dx, 1

loc_26466::				; CODE XREF: sub_2644B+15j
		mov	dx, [si+4]
		or	cx, cx
		jle	loc_26475

loc_2646D::				; CODE XREF: sub_2644B+28j
		shl	dx, 1
		rcl	bx, 1
		rcl	ax, 1
		loop	loc_2646D

loc_26475::				; CODE XREF: sub_2644B+20j
		or	dx, [si]
		or	dx, [si+2]
		or	bl, dh
		or	bl, dl
		mov	cl, 0Ch
		and	cl, byte ptr word_28262+1
		cmp	cl, 0Ch
		jz	loc_264B3
		cmp	cl, 0
		jz	loc_264A4
		add	cl, [si+0Ah]
		cmp	cl, 4
		jz	loc_264B3
		cmp	cl, 9
		jz	loc_264B3
		neg	bx
		adc	ax, 0
		jb	loc_264C3
		jmp	loc_264B3
; ---------------------------------------------------------------------------

loc_264A4::				; CODE XREF: sub_2644B+41j
		mov	dl, 1
		and	dl, al
		or	bl, dl
		add	bx, 7FFFh
		adc	ax, 0
		jb	loc_264C3

loc_264B3::				; CODE XREF: sub_2644B+3Cj
					; sub_2644B+49j ...
		cmp	byte ptr [si+0Ah], 1
		jz	loc_264D1
		sahf
		jns	loc_264D7
		cmp	byte ptr aDivideErrorAbn+0Ch, 1	; "\r\nAbnormal	program	termination\r\n"
		jz	loc_264D7

loc_264C3::				; CODE XREF: sub_2644B:loc_26451j
					; sub_2644B+55j ...
		mov	ch, 8
		call	sub_27C24
		mov	ax, 8000h
		jmp	loc_264D7
; ---------------------------------------------------------------------------

loc_264CD::				; CODE XREF: sub_2644B+Cj
		sub	ax, ax
		jmp	loc_264D7
; ---------------------------------------------------------------------------

loc_264D1::				; CODE XREF: sub_2644B+6Cj
		neg	ax
		jz	loc_264D7
		jns	loc_264C3

loc_264D7::				; CODE XREF: sub_2644B+6Fj
					; sub_2644B+76j ...
		mov	byte ptr aDivideErrorAbn+0Ch, 0	; "\r\nAbnormal	program	termination\r\n"
		mov	es:[di], ax
		retn
sub_2644B	endp

; ---------------------------------------------------------------------------
		mov	byte ptr aDivideErrorAbn+0Ch, 1	; "\r\nAbnormal	program	termination\r\n"
		mov	cx, [si+8]
		cmp	cx, 10h
		jmp	loc_26451

; =============== S U B	R O U T	I N E =======================================


sub_264EE	proc near		; CODE XREF: seg2333:256Cp
		push	si
		push	di
		cld
		mov	cx, 5
		rep movsw
		movsb
		pop	di
		pop	si
		xchg	si, di
		lea	si, [si+8]
		cmp	word ptr [si], 0C001h
		jle	locret_26513
		cmp	word ptr [si], 4001h
		jge	loc_26514
		dec	word ptr [si]
		call	sub_26408
		mov	word ptr [si], 1

locret_26513::				; CODE XREF: sub_264EE+14j
					; sub_264EE+33j
		retn
; ---------------------------------------------------------------------------

loc_26514::				; CODE XREF: sub_264EE+1Aj
		mov	word ptr [si], 0C001h
		mov	word ptr [di+8], 0Dh
		mov	byte ptr [di+7], 80h ; ''
		jmp	locret_26513
sub_264EE	endp

; ---------------------------------------------------------------------------

loc_26523::				; DATA XREF: seg2333:255Ao
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	cx, [si+8]
		cmp	cx, 0Fh
		jg	loc_26538
		or	cx, cx
		jg	loc_26542
		sub	ax, ax
		jmp	loc_26554
; ---------------------------------------------------------------------------

loc_26538::				; CODE XREF: seg2333:101Ej
		mov	ch, 8
		call	sub_27C24
		mov	ax, 7FFFh
		jmp	loc_2654C
; ---------------------------------------------------------------------------

loc_26542::				; CODE XREF: seg2333:1022j
		mov	ax, [si+6]
		neg	cl
		add	cl, 10h
		shr	ax, cl

loc_2654C::				; CODE XREF: seg2333:1030j
		cmp	byte ptr [si+0Ah], 1
		jnz	loc_26554

loc_26552::
		neg	ax

loc_26554::				; CODE XREF: seg2333:1026j
					; seg2333:1040j
		mov	cx, [di+8]
		cmp	cx, 0C001h
		jle	loc_26572
		cmp	cx, 4001h
		jge	loc_26572
		add	ax, cx
		cmp	ax, 0C001h
		jle	loc_26580
		cmp	ax, 4001h
		jge	loc_26576
		mov	[di+8],	ax

loc_26572::				; CODE XREF: seg2333:104Bj
					; seg2333:1051j ...
		pop	di
		pop	si
		pop	bp
		retn
; ---------------------------------------------------------------------------

loc_26576::				; CODE XREF: seg2333:105Dj
		mov	ch, 8
		call	sub_27C24
		mov	ax, 4001h
		jmp	loc_26588
; ---------------------------------------------------------------------------

loc_26580::				; CODE XREF: seg2333:1058j
		mov	ch, 10h
		call	sub_27C24
		mov	ax, 0C001h

loc_26588::				; CODE XREF: seg2333:106Ej
		call	sub_2634D
		jmp	loc_26572
; ---------------------------------------------------------------------------
		mov	cx, dx
		xchg	ax, bx
		jmp	loc_265A1
; ---------------------------------------------------------------------------
		mov	cx, dx
		xchg	ax, bx
		mov	dx, 0
		jmp	loc_265B3

; =============== S U B	R O U T	I N E =======================================


sub_2659A	proc near		; CODE XREF: seg2333:21A4j
					; seg2333:2222j ...
		mov	bx, es:[si]
		mov	cx, es:[si+2]

loc_265A1::				; CODE XREF: seg2333:1080j
		sub	ax, ax
		mov	dx, 0
		or	cx, cx
		jns	loc_265B3
		not	cx
		neg	bx
		sbb	cx, 0FFFFh
		mov	dl, 1

loc_265B3::				; CODE XREF: seg2333:1088j
					; sub_2659A+Ej
		mov	[di+0Ah], dl
		mov	dl, 10h
		or	cx, cx
		jnz	loc_265C8
		xchg	bx, cx
		mov	dl, 0
		jcxz	loc_265E0
		jmp	loc_265C8
; ---------------------------------------------------------------------------

loc_265C4::				; CODE XREF: sub_2659A+31j
		rcr	bx, 1
		rcr	ax, 1

loc_265C8::				; CODE XREF: sub_2659A+20j
					; sub_2659A+28j
		inc	dx
		shr	cx, 1
		jnz	loc_265C4
		rcr	bx, 1
		rcr	ax, 1

loc_265D1::				; CODE XREF: sub_2659A+49j
		mov	[di+8],	dx
		mov	[di+6],	bx
		mov	[di+4],	ax
		mov	[di+2],	cx
		mov	[di], cx
		retn
; ---------------------------------------------------------------------------

loc_265E0::				; CODE XREF: sub_2659A+26j
		mov	dx, 0C001h
		jmp	loc_265D1
sub_2659A	endp

; ---------------------------------------------------------------------------
		mov	byte ptr aDivideErrorAbn+0Ch, 1	; "\r\nAbnormal	program	termination\r\n"
		mov	cx, [si+8]
		cmp	cx, 20h	; ' '
		jmp	loc_265F8

; =============== S U B	R O U T	I N E =======================================


sub_265F2	proc near		; CODE XREF: seg2333:21A4j
					; seg2333:2222j ...
		mov	cx, [si+8]
		cmp	cx, 20h	; ' '

loc_265F8::				; CODE XREF: seg2333:10E0j
		jg	loc_2662D
		or	cx, cx
		jge	loc_2663A
		cmp	cx, 0C001h
		jle	loc_26617
		mov	bl, 0Ch
		and	bl, byte ptr word_28262+1
		add	bl, [si+0Ah]
		cmp	bl, 5
		jz	loc_2661D
		cmp	bl, 8
		jz	loc_2661D

loc_26617::				; CODE XREF: sub_265F2+10j
		sub	dx, dx
		mov	ax, dx
		jmp	loc_26637
; ---------------------------------------------------------------------------

loc_2661D::				; CODE XREF: sub_265F2+1Ej
					; sub_265F2+23j
		sub	dx, dx
		mov	ax, 1
		cmp	bl, 5
		jnz	loc_26637
		neg	ax
		not	dx
		jmp	loc_26637
; ---------------------------------------------------------------------------

loc_2662D::				; CODE XREF: sub_265F2:loc_265F8j
					; sub_265F2:loc_266C1j
		mov	ch, 8
		call	sub_27C24
		mov	dx, 8000h
		sub	ax, ax

loc_26637::				; CODE XREF: sub_265F2+29j
					; sub_265F2+33j ...
		jmp	loc_266D1
; ---------------------------------------------------------------------------

loc_2663A::				; CODE XREF: sub_265F2+Aj
		mov	bx, [si+2]
		or	bl, [si]
		or	bl, [si+1]
		mov	ax, [si+4]
		mov	dx, [si+6]
		sub	cl, 10h
		ja	loc_2665D

loc_2664D::				; CODE XREF: sub_265F2+66j
		or	al, bl
		or	al, bh
		xchg	ax, bx
		xchg	ax, dx
		sub	dx, dx
		add	cl, 10h
		jle	loc_2664D
		and	cl, 0Fh

loc_2665D::				; CODE XREF: sub_265F2+59j
		jcxz	loc_2667C
		push	si
		mov	si, 0FFFFh
		rol	dx, cl
		rol	ax, cl
		shl	si, cl
		mov	cx, si
		and	cx, ax
		xor	ax, cx
		and	si, dx
		xor	dx, si
		or	ax, si
		or	bl, bh
		or	bl, cl
		mov	bh, ch
		pop	si

loc_2667C::				; CODE XREF: sub_265F2:loc_2665Dj
		mov	cl, 0Ch
		and	cl, byte ptr word_28262+1
		cmp	cl, 0Ch
		jz	loc_266C4
		cmp	cl, 0
		jz	loc_2669F
		add	cl, [si+0Ah]
		cmp	cl, 4
		jz	loc_266C4
		cmp	cl, 9
		jz	loc_266C4
		neg	bx
		jb	loc_266A9
		jmp	loc_266C4
; ---------------------------------------------------------------------------

loc_2669F::				; CODE XREF: sub_265F2+98j
		mov	cl, 1
		and	cl, al
		or	bl, cl
		add	bx, 7FFFh

loc_266A9::				; CODE XREF: sub_265F2+A9j
		adc	ax, 0
		adc	dx, 0
		jns	loc_266C4
		cmp	byte ptr [si+0Ah], 1
		jnz	loc_266C1
		cmp	dx, 8000h
		jnz	loc_266C1
		or	ax, ax
		jz	loc_266C4

loc_266C1::				; CODE XREF: sub_265F2+C3j
					; sub_265F2+C9j
		jmp	loc_2662D
; ---------------------------------------------------------------------------

loc_266C4::				; CODE XREF: sub_265F2+93j
					; sub_265F2+A0j ...
		cmp	byte ptr [si+0Ah], 1
		jnz	loc_266D1
		not	dx
		neg	ax
		sbb	dx, 0FFFFh

loc_266D1::				; CODE XREF: sub_265F2:loc_26637j
					; sub_265F2+D6j
		mov	byte ptr aDivideErrorAbn+0Ch, 0	; "\r\nAbnormal	program	termination\r\n"
		mov	es:[di], ax
		mov	es:[di+2], dx
		retn
sub_265F2	endp


; =============== S U B	R O U T	I N E =======================================


sub_266DE	proc near		; CODE XREF: sub_278EE+7p
		push	bp
		push	si
		mov	ax, es:[si]
		mov	bx, es:[si+2]
		mov	cx, es:[si+4]
		mov	dx, es:[si+6]
		mov	bp, 0
		or	dx, dx
		jl	loc_26709
		jg	loc_2671E
		or	cx, cx
		jnz	loc_2671E
		or	bx, bx
		jnz	loc_2671E
		or	ax, ax
		jnz	loc_2671E
		mov	si, 0C001h
		jmp	loc_2673C
; ---------------------------------------------------------------------------

loc_26709::				; CODE XREF: sub_266DE+16j
		not	dx
		not	cx
		not	bx
		neg	ax
		cmc
		adc	bx, 0
		adc	cx, 0
		adc	dx, 0
		mov	bp, 1

loc_2671E::				; CODE XREF: sub_266DE+18j
					; sub_266DE+1Cj ...
		mov	si, 40h	; '@'

loc_26721::				; CODE XREF: sub_266DE+4Fj
		or	dx, dx
		jnz	loc_2672F
		xchg	dx, cx
		xchg	cx, bx
		xchg	ax, bx
		sub	si, 10h
		jmp	loc_26721
; ---------------------------------------------------------------------------

loc_2672F::				; CODE XREF: sub_266DE+45j
		js	loc_2673C

loc_26731::				; CODE XREF: sub_266DE+5Cj
		dec	si
		add	ax, ax
		adc	bx, bx
		adc	cx, cx
		adc	dx, dx
		jns	loc_26731

loc_2673C::				; CODE XREF: sub_266DE+29j
					; sub_266DE:loc_2672Fj
		mov	[di+8],	si
		mov	[di+6],	dx
		mov	[di+4],	cx
		mov	[di+2],	bx
		mov	[di], ax
		xchg	ax, bp
		mov	[di+0Ah], al
		pop	si
		pop	bp
		retn
sub_266DE	endp


; =============== S U B	R O U T	I N E =======================================


sub_26751	proc near		; CODE XREF: sub_2791E+4p
		push	bp
		push	di
		mov	cx, [si+8]
		cmp	cx, 3Fh	; '?'
		jg	loc_26794
		or	cx, cx
		jge	loc_267A5
		cmp	cx, 0C001h
		jle	loc_26778
		mov	bl, 0Ch
		and	bl, byte ptr word_28262+1
		add	bl, [si+0Ah]
		cmp	bl, 5
		jz	loc_2677C
		cmp	bl, 8
		jz	loc_2677C

loc_26778::				; CODE XREF: sub_26751+12j
		sub	bp, bp
		jmp	loc_2679C
; ---------------------------------------------------------------------------

loc_2677C::				; CODE XREF: sub_26751+20j
					; sub_26751+25j
		sub	bp, bp
		mov	dx, bp
		mov	ax, 1
		cmp	bl, 5
		mov	bx, bp
		jnz	loc_267A2
		neg	ax
		not	bx
		not	dx
		not	bp
		jmp	loc_267A2
; ---------------------------------------------------------------------------

loc_26794::				; CODE XREF: sub_26751+8j
					; sub_26751:loc_26805j
		mov	ch, 8
		call	sub_27C24
		mov	bp, 8000h

loc_2679C::				; CODE XREF: sub_26751+29j
		sub	dx, dx
		mov	bx, dx
		mov	ax, bx

loc_267A2::				; CODE XREF: sub_26751+37j
					; sub_26751+41j
		jmp	loc_26836
; ---------------------------------------------------------------------------

loc_267A5::				; CODE XREF: sub_26751+Cj
		mov	bp, [si+6]
		mov	dx, [si+4]
		mov	bx, [si+2]
		mov	di, [si]
		sub	ax, ax
		sub	cl, 30h	; '0'
		ja	loc_267CD

loc_267B7::				; CODE XREF: sub_26751+77j
		or	al, ah
		mov	ah, 0
		or	ax, di
		mov	di, bx
		mov	bx, dx
		mov	dx, bp
		sub	bp, bp
		add	cl, 10h
		jle	loc_267B7
		and	cl, 0Fh

loc_267CD::				; CODE XREF: sub_26751+64j
		neg	cl
		jz	loc_267E2
		add	cl, 10h

loc_267D4::				; CODE XREF: sub_26751+8Fj
		or	al, ah
		shr	bp, 1
		rcr	dx, 1
		rcr	bx, 1
		rcr	di, 1
		rcr	ah, 1
		loop	loc_267D4

loc_267E2::				; CODE XREF: sub_26751+7Ej
		mov	cl, 0Ch
		and	cl, byte ptr word_28262+1
		cmp	cl, 0Ch
		jz	loc_2681D
		cmp	cl, 0
		jz	loc_26807
		add	cl, [si+0Ah]
		cmp	cl, 4
		jz	loc_2681D
		cmp	cl, 9
		jz	loc_2681D
		neg	ax
		jb	loc_26810
		jmp	loc_2681D
; ---------------------------------------------------------------------------

loc_26805::				; CODE XREF: sub_26751+CAj
		jmp	loc_26794
; ---------------------------------------------------------------------------

loc_26807::				; CODE XREF: sub_26751+9Fj
		mov	cl, 1
		and	cx, di
		or	al, cl
		add	ax, 7FFFh

loc_26810::				; CODE XREF: sub_26751+B0j
		mov	cx, 0
		adc	di, cx
		adc	bx, cx
		adc	dx, cx
		adc	bp, cx
		js	loc_26805

loc_2681D::				; CODE XREF: sub_26751+9Aj
					; sub_26751+A7j ...
		xchg	ax, di
		cmp	byte ptr [si+0Ah], 1
		jnz	loc_26836
		not	bp
		not	dx
		not	bx
		neg	ax
		cmc
		adc	bx, 0
		adc	dx, 0
		adc	bp, 0

loc_26836::				; CODE XREF: sub_26751:loc_267A2j
					; sub_26751+D1j
		pop	di
		stosw
		xchg	ax, bx
		stosw
		xchg	ax, dx
		stosw
		xchg	ax, bp
		stosw
		sub	di, 8
		pop	bp
		retn
sub_26751	endp

; ---------------------------------------------------------------------------
		mov	si, word_2826C

; =============== S U B	R O U T	I N E =======================================


sub_26847	proc near		; CODE XREF: seg2333:1DFDp
					; DATA XREF: seg2333:2558o
		push	bp
		push	si
		push	di
		xchg	bp, si
		mov	cx, [bp+8]
		cmp	cx, 40h	; '@'
		jge	loc_26885
		or	cx, cx
		jge	loc_268A2
		cmp	cx, 0C001h
		jle	loc_26876
		mov	ch, 20h	; ' '
		call	sub_27C24
		mov	cl, 0Ch
		and	cl, byte ptr word_28262+1
		add	cl, [bp+0Ah]
		cmp	cl, 5
		jz	loc_2687D
		cmp	cl, 8
		jz	loc_2687D

loc_26876::				; CODE XREF: sub_26847+15j
					; sub_26847+CCj
		sub	bx, bx
		mov	si, 0C001h
		jmp	loc_2688E
; ---------------------------------------------------------------------------

loc_2687D::				; CODE XREF: sub_26847+28j
					; sub_26847+2Dj
		mov	si, 1
		mov	bx, 8000h
		jmp	loc_2688E
; ---------------------------------------------------------------------------

loc_26885::				; CODE XREF: sub_26847+Bj
		jz	loc_2689F
		mov	ch, 20h	; ' '
		call	sub_27C24
		jmp	loc_2689F
; ---------------------------------------------------------------------------

loc_2688E::				; CODE XREF: sub_26847+34j
					; sub_26847+3Cj
		sub	ax, ax
		mov	[bp+0],	ax
		mov	[bp+2],	ax
		mov	[bp+4],	ax
		mov	[bp+6],	bx
		mov	[bp+8],	si

loc_2689F::				; CODE XREF: sub_26847:loc_26885j
					; sub_26847+45j
		jmp	loc_26952
; ---------------------------------------------------------------------------

loc_268A2::				; CODE XREF: sub_26847+Fj
		mov	si, 38h	; '8'
		and	si, cx
		xor	cx, si
		shr	si, 1
		shr	si, 1
		shr	si, 1
		neg	si
		add	si, 7
		cmp	si, 7
		jnz	loc_268BF
		mov	ah, 0
		mov	al, [bp+si]
		jmp	loc_268C1
; ---------------------------------------------------------------------------

loc_268BF::				; CODE XREF: sub_26847+70j
		mov	ax, [bp+si]

loc_268C1::				; CODE XREF: sub_26847+76j
		sub	bx, bx
		mov	di, si

loc_268C5::				; CODE XREF: sub_26847+85j
		dec	di
		jl	loc_268CE
		or	bl, [bp+di]
		mov	[bp+di], bh
		jmp	loc_268C5
; ---------------------------------------------------------------------------

loc_268CE::				; CODE XREF: sub_26847+7Fj
		mov	dx, 0FFh
		and	cl, 7
		shr	dx, cl
		mov	di, dx
		inc	di
		and	dx, ax
		jnz	loc_268E1
		or	bl, bl
		jz	loc_26952

loc_268E1::				; CODE XREF: sub_26847+94j
		mov	ch, 20h	; ' '
		call	sub_27C24
		xor	ax, dx
		mov	cl, 0Ch
		and	cl, byte ptr word_28262+1
		cmp	cl, 0Ch
		jz	loc_2690B
		cmp	cl, 0
		jz	loc_26916
		add	cl, [bp+0Ah]
		cmp	cl, 4
		jz	loc_2690B
		cmp	cl, 9
		jz	loc_2690B
		or	bl, dl
		jnz	loc_2692C
		jmp	loc_26952
; ---------------------------------------------------------------------------

loc_2690B::				; CODE XREF: sub_26847+AAj
					; sub_26847+B7j ...
		mov	[bp+si], al
		cmp	byte ptr [bp+7], 0
		jnz	loc_26952
		jmp	loc_26876
; ---------------------------------------------------------------------------

loc_26916::				; CODE XREF: sub_26847+AFj
		or	bl, bl
		jnz	loc_26926
		test	ax, di
		jnz	loc_26926
		add	dx, dx
		cmp	dx, di
		jbe	loc_2690B
		jmp	loc_2692C
; ---------------------------------------------------------------------------

loc_26926::				; CODE XREF: sub_26847+D1j
					; sub_26847+D5j
		add	dx, dx
		cmp	dx, di
		jb	loc_2690B

loc_2692C::				; CODE XREF: sub_26847+C0j
					; sub_26847+DDj
		sub	si, 7
		jl	loc_2693A
		add	ax, di
		mov	[bp+si+7], al
		neg	ah
		jmp	loc_26949
; ---------------------------------------------------------------------------

loc_2693A::				; CODE XREF: sub_26847+E8j
		add	ax, di
		mov	[bp+si+7], ax
		inc	si

loc_26940::				; CODE XREF: sub_26847+100j
		inc	si
		jg	loc_26949
		adc	byte ptr [bp+si+7], 0
		jb	loc_26940

loc_26949::				; CODE XREF: sub_26847+F1j
					; sub_26847+FAj
		jnb	loc_26952
		stc
		rcr	word ptr [bp+6], 1
		inc	word ptr [bp+8]

loc_26952::				; CODE XREF: sub_26847:loc_2689Fj
					; sub_26847+98j ...
		pop	di
		pop	si
		pop	bp
		retn
sub_26847	endp


; =============== S U B	R O U T	I N E =======================================


sub_26956	proc near		; CODE XREF: sub_26C0F+3p sub_26C30p ...
		push	bp
		push	si
		push	di
		mov	bp, word_2826C
		mov	ax, [bp+0]
		mov	bx, [bp+2]
		mov	cx, [bp+4]
		mov	dx, [bp+6]
		sub	di, di
		mov	si, [bp+8]
		cmp	si, 0C001h
		jz	loc_26995
		cmp	si, 0FFF0h
		jg	loc_26986
		mov	di, ax
		mov	ax, bx
		mov	bx, cx
		mov	cx, dx
		sub	dx, dx
		add	si, 10h

loc_26986::				; CODE XREF: sub_26956+21j
					; sub_26956+3Dj
		inc	si
		jg	loc_26995
		shr	dx, 1
		rcr	cx, 1
		rcr	bx, 1
		rcr	ax, 1
		rcr	di, 1
		jmp	loc_26986
; ---------------------------------------------------------------------------

loc_26995::				; CODE XREF: sub_26956+1Cj
					; sub_26956+31j
		shl	di, 1
		mov	di, 0
		adc	ax, di
		adc	bx, di
		adc	cx, di
		adc	dx, di
		mov	[bp+0],	ax
		mov	[bp+2],	bx
		mov	[bp+4],	cx
		mov	[bp+6],	dx
		mov	bx, di
		mov	cx, di
		mov	si, di
		test	byte ptr [bp+3], 80h
		jz	loc_269C4
		mov	bx, [bp+0]
		mov	cx, [bp+2]
		shl	bx, 1
		rcl	cx, 1

loc_269C4::				; CODE XREF: sub_26956+62j
		mov	ax, [bp+0]
		mul	word ptr [bp+4]
		add	bx, ax
		adc	cx, dx
		adc	si, di
		add	bx, ax
		adc	cx, dx
		adc	si, di
		mov	bx, cx
		mov	cx, si
		sub	si, si
		mov	ax, [bp+2]
		mul	word ptr [bp+4]
		add	bx, ax
		adc	cx, dx
		adc	si, di
		add	bx, ax
		adc	cx, dx
		adc	si, di
		mov	ax, [bp+0]
		mul	word ptr [bp+6]
		add	bx, ax
		adc	cx, dx
		adc	si, di
		add	bx, ax
		adc	cx, dx
		adc	si, di
		shl	bx, 1
		adc	cx, di
		adc	si, di
		mov	bx, cx
		mov	cx, si
		sub	si, si
		mov	ax, [bp+4]
		mul	ax
		add	bx, ax
		adc	cx, dx
		adc	si, di
		mov	ax, [bp+6]
		mul	word ptr [bp+2]
		add	bx, ax
		adc	cx, dx
		adc	si, di
		add	bx, ax
		adc	cx, dx
		adc	si, di
		mov	ax, [bp+6]
		mul	word ptr [bp+4]
		add	cx, ax
		adc	si, dx
		adc	di, di
		add	cx, ax
		adc	si, dx
		adc	di, 0
		mov	ax, [bp+6]
		mul	ax
		add	si, ax
		adc	di, dx
		mov	[bp+0],	bx
		mov	[bp+2],	cx
		mov	[bp+4],	si
		mov	[bp+6],	di
		mov	byte ptr [bp+0Ah], 0
		mov	word ptr [bp+8], 0
		pop	di
		pop	si
		pop	bp
		retn
sub_26956	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_26A5E	proc near		; CODE XREF: sub_26C15+9p sub_26C33+9p ...

var_s0		= word ptr  0
arg_0		= word ptr  4
arg_2		= word ptr  6
arg_6		= byte ptr  0Ah
arg_12		= byte ptr  16h

		push	bp
		mov	bp, sp
		push	si
		push	di
		push	ds
		push	es
		mov	al, 0Ch
		mul	byte ptr [bp+arg_2]
		sub	ax, 0Ch
		xchg	ax, si
		add	si, [bp+arg_0]
		call	sub_26397
		mov	di, si

loc_26A76::				; CODE XREF: sub_26A5E+84j
					; sub_26A5E+93j
		dec	byte ptr [bp+arg_2]
		jle	loc_26AF3
		push	bp
		mov	bp, word_2826C
		mov	al, [bp+arg_12]
		xor	[bp+arg_6], al
		call	sub_25863
		mov	[bp+var_s0], ax
		mov	[bp+2],	bx
		mov	[bp+arg_0], cx
		mov	[bp+arg_2], dx
		sub	di, 0Ch
		mov	bx, cs:[di]
		mov	cx, cs:[di+2]
		mov	dx, cs:[di+4]
		mov	si, cs:[di+6]
		mov	al, cs:[di+0Ah]
		cmp	al, [bp+arg_6]
		jz	loc_26AE4
		sub	bx, [bp+var_s0]
		sbb	cx, [bp+2]
		sbb	dx, [bp+arg_0]
		sbb	si, [bp+arg_2]
		jnb	loc_26AD2
		not	si
		not	dx
		not	cx
		neg	bx
		cmc
		adc	cx, 0
		adc	dx, 0
		adc	si, 0
		xor	al, 1

loc_26AD2::				; CODE XREF: sub_26A5E+5Ej
		mov	[bp+var_s0], bx
		mov	[bp+2],	cx
		mov	[bp+arg_0], dx
		mov	[bp+arg_2], si
		mov	[bp+arg_6], al
		pop	bp
		jmp	loc_26A76
; ---------------------------------------------------------------------------

loc_26AE4::				; CODE XREF: sub_26A5E+50j
		add	[bp+var_s0], bx
		adc	[bp+2],	cx
		adc	[bp+arg_0], dx
		adc	[bp+arg_2], si
		pop	bp
		jmp	loc_26A76
; ---------------------------------------------------------------------------

loc_26AF3::				; CODE XREF: sub_26A5E+1Bj
		mov	si, word_2826C
		cld
		lodsw
		xchg	ax, bx
		lodsw
		xchg	ax, cx
		lodsw
		xchg	ax, dx
		lodsw
		xchg	ax, di
		lodsw
		lodsb
		inc	si
		mov	word_2826C, si
		xchg	si, di
		sub	di, di
		cmp	al, 1
		jnz	loc_26B20
		not	si
		not	dx
		not	cx
		neg	bx
		cmc
		adc	cx, di
		adc	dx, di
		adc	si, di
		jmp	loc_26B32
; ---------------------------------------------------------------------------

loc_26B20::				; CODE XREF: sub_26A5E+AFj
		stc
		rcr	si, 1
		rcr	dx, 1
		rcr	cx, 1
		rcr	bx, 1
		adc	bx, di
		adc	cx, di
		adc	dx, di
		adc	si, di
		inc	di

loc_26B32::				; CODE XREF: sub_26A5E+C0j
		mov	ax, word_2826C
		xchg	ax, di
		xchg	ax, bx
		stosw
		xchg	ax, cx
		stosw
		xchg	ax, dx
		stosw
		xchg	ax, si
		stosw
		xchg	ax, bx
		stosw
		mov	al, 0
		stosb
		pop	es
		pop	ds
		pop	di
		pop	si
		pop	bp
		retn	4
sub_26A5E	endp

; ---------------------------------------------------------------------------
byte_26B4B	db 8			; DATA XREF: sub_26C15r
					; Method
		db 0
byte_26B4D	db 0			; DATA XREF: sub_26C15+5o
					; Procedure
		db 0
		db 0Ah dup(0), 0B6h, 6 dup(0AAh), 2Ah, 2 dup(0), 1, 0
		db 3, 24h, 5 dup(22h), 2, 4 dup(0), 0B3h, 0E4h,	0, 0Dh
		db 0D0h, 0, 0Dh, 3 dup(0), 1, 0, 6Eh, 8, 4Bh, 0C7h, 3Bh
		db 2Eh,	6 dup(0), 0C6h,	40h, 16h, 99h, 6Bh, 5 dup(0), 1
		db 0, 0Ch, 45h,	92h, 0B0h, 8 dup(0), 0D5h, 45h,	0D6h, 7	dup(0)
		db 1, 0
word_26BAD	dw 8			; DATA XREF: sub_26C33r
byte_26BAF	db 0Ch dup(0), 88h, 6 dup(0FFh), 7Fh, 2	dup(0),	1, 0, 0A6h
					; DATA XREF: sub_26C33+5o
		db 9Ah,	5 dup(0AAh), 0Ah, 4 dup(0), 7Fh, 0E6h, 4, 5Bh
		db 0B0h, 5, 5Bh, 3 dup(0), 1, 0, 0EFh, 26h, 9Bh, 1, 1Ah
		db 0A0h, 1, 5 dup(0), 1Dh, 0CEh, 0DCh, 93h, 9Fh, 4, 4 dup(0)
		db 1, 0, 0Fh, 0B1h, 4Bh, 0F7h, 8, 7 dup(0), 3, 0D8h, 7Bh
		db 0Ch,	6 dup(0), 1, 0

; =============== S U B	R O U T	I N E =======================================


sub_26C0F	proc near		; CODE XREF: seg2333:loc_2718Bp
		call	sub_2637B
		call	sub_26956
sub_26C0F	endp ; sp-analysis failed


; =============== S U B	R O U T	I N E =======================================


sub_26C15	proc near		; CODE XREF: sub_26C40+9p
		push	word ptr cs:byte_26B4B
		mov	ax, offset byte_26B4D
		push	ax
		call	sub_26A5E
		push	word_2826C
		push	si
		push	si
		call	sub_257CD
		add	word_2826C, 0Ch
		retn
sub_26C15	endp


; =============== S U B	R O U T	I N E =======================================


sub_26C30	proc near		; CODE XREF: seg2333:1C76p
		call	sub_26956
sub_26C30	endp ; sp-analysis failed


; =============== S U B	R O U T	I N E =======================================


sub_26C33	proc near		; CODE XREF: sub_26C40+Cp
		push	cs:word_26BAD
		mov	ax, offset byte_26BAF
		push	ax
		call	sub_26A5E
		retn
sub_26C33	endp


; =============== S U B	R O U T	I N E =======================================


sub_26C40	proc near		; CODE XREF: seg2333:1CA4p
					; DATA XREF: seg2333:2544o
		call	sub_2637B
		call	sub_26956
		call	sub_263CA
		call	sub_26C15
		call	sub_26C33
		retn
sub_26C40	endp

; ---------------------------------------------------------------------------
		db 35h
		db 0C2h	; Â
		db  68h	; h
		db 21h
		db 0A2h	; ¢
		db 0DAh	; Ú
		db  0Fh
		db 0C9h
		db 1
		db    0
		db    0
		db    0
word_26C5C	dw 8			; DATA XREF: sub_26DE9+1Dr
unk_26C5E	db    0			; DATA XREF: sub_26DE9+22o
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
		db  57h	; W
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db  55h	; U
		db    1
		db    0
		db    0
		db    1
		db    0
		db 0BEh	; ¾
		db  32h	; 2
		db  33h	; 3
		db  33h	; 3
		db  33h	; 3
		db  33h	; 3
		db    3
		db    0
		db    0
		db    0
		db    0
		db    0
		db  7Dh	; }
		db  1Eh
		db  49h	; I
		db  92h	; 
		db  24h	; $
		db    9
		db    0
		db    0
		db    0
		db    0
		db    1
		db    0
		db 0BCh	; ¼
		db 0FEh	; þ
		db 0C6h	; Æ
		db  71h	; q
		db  1Ch
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  5Ch	; \
		db 0FFh
		db  16h
		db  5Dh	; ]
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    1
		db    0
		db 0D8h	; Ø
		db 0BBh	; »
		db  3Ah	; :
		db    1
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  0Ah
		db  0Ch
		db    4
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    1
		db    0
unk_26CBE	db    0			; DATA XREF: sub_26D36+13o
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db 0E7h	; ç
		db 0FDh	; ý
		db 0FFh
		db    0
		db    0
		db 0BDh	; ½
		db 0A4h	; ¤
		db 0D6h	; Ö
		db  7Bh	; {
		db 0EEh	; î
		db  64h	; d
		db  5Ch	; \
		db 0B3h	; ³
		db 0FFh
		db 0FFh
		db    0
		db    0
		db 0B5h	; µ
		db  85h	; 

		db  47h	; G
		db 0FCh	; ü
		db  74h	; t
		db  30h	; 0
		db  11h
		db 0A1h	; ¡
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
		db  80h	; 
		db    1
		db    0
		db    0
		db    0
unk_26CEE	db  9Ch	; 		; DATA XREF: sub_26D36+94o
		db 0FAh	; ú
		db  64h	; d
		db 0B0h	; °
		db 0B2h	; ²
		db  1Dh
		db    7
		db 0E6h	; æ
		db 0FEh	; þ
		db 0FFh
		db    0
		db    0
		db  9Ch	; 
		db 0FAh	; ú
		db  64h	; d
		db 0B0h	; °
		db 0B2h	; ²
		db  1Dh
		db    7
		db 0E6h	; æ
		db 0FFh
		db 0FFh
		db    0
		db    0
		db 0F5h	; õ
		db 0BBh	; »
		db  4Bh	; K
		db    4
		db  46h	; F
		db  56h	; V
		db  85h	; 

		db 0ACh	; ¬
		db    0
		db    0
		db    0
		db    0
unk_26D12	db 0E6h	; æ		; DATA XREF: sub_26D36+54o
		db  6Eh	; n
		db 0D9h	; Ù
		db  1Fh
		db 0BDh	; ½
		db    9
		db 0FAh	; ú
		db 0E9h	; é
		db 0FEh	; þ
		db 0FFh
		db    0
		db    0
		db  8Dh	; 
		db  7Bh	; {
		db  35h	; 5
		db 0BDh	; ½
		db  5Bh	; [
		db  84h	; 
		db 0DDh	; Ý
		db 0F6h	; ö
		db 0FFh
		db 0FFh
		db    0
		db    0
		db  7Fh	; 
		db 0D5h	; Õ
		db  35h	; 5
		db    2
		db 0DBh	; Û
		db  80h	; 
		db  73h	; s
		db 0CCh	; Ì
		db    0
		db    0
		db    0
		db    0

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_26D36	proc near		; CODE XREF: seg2333:1D07p
					; DATA XREF: seg2333:2546o

var_2		= word ptr -2

		push	bp
		mov	bp, sp
		lea	sp, [bp-2]
		push	si
		push	di
		push	si
		push	di
		push	si
		call	sub_2599A
		mov	[bp+var_2], 0
		mov	di, offset unk_26CBE

loc_26D4C::				; CODE XREF: sub_26D36+3Bj
		cmp	[bp+var_2], 3
		jnb	loc_26D73
		xchg	si, di
		call	sub_26397
		xchg	di, si
		push	si
		push	word_2826C
		call	sub_25EE9
		add	word_2826C, 0Ch
		cmp	ax, 0
		jnz	loc_26D73
		inc	[bp+var_2]
		add	di, 0Ch
		jmp	loc_26D4C
; ---------------------------------------------------------------------------

loc_26D73::				; CODE XREF: sub_26D36+1Aj
					; sub_26D36+33j
		cmp	[bp+var_2], 0
		jnz	loc_26D7E
		call	sub_26DE9
		jmp	loc_26DE3
; ---------------------------------------------------------------------------

loc_26D7E::				; CODE XREF: sub_26D36+41j
		mov	bx, [bp+var_2]
		dec	bx
		mov	bl, cs:[bx+2]
		mov	[bp+var_2], bx
		add	bx, offset unk_26D12
		mov	di, bx
		xchg	si, di
		call	sub_26397
		xchg	di, si
		push	si
		mov	di, word_2826C
		push	di
		lea	ax, [di-0Ch]
		mov	word_2826C, ax
		push	ax
		call	sub_255FF
		push	si
		push	di
		push	si
		call	sub_257CD
		call	sub_262D1
		push	di
		push	si
		push	si
		call	sub_25603
		push	word_2826C
		push	si
		push	si
		call	sub_2599A
		add	word_2826C, 18h
		call	sub_26DE9
		mov	di, [bp+var_2]
		add	di, offset unk_26CEE
		xchg	si, di
		call	sub_26397
		xchg	di, si
		push	word_2826C
		push	si
		push	si
		call	sub_25603
		add	word_2826C, 0Ch

loc_26DE3::				; CODE XREF: sub_26D36+46j
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retn
sub_26D36	endp ; sp-analysis failed


; =============== S U B	R O U T	I N E =======================================


sub_26DE9	proc near		; CODE XREF: sub_26D36+43p
					; sub_26D36+8Ep
		push	si
		push	di
		call	sub_2637B
		cmp	word ptr [si+8], 0FFE0h
		jg	loc_26DFB
		mov	di, si
		call	sub_263B4
		jmp	loc_26E1D
; ---------------------------------------------------------------------------

loc_26DFB::				; CODE XREF: sub_26DE9+9j
		mov	di, word_2826C
		add	word ptr [di+8], 3
		call	sub_26956
		push	cs:word_26C5C
		mov	ax, offset unk_26C5E
		push	ax
		call	sub_26A5E
		push	di
		push	si
		push	si
		call	sub_257CD
		add	word_2826C, 0Ch

loc_26E1D::				; CODE XREF: sub_26DE9+10j
		pop	di
		pop	si
		retn
sub_26DE9	endp

; ---------------------------------------------------------------------------
word_26E20	dw 0Dh			; DATA XREF: sub_26EBE+60r
byte_26E22	db 0Ch dup(0), 3, 6 dup(0), 40h, 4 dup(0), 0A9h, 6 dup(0AAh)
					; DATA XREF: sub_26EBE+65o
		db 0Ah,	4 dup(0), 78h, 6 dup(55h), 1, 4	dup(0),	26h, 23h
		db 5 dup(22h), 5 dup(0), 1Ch, 2Bh, 0D8h, 82h, 2Dh, 0D8h
		db 2, 5	dup(0),	0FCh, 0F9h, 33h, 40h, 3, 34h, 6	dup(0)
		db 14h,	52h, 3,	34h, 40h, 3, 6 dup(0), 1Eh, 6Ch, 0C7h
		db 3Bh,	2Eh, 7 dup(0), 4Ch, 0B0h, 0C9h,	4Fh, 2,	7 dup(0)
		db 91h,	0Eh, 0E6h, 1Ah,	8 dup(0), 51h, 76h, 1Fh, 1, 8 dup(0)
		db 0C5h, 2Ch, 0Bh, 9 dup(0)

; =============== S U B	R O U T	I N E =======================================


sub_26EBE	proc near		; CODE XREF: seg2333:1E98p
					; DATA XREF: seg2333:2540o
		push	bp
		push	si
		push	di
		mov	bp, word_2826C
		lea	di, [bp-0Ch]
		mov	word_2826C, di
		call	sub_26326
		push	di
		push	si
		push	si
		call	sub_257CD
		mov	word_2826C, bp
		mov	di, [si+8]
		cmp	di, 0FFC0h
		jle	loc_26F38
		mov	ax, [si]
		mov	bx, [si+2]
		mov	cx, [si+4]
		mov	dx, [si+6]
		inc	di
		jge	loc_26F06

loc_26EEF::				; CODE XREF: sub_26EBE+3Aj
		shr	dx, 1
		rcr	cx, 1
		rcr	bx, 1
		rcr	ax, 1
		inc	di
		jl	loc_26EEF
		adc	ax, 0
		adc	bx, 0
		adc	cx, 0
		adc	dx, 0

loc_26F06::				; CODE XREF: sub_26EBE+2Fj
		sub	word_2826C, 0Ch
		cld
		mov	di, word_2826C
		stosw
		xchg	ax, bx
		stosw
		xchg	ax, cx
		stosw
		xchg	ax, dx
		stosw
		sub	ax, ax
		stosw
		stosb
		sub	di, 0Bh
		push	cs:word_26E20
		mov	ax, offset byte_26E22
		push	ax
		call	sub_26A5E
		mov	ax, word_2826C
		push	ax
		push	si
		push	si
		call	sub_257CD
		add	word_2826C, 0Ch

loc_26F38::				; CODE XREF: sub_26EBE+21j
		pop	di
		pop	si
		pop	bp
		retn
sub_26EBE	endp

; ---------------------------------------------------------------------------
byte_26F3C	db 0BBh, 0F0h, 17h, 5Ch, 29h, 3Bh, 0AAh, 0B8h, 1, 3 dup(0)
					; DATA XREF: sub_26FB6+75o
					; seg2333:1B6Eo
word_26F48	dw 9			; DATA XREF: sub_270A6+34r
byte_26F4A	db 0Ch dup(0), 68h, 6 dup(55h),	5, 4 dup(0), 0BAh, 34h
					; DATA XREF: sub_270A6+39o
		db 5 dup(33h), 5 dup(0), 0A7h, 0C3h, 48h, 92h, 24h, 49h
		db 2, 5	dup(0),	4Dh, 5Dh, 22h, 0C7h, 71h, 1Ch, 6 dup(0)
		db 24h,	56h, 0EBh, 5Ch,	74h, 1,	6 dup(0), 39h, 0ADh, 0ECh
		db 0B1h, 13h, 7	dup(0),	0FDh, 0D6h, 80h, 0Fh, 1, 7 dup(0)
		db 0B5h, 7Ah, 0E4h, 10h, 8 dup(0)

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_26FB6	proc near		; CODE XREF: seg2333:1D81p
					; DATA XREF: seg2333:2542o

var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		push	word ptr [di+8]
		push	si
		push	di
		mov	ax, [di]
		mov	bx, [di+2]
		mov	cx, [di+4]
		mov	dx, [di+6]
		cmp	dx, 0B505h
		ja	loc_26FDF
		shl	ax, 1
		rcl	bx, 1
		rcl	cx, 1
		rcl	dx, 1
		mov	si, 0
		dec	[bp+var_2]
		jmp	loc_26FF4
; ---------------------------------------------------------------------------

loc_26FDF::				; CODE XREF: sub_26FB6+17j
		not	dx
		not	cx
		not	bx
		neg	ax
		cmc
		adc	bx, 0
		adc	cx, 0
		adc	dx, 0
		mov	si, 1

loc_26FF4::				; CODE XREF: sub_26FB6+27j
		sub	di, di

loc_26FF6::				; CODE XREF: sub_26FB6+4Dj
		or	dx, dx
		jnz	loc_27013
		xchg	ax, bx
		xchg	ax, cx
		xchg	ax, dx
		sub	di, 10h
		cmp	di, 0FFC0h
		jg	loc_26FF6
		sub	word_2826C, 0Ch
		mov	di, word_2826C
		call	sub_26337
		jmp	loc_27040
; ---------------------------------------------------------------------------

loc_27013::				; CODE XREF: sub_26FB6+42j
		js	loc_27020

loc_27015::				; CODE XREF: sub_26FB6+68j
		dec	di
		shl	ax, 1
		rcl	bx, 1
		rcl	cx, 1
		adc	dx, dx
		jns	loc_27015

loc_27020::				; CODE XREF: sub_26FB6:loc_27013j
		push	si
		push	di
		push	dx
		push	cx
		push	bx
		push	ax
		mov	si, sp
		call	sub_270A6
		mov	si, offset byte_26F3C
		call	sub_26397
		mov	si, word_2826C
		mov	ax, sp
		push	si
		push	ax
		push	si
		call	sub_257CD
		add	sp, 0Ch

loc_27040::				; CODE XREF: sub_26FB6+5Bj
		lea	si, [bp+var_2]
		sub	word_2826C, 0Ch
		mov	di, word_2826C
		call	sub_26408
		lea	si, [di+0Ch]
		push	si
		push	di
		push	di
		call	sub_25603
		push	di
		push	[bp+var_4]
		push	[bp+var_4]
		call	sub_257CD
		add	word_2826C, 18h
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retn
sub_26FB6	endp

; ---------------------------------------------------------------------------

loc_2706D::				; DATA XREF: seg2333:2552o
		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	si, di
		call	sub_2637B
		mov	si, word_2826C
		call	sub_270A6
		mov	si, offset byte_26F3C
		call	sub_26397
		mov	si, word_2826C
		push	si
		lea	si, [si+0Ch]
		push	si
		push	si
		call	sub_257CD
		push	si
		push	word ptr [bp-2]
		push	word ptr [bp-2]
		call	sub_257CD
		add	word_2826C, 18h
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retn

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_270A6	proc near		; CODE XREF: sub_26FB6+72p
					; seg2333:1B6Bp
		push	bp
		mov	bp, sp
		push	si
		push	di
		cmp	word ptr [si+8], 0FFC0h
		jle	loc_270F7
		sub	word_2826C, 0Ch
		mov	di, word_2826C
		call	sub_262D1
		inc	word ptr [di+8]
		push	si
		push	di
		push	di
		call	sub_25603
		push	si
		push	di
		push	di
		call	sub_2599A
		call	sub_263CA
		mov	bx, word_2826C
		add	word ptr [bx+8], 2
		call	sub_26956
		push	cs:word_26F48
		mov	ax, offset byte_26F4A
		push	ax
		call	sub_26A5E
		push	word_2826C
		push	di
		push	si
		call	sub_257CD
		inc	word ptr [si+8]
		add	word_2826C, 18h

loc_270F7::				; CODE XREF: sub_270A6+9j
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retn
sub_270A6	endp

; ---------------------------------------------------------------------------

loc_270FD::				; DATA XREF: seg2333:26C6o
					; seg2333:26CCo
		mov	cl, 0
		jmp	loc_27107
; ---------------------------------------------------------------------------

loc_27101::				; DATA XREF: seg2333:26C8o
					; seg2333:26CEo
		mov	cl, 2
		jmp	loc_27107
; ---------------------------------------------------------------------------

loc_27105::				; DATA XREF: seg2333:26CAo
					; seg2333:26D0o
		mov	cl, 4

loc_27107::				; CODE XREF: seg2333:1BEFj
					; seg2333:1BF3j
		mov	es, di
		mov	bp, sp
		mov	di, word_2826C
		mov	ch, [di+0Ah]
		push	cx
		push	ax
		cmp	word ptr [di+8], 0FFE0h
		jg	loc_27125
		cmp	cl, 2
		jnz	loc_27122
		call	sub_262D1

loc_27122::				; CODE XREF: seg2333:1C0Dj
		jmp	loc_271DF
; ---------------------------------------------------------------------------

loc_27125::				; CODE XREF: seg2333:1C08j
		cmp	word ptr [di+8], 40h ; '@'
		jle	loc_27136
		call	sub_26363
		mov	word ptr [di+6], 21h ; '!'
		jmp	loc_271DF
; ---------------------------------------------------------------------------

loc_27136::				; CODE XREF: seg2333:1C19j
		mov	byte ptr [di+0Ah], 0
		lea	si, [di-0Ch]
		mov	word_2826C, si
		xchg	di, si
		call	sub_26304
		xchg	di, si
		sub	word ptr [si+8], 2
		call	sub_25DE1
		and	al, 7
		mov	[bp-4],	al
		mov	bl, [bp-2]
		cmp	bl, 4
		jz	loc_27197
		add	bl, [bp-4]
		and	bl, 7
		mov	[bp-4],	bl
		shr	bx, 1
		jnb	loc_2717A
		xchg	di, si
		call	sub_26304
		xchg	di, si
		sub	word ptr [si+8], 2
		push	si
		push	di
		push	di
		call	sub_255FF

loc_2717A::				; CODE XREF: seg2333:1C57j
		mov	word_2826C, di
		mov	si, di
		test	byte ptr [bp-4], 3
		jp	loc_2718B
		call	sub_26C30
		jmp	loc_2718E
; ---------------------------------------------------------------------------

loc_2718B::				; CODE XREF: seg2333:1C74j
		call	sub_26C0F

loc_2718E::				; CODE XREF: seg2333:1C79j
		mov	bl, [bp-4]
		shr	bl, 1
		shr	bl, 1
		jmp	loc_271D3
; ---------------------------------------------------------------------------

loc_27197::				; CODE XREF: seg2333:1C4Aj
		test	byte ptr [bp-4], 1
		jz	loc_271AE
		xchg	si, di
		call	sub_26304
		xchg	si, di
		sub	word ptr [si+8], 2
		push	si
		push	di
		push	di
		call	sub_255FF

loc_271AE::				; CODE XREF: seg2333:1C8Bj
		mov	word_2826C, di
		mov	si, di
		call	sub_26C40
		lea	di, [si-0Ch]
		mov	ax, si
		test	byte ptr [bp-4], 3
		jp	loc_271C4
		xchg	si, di

loc_271C4::				; CODE XREF: seg2333:1CB0j
		xchg	ax, di
		push	si
		push	ax
		push	di
		call	sub_2599A
		mov	bl, [bp-4]
		shr	bl, 1
		and	bl, 1

loc_271D3::				; CODE XREF: seg2333:1C85j
		cmp	byte ptr [bp-2], 2
		jz	loc_271DC
		xor	bl, [bp-1]

loc_271DC::				; CODE XREF: seg2333:1CC7j
		mov	[di+0Ah], bl

loc_271DF::				; CODE XREF: seg2333:loc_27122j
					; seg2333:1C23j
		mov	word_2826C, di
		mov	sp, bp
		retn
; ---------------------------------------------------------------------------

loc_271E6::				; DATA XREF: seg2333:26D2o
		mov	es, di
		mov	si, word_2826C
		lea	di, [si-0Ch]
		mov	word_2826C, di
		call	sub_262D1
		mov	ax, [si+8]
		cmp	ax, 4001h
		jge	loc_27236
		cmp	ax, 0C001h
		jle	loc_27231
		mov	cl, 0
		mov	bx, si
		dec	ax
		jl	loc_27211
		call	sub_263E7
		mov	bx, di
		mov	cl, 1

loc_27211::				; CODE XREF: seg2333:1CF8j
		mov	ch, 0
		xchg	ch, [bx+0Ah]
		push	cx
		call	sub_26D36
		pop	cx
		cmp	cl, 1
		jnz	loc_2722E
		push	cx
		call	sub_26304
		dec	word ptr [di+8]
		push	di
		push	si
		push	si
		call	sub_255FF
		pop	cx

loc_2722E::				; CODE XREF: seg2333:1D0Ej
		mov	[si+0Ah], ch

loc_27231::				; CODE XREF: seg2333:1CF1j
					; seg2333:1D35j
		mov	word_2826C, si
		retn
; ---------------------------------------------------------------------------

loc_27236::				; CODE XREF: seg2333:1CECj
		mov	di, si
		push	word ptr [si+0Ah]
		call	sub_26304
		pop	ax
		mov	[si+0Ah], al
		dec	word ptr [si+8]
		jmp	loc_27231
; ---------------------------------------------------------------------------

loc_27247::				; DATA XREF: seg2333:26D4o
		mov	es, di
		mov	si, word_2826C
		lea	di, [si-0Ch]
		mov	word_2826C, di
		call	sub_26326
		jmp	loc_2727B
; ---------------------------------------------------------------------------

loc_27259::				; DATA XREF: seg2333:26D6o
		mov	es, di
		mov	si, word_2826C
		lea	di, [si-0Ch]
		mov	word_2826C, di
		call	sub_262D1
		jmp	loc_2727B
; ---------------------------------------------------------------------------

loc_2726B::				; DATA XREF: seg2333:26D8o
		mov	es, di
		mov	si, word_2826C
		lea	di, [si-0Ch]
		mov	word_2826C, di
		call	sub_26315

loc_2727B::				; CODE XREF: seg2333:1D47j
					; seg2333:1D59j
		call	sub_263E7
		cmp	byte ptr [di+0Ah], 0
		jnz	loc_2729D
		mov	ax, [di+8]
		cmp	ax, 0C001h
		jle	loc_27299
		cmp	ax, 4001h
		jge	loc_2729D
		call	sub_26FB6

loc_27294::				; CODE XREF: seg2333:1D9Fj
					; seg2333:1DA6j
		mov	word_2826C, si
		retn
; ---------------------------------------------------------------------------

loc_27299::				; CODE XREF: seg2333:1D7Aj
		mov	ch, 4
		jmp	loc_2729F
; ---------------------------------------------------------------------------

loc_2729D::				; CODE XREF: seg2333:1D72j
					; seg2333:1D7Fj
		mov	ch, 1

loc_2729F::				; CODE XREF: seg2333:1D8Bj
		call	sub_27C24
		mov	ax, 4001h
		mov	di, si
		mov	cl, 0
		call	sub_2634D
		cmp	ch, 1
		jnz	loc_27294
		mov	word ptr [di+6], 0C000h
		jmp	loc_27294
; ---------------------------------------------------------------------------

loc_272B8::				; DATA XREF: seg2333:26DAo
		mov	ax, offset sub_262F3
		jmp	loc_272CB
; ---------------------------------------------------------------------------

loc_272BD::				; DATA XREF: seg2333:26DCo
		mov	es, di
		mov	si, word_2826C
		lea	di, [si-0Ch]
		jmp	loc_272E4
; ---------------------------------------------------------------------------

loc_272C8::				; DATA XREF: seg2333:26DEo
		mov	ax, offset loc_262E2

loc_272CB::				; CODE XREF: seg2333:1DABj
		mov	es, di
		mov	si, word_2826C
		lea	di, [si-0Ch]
		mov	word_2826C, di
		call	ax ; sub_262F3
		push	si
		push	di
		push	si
		call	sub_257CD
		mov	word_2826C, si

loc_272E4::				; CODE XREF: seg2333:1DB6j
		mov	bp, sp
		mov	ax, 0
		push	ax
		mov	ax, [si+8]
		cmp	ax, 0Ch
		jg	loc_27340
		cmp	ax, 0FFC0h
		jle	loc_2736C
		call	sub_263CA
		inc	word ptr [di+8]
		push	word_28262
		and	byte ptr word_28262+1, 0F3h
		or	byte ptr word_28262+1, 4
		mov	si, di
		call	sub_26847
		pop	word_28262
		push	ax
		mov	di, sp
		call	sub_2644B
		dec	word ptr [si+8]
		lea	di, [si+0Ch]
		push	di
		push	si
		push	di
		call	sub_255FF
		pop	ax
		sar	ax, 1
		jnb	loc_27388
		mov	word ptr [si], 6485h
		mov	word ptr [si+2], 0F9DEh
		mov	word ptr [si+4], 0F333h
		mov	word ptr [si+6], 0B504h
		jmp	loc_2739B
; ---------------------------------------------------------------------------

loc_27340::				; CODE XREF: seg2333:1DE0j
		cmp	ax, 4001h
		jnz	loc_27355
		mov	ax, 7FFFh
		and	ax, [si+6]
		or	ax, [si+4]
		or	ax, [si+2]
		or	ax, [si]
		jnz	loc_27373

loc_27355::				; CODE XREF: seg2333:1E33j
		cmp	byte ptr [si+0Ah], 0
		jnz	loc_27381
		mov	di, si
		mov	ch, 8
		call	sub_27C24
		mov	ax, 4001h
		mov	cl, 0
		call	sub_2634D
		jmp	loc_273C1
; ---------------------------------------------------------------------------

loc_2736C::				; CODE XREF: seg2333:1DE5j
		mov	di, si
		call	sub_262D1
		jmp	loc_273C1
; ---------------------------------------------------------------------------

loc_27373::				; CODE XREF: seg2333:1E43j
		mov	word ptr [si+6], 0C000h
		mov	di, si
		mov	ch, 1
		call	sub_27C24
		jmp	loc_273C1
; ---------------------------------------------------------------------------

loc_27381::				; CODE XREF: seg2333:1E49j
		mov	di, si
		call	sub_26337
		jmp	loc_273C1
; ---------------------------------------------------------------------------

loc_27388::				; CODE XREF: seg2333:1E19j
		mov	word ptr [si], 0
		mov	word ptr [si+2], 0
		mov	word ptr [si+4], 0
		mov	word ptr [si+6], 8000h

loc_2739B::				; CODE XREF: seg2333:1E2Ej
		inc	ax
		mov	[si+8],	ax
		mov	byte ptr [si+0Ah], 0
		mov	di, si
		lea	si, [di+0Ch]
		call	sub_26EBE
		push	si
		push	di
		push	si
		call	sub_257CD
		push	si
		push	di
		push	si
		call	sub_25603
		cmp	byte ptr [bp-2], 1
		jnz	loc_273C1
		xor	byte ptr [si+0Ah], 1

loc_273C1::				; CODE XREF: seg2333:1E5Aj
					; seg2333:1E61j ...
		mov	word_2826C, si
		mov	sp, bp
		retn

; =============== S U B	R O U T	I N E =======================================


sub_273C8	proc near		; CODE XREF: sub_273F7+26p
					; sub_273F7+3Dp ...
		push	bx
		push	cx
		push	dx
		mov	cl, 4
		mov	ch, 0Ah
		mov	bx, es:[si]
		mov	al, bh
		shr	al, cl
		mul	ch
		mov	dl, 0Fh
		and	dl, bh
		add	al, dl
		mul	ch
		mov	dx, 0F0h ; 'ð'
		and	dl, bl
		shr	dx, cl
		add	ax, dx
		mov	cx, 0Ah
		mul	cx
		and	bx, 0Fh
		add	ax, bx
		pop	dx
		pop	cx
		pop	bx
		retn
sub_273C8	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_273F7	proc near		; CODE XREF: sub_278FE+7p

var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	al, es:[si+9]
		and	ax, 80h
		rol	al, 1
		mov	[di+0Ah], al
		mov	cl, 4
		mov	al, es:[si+8]
		shl	ax, cl
		shr	al, cl
		aad
		mov	di, 2710h
		mul	di
		xchg	ax, bx
		lea	si, [si+6]
		call	sub_273C8
		add	ax, bx
		adc	dl, dh
		mov	bx, dx
		mul	di
		xchg	ax, bx
		mov	cx, dx
		mul	di
		add	cx, ax
		adc	dl, dh
		sub	si, 2
		call	sub_273C8
		add	ax, bx
		adc	cx, 0
		adc	dl, dh
		push	si
		mov	bx, dx
		mul	di
		xchg	ax, cx
		mov	si, dx
		mul	di
		xchg	ax, bx
		xchg	di, dx
		mul	dx
		add	bx, si
		adc	di, ax
		pop	si
		sub	si, 2
		call	sub_273C8
		add	ax, cx
		adc	bx, dx
		adc	di, dx
		mov	si, 2710h
		mul	si
		xchg	ax, bx
		mov	cx, dx
		mul	si
		xchg	ax, si
		xchg	di, dx
		mul	dx
		add	cx, si
		adc	di, ax
		adc	dx, 0
		mov	si, [bp+var_2]
		call	sub_273C8
		add	bx, ax
		adc	cx, 0
		adc	di, 0
		adc	dx, 0
		mov	ax, 40h	; '@'

loc_27488::				; CODE XREF: sub_273F7+A0j
		or	dx, dx
		jnz	loc_27499
		sub	ax, 10h
		jz	loc_274BD
		xchg	dx, di
		xchg	di, cx
		xchg	cx, bx
		jmp	loc_27488
; ---------------------------------------------------------------------------

loc_27499::				; CODE XREF: sub_273F7+93j
		js	loc_274A6

loc_2749B::				; CODE XREF: sub_273F7+ADj
		dec	ax
		shl	bx, 1
		rcl	cx, 1
		rcl	di, 1
		adc	dx, dx
		jns	loc_2749B

loc_274A6::				; CODE XREF: sub_273F7:loc_27499j
					; sub_273F7+C9j
		mov	si, [bp+var_4]
		mov	[si], bx
		mov	[si+2],	cx
		mov	[si+4],	di
		mov	[si+6],	dx
		mov	[si+8],	ax
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retn
; ---------------------------------------------------------------------------

loc_274BD::				; CODE XREF: sub_273F7+98j
		mov	ax, 0C001h
		jmp	loc_274A6
sub_273F7	endp


; =============== S U B	R O U T	I N E =======================================


sub_274C2	proc near		; CODE XREF: sub_274E0+81p
					; sub_274E0+8Fp ...
		push	ax
		push	cx
		mov	al, 64h	; 'd'
		mov	cl, 4
		xchg	ax, dx
		div	dl
		mov	dl, ah
		aam
		shl	ah, cl
		or	ah, al
		xchg	ax, dx
		aam
		shl	ah, cl
		or	al, ah
		mov	ah, dh
		stosw
		pop	cx
		pop	ax
		retn
sub_274C2	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_274E0	proc near		; CODE XREF: sub_2792B+4p

var_2		= word ptr -2

		push	bp
		mov	bp, sp
		push	si
		push	di
		cld
		mov	ax, [si+8]
		mov	bx, [si]
		mov	cx, [si+2]
		mov	dx, [si+6]
		mov	si, [si+4]
		cmp	ax, 0
		jl	loc_27531
		sub	ax, 3Ch	; '<'
		jl	loc_2751D
		jg	loc_27533
		cmp	dx, 0DE0Bh
		jb	loc_2751D
		ja	loc_27533
		cmp	si, 6B3Ah
		jb	loc_2751D
		ja	loc_27533
		cmp	cx, 763Fh
		jb	loc_2751D
		ja	loc_27533
		cmp	bx, 0FFF0h
		ja	loc_27533

loc_2751D::				; CODE XREF: sub_274E0+1Cj
					; sub_274E0+24j ...
		mov	ah, 0
		sub	al, 4

loc_27521::				; CODE XREF: sub_274E0+4Fj
		add	al, 10h
		jg	loc_27535
		mov	ah, bh
		mov	bx, cx
		mov	cx, si
		mov	si, dx
		sub	dx, dx
		jmp	loc_27521
; ---------------------------------------------------------------------------

loc_27531::				; CODE XREF: sub_274E0+17j
		jmp	loc_2759A
; ---------------------------------------------------------------------------

loc_27533::				; CODE XREF: sub_274E0+1Ej
					; sub_274E0+26j ...
		jmp	loc_275A3
; ---------------------------------------------------------------------------

loc_27535::				; CODE XREF: sub_274E0+43j
		sub	al, 10h
		jge	loc_27547

loc_27539::				; CODE XREF: sub_274E0+65j
		shr	dx, 1
		rcr	si, 1
		rcr	cx, 1
		rcr	bx, 1
		rcr	ah, 1
		inc	al
		jl	loc_27539

loc_27547::				; CODE XREF: sub_274E0+57j
		add	ah, ah
		adc	bx, 0
		adc	cx, 0
		adc	si, 0
		adc	dx, 0
		xchg	ax, si
		mov	si, 2710h
		div	si
		xchg	ax, cx
		div	si
		xchg	ax, bx
		div	si
		call	sub_274C2
		sub	dx, dx
		xchg	ax, cx
		div	si
		xchg	ax, bx
		div	si
		xchg	ax, cx
		div	si
		call	sub_274C2
		mov	dx, bx
		xchg	ax, cx
		div	si
		xchg	ax, cx
		div	si
		call	sub_274C2
		mov	dx, cx
		div	si
		call	sub_274C2
		aam
		mov	cl, 4
		shl	ah, cl
		or	al, ah
		stosb

loc_2758D::				; CODE XREF: sub_274E0+C1j
		mov	si, [bp+var_2]
		mov	al, [si+0Ah]
		ror	al, 1
		stosb
		pop	di
		pop	si
		pop	bp
		retn
; ---------------------------------------------------------------------------

loc_2759A::				; CODE XREF: sub_274E0:loc_27531j
		mov	al, 0

loc_2759C::				; CODE XREF: sub_274E0+CAj
		mov	cx, 9
		rep stosb
		jmp	loc_2758D
; ---------------------------------------------------------------------------

loc_275A3::				; CODE XREF: sub_274E0:loc_27533j
		mov	ch, 8
		call	sub_27C24
		mov	al, 99h	; ''
		jmp	loc_2759C
sub_274E0	endp

; ---------------------------------------------------------------------------
off_275AC	dw offset loc_276B9	; DATA XREF: seg2333:21A4r
		dw offset loc_276C3
		dw offset loc_276CD
		dw offset loc_276D7
		dw offset loc_276E1
		dw offset loc_276E8
		dw offset loc_27706
		dw offset loc_276EF
off_275BC	dw offset loc_27A97	; DATA XREF: seg2333:2222r
		dw offset loc_27B0C
		dw offset loc_27B7C
		dw offset loc_27B7E
off_275C4	dw offset sub_26099	; DATA XREF: seg2333:2246r
		dw offset sub_2659A
		dw offset sub_2619D
		dw offset sub_26408
off_275CC	dw offset sub_27797	; DATA XREF: seg2333:225Br
					; seg2333:2282r
		dw offset sub_2779E
		dw offset sub_277A8
		dw offset sub_277A5
		dw offset sub_277AF
		dw offset sub_277AE
		dw offset sub_277B7
		dw offset sub_277B6
off_275DC	dw offset sub_26099	; DATA XREF: seg2333:22D2r
		dw offset sub_2659A
		dw offset sub_2619D
		dw offset sub_26408
off_275E4	dw offset sub_2601F	; DATA XREF: seg2333:22E6r
					; seg2333:22F5r
		dw offset sub_265F2
		dw offset sub_260F6
		dw offset sub_2644B
off_275EC	dw offset sub_2782F	; DATA XREF: seg2333:230Ar
		dw offset sub_27829
		dw offset sub_27890
		dw offset sub_278FE
		dw offset sub_27838
		dw offset sub_2790E
		dw offset sub_27829
		dw offset sub_278EE
off_275FC	dw offset sub_27843	; DATA XREF: seg2333:2311r
		dw offset sub_27829
		dw offset sub_2786C
		dw offset sub_2792B
		dw offset sub_278C2
		dw offset sub_27938
		dw offset sub_278C7
		dw offset sub_2791E
; ---------------------------------------------------------------------------

loc_2760C::				; CODE XREF: seg2333:2109j
		mov	ch, 1
		call	sub_27C24
		jmp	loc_27BAC
; ---------------------------------------------------------------------------

loc_27614::				; CODE XREF: seg2333:2170j
		ja	loc_2763A
		test	ah, 20h
		jnz	loc_2760C
		inc	dx
		mov	al, ah
		mov	di, ds
		and	al, 0C0h
		jz	loc_27632
		cmp	al, 80h	; ''
		mov	di, ss
		jb	loc_27632
		mov	di, [bp+0]
		ja	loc_27632
		mov	di, [bp+14h]

loc_27632::				; CODE XREF: seg2333:2112j
					; seg2333:2118j ...
		lods	byte ptr es:[si]
		xchg	ah, al
		and	al, 7
		jmp	loc_27682
; ---------------------------------------------------------------------------

loc_2763A::				; CODE XREF: seg2333:loc_27614j
		cmp	al, 9
		jnz	loc_2765D
		mov	al, ss:7
		mov	bx, es
		and	bl, 0F8h
		mov	ds, word ptr ss:0Ah
		xor	[bx+5],	al
		push	es
		pop	es
		mov	word ptr es:[si-3], 0E489h
		xor	[bx+5],	al
		jmp	loc_27BAC
; ---------------------------------------------------------------------------

loc_2765D::				; CODE XREF: seg2333:212Cj
		jmp	loc_27C61
; ---------------------------------------------------------------------------
		db 34h,	0
; ---------------------------------------------------------------------------

e086_entry:				; DATA XREF: sub_24D9+131o
		sti
		cld
		push	ax
		push	cx
		push	dx
		push	bx
		push	ds
		push	bp
		push	si
		push	di
		push	es
		mov	bp, sp
		mov	ss:32h,	bp
		les	si, [bp+12h]
		dec	si
		mov	dl, 0
		lods	word ptr es:[si]
		sub	al, 34h	; '4'
		cmp	al, 8
		jnb	loc_27614

loc_27682::				; CODE XREF: seg2333:2128j
		mov	bx, 0C007h
		and	bl, ah
		and	bh, ah
		xchg	ax, cx
		cmp	bh, 0C0h ; 'À'
		jnb	loc_276F6
		cmp	bh, 40h	; '@'
		ja	loc_276A6
		jz	loc_276AA
		sub	ax, ax
		cmp	bl, 6
		jnz	loc_276AD
		lods	word ptr es:[si]
		mov	[bp+12h], si
		mov	si, ds
		jmp	loc_2770B
; ---------------------------------------------------------------------------

loc_276A6::				; CODE XREF: seg2333:2182j
		lods	word ptr es:[si]
		jmp	loc_276AD
; ---------------------------------------------------------------------------

loc_276AA::				; CODE XREF: seg2333:2184j
		lods	byte ptr es:[si]
		cbw

loc_276AD::				; CODE XREF: seg2333:218Bj
					; seg2333:2198j
		mov	[bp+12h], si
		mov	bh, 0
		shl	bx, 1
		jmp	cs:off_275AC[bx]
; ---------------------------------------------------------------------------

loc_276B9::				; CODE XREF: seg2333:21A4j
					; DATA XREF: seg2333:off_275ACo
		add	ax, [bp+0Ah]
		add	ax, [bp+4]
		mov	si, ds
		jmp	loc_2770B
; ---------------------------------------------------------------------------

loc_276C3::				; CODE XREF: seg2333:21A4j
					; DATA XREF: seg2333:209Eo
		add	ax, [bp+0Ah]
		add	ax, [bp+2]
		mov	si, ds
		jmp	loc_2770B
; ---------------------------------------------------------------------------

loc_276CD::				; CODE XREF: seg2333:21A4j
					; DATA XREF: seg2333:20A0o
		add	ax, [bp+6]
		add	ax, [bp+4]
		mov	si, ss
		jmp	loc_2770B
; ---------------------------------------------------------------------------

loc_276D7::				; CODE XREF: seg2333:21A4j
					; DATA XREF: seg2333:20A2o
		add	ax, [bp+6]
		add	ax, [bp+2]
		mov	si, ss
		jmp	loc_2770B
; ---------------------------------------------------------------------------

loc_276E1::				; CODE XREF: seg2333:21A4j
					; DATA XREF: seg2333:20A4o
		add	ax, [bp+4]
		mov	si, ds
		jmp	loc_2770B
; ---------------------------------------------------------------------------

loc_276E8::				; CODE XREF: seg2333:21A4j
					; DATA XREF: seg2333:20A6o
		add	ax, [bp+2]
		mov	si, ds
		jmp	loc_2770B
; ---------------------------------------------------------------------------

loc_276EF::				; CODE XREF: seg2333:21A4j
					; DATA XREF: seg2333:20AAo
		add	ax, [bp+0Ah]
		mov	si, ds
		jmp	loc_2770B
; ---------------------------------------------------------------------------

loc_276F6::				; CODE XREF: seg2333:217Dj
		mov	[bp+12h], si
		mov	ax, ss
		mov	ds, ax
		mov	es, ax
		test	cl, 1
		jz	loc_27737
		jmp	loc_2771D
; ---------------------------------------------------------------------------

loc_27706::				; CODE XREF: seg2333:21A4j
					; DATA XREF: seg2333:20A8o
		add	ax, [bp+6]
		mov	si, ss

loc_2770B::				; CODE XREF: seg2333:2194j
					; seg2333:21B1j ...
		xchg	ax, si
		cmp	dl, 1
		jnz	loc_27712
		xchg	ax, di

loc_27712::				; CODE XREF: seg2333:21FFj
		mov	es, ax
		mov	ax, ss
		mov	ds, ax
		test	cl, 1
		jz	loc_27737

loc_2771D::				; CODE XREF: seg2333:21F4j
		cmp	ch, 0C0h ; 'À'
		jnb	loc_27725
		jmp	loc_277BE
; ---------------------------------------------------------------------------

loc_27725::				; CODE XREF: seg2333:2210j
		test	ch, 20h
		jnz	loc_2772D
		jmp	loc_27965
; ---------------------------------------------------------------------------

loc_2772D::				; CODE XREF: seg2333:2218j
		mov	bx, 6
		and	bl, cl
		jmp	cs:off_275BC[bx]
; ---------------------------------------------------------------------------

loc_27737::				; CODE XREF: seg2333:21F2j
					; seg2333:220Bj
		mov	ax, 38h	; '8'
		and	al, ch
		shr	ax, 1
		shr	ax, 1
		xchg	ax, bp
		cmp	ch, 0C0h ; 'À'
		jnb	loc_27770
		mov	di, word_2826C
		sub	di, 0Ch
		mov	word_2826C, di
		mov	bx, 6
		and	bl, cl
		call	cs:off_275C4[bx]
		mov	cx, ss
		mov	es, cx
		mov	si, 0Ch
		mov	bx, di
		lea	ax, [bx+si]
		mov	dx, ax
		mov	cx, 2697h
		jmp	cs:off_275CC[bp]
; ---------------------------------------------------------------------------

loc_27770::				; CODE XREF: seg2333:2234j
		mov	bh, 0
		mov	bl, cs:[bx+2]
		mov	ax, word_2826C
		add	bx, ax
		test	cl, 4
		mov	dx, ax
		jz	loc_27785
		mov	dx, bx

loc_27785::				; CODE XREF: seg2333:2271j
		sub	si, si
		test	cl, 2
		jz	loc_2778F
		mov	si, 0Ch

loc_2778F::				; CODE XREF: seg2333:227Aj
		mov	cx, 2697h
		jmp	cs:off_275CC[bp]

; =============== S U B	R O U T	I N E =======================================


sub_27797	proc near		; CODE XREF: seg2333:21A4j
					; seg2333:2222j ...
		push	ax
		push	bx
		push	dx
		push	cx
		jmp	sub_25603
sub_27797	endp


; =============== S U B	R O U T	I N E =======================================


sub_2779E	proc near		; CODE XREF: seg2333:21A4j
					; seg2333:2222j ...
		push	ax
		push	bx
		push	dx
		push	cx
		jmp	sub_257CD
sub_2779E	endp


; =============== S U B	R O U T	I N E =======================================


sub_277A5	proc near		; CODE XREF: seg2333:21A4j
					; seg2333:2222j ...
		add	si, 0Ch
sub_277A5	endp ; sp-analysis failed


; =============== S U B	R O U T	I N E =======================================


sub_277A8	proc near		; CODE XREF: seg2333:21A4j
					; seg2333:2222j ...
		push	ax
		push	bx
		push	cx
		jmp	sub_25EE9
sub_277A8	endp


; =============== S U B	R O U T	I N E =======================================


sub_277AE	proc near		; CODE XREF: seg2333:21A4j
					; seg2333:2222j ...
		xchg	ax, bx
sub_277AE	endp ; sp-analysis failed


; =============== S U B	R O U T	I N E =======================================


sub_277AF	proc near		; CODE XREF: seg2333:21A4j
					; seg2333:2222j ...
		push	ax
		push	bx
		push	dx
		push	cx
		jmp	sub_255FF
sub_277AF	endp


; =============== S U B	R O U T	I N E =======================================


sub_277B6	proc near		; CODE XREF: seg2333:21A4j
					; seg2333:2222j ...
		xchg	ax, bx
sub_277B6	endp ; sp-analysis failed


; =============== S U B	R O U T	I N E =======================================


sub_277B7	proc near		; CODE XREF: seg2333:21A4j
					; seg2333:2222j ...
		push	ax
		push	bx
		push	dx
		push	cx
		jmp	sub_2599A
sub_277B7	endp

; ---------------------------------------------------------------------------

loc_277BE::				; CODE XREF: seg2333:2212j
		mov	bp, 6
		and	bp, cx
		test	ch, 20h
		jnz	loc_2780A
		test	ch, 10h
		jnz	loc_277E7
		test	ch, 8
		jnz	loc_27826
		mov	di, word_2826C
		mov	ax, 0FFF4h
		add	di, ax
		mov	word_28264, ax
		mov	ax, 2692h
		push	ax
		jmp	cs:off_275DC[bp]
; ---------------------------------------------------------------------------

loc_277E7::				; CODE XREF: seg2333:22BBj
		mov	di, word_2826C
		xchg	si, di
		test	ch, 8
		jnz	loc_277FB
		mov	ax, 269Ch
		push	ax
		jmp	cs:off_275E4[bp]
; ---------------------------------------------------------------------------

loc_277FB::				; CODE XREF: seg2333:22E0j
		mov	word_28264, 0Ch
		mov	ax, 2692h
		push	ax
		jmp	cs:off_275E4[bp]
; ---------------------------------------------------------------------------

loc_2780A::				; CODE XREF: seg2333:22B6j
		mov	ax, 8
		and	al, ch
		or	bp, ax
		mov	ax, 269Ch
		push	ax
		test	ch, 10h
		jnz	loc_2781F
		jmp	cs:off_275EC[bp]
; ---------------------------------------------------------------------------

loc_2781F::				; CODE XREF: seg2333:2308j
		xchg	si, di
		jmp	cs:off_275FC[bp]
; ---------------------------------------------------------------------------

loc_27826::				; CODE XREF: seg2333:22C0j
		jmp	loc_27BAC

; =============== S U B	R O U T	I N E =======================================


sub_27829	proc near		; CODE XREF: seg2333:21A4j
					; seg2333:2222j ...
		mov	ch, 1
		call	sub_27C24
		retn
sub_27829	endp


; =============== S U B	R O U T	I N E =======================================


sub_2782F	proc near		; CODE XREF: seg2333:21A4j
					; seg2333:2222j ...
		mov	cl, 4
		mov	ax, es:[si+2]
		mov	dataseg@, ax
sub_2782F	endp ; sp-analysis failed


; =============== S U B	R O U T	I N E =======================================


sub_27838	proc near		; CODE XREF: seg2333:21A4j
					; seg2333:2222j ...
		mov	ax, es:[si]
		mov	word_28262, ax
		mov	ch, 0
		jmp	sub_27C24
sub_27838	endp


; =============== S U B	R O U T	I N E =======================================


sub_27843	proc near		; CODE XREF: seg2333:21A4j
					; seg2333:2222j ...
		call	sub_278C2
		call	sub_278C7
		mov	ax, off_28270
		sub	ax, word_2826C
		mov	cx, 60h	; '`'
		cmp	ax, cx
		jb	loc_27858
		xchg	ax, cx

loc_27858::				; CODE XREF: sub_27843+12j
		mov	dl, 0Ch
		div	dl
		xchg	ax, cx
		add	cx, cx
		mov	ax, 0FFFFh
		shr	ax, cl
		stosw
		sub	ax, ax
		stosw
		stosw
		stosw
		stosw
		retn
sub_27843	endp


; =============== S U B	R O U T	I N E =======================================


sub_2786C	proc near		; CODE XREF: seg2333:21A4j
					; seg2333:2222j ...
		call	sub_27843
		mov	si, word_2826C
		mov	bp, es:[di-0Ah]
		neg	bp
		dec	bp

loc_2787A::				; CODE XREF: sub_2786C+1Dj
		jz	loc_2788B
		call	sub_2625B
		add	si, 0Ch
		add	di, 0Ah
		shl	bp, 1
		shl	bp, 1
		jmp	loc_2787A
; ---------------------------------------------------------------------------

loc_2788B::				; CODE XREF: sub_2786C:loc_2787Aj
		mov	word_2826C, si
		retn
sub_2786C	endp


; =============== S U B	R O U T	I N E =======================================


sub_27890	proc near		; CODE XREF: seg2333:21A4j
					; seg2333:2222j ...
		mov	di, word_2826C
		mov	bp, es:[si+4]
		neg	bp
		dec	bp
		jz	sub_2782F
		add	si, 5Eh	; '^'

loc_278A0::				; CODE XREF: sub_27890+17j
		sub	si, 0Ah
		shr	bp, 1
		shr	bp, 1
		jnb	loc_278A0

loc_278A9::				; CODE XREF: sub_27890+26j
		sub	di, 0Ch
		call	sub_26288
		sub	si, 0Ah
		shr	bp, 1
		shr	bp, 1
		jb	loc_278A9
		add	si, 0FFFCh
		mov	word_2826C, di
		jmp	sub_2782F
sub_27890	endp


; =============== S U B	R O U T	I N E =======================================


sub_278C2	proc near		; CODE XREF: seg2333:21A4j
					; seg2333:2222j ...
		mov	ax, word_28262
		stosw
		retn
sub_278C2	endp


; =============== S U B	R O U T	I N E =======================================


sub_278C7	proc near		; CODE XREF: seg2333:21A4j
					; seg2333:2222j ...
		mov	ax, off_28270
		sub	ax, word_2826C
		mov	cx, 60h	; '`'
		cmp	ax, cx
		jb	loc_278D6
		xchg	ax, cx

loc_278D6::				; CODE XREF: sub_278C7+Cj
		neg	ax
		mov	cl, 0Ch
		idiv	cl
		and	al, 7
		mov	cl, 3
		shl	al, cl
		mov	cx, dataseg@
		and	ch, 0C7h
		or	ch, al
		xchg	ax, cx
		stosw
		retn
sub_278C7	endp


; =============== S U B	R O U T	I N E =======================================


sub_278EE	proc near		; CODE XREF: seg2333:21A4j
					; seg2333:2222j ...
		mov	di, word_2826C
		sub	di, 0Ch
		call	sub_266DE
		sub	word_2826C, 0Ch
		retn
sub_278EE	endp


; =============== S U B	R O U T	I N E =======================================


sub_278FE	proc near		; CODE XREF: seg2333:21A4j
					; seg2333:2222j ...
		mov	di, word_2826C
		sub	di, 0Ch
		call	sub_273F7
		sub	word_2826C, 0Ch
		retn
sub_278FE	endp


; =============== S U B	R O U T	I N E =======================================


sub_2790E	proc near		; CODE XREF: seg2333:21A4j
					; seg2333:2222j ...
		mov	di, word_2826C
		sub	di, 0Ch
		call	sub_26288
		sub	word_2826C, 0Ch
		retn
sub_2790E	endp


; =============== S U B	R O U T	I N E =======================================


sub_2791E	proc near		; CODE XREF: seg2333:21A4j
					; seg2333:2222j ...
		mov	si, word_2826C
		call	sub_26751

loc_27925::
		add	word_2826C, 0Ch
		retn
sub_2791E	endp


; =============== S U B	R O U T	I N E =======================================


sub_2792B	proc near		; CODE XREF: seg2333:21A4j
					; seg2333:2222j ...
		mov	si, word_2826C
		call	sub_274E0
		add	word_2826C, 0Ch
		retn
sub_2792B	endp


; =============== S U B	R O U T	I N E =======================================


sub_27938	proc near		; CODE XREF: seg2333:21A4j
					; seg2333:2222j ...
		mov	si, word_2826C
		call	sub_2625B
		add	word_2826C, 0Ch
		retn
sub_27938	endp

; ---------------------------------------------------------------------------
off_27945	dw offset loc_27984	; DATA XREF: seg2333:246Fr
		dw offset loc_279DE
		dw offset loc_27997
		dw offset loc_27992
		dw offset loc_279E5
		dw offset loc_279DE
		dw offset loc_279E5
		dw offset loc_279E5
		dw offset loc_279D9
		dw offset loc_279DE
		dw offset loc_279F6
		dw offset loc_27A01
		dw offset loc_27A01
		dw offset loc_279DE
		dw offset loc_27A01
		dw offset loc_27A01
; ---------------------------------------------------------------------------

loc_27965::				; CODE XREF: seg2333:221Aj
		mov	bh, 0
		mov	bl, cs:[bx+2]
		mov	si, word_2826C
		add	si, bx
		mov	bl, 18h
		and	bl, ch
		and	cl, 6
		or	bl, cl
		cld
		mov	cx, 6
		jmp	cs:off_27945[bx]
; ---------------------------------------------------------------------------

loc_27984::				; CODE XREF: seg2333:246Fj
					; DATA XREF: seg2333:off_27945o
		sub	word_2826C, 0Ch
		mov	di, word_2826C
		rep movsw
		jmp	loc_27BAC
; ---------------------------------------------------------------------------

loc_27992::				; CODE XREF: seg2333:246Fj
					; DATA XREF: seg2333:243Bo
		mov	di, 0Ch
		jmp	loc_2799A
; ---------------------------------------------------------------------------

loc_27997::				; CODE XREF: seg2333:246Fj
					; DATA XREF: seg2333:2439o
		mov	di, 0

loc_2799A::				; CODE XREF: seg2333:2485j
		mov	ax, off_28270
		sub	ax, 0Ch
		cmp	si, ax
		jz	loc_279B4
		xchg	di, si
		mov	ax, 4001h
		mov	cl, 0
		call	sub_2634D
		add	word_2826C, si
		jmp	loc_27A0D
; ---------------------------------------------------------------------------

loc_279B4::				; CODE XREF: seg2333:2492j
		add	di, 0Ch
		mov	dx, di
		mov	cx, si
		sub	cx, word_2826C
		jz	loc_279D3
		push	ss
		pop	es
		sub	si, 2
		mov	di, off_28270
		sub	di, 2
		std
		shr	cx, 1
		rep movsw
		cld

loc_279D3::				; CODE XREF: seg2333:24AFj
		add	word_2826C, dx
		jmp	loc_27A0D
; ---------------------------------------------------------------------------

loc_279D9::				; CODE XREF: seg2333:246Fj
					; DATA XREF: seg2333:2445o
		test	ch, 7
		jz	loc_27A0D

loc_279DE::				; CODE XREF: seg2333:246Fj
					; DATA XREF: seg2333:2437o ...
		mov	ch, 1
		call	sub_27C24
		jmp	loc_27A0D
; ---------------------------------------------------------------------------

loc_279E5::				; CODE XREF: seg2333:246Fj
					; DATA XREF: seg2333:243Do ...
		mov	di, word_2826C

loc_279E9::				; CODE XREF: seg2333:24E1j
		mov	ax, [di]
		xchg	ax, [si]
		stosw
		add	si, 2
		loop	loc_279E9
		jmp	loc_27BAC
; ---------------------------------------------------------------------------

loc_279F6::				; CODE XREF: seg2333:246Fj
					; DATA XREF: seg2333:2449o
		mov	di, si
		mov	si, word_2826C
		rep movsw
		jmp	loc_27BAC
; ---------------------------------------------------------------------------

loc_27A01::				; CODE XREF: seg2333:246Fj
					; DATA XREF: seg2333:244Bo ...
		mov	di, si
		mov	si, word_2826C
		rep movsw
		mov	word_2826C, si

loc_27A0D::				; CODE XREF: seg2333:24A2j
					; seg2333:24C7j ...
		jmp	loc_27BAC
; ---------------------------------------------------------------------------
byte_27A10	db 4			; DATA XREF: sub_27A82+1Ar
		db    4
		db    4
		db    4
		db    4
		db    4
		db    4
		db    4
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    4
		db    4
		db    8
		db    6
		db    8
		db    6
		db    4
		db    2
		db    0
		db  0Ah
		db    8
		db    4
		db    4
		db    4
		db  0Ah
		db    4
		db    4
off_27A30	dw offset sub_27A70	; DATA XREF: sub_27A82+2Fr
					; sub_27A82+45r ...
		dw offset sub_27A75
		dw offset sub_27A82
		dw offset sub_27A82
		dw offset sub_25FA9
		dw offset sub_25FE5
		dw offset sub_27A82
		dw offset sub_27A82
		dw offset sub_262D1
		dw offset loc_262E2
		dw offset sub_262F3
		dw offset sub_26304
		dw offset sub_26315
		dw offset sub_26326
		dw offset sub_26337
		dw offset sub_27A82
		dw offset sub_26EBE
		dw offset sub_26FB6
		dw offset sub_26C40
		dw offset sub_26D36
		dw offset loc_27A7A
		dw offset sub_27A82
		dw offset sub_27A82
		dw offset sub_27A82
		dw offset sub_25DE1
		dw offset loc_2706D
		dw offset loc_25D15
		dw offset sub_27A82
		dw offset sub_26847
		dw offset loc_26523
		dw offset sub_27A82
		dw offset sub_27A82

; =============== S U B	R O U T	I N E =======================================


sub_27A70	proc near		; CODE XREF: sub_27A82+2Fp
					; sub_27A82+45j ...
		xor	byte ptr [si+0Ah], 1
		retn
sub_27A70	endp


; =============== S U B	R O U T	I N E =======================================


sub_27A75	proc near		; CODE XREF: sub_27A82+2Fp
					; sub_27A82+45j ...
		mov	byte ptr [si+0Ah], 0
		retn
sub_27A75	endp

; ---------------------------------------------------------------------------

loc_27A7A::				; DATA XREF: seg2333:2548o
		push	si
		push	di
		call	sub_264EE
		pop	di
		pop	si
		retn

; =============== S U B	R O U T	I N E =======================================


sub_27A82	proc far		; CODE XREF: sub_27A82+2Fp
					; sub_27A82+45j ...
		mov	ch, 1
		call	sub_27C24
		jmp	loc_27BAC
; ---------------------------------------------------------------------------
		retn
; ---------------------------------------------------------------------------
off_27A8B	dw offset loc_27AAA	; DATA XREF: sub_27A82+23r
		dw offset loc_27AE1
		dw offset loc_27ABD
		dw offset loc_27ACC
		dw offset loc_27AE9
		dw offset loc_27AFC
; ---------------------------------------------------------------------------

loc_27A97::				; CODE XREF: seg2333:21A4j
					; seg2333:2222j
					; DATA XREF: ...
		mov	bx, 1Fh
		and	bl, ch
		mov	al, cs:byte_27A10[bx]
		cbw
		xchg	ax, di
		shl	bx, 1
		jmp	cs:off_27A8B[di]
; ---------------------------------------------------------------------------

loc_27AAA::				; CODE XREF: sub_27A82+23j
					; DATA XREF: sub_27A82:off_27A8Bo
		mov	di, word_2826C
		sub	di, 0Ch
		call	cs:off_27A30[bx]
		mov	word_2826C, di
		jmp	loc_27BAC
; ---------------------------------------------------------------------------

loc_27ABD::				; CODE XREF: sub_27A82+23j
					; DATA XREF: sub_27A82+Do
		mov	si, word_2826C
		mov	di, si
		mov	ax, 269Ch
		push	ax
		jmp	cs:off_27A30[bx]
; ---------------------------------------------------------------------------

loc_27ACC::				; CODE XREF: sub_27A82+23j
					; DATA XREF: sub_27A82+Fo
		mov	si, word_2826C
		mov	di, si
		sub	di, 0Ch
		call	cs:off_27A30[bx]
		mov	word_2826C, di
		jmp	loc_27BAC
; ---------------------------------------------------------------------------

loc_27AE1::				; CODE XREF: sub_27A82+23j
					; DATA XREF: sub_27A82+Bo
		add	word_2826C, 0Ch
		jmp	loc_27BAC
; ---------------------------------------------------------------------------

loc_27AE9::				; CODE XREF: sub_27A82+23j
					; DATA XREF: sub_27A82+11o
		mov	di, word_2826C
		lea	si, [di+0Ch]
		call	cs:off_27A30[bx]
		mov	word_2826C, si
		jmp	loc_27BAC
; ---------------------------------------------------------------------------

loc_27AFC::				; CODE XREF: sub_27A82+23j
					; DATA XREF: sub_27A82+13o
		mov	di, word_2826C
		lea	si, [di+0Ch]
		mov	ax, 269Ch
		push	ax
		jmp	cs:off_27A30[bx]
; ---------------------------------------------------------------------------

loc_27B0C::				; CODE XREF: seg2333:21A4j
					; seg2333:2222j
					; DATA XREF: ...
		and	ch, 1Fh
		cmp	ch, 3
		jnz	loc_27B69
		mov	word ptr aDivideErrorAbn+9, 2 ;	"ror\r\nAbnormal program termination\r\n"
		mov	word ptr aDivideErrorAbn+5, 6D65h ; "e error\r\nAbnormal program termination"...
		mov	word ptr aDivideErrorAbn+7, 8775h ; "error\r\nAbnormal program termination\r"...
		mov	word_28264, 0
		mov	di, off_28270
		mov	word_2826C, di
		mov	bx, off_2826E
		sub	bx, di
		neg	bx
		mov	ax, 4001h
		mov	cl, 0
		call	sub_2634D
		mov	byte ptr [di+7], 0C0h ;	'À'
		lea	si, [di+0Ah]
		sub	di, 2
		mov	cx, off_2826E
		sub	cx, di
		neg	cx
		shr	cx, 1
		std
		rep movsw
		mov	dataseg@, 4100h
		mov	word_28262, 33Fh
		jmp	loc_27B7A
; ---------------------------------------------------------------------------

loc_27B69::				; CODE XREF: sub_27A82+90j
		cmp	ch, 2
		jnz	loc_27B75
		mov	byte ptr dataseg@, 0
		jmp	loc_27B7A
; ---------------------------------------------------------------------------

loc_27B75::				; CODE XREF: sub_27A82+EAj
					; sub_27A82:loc_27B7Cj	...
		mov	ch, 1
		call	sub_27C24

loc_27B7A::				; CODE XREF: sub_27A82+E5j
					; sub_27A82+F1j
		jmp	loc_27BAC
; ---------------------------------------------------------------------------

loc_27B7C::				; CODE XREF: seg2333:21A4j
					; seg2333:2222j
					; DATA XREF: ...
		jmp	loc_27B75
; ---------------------------------------------------------------------------

loc_27B7E::				; CODE XREF: seg2333:21A4j
					; seg2333:2222j
					; DATA XREF: ...
		test	ch, 1Fh
		jnz	loc_27B75
		mov	ax, word_2826C
		sub	ax, off_28270
		mov	cl, 0Ch
		idiv	cl
		and	al, 7
		mov	cl, 3
		shl	al, cl
		mov	cx, dataseg@
		and	ch, 0C7h
		or	ch, al
		mov	[bp+10h], cx
		jmp	loc_27BAC
; ---------------------------------------------------------------------------
		mov	si, ss:4
		add	ss:0Ch,	si

loc_27BAC::				; CODE XREF: seg2333:2101j
					; seg2333:214Aj ...
		mov	ax, ss:0Eh
		cmp	ss:0Ch,	ax
		jb	loc_27BC6

loc_27BB7::				; CODE XREF: sub_27A82+152j
		mov	sp, ss:32h
		pop	es
		pop	di
		pop	si
		pop	bp
		pop	ds
		pop	bx
		pop	dx
		pop	cx
		pop	ax
		iret
; ---------------------------------------------------------------------------

loc_27BC6::				; CODE XREF: sub_27A82+133j
		mov	ch, 40h	; '@'
		mov	di, off_28270
		mov	word_2826C, di
		call	sub_27C24
		int	3		; Trap to Debugger
		jmp	loc_27BB7
sub_27A82	endp ; sp-analysis failed

; ---------------------------------------------------------------------------
		dw offset loc_270FD
		dw offset loc_27101
		dw offset loc_27105
		dw offset loc_270FD
		dw offset loc_27101
		dw offset loc_27105
		dw offset loc_271E6
		dw offset loc_27247
		dw offset loc_27259
		dw offset loc_2726B
		dw offset loc_272B8
		dw offset loc_272BD
		dw offset loc_272C8
; ---------------------------------------------------------------------------

e086_shortcut:				; DATA XREF: sub_24D9+13Bo
					; seg2333:2708r
		sti
		cld
		push	ax
		push	cx
		push	dx
		push	bx
		push	ds
		push	bp
		push	si
		push	di
		push	es
		mov	bp, sp
		mov	ss:32h,	sp
		lds	si, [bp+12h]
		lodsb
		mov	[bp+12h], si
		mov	di, ss
		mov	ds, di
		cbw
		xchg	ax, bx
		cmp	bl, 0E6h ; 'æ'
		jb	loc_27C1D
		mov	ax, offset loc_27BAC
		push	ax
		jmp	word ptr cs:e086_shortcut[bx]
; ---------------------------------------------------------------------------

loc_27C1D::				; CODE XREF: seg2333:2702j
		mov	ch, 1
		call	sub_27C24
		jmp	loc_27BAC

; =============== S U B	R O U T	I N E =======================================


sub_27C24	proc near		; CODE XREF: sub_25522+77p
					; sub_25603:loc_25769p	...
		push	ax
		push	cx
		push	ds
		push	ss
		pop	ds
		mov	al, byte ptr dataseg@
		mov	cl, byte ptr word_28262
		and	cl, 7Fh
		xor	cl, 7Fh
		or	al, ch
		mov	ah, al
		and	ah, cl
		xor	ah, al
		test	ah, 8
		jz	loc_27C45
		or	al, 20h

loc_27C45::				; CODE XREF: sub_27C24+1Dj
		test	al, cl
		jz	loc_27C58
		or	al, 80h
		mov	byte ptr dataseg@, al
		and	al, cl
		cmp	al, 20h	; ' '
		jnz	loc_27C61
		pop	ds
		pop	cx
		pop	ax
		retn
; ---------------------------------------------------------------------------

loc_27C58::				; CODE XREF: sub_27C24+23j
		and	al, 7Fh
		mov	byte ptr dataseg@, al
		pop	ds
		pop	cx
		pop	ax
		retn
; ---------------------------------------------------------------------------

loc_27C61::				; CODE XREF: seg2333:loc_2765Dj
					; sub_27C24+2Ej
		call	__fpuint
		mov	ah, 35h
		int	21h		; DOS -	2+ - GET INTERRUPT VECTOR
					; AL = interrupt number
					; Return: ES:BX	= value	of interrupt vector
		mov	ss:40h,	bx
		mov	word ptr ss:42h, es
		mov	sp, ss:32h
		pop	es
		pop	di
		pop	si
		pop	bp
		pop	ds
		pop	bx
		pop	dx
		pop	cx
		pop	ax
		jmp	dword ptr ss:40h
sub_27C24	endp

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
seg2333		ends
		end
