; decomp/seg1a88.asm — seg1a88 (extracted from RIPTIDE_.asm)
		.386p

		public	_x_draw_span
		public	_x_explode_map
		public	_x_fill_rect
		public	_x_get_bits
		public	_x_put_bits
		public	_x_put_bits_masked
		public	_x_put_bits_masked2
		public	_x_put_bits_masked_color
		public	_x_read_pix
		public	_x_set320x200
		public	_x_set_pix
		public	_x_show_offset
		public	_x_update_map
		public	_x_vid2vid

seg2608		segment	para public 'DATA' use16
		extrn	leftclipplanemask:dword
		extrn	rightclipplanemask:dword
seg2608		ends


; ---- segment seg1a88 ----
seg1a88		segment	byte public 'CODE' use16
		assume cs:seg1a88
		assume es:nothing, ss:nothing, ds:seg2608, fs:nothing, gs:nothing

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

_x_set_pix	proc far		; CODE XREF: vga_display::set_pix(int,int,uchar)+11P

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		mov	ax, 50h	; 'P'
		mul	[bp+arg_2]
		mov	bx, [bp+arg_0]
		shr	bx, 1
		shr	bx, 1
		add	bx, ax
		add	bx, [bp+arg_4]
		mov	ax, 0A000h
		mov	es, ax
		assume es:nothing
		mov	cl, byte ptr [bp+arg_0]
		and	cl, 3
		mov	ax, 102h
		shl	ah, cl
		mov	dx, 3C4h
		out	dx, ax		; EGA: sequencer address reg
					; sequencer reset.
					; Bits of data 0-1 indicate asynchronous/synchronous reset.
		mov	al, [bp+arg_6]

loc_1CA8C::
		mov	es:[bx], al
		pop	bp
		retf
_x_set_pix	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

_x_read_pix	proc far		; CODE XREF: vga_display::read_pix(int,int)+BP

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, 50h	; 'P'
		mul	[bp+arg_2]
		mov	bx, [bp+arg_0]
		shr	bx, 2
		add	bx, ax
		add	bx, [bp+arg_4]
		mov	ax, 0A000h
		mov	es, ax
		assume es:nothing
		mov	ah, byte ptr [bp+arg_0]
		and	ah, 3
		mov	al, 4
		mov	dx, 3CEh
		out	dx, ax		; EGA: graph 1 and 2 addr reg:
					; set/reset.
					; Data bits 0-3	select planes for write	mode 00
		mov	al, es:[bx]
		sub	ah, ah
		pop	bp
		retf
_x_read_pix	endp

		assume es:nothing

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

_x_show_offset	proc far		; CODE XREF: vga_display::show_offset(uint)+1FP

arg_0		= byte ptr  6
arg_1		= byte ptr  7

		push	bp
		mov	bp, sp
		mov	bl, 0Dh
		mov	bh, [bp+arg_0]
		mov	cl, 0Ch
		mov	ch, [bp+arg_1]
		mov	dx, 3DAh

waitde:					; CODE XREF: _x_show_offset+13j
		in	al, dx		; Video	status bits:
					; 0: retrace.  1=display is in vert or horiz retrace.
					; 1: 1=light pen is triggered; 0=armed
					; 2: 1=light pen switch	is open; 0=closed
					; 3: 1=vertical	sync pulse is occurring.
		test	al, 1
		jnz	waitde
		mov	dx, 3D4h
		mov	ax, bx
		out	dx, ax		; Video: CRT cntrlr addr
					; horizontal total
		mov	ax, cx
		out	dx, ax		; Video: CRT cntrlr addr
					; horizontal total
		mov	dx, 3DAh

waitvs:					; CODE XREF: _x_show_offset+24j
		in	al, dx		; Video	status bits:
					; 0: retrace.  1=display is in vert or horiz retrace.
					; 1: 1=light pen is triggered; 0=armed
					; 2: 1=light pen switch	is open; 0=closed
					; 3: 1=vertical	sync pulse is occurring.

loc_1CADF::
		test	al, 8
		jz	waitvs
		pop	bp
		retf
_x_show_offset	endp

		assume es:seg2608

; =============== S U B	R O U T	I N E =======================================


_x_set320x200	proc far		; CODE XREF: vga_display::vga_display(uchar)+67P
					; seg1891:05D9P
		push	bp
		push	si
		push	di
		mov	ax, 13h
		int	10h		; - VIDEO - SET	VIDEO MODE
					; AL = mode
		mov	dx, 3C4h
		mov	ax, 604h
		out	dx, ax		; EGA: sequencer address reg
					; unknown register
		mov	ax, 0A000h
		mov	es, ax
		assume es:nothing
		sub	di, di
		mov	ah, 0
		mov	al, 0
		mov	cx, 8000h
		rep stosw
		mov	dx, 3D4h
		mov	ax, 14h
		out	dx, ax		; Video: CRT cntrlr addr
					; underline location.  Bits 0-5	are scan line number.
		mov	ax, 0E317h
		out	dx, ax		; Video: CRT cntrlr addr
					;
		pop	di
		pop	si
		pop	bp
		retf
_x_set320x200	endp

		assume es:nothing

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

_x_draw_span	proc far		; CODE XREF: vga_display::draw_span(int,int,uchar,int,uint)+15P

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		push	di
		cld
		mov	ax, 50h	; 'P'
		mul	[bp+arg_2]
		mov	di, [bp+arg_0]
		shr	di, 2
		add	di, ax
		add	di, [bp+arg_6]
		mov	ax, 0A000h
		mov	es, ax
		assume es:nothing
		mov	dx, 3C4h
		mov	al, 2
		out	dx, al		; EGA: sequencer address reg
					; map mask: data bits 0-3 enable writes	to bit planes 0-3
		inc	dx
		mov	si, [bp+arg_0]
		and	si, 3
		mov	bh, byte ptr leftclipplanemask[si]
		mov	si, [bp+arg_0]
		add	si, [bp+arg_4]
		and	si, 3
		mov	bl, byte ptr rightclipplanemask[si]
		mov	cx, [bp+arg_4]
		mov	si, [bp+arg_0]
		add	cx, si
		dec	cx
		and	si, 0FFFCh
		sub	cx, si
		shr	cx, 2
		jnz	span_ready
		nop
		nop
		and	bh, bl

span_ready:				; CODE XREF: _x_draw_span+4Aj
		mov	ah, [bp+arg_8]

