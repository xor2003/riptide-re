	.386p
	ifndef	??version
?debug	macro
	endm
publicdll macro	name
	public	name
	endm
$comm	macro	name,dist,size,count
	comm	dist name:BYTE:count*size
	endm
	else
$comm	macro	name,dist,size,count
	comm	dist name[size]:BYTE:count
	endm
	endif
	?debug	V 300h
	?debug	S "vgadisp.cpp"
	?debug	C E9324D395D0B766761646973702E637070
	?debug	C E9324D395D09726970746964652E68
	?debug	C E9253FD45C12443A5C494E434C5544455C737464696F2E68
	?debug	C E9263FD45C12443A5C494E434C5544455C5F646566732E68
	?debug	C E9263FD45C13443A5C494E434C5544455C5F6E66696C652E68
	?debug	C E9263FD45C12443A5C494E434C5544455C5F6E756C6C2E68
	?debug	C E9263FD45C13443A5C494E434C5544455C737472696E672E68
	?debug	C E9253FD45C0F443A5C494E434C5544455C696F2E68
	?debug	C E9253FD45C12443A5C494E434C5544455C66636E746C2E68
	?debug	C E9253FD45C10443A5C494E434C5544455C646F732E68
	?debug	C E9253FD45C12443A5C494E434C5544455C636F6E696F2E68
	?debug	C E9253FD45C12443A5C494E434C5544455C616C6C6F632E68
	?debug	C E9263FD45C11443A5C494E434C5544455C74696D652E68
	?debug	C E9253FD45C10443A5C494E434C5544455C6469722E68
	?debug	C E9253FD45C10443A5C494E434C5544455C646F732E68
VGADISP_TEXT	segment byte public use16 'CODE'
VGADISP_TEXT	ends
DGROUP	group	_DATA,_BSS
	assume	cs:VGADISP_TEXT,ds:DGROUP
_DATA	segment word public use16 'DATA'
d@	label	byte
d@w	label	word
_DATA	ends
_BSS	segment word public use16 'BSS'
b@	label	byte
b@w	label	word
_BSS	ends
VGADISP_TEXT	segment byte public use16 'CODE'
   ;	
   ;	void init_display(uchar arg_0)
   ;	
	assume	cs:VGADISP_TEXT
@init_display$quc	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    display = new vga_display(arg_0);
   ;	
	mov	al,byte ptr [bp+6]
	push	ax
	push	0
	push	0
	call	far ptr @vga_display@$bctr$quc
	add	sp,6
	mov	word ptr DGROUP:_display+2,dx
	mov	word ptr DGROUP:_display,ax
   ;	
   ;	    download_pos = 0x2EE0;
   ;	
	mov	word ptr DGROUP:_download_pos,12000
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@init_display$quc	endp
   ;	
   ;	vga_display::vga_display(uchar arg_4)
   ;	
	assume	cs:VGADISP_TEXT
@vga_display@$bctr$quc	proc	far
	enter	20,0
   ;	
   ;	{
   ;	
	cmp	dword ptr [bp+6],large 0
	jne	short @2@86
	push	792
	call	far ptr @$bnew$qui
	pop	cx
	mov	word ptr [bp+8],dx
	mov	word ptr [bp+6],ax
	or	ax,dx
	je	short @2@114
@2@86:
   ;	
   ;	    REGPACK preg;
   ;	
   ;	    field_00 = arg_4;
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr [bp+10]
	mov	byte ptr es:[bx],al
   ;	
   ;	    field_05 = field_06 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,0
	mov	byte ptr es:[bx+6],al
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+5],al
   ;	
   ;	    width = 0x140;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+8],320
   ;	
   ;	    height = 0xC8;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+10],200
   ;	
   ;	    field_07 = 1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+7],1
   ;	
   ;	    field_01 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+1],0
   ;	
   ;	    get_palette();
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @vga_display@get_palette$qv
	add	sp,4
   ;	
   ;	    x_set320x200();
   ;	
	call	far ptr _x_set320x200
   ;	
   ;	    preg.r_ax = 0x1130;
   ;	
	mov	word ptr [bp-20],4400
   ;	
   ;	    preg.r_bx = 0x300;
   ;	
	mov	word ptr [bp-18],768
   ;	
   ;	    intr(0x10, &preg);
   ;	
	push	ss
	lea	ax,word ptr [bp-20]
	push	ax
	push	16
	call	far ptr _intr
	add	sp,6
   ;	
   ;	    FP_SEG(system_font_ptr) = preg.r_es;
   ;	
	mov	ax,word ptr [bp-4]
	mov	word ptr DGROUP:_system_font_ptr+2,ax
   ;	
   ;	    FP_OFF(system_font_ptr) = preg.r_bp;
   ;	
	mov	ax,word ptr [bp-12]
	mov	word ptr DGROUP:_system_font_ptr,ax
@2@114:
   ;	
   ;	}
   ;	
	mov	dx,word ptr [bp+8]
	mov	ax,word ptr [bp+6]
	leave	
	ret	
@vga_display@$bctr$quc	endp
   ;	
   ;	vga_display::~vga_display()
   ;	
	assume	cs:VGADISP_TEXT
@vga_display@$bdtr$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	
	cmp	dword ptr [bp+6],large 0
	je	short @3@142
   ;	
   ;	    set_text_mode();
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @vga_display@set_text_mode$qv
	add	sp,4
	test	word ptr [bp+10],1
	je	short @3@142
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @$bdele$qnv
	add	sp,4
@3@142:
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@vga_display@$bdtr$qv	endp
   ;	
   ;	void vga_display::set_text_mode()
   ;	
	assume	cs:VGADISP_TEXT
@vga_display@set_text_mode$qv	proc	far
	enter	16,0
   ;	
   ;	{
   ;	    REGS r;
   ;	
   ;	    r.x.ax = 3;
   ;	
	mov	word ptr [bp-16],3
   ;	
   ;	    int86(0x10, &r, &r);
   ;	
	push	ss
	lea	ax,word ptr [bp-16]
	push	ax
	push	ss
	lea	ax,word ptr [bp-16]
	push	ax
	push	16
	call	far ptr _int86
	add	sp,10
   ;	
   ;	}
   ;	
	leave	
	ret	
@vga_display@set_text_mode$qv	endp
   ;	
   ;	void vga_display::set_mode_x()
   ;	
	assume	cs:VGADISP_TEXT
@vga_display@set_mode_x$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    x_set320x200();
   ;	
	call	far ptr _x_set320x200
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@vga_display@set_mode_x$qv	endp
   ;	
   ;	uchar vga_display::doit()
   ;	
	assume	cs:VGADISP_TEXT
@vga_display@doit$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (field_05 != 0 && field_06 == 0)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+5],0
	je	short @6@114
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+6],0
	jne	short @6@114
   ;	
   ;	        return cycle();
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @vga_display@cycle$qv
	add	sp,4
	jmp	short @6@142
@6@114:
   ;	
   ;	    return 0;
   ;	
	mov	al,0
@6@142:
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@vga_display@doit$qv	endp
   ;	
   ;	void vga_display::copy_page(uchar src, uchar dst)
   ;	
	assume	cs:VGADISP_TEXT
@vga_display@copy_page$qucuc	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    copy_bits(0, 0, 0x140, 0xC8, 0, 0,
   ;	
   ;	
   ;	              page_offsets[dst], page_offsets[src], 0x140, 0x140);
   ;	
	push	320
	push	320
	mov	al,byte ptr [bp+10]
	mov	ah,0
	shl	ax,1
	mov	bx,ax
	push	word ptr DGROUP:_page_offsets[bx]
	mov	al,byte ptr [bp+12]
	mov	ah,0
	shl	ax,1
	mov	bx,ax
	push	word ptr DGROUP:_page_offsets[bx]
	push	0
	push	0
	push	200
	push	320
	push	0
	push	0
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @vga_display@copy_bits$qiiiiiiuiuiuiui
	add	sp,24
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@vga_display@copy_page$qucuc	endp
   ;	
   ;	void vga_display::turn_cycling(uchar arg_4)
   ;	
	assume	cs:VGADISP_TEXT
@vga_display@turn_cycling$quc	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (field_05 == arg_4)
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+5]
	cmp	al,byte ptr [bp+10]
	je	short @8@114
   ;	
   ;	        return;
   ;	    field_05 = arg_4;
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr [bp+10]
	mov	byte ptr es:[bx+5],al
   ;	
   ;	    if (arg_4 != 0)
   ;	
	cmp	byte ptr [bp+10],0
	jne	short @8@114
   ;	
   ;	        return;
   ;	    memcpy(palette, old_palette, 0x300);
   ;	
	push	768
	push	ds
	push	offset DGROUP:_old_palette
	push	ds
	push	offset DGROUP:_palette
	call	far ptr _memcpy
	add	sp,10
   ;	
   ;	    set_palette();
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @vga_display@set_palette$qv
	add	sp,4
@8@114:
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@vga_display@turn_cycling$quc	endp
   ;	
   ;	uchar vga_display::cycle()
   ;	
	assume	cs:VGADISP_TEXT
@vga_display@cycle$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (field_0E++ == field_0C) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+14]
	inc	byte ptr es:[bx+14]
	les	bx,dword ptr [bp+6]
	cmp	al,byte ptr es:[bx+12]
	jne	short @9@142
   ;	
   ;	        field_0E = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+14],0
   ;	
   ;	        my_movsd(palette + field_310,
   ;	
   ;	
   ;	                 (byte far *)this + field_0D * 0x30 + 0x10, field_316);
   ;	
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+790]
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+13]
	mov	ah,0
	imul	ax,ax,48
	mov	dx,word ptr [bp+6]
	add	dx,ax
	add	dx,16
	push	word ptr [bp+8]
	push	dx
	push	ds
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+784]
	add	ax,offset DGROUP:_palette
	push	ax
	call	far ptr _my_movsd
	add	sp,10
   ;	
   ;	        if (++field_0D == field_0F)
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+13]
	inc	al
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+13],al
	les	bx,dword ptr [bp+6]
	cmp	al,byte ptr es:[bx+15]
	jne	short @9@114
   ;	
   ;	            field_0D = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+13],0
@9@114:
   ;	
   ;	        return 1;
   ;	
	mov	al,1
	jmp	short @9@170
@9@142:
   ;	
   ;	    }
   ;	    return 0;
   ;	
	mov	al,0
@9@170:
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@vga_display@cycle$qv	endp
   ;	
   ;	void vga_display::setup_cycle(uchar arg_4, uchar arg_6, uchar arg_8)
   ;	
	assume	cs:VGADISP_TEXT
@vga_display@setup_cycle$qucucuc	proc	far
	enter	56,0
   ;	
   ;	{
   ;	    byte dest[0x30];
   ;	    int var_2, var_4;
   ;	    byte var_5, var_6, var_7;
   ;	
   ;	    field_0D = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+13],0
   ;	
   ;	    field_0E = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+14],0
   ;	
   ;	    field_0F = arg_6 - arg_4;
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr [bp+12]
	sub	al,byte ptr [bp+10]
	mov	byte ptr es:[bx+15],al
   ;	
   ;	    field_0C = arg_8;
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr [bp+14]
	mov	byte ptr es:[bx+12],al
   ;	
   ;	    field_310 = arg_4 * 3;
   ;	
	mov	al,byte ptr [bp+10]
	mov	ah,0
	imul	ax,ax,3
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+784],ax
   ;	
   ;	    field_312 = arg_6 * 3;
   ;	
	mov	al,byte ptr [bp+12]
	mov	ah,0
	imul	ax,ax,3
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+786],ax
   ;	
   ;	    memcpy(old_palette, palette, 0x300);
   ;	
	push	768
	push	ds
	push	offset DGROUP:_palette
	push	ds
	push	offset DGROUP:_old_palette
	call	far ptr _memcpy
	add	sp,10
   ;	
   ;	    field_314 = (arg_6 - arg_4) * 3;
   ;	
	mov	al,byte ptr [bp+12]
	mov	ah,0
	mov	dl,byte ptr [bp+10]
	mov	dh,0
	sub	ax,dx
	imul	ax,ax,3
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+788],ax
   ;	
   ;	    if (field_314 % 4)
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+788]
	mov	bx,4
	cwd	
	idiv	bx
	or	dx,dx
	je	short @10@86
   ;	
   ;	        terminate((uchar far *)"Palette cycle not a multiple of 4.", (uchar far *)0);
   ;	
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@
	call	far ptr @terminate$qnuct1
	add	sp,8
