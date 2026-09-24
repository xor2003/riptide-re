; decomp/seg1a3f.asm — seg1a3f (extracted from RIPTIDE_.asm)
		.386p

		public	_flash_masked
		public	_mem2vga13
		public	_memget
		public	_memput
		public	_memput_masked
		public	_my_movsd

seg2608		segment	para public 'DATA' use16
seg2608		ends


; ---- segment seg1a3f ----
seg1a3f		segment	byte public 'CODE' use16
		assume cs:seg1a3f
		;org 0Eh
		assume es:nothing, ss:nothing, ds:seg2608, fs:nothing, gs:nothing

_memput_masked:
		push	bp
		mov	bp, sp
		push	ds
		push	di
		mov	dx, [bp+8]
		mov	bx, [bp+6]
		mov	ax, [bp+0Ah]
		sub	ax, bx
		lds	di, [bp+0Ch]
		les	si, [bp+10h]
		mov	bp, bx
		sub	bx, bx

across:					; CODE XREF: seg1a3f:003Dj
		mov	cx, bp

scan:					; CODE XREF: seg1a3f:0038j
		mov	bl, es:[si]
		cmp	bl, bh
		jz	skip_in
		nop
		nop
		mov	[di], bl

skip_in:				; CODE XREF: seg1a3f:002Fj
		inc	di
		inc	si
		dec	cx
		jnz	scan
		add	di, ax
		dec	dx
		jnz	across
		pop	di
		pop	ds
		pop	bp
		retf
; ---------------------------------------------------------------------------

_flash_masked:
		push	bp
		mov	bp, sp
		push	ds
		push	di
		mov	dx, [bp+8]
		mov	dh, [bp+14h]
		mov	bx, [bp+6]
		mov	ax, [bp+0Ah]
		sub	ax, bx
		lds	di, [bp+0Ch]
		les	si, [bp+10h]
		mov	bp, bx

across1:				; CODE XREF: seg1a3f:0075j
		mov	cx, bp

scan1:					; CODE XREF: seg1a3f:006Fj
		mov	bl, es:[si]
		cmp	bl, 0
		jz	skip_in1
		nop
		nop
		mov	[di], dh

skip_in1:				; CODE XREF: seg1a3f:0066j
		inc	di
		inc	si
		dec	cx
		jnz	scan1
		add	di, ax
		dec	dl
		jnz	across1
		pop	di
		pop	ds
		pop	bp
		retf
; ---------------------------------------------------------------------------

_memput:
		push	bp
		mov	bp, sp
		push	di
		push	ds

loc_1C650::
		sub	cx, cx
		mov	dx, [bp+8]
		mov	bx, [bp+6]
		mov	ax, [bp+0Ah]
		sub	ax, bx
		lds	si, [bp+10h]
		les	di, [bp+0Ch]
		mov	bp, ax
		mov	ax, bx
		and	al, 3
		shr	bx, 2

mov_doubles0:				; CODE XREF: seg1a3f:00A8j
		mov	cl, bl
		rep movs dword ptr es:[di], dword ptr ds:[si]
		mov	cl, al
		rep movsb
		add	di, bp
		dec	dx
		jnz	mov_doubles0

exit0:
		pop	ds
		pop	di
		pop	bp
		retf
; ---------------------------------------------------------------------------

_memget:
		push	bp
		mov	bp, sp
		push	di
		push	ds
		sub	cx, cx
		mov	dx, [bp+8]
		mov	bx, [bp+6]
		mov	ax, [bp+0Ah]
		sub	ax, bx
		lds	si, [bp+10h]
		les	di, [bp+0Ch]
		mov	bp, ax
		mov	ax, bx
		and	al, 3
		shr	bx, 2

mov_doubles1:				; CODE XREF: seg1a3f:00DBj
		mov	cl, bl
		rep movs dword ptr es:[di], dword ptr ds:[si]
		mov	cl, al
		rep movsb
		add	si, bp
		dec	dx
		jnz	mov_doubles1

exit1:
		pop	ds
		pop	di
		pop	bp
		retf
; ---------------------------------------------------------------------------

_mem2vga13:
		push	bp
		mov	bp, sp
		push	ds
		mov	bx, [bp+8]
		sub	bx, 140h
		lds	si, [bp+0Ah]
		mov	es, word ptr [bp+6]
		mov	di, 0
		mov	ax, 50h	; 'P'
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax

loc_1C8C9::
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx
		mov	cx, ax
		rep movs dword ptr es:[di], dword ptr ds:[si]
		add	si, bx

done:
		pop	ds
		pop	bp
		retf
		assume es:nothing

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

_my_movsd	proc far		; CODE XREF: game_manager::remove_loop(uchar *):loc_14415P
					; game_cast::remove(uchar):loc_159CEP ...

arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	ds
		mov	cx, [bp+arg_8]
		shl	cx, 1
		lds	si, [bp+arg_4]
		assume ds:nothing
		les	di, [bp+arg_0]
		rep movsw
		pop	ds
		assume ds:seg2608
		pop	bp
		retf
_my_movsd	endp

; ---------------------------------------------------------------------------
		db 0
seg1a3f		ends
		end