start_span:
		mov	al, bh
		out	dx, al		; EGA port: sequencer data register
		mov	al, ah
		stosb
		dec	cx
		js	span_done
		nop
		nop
		jz	right_edge
		nop
		nop
		mov	al, 0Fh
		out	dx, al		; EGA port: sequencer data register
		mov	al, ah
		rep stosb

right_edge:				; CODE XREF: _x_draw_span+5Ej
		mov	al, bl
		out	dx, al		; EGA port: sequencer data register
		mov	al, ah
		stosb

span_done:				; CODE XREF: _x_draw_span+5Aj
		pop	di
		pop	bp
		retf
_x_draw_span	endp

		assume es:nothing

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

_x_fill_rect	proc far		; CODE XREF: vga_display::fill_rect(int,int,int,int,int,int,uchar)+25P
					; vga_display::fill_rect(int,int,int,int,int,int,uchar):loc_1B5F1P ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= byte ptr  10h

		push	bp
		mov	bp, sp
		push	di
		cld
		mov	ax, 50h	; 'P'
		mul	[bp+arg_2]
		mov	di, [bp+arg_0]
		shr	di, 2
		add	di, ax
		add	di, [bp+arg_8]
		mov	ax, 0A000h
		mov	es, ax
		assume es:nothing
		mov	dx, 3C4h
		mov	al, 2
		out	dx, al		; EGA: sequencer address reg
					; map mask: data bits 0-3 enable writes	to bit planes 0-3
		inc	dx
		mov	si, [bp+arg_0]
		and	si, 3
		mov	bh, byte ptr leftclipplanemask[si]
		mov	si, [bp+arg_4]
		and	si, 3
		mov	bl, byte ptr rightclipplanemask[si]
		mov	cx, [bp+arg_4]
		mov	si, [bp+arg_0]
		cmp	cx, si
		jle	filldone
		nop
		nop
		dec	cx
		and	si, 0FFFCh
		sub	cx, si
		shr	cx, 2
		jnz	masksset
		nop
		nop
		and	bh, bl

masksset:				; CODE XREF: _x_fill_rect+4Bj
		mov	si, [bp+arg_6]
		sub	si, [bp+arg_2]
		jle	filldone
		nop
		nop
		mov	ah, [bp+arg_A]
		mov	bp, 50h	; 'P'
		sub	bp, cx
		dec	bp

fillrowsloop:				; CODE XREF: _x_fill_rect+85j
		push	cx
		mov	al, bh
		out	dx, al		; EGA port: sequencer data register
		mov	al, ah
		stosb
		dec	cx
		js	fillloopbottom
		nop
		nop
		jz	dorightedge
		nop
		nop
		mov	al, 0Fh
		out	dx, al		; EGA port: sequencer data register
		mov	al, ah
		rep stosb

dorightedge:				; CODE XREF: _x_fill_rect+70j
		mov	al, bl
		out	dx, al		; EGA port: sequencer data register
		mov	al, ah
		stosb

fillloopbottom:				; CODE XREF: _x_fill_rect+6Cj
		add	di, bp
		pop	cx
		dec	si
		jnz	fillrowsloop

filldone:				; CODE XREF: _x_fill_rect+3Ej
					; _x_fill_rect+57j
		pop	di
		pop	bp
		retf
_x_fill_rect	endp

		assume es:nothing

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

_x_get_bits	proc far		; CODE XREF: vga_display::get_bits(int,int,int,int)+4BP

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= dword	ptr  10h

		push	bp
		mov	bp, sp
		push	di
		push	ds
		push	si
		mov	ax, 50h	; 'P'
		mul	[bp+arg_2]
		mov	bx, [bp+arg_0]
		shr	bx, 2
		add	bx, ax
		add	bx, [bp+arg_8]
		mov	ax, 0A000h
		mov	es, ax
		assume es:nothing
		mov	dx, 50h	; 'P'
		mov	ax, [bp+arg_4]
		sub	ax, [bp+arg_0]
		shr	ax, 2
		sub	dx, ax
		lds	di, [bp+arg_A]
		assume ds:nothing
		mov	cx, [bp+arg_2]

get_a_row:				; CODE XREF: _x_get_bits+61j
		push	cx
		mov	cx, [bp+arg_0]

get_row_bits:				; CODE XREF: _x_get_bits+58j
		mov	ah, cl
		and	ah, 3
		mov	al, 4
		push	dx
		mov	dx, 3CEh
		out	dx, ax		; EGA: graph 1 and 2 addr reg:
					; set/reset.
					; Data bits 0-3	select planes for write	mode 00
		pop	dx
		mov	ah, es:[bx]
		mov	[di], ah
		mov	ah, cl
		and	ah, 3
		cmp	ah, 3
		jnz	no_inc
		nop
		nop
		inc	bx

no_inc:					; CODE XREF: _x_get_bits+4Ej
		inc	di
		inc	cx
		cmp	cx, [bp+arg_4]
		jnz	get_row_bits
		add	bx, dx
		pop	cx
		inc	cx
		cmp	cx, [bp+arg_6]
		jnz	get_a_row
		pop	si
		pop	ds
		assume ds:seg2608
		pop	di
		pop	bp
		retf
_x_get_bits	endp

		assume es:seg2608

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

_x_put_bits	proc far		; CODE XREF: vga_display::put_bits(int,int,int,int,uchar *,uint,uint)+38P

var_6		= word ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= dword	ptr  12h
arg_10		= word ptr  16h
arg_12		= word ptr  18h
arg_14		= word ptr  1Ah

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	di
		push	ds
		cld
		lds	si, [bp+arg_C]
		mov	ax, 0A000h
		mov	es, ax
		assume es:nothing
		mov	ax, [bp+arg_12]
		mul	[bp+arg_A]
		add	ax, [bp+arg_8]
		add	ax, si
		mov	si, ax
		mov	ax, [bp+arg_14]
		shr	ax, 2
		mov	[bp+arg_14], ax
		mul	[bp+arg_2]
		mov	di, [bp+arg_0]
		mov	cx, di
		shr	di, 2
		add	di, ax
		add	di, [bp+arg_10]
		and	cl, 3
		mov	al, 11h
		shl	al, cl
		mov	byte ptr [bp+var_6], al
		mov	cx, [bp+arg_4]
		sub	cx, [bp+arg_0]
		jle	short copydone
		nop
		nop
		mov	[bp+var_2], cx
		mov	bx, [bp+arg_6]
		sub	bx, [bp+arg_2]
		jle	short copydone
		nop
		nop
		mov	dx, 3C4h
		mov	al, 2
		out	dx, al		; EGA: sequencer address reg
					; map mask: data bits 0-3 enable writes	to bit planes 0-3
		inc	dx