@10@86:
   ;	
   ;	    field_316 = field_314 / 4;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+788]
	mov	bx,4
	cwd	
	idiv	bx
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+790],ax
   ;	
   ;	    memcpy(dest, (byte far *)palette + arg_4 * 3, field_314);
   ;	
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+788]
	push	ds
	mov	al,byte ptr [bp+10]
	mov	ah,0
	imul	ax,ax,3
	add	ax,offset DGROUP:_palette
	push	ax
	push	ss
	lea	ax,word ptr [bp-56]
	push	ax
	call	far ptr _memcpy
	add	sp,10
   ;	
   ;	    for (var_2 = 0; var_2 < field_0F; ++var_2) {
   ;	
	mov	word ptr [bp-2],0
	jmp	@10@282
@10@114:
   ;	
   ;	        memcpy((byte far *)this + var_2 * 0x30 + 0x10, dest, field_314);
   ;	
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+788]
	push	ss
	lea	ax,word ptr [bp-56]
	push	ax
	mov	ax,word ptr [bp-2]
	imul	ax,ax,48
	mov	dx,word ptr [bp+6]
	add	dx,ax
	add	dx,16
	push	word ptr [bp+8]
	push	dx
	call	far ptr _memcpy
	add	sp,10
   ;	
   ;	        var_5 = *(dest - 3 + field_314);
   ;	
	les	bx,dword ptr [bp+6]
	mov	bx,word ptr es:[bx+788]
	lea	ax,word ptr [bp-59]
	add	bx,ax
	mov	al,byte ptr ss:[bx]
	mov	byte ptr [bp-5],al
   ;	
   ;	        var_6 = *(dest - 2 + field_314);
   ;	
	les	bx,dword ptr [bp+6]
	mov	bx,word ptr es:[bx+788]
	lea	ax,word ptr [bp-58]
	add	bx,ax
	mov	al,byte ptr ss:[bx]
	mov	byte ptr [bp-6],al
   ;	
   ;	        var_7 = *(dest - 1 + field_314);
   ;	
	les	bx,dword ptr [bp+6]
	mov	bx,word ptr es:[bx+788]
	lea	ax,word ptr [bp-57]
	add	bx,ax
	mov	al,byte ptr ss:[bx]
	mov	byte ptr [bp-7],al
   ;	
   ;	        for (var_4 = field_314; var_4 > 2; --var_4)
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+788]
	mov	word ptr [bp-4],ax
	jmp	short @10@198
@10@142:
   ;	
   ;	            dest[var_4] = *(dest - 3 + var_4);
   ;	
	lea	ax,word ptr [bp-59]
	mov	bx,word ptr [bp-4]
	add	bx,ax
	mov	al,byte ptr ss:[bx]
	lea	dx,word ptr [bp-56]
	mov	bx,word ptr [bp-4]
	add	bx,dx
	mov	byte ptr ss:[bx],al
	dec	word ptr [bp-4]
@10@198:
	cmp	word ptr [bp-4],2
	jg	short @10@142
   ;	
   ;	        dest[0] = var_5;
   ;	
	mov	al,byte ptr [bp-5]
	mov	byte ptr [bp-56],al
   ;	
   ;	        dest[1] = var_6;
   ;	
	mov	al,byte ptr [bp-6]
	mov	byte ptr [bp-55],al
   ;	
   ;	        dest[2] = var_7;
   ;	
	mov	al,byte ptr [bp-7]
	mov	byte ptr [bp-54],al
	inc	word ptr [bp-2]
@10@282:
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+15]
	mov	ah,0
	cmp	ax,word ptr [bp-2]
	jle short	@@0
	jmp	@10@114
@@0:
   ;	
   ;	    }
   ;	}
   ;	
	leave	
	ret	
@vga_display@setup_cycle$qucucuc	endp
   ;	
   ;	void vga_display::set_pix(int x, int y, uchar c)
   ;	
	assume	cs:VGADISP_TEXT
@vga_display@set_pix$qiiuc	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    x_set_pix(x, y, 0, c);
   ;	
	mov	al,byte ptr [bp+14]
	mov	ah,0
	push	ax
	push	0
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	call	far ptr _x_set_pix
	add	sp,8
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@vga_display@set_pix$qiiuc	endp
   ;	
   ;	int vga_display::read_pix(int x, int y)
   ;	
	assume	cs:VGADISP_TEXT
@vga_display@read_pix$qii	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    return x_read_pix(x, y, 0);
   ;	
	push	0
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	call	far ptr _x_read_pix
	add	sp,6
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@vga_display@read_pix$qii	endp
   ;	
   ;	void vga_display::draw_span(int x, int y, uchar c, int arg_A, uint arg_C)
   ;	
	assume	cs:VGADISP_TEXT
@vga_display@draw_span$qiiuciui	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    x_draw_span(x, y, arg_A, arg_C, c);
   ;	
	mov	al,byte ptr [bp+14]
	mov	ah,0
	push	ax
	push	word ptr [bp+18]
	push	word ptr [bp+16]
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	call	far ptr _x_draw_span
	add	sp,10
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@vga_display@draw_span$qiiuciui	endp
   ;	
   ;	void vga_display::pause(uint n)
   ;	
	assume	cs:VGADISP_TEXT
@vga_display@pause$qui	proc	far
	push	bp
	mov	bp,sp
	jmp	short @14@114
@14@58:
   ;	
   ;	{
   ;	    while (n--) {
   ;	        while (inportb(0x3DA) & 8)
   ;	
	mov	dx,986
	in	al,dx
	mov	ah,0
	test	ax,8
	jne	short @14@58
@14@86:
   ;	
   ;	            ;
   ;	        while (!(inportb(0x3DA) & 8))
   ;	
	mov	dx,986
	in	al,dx
	mov	ah,0
	test	ax,8
	je	short @14@86
@14@114:
	mov	ax,word ptr [bp+10]
	dec	word ptr [bp+10]
	or	ax,ax
	jne	short @14@58
   ;	
   ;	            ;
   ;	    }
   ;	}
   ;	
	pop	bp
	ret	
@vga_display@pause$qui	endp
   ;	
   ;	void vga_display::blank_palette()
   ;	
	assume	cs:VGADISP_TEXT
@vga_display@blank_palette$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    nullpal();
   ;	
	call	far ptr _nullpal
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@vga_display@blank_palette$qv	endp
   ;	
   ;	void vga_display::fade_up()
   ;	
	assume	cs:VGADISP_TEXT
@vga_display@fade_up$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    palup(palette);
   ;	
	push	ds
	push	offset DGROUP:_palette
	call	far ptr _palup
	add	sp,4
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@vga_display@fade_up$qv	endp
   ;	
   ;	void vga_display::fade_down()
   ;	
	assume	cs:VGADISP_TEXT
@vga_display@fade_down$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    paldown(palette);
   ;	
	push	ds
	push	offset DGROUP:_palette
	call	far ptr _paldown
	add	sp,4
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@vga_display@fade_down$qv	endp
   ;	
   ;	void vga_display::set_palette()
   ;	
	assume	cs:VGADISP_TEXT
@vga_display@set_palette$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    forcepal(palette, 0);
   ;	
	push	0
	push	ds
	push	offset DGROUP:_palette
	call	far ptr _forcepal
	add	sp,6
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@vga_display@set_palette$qv	endp
   ;	
   ;	void vga_display::get_palette()
   ;	
	assume	cs:VGADISP_TEXT
@vga_display@get_palette$qv	proc	far
	enter	24,0
   ;	
   ;	{
   ;	    REGS    inregs;
   ;	    SREGS   segregs;
   ;	
   ;	    inregs.x.ax = 0x1017;
   ;	
	mov	word ptr [bp-24],4119
   ;	
   ;	    inregs.x.bx = 0;
   ;	
	mov	word ptr [bp-22],0
   ;	
   ;	    inregs.x.cx = 0x100;
   ;	
	mov	word ptr [bp-20],256
   ;	
   ;	    inregs.x.dx = FP_OFF(palette);
   ;	
	mov	word ptr [bp-18],offset DGROUP:_palette
   ;	
   ;	    segregs.es = _DS;
   ;	
	mov	word ptr [bp-8],ds
   ;	
   ;	    pause(1);
   ;	
	push	1
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @vga_display@pause$qui
	add	sp,6
   ;	
   ;	    int86x(0x10, &inregs, &inregs, &segregs);
   ;	
	push	ss
	lea	ax,word ptr [bp-8]
	push	ax
	push	ss
	lea	ax,word ptr [bp-24]
	push	ax
	push	ss
	lea	ax,word ptr [bp-24]
	push	ax
	push	16
	call	far ptr _int86x
	add	sp,14
   ;	
   ;	}
   ;	
	leave	
	ret	
@vga_display@get_palette$qv	endp
   ;	
   ;	void vga_display::save_palette()
   ;	
	assume	cs:VGADISP_TEXT
@vga_display@save_palette$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    memcpy(spare_palette, palette, 0x300);
   ;	
	push	768
	push	ds
	push	offset DGROUP:_palette
	push	ds
	push	offset DGROUP:_spare_palette
	call	far ptr _memcpy
	add	sp,10
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@vga_display@save_palette$qv	endp
   ;	
   ;	void vga_display::restore_palette()
   ;	
	assume	cs:VGADISP_TEXT
@vga_display@restore_palette$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    memcpy(palette, spare_palette, 0x300);
   ;	
	push	768
	push	ds
	push	offset DGROUP:_spare_palette
	push	ds
	push	offset DGROUP:_palette
	call	far ptr _memcpy
	add	sp,10
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@vga_display@restore_palette$qv	endp
   ;	
   ;	void vga_display::print_at(int x, int y, uchar far *s)
   ;	
	assume	cs:VGADISP_TEXT
@vga_display@print_at$qiinuc	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (x == -1)
   ;	
	cmp	word ptr [bp+10],-1
	jne	short @22@86
   ;	
   ;	        x = 0x14 - (strlen((char far *)s) >> 1);
   ;	
	push	word ptr [bp+16]
	push	word ptr [bp+14]
	call	far ptr _strlen
	add	sp,4
	shr	ax,1
	mov	dx,20
	sub	dx,ax
	mov	word ptr [bp+10],dx
@22@86:
   ;	
   ;	    if (y == -1)
   ;	
	cmp	word ptr [bp+12],-1
	jne	short @22@142
   ;	
   ;	        y = 0x0C;
   ;	
	mov	word ptr [bp+12],12
@22@142:
   ;	
   ;	    vga_text(x << 3, y << 3, s, display->field_04, display->field_01);
   ;	
	les	bx,dword ptr DGROUP:_display
	mov	al,byte ptr es:[bx+1]
	push	ax
	les	bx,dword ptr DGROUP:_display
	mov	al,byte ptr es:[bx+4]
	push	ax
	push	word ptr [bp+16]
	push	word ptr [bp+14]
	mov	ax,word ptr [bp+12]
	shl	ax,3
	push	ax
	mov	ax,word ptr [bp+10]
	shl	ax,3
	push	ax
	call	far ptr @vga_text$qiinucucuc
	add	sp,12
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@vga_display@print_at$qiinuc	endp
   ;	
   ;	void vga_display::print_at_xy(int x, int y, uchar far *s, uchar arg_C)
   ;	
	assume	cs:VGADISP_TEXT
@vga_display@print_at_xy$qiinucuc	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (arg_C != 0)
   ;	
	cmp	byte ptr [bp+18],0
	je	short @23@86
   ;	
   ;	        x = 0xA0 - ((strlen((char far *)s) << 3) >> 1);
   ;	
	push	word ptr [bp+16]
	push	word ptr [bp+14]
	call	far ptr _strlen
	add	sp,4
	shl	ax,3
	shr	ax,1
	mov	dx,160
	sub	dx,ax
	mov	word ptr [bp+10],dx
