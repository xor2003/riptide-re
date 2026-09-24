; decomp/seg1c64.asm — seg1c64 (extracted from RIPTIDE_.asm)
		.386p

		public	_forcepal
		public	_nullpal
		public	_paldown
		public	_palup
		public	waitvblank

seg2608		segment	para public 'DATA' use16
		extrn	tmp_rgb:byte
		extrn	target_rgb:byte
seg2608		ends


; ---- segment seg1c64 ----
seg1c64		segment	byte public 'CODE' use16
		assume cs:seg1c64
		;org 9
		assume es:nothing, ss:nothing, ds:seg2608, fs:nothing, gs:nothing
		db 0
		assume es:nothing

; =============== S U B	R O U T	I N E =======================================


_nullpal	proc far		; CODE XREF: vga_display::blank_palette(void)+3P
		mov	bx, offset tmp_rgb
		mov	ax, 0
		mov	cx, 300h

clearout:				; CODE XREF: _nullpal+Dj
		mov	[bx], al
		inc	bx
		dec	cx
		jnz	clearout
		call	waitvblank
		mov	dx, 3C8h
		mov	al, 0
		out	dx, al
		inc	dx
		mov	si, offset tmp_rgb
		mov	cx, 300h
		cld
		rep outsb

locret_1E84C::
		retf
_nullpal	endp

		assume es:nothing

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

_forcepal	proc far		; CODE XREF: de_doit(void)+1E3P
					; vga_display::set_palette(void)+9P

arg_0		= word ptr  6
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		cmp	[bp+arg_4], 1
		jz	no_vblank
		nop
		nop
		call	waitvblank

no_vblank:				; CODE XREF: _forcepal+7j
		mov	dx, 3C8h
		mov	al, 0
		out	dx, al
		inc	dx
		mov	si, [bp+arg_0]
		mov	cx, 300h
		cld
		rep outsb
		pop	bp
		retf
_forcepal	endp

		assume es:nothing

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

_palup		proc far		; CODE XREF: vga_display::fade_up(void)+7P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		mov	si, 0
		mov	ah, 0
		mov	cx, 300h

readinpal:				; CODE XREF: _palup+1Bj
		mov	al, [bx]
		mov	target_rgb[si],	al
		mov	tmp_rgb[si], ah
		inc	si
		inc	bx
		dec	cx
		jnz	readinpal
		mov	cx, 40h	; '@'

inconce:				; CODE XREF: _palup+62j
		mov	bx, 0

incpal:					; CODE XREF: _palup+4Aj
		mov	al, target_rgb[bx]
		mov	dl, tmp_rgb[bx]
		cmp	dl, al
		jz	cont
		nop
		nop
		sub	al, cl

loc_1E8A0::
		cmp	al, 0
		jg	dnt_store
		nop
		nop
		mov	tmp_rgb[bx], 0
		jmp	cont
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------

dnt_store:				; CODE XREF: _palup+35j
		mov	tmp_rgb[bx], al

cont:					; CODE XREF: _palup+2Dj _palup+3Ej
		inc	bx
		cmp	bx, 300h
		jl	incpal
		push	cx
		call	waitvblank
		mov	dx, 3C8h
		mov	al, 0
		out	dx, al
		inc	dx
		mov	si, offset tmp_rgb
		mov	cx, 300h
		cld
		rep outsb
		pop	cx
		dec	cx
		jnz	inconce
		pop	bp
		retf
_palup		endp

		assume es:nothing

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

_paldown	proc far		; CODE XREF: vga_display::fade_down(void)+7P

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	bx, [bp+arg_0]
		mov	si, 0
		mov	cx, 300h

readpal:				; CODE XREF: _paldown+16j
		mov	al, [bx]
		mov	tmp_rgb[si], al
		inc	si
		inc	bx
		dec	cx
		jnz	readpal
		mov	cx, 40h	; '@'

onecycle:				; CODE XREF: _paldown+44j
		mov	bx, 300h

decloop:				; CODE XREF: _paldown+2Cj
		cmp	tmp_rgb[bx], 0
		jz	continue
		nop
		nop
		dec	tmp_rgb[bx]

continue:				; CODE XREF: _paldown+23j
		dec	bx
		jnz	decloop
		push	cx
		call	waitvblank
		mov	dx, 3C8h
		mov	al, 0
		out	dx, al
		inc	dx
		mov	si, offset tmp_rgb
		mov	cx, 300h
		cld
		rep outsb
		pop	cx
		dec	cx
		jnz	onecycle
		pop	si
		pop	bp
		retf
_paldown	endp

		assume es:nothing

; =============== S U B	R O U T	I N E =======================================


waitvblank	proc near		; CODE XREF: _nullpal+Fp _forcepal+Bp	...
		push	es
		push	ax
		push	dx
		push	bx
		mov	ax, 40h	; '@'
		mov	es, ax
		assume es:nothing

loc_1E925::
		mov	dx, es:63h
		add	dx, 6

waitvloop:				; CODE XREF: waitvblank:loc_1E930j
		in	al, dx		; Video	status bits:
					; 0: retrace.  1=display is in vert or horiz retrace.
					; 1: 1=light pen is triggered; 0=armed
					; 2: 1=light pen switch	is open; 0=closed
					; 3: 1=vertical	sync pulse is occurring.
		test	al, 8

loc_1E930::				; DATA XREF: seg1c75:off_1E93Ao
		jz	waitvloop
		pop	bx
		pop	dx
		pop	ax
		pop	es
		assume es:nothing
		retn
waitvblank	endp

seg1c64		ends
		end