copyrowsloop:				; CODE XREF: _x_put_bits+7Bj
		mov	ax, [bp+var_6]
		mov	cx, [bp+var_2]
		push	si
		push	di

copyscanlineloop:			; CODE XREF: _x_put_bits+70j
		out	dx, al		; EGA port: sequencer data register
		movsb
		rol	al, 1
		cmc
		sbb	di, 0
		dec	cx
		jnz	copyscanlineloop
		pop	di
		add	di, [bp+arg_14]
		pop	si
		add	si, [bp+arg_12]
		dec	bx
		jnz	copyrowsloop

copydone:				; CODE XREF: _x_put_bits+47j
					; _x_put_bits+54j
		pop	ds
		pop	di
		mov	sp, bp
		pop	bp
		retf
_x_put_bits	endp

		assume es:nothing

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

_x_put_bits_masked proc	far		; CODE XREF: vga_display::put_bits_masked(int,int,int,int,uchar	*,uint,uint,uchar)+19AP

var_8		= word ptr -8
var_6		= byte ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= dword	ptr  12h
arg_10		= word ptr  16h
arg_12		= word ptr  18h
arg_14		= word ptr  1Ah

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	di
		push	ds
		mov	ax, 0A000h
		mov	es, ax
		assume es:nothing
		mov	ax, [bp+arg_4]
		sub	ax, [bp+arg_0]
		add	ax, [bp+arg_12]
		mul	[bp+arg_2]
		add	ax, [bp+arg_0]
		push	ds
		lds	dx, [bp+arg_C]
		assume ds:nothing
		mov	bx, ds
		add	ax, dx
		mov	si, ax
		pop	ds
		assume ds:seg2608
		mov	ax, [bp+arg_14]
		shr	ax, 2
		mov	[bp+arg_14], ax
		mul	[bp+arg_A]
		mov	di, [bp+arg_8]
		mov	cx, di
		shr	di, 2
		add	di, ax
		add	di, [bp+arg_10]
		and	cl, 3
		mov	al, 11h
		shl	al, cl
		mov	[bp+var_6], al
		mov	ax, [bp+arg_4]
		sub	ax, [bp+arg_0]
		jle	copydn
		nop
		nop
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_6]
		sub	ax, [bp+arg_2]
		jle	copydn

loc_1CD59::
		nop
		nop
		mov	[bp+var_8], ax
		mov	dx, 3C4h
		mov	al, 2
		out	dx, al		; EGA: sequencer address reg
					; map mask: data bits 0-3 enable writes	to bit planes 0-3
		inc	dx

copyrows:				; CODE XREF: _x_put_bits_masked+96j
		mov	al, [bp+var_6]
		mov	cx, [bp+var_2]
		push	ds
		push	di
		mov	ds, bx
		assume ds:nothing

copyscanline:				; CODE XREF: _x_put_bits_masked+89j
		mov	ah, [si]
		cmp	ah, 0
		jz	maskoff
		nop
		nop
		out	dx, al		; EGA port: sequencer data register
		mov	es:[di], ah

maskoff:				; CODE XREF: _x_put_bits_masked+7Aj
		inc	si
		rol	al, 1
		adc	di, 0
		dec	cx
		jnz	copyscanline
		pop	di
		pop	ds
		assume ds:seg2608
		add	di, [bp+arg_14]
		add	si, [bp+arg_12]
		dec	[bp+var_8]
		jnz	copyrows

copydn:					; CODE XREF: _x_put_bits_masked+50j
					; _x_put_bits_masked+5Dj
		pop	ds
		pop	di
		mov	sp, bp
		pop	bp
		retf
_x_put_bits_masked endp

		assume es:nothing

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

_x_put_bits_masked2 proc far		; CODE XREF: vga_display::put_bits_masked(int,int,int,int,uchar	*,uint,uint,uchar)+15EP

var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= dword	ptr  12h
arg_10		= word ptr  16h
arg_12		= word ptr  18h
arg_14		= word ptr  1Ah

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	di
		push	ds
		mov	ax, 0A000h
		mov	es, ax
		assume es:nothing
		mov	cx, [bp+arg_8]
		shr	cx, 2
		mov	ax, [bp+arg_14]
		shr	ax, 2
		mov	[bp+arg_14], ax
		mul	[bp+arg_A]
		add	ax, cx
		add	ax, [bp+arg_10]
		mov	[bp+var_C], ax
		mov	ax, [bp+arg_4]
		mov	bx, [bp+arg_0]
		sub	ax, bx
		mov	[bp+var_2], ax
		add	ax, [bp+arg_12]
		mov	cx, [bp+arg_2]
		mul	cx
		add	ax, bx
		lds	si, [bp+arg_C]
		assume ds:nothing
		add	si, ax
		push	si
		mov	ax, [bp+arg_6]
		sub	ax, cx
		cmp	ax, 0
		jle	putm2_done
		mov	[bp+var_8], ax
		mov	di, [bp+arg_8]
		mov	si, di
		mov	bx, 0
		and	si, 3
		mov	bl, byte ptr ds:leftclipplanemask[si]
		mov	[bp+var_6], bx
		mov	[bp+var_E], si
		mov	si, di
		add	si, [bp+var_2]
		dec	si
		and	si, 3
		mov	bl, byte ptr ds:rightclipplanemask[si]
		mov	[bp+var_A], bx
		mov	[bp+var_10], si
		mov	cx, [bp+var_2]
		mov	si, [bp+arg_8]
		add	cx, si
		dec	cx
		and	si, 0FFFCh
		sub	cx, si
		shr	cx, 2
		mov	[bp+var_4], cx
		mov	dx, 3C4h
		mov	al, 2
		out	dx, al		; EGA: sequencer address reg
					; map mask: data bits 0-3 enable writes	to bit planes 0-3
		inc	dx
		mov	cl, 0

put_one_plane:				; CODE XREF: _x_put_bits_masked2+11Fj
		mov	di, [bp+var_C]
		pop	si
		push	si
		mov	ax, 1
		shl	ax, cl
		out	dx, al		; EGA port: sequencer data register
		push	dx
		mov	dx, [bp+var_8]

start_scan_line:			; CODE XREF: _x_put_bits_masked2+117j
		mov	bx, [bp+var_E]
		add	si, cx
		sub	si, bx
		cmp	cx, bx
		jl	le_no_draw
		nop
		nop

do_left_end:
		mov	ah, [si]
		and	ah, ah
		jz	le_no_draw
		nop
		nop
		mov	es:[di], ah