@23@86:
   ;	
   ;	    if (display->field_01 != 0)
   ;	
	les	bx,dword ptr DGROUP:_display
	cmp	byte ptr es:[bx+1],0
	je	short @23@142
   ;	
   ;	        vga_text(x + 1, y + 1, s, 0, 0);
   ;	
	push	0
	push	0
	push	word ptr [bp+16]
	push	word ptr [bp+14]
	mov	ax,word ptr [bp+12]
	inc	ax
	push	ax
	mov	ax,word ptr [bp+10]
	inc	ax
	push	ax
	call	far ptr @vga_text$qiinucucuc
	add	sp,12
@23@142:
   ;	
   ;	    vga_text(x, y, s, display->field_04, display->field_01);
   ;	
	les	bx,dword ptr DGROUP:_display
	mov	al,byte ptr es:[bx+1]
	push	ax
	les	bx,dword ptr DGROUP:_display
	mov	al,byte ptr es:[bx+4]
	push	ax
	push	word ptr [bp+16]
	push	word ptr [bp+14]
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	call	far ptr @vga_text$qiinucucuc
	add	sp,12
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@vga_display@print_at_xy$qiinucuc	endp
   ;	
   ;	void vga_display::fill_rect(int x1, int y1, int x2, int y2,
   ;	
	assume	cs:VGADISP_TEXT
@vga_display@fill_rect$qiiiiiiuc	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	                            int arg_C, int arg_E, uchar arg_10)
   ;	{
   ;	    if (arg_E != -1) {
   ;	
	cmp	word ptr [bp+20],-1
	je	short @24@86
   ;	
   ;	        x_fill_rect(x1, y1, x2, y2, page_offsets[arg_10], arg_E);
   ;	
	push	word ptr [bp+20]
	mov	al,byte ptr [bp+22]
	mov	ah,0
	shl	ax,1
	mov	bx,ax
	push	word ptr DGROUP:_page_offsets[bx]
	push	word ptr [bp+16]
	push	word ptr [bp+14]
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	call	far ptr _x_fill_rect
	add	sp,12
   ;	
   ;	        x_fill_rect(x1 + 1, y1 + 1, x2 - 1, y2 - 1, page_offsets[arg_10], arg_C);
   ;	
	push	word ptr [bp+18]
	mov	al,byte ptr [bp+22]
	mov	ah,0
	shl	ax,1
	mov	bx,ax
	push	word ptr DGROUP:_page_offsets[bx]
	mov	ax,word ptr [bp+16]
	dec	ax
	push	ax
	mov	ax,word ptr [bp+14]
	dec	ax
	push	ax
	mov	ax,word ptr [bp+12]
	inc	ax
	push	ax
	mov	ax,word ptr [bp+10]
	inc	ax
	push	ax
	jmp	short @24@114
@24@86:
   ;	
   ;	    } else {
   ;	        x_fill_rect(x1, y1, x2, y2, page_offsets[arg_10], arg_C);
   ;	
	push	word ptr [bp+18]
	mov	al,byte ptr [bp+22]
	mov	ah,0
	shl	ax,1
	mov	bx,ax
	push	word ptr DGROUP:_page_offsets[bx]
	push	word ptr [bp+16]
	push	word ptr [bp+14]
	push	word ptr [bp+12]
	push	word ptr [bp+10]
@24@114:
	call	far ptr _x_fill_rect
	add	sp,12
   ;	
   ;	    }
   ;	}
   ;	
	pop	bp
	ret	
@vga_display@fill_rect$qiiiiiiuc	endp
   ;	
   ;	void vga_display::show_offset(uint arg_4)
   ;	
	assume	cs:VGADISP_TEXT
@vga_display@show_offset$qui	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (field_00 != 0)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx],0
	je	short @25@86
   ;	
   ;	        terminate((uchar far *)"Not in Mode X - aborted.", (uchar far *)0);
   ;	
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+35
	call	far ptr @terminate$qnuct1
	add	sp,8
@25@86:
   ;	
   ;	    x_show_offset(arg_4);
   ;	
	push	word ptr [bp+10]
	call	far ptr _x_show_offset
	pop	cx
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@vga_display@show_offset$qui	endp
   ;	
   ;	void vga_display::cls(uchar arg_4, uchar arg_6)
   ;	
	assume	cs:VGADISP_TEXT
@vga_display@cls$qucuc	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    x_fill_rect(0, 0, 0x140, 0xC8, page_offsets[arg_6], arg_4);
   ;	
	mov	al,byte ptr [bp+10]
	mov	ah,0
	push	ax
	mov	al,byte ptr [bp+12]
	mov	ah,0
	shl	ax,1
	mov	bx,ax
	push	word ptr DGROUP:_page_offsets[bx]
	push	200
	push	320
	push	0
	push	0
	call	far ptr _x_fill_rect
	add	sp,12
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@vga_display@cls$qucuc	endp
   ;	
   ;	void far *vga_display::get_bits(int x, int y, int x2, int y2)
   ;	
	assume	cs:VGADISP_TEXT
@vga_display@get_bits$qiiii	proc	far
	enter	6,0
   ;	
   ;	{
   ;	    int   var_2;
   ;	    void far *var_6;
   ;	
   ;	    var_2 = (x2 - x) * (y2 - y);
   ;	
	mov	ax,word ptr [bp+14]
	sub	ax,word ptr [bp+10]
	mov	dx,word ptr [bp+16]
	sub	dx,word ptr [bp+12]
	imul	dx
	mov	word ptr [bp-2],ax
   ;	
   ;	    var_6 = new char[var_2];
   ;	
	push	word ptr [bp-2]
	call	far ptr @$bnew$qui
	pop	cx
	mov	word ptr [bp-4],dx
	mov	word ptr [bp-6],ax
   ;	
   ;	    if (var_6 == 0)
   ;	
	cmp	dword ptr [bp-6],large 0
	jne	short @27@86
   ;	
   ;	        no_heap((uchar far *)"Getting screen bits.");
   ;	
	push	ds
	push	offset DGROUP:s@+60
	call	far ptr @no_heap$qnuc
	add	sp,4
@27@86:
   ;	
   ;	    x_get_bits(x, y, x2, y2, 0, var_6);
   ;	
	push	word ptr [bp-4]
	push	word ptr [bp-6]
	push	0
	push	word ptr [bp+16]
	push	word ptr [bp+14]
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	call	far ptr _x_get_bits
	add	sp,14
   ;	
   ;	    return var_6;
   ;	
	mov	dx,word ptr [bp-4]
	mov	ax,word ptr [bp-6]
   ;	
   ;	}
   ;	
	leave	
	ret	
@vga_display@get_bits$qiiii	endp
   ;	
   ;	void vga_display::copy_bits(int a4, int a6, int a8, int aA, int aC, int aE,
   ;	
	assume	cs:VGADISP_TEXT
@vga_display@copy_bits$qiiiiiiuiuiuiui	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	                          uint a10, uint a12, uint a14, uint a16)
   ;	{
   ;	    x_vid2vid(a4, a6, a8, aA, aC, aE, a10, a12, a14, a16);
   ;	
	push	word ptr [bp+28]
	push	word ptr [bp+26]
	push	word ptr [bp+24]
	push	word ptr [bp+22]
	push	word ptr [bp+20]
	push	word ptr [bp+18]
	push	word ptr [bp+16]
	push	word ptr [bp+14]
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	call	far ptr _x_vid2vid
	add	sp,20
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@vga_display@copy_bits$qiiiiiiuiuiuiui	endp
   ;	
   ;	void vga_display::put_bits(int x, int y, int x2, int y2, uchar far *bits,
   ;	
	assume	cs:VGADISP_TEXT
@vga_display@put_bits$qiiiinucuiui	proc	far
	enter	2,0
   ;	
   ;	                          uint arg_10, uint arg_12)
   ;	{
   ;	    int var_2;
   ;	
   ;	    var_2 = x2 - x;
   ;	
	mov	ax,word ptr [bp+14]
	sub	ax,word ptr [bp+10]
	mov	word ptr [bp-2],ax
   ;	
   ;	    if (arg_10 == 0)
   ;	
	cmp	word ptr [bp+22],0
	jne	short @29@86
   ;	
   ;	        arg_10 = var_2;
   ;	
	mov	ax,word ptr [bp-2]
	mov	word ptr [bp+22],ax
@29@86:
   ;	
   ;	    x_put_bits(x, y, x2, y2, 0, 0, bits, arg_12, arg_10, 0x140);
   ;	
	push	320
	push	word ptr [bp+22]
	push	word ptr [bp+24]
	push	word ptr [bp+20]
	push	word ptr [bp+18]
	push	0
	push	0
	push	word ptr [bp+16]
	push	word ptr [bp+14]
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	call	far ptr _x_put_bits
	add	sp,22
   ;	
   ;	}
   ;	
	leave	
	ret	
@vga_display@put_bits$qiiiinucuiui	endp
   ;	
   ;	void vga_display::put_bits_masked(int arg_4, int arg_6, int arg_8, int arg_A,
   ;	
	assume	cs:VGADISP_TEXT
@vga_display@put_bits_masked$qiiiinucuiuiuc	proc	far
	enter	12,0
   ;	
   ;	                          uchar far *bits, uint arg_10, uint arg_12, uchar arg_14)
   ;	{
   ;	    int var_2, var_4, var_6, var_8, var_A, var_C;
   ;	
   ;	    var_2 = arg_8 - arg_4;
   ;	
	mov	ax,word ptr [bp+14]
	sub	ax,word ptr [bp+10]
	mov	word ptr [bp-2],ax
   ;	
   ;	    var_4 = arg_A - arg_6;
   ;	
	mov	ax,word ptr [bp+16]
	sub	ax,word ptr [bp+12]
	mov	word ptr [bp-4],ax
   ;	
   ;	    if (arg_10 == 0)
   ;	
	cmp	word ptr [bp+22],0
	jne	short @30@86
   ;	
   ;	        arg_10 = var_2;
   ;	
	mov	ax,word ptr [bp-2]
	mov	word ptr [bp+22],ax
@30@86:
   ;	
   ;	    if (field_07 != 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+7],0
	je	short @30@142
   ;	
   ;	        var_A = var_2;
   ;	
	mov	ax,word ptr [bp-2]
	mov	word ptr [bp-10],ax
   ;	
   ;	        var_C = var_4;
   ;	
	mov	ax,word ptr [bp-4]
	mov	word ptr [bp-12],ax
   ;	
   ;	        var_6 = 0;
   ;	
	mov	word ptr [bp-6],0
   ;	
   ;	        var_8 = 0;
   ;	
	mov	word ptr [bp-8],0
   ;	
   ;	    } else {
   ;	
	jmp	@30@422
@30@142:
   ;	
   ;	        var_C = var_4;
   ;	
	mov	ax,word ptr [bp-4]
	mov	word ptr [bp-12],ax
   ;	
   ;	        if (arg_6 >= 0) {
   ;	
	cmp	word ptr [bp+12],0
	jl	short @30@254
   ;	
   ;	            var_8 = 0;
   ;	
	mov	word ptr [bp-8],0
   ;	
   ;	            if (height < arg_A)
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+10]
	cmp	ax,word ptr [bp+16]
	jge	short @30@282
   ;	
   ;	                var_C = var_4 - (arg_6 + var_4 - height);
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp+12]
	add	ax,word ptr [bp-4]
	sub	ax,word ptr es:[bx+10]
	mov	dx,word ptr [bp-4]
	sub	dx,ax
	mov	word ptr [bp-12],dx
	jmp	short @30@282
   ;	
   ;	        } else {
   ;	
	jmp	short @30@282
@30@254:
   ;	
   ;	            var_8 = abs(arg_6);
   ;	
	push	word ptr [bp+12]
	call	far ptr @abs$qi
	pop	cx
	mov	word ptr [bp-8],ax
   ;	
   ;	            var_C = var_4 - var_8;
   ;	
	mov	ax,word ptr [bp-4]
	sub	ax,word ptr [bp-8]
	mov	word ptr [bp-12],ax
@30@282:
   ;	
   ;	        }
   ;	        var_A = var_2;
   ;	
	mov	ax,word ptr [bp-2]
	mov	word ptr [bp-10],ax
   ;	
   ;	        if (arg_4 >= 0) {
   ;	
	cmp	word ptr [bp+10],0
	jl	short @30@394
   ;	
   ;	            var_6 = 0;
   ;	
	mov	word ptr [bp-6],0
   ;	
   ;	            if (width < arg_8)
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+8]
	cmp	ax,word ptr [bp+14]
	jge	short @30@422
   ;	
   ;	                var_A = var_2 - (arg_4 + var_2 - width);
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp+10]
	add	ax,word ptr [bp-2]
	sub	ax,word ptr es:[bx+8]
	mov	dx,word ptr [bp-2]
	sub	dx,ax
	mov	word ptr [bp-10],dx
	jmp	short @30@422
   ;	
   ;	        } else {
   ;	
	jmp	short @30@422
@30@394:
   ;	
   ;	            var_6 = abs(arg_4);
   ;	
	push	word ptr [bp+10]
	call	far ptr @abs$qi
	pop	cx
	mov	word ptr [bp-6],ax
   ;	
   ;	            var_A = var_2 - var_6;
   ;	
	mov	ax,word ptr [bp-2]
	sub	ax,word ptr [bp-6]
	mov	word ptr [bp-10],ax
@30@422:
   ;	
   ;	        }
   ;	    }
   ;	    if (arg_14 != 0)
   ;	
	cmp	byte ptr [bp+26],0
	je	short @30@478
   ;	
   ;	        x_put_bits_masked_color(var_6, var_8, var_6 + var_A, var_8 + var_C,
   ;	
   ;	
   ;	                                arg_4 + var_6, arg_6 + var_8,
   ;	                                bits, arg_12, var_2 - var_A, 0x140, arg_14);
   ;	
	mov	al,byte ptr [bp+26]
	push	ax
	push	320
	mov	ax,word ptr [bp-2]
	sub	ax,word ptr [bp-10]
	push	ax
	push	word ptr [bp+24]
	push	word ptr [bp+20]
	push	word ptr [bp+18]
	mov	ax,word ptr [bp+12]
	add	ax,word ptr [bp-8]
	push	ax
	mov	ax,word ptr [bp+10]
	add	ax,word ptr [bp-6]
	push	ax
	mov	ax,word ptr [bp-8]
	add	ax,word ptr [bp-12]
	push	ax
	mov	ax,word ptr [bp-6]
	add	ax,word ptr [bp-10]
	push	ax
	push	word ptr [bp-8]
	push	word ptr [bp-6]
	call	far ptr _x_put_bits_masked_color
	add	sp,24
	jmp	@30@590