le_no_draw:				; CODE XREF: _x_put_bits_masked2+AEj
					; _x_put_bits_masked2+B6j
		add	si, 4
		inc	di

do_middle:
		mov	bx, [bp+var_4]
		dec	bx
		js	right_not_valid
		nop
		nop
		jz	do_right_end
		nop
		nop

middle_loop:				; CODE XREF: _x_put_bits_masked2+F1j
		mov	ah, [si]
		and	ah, ah
		jz	??0000
		nop
		nop
		mov	es:[di], ah

??0000:					; CODE XREF: _x_put_bits_masked2+D1j
		add	si, 4
		inc	di
		dec	bx
		jz	do_right_end
		nop
		nop
		mov	ah, [si]
		and	ah, ah
		jz	??0001
		nop
		nop
		mov	es:[di], ah

??0001:					; CODE XREF: _x_put_bits_masked2+E5j
		add	si, 4
		inc	di
		dec	bx
		jnz	middle_loop

do_right_end:				; CODE XREF: _x_put_bits_masked2+C9j
					; _x_put_bits_masked2+DDj
		cmp	cx, [bp+var_10]
		jg	right_not_valid
		nop
		nop
		mov	ah, [si]
		and	ah, ah
		jz	right_not_valid
		nop
		nop
		mov	es:[di], ah

right_not_valid:			; CODE XREF: _x_put_bits_masked2+C5j
					; _x_put_bits_masked2+F6j ...
		mov	bx, [bp+arg_12]
		add	si, bx
		add	si, [bp+var_10]
		inc	si
		sub	si, cx
		add	di, [bp+arg_14]
		sub	di, [bp+var_4]
		dec	dx
		jnz	start_scan_line
		pop	dx
		inc	cl
		cmp	cl, 4
		jnz	put_one_plane

putm2_done:				; CODE XREF: _x_put_bits_masked2+4Aj
		pop	si
		pop	ds
		assume ds:seg2608
		pop	di
		mov	sp, bp
		pop	bp
		retf
_x_put_bits_masked2 endp

		assume es:nothing

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

_x_put_bits_masked_color proc far	; CODE XREF: vga_display::put_bits_masked(int,int,int,int,uchar	*,uint,uint,uchar)+118P

var_8		= word ptr -8
var_6		= byte ptr -6
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= dword	ptr  12h
arg_10		= word ptr  16h
arg_12		= word ptr  18h
arg_14		= word ptr  1Ah
arg_16		= byte ptr  1Ch

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	di
		push	ds
		mov	ax, 0A000h
		mov	es, ax
		assume es:nothing
		mov	ax, [bp+arg_4]
		sub	ax, [bp+arg_0]
		add	ax, [bp+arg_12]
		mul	[bp+arg_2]
		add	ax, [bp+arg_0]
		push	ds
		lds	dx, [bp+arg_C]
		assume ds:nothing
		mov	bx, ds
		add	ax, dx
		mov	si, ax
		pop	ds
		assume ds:seg2608
		mov	ax, [bp+arg_14]
		shr	ax, 2
		mov	[bp+arg_14], ax
		mul	[bp+arg_A]
		mov	di, [bp+arg_8]
		mov	cx, di
		shr	di, 2
		add	di, ax
		add	di, [bp+arg_10]
		and	cl, 3
		mov	al, 11h
		shl	al, cl
		mov	[bp+var_6], al
		mov	ax, [bp+arg_4]
		sub	ax, [bp+arg_0]
		jle	pbmc_copydn
		nop
		nop
		mov	[bp+var_2], ax
		mov	ax, [bp+arg_6]
		sub	ax, [bp+arg_2]
		jle	pbmc_copydn
		nop
		nop
		mov	[bp+var_8], ax
		mov	dx, 3C4h
		mov	al, 2
		out	dx, al		; EGA: sequencer address reg
					; map mask: data bits 0-3 enable writes	to bit planes 0-3
		inc	dx

pbmc_copyrows:				; CODE XREF: _x_put_bits_masked_color+98j
		mov	al, [bp+var_6]
		mov	cx, [bp+var_2]
		push	ds
		push	di
		mov	ds, bx
		assume ds:nothing

pbmc_copyscanline:			; CODE XREF: _x_put_bits_masked_color+8Bj
		mov	ah, [si]
		and	ah, ah
		jz	pbmc_maskoff
		nop
		nop
		out	dx, al		; EGA port: sequencer data register
		mov	ah, [bp+arg_16]
		mov	es:[di], ah

pbmc_maskoff:				; CODE XREF: _x_put_bits_masked_color+79j
		inc	si
		rol	al, 1
		adc	di, 0
		dec	cx
		jnz	pbmc_copyscanline
		pop	di
		pop	ds
		assume ds:seg2608
		add	di, [bp+arg_14]
		add	si, [bp+arg_12]
		dec	[bp+var_8]
		jnz	pbmc_copyrows

pbmc_copydn:				; CODE XREF: _x_put_bits_masked_color+50j
					; _x_put_bits_masked_color+5Dj
		pop	ds
		pop	di
		mov	sp, bp
		pop	bp
		retf
_x_put_bits_masked_color endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

_x_vid2vid	proc far		; CODE XREF: vga_display::copy_bits(int,int,int,int,int,int,uint,uint,uint,uint)+21P

var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh
arg_A		= word ptr  10h
arg_C		= word ptr  12h
arg_E		= word ptr  14h
arg_10		= word ptr  16h
arg_12		= word ptr  18h

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	di
		push	ds
		cld
		mov	dx, 3CEh
		mov	ax, 8
		out	dx, ax		; EGA: graph 1 and 2 addr reg:
					; bit mask
					; Bits 0-7 select bits to be masked in all planes
		mov	ax, 0A000h
		mov	es, ax
		mov	ax, [bp+arg_12]
		shr	ax, 2
		mul	[bp+arg_A]
		mov	di, [bp+arg_8]
		shr	di, 2
		add	di, ax
		add	di, [bp+arg_E]
		mov	ax, [bp+arg_10]
		shr	ax, 2
		mul	[bp+arg_2]
		mov	si, [bp+arg_0]
		mov	bx, si
		shr	si, 2
		add	si, ax
		add	si, [bp+arg_C]
		and	bx, 3
		mov	ah, byte ptr leftclipplanemask[bx]
		mov	bx, [bp+arg_4]
		and	bx, 3
		mov	al, byte ptr rightclipplanemask[bx]
		mov	bx, ax
		mov	cx, [bp+arg_4]
		mov	ax, [bp+arg_0]
		cmp	cx, ax
		jle	vv_done
		nop
		nop
		dec	cx
		and	ax, 0FFFCh
		sub	cx, ax
		shr	cx, 2
		jnz	vv_masksset
		nop
		nop
		and	bh, bl