@30@478:
   ;	
   ;	    else if (var_A > 4)
   ;	
	cmp	word ptr [bp-10],4
	jle	short @30@534
   ;	
   ;	        x_put_bits_masked2(var_6, var_8, var_6 + var_A, var_8 + var_C,
   ;	
   ;	
   ;	                           arg_4 + var_6, arg_6 + var_8,
   ;	                           bits, arg_12, var_2 - var_A, 0x140);
   ;	
	push	320
	mov	ax,word ptr [bp-2]
	sub	ax,word ptr [bp-10]
	push	ax
	push	word ptr [bp+24]
	push	word ptr [bp+20]
	push	word ptr [bp+18]
	mov	ax,word ptr [bp+12]
	add	ax,word ptr [bp-8]
	push	ax
	mov	ax,word ptr [bp+10]
	add	ax,word ptr [bp-6]
	push	ax
	mov	ax,word ptr [bp-8]
	add	ax,word ptr [bp-12]
	push	ax
	mov	ax,word ptr [bp-6]
	add	ax,word ptr [bp-10]
	push	ax
	push	word ptr [bp-8]
	push	word ptr [bp-6]
	call	far ptr _x_put_bits_masked2
	jmp	short @30@562
@30@534:
   ;	
   ;	    else
   ;	        x_put_bits_masked(var_6, var_8, var_6 + var_A, var_8 + var_C,
   ;	
   ;	
   ;	                          arg_4 + var_6, arg_6 + var_8,
   ;	                          bits, arg_12, var_2 - var_A, 0x140);
   ;	
	push	320
	mov	ax,word ptr [bp-2]
	sub	ax,word ptr [bp-10]
	push	ax
	push	word ptr [bp+24]
	push	word ptr [bp+20]
	push	word ptr [bp+18]
	mov	ax,word ptr [bp+12]
	add	ax,word ptr [bp-8]
	push	ax
	mov	ax,word ptr [bp+10]
	add	ax,word ptr [bp-6]
	push	ax
	mov	ax,word ptr [bp-8]
	add	ax,word ptr [bp-12]
	push	ax
	mov	ax,word ptr [bp-6]
	add	ax,word ptr [bp-10]
	push	ax
	push	word ptr [bp-8]
	push	word ptr [bp-6]
	call	far ptr _x_put_bits_masked
@30@562:
	add	sp,22
@30@590:
   ;	
   ;	}
   ;	
	leave	
	ret	
@vga_display@put_bits_masked$qiiiinucuiuiuc	endp
   ;	
   ;	void vga_display::show_pcx(uchar far *path, uchar arg_8, uint arg_A, int arg_C)
   ;	
	assume	cs:VGADISP_TEXT
@vga_display@show_pcx$qnucucuii	proc	far
	enter	26,0
   ;	
   ;	{
   ;	    long  var_1A;
   ;	    uchar far *src, *dest;
   ;	    int   var_12, var_10, var_E, var_C, var_A, var_8;
   ;	    byte  var_1;
   ;	
   ;	    arg_A /= 0x50;
   ;	
	mov	bx,80
	mov	ax,word ptr [bp+16]
	xor	dx,dx
	div	bx
	mov	word ptr [bp+16],ax
   ;	
   ;	    var_1A = (long)g_open_element(path);
   ;	
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	call	far ptr @g_open_element$qnuc
	push	dx
	push	ax
	pop	eax
	add	sp,4
	mov	dword ptr [bp-4],eax
   ;	
   ;	    if (var_1A == -1L)
   ;	
	cmp	dword ptr [bp-4],large -1
	jne short	@@1
	jmp	@31@814
@@1:
   ;	
   ;	        goto open_fail;
   ;	    src = (uchar far *)new char[var_1A];
   ;	
	push	word ptr [bp-4]
	call	far ptr @$bnew$qui
	pop	cx
	mov	word ptr [bp-6],dx
	mov	word ptr [bp-8],ax
   ;	
   ;	    if (src == 0)
   ;	
	cmp	dword ptr [bp-8],large 0
	jne	short @31@114
   ;	
   ;	        no_heap((uchar far *)"Loading pcx file.");
   ;	
	push	ds
	push	offset DGROUP:s@+81
	call	far ptr @no_heap$qnuc
	add	sp,4
@31@114:
   ;	
   ;	    if ((long)g_element_read(src, (uint)var_1A) != var_1A)
   ;	
	push	word ptr [bp-4]
	push	word ptr [bp-6]
	push	word ptr [bp-8]
	call	far ptr @g_element_read$qnvui
	push	dx
	push	ax
	pop	eax
	add	sp,6
	cmp	eax,dword ptr [bp-4]
	je short	@@2
	jmp	@31@786
@@2:
   ;	
   ;	        goto read_fail;
   ;	    g_close_element();
   ;	
	call	far ptr @g_close_element$qv
   ;	
   ;	    dest = (uchar far *)new char[0x80];
   ;	
	push	128
	call	far ptr @$bnew$qui
	pop	cx
	mov	word ptr [bp-10],dx
	mov	word ptr [bp-12],ax
   ;	
   ;	    if (dest == 0)
   ;	
	cmp	dword ptr [bp-12],large 0
	jne	short @31@198
   ;	
   ;	        no_heap((uchar far *)"Creating PCX header.");
   ;	
	push	ds
	push	offset DGROUP:s@+99
	call	far ptr @no_heap$qnuc
	add	sp,4
@31@198:
   ;	
   ;	    memcpy(dest, src, 0x80);
   ;	
	push	128
	push	word ptr [bp-6]
	push	word ptr [bp-8]
	push	word ptr [bp-10]
	push	word ptr [bp-12]
	call	far ptr _memcpy
	add	sp,10
   ;	
   ;	    if (arg_C == -1)
   ;	
	cmp	word ptr [bp+18],-1
	jne	short @31@254
   ;	
   ;	        var_E = *(uint far *)(dest + 0x0A) - *(uint far *)(dest + 0x06) + 1;
   ;	
	les	bx,dword ptr [bp-12]
	mov	ax,word ptr es:[bx+10]
	les	bx,dword ptr [bp-12]
	sub	ax,word ptr es:[bx+6]
	inc	ax
	jmp	short @31@282
@31@254:
   ;	
   ;	    else
   ;	        var_E = arg_C;
   ;	
	mov	ax,word ptr [bp+18]
@31@282:
	mov	word ptr [bp-18],ax
   ;	
   ;	    var_10 = *(uint far *)(dest + 0x42);
   ;	
	les	bx,dword ptr [bp-12]
	mov	ax,word ptr es:[bx+66]
	mov	word ptr [bp-16],ax
   ;	
   ;	    var_12 = 0x80;
   ;	
	mov	word ptr [bp-14],128
   ;	
   ;	    for (var_8 = arg_A; var_8 < arg_A + var_E; ++var_8) {
   ;	
	mov	ax,word ptr [bp+16]
	mov	word ptr [bp-24],ax
	jmp	@31@506
@31@338:
   ;	
   ;	        var_A = 0;
   ;	
	mov	word ptr [bp-22],0
	jmp	short @31@450
@31@366:
   ;	
   ;	        while (var_A < var_10) {
   ;	            var_1 = src[var_12++];
   ;	
	les	bx,dword ptr [bp-8]
	add	bx,word ptr [bp-14]
	mov	al,byte ptr es:[bx]
	mov	byte ptr [bp-25],al
	inc	word ptr [bp-14]
   ;	
   ;	            if ((var_1 & 0xC0) == 0xC0) {
   ;	
	mov	al,byte ptr [bp-25]
	mov	ah,0
	and	ax,192
	cmp	ax,192
	jne	short @31@422
   ;	
   ;	                var_C = var_1 & 0x3F;
   ;	
	mov	al,byte ptr [bp-25]
	mov	ah,0
	and	ax,63
	mov	word ptr [bp-20],ax
   ;	
   ;	                draw_span(var_A, var_8, src[var_12++], var_C, 0);
   ;	
	push	0
	push	word ptr [bp-20]
	mov	ax,word ptr [bp-14]
	inc	word ptr [bp-14]
	les	bx,dword ptr [bp-8]
	add	bx,ax
	mov	al,byte ptr es:[bx]
	push	ax
	push	word ptr [bp-24]
	push	word ptr [bp-22]
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @vga_display@draw_span$qiiuciui
	add	sp,14
   ;	
   ;	                var_A += var_C;
   ;	
	mov	ax,word ptr [bp-20]
	add	word ptr [bp-22],ax
   ;	
   ;	            } else {
   ;	
	jmp	short @31@450
@31@422:
   ;	
   ;	                set_pix(var_A++, var_8, var_1);
   ;	
	mov	al,byte ptr [bp-25]
	push	ax
	push	word ptr [bp-24]
	mov	ax,word ptr [bp-22]
	inc	word ptr [bp-22]
	push	ax
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @vga_display@set_pix$qiiuc
	add	sp,10
@31@450:
	mov	ax,word ptr [bp-22]
	cmp	ax,word ptr [bp-16]
	jl	short @31@366
	inc	word ptr [bp-24]
@31@506:
	mov	ax,word ptr [bp+16]
	add	ax,word ptr [bp-18]
	cmp	ax,word ptr [bp-24]
	jbe short	@@3
	jmp	@31@338
@@3:
   ;	
   ;	            }
   ;	        }
   ;	    }
   ;	    ++var_12;
   ;	
	inc	word ptr [bp-14]
   ;	
   ;	    for (var_8 = 0; var_8 < 0x300; ++var_8)
   ;	
	mov	word ptr [bp-24],0
	jmp	short @31@618
@31@562:
   ;	
   ;	        palette[var_8] = src[var_12++] >> 2;
   ;	
	les	bx,dword ptr [bp-8]
	add	bx,word ptr [bp-14]
	mov	al,byte ptr es:[bx]
	mov	ah,0
	sar	ax,2
	mov	bx,word ptr [bp-24]
	mov	byte ptr DGROUP:_palette[bx],al
	inc	word ptr [bp-14]
	inc	word ptr [bp-24]
@31@618:
	cmp	word ptr [bp-24],768
	jl	short @31@562
   ;	
   ;	    if (arg_8 != 0)
   ;	
	cmp	byte ptr [bp+14],0
	je	short @31@702
   ;	
   ;	        set_palette();
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @vga_display@set_palette$qv
	add	sp,4
@31@702:
   ;	
   ;	    delete dest;
   ;	
	push	word ptr [bp-10]
	push	word ptr [bp-12]
	call	far ptr @$bdele$qnv
	add	sp,4
   ;	
   ;	    delete src;
   ;	
	push	word ptr [bp-6]
	push	word ptr [bp-8]
	call	far ptr @$bdele$qnv
@31@730:
	add	sp,4
	jmp	short @31@842
   ;	
   ;	done:
   ;	    return;
   ;	
	jmp	short @31@842
@31@786:
   ;	
   ;	read_fail:
   ;	    read_error(path);
   ;	
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	call	far ptr @read_error$qnuc
	jmp	short @31@730
@31@814:
   ;	
   ;	    goto done;
   ;	open_fail:
   ;	    terminate((uchar far *)"Couldn't open", path);
   ;	
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	push	ds
	push	offset DGROUP:s@+120
	call	far ptr @terminate$qnuct1
	add	sp,8
   ;	
   ;	    return;
   ;	
@31@842:
   ;	
   ;	}
   ;	
	leave	
	ret	