vv_masksset:				; CODE XREF: _x_vid2vid+67j
		mov	ax, [bp+arg_6]
		sub	ax, [bp+arg_2]
		jle	vv_done
		nop
		nop
		mov	[bp+var_8], ax
		mov	ax, [bp+arg_12]
		shr	ax, 2
		sub	ax, cx
		dec	ax
		mov	[bp+var_4], ax
		mov	ax, [bp+arg_10]
		shr	ax, 2
		sub	ax, cx
		dec	ax
		mov	[bp+var_2], ax
		mov	[bp+var_6], cx
		mov	dx, 3C4h
		mov	al, 2
		out	dx, al		; EGA: sequencer address reg
					; map mask: data bits 0-3 enable writes	to bit planes 0-3
		inc	dx
		mov	ax, es
		mov	ds, ax
		assume ds:nothing

vv_copy_rows:				; CODE XREF: _x_vid2vid+C2j
		mov	cx, [bp+var_6]
		mov	al, bh
		out	dx, al		; EGA port: sequencer data register
		movsb
		dec	cx
		js	copyloopbottom
		nop
		nop
		jz	vv_dorightedge
		nop
		nop
		mov	al, 0Fh
		out	dx, al		; EGA port: sequencer data register
		rep movsb

vv_dorightedge:				; CODE XREF: _x_vid2vid+ACj
		mov	al, bl
		out	dx, al		; EGA port: sequencer data register
		movsb

copyloopbottom:				; CODE XREF: _x_vid2vid+A8j
		add	si, [bp+var_2]
		add	di, [bp+var_4]
		dec	[bp+var_8]
		jnz	vv_copy_rows

vv_done:				; CODE XREF: _x_vid2vid+5Aj
					; _x_vid2vid+73j
		mov	dx, 3CFh
		mov	al, 0FFh
		out	dx, al		; EGA port: graphics controller	data register
		pop	ds
		assume ds:seg2608
		pop	di
		mov	sp, bp
		pop	bp
		retf
_x_vid2vid	endp

		assume es:nothing

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

_x_update_map	proc far		; CODE XREF: tilemap::update(uint)+3DP

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	di
		push	ds
		mov	dx, 3CEh
		mov	ax, 8
		out	dx, ax		; EGA: graph 1 and 2 addr reg:
					; bit mask
					; Bits 0-7 select bits to be masked in all planes
		mov	di, [bp+arg_6]
		mov	si, [bp+arg_0]
		mov	cx, [bp+arg_2]
		mov	dx, 3C4h
		mov	al, 2
		out	dx, al		; EGA: sequencer address reg
					; map mask: data bits 0-3 enable writes	to bit planes 0-3
		inc	dx
		mov	al, 0Fh
		out	dx, al		; EGA port: sequencer data register
		push	dx
		mov	ax, 50h	; 'P'
		sub	ax, cx
		mov	dx, ax
		mov	bx, [bp+arg_4]
		mov	bp, cx
		mov	ax, 0A000h
		mov	es, ax
		assume es:nothing
		mov	ds, ax
		assume ds:nothing
		cld
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		sub	bx, 80h	; ''
		jz	vv4_done
		nop
		nop

do_end:					; CODE XREF: _x_update_map+445j
		mov	cx, bp
		rep movsb
		add	si, dx
		add	di, dx
		dec	bx
		jnz	do_end

vv4_done:				; CODE XREF: _x_update_map+438j
		pop	dx
		mov	dx, 3CFh
		mov	al, 0FFh
		out	dx, al		; EGA port: graphics controller	data register
		pop	ds
		assume ds:seg2608
		pop	di
		pop	bp
		retf
_x_update_map	endp

		assume es:nothing

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

_x_explode_map	proc far		; CODE XREF: tilemap::explode(void)+2FP

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= dword	ptr  0Ah
arg_8		= word ptr  0Eh
arg_A		= dword	ptr  10h
arg_E		= word ptr  14h

		push	bp
		mov	bp, sp
		push	di
		push	ds
		cld
		mov	dx, 3CEh
		mov	ax, 8
		out	dx, ax		; EGA: graph 1 and 2 addr reg:
					; bit mask
					; Bits 0-7 select bits to be masked in all planes
		mov	ax, 0A000h
		mov	es, ax
		assume es:nothing
		mov	dx, 3C4h
		mov	al, 2
		out	dx, al		; EGA: sequencer address reg
					; map mask: data bits 0-3 enable writes	to bit planes 0-3
		inc	dx
		mov	al, 0Fh
		out	dx, al		; EGA port: sequencer data register
		push	dx
		mov	bx, [bp+arg_0]
		sub	bx, 28h	; '('
		mov	[bp+arg_0], bx
		mov	ax, [bp+arg_8]
		mov	dx, 0
		mov	cx, [bp+arg_2]
		cld

exp_one_line:				; CODE XREF: _x_explode_map+1396j
		push	cx
		lds	di, [bp+arg_4]
		assume ds:nothing
		mov	bx, ax
		shl	bx, 2
		add	di, bx
		mov	bx, [di]
		lds	si, [bp+arg_A]
		assume ds:seg2608
		add	si, bx
		add	si, bx
		mov	si, [si]
		mov	di, [bp+arg_E]
		add	di, dx
		add	di, dx
		mov	di, [di]
		mov	cx, es
		mov	ds, cx
		assume ds:nothing
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		inc	dx
		inc	ax
		lds	di, [bp+arg_4]
		assume ds:nothing
		mov	bx, ax
		shl	bx, 2
		add	di, bx
		mov	bx, [di]
		lds	si, [bp+arg_A]
		assume ds:seg2608
		add	si, bx
		add	si, bx
		mov	si, [si]
		mov	di, [bp+arg_E]
		add	di, dx
		add	di, dx
		mov	di, [di]
		mov	cx, es
		mov	ds, cx
		assume ds:nothing
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		inc	dx
		inc	ax
		lds	di, [bp+arg_4]
		assume ds:nothing
		mov	bx, ax
		shl	bx, 2
		add	di, bx
		mov	bx, [di]
		lds	si, [bp+arg_A]
		assume ds:seg2608
		add	si, bx
		add	si, bx
		mov	si, [si]
		mov	di, [bp+arg_E]
		add	di, dx
		add	di, dx
		mov	di, [di]
		mov	cx, es
		mov	ds, cx
		assume ds:nothing
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		inc	dx
		inc	ax
		lds	di, [bp+arg_4]
		assume ds:nothing
		mov	bx, ax
		shl	bx, 2
		add	di, bx
		mov	bx, [di]
		lds	si, [bp+arg_A]
		assume ds:seg2608
		add	si, bx
		add	si, bx
		mov	si, [si]
		mov	di, [bp+arg_E]
		add	di, dx
		add	di, dx
		mov	di, [di]
		mov	cx, es
		mov	ds, cx
		assume ds:nothing
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		inc	dx
		inc	ax
		lds	di, [bp+arg_4]
		assume ds:nothing
		mov	bx, ax
		shl	bx, 2
		add	di, bx
		mov	bx, [di]
		lds	si, [bp+arg_A]
		assume ds:seg2608
		add	si, bx
		add	si, bx
		mov	si, [si]
		mov	di, [bp+arg_E]
		add	di, dx
		add	di, dx
		mov	di, [di]
		mov	cx, es
		mov	ds, cx
		assume ds:nothing
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		inc	dx
		inc	ax
		lds	di, [bp+arg_4]
		assume ds:nothing
		mov	bx, ax
		shl	bx, 2
		add	di, bx
		mov	bx, [di]
		lds	si, [bp+arg_A]
		assume ds:seg2608
		add	si, bx
		add	si, bx
		mov	si, [si]
		mov	di, [bp+arg_E]
		add	di, dx
		add	di, dx
		mov	di, [di]
		mov	cx, es
		mov	ds, cx
		assume ds:nothing
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		inc	dx
		inc	ax
		lds	di, [bp+arg_4]
		assume ds:nothing
		mov	bx, ax
		shl	bx, 2
		add	di, bx
		mov	bx, [di]
		lds	si, [bp+arg_A]
		assume ds:seg2608
		add	si, bx
		add	si, bx
		mov	si, [si]
		mov	di, [bp+arg_E]
		add	di, dx
		add	di, dx
		mov	di, [di]
		mov	cx, es
		mov	ds, cx
		assume ds:nothing
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		inc	dx
		inc	ax
		lds	di, [bp+arg_4]
		assume ds:nothing
		mov	bx, ax
		shl	bx, 2
		add	di, bx
		mov	bx, [di]
		lds	si, [bp+arg_A]
		assume ds:seg2608
		add	si, bx
		add	si, bx
		mov	si, [si]
		mov	di, [bp+arg_E]
		add	di, dx
		add	di, dx
		mov	di, [di]
		mov	cx, es
		mov	ds, cx
		assume ds:nothing
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		inc	dx
		inc	ax
		lds	di, [bp+arg_4]
		assume ds:nothing
		mov	bx, ax
		shl	bx, 2
		add	di, bx
		mov	bx, [di]
		lds	si, [bp+arg_A]
		assume ds:seg2608
		add	si, bx
		add	si, bx
		mov	si, [si]
		mov	di, [bp+arg_E]
		add	di, dx
		add	di, dx
		mov	di, [di]
		mov	cx, es
		mov	ds, cx
		assume ds:nothing
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		inc	dx
		inc	ax
		lds	di, [bp+arg_4]
		assume ds:nothing
		mov	bx, ax
		shl	bx, 2
		add	di, bx
		mov	bx, [di]
		lds	si, [bp+arg_A]
		assume ds:seg2608
		add	si, bx
		add	si, bx
		mov	si, [si]
		mov	di, [bp+arg_E]
		add	di, dx
		add	di, dx
		mov	di, [di]
		mov	cx, es
		mov	ds, cx
		assume ds:nothing
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		inc	dx
		inc	ax
		lds	di, [bp+arg_4]
		assume ds:nothing
		mov	bx, ax
		shl	bx, 2
		add	di, bx
		mov	bx, [di]
		lds	si, [bp+arg_A]
		assume ds:seg2608
		add	si, bx
		add	si, bx
		mov	si, [si]
		mov	di, [bp+arg_E]
		add	di, dx
		add	di, dx
		mov	di, [di]
		mov	cx, es
		mov	ds, cx
		assume ds:nothing
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		inc	dx
		inc	ax
		lds	di, [bp+arg_4]
		assume ds:nothing
		mov	bx, ax
		shl	bx, 2
		add	di, bx
		mov	bx, [di]
		lds	si, [bp+arg_A]
		assume ds:seg2608
		add	si, bx
		add	si, bx
		mov	si, [si]
		mov	di, [bp+arg_E]
		add	di, dx
		add	di, dx
		mov	di, [di]
		mov	cx, es
		mov	ds, cx
		assume ds:nothing
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		inc	dx
		inc	ax
		lds	di, [bp+arg_4]
		assume ds:nothing
		mov	bx, ax
		shl	bx, 2
		add	di, bx
		mov	bx, [di]
		lds	si, [bp+arg_A]
		assume ds:seg2608
		add	si, bx
		add	si, bx
		mov	si, [si]
		mov	di, [bp+arg_E]
		add	di, dx
		add	di, dx