@vga_display@show_pcx$qnucucuii	endp
   ;	
   ;	void vga_display::dump_pcx()
   ;	
	assume	cs:VGADISP_TEXT
@vga_display@dump_pcx$qv	proc	far
	enter	20,0
   ;	
   ;	{
   ;	    uchar far *block;
   ;	    int   handle;
   ;	    uint  var_10, var_E, buf, var_A, var_8, var_6;
   ;	    byte  var_1;
   ;	
   ;	    handle = open("riptide.pcx", 0x8304, 0x180);
   ;	
	push	384
	push	-31996
	push	ds
	push	offset DGROUP:s@+134
	call	far ptr _open
	add	sp,8
	mov	word ptr [bp-6],ax
   ;	
   ;	    if (handle == -1)
   ;	
	cmp	word ptr [bp-6],-1
	jne short	@@4
	jmp	@32@842
@@4:
   ;	
   ;	        goto fail;
   ;	    block = (uchar far *)new char[0x80];
   ;	
	push	128
	call	far ptr @$bnew$qui
	pop	cx
	mov	word ptr [bp-2],dx
	mov	word ptr [bp-4],ax
   ;	
   ;	    if (block == 0)
   ;	
	cmp	dword ptr [bp-4],large 0
	jne	short @32@114
   ;	
   ;	        no_heap((uchar far *)"Creating PCX header.");
   ;	
	push	ds
	push	offset DGROUP:s@+146
	call	far ptr @no_heap$qnuc
	add	sp,4
@32@114:
   ;	
   ;	    block[0] = 0x0A;
   ;	
	les	bx,dword ptr [bp-4]
	mov	byte ptr es:[bx],10
   ;	
   ;	    block[1] = 5;
   ;	
	les	bx,dword ptr [bp-4]
	mov	byte ptr es:[bx+1],5
   ;	
   ;	    block[2] = 1;
   ;	
	les	bx,dword ptr [bp-4]
	mov	byte ptr es:[bx+2],1
   ;	
   ;	    block[3] = 8;
   ;	
	les	bx,dword ptr [bp-4]
	mov	byte ptr es:[bx+3],8
   ;	
   ;	    *(word far *)(block + 4) = 0;
   ;	
	les	bx,dword ptr [bp-4]
	mov	word ptr es:[bx+4],0
   ;	
   ;	    *(word far *)(block + 6) = 0;
   ;	
	les	bx,dword ptr [bp-4]
	mov	word ptr es:[bx+6],0
   ;	
   ;	    *(word far *)(block + 8) = 0x13F;
   ;	
	les	bx,dword ptr [bp-4]
	mov	word ptr es:[bx+8],319
   ;	
   ;	    *(word far *)(block + 0x0A) = 0xC7;
   ;	
	les	bx,dword ptr [bp-4]
	mov	word ptr es:[bx+10],199
   ;	
   ;	    *(word far *)(block + 0x0C) = 0x140;
   ;	
	les	bx,dword ptr [bp-4]
	mov	word ptr es:[bx+12],320
   ;	
   ;	    *(word far *)(block + 0x0E) = 0xC8;
   ;	
	les	bx,dword ptr [bp-4]
	mov	word ptr es:[bx+14],200
   ;	
   ;	    block[0x41] = 1;
   ;	
	les	bx,dword ptr [bp-4]
	mov	byte ptr es:[bx+65],1
   ;	
   ;	    *(word far *)(block + 0x44) = 0;
   ;	
	les	bx,dword ptr [bp-4]
	mov	word ptr es:[bx+68],0
   ;	
   ;	    *(word far *)(block + 0x42) = 0x140;
   ;	
	les	bx,dword ptr [bp-4]
	mov	word ptr es:[bx+66],320
   ;	
   ;	    if (write(handle, block, 0x80) != 0x80)
   ;	
	push	128
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	push	word ptr [bp-6]
	call	far ptr _write
	add	sp,8
	cmp	ax,128
	je short	@@5
	jmp	@32@842
@@5:
   ;	
   ;	        goto fail;
   ;	    var_E = *(word far *)(block + 0x0A) - *(word far *)(block + 0x06) + 1;
   ;	
	les	bx,dword ptr [bp-4]
	mov	ax,word ptr es:[bx+10]
	les	bx,dword ptr [bp-4]
	sub	ax,word ptr es:[bx+6]
	inc	ax
	mov	word ptr [bp-10],ax
   ;	
   ;	    var_10 = *(word far *)(block + 0x42);
   ;	
	les	bx,dword ptr [bp-4]
	mov	ax,word ptr es:[bx+66]
	mov	word ptr [bp-8],ax
   ;	
   ;	    var_6 = 0;
   ;	
	mov	word ptr [bp-18],0
   ;	
   ;	    for (var_8 = var_6; var_8 < var_6 + var_E; ++var_8) {
   ;	
	mov	ax,word ptr [bp-18]
	mov	word ptr [bp-16],ax
	jmp	@32@646
@32@170:
   ;	
   ;	        var_A = 0;
   ;	
	mov	word ptr [bp-14],0
	jmp	@32@590
@32@198:
   ;	
   ;	        while (var_A < var_10) {
   ;	            buf = 0;
   ;	
	mov	word ptr [bp-12],0
   ;	
   ;	            var_1 = read_pix(var_A, var_8);
   ;	
	push	word ptr [bp-16]
	push	word ptr [bp-14]
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @vga_display@read_pix$qii
	add	sp,8
	mov	byte ptr [bp-19],al
	jmp	short @32@254
@32@226:
   ;	
   ;	            while ((byte)read_pix(var_A + buf, var_8) == var_1 &&
   ;	                   buf < 0x3F && var_A + buf < var_10)
   ;	                ++buf;
   ;	
	inc	word ptr [bp-12]
@32@254:
	push	word ptr [bp-16]
	mov	ax,word ptr [bp-14]
	add	ax,word ptr [bp-12]
	push	ax
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @vga_display@read_pix$qii
	add	sp,8
	cmp	al,byte ptr [bp-19]
	jne	short @32@338
	cmp	word ptr [bp-12],63
	jae	short @32@338
	mov	ax,word ptr [bp-14]
	add	ax,word ptr [bp-12]
	cmp	ax,word ptr [bp-8]
	jb	short @32@226
@32@338:
   ;	
   ;	            if (buf > 0) {
   ;	
	cmp	word ptr [bp-12],0
	jbe	short @32@478
   ;	
   ;	                var_A += buf;
   ;	
	mov	ax,word ptr [bp-12]
	add	word ptr [bp-14],ax
   ;	
   ;	                buf |= 0xC0;
   ;	
	or	word ptr [bp-12],192
   ;	
   ;	                if (write(handle, &buf, 1) != 1)
   ;	
	push	1
	push	ss
	lea	ax,word ptr [bp-12]
	push	ax
	push	word ptr [bp-6]
	call	far ptr _write
	add	sp,8
	cmp	ax,1
	je short	@@6
	jmp	@32@842
@@6:
   ;	
   ;	                    goto fail;
   ;	                if (write(handle, &var_1, 1) != 1)
   ;	
	push	1
	push	ss
	lea	ax,word ptr [bp-19]
	push	ax
	push	word ptr [bp-6]
	call	far ptr _write
	add	sp,8
	cmp	ax,1
	je	short @32@590
   ;	
   ;	                    goto fail;
   ;	
	jmp	@32@842
   ;	
   ;	            } else {
   ;	
	jmp	short @32@590
@32@478:
   ;	
   ;	                if ((var_1 & 0xC0) == 0xC0)
   ;	
	mov	al,byte ptr [bp-19]
	mov	ah,0
	and	ax,192
	cmp	ax,192
	jne	short @32@534
   ;	
   ;	                    if (write(handle, (void far *)0xC1L, 1) != 1)
   ;	
	push	1
	push	0
	push	193
	push	word ptr [bp-6]
	call	far ptr _write
	add	sp,8
	cmp	ax,1
	je short	@@7
	jmp	@32@842
@@7:
@32@534:
   ;	
   ;	                        goto fail;
   ;	                if (write(handle, &var_1, 1) != 1)
   ;	
	push	1
	push	ss
	lea	ax,word ptr [bp-19]
	push	ax
	push	word ptr [bp-6]
	call	far ptr _write
	add	sp,8
	cmp	ax,1
	je short	@@8
	jmp	@32@842
@@8:
   ;	
   ;	                    goto fail;
   ;	                ++var_A;
   ;	
	inc	word ptr [bp-14]
@32@590:
	mov	ax,word ptr [bp-14]
	cmp	ax,word ptr [bp-8]
	jae short	@@9
	jmp	@32@198
@@9:
	inc	word ptr [bp-16]
@32@646:
	mov	ax,word ptr [bp-18]
	add	ax,word ptr [bp-10]
	cmp	ax,word ptr [bp-16]
	jbe short	@@10
	jmp	@32@170
@@10:
   ;	
   ;	            }
   ;	        }
   ;	    }
   ;	    var_1 = 0x0C;
   ;	
	mov	byte ptr [bp-19],12
   ;	
   ;	    if (write(handle, &var_1, 1) == -1)
   ;	
	push	1
	push	ss
	lea	ax,word ptr [bp-19]
	push	ax
	push	word ptr [bp-6]
	call	far ptr _write
	add	sp,8
	cmp	ax,-1
	je	short @32@842
   ;	
   ;	        goto fail;
   ;	    for (var_8 = 0; var_8 < 0x300; ++var_8) {
   ;	
	mov	word ptr [bp-16],0
	jmp	short @32@786
@32@730:
   ;	
   ;	        var_1 = palette[var_8] << 2;
   ;	
	mov	bx,word ptr [bp-16]
	mov	al,byte ptr DGROUP:_palette[bx]
	shl	al,2
	mov	byte ptr [bp-19],al
   ;	
   ;	        if (write(handle, &var_1, 1) == -1)
   ;	
	push	1
	push	ss
	lea	ax,word ptr [bp-19]
	push	ax
	push	word ptr [bp-6]
	call	far ptr _write
	add	sp,8
	cmp	ax,-1
	je	short @32@842
	inc	word ptr [bp-16]
@32@786:
	cmp	word ptr [bp-16],768
	jb	short @32@730
   ;	
   ;	            goto fail;
   ;	    }
   ;	    delete block;
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @$bdele$qnv
	add	sp,4
   ;	
   ;	    close(handle);
   ;	
	push	word ptr [bp-6]
	call	far ptr _close
	pop	cx
   ;	
   ;	    return;
   ;	
	jmp	short @32@870
@32@842:
   ;	
   ;	fail:
   ;	    close(handle);
   ;	
	push	word ptr [bp-6]
	call	far ptr _close
	pop	cx
   ;	
   ;	    write_error("riptide.pcx");
   ;	
	push	ds
	push	offset DGROUP:s@+167
	call	far ptr @write_error$qnuc
	add	sp,4
@32@870:
   ;	
   ;	}
   ;	
	leave	
	ret	