loc_1DAA1::
		mov	di, [di]
		mov	cx, es
		mov	ds, cx
		assume ds:nothing
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		inc	dx
		inc	ax
		lds	di, [bp+arg_4]
		assume ds:nothing
		mov	bx, ax
		shl	bx, 2
		add	di, bx
		mov	bx, [di]
		lds	si, [bp+arg_A]
		assume ds:seg2608
		add	si, bx
		add	si, bx
		mov	si, [si]
		mov	di, [bp+arg_E]
		add	di, dx
		add	di, dx
		mov	di, [di]
		mov	cx, es
		mov	ds, cx
		assume ds:nothing
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		inc	dx
		inc	ax
		lds	di, [bp+arg_4]
		assume ds:nothing
		mov	bx, ax
		shl	bx, 2
		add	di, bx
		mov	bx, [di]
		lds	si, [bp+arg_A]
		assume ds:seg2608
		add	si, bx
		add	si, bx
		mov	si, [si]
		mov	di, [bp+arg_E]
		add	di, dx
		add	di, dx
		mov	di, [di]
		mov	cx, es
		mov	ds, cx
		assume ds:nothing
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		inc	dx
		inc	ax
		lds	di, [bp+arg_4]
		assume ds:nothing
		mov	bx, ax
		shl	bx, 2
		add	di, bx
		mov	bx, [di]
		lds	si, [bp+arg_A]
		assume ds:seg2608
		add	si, bx
		add	si, bx
		mov	si, [si]
		mov	di, [bp+arg_E]
		add	di, dx
		add	di, dx
		mov	di, [di]
		mov	cx, es
		mov	ds, cx
		assume ds:nothing
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		inc	dx
		inc	ax
		lds	di, [bp+arg_4]
		assume ds:nothing
		mov	bx, ax
		shl	bx, 2
		add	di, bx
		mov	bx, [di]
		lds	si, [bp+arg_A]
		assume ds:seg2608
		add	si, bx
		add	si, bx
		mov	si, [si]
		mov	di, [bp+arg_E]
		add	di, dx
		add	di, dx
		mov	di, [di]
		mov	cx, es
		mov	ds, cx
		assume ds:nothing
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		inc	dx
		inc	ax
		lds	di, [bp+arg_4]
		assume ds:nothing
		mov	bx, ax
		shl	bx, 2
		add	di, bx
		mov	bx, [di]
		lds	si, [bp+arg_A]
		assume ds:seg2608
		add	si, bx
		add	si, bx
		mov	si, [si]
		mov	di, [bp+arg_E]
		add	di, dx
		add	di, dx
		mov	di, [di]
		mov	cx, es
		mov	ds, cx
		assume ds:nothing
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		inc	dx
		inc	ax
		lds	di, [bp+arg_4]
		assume ds:nothing
		mov	bx, ax
		shl	bx, 2
		add	di, bx
		mov	bx, [di]
		lds	si, [bp+arg_A]
		assume ds:seg2608
		add	si, bx
		add	si, bx
		mov	si, [si]
		mov	di, [bp+arg_E]
		add	di, dx
		add	di, dx
		mov	di, [di]
		mov	cx, es
		mov	ds, cx
		assume ds:nothing
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		inc	dx
		inc	ax
		lds	di, [bp+arg_4]
		assume ds:nothing
		mov	bx, ax
		shl	bx, 2
		add	di, bx
		mov	bx, [di]
		lds	si, [bp+arg_A]
		assume ds:seg2608
		add	si, bx
		add	si, bx
		mov	si, [si]
		mov	di, [bp+arg_E]
		add	di, dx
		add	di, dx
		mov	di, [di]
		mov	cx, es
		mov	ds, cx
		assume ds:nothing
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		inc	dx
		inc	ax
		lds	di, [bp+arg_4]
		assume ds:nothing
		mov	bx, ax
		shl	bx, 2
		add	di, bx
		mov	bx, [di]
		lds	si, [bp+arg_A]
		assume ds:seg2608
		add	si, bx
		add	si, bx
		mov	si, [si]
		mov	di, [bp+arg_E]
		add	di, dx
		add	di, dx
		mov	di, [di]
		mov	cx, es
		mov	ds, cx
		assume ds:nothing
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		inc	dx
		inc	ax
		lds	di, [bp+arg_4]
		assume ds:nothing
		mov	bx, ax
		shl	bx, 2
		add	di, bx
		mov	bx, [di]
		lds	si, [bp+arg_A]
		assume ds:seg2608
		add	si, bx
		add	si, bx
		mov	si, [si]
		mov	di, [bp+arg_E]
		add	di, dx
		add	di, dx
		mov	di, [di]
		mov	cx, es
		mov	ds, cx
		assume ds:nothing
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		inc	dx
		inc	ax
		lds	di, [bp+arg_4]
		assume ds:nothing
		mov	bx, ax
		shl	bx, 2
		add	di, bx
		mov	bx, [di]
		lds	si, [bp+arg_A]
		assume ds:seg2608
		add	si, bx
		add	si, bx
		mov	si, [si]
		mov	di, [bp+arg_E]
		add	di, dx
		add	di, dx
		mov	di, [di]
		mov	cx, es
		mov	ds, cx
		assume ds:nothing
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		inc	dx
		inc	ax
		lds	di, [bp+arg_4]
		assume ds:nothing
		mov	bx, ax
		shl	bx, 2
		add	di, bx
		mov	bx, [di]
		lds	si, [bp+arg_A]
		assume ds:seg2608
		add	si, bx
		add	si, bx
		mov	si, [si]
		mov	di, [bp+arg_E]
		add	di, dx
		add	di, dx
		mov	di, [di]
		mov	cx, es
		mov	ds, cx
		assume ds:nothing
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		inc	dx
		inc	ax
		lds	di, [bp+arg_4]
		assume ds:nothing
		mov	bx, ax
		shl	bx, 2
		add	di, bx
		mov	bx, [di]
		lds	si, [bp+arg_A]
		assume ds:seg2608
		add	si, bx
		add	si, bx
		mov	si, [si]
		mov	di, [bp+arg_E]
		add	di, dx
		add	di, dx
		mov	di, [di]
		mov	cx, es
		mov	ds, cx
		assume ds:nothing
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		inc	dx
		inc	ax
		lds	di, [bp+arg_4]
		assume ds:nothing
		mov	bx, ax
		shl	bx, 2
		add	di, bx
		mov	bx, [di]
		lds	si, [bp+arg_A]
		assume ds:seg2608
		add	si, bx
		add	si, bx
		mov	si, [si]
		mov	di, [bp+arg_E]
		add	di, dx
		add	di, dx
		mov	di, [di]
		mov	cx, es
		mov	ds, cx
		assume ds:nothing
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb

loc_1E12F::
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		inc	dx
		inc	ax
		lds	di, [bp+arg_4]
		assume ds:nothing
		mov	bx, ax
		shl	bx, 2
		add	di, bx
		mov	bx, [di]
		lds	si, [bp+arg_A]
		assume ds:seg2608
		add	si, bx
		add	si, bx
		mov	si, [si]
		mov	di, [bp+arg_E]
		add	di, dx
		add	di, dx
		mov	di, [di]
		mov	cx, es
		mov	ds, cx
		assume ds:nothing
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		inc	dx
		inc	ax
		lds	di, [bp+arg_4]
		assume ds:nothing
		mov	bx, ax
		shl	bx, 2
		add	di, bx
		mov	bx, [di]
		lds	si, [bp+arg_A]
		assume ds:seg2608
		add	si, bx
		add	si, bx
		mov	si, [si]
		mov	di, [bp+arg_E]
		add	di, dx
		add	di, dx
		mov	di, [di]
		mov	cx, es
		mov	ds, cx
		assume ds:nothing
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		inc	dx
		inc	ax
		lds	di, [bp+arg_4]
		assume ds:nothing
		mov	bx, ax
		shl	bx, 2
		add	di, bx
		mov	bx, [di]
		lds	si, [bp+arg_A]
		assume ds:seg2608
		add	si, bx
		add	si, bx
		mov	si, [si]
		mov	di, [bp+arg_E]
		add	di, dx
		add	di, dx
		mov	di, [di]
		mov	cx, es
		mov	ds, cx
		assume ds:nothing
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		inc	dx
		inc	ax
		lds	di, [bp+arg_4]
		assume ds:nothing
		mov	bx, ax
		shl	bx, 2
		add	di, bx
		mov	bx, [di]
		lds	si, [bp+arg_A]
		assume ds:seg2608
		add	si, bx
		add	si, bx
		mov	si, [si]
		mov	di, [bp+arg_E]
		add	di, dx
		add	di, dx
		mov	di, [di]
		mov	cx, es
		mov	ds, cx
		assume ds:nothing
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		inc	dx
		inc	ax
		lds	di, [bp+arg_4]
		assume ds:nothing
		mov	bx, ax
		shl	bx, 2
		add	di, bx
		mov	bx, [di]
		lds	si, [bp+arg_A]
		assume ds:seg2608
		add	si, bx
		add	si, bx
		mov	si, [si]
		mov	di, [bp+arg_E]
		add	di, dx
		add	di, dx
		mov	di, [di]
		mov	cx, es
		mov	ds, cx
		assume ds:nothing
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		inc	dx
		inc	ax
		lds	di, [bp+arg_4]
		assume ds:nothing
		mov	bx, ax
		shl	bx, 2
		add	di, bx
		mov	bx, [di]
		lds	si, [bp+arg_A]
		assume ds:seg2608
		add	si, bx
		add	si, bx
		mov	si, [si]
		mov	di, [bp+arg_E]
		add	di, dx
		add	di, dx
		mov	di, [di]
		mov	cx, es
		mov	ds, cx
		assume ds:nothing
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		inc	dx
		inc	ax
		lds	di, [bp+arg_4]
		assume ds:nothing
		mov	bx, ax
		shl	bx, 2
		add	di, bx
		mov	bx, [di]
		lds	si, [bp+arg_A]
		assume ds:seg2608
		add	si, bx
		add	si, bx
		mov	si, [si]
		mov	di, [bp+arg_E]
		add	di, dx
		add	di, dx
		mov	di, [di]
		mov	cx, es
		mov	ds, cx
		assume ds:nothing
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		inc	dx
		inc	ax

loc_1E4B1::
		lds	di, [bp+arg_4]
		assume ds:nothing
		mov	bx, ax

loc_1E4B6::
		shl	bx, 2
		add	di, bx
		mov	bx, [di]
		lds	si, [bp+arg_A]
		assume ds:seg2608
		add	si, bx
		add	si, bx
		mov	si, [si]
		mov	di, [bp+arg_E]
		add	di, dx
		add	di, dx
		mov	di, [di]
		mov	cx, es
		mov	ds, cx
		assume ds:nothing
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		inc	dx
		inc	ax
		lds	di, [bp+arg_4]
		assume ds:nothing
		mov	bx, ax
		shl	bx, 2
		add	di, bx
		mov	bx, [di]
		lds	si, [bp+arg_A]
		assume ds:seg2608
		add	si, bx
		add	si, bx
		mov	si, [si]
		mov	di, [bp+arg_E]
		add	di, dx
		add	di, dx
		mov	di, [di]
		mov	cx, es
		mov	ds, cx
		assume ds:nothing
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		inc	dx
		inc	ax
		lds	di, [bp+arg_4]
		assume ds:nothing
		mov	bx, ax
		shl	bx, 2
		add	di, bx
		mov	bx, [di]
		lds	si, [bp+arg_A]
		assume ds:seg2608
		add	si, bx
		add	si, bx
		mov	si, [si]
		mov	di, [bp+arg_E]
		add	di, dx
		add	di, dx
		mov	di, [di]
		mov	cx, es
		mov	ds, cx
		assume ds:nothing
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		inc	dx
		inc	ax
		lds	di, [bp+arg_4]
		assume ds:nothing
		mov	bx, ax
		shl	bx, 2
		add	di, bx
		mov	bx, [di]
		lds	si, [bp+arg_A]
		assume ds:seg2608
		add	si, bx
		add	si, bx
		mov	si, [si]
		mov	di, [bp+arg_E]
		add	di, dx
		add	di, dx
		mov	di, [di]
		mov	cx, es
		mov	ds, cx
		assume ds:nothing
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		inc	dx
		inc	ax
		lds	di, [bp+arg_4]
		assume ds:nothing
		mov	bx, ax
		shl	bx, 2
		add	di, bx
		mov	bx, [di]
		lds	si, [bp+arg_A]
		assume ds:seg2608
		add	si, bx
		add	si, bx
		mov	si, [si]
		mov	di, [bp+arg_E]
		add	di, dx
		add	di, dx
		mov	di, [di]
		mov	cx, es
		mov	ds, cx
		assume ds:nothing
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		inc	dx
		inc	ax
		lds	di, [bp+arg_4]
		assume ds:nothing
		mov	bx, ax
		shl	bx, 2
		add	di, bx
		mov	bx, [di]
		lds	si, [bp+arg_A]
		assume ds:seg2608
		add	si, bx
		add	si, bx
		mov	si, [si]
		mov	di, [bp+arg_E]
		add	di, dx
		add	di, dx
		mov	di, [di]
		mov	cx, es
		mov	ds, cx
		assume ds:nothing
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		inc	dx
		inc	ax
		lds	di, [bp+arg_4]
		assume ds:nothing
		mov	bx, ax
		shl	bx, 2
		add	di, bx
		mov	bx, [di]
		lds	si, [bp+arg_A]
		assume ds:seg2608
		add	si, bx
		add	si, bx
		mov	si, [si]
		mov	di, [bp+arg_E]
		add	di, dx
		add	di, dx
		mov	di, [di]
		mov	cx, es
		mov	ds, cx
		assume ds:nothing
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		mov	cx, 2
		rep movsb
		add	si, 4Eh	; 'N'
		add	di, 4Eh	; 'N'
		inc	dx
		inc	ax
		add	ax, [bp+arg_0]

loc_1E818::
		pop	cx
		dec	cx
		jnz	exp_one_line
		pop	dx

loc_1E81F::
		mov	dx, 3CFh
		mov	al, 0FFh
		out	dx, al		; EGA port: graphics controller	data register
		pop	ds
		assume ds:seg2608
		pop	di
		pop	bp
		retf
_x_explode_map	endp

seg1a88		ends
		end