@vga_display@dump_pcx$qv	endp
   ;	
   ;	uchar far *vga_display::load_pcx(uchar far *path, uint far *arg_0E)
   ;	
	assume	cs:VGADISP_TEXT
@vga_display@load_pcx$qnucnui	proc	far
	enter	54,0
   ;	
   ;	{
   ;	    struct ffblk ff;
   ;	    uchar far *buf;
   ;	    int   handle, var_4;
   ;	    uint  var_6;
   ;	
   ;	    for (var_4 = findfirst("*.pcx", &ff, 0); var_4 == 0; var_4 = findnext(&ff))
   ;	
	push	0
	push	ss
	lea	ax,word ptr [bp-54]
	push	ax
	push	ds
	push	offset DGROUP:s@+179
	call	far ptr _findfirst
	add	sp,10
	jmp	short @33@142
@33@58:
   ;	
   ;	        if (strcmp((char far *)path, ff.ff_name) == 0) {
   ;	
	push	ss
	lea	ax,word ptr [bp-24]
	push	ax
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	call	far ptr _strcmp
	add	sp,8
	or	ax,ax
	jne	short @33@114
   ;	
   ;	            var_6 = (uint)ff.ff_fsize;
   ;	
	mov	ax,word ptr [bp-28]
	mov	word ptr [bp-10],ax
   ;	
   ;	            break;
   ;	
	jmp	short @33@198
@33@114:
	push	ss
	lea	ax,word ptr [bp-54]
	push	ax
	call	far ptr _findnext
	add	sp,4
@33@142:
	mov	word ptr [bp-8],ax
	cmp	word ptr [bp-8],0
	je	short @33@58
@33@198:
   ;	
   ;	        }
   ;	    if (var_4 != 0)
   ;	
	cmp	word ptr [bp-8],0
	je	short @33@254
	jmp	@33@422
@33@254:
   ;	
   ;	        return 0;
   ;	    buf = (uchar far *)new char[var_6];
   ;	
	push	word ptr [bp-10]
	call	far ptr @$bnew$qui
	pop	cx
	mov	word ptr [bp-2],dx
	mov	word ptr [bp-4],ax
   ;	
   ;	    if (buf == 0)
   ;	
	cmp	dword ptr [bp-4],large 0
	jne	short @33@310
   ;	
   ;	        no_heap((uchar far *)"Loading pcx file.");
   ;	
	push	ds
	push	offset DGROUP:s@+185
	call	far ptr @no_heap$qnuc
	add	sp,4
@33@310:
   ;	
   ;	    handle = open((char far *)path, 0x8001);
   ;	
	push	-32767
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	call	far ptr _open
	add	sp,6
	mov	word ptr [bp-6],ax
   ;	
   ;	    if (handle == -1)
   ;	
	cmp	word ptr [bp-6],-1
	je	short @33@394
   ;	
   ;	        goto fail;
   ;	    if (read(handle, buf, var_6) != var_6)
   ;	
	push	word ptr [bp-10]
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	push	word ptr [bp-6]
	call	far ptr _read
	add	sp,8
	cmp	ax,word ptr [bp-10]
	jne	short @33@394
   ;	
   ;	        goto fail;
   ;	    close(handle);
   ;	
	push	word ptr [bp-6]
	call	far ptr _close
	pop	cx
   ;	
   ;	    *arg_0E = var_6;
   ;	
	les	bx,dword ptr [bp+14]
	mov	ax,word ptr [bp-10]
	mov	word ptr es:[bx],ax
   ;	
   ;	    return buf;
   ;	
	mov	dx,word ptr [bp-2]
	mov	ax,word ptr [bp-4]
	jmp	short @33@450
@33@394:
   ;	
   ;	fail:
   ;	    close(handle);
   ;	
	push	word ptr [bp-6]
	call	far ptr _close
	pop	cx
   ;	
   ;	    read_error(path);
   ;	
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	call	far ptr @read_error$qnuc
	add	sp,4
   ;	
   ;	    return 0;
   ;	
@33@422:
	xor	dx,dx
	xor	ax,ax
@33@450:
   ;	
   ;	}
   ;	
	leave	
	ret	
@vga_display@load_pcx$qnucnui	endp
   ;	
   ;	uchar far *vga_display::explode_pcx(uchar far *src, uint arg_E, int arg_10)
   ;	
	assume	cs:VGADISP_TEXT
@vga_display@explode_pcx$qnucuii	proc	far
	enter	26,0
   ;	
   ;	{
   ;	    uchar far *header, *dest, *srcdata;
   ;	    uint  var_A, var_C, var_8, var_10h;
   ;	    int   var_E, var_6;
   ;	    byte  var_19;
   ;	
   ;	    for (var_A = 0; var_A < 0x300; ++var_A)
   ;	
	mov	word ptr [bp-14],0
	jmp	short @34@114
@34@58:
   ;	
   ;	        palette[var_A] = src[arg_E + var_A - 0x300] >> 2;
   ;	
	mov	ax,word ptr [bp+14]
	add	ax,word ptr [bp-14]
	sub	ax,768
	les	bx,dword ptr [bp+10]
	add	bx,ax
	mov	al,byte ptr es:[bx]
	mov	ah,0
	sar	ax,2
	mov	bx,word ptr [bp-14]
	mov	byte ptr DGROUP:_palette[bx],al
	inc	word ptr [bp-14]
@34@114:
	cmp	word ptr [bp-14],768
	jb	short @34@58
   ;	
   ;	    set_palette();
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @vga_display@set_palette$qv
	add	sp,4
   ;	
   ;	    header = (uchar far *)new char[0x80];
   ;	
	push	128
	call	far ptr @$bnew$qui
	pop	cx
	mov	word ptr [bp-2],dx
	mov	word ptr [bp-4],ax
   ;	
   ;	    memcpy(header, src, 0x80);
   ;	
	push	128
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr _memcpy
	add	sp,10
   ;	
   ;	    var_6 = *(int far *)(header + 8) - *(int far *)(header + 4) + 1;
   ;	
	les	bx,dword ptr [bp-4]
	mov	ax,word ptr es:[bx+8]
	les	bx,dword ptr [bp-4]
	sub	ax,word ptr es:[bx+4]
	inc	ax
	mov	word ptr [bp-24],ax
   ;	
   ;	    var_8 = *(uint far *)(header + 0x42);
   ;	
	les	bx,dword ptr [bp-4]
	mov	ax,word ptr es:[bx+66]
	mov	word ptr [bp-18],ax
   ;	
   ;	    dest = (uchar far *)new char[var_6 * arg_10];
   ;	
	mov	ax,word ptr [bp-24]
	imul	word ptr [bp+16]
	push	ax
	call	far ptr @$bnew$qui
	pop	cx
	mov	word ptr [bp-6],dx
	mov	word ptr [bp-8],ax
   ;	
   ;	    if (dest == 0)
   ;	
	cmp	dword ptr [bp-8],large 0
	jne	short @34@198
   ;	
   ;	        return 0;
   ;	
	xor	dx,dx
	xor	ax,ax
	jmp	@34@534
@34@198:
   ;	
   ;	    srcdata = src + 0x80;
   ;	
	mov	ax,word ptr [bp+12]
	mov	dx,word ptr [bp+10]
	add	dx,128
	mov	word ptr [bp-10],ax
	mov	word ptr [bp-12],dx
   ;	
   ;	    var_10h = 0;
   ;	
	mov	word ptr [bp-20],0
   ;	
   ;	    for (var_A = 0; var_A < arg_10; ++var_A) {
   ;	
	mov	word ptr [bp-14],0
	jmp	@34@478
@34@226:
   ;	
   ;	        var_C = 0;
   ;	
	mov	word ptr [bp-16],0
	jmp	short @34@422
@34@254:
   ;	
   ;	        while (var_C < var_8) {
   ;	            var_19 = srcdata[var_10h++];
   ;	
	les	bx,dword ptr [bp-12]
	add	bx,word ptr [bp-20]
	mov	al,byte ptr es:[bx]
	mov	byte ptr [bp-25],al
	inc	word ptr [bp-20]
   ;	
   ;	            if ((var_19 & 0xC0) == 0xC0) {
   ;	
	mov	al,byte ptr [bp-25]
	mov	ah,0
	and	ax,192
	cmp	ax,192
	jne	short @34@394
   ;	
   ;	                var_E = var_19 & 0x3F;
   ;	
	mov	al,byte ptr [bp-25]
	mov	ah,0
	and	ax,63
	mov	word ptr [bp-22],ax
   ;	
   ;	                var_19 = srcdata[var_10h++];
   ;	
	les	bx,dword ptr [bp-12]
	add	bx,word ptr [bp-20]
	mov	al,byte ptr es:[bx]
	mov	byte ptr [bp-25],al
	inc	word ptr [bp-20]
@34@310:
   ;	
   ;	                do {
   ;	                    dest[var_A * 0x140 + var_C++] = var_19;
   ;	
	mov	ax,word ptr [bp-14]
	imul	ax,ax,320
	add	ax,word ptr [bp-16]
	les	bx,dword ptr [bp-8]
	add	bx,ax
	mov	al,byte ptr [bp-25]
	mov	byte ptr es:[bx],al
	inc	word ptr [bp-16]
   ;	
   ;	                } while (--var_E != 0);
   ;	
	dec	word ptr [bp-22]
	jne	short @34@310
   ;	
   ;	            } else {
   ;	
	jmp	short @34@422
@34@394:
   ;	
   ;	                dest[var_A * 0x140 + var_C++] = var_19;
   ;	
	mov	ax,word ptr [bp-14]
	imul	ax,ax,320
	add	ax,word ptr [bp-16]
	les	bx,dword ptr [bp-8]
	add	bx,ax
	mov	al,byte ptr [bp-25]
	mov	byte ptr es:[bx],al
	inc	word ptr [bp-16]
@34@422:
	mov	ax,word ptr [bp-16]
	cmp	ax,word ptr [bp-18]
	jb	short @34@254
	inc	word ptr [bp-14]
@34@478:
	mov	ax,word ptr [bp-14]
	cmp	ax,word ptr [bp+16]
	jae short	@@11
	jmp	@34@226
@@11:
   ;	
   ;	            }
   ;	        }
   ;	    }
   ;	    delete header;
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @$bdele$qnv
	add	sp,4
   ;	
   ;	    return dest;
   ;	
	mov	dx,word ptr [bp-6]
	mov	ax,word ptr [bp-8]
@34@534:
   ;	
   ;	}
   ;	
	leave	
	ret	
@vga_display@explode_pcx$qnucuii	endp
   ;	
   ;	void vga_display::import_palette(uchar far *src, uint arg_E)
   ;	
	assume	cs:VGADISP_TEXT
@vga_display@import_palette$qnucui	proc	far
	enter	6,0
   ;	
   ;	{
   ;	    uchar far *pal;
   ;	    int   var_2;
   ;	
   ;	    for (var_2 = 0, pal = src + (arg_E - 0x300); var_2 != 0x300; ++var_2)
   ;	
	mov	word ptr [bp-6],0
	mov	ax,word ptr [bp+14]
	sub	ax,768
	mov	dx,word ptr [bp+12]
	mov	bx,word ptr [bp+10]
	add	bx,ax
	mov	word ptr [bp-2],dx
	mov	word ptr [bp-4],bx
	jmp	short @35@114
@35@58:
   ;	
   ;	        palette[var_2] = *pal++ >> 2;
   ;	
	les	bx,dword ptr [bp-4]
	mov	al,byte ptr es:[bx]
	mov	ah,0
	sar	ax,2
	mov	bx,word ptr [bp-6]
	mov	byte ptr DGROUP:_palette[bx],al
	inc	word ptr [bp-4]
	inc	word ptr [bp-6]
@35@114:
	cmp	word ptr [bp-6],768
	jne	short @35@58
   ;	
   ;	    set_palette();
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @vga_display@set_palette$qv
	add	sp,4
   ;	
   ;	}
   ;	
	leave	
	ret	
@vga_display@import_palette$qnucui	endp
   ;	
   ;	void vga_text(int x, int y, uchar far *s, uchar color, uchar mode)
   ;	
	assume	cs:VGADISP_TEXT
@vga_text$qiinucucuc	proc	far
	enter	16,0
   ;	
   ;	{
   ;	    uchar far *p;
   ;	    int   var_8, var_4, var_6, var_2;
   ;	    uchar var_9, var_A, var_F;
   ;	
   ;	    p = s;
   ;	
	mov	eax,dword ptr [bp+10]
	mov	dword ptr [bp-4],eax
   ;	
   ;	    var_8 = x;
   ;	
	mov	ax,word ptr [bp+6]
	mov	word ptr [bp-6],ax
   ;	
   ;	    if (mode != 0) {
   ;	
	cmp	byte ptr [bp+16],0
	jne short	@@12
	jmp	@36@1010
@@12:
   ;	
   ;	        for (var_4 = 0; var_4 < strlen((char far *)s); ++var_4) {
   ;	
	mov	word ptr [bp-8],0
	jmp	@36@954
@36@86:
   ;	
   ;	            var_A = *p++;
   ;	
	les	bx,dword ptr [bp-4]
	mov	al,byte ptr es:[bx]
	mov	byte ptr [bp-14],al
	inc	word ptr [bp-4]
   ;	
   ;	            var_6 = y;
   ;	
	mov	ax,word ptr [bp+8]
	mov	word ptr [bp-10],ax
   ;	
   ;	            var_F = color;
   ;	
	mov	al,byte ptr [bp+14]
	mov	byte ptr [bp-15],al
   ;	
   ;	            for (var_2 = 0; var_2 < 8; ++var_2) {
   ;	
	mov	word ptr [bp-12],0
	jmp	@36@870
@36@114:
   ;	
   ;	                var_9 = 0x80;
   ;	
	mov	byte ptr [bp-13],128
   ;	
   ;	                if (GLYPH_BIT() & var_9) display->set_pix(var_8,     var_6, var_F);
   ;	
	mov	al,byte ptr [bp-14]
	mov	ah,0
	shl	ax,3
	add	ax,word ptr [bp-12]
	add	ax,word ptr DGROUP:_system_font_ptr
	mov	es,word ptr DGROUP:_system_font_ptr+2
	mov	dl,byte ptr [bp-13]
	mov	bx,ax
	test	byte ptr es:[bx],dl
	je	short @36@170
	mov	al,byte ptr [bp-15]
	push	ax
	push	word ptr [bp-10]
	push	word ptr [bp-6]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	push	cs
	call	near ptr @vga_display@set_pix$qiiuc
	add	sp,10
@36@170:
   ;	
   ;	                var_9 >>= 1;
   ;	
	shr	byte ptr [bp-13],1
   ;	
   ;	                if (GLYPH_BIT() & var_9) display->set_pix(var_8 + 1, var_6, var_F);
   ;	
	mov	al,byte ptr [bp-14]
	mov	ah,0
	shl	ax,3
	add	ax,word ptr [bp-12]
	add	ax,word ptr DGROUP:_system_font_ptr
	mov	es,word ptr DGROUP:_system_font_ptr+2
	mov	dl,byte ptr [bp-13]
	mov	bx,ax
	test	byte ptr es:[bx],dl
	je	short @36@226
	mov	al,byte ptr [bp-15]
	push	ax
	push	word ptr [bp-10]
	mov	ax,word ptr [bp-6]
	inc	ax
	push	ax
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	push	cs
	call	near ptr @vga_display@set_pix$qiiuc
	add	sp,10
@36@226:
   ;	
   ;	                var_9 >>= 1;
   ;	
	shr	byte ptr [bp-13],1
   ;	
   ;	                if (GLYPH_BIT() & var_9) display->set_pix(var_8 + 2, var_6, var_F);
   ;	
	mov	al,byte ptr [bp-14]
	mov	ah,0
	shl	ax,3
	add	ax,word ptr [bp-12]
	add	ax,word ptr DGROUP:_system_font_ptr
	mov	es,word ptr DGROUP:_system_font_ptr+2
	mov	dl,byte ptr [bp-13]
	mov	bx,ax
	test	byte ptr es:[bx],dl
	je	short @36@282
	mov	al,byte ptr [bp-15]
	push	ax
	push	word ptr [bp-10]
	mov	ax,word ptr [bp-6]
	add	ax,2
	push	ax
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	push	cs
	call	near ptr @vga_display@set_pix$qiiuc
	add	sp,10
@36@282:
   ;	
   ;	                var_9 >>= 1;
   ;	
	shr	byte ptr [bp-13],1
   ;	
   ;	                if (GLYPH_BIT() & var_9) display->set_pix(var_8 + 3, var_6, var_F);
   ;	
	mov	al,byte ptr [bp-14]
	mov	ah,0
	shl	ax,3
	add	ax,word ptr [bp-12]
	add	ax,word ptr DGROUP:_system_font_ptr
	mov	es,word ptr DGROUP:_system_font_ptr+2
	mov	dl,byte ptr [bp-13]
	mov	bx,ax
	test	byte ptr es:[bx],dl
	je	short @36@338
	mov	al,byte ptr [bp-15]
	push	ax
	push	word ptr [bp-10]
	mov	ax,word ptr [bp-6]
	add	ax,3
	push	ax
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	push	cs
	call	near ptr @vga_display@set_pix$qiiuc
	add	sp,10
@36@338:
   ;	
   ;	                var_9 >>= 1;
   ;	
	shr	byte ptr [bp-13],1
   ;	
   ;	                if (GLYPH_BIT() & var_9) display->set_pix(var_8 + 4, var_6, var_F);
   ;	
	mov	al,byte ptr [bp-14]
	mov	ah,0
	shl	ax,3
	add	ax,word ptr [bp-12]
	add	ax,word ptr DGROUP:_system_font_ptr
	mov	es,word ptr DGROUP:_system_font_ptr+2
	mov	dl,byte ptr [bp-13]
	mov	bx,ax
	test	byte ptr es:[bx],dl
	je	short @36@394
	mov	al,byte ptr [bp-15]
	push	ax
	push	word ptr [bp-10]
	mov	ax,word ptr [bp-6]
	add	ax,4
	push	ax
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	push	cs
	call	near ptr @vga_display@set_pix$qiiuc
	add	sp,10
@36@394:
   ;	
   ;	                var_9 >>= 1;
   ;	
	shr	byte ptr [bp-13],1
   ;	
   ;	                if (GLYPH_BIT() & var_9) display->set_pix(var_8 + 5, var_6, var_F);
   ;	
	mov	al,byte ptr [bp-14]
	mov	ah,0
	shl	ax,3
	add	ax,word ptr [bp-12]
	add	ax,word ptr DGROUP:_system_font_ptr
	mov	es,word ptr DGROUP:_system_font_ptr+2
	mov	dl,byte ptr [bp-13]
	mov	bx,ax
	test	byte ptr es:[bx],dl
	je	short @36@450
	mov	al,byte ptr [bp-15]
	push	ax
	push	word ptr [bp-10]
	mov	ax,word ptr [bp-6]
	add	ax,5
	push	ax
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	push	cs
	call	near ptr @vga_display@set_pix$qiiuc
	add	sp,10
@36@450:
   ;	
   ;	                var_9 >>= 1;
   ;	
	shr	byte ptr [bp-13],1
   ;	
   ;	                if (GLYPH_BIT() & var_9) display->set_pix(var_8 + 6, var_6, var_F);
   ;	
	mov	al,byte ptr [bp-14]
	mov	ah,0
	shl	ax,3
	add	ax,word ptr [bp-12]
	add	ax,word ptr DGROUP:_system_font_ptr
	mov	es,word ptr DGROUP:_system_font_ptr+2
	mov	dl,byte ptr [bp-13]
	mov	bx,ax
	test	byte ptr es:[bx],dl
	je	short @36@506
	mov	al,byte ptr [bp-15]
	push	ax
	push	word ptr [bp-10]
	mov	ax,word ptr [bp-6]
	add	ax,6
	push	ax
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	push	cs
	call	near ptr @vga_display@set_pix$qiiuc
	add	sp,10
@36@506:
   ;	
   ;	                var_9 >>= 1;
   ;	
	shr	byte ptr [bp-13],1
   ;	
   ;	                if (GLYPH_BIT() & var_9) display->set_pix(var_8 + 7, var_6, var_F);
   ;	
	mov	al,byte ptr [bp-14]
	mov	ah,0
	shl	ax,3
	add	ax,word ptr [bp-12]
	add	ax,word ptr DGROUP:_system_font_ptr
	mov	es,word ptr DGROUP:_system_font_ptr+2
	mov	dl,byte ptr [bp-13]
	mov	bx,ax
	test	byte ptr es:[bx],dl
	je	short @36@562
	mov	al,byte ptr [bp-15]
	push	ax
	push	word ptr [bp-10]
	mov	ax,word ptr [bp-6]
	add	ax,7
	push	ax
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	push	cs
	call	near ptr @vga_display@set_pix$qiiuc
	add	sp,10
@36@562:
   ;	
   ;	                ++var_6;
   ;	
	inc	word ptr [bp-10]
   ;	
   ;	                switch (mode) {
   ;	
	mov	al,byte ptr [bp+16]
	mov	ah,0
	cmp	ax,2
	je	short @36@758
	cmp	ax,3
	je	short @36@786
	jmp	short @36@842
   ;	
   ;	                case 0: break;
   ;	
	jmp	short @36@842
   ;	
   ;	                case 1: break;
   ;	
	jmp	short @36@842
@36@758:
   ;	
   ;	                case 2: ++var_F; break;
   ;	
	mov	al,byte ptr [bp-15]
	inc	al
	jmp	short @36@814
@36@786:
   ;	
   ;	                case 3: --var_F; break;
   ;	
	mov	al,byte ptr [bp-15]
	add	al,255
@36@814:
	mov	byte ptr [bp-15],al
@36@842:
	inc	word ptr [bp-12]
@36@870:
	cmp	word ptr [bp-12],8
	jge short	@@13
	jmp	@36@114
@@13:
   ;	
   ;	                }
   ;	            }
   ;	            var_8 += 8;
   ;	
	add	word ptr [bp-6],8
	inc	word ptr [bp-8]
@36@954:
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	call	far ptr _strlen
	add	sp,4
	cmp	ax,word ptr [bp-8]
	jbe short	@@14
	jmp	@36@86
@@14:
   ;	
   ;	        }
   ;	    } else {
   ;	
	jmp	@36@1682
@36@1010:
   ;	
   ;	        for (var_4 = 0; var_4 < strlen((char far *)s); ++var_4) {
   ;	
	mov	word ptr [bp-8],0
	jmp	@36@1654
@36@1038:
   ;	
   ;	            var_A = *p++;
   ;	
	les	bx,dword ptr [bp-4]
	mov	al,byte ptr es:[bx]
	mov	byte ptr [bp-14],al
	inc	word ptr [bp-4]
   ;	
   ;	            var_6 = y;
   ;	
	mov	ax,word ptr [bp+8]
	mov	word ptr [bp-10],ax
   ;	
   ;	            for (var_2 = 0; var_2 < 8; ++var_2) {
   ;	
	mov	word ptr [bp-12],0
	jmp	@36@1570
@36@1066:
   ;	
   ;	                var_9 = 0x80;
   ;	
	mov	byte ptr [bp-13],128
   ;	
   ;	                if (GLYPH_BIT() & var_9) display->set_pix(var_8,     var_6, color);
   ;	
	mov	al,byte ptr [bp-14]
	mov	ah,0
	shl	ax,3
	add	ax,word ptr [bp-12]
	add	ax,word ptr DGROUP:_system_font_ptr
	mov	es,word ptr DGROUP:_system_font_ptr+2
	mov	dl,byte ptr [bp-13]
	mov	bx,ax
	test	byte ptr es:[bx],dl
	je	short @36@1122
	mov	al,byte ptr [bp+14]
	push	ax
	push	word ptr [bp-10]
	push	word ptr [bp-6]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	push	cs
	call	near ptr @vga_display@set_pix$qiiuc
	add	sp,10
@36@1122:
   ;	
   ;	                var_9 >>= 1;
   ;	
	shr	byte ptr [bp-13],1
   ;	
   ;	                if (GLYPH_BIT() & var_9) display->set_pix(var_8 + 1, var_6, color);
   ;	
	mov	al,byte ptr [bp-14]
	mov	ah,0
	shl	ax,3
	add	ax,word ptr [bp-12]
	add	ax,word ptr DGROUP:_system_font_ptr
	mov	es,word ptr DGROUP:_system_font_ptr+2
	mov	dl,byte ptr [bp-13]
	mov	bx,ax
	test	byte ptr es:[bx],dl
	je	short @36@1178
	mov	al,byte ptr [bp+14]
	push	ax
	push	word ptr [bp-10]
	mov	ax,word ptr [bp-6]
	inc	ax
	push	ax
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	push	cs
	call	near ptr @vga_display@set_pix$qiiuc
	add	sp,10
@36@1178:
   ;	
   ;	                var_9 >>= 1;
   ;	
	shr	byte ptr [bp-13],1
   ;	
   ;	                if (GLYPH_BIT() & var_9) display->set_pix(var_8 + 2, var_6, color);
   ;	
	mov	al,byte ptr [bp-14]
	mov	ah,0
	shl	ax,3
	add	ax,word ptr [bp-12]
	add	ax,word ptr DGROUP:_system_font_ptr
	mov	es,word ptr DGROUP:_system_font_ptr+2
	mov	dl,byte ptr [bp-13]
	mov	bx,ax
	test	byte ptr es:[bx],dl
	je	short @36@1234
	mov	al,byte ptr [bp+14]
	push	ax
	push	word ptr [bp-10]
	mov	ax,word ptr [bp-6]
	add	ax,2
	push	ax
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	push	cs
	call	near ptr @vga_display@set_pix$qiiuc
	add	sp,10
@36@1234:
   ;	
   ;	                var_9 >>= 1;
   ;	
	shr	byte ptr [bp-13],1
   ;	
   ;	                if (GLYPH_BIT() & var_9) display->set_pix(var_8 + 3, var_6, color);
   ;	
	mov	al,byte ptr [bp-14]
	mov	ah,0
	shl	ax,3
	add	ax,word ptr [bp-12]
	add	ax,word ptr DGROUP:_system_font_ptr
	mov	es,word ptr DGROUP:_system_font_ptr+2
	mov	dl,byte ptr [bp-13]
	mov	bx,ax
	test	byte ptr es:[bx],dl
	je	short @36@1290
	mov	al,byte ptr [bp+14]
	push	ax
	push	word ptr [bp-10]
	mov	ax,word ptr [bp-6]
	add	ax,3
	push	ax
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	push	cs
	call	near ptr @vga_display@set_pix$qiiuc
	add	sp,10
@36@1290:
   ;	
   ;	                var_9 >>= 1;
   ;	
	shr	byte ptr [bp-13],1
   ;	
   ;	                if (GLYPH_BIT() & var_9) display->set_pix(var_8 + 4, var_6, color);
   ;	
	mov	al,byte ptr [bp-14]
	mov	ah,0
	shl	ax,3
	add	ax,word ptr [bp-12]
	add	ax,word ptr DGROUP:_system_font_ptr
	mov	es,word ptr DGROUP:_system_font_ptr+2
	mov	dl,byte ptr [bp-13]
	mov	bx,ax
	test	byte ptr es:[bx],dl
	je	short @36@1346
	mov	al,byte ptr [bp+14]
	push	ax
	push	word ptr [bp-10]
	mov	ax,word ptr [bp-6]
	add	ax,4
	push	ax
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	push	cs
	call	near ptr @vga_display@set_pix$qiiuc
	add	sp,10
@36@1346:
   ;	
   ;	                var_9 >>= 1;
   ;	
	shr	byte ptr [bp-13],1
   ;	
   ;	                if (GLYPH_BIT() & var_9) display->set_pix(var_8 + 5, var_6, color);
   ;	
	mov	al,byte ptr [bp-14]
	mov	ah,0
	shl	ax,3
	add	ax,word ptr [bp-12]
	add	ax,word ptr DGROUP:_system_font_ptr
	mov	es,word ptr DGROUP:_system_font_ptr+2
	mov	dl,byte ptr [bp-13]
	mov	bx,ax
	test	byte ptr es:[bx],dl
	je	short @36@1402
	mov	al,byte ptr [bp+14]
	push	ax
	push	word ptr [bp-10]
	mov	ax,word ptr [bp-6]
	add	ax,5
	push	ax
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	push	cs
	call	near ptr @vga_display@set_pix$qiiuc
	add	sp,10
@36@1402:
   ;	
   ;	                var_9 >>= 1;
   ;	
	shr	byte ptr [bp-13],1
   ;	
   ;	                if (GLYPH_BIT() & var_9) display->set_pix(var_8 + 6, var_6, color);
   ;	
	mov	al,byte ptr [bp-14]
	mov	ah,0
	shl	ax,3
	add	ax,word ptr [bp-12]
	add	ax,word ptr DGROUP:_system_font_ptr
	mov	es,word ptr DGROUP:_system_font_ptr+2
	mov	dl,byte ptr [bp-13]
	mov	bx,ax
	test	byte ptr es:[bx],dl
	je	short @36@1458
	mov	al,byte ptr [bp+14]
	push	ax
	push	word ptr [bp-10]
	mov	ax,word ptr [bp-6]
	add	ax,6
	push	ax
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	push	cs
	call	near ptr @vga_display@set_pix$qiiuc
	add	sp,10
@36@1458:
   ;	
   ;	                var_9 >>= 1;
   ;	
	shr	byte ptr [bp-13],1
   ;	
   ;	                if (GLYPH_BIT() & var_9) display->set_pix(var_8 + 7, var_6, color);
   ;	
	mov	al,byte ptr [bp-14]
	mov	ah,0
	shl	ax,3
	add	ax,word ptr [bp-12]
	add	ax,word ptr DGROUP:_system_font_ptr
	mov	es,word ptr DGROUP:_system_font_ptr+2
	mov	dl,byte ptr [bp-13]
	mov	bx,ax
	test	byte ptr es:[bx],dl
	je	short @36@1514
	mov	al,byte ptr [bp+14]
	push	ax
	push	word ptr [bp-10]
	mov	ax,word ptr [bp-6]
	add	ax,7
	push	ax
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	push	cs
	call	near ptr @vga_display@set_pix$qiiuc
	add	sp,10
@36@1514:
   ;	
   ;	                ++var_6;
   ;	
	inc	word ptr [bp-10]
	inc	word ptr [bp-12]
@36@1570:
	cmp	word ptr [bp-12],8
	jge short	@@15
	jmp	@36@1066
@@15:
   ;	
   ;	            }
   ;	            var_8 += 8;
   ;	
	add	word ptr [bp-6],8
	inc	word ptr [bp-8]
@36@1654:
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	call	far ptr _strlen
	add	sp,4
	cmp	ax,word ptr [bp-8]
	jbe short	@@16
	jmp	@36@1038
@@16:
@36@1682:
   ;	
   ;	        }
   ;	    }
   ;	}
   ;	
	leave	
	ret	
@vga_text$qiinucucuc	endp
	?debug	C E9
	?debug	C FA00000000
VGADISP_TEXT	ends
_DATA	segment word public use16 'DATA'
s@	label	byte
	db	'Palette cycle not a multiple of 4.'
	db	0
	db	'Not in Mode X - aborted.'
	db	0
	db	'Getting screen bits.'
	db	0
	db	'Loading pcx file.'
	db	0
	db	'Creating PCX header.'
	db	0
	db	'Couldn'
	db	39
	db	't open'
	db	0
	db	'riptide.pcx'
	db	0
	db	'Creating PCX header.'
	db	0
	db	'riptide.pcx'
	db	0
	db	'*.pcx'
	db	0
	db	'Loading pcx file.'
	db	0
_DATA	ends
VGADISP_TEXT	segment byte public use16 'CODE'
VGADISP_TEXT	ends
	extrn	_system_font_ptr:dword
	extrn	_download_pos:word
	extrn	@write_error$qnuc:far
	extrn	_nullpal:far
	extrn	_paldown:far
	extrn	_palup:far
	extrn	_x_put_bits_masked_color:far
	extrn	_x_put_bits_masked2:far
	extrn	_x_put_bits_masked:far
	extrn	_x_vid2vid:far
	extrn	_x_put_bits:far
	extrn	_x_get_bits:far
	extrn	_x_set320x200:far
	extrn	_x_show_offset:far
	extrn	_x_fill_rect:far
	extrn	_x_draw_span:far
	extrn	_x_read_pix:far
	extrn	_x_set_pix:far
	extrn	@no_heap$qnuc:far
	extrn	_my_movsd:far
	extrn	@g_close_element$qv:far
	extrn	@g_element_read$qnvui:far
	extrn	@g_open_element$qnuc:far
	extrn	@read_error$qnuc:far
	public	@init_display$quc
	extrn	_forcepal:far
	extrn	@terminate$qnuct1:far
	extrn	@abs$qi:far
	public	@vga_text$qiinucucuc
	extrn	_spare_palette:byte
	extrn	_old_palette:byte
	extrn	_palette:byte
	extrn	_page_offsets:word
	extrn	_display:dword
	public	@vga_display@import_palette$qnucui
	public	@vga_display@explode_pcx$qnucuii
	public	@vga_display@load_pcx$qnucnui
	public	@vga_display@dump_pcx$qv
	public	@vga_display@show_pcx$qnucucuii
	public	@vga_display@put_bits_masked$qiiiinucuiuiuc
	public	@vga_display@put_bits$qiiiinucuiui
	public	@vga_display@copy_bits$qiiiiiiuiuiuiui
	public	@vga_display@get_bits$qiiii
	public	@vga_display@cls$qucuc
	public	@vga_display@show_offset$qui
	public	@vga_display@fill_rect$qiiiiiiuc
	public	@vga_display@print_at_xy$qiinucuc
	public	@vga_display@print_at$qiinuc
	public	@vga_display@restore_palette$qv
	public	@vga_display@save_palette$qv
	public	@vga_display@get_palette$qv
	public	@vga_display@set_palette$qv
	public	@vga_display@fade_down$qv
	public	@vga_display@fade_up$qv
	public	@vga_display@blank_palette$qv
	public	@vga_display@pause$qui
	public	@vga_display@draw_span$qiiuciui
	public	@vga_display@read_pix$qii
	public	@vga_display@set_pix$qiiuc
	public	@vga_display@setup_cycle$qucucuc
	public	@vga_display@cycle$qv
	public	@vga_display@turn_cycling$quc
	public	@vga_display@copy_page$qucuc
	public	@vga_display@doit$qv
	public	@vga_display@set_mode_x$qv
	public	@vga_display@set_text_mode$qv
	public	@vga_display@$bdtr$qv
	public	@vga_display@$bctr$quc
	extrn	_findnext:far
	extrn	_findfirst:far
_pokeb	equ	pokeb
_poke	equ	poke
_peekb	equ	peekb
_peek	equ	peek
	extrn	_intr:far
	extrn	_int86x:far
	extrn	_int86:far
	extrn	_write:far
	extrn	_read:far
	extrn	_open:far
	extrn	_close:far
	extrn	_strlen:far
	extrn	_strcmp:far
	extrn	_memcpy:far
	extrn	@$bdele$qnv:far
	extrn	@$bnew$qui:far
_s@	equ	s@
	end
