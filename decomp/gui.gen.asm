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
	?debug	S "gui.cpp"
	?debug	C E9664B385D076775692E637070
	?debug	C E9664B385D09726970746964652E68
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
	?debug	C E9263FD45C13443A5C494E434C5544455C737472696E672E68
GUI_TEXT	segment byte public use16 'CODE'
GUI_TEXT	ends
DGROUP	group	_DATA,_BSS
	assume	cs:GUI_TEXT,ds:DGROUP
_DATA	segment word public use16 'DATA'
d@	label	byte
d@w	label	word
_DATA	ends
_BSS	segment word public use16 'BSS'
b@	label	byte
b@w	label	word
_BSS	ends
GUI_TEXT	segment byte public use16 'CODE'
   ;	
   ;	ms_mouse::ms_mouse()
   ;	
	assume	cs:GUI_TEXT
@ms_mouse@$bctr$qv	proc	far
	enter	20,0
   ;	
   ;	{
   ;	
	cmp	dword ptr [bp+6],large 0
	jne	short @1@86
	push	48
	call	far ptr @$bnew$qui
	pop	cx
	mov	word ptr [bp+8],dx
	mov	word ptr [bp+6],ax
	or	ax,dx
	jne short	@@0
	jmp	@1@254
@@0:
@1@86:
   ;	
   ;	    REGPACK preg;
   ;	
   ;	    field_01 = 1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+1],1
   ;	
   ;	    field_00 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx],0
   ;	
   ;	    field_02 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+2],0
   ;	
   ;	    field_2C = field_2D = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,0
	mov	byte ptr es:[bx+45],al
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+44],al
   ;	
   ;	    field_14 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+20],0
   ;	
   ;	    field_16 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+22],0
   ;	
   ;	    regs.x.ax = 0;                                   /* fn 0 — reset/status */
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+28],0
   ;	
   ;	    int86(0x33, &regs, &regs);
   ;	
	mov	ax,word ptr [bp+6]
	add	ax,28
	push	word ptr [bp+8]
	push	ax
	mov	ax,word ptr [bp+6]
	add	ax,28
	push	word ptr [bp+8]
	push	ax
	push	51
	call	far ptr _int86
	add	sp,10
   ;	
   ;	    if (regs.x.ax == 0)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+28],0
	jne	short @1@142
   ;	
   ;	        field_2E = 0;                           /* no driver → flag clear */
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+46],0
	jmp	short @1@170
@1@142:
   ;	
   ;	    else
   ;	        field_2E = 1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+46],1
@1@170:
   ;	
   ;	    if (display->field_00 == 0) {               /* software cursor mode */
   ;	
	les	bx,dword ptr DGROUP:_display
	cmp	byte ptr es:[bx],0
	jne	short @1@226
   ;	
   ;	        set_cursor((uchar far *)default_mouse, 5, 5);
   ;	
	push	5
	push	5
	push	ds
	push	offset DGROUP:_default_mouse
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @ms_mouse@set_cursor$qnucii
	add	sp,12
   ;	
   ;	        preg.r_ax = 0x0C;                       /* fn 0x0C — set event handler */
   ;	
	mov	word ptr [bp-20],12
   ;	
   ;	        preg.r_cx = 0x1F;
   ;	
	mov	word ptr [bp-16],31
   ;	
   ;	        preg.r_dx = (int)(void far *)mouse_handler;   /* FP_OFF */
   ;	
	mov	word ptr [bp-14],offset @mouse_handler$qv
   ;	
   ;	        preg.r_es = FP_SEG(mouse_handler);
   ;	
	mov	word ptr [bp-4],seg @mouse_handler$qv
   ;	
   ;	        intr(0x33, &preg);
   ;	
	push	ss
	lea	ax,word ptr [bp-20]
	push	ax
	push	51
	call	far ptr _intr
	add	sp,6
   ;	
   ;	        field_08 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	dword ptr es:[bx+8],large 0
@1@226:
   ;	
   ;	    }
   ;	    field_0C = 0xA0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+12],160
   ;	
   ;	    field_0E = 0x64;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+14],100
   ;	
   ;	    _m_dont_handle = 0;
   ;	
	mov	byte ptr DGROUP:__m_dont_handle,0
@1@254:
   ;	
   ;	}
   ;	
	mov	dx,word ptr [bp+8]
	mov	ax,word ptr [bp+6]
	leave	
	ret	
@ms_mouse@$bctr$qv	endp
   ;	
   ;	ms_mouse::~ms_mouse()
   ;	
	assume	cs:GUI_TEXT
@ms_mouse@$bdtr$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	
	cmp	dword ptr [bp+6],large 0
	je	short @2@142
   ;	
   ;	    hide();
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @ms_mouse@hide$qv
	add	sp,4
   ;	
   ;	    regs.x.ax = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+28],0
   ;	
   ;	    int86(0x33, &regs, &regs);
   ;	
	mov	ax,word ptr [bp+6]
	add	ax,28
	push	word ptr [bp+8]
	push	ax
	mov	ax,word ptr [bp+6]
	add	ax,28
	push	word ptr [bp+8]
	push	ax
	push	51
	call	far ptr _int86
	add	sp,10
	test	word ptr [bp+10],1
	je	short @2@142
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @$bdele$qnv
	add	sp,4
@2@142:
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@ms_mouse@$bdtr$qv	endp
   ;	
   ;	void ms_mouse::set_cursor(uchar far *bm, int hx, int hy)
   ;	
	assume	cs:GUI_TEXT
@ms_mouse@set_cursor$qnucii	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    field_04 = bm;
   ;	
	les	bx,dword ptr [bp+6]
	mov	eax,dword ptr [bp+10]
	mov	dword ptr es:[bx+4],eax
   ;	
   ;	    field_10 = hx;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp+14]
	mov	word ptr es:[bx+16],ax
   ;	
   ;	    field_12 = hy;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp+16]
	mov	word ptr es:[bx+18],ax
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@ms_mouse@set_cursor$qnucii	endp
   ;	
   ;	uchar ms_mouse::get_event()
   ;	
	assume	cs:GUI_TEXT
@ms_mouse@get_event$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    field_01 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+1],0
	jmp	short @4@86
@4@58:
   ;	
   ;	    while (field_01 == 0) {
   ;	        if (doit() == 0)
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @ms_mouse@doit$qv
	add	sp,4
	or	al,al
	je	short @4@114
@4@86:
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+1],0
	je	short @4@58
@4@114:
   ;	
   ;	            break;
   ;	    }
   ;	    return field_01;
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+1]
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@ms_mouse@get_event$qv	endp
   ;	
   ;	void ms_mouse::set_coords(int x, int y)
   ;	
	assume	cs:GUI_TEXT
@ms_mouse@set_coords$qii	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    regs.x.ax = 4;                                   /* fn 4 — set position */
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+28],4
   ;	
   ;	    regs.x.cx = x << 1;                              /* mickeys = pixels*2 */
   ;	
	mov	ax,word ptr [bp+10]
	shl	ax,1
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+32],ax
   ;	
   ;	    regs.x.dx = y;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp+12]
	mov	word ptr es:[bx+34],ax
   ;	
   ;	    int86(0x33, &regs, &regs);
   ;	
	mov	ax,word ptr [bp+6]
	add	ax,28
	push	word ptr [bp+8]
	push	ax
	mov	ax,word ptr [bp+6]
	add	ax,28
	push	word ptr [bp+8]
	push	ax
	push	51
	call	far ptr _int86
	add	sp,10
   ;	
   ;	    mouse->field_0C = x;
   ;	
	les	bx,dword ptr DGROUP:_mouse
	mov	ax,word ptr [bp+10]
	mov	word ptr es:[bx+12],ax
   ;	
   ;	    mouse->field_0E = y;
   ;	
	les	bx,dword ptr DGROUP:_mouse
	mov	ax,word ptr [bp+12]
	mov	word ptr es:[bx+14],ax
   ;	
   ;	    get_status();
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @ms_mouse@get_status$qv
	add	sp,4
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@ms_mouse@set_coords$qii	endp
   ;	
   ;	void ms_mouse::show()
   ;	
	assume	cs:GUI_TEXT
@ms_mouse@show$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (field_02 == 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+2],0
	jne	short @6@142
   ;	
   ;	        field_02 = 1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+2],1
   ;	
   ;	        field_14 = display->width;
   ;	
	les	bx,dword ptr DGROUP:_display
	mov	ax,word ptr es:[bx+8]
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+20],ax
   ;	
   ;	        field_16 = display->height;
   ;	
	les	bx,dword ptr DGROUP:_display
	mov	ax,word ptr es:[bx+10]
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+22],ax
   ;	
   ;	        display->width  = 0x140;
   ;	
	les	bx,dword ptr DGROUP:_display
	mov	word ptr es:[bx+8],320
   ;	
   ;	        display->height = 0xC8;
   ;	
	les	bx,dword ptr DGROUP:_display
	mov	word ptr es:[bx+10],200
   ;	
   ;	        if (display->field_00 == 0)
   ;	
	les	bx,dword ptr DGROUP:_display
	cmp	byte ptr es:[bx],0
	jne	short @6@114
   ;	
   ;	            draw_mouse();
   ;	
	call	far ptr @draw_mouse$qv
	jmp	short @6@142
@6@114:
   ;	
   ;	        else {
   ;	            regs.x.ax = 1;                           /* fn 1 — show hw cursor */
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+28],1
   ;	
   ;	            int86(0x33, &regs, &regs);
   ;	
	mov	ax,word ptr [bp+6]
	add	ax,28
	push	word ptr [bp+8]
	push	ax
	mov	ax,word ptr [bp+6]
	add	ax,28
	push	word ptr [bp+8]
	push	ax
	push	51
	call	far ptr _int86
	add	sp,10
@6@142:
   ;	
   ;	        }
   ;	    }
   ;	}
   ;	
	pop	bp
	ret	
@ms_mouse@show$qv	endp
   ;	
   ;	void ms_mouse::hide()
   ;	
	assume	cs:GUI_TEXT
@ms_mouse@hide$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (field_02 != 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+2],0
	je	short @7@170
   ;	
   ;	        if (display->field_00 == 0)
   ;	
	les	bx,dword ptr DGROUP:_display
	cmp	byte ptr es:[bx],0
	jne	short @7@114
   ;	
   ;	            erase_mouse();
   ;	
	call	far ptr @erase_mouse$qv
	jmp	short @7@142
@7@114:
   ;	
   ;	        else {
   ;	            regs.x.ax = 2;                           /* fn 2 — hide hw cursor */
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+28],2
   ;	
   ;	            int86(0x33, &regs, &regs);
   ;	
	mov	ax,word ptr [bp+6]
	add	ax,28
	push	word ptr [bp+8]
	push	ax
	mov	ax,word ptr [bp+6]
	add	ax,28
	push	word ptr [bp+8]
	push	ax
	push	51
	call	far ptr _int86
	add	sp,10
@7@142:
   ;	
   ;	        }
   ;	        display->width  = field_14;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+20]
	les	bx,dword ptr DGROUP:_display
	mov	word ptr es:[bx+8],ax
   ;	
   ;	        display->height = field_16;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+22]
	les	bx,dword ptr DGROUP:_display
	mov	word ptr es:[bx+10],ax
   ;	
   ;	        field_02 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+2],0
@7@170:
   ;	
   ;	    }
   ;	}
   ;	
	pop	bp
	ret	
@ms_mouse@hide$qv	endp
   ;	
   ;	uchar ms_mouse::button_press(uchar btn)
   ;	
	assume	cs:GUI_TEXT
@ms_mouse@button_press$quc	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    get_status();
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @ms_mouse@get_status$qv
	add	sp,4
   ;	
   ;	    if (btn == 0 && field_00 != 0)
   ;	
	cmp	byte ptr [bp+10],0
	jne	short @8@114
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx],0
	je	short @8@114
@8@86:
   ;	
   ;	        return 1;
   ;	
	mov	al,1
	jmp	short @8@310
@8@114:
   ;	
   ;	    if (field_2C != 0 && btn == 1)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+44],0
	je	short @8@198
	cmp	byte ptr [bp+10],1
	jne	short @8@198
   ;	
   ;	        return 1;
   ;	
	jmp	short @8@86
@8@198:
   ;	
   ;	    if (field_2D != 0 && btn == 3)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+45],0
	je	short @8@282
	cmp	byte ptr [bp+10],3
	jne	short @8@282
	jmp	short @8@86
@8@282:
   ;	
   ;	        return 1;
   ;	    return 0;
   ;	
	mov	al,0
@8@310:
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@ms_mouse@button_press$quc	endp
   ;	
   ;	uchar ms_mouse::in_box(int x1, int y1, int x2, int y2)
   ;	
	assume	cs:GUI_TEXT
@ms_mouse@in_box$qiiii	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    get_status();
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @ms_mouse@get_status$qv
	add	sp,4
   ;	
   ;	    return (field_0C >= x1 && field_0C <= x2 && field_0E >= y1 && field_0E <= y2);
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+12]
	cmp	ax,word ptr [bp+10]
	jl	short @9@170
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+12]
	cmp	ax,word ptr [bp+14]
	jg	short @9@170
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+14]
	cmp	ax,word ptr [bp+12]
	jl	short @9@170
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+14]
	cmp	ax,word ptr [bp+16]
	jg	short @9@170
	mov	ax,1
	jmp	short @9@198
@9@170:
	xor	ax,ax
@9@198:
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@ms_mouse@in_box$qiiii	endp
   ;	
   ;	uchar ms_mouse::pressed_in_box(int x1, int y1, int x2, int y2)
   ;	
	assume	cs:GUI_TEXT
@ms_mouse@pressed_in_box$qiiii	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    get_status();
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @ms_mouse@get_status$qv
	add	sp,4
   ;	
   ;	    if (in_box(x1, y1, x2, y2) && field_00 != 0)
   ;	
	push	word ptr [bp+16]
	push	word ptr [bp+14]
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @ms_mouse@in_box$qiiii
	add	sp,12
	or	al,al
	je	short @10@114
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx],0
	je	short @10@114
   ;	
   ;	        return 1;
   ;	
	mov	al,1
	jmp	short @10@142
@10@114:
   ;	
   ;	    return 0;
   ;	
	mov	al,0
@10@142:
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@ms_mouse@pressed_in_box$qiiii	endp
   ;	
   ;	uchar ms_mouse::doit()
   ;	
	assume	cs:GUI_TEXT
@ms_mouse@doit$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    get_status();
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @ms_mouse@get_status$qv
	add	sp,4
   ;	
   ;	    return 1;
   ;	
	mov	al,1
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@ms_mouse@doit$qv	endp
   ;	
   ;	void ms_mouse::get_status()
   ;	
	assume	cs:GUI_TEXT
@ms_mouse@get_status$qv	proc	far
	enter	2,0
   ;	
   ;	{
   ;	    int btns;
   ;	
   ;	    if (display->field_00 == 0)                 /* software mode: ISR maintains */
   ;	
	les	bx,dword ptr DGROUP:_display
	cmp	byte ptr es:[bx],0
	jne short	@@1
	jmp	@12@394
@@1:
   ;	
   ;	        return;                                 /*   the fields already */
   ;	    regs.x.ax = 3;                                   /* fn 3 — get pos + buttons */
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+28],3
   ;	
   ;	    int86(0x33, &regs, &regs);
   ;	
	mov	ax,word ptr [bp+6]
	add	ax,28
	push	word ptr [bp+8]
	push	ax
	mov	ax,word ptr [bp+6]
	add	ax,28
	push	word ptr [bp+8]
	push	ax
	push	51
	call	far ptr _int86
	add	sp,10
   ;	
   ;	    field_0C = regs.x.cx >> 1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+32]
	shr	ax,1
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+12],ax
   ;	
   ;	    field_0E = regs.x.dx;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+34]
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+14],ax
   ;	
   ;	    btns = regs.x.bx & 7;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+30]
	and	ax,7
	mov	word ptr [bp-2],ax
   ;	
   ;	    if (btns != 0) field_00 = 1; else field_00 = 0;
   ;	
	cmp	word ptr [bp-2],0
	je	short @12@114
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx],1
	jmp	short @12@142
@12@114:
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx],0
@12@142:
   ;	
   ;	    if (btns == 1) field_2C = 1; else field_2C = 0;
   ;	
	cmp	word ptr [bp-2],1
	jne	short @12@198
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+44],1
	jmp	short @12@226
@12@198:
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+44],0
@12@226:
   ;	
   ;	    if (btns == 2) field_2D = 1; else field_2D = 0;
   ;	
	cmp	word ptr [bp-2],2
	jne	short @12@282
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+45],1
	jmp	short @12@310
@12@282:
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+45],0
@12@310:
   ;	
   ;	    if (field_01 == 0 && field_00 == 0)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+1],0
	jne	short @12@394
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx],0
	jne	short @12@394
   ;	
   ;	        field_01 = 1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+1],1
@12@394:
   ;	
   ;	}
   ;	
	leave	
	ret	
@ms_mouse@get_status$qv	endp
   ;	
   ;	void mouse_handler()
   ;	
	assume	cs:GUI_TEXT
@mouse_handler$qv	proc	far
	enter	6,0
   ;	
   ;	{
   ;	    int b, x, y;
   ;	
   ;	    if (_m_dont_handle)
   ;	
	cmp	byte ptr DGROUP:__m_dont_handle,0
	je short	@@2
	jmp	@13@254
@@2:
   ;	
   ;	        return;
   ;	    b = _BX;                                    /* incoming bx = buttons */
   ;	
	mov	word ptr [bp-2],bx
   ;	
   ;	    x = _CX >> 1;                               /* incoming cx mickeys → px */
   ;	
	mov	ax,cx
	shr	ax,1
	mov	word ptr [bp-4],ax
   ;	
   ;	    y = _DX;                                    /* incoming dy */
   ;	
	mov	word ptr [bp-6],dx
   ;	
   ;	    if (mouse->field_02 == 1)
   ;	
	les	bx,dword ptr DGROUP:_mouse
	cmp	byte ptr es:[bx+2],1
	jne	short @13@114
   ;	
   ;	        erase_mouse();
   ;	
	call	far ptr @erase_mouse$qv
@13@114:
   ;	
   ;	    mouse->field_0C = x;
   ;	
	les	bx,dword ptr DGROUP:_mouse
	mov	ax,word ptr [bp-4]
	mov	word ptr es:[bx+12],ax
   ;	
   ;	    mouse->field_0E = y;
   ;	
	les	bx,dword ptr DGROUP:_mouse
	mov	ax,word ptr [bp-6]
	mov	word ptr es:[bx+14],ax
   ;	
   ;	    mouse->field_2C = b & 1;
   ;	
	les	bx,dword ptr DGROUP:_mouse
	mov	al,byte ptr [bp-2]
	and	al,1
	mov	byte ptr es:[bx+44],al
   ;	
   ;	    mouse->field_2D = b & 2;
   ;	
	les	bx,dword ptr DGROUP:_mouse
	mov	al,byte ptr [bp-2]
	and	al,2
	mov	byte ptr es:[bx+45],al
   ;	
   ;	    mouse->field_00 = mouse->field_2C;
   ;	
	les	bx,dword ptr DGROUP:_mouse
	mov	al,byte ptr es:[bx+44]
	les	bx,dword ptr DGROUP:_mouse
	mov	byte ptr es:[bx],al
   ;	
   ;	    if (mouse->field_01 == 0 && mouse->field_00 == 0)
   ;	
	les	bx,dword ptr DGROUP:_mouse
	cmp	byte ptr es:[bx+1],0
	jne	short @13@198
	les	bx,dword ptr DGROUP:_mouse
	cmp	byte ptr es:[bx],0
	jne	short @13@198
   ;	
   ;	        mouse->field_01 = 1;
   ;	
	les	bx,dword ptr DGROUP:_mouse
	mov	byte ptr es:[bx+1],1
@13@198:
   ;	
   ;	    if (mouse->field_02 == 1)
   ;	
	les	bx,dword ptr DGROUP:_mouse
	cmp	byte ptr es:[bx+2],1
	jne	short @13@254
   ;	
   ;	        draw_mouse();
   ;	
	call	far ptr @draw_mouse$qv
@13@254:
   ;	
   ;	}
   ;	
	leave	
	ret	
@mouse_handler$qv	endp
   ;	
   ;	void draw_mouse()
   ;	
	assume	cs:GUI_TEXT
@draw_mouse$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    mouse->field_18 = mouse->field_0C & 0xFFFC;
   ;	
	les	bx,dword ptr DGROUP:_mouse
	mov	ax,word ptr es:[bx+12]
	and	ax,00000FFFCh
	les	bx,dword ptr DGROUP:_mouse
	mov	word ptr es:[bx+24],ax
   ;	
   ;	    mouse->field_1A = (mouse->field_10 & 0xFFFC) + 4;
   ;	
	les	bx,dword ptr DGROUP:_mouse
	mov	ax,word ptr es:[bx+16]
	and	ax,00000FFFCh
	add	ax,4
	les	bx,dword ptr DGROUP:_mouse
	mov	word ptr es:[bx+26],ax
   ;	
   ;	    _m_dont_handle = 1;
   ;	
	mov	byte ptr DGROUP:__m_dont_handle,1
   ;	
   ;	    /* save the screen rect under the cursor into the offscreen page at 0xCAD0 */
   ;	    display->copy_bits(mouse->field_18, mouse->field_0E,
   ;	
   ;	
   ;	                       mouse->field_18 + mouse->field_1A,
   ;	                       mouse->field_0E + mouse->field_12,
   ;	                       0, 0, 0, 0xCAD0, 0x140, mouse->field_1A);
   ;	
	les	bx,dword ptr DGROUP:_mouse
	push	word ptr es:[bx+26]
	push	320
	push	00000CAD0h
	push	0
	push	0
	push	0
	les	bx,dword ptr DGROUP:_mouse
	mov	ax,word ptr es:[bx+14]
	les	bx,dword ptr DGROUP:_mouse
	add	ax,word ptr es:[bx+18]
	push	ax
	les	bx,dword ptr DGROUP:_mouse
	mov	ax,word ptr es:[bx+24]
	les	bx,dword ptr DGROUP:_mouse
	add	ax,word ptr es:[bx+26]
	push	ax
	les	bx,dword ptr DGROUP:_mouse
	push	word ptr es:[bx+14]
	les	bx,dword ptr DGROUP:_mouse
	push	word ptr es:[bx+24]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@copy_bits$qiiiiiiuiuiuiui
	add	sp,24
   ;	
   ;	    display->put_bits_masked(mouse->field_0C, mouse->field_0E,
   ;	
   ;	
   ;	                             mouse->field_0C + mouse->field_10,
   ;	                             mouse->field_0E + mouse->field_12,
   ;	                             mouse->field_04, 0, 0, 0);
   ;	
	push	0
	push	0
	push	0
	les	bx,dword ptr DGROUP:_mouse
	push	word ptr es:[bx+6]
	push	word ptr es:[bx+4]
	les	bx,dword ptr DGROUP:_mouse
	mov	ax,word ptr es:[bx+14]
	les	bx,dword ptr DGROUP:_mouse
	add	ax,word ptr es:[bx+18]
	push	ax
	les	bx,dword ptr DGROUP:_mouse
	mov	ax,word ptr es:[bx+12]
	les	bx,dword ptr DGROUP:_mouse
	add	ax,word ptr es:[bx+16]
	push	ax
	les	bx,dword ptr DGROUP:_mouse
	push	word ptr es:[bx+14]
	les	bx,dword ptr DGROUP:_mouse
	push	word ptr es:[bx+12]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@put_bits_masked$qiiiinucuiuiuc
	add	sp,22
   ;	
   ;	    _m_dont_handle = 0;
   ;	
	mov	byte ptr DGROUP:__m_dont_handle,0
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@draw_mouse$qv	endp
   ;	
   ;	void erase_mouse()
   ;	
	assume	cs:GUI_TEXT
@erase_mouse$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    _m_dont_handle = 1;
   ;	
	mov	byte ptr DGROUP:__m_dont_handle,1
   ;	
   ;	    /* restore the background saved by draw_mouse */
   ;	    display->copy_bits(0, 0, mouse->field_1A, mouse->field_12,
   ;	
   ;	
   ;	                       mouse->field_18, mouse->field_0E,
   ;	                       0xCAD0, 0, mouse->field_1A, 0x140);
   ;	
	push	320
	les	bx,dword ptr DGROUP:_mouse
	push	word ptr es:[bx+26]
	push	0
	push	00000CAD0h
	les	bx,dword ptr DGROUP:_mouse
	push	word ptr es:[bx+14]
	les	bx,dword ptr DGROUP:_mouse
	push	word ptr es:[bx+24]
	les	bx,dword ptr DGROUP:_mouse
	push	word ptr es:[bx+18]
	les	bx,dword ptr DGROUP:_mouse
	push	word ptr es:[bx+26]
	push	0
	push	0
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@copy_bits$qiiiiiiuiuiuiui
	add	sp,24
   ;	
   ;	    _m_dont_handle = 0;
   ;	
	mov	byte ptr DGROUP:__m_dont_handle,0
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@erase_mouse$qv	endp
   ;	
   ;	gui_item::gui_item()
   ;	
	assume	cs:GUI_TEXT
@gui_item@$bctr$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	
	cmp	dword ptr [bp+6],large 0
	jne	short @16@86
	push	20
	call	far ptr @$bnew$qui
	pop	cx
	mov	word ptr [bp+8],dx
	mov	word ptr [bp+6],ax
	or	ax,dx
	je	short @16@114
@16@86:
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx],offset @@gui_item@
   ;	
   ;	    field_0C = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+12],0
   ;	
   ;	    field_0E = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	dword ptr es:[bx+14],large 0
   ;	
   ;	    field_02 = field_04 = field_06 = field_08 = field_0A = 0;
   ;	
	les	bx,dword ptr [bp+6]
	xor	ax,ax
	mov	word ptr es:[bx+10],ax
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+8],ax
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+6],ax
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+4],ax
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+2],ax
@16@114:
   ;	
   ;	}
   ;	
	mov	dx,word ptr [bp+8]
	mov	ax,word ptr [bp+6]
	pop	bp
	ret	
@gui_item@$bctr$qv	endp
   ;	
   ;	void i_init_interface(void far *l, void far *r, void far *u,
   ;	
	assume	cs:GUI_TEXT
@i_init_interface$qnvt1t1t1t1	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	                      void far *d, void far *b)
   ;	{
   ;	    mouse        = new ms_mouse;
   ;	
	push	0
	push	0
	push	cs
	call	near ptr @ms_mouse@$bctr$qv
	add	sp,4
	mov	word ptr DGROUP:_mouse+2,dx
	mov	word ptr DGROUP:_mouse,ax
   ;	
   ;	    the_menu_bar = new menu_bar;
   ;	
	push	0
	push	0
	call	far ptr @menu_bar@$bctr$qv
	add	sp,4
	mov	word ptr DGROUP:_the_menu_bar+2,dx
	mov	word ptr DGROUP:_the_menu_bar,ax
   ;	
   ;	    pd_redraws         = 0;
   ;	
	mov	byte ptr DGROUP:_pd_redraws,0
   ;	
   ;	    show_box_on        = 0;
   ;	
	mov	word ptr DGROUP:_show_box_on,0
   ;	
   ;	    menu_bar_height    = 9;
   ;	
	mov	byte ptr DGROUP:_menu_bar_height,9
   ;	
   ;	    maximum_text_length = 8;
   ;	
	mov	byte ptr DGROUP:_maximum_text_length,8
   ;	
   ;	    i_external_left   = (uchar (far *)(void))l;
   ;	
	mov	eax,dword ptr [bp+6]
	mov	dword ptr DGROUP:_i_external_left,eax
   ;	
   ;	    i_external_right  = (uchar (far *)(void))r;
   ;	
	mov	eax,dword ptr [bp+10]
	mov	dword ptr DGROUP:_i_external_right,eax
   ;	
   ;	    i_external_up     = (uchar (far *)(void))u;
   ;	
	mov	eax,dword ptr [bp+14]
	mov	dword ptr DGROUP:_i_external_up,eax
   ;	
   ;	    i_external_down   = (uchar (far *)(void))d;
   ;	
	mov	eax,dword ptr [bp+18]
	mov	dword ptr DGROUP:_i_external_down,eax
   ;	
   ;	    i_external_button = (uchar (far *)(void))b;
   ;	
	mov	eax,dword ptr [bp+22]
	mov	dword ptr DGROUP:_i_external_button,eax
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@i_init_interface$qnvt1t1t1t1	endp
   ;	
   ;	void i_poll_interface()
   ;	
	assume	cs:GUI_TEXT
@i_poll_interface$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    the_menu_bar->poll();
   ;	
	push	word ptr DGROUP:_the_menu_bar+2
	push	word ptr DGROUP:_the_menu_bar
	les	bx,dword ptr DGROUP:_the_menu_bar
	mov	bx,word ptr es:[bx]
	call	dword ptr [bx+8]
	add	sp,4
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@i_poll_interface$qv	endp
   ;	
   ;	void i_set_text(uchar fg, uchar bg, uchar a4, uchar a6)
   ;	
	assume	cs:GUI_TEXT
@i_set_text$qucucucuc	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    display->field_01 = bg;
   ;	
	les	bx,dword ptr DGROUP:_display
	mov	al,byte ptr [bp+8]
	mov	byte ptr es:[bx+1],al
   ;	
   ;	    display->field_04 = fg;
   ;	
	les	bx,dword ptr DGROUP:_display
	mov	al,byte ptr [bp+6]
	mov	byte ptr es:[bx+4],al
   ;	
   ;	    display->field_02 = a6;
   ;	
	les	bx,dword ptr DGROUP:_display
	mov	al,byte ptr [bp+12]
	mov	byte ptr es:[bx+2],al
   ;	
   ;	    display->field_03 = a4;
   ;	
	les	bx,dword ptr DGROUP:_display
	mov	al,byte ptr [bp+10]
	mov	byte ptr es:[bx+3],al
   ;	
   ;	    menu_bar_height = (bg ? 1 : 0) + 9;
   ;	
	cmp	byte ptr [bp+8],0
	je	short @19@86
	mov	al,1
	jmp	short @19@114
@19@86:
	mov	al,0
@19@114:
	add	al,9
	mov	byte ptr DGROUP:_menu_bar_height,al
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@i_set_text$qucucucuc	endp
   ;	
   ;	void i_no_imp()
   ;	
	assume	cs:GUI_TEXT
@i_no_imp$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    i_inform((uchar far *)"This feature has not\nbeen implemented yet.", 0, 0);
   ;	
	push	0
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@
	call	far ptr @i_inform$qnucuct1
	add	sp,10
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@i_no_imp$qv	endp
   ;	
   ;	int i_get_int(uchar far *title, uchar far *arg_4)
   ;	
	assume	cs:GUI_TEXT
@i_get_int$qnuct1	proc	far
	enter	6,0
   ;	
   ;	{
   ;	    prompt_box far *pb;
   ;	    int v;
   ;	
   ;	    pb = new prompt_box(title);
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	0
	push	0
	call	far ptr @prompt_box@$bctr$qnuc
	add	sp,8
	mov	word ptr [bp-2],dx
	mov	word ptr [bp-4],ax
   ;	
   ;	    pb->field_14 = arg_4;
   ;	
	les	bx,dword ptr [bp-4]
	mov	eax,dword ptr [bp+10]
	mov	dword ptr es:[bx+20],eax
   ;	
   ;	    pb->draw();
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	les	bx,dword ptr [bp-4]
	mov	bx,word ptr es:[bx]
	call	dword ptr [bx]
	add	sp,4
   ;	
   ;	    pb->poll();
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	les	bx,dword ptr [bp-4]
	mov	bx,word ptr es:[bx]
	call	dword ptr [bx+8]
	add	sp,4
   ;	
   ;	    if (pb->field_1D != 0) {
   ;	
	les	bx,dword ptr [bp-4]
	cmp	byte ptr es:[bx+29],0
	je	short @21@86
   ;	
   ;	        delete pb;
   ;	
	push	3
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @prompt_box@$bdtr$qv
	add	sp,6
   ;	
   ;	        return -1;
   ;	
	mov	ax,-1
	jmp	short @21@114
@21@86:
   ;	
   ;	    }
   ;	    v = pb->field_24;
   ;	
	les	bx,dword ptr [bp-4]
	mov	ax,word ptr es:[bx+36]
	mov	word ptr [bp-6],ax
   ;	
   ;	    delete pb;
   ;	
	push	3
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @prompt_box@$bdtr$qv
	add	sp,6
   ;	
   ;	    return v;
   ;	
	mov	ax,word ptr [bp-6]
@21@114:
   ;	
   ;	}
   ;	
	leave	
	ret	
@i_get_int$qnuct1	endp
   ;	
   ;	uchar far *i_get_string(uchar far *title, uchar far *arg_4)
   ;	
	assume	cs:GUI_TEXT
@i_get_string$qnuct1	proc	far
	enter	8,0
   ;	
   ;	{
   ;	    prompt_box far *pb;
   ;	    uchar far *s;
   ;	
   ;	    pb = new prompt_box(title);
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	0
	push	0
	call	far ptr @prompt_box@$bctr$qnuc
	add	sp,8
	mov	word ptr [bp-2],dx
	mov	word ptr [bp-4],ax
   ;	
   ;	    pb->field_14 = arg_4;
   ;	
	les	bx,dword ptr [bp-4]
	mov	eax,dword ptr [bp+10]
	mov	dword ptr es:[bx+20],eax
   ;	
   ;	    pb->draw();
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	les	bx,dword ptr [bp-4]
	mov	bx,word ptr es:[bx]
	call	dword ptr [bx]
	add	sp,4
   ;	
   ;	    pb->poll();
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	les	bx,dword ptr [bp-4]
	mov	bx,word ptr es:[bx]
	call	dword ptr [bx+8]
	add	sp,4
   ;	
   ;	    if (pb->field_1D != 0) {
   ;	
	les	bx,dword ptr [bp-4]
	cmp	byte ptr es:[bx+29],0
	je	short @22@86
   ;	
   ;	        delete pb;
   ;	
	push	3
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @prompt_box@$bdtr$qv
	add	sp,6
   ;	
   ;	        return 0;
   ;	
	xor	dx,dx
	xor	ax,ax
	jmp	short @22@114
@22@86:
   ;	
   ;	    }
   ;	    s = (uchar far *)strdup((char far *)pb->field_1E);
   ;	
	les	bx,dword ptr [bp-4]
	push	word ptr es:[bx+32]
	push	word ptr es:[bx+30]
	call	far ptr _strdup
	add	sp,4
	mov	word ptr [bp-6],dx
	mov	word ptr [bp-8],ax
   ;	
   ;	    delete pb;
   ;	
	push	3
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @prompt_box@$bdtr$qv
	add	sp,6
   ;	
   ;	    return s;
   ;	
	mov	dx,word ptr [bp-6]
	mov	ax,word ptr [bp-8]
@22@114:
   ;	
   ;	}
   ;	
	leave	
	ret	
@i_get_string$qnuct1	endp
   ;	
   ;	uchar far *i_load_file(uchar far *src, uchar far *dest)
   ;	
	assume	cs:GUI_TEXT
@i_load_file$qnuct1	proc	far
	enter	8,0
@23@30:
   ;	
   ;	{
   ;	    text_box far *tb;
   ;	    uchar far *path;
   ;	
   ;	  restart:
   ;	    tb = new text_box((uchar far *)"Open File");
   ;	
	push	ds
	push	offset DGROUP:s@+43
	push	0
	push	0
	call	far ptr @text_box@$bctr$qnuc
	add	sp,8
	mov	word ptr [bp-2],dx
	mov	word ptr [bp-4],ax
   ;	
   ;	    tb->add_file_box(src);
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @text_box@add_file_box$qnuc
	add	sp,8
   ;	
   ;	    tb->add_button((uchar far *)"Cancel", 0);
   ;	
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+53
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @text_box@add_button$qnucnv
	add	sp,12
   ;	
   ;	    tb->add_button((uchar far *)"Ok", 0);
   ;	
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+60
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @text_box@add_button$qnucnv
	add	sp,12
   ;	
   ;	    tb->add_button((uchar far *)"Cd", 0);
   ;	
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+63
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @text_box@add_button$qnucnv
	add	sp,12
   ;	
   ;	    tb->draw();
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	les	bx,dword ptr [bp-4]
	mov	bx,word ptr es:[bx]
	call	dword ptr [bx]
	add	sp,4
@23@58:
   ;	
   ;	    while (tb->poll() == 0)
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	les	bx,dword ptr [bp-4]
	mov	bx,word ptr es:[bx]
	call	dword ptr [bx+8]
	add	sp,4
	or	al,al
	je	short @23@58
   ;	
   ;	        ;
   ;	    if (tb->buttons[2]->field_20 != 0) {
   ;	
	les	bx,dword ptr [bp-4]
	les	bx,dword ptr es:[bx+130]
	cmp	word ptr es:[bx+32],0
	je	short @23@226
@23@114:
   ;	
   ;	      getpath:
   ;	        path = i_get_string((uchar far *)"Change Directory",
   ;	
   ;	
   ;	                            (uchar far *)"Enter new path:");
   ;	
	push	ds
	push	offset DGROUP:s@+83
	push	ds
	push	offset DGROUP:s@+66
	push	cs
	call	near ptr @i_get_string$qnuct1
	add	sp,8
	mov	word ptr [bp-6],dx
	mov	word ptr [bp-8],ax
   ;	
   ;	        if (path != 0 && chdir((char far *)path) == -1) {
   ;	
	cmp	dword ptr [bp-8],large 0
	je	short @23@198
	push	word ptr [bp-6]
	push	word ptr [bp-8]
	call	far ptr _chdir
	add	sp,4
	cmp	ax,-1
	jne	short @23@198
   ;	
   ;	            i_inform((uchar far *)"Not a valid path.", 0, 0);
   ;	
	push	0
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+99
	call	far ptr @i_inform$qnucuct1
	add	sp,10
   ;	
   ;	            goto getpath;
   ;	
	jmp	short @23@114
@23@198:
   ;	
   ;	        }
   ;	        delete tb;
   ;	
	push	3
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @text_box@$bdtr$qv
	add	sp,6
   ;	
   ;	        goto restart;
   ;	
	jmp	@23@30
@23@226:
   ;	
   ;	    }
   ;	    if (tb->field_18->field_36 != 0 && tb->buttons[0]->field_20 == 0)
   ;	
	les	bx,dword ptr [bp-4]
	les	bx,dword ptr es:[bx+24]
	mov	ax,word ptr es:[bx+54]
	or	ax,word ptr es:[bx+56]
	je	short @23@310
	les	bx,dword ptr [bp-4]
	les	bx,dword ptr es:[bx+122]
	cmp	word ptr es:[bx+32],0
	jne	short @23@310
   ;	
   ;	        strcpy((char far *)dest, (char far *)tb->field_18->field_36);
   ;	
	les	bx,dword ptr [bp-4]
	les	bx,dword ptr es:[bx+24]
	push	word ptr es:[bx+56]
	push	word ptr es:[bx+54]
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	call	far ptr _strcpy
	add	sp,8
	jmp	short @23@338
@23@310:
   ;	
   ;	    else
   ;	        dest = 0;
   ;	
	mov	dword ptr [bp+10],large 0
@23@338:
   ;	
   ;	    delete tb;
   ;	
	push	3
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @text_box@$bdtr$qv
	add	sp,6
   ;	
   ;	    mouse->get_event();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@get_event$qv
	add	sp,4
   ;	
   ;	    return dest;
   ;	
	mov	dx,word ptr [bp+12]
	mov	ax,word ptr [bp+10]
   ;	
   ;	}
   ;	
	leave	
	ret	
@i_load_file$qnuct1	endp
   ;	
   ;	uchar i_yes_cancel(uchar far *s, uchar arg_4)
   ;	
	assume	cs:GUI_TEXT
@i_yes_cancel$qnucuc	proc	far
	enter	6,0
   ;	
   ;	{
   ;	    text_box far *tb;
   ;	    uchar res;
   ;	
   ;	    tb = new text_box(0);
   ;	
	push	0
	push	0
	push	0
	push	0
	call	far ptr @text_box@$bctr$qnuc
	add	sp,8
	mov	word ptr [bp-2],dx
	mov	word ptr [bp-4],ax
   ;	
   ;	    parse_box_string(tb, s);
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @parse_box_string$qn8text_boxnuc
	add	sp,8
   ;	
   ;	    if (arg_4 != 0) {
   ;	
	cmp	byte ptr [bp+10],0
	je	short @24@86
   ;	
   ;	        tb->add_button((uchar far *)"No", 0);
   ;	
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+117
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @text_box@add_button$qnucnv
	add	sp,12
   ;	
   ;	        tb->add_button((uchar far *)"Yes", 0);
   ;	
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+120
	jmp	short @24@114
@24@86:
   ;	
   ;	    } else {
   ;	        tb->add_button((uchar far *)"Cancel", 0);
   ;	
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+124
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @text_box@add_button$qnucnv
	add	sp,12
   ;	
   ;	        tb->add_button((uchar far *)"Ok", 0);
   ;	
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+131
@24@114:
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @text_box@add_button$qnucnv
	add	sp,12
   ;	
   ;	    }
   ;	    tb->draw();
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	les	bx,dword ptr [bp-4]
	mov	bx,word ptr es:[bx]
	call	dword ptr [bx]
	add	sp,4
@24@170:
   ;	
   ;	    while (tb->poll() == 0)
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	les	bx,dword ptr [bp-4]
	mov	bx,word ptr es:[bx]
	call	dword ptr [bx+8]
	add	sp,4
	or	al,al
	je	short @24@170
   ;	
   ;	        ;
   ;	    if (((button far *)tb->buttons[0])->field_20 != 0)
   ;	
	les	bx,dword ptr [bp-4]
	les	bx,dword ptr es:[bx+122]
	cmp	word ptr es:[bx+32],0
	je	short @24@254
   ;	
   ;	        res = 1;
   ;	
	mov	byte ptr [bp-5],1
	jmp	short @24@282
@24@254:
   ;	
   ;	    else
   ;	        res = 0;
   ;	
	mov	byte ptr [bp-5],0
@24@282:
   ;	
   ;	    release_box_strings(tb);
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @release_box_strings$qn8text_box
	add	sp,4
   ;	
   ;	    delete tb;
   ;	
	push	3
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @text_box@$bdtr$qv
	add	sp,6
   ;	
   ;	    return res;
   ;	
	mov	al,byte ptr [bp-5]
   ;	
   ;	}
   ;	
	leave	
	ret	
@i_yes_cancel$qnucuc	endp
   ;	
   ;	int i_inform(uchar far *s, uchar arg_4, uchar far *arg_6)
   ;	
	assume	cs:GUI_TEXT
@i_inform$qnucuct1	proc	far
	enter	6,0
   ;	
   ;	{
   ;	    text_box far *tb;
   ;	    uchar hadcursor;
   ;	
   ;	    tb = new text_box(arg_6);
   ;	
	push	word ptr [bp+14]
	push	word ptr [bp+12]
	push	0
	push	0
	call	far ptr @text_box@$bctr$qnuc
	add	sp,8
	mov	word ptr [bp-2],dx
	mov	word ptr [bp-4],ax
   ;	
   ;	    parse_box_string(tb, s);
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @parse_box_string$qn8text_boxnuc
	add	sp,8
   ;	
   ;	    tb->add_button((uchar far *)"Ok", 0);
   ;	
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+134
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @text_box@add_button$qnucnv
	add	sp,12
   ;	
   ;	    tb->field_6C = arg_4;
   ;	
	les	bx,dword ptr [bp-4]
	mov	al,byte ptr [bp+10]
	mov	byte ptr es:[bx+108],al
   ;	
   ;	    if (mouse->field_02 != 0)
   ;	
	les	bx,dword ptr DGROUP:_mouse
	cmp	byte ptr es:[bx+2],0
	je	short @25@86
   ;	
   ;	        hadcursor = 1;
   ;	
	mov	byte ptr [bp-5],1
	jmp	short @25@114
@25@86:
   ;	
   ;	    else {
   ;	        hadcursor = 0;
   ;	
	mov	byte ptr [bp-5],0
   ;	
   ;	        mouse->show();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@show$qv
	add	sp,4
@25@114:
   ;	
   ;	    }
   ;	    tb->draw();
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	les	bx,dword ptr [bp-4]
	mov	bx,word ptr es:[bx]
	call	dword ptr [bx]
	add	sp,4
@25@142:
   ;	
   ;	    while (tb->poll() == 0)
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	les	bx,dword ptr [bp-4]
	mov	bx,word ptr es:[bx]
	call	dword ptr [bx+8]
	add	sp,4
	or	al,al
	je	short @25@142
   ;	
   ;	        ;
   ;	    release_box_strings(tb);
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @release_box_strings$qn8text_box
	add	sp,4
   ;	
   ;	    delete tb;
   ;	
	push	3
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @text_box@$bdtr$qv
	add	sp,6
   ;	
   ;	    if (hadcursor == 0)
   ;	
	cmp	byte ptr [bp-5],0
	jne	short @25@226
   ;	
   ;	        mouse->hide();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@hide$qv
	add	sp,4
@25@226:
   ;	
   ;	    return 0;
   ;	
	xor	ax,ax
   ;	
   ;	}
   ;	
	leave	
	ret	
@i_inform$qnucuct1	endp
   ;	
   ;	void i_show_box(uchar far *s, int arg_4, int arg_6,
   ;	
	assume	cs:GUI_TEXT
@i_show_box$qnuciit1t1	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	                uchar far *arg_8, uchar far *arg_C)
   ;	{
   ;	    if (show_box_on == 0) {
   ;	
	cmp	word ptr DGROUP:_show_box_on,0
	jne	short @26@142
   ;	
   ;	        show_box = new text_box(arg_C);
   ;	
	push	word ptr [bp+20]
	push	word ptr [bp+18]
	push	0
	push	0
	call	far ptr @text_box@$bctr$qnuc
	add	sp,8
	mov	word ptr DGROUP:_show_box+2,dx
	mov	word ptr DGROUP:_show_box,ax
   ;	
   ;	        parse_box_string(show_box, s);
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	word ptr DGROUP:_show_box+2
	push	word ptr DGROUP:_show_box
	call	far ptr @parse_box_string$qn8text_boxnuc
	add	sp,8
   ;	
   ;	        if (arg_8 != 0)
   ;	
	cmp	dword ptr [bp+14],large 0
	je	short @26@114
   ;	
   ;	            show_box->add_bitmap(arg_4, arg_6, arg_8);
   ;	
	push	word ptr [bp+16]
	push	word ptr [bp+14]
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	push	word ptr DGROUP:_show_box+2
	push	word ptr DGROUP:_show_box
	call	far ptr @text_box@add_bitmap$qiinuc
	add	sp,12
@26@114:
   ;	
   ;	        show_box->field_06 -= 0x14;
   ;	
	les	bx,dword ptr DGROUP:_show_box
	sub	word ptr es:[bx+6],20
   ;	
   ;	        show_box->draw();
   ;	
	push	word ptr DGROUP:_show_box+2
	push	word ptr DGROUP:_show_box
	les	bx,dword ptr DGROUP:_show_box
	mov	bx,word ptr es:[bx]
	call	dword ptr [bx]
	add	sp,4
   ;	
   ;	        show_box_on = 1;
   ;	
	mov	word ptr DGROUP:_show_box_on,1
@26@142:
   ;	
   ;	    }
   ;	}
   ;	
	pop	bp
	ret	
@i_show_box$qnuciit1t1	endp
   ;	
   ;	void i_hide_box(uchar arg_0)
   ;	
	assume	cs:GUI_TEXT
@i_hide_box$quc	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (show_box_on != 0) {
   ;	
	cmp	word ptr DGROUP:_show_box_on,0
	je	short @27@142
   ;	
   ;	        show_box_on = 0;
   ;	
	mov	word ptr DGROUP:_show_box_on,0
   ;	
   ;	        if (arg_0 != 0)
   ;	
	cmp	byte ptr [bp+6],0
	je	short @27@114
   ;	
   ;	            show_box->field_77 = 1;
   ;	
	les	bx,dword ptr DGROUP:_show_box
	mov	byte ptr es:[bx+119],1
@27@114:
   ;	
   ;	        release_box_strings(show_box);
   ;	
	push	word ptr DGROUP:_show_box+2
	push	word ptr DGROUP:_show_box
	call	far ptr @release_box_strings$qn8text_box
	add	sp,4
   ;	
   ;	        delete show_box;
   ;	
	push	3
	push	word ptr DGROUP:_show_box+2
	push	word ptr DGROUP:_show_box
	call	far ptr @text_box@$bdtr$qv
	add	sp,6
@27@142:
   ;	
   ;	    }
   ;	}
   ;	
	pop	bp
	ret	
@i_hide_box$quc	endp
   ;	
   ;	void parse_box_string(text_box far *tb, uchar far *s)
   ;	
	assume	cs:GUI_TEXT
@parse_box_string$qn8text_boxnuc	proc	far
	enter	14,0
   ;	
   ;	{
   ;	    uchar far *start, *end, *line;
   ;	    uint i;
   ;	
   ;	    start = s;
   ;	
	mov	eax,dword ptr [bp+10]
	mov	dword ptr [bp-4],eax
   ;	
   ;	    end   = s;
   ;	
	mov	eax,dword ptr [bp+10]
	mov	dword ptr [bp-8],eax
   ;	
   ;	    i = 0;
   ;	
	mov	word ptr [bp-14],0
	jmp	@28@170
@28@58:
   ;	
   ;	    while (i <= strlen((char far *)s)) {
   ;	        if (s[i] == '\n' || s[i] == 0) {
   ;	
	les	bx,dword ptr [bp+10]
	add	bx,word ptr [bp-14]
	cmp	byte ptr es:[bx],10
	je	short @28@114
	les	bx,dword ptr [bp+10]
	add	bx,word ptr [bp-14]
	cmp	byte ptr es:[bx],0
	je short	@@3
	jmp	@28@142
@@3:
@28@114:
   ;	
   ;	            end = s + i;
   ;	
	mov	ax,word ptr [bp+12]
	mov	dx,word ptr [bp+10]
	add	dx,word ptr [bp-14]
	mov	word ptr [bp-6],ax
	mov	word ptr [bp-8],dx
   ;	
   ;	            line = (uchar far *)new char[(int)(end - start) + 1];
   ;	
	mov	ax,word ptr [bp-8]
	xor	dx,dx
	sub	ax,word ptr [bp-4]
	sbb	dx,0
	push	dx
	push	ax
	pop	eax
	inc	ax
	push	ax
	call	far ptr @$bnew$qui
	pop	cx
	mov	word ptr [bp-10],dx
	mov	word ptr [bp-12],ax
   ;	
   ;	            strncpy((char far *)line, (char far *)start, (int)(end - start));
   ;	
	mov	ax,word ptr [bp-8]
	xor	dx,dx
	sub	ax,word ptr [bp-4]
	sbb	dx,0
	push	dx
	push	ax
	pop	eax
	push	ax
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	push	word ptr [bp-10]
	push	word ptr [bp-12]
	call	far ptr _strncpy
	add	sp,10
   ;	
   ;	            ((char far *)line)[(int)(end - start)] = 0;
   ;	
	mov	ax,word ptr [bp-8]
	xor	dx,dx
	sub	ax,word ptr [bp-4]
	sbb	dx,0
	push	dx
	push	ax
	pop	eax
	les	bx,dword ptr [bp-12]
	add	bx,ax
	mov	byte ptr es:[bx],0
   ;	
   ;	            tb->add_string(line);
   ;	
	push	word ptr [bp-10]
	push	word ptr [bp-12]
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @text_box@add_string$qnuc
	add	sp,8
   ;	
   ;	            start = end + 1;
   ;	
	mov	ax,word ptr [bp-6]
	mov	dx,word ptr [bp-8]
	inc	dx
	mov	word ptr [bp-2],ax
	mov	word ptr [bp-4],dx
@28@142:
   ;	
   ;	        }
   ;	        i++;
   ;	
	inc	word ptr [bp-14]
@28@170:
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	call	far ptr _strlen
	add	sp,4
	cmp	ax,word ptr [bp-14]
	jb short	@@4
	jmp	@28@58
@@4:
   ;	
   ;	    }
   ;	}
   ;	
	leave	
	ret	
@parse_box_string$qn8text_boxnuc	endp
   ;	
   ;	void release_box_strings(text_box far *tb)
   ;	
	assume	cs:GUI_TEXT
@release_box_strings$qn8text_box	proc	far
	enter	2,0
   ;	
   ;	{
   ;	    uint i;
   ;	
   ;	    for (i = 0; i < tb->field_0A; i++)
   ;	
	mov	word ptr [bp-2],0
	jmp	short @29@114
@29@58:
   ;	
   ;	        delete tb->field_1C[i];
   ;	
	mov	ax,word ptr [bp-2]
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	push	word ptr es:[bx+30]
	push	word ptr es:[bx+28]
	call	far ptr @$bdele$qnv
	add	sp,4
	inc	word ptr [bp-2]
@29@114:
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+10]
	cmp	ax,word ptr [bp-2]
	ja	short @29@58
   ;	
   ;	}
   ;	
	leave	
	ret	
@release_box_strings$qn8text_box	endp
   ;	
   ;	void draw_shadow_box(int x1, int y1, int x2, int y2)
   ;	
	assume	cs:GUI_TEXT
@draw_shadow_box$qiiii	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    display->fill_rect(x1, y1, x2, y2, display->field_02, display->field_03, 0);
   ;	
	push	0
	les	bx,dword ptr DGROUP:_display
	mov	al,byte ptr es:[bx+3]
	mov	ah,0
	push	ax
	les	bx,dword ptr DGROUP:_display
	mov	al,byte ptr es:[bx+2]
	mov	ah,0
	push	ax
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@fill_rect$qiiiiiiuc
	add	sp,18
   ;	
   ;	    display->fill_rect(x1 + 2, y2, x2 + 1, y2 + 1, 0, 0xFFFF, 0);
   ;	
	push	0
	push	-1
	push	0
	mov	ax,word ptr [bp+12]
	inc	ax
	push	ax
	mov	ax,word ptr [bp+10]
	inc	ax
	push	ax
	push	word ptr [bp+12]
	mov	ax,word ptr [bp+6]
	add	ax,2
	push	ax
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@fill_rect$qiiiiiiuc
	add	sp,18
   ;	
   ;	    display->fill_rect(x2, y1 + 2, x2 + 1, y2, 0, 0xFFFF, 0);
   ;	
	push	0
	push	-1
	push	0
	push	word ptr [bp+12]
	mov	ax,word ptr [bp+10]
	inc	ax
	push	ax
	mov	ax,word ptr [bp+8]
	add	ax,2
	push	ax
	push	word ptr [bp+10]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@fill_rect$qiiiiiiuc
	add	sp,18
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@draw_shadow_box$qiiii	endp
   ;	
   ;	void high_light(int x1, int y1, int x2, int y2, uchar far *s,
   ;	
	assume	cs:GUI_TEXT
@high_light$qiiiinuciiuc	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	                int arg_C, int arg_E, uchar inv)
   ;	{
   ;	    display->fill_rect(x1, y1, x2, y2,
   ;	
   ;	
   ;	                       inv ? display->field_02 : display->field_03,
   ;	                       0xFFFF, 0);
   ;	
	push	0
	push	-1
	cmp	byte ptr [bp+22],0
	je	short @31@86
	les	bx,dword ptr DGROUP:_display
	mov	al,byte ptr es:[bx+2]
	jmp	short @31@114
@31@86:
	les	bx,dword ptr DGROUP:_display
	mov	al,byte ptr es:[bx+3]
@31@114:
	mov	ah,0
	push	ax
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@fill_rect$qiiiiiiuc
	add	sp,18
   ;	
   ;	    display->print_at_xy(x1 + arg_C, y1 + arg_E, s, 0);
   ;	
	push	0
	push	word ptr [bp+16]
	push	word ptr [bp+14]
	mov	ax,word ptr [bp+8]
	add	ax,word ptr [bp+20]
	push	ax
	mov	ax,word ptr [bp+6]
	add	ax,word ptr [bp+18]
	push	ax
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@print_at_xy$qiinucuc
	add	sp,14
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@high_light$qiiiinuciiuc	endp
   ;	
   ;	pull_down::pull_down(uchar far *title)
   ;	
	assume	cs:GUI_TEXT
@pull_down@$bctr$qnuc	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	
	cmp	dword ptr [bp+6],large 0
	jne	short @32@86
	push	110
	call	far ptr @$bnew$qui
	pop	cx
	mov	word ptr [bp+8],dx
	mov	word ptr [bp+6],ax
	or	ax,dx
	je	short @32@114
@32@86:
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @gui_item@$bctr$qv
	add	sp,4
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx],offset @@pull_down@
   ;	
   ;	    field_64 = title;
   ;	
	les	bx,dword ptr [bp+6]
	mov	eax,dword ptr [bp+10]
	mov	dword ptr es:[bx+100],eax
   ;	
   ;	    field_68 = strlen(field_64) * 8 + 1;
   ;	
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+102]
	push	word ptr es:[bx+100]
	call	far ptr _strlen
	add	sp,4
	shl	al,3
	inc	al
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+104],al
   ;	
   ;	    field_6A = -1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+106],-1
@32@114:
   ;	
   ;	}
   ;	
	mov	dx,word ptr [bp+8]
	mov	ax,word ptr [bp+6]
	pop	bp
	ret	
@pull_down@$bctr$qnuc	endp
   ;	
   ;	void pull_down::add_item(uchar far *s, void far *cb)
   ;	
	assume	cs:GUI_TEXT
@pull_down@add_item$qnucnv	proc	far
	enter	4,0
   ;	
   ;	{
   ;	    pull_down_item far *it = (pull_down_item far *)new char[0xA];
   ;	
	push	10
	call	far ptr @$bnew$qui
	pop	cx
	mov	word ptr [bp-2],dx
	mov	word ptr [bp-4],ax
   ;	
   ;	    it->enabled = 1;
   ;	
	les	bx,dword ptr [bp-4]
	mov	byte ptr es:[bx+4],1
   ;	
   ;	    it->s       = s;
   ;	
	les	bx,dword ptr [bp-4]
	mov	eax,dword ptr [bp+10]
	mov	dword ptr es:[bx],eax
   ;	
   ;	    it->cb      = (void (far *)(void))cb;
   ;	
	les	bx,dword ptr [bp-4]
	mov	eax,dword ptr [bp+14]
	mov	dword ptr es:[bx+6],eax
   ;	
   ;	    if (strlen(s) * 8 + 0x18 > field_08)
   ;	
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	call	far ptr _strlen
	add	sp,4
	shl	ax,3
	add	ax,24
	les	bx,dword ptr [bp+6]
	cmp	ax,word ptr es:[bx+8]
	jbe	short @33@86
   ;	
   ;	        field_08 = strlen(s) * 8 + 0x18;
   ;	
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	call	far ptr _strlen
	add	sp,4
	shl	ax,3
	add	ax,24
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+8],ax
@33@86:
   ;	
   ;	    field_06 += 0xC;
   ;	
	les	bx,dword ptr [bp+6]
	add	word ptr es:[bx+6],12
   ;	
   ;	    items[field_0A++] = it;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+10]
	inc	word ptr es:[bx+10]
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	mov	ax,word ptr [bp-2]
	mov	dx,word ptr [bp-4]
	mov	word ptr es:[bx+22],ax
	mov	word ptr es:[bx+20],dx
   ;	
   ;	}
   ;	
	leave	
	ret	
@pull_down@add_item$qnucnv	endp
   ;	
   ;	void pull_down::draw()
   ;	
	assume	cs:GUI_TEXT
@pull_down@draw$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    display->print_at_xy(field_02 + 8, field_04, field_64, 0);
   ;	
	push	0
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+102]
	push	word ptr es:[bx+100]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+4]
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	add	ax,8
	push	ax
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@print_at_xy$qiinucuc
	add	sp,14
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@pull_down@draw$qv	endp
   ;	
   ;	uchar pull_down::activate()
   ;	
	assume	cs:GUI_TEXT
@pull_down@activate$qv	proc	far
	enter	10,0
   ;	
   ;	{
   ;	    int x1 = field_02;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	mov	word ptr [bp-2],ax
   ;	
   ;	    int x2 = field_02 + field_68 + 0x12;
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+104]
	mov	ah,0
	les	bx,dword ptr [bp+6]
	mov	dx,word ptr es:[bx+2]
	add	dx,ax
	add	dx,18
	mov	word ptr [bp-4],dx
   ;	
   ;	    uchar save_bg, save_fg;
   ;	    int  y, i;
   ;	
   ;	    mouse->hide();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@hide$qv
	add	sp,4
   ;	
   ;	    field_0E = (uchar far *)display->get_bits(x1, 0, x1 + field_08,
   ;	
   ;	
   ;	                                 menu_bar_height + 1 + field_06 + 2);
   ;	
	mov	al,byte ptr DGROUP:_menu_bar_height
	mov	ah,0
	inc	ax
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+6]
	add	ax,2
	push	ax
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp-2]
	add	ax,word ptr es:[bx+8]
	push	ax
	push	0
	push	word ptr [bp-2]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@get_bits$qiiii
	add	sp,12
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+16],dx
	mov	word ptr es:[bx+14],ax
   ;	
   ;	    display->pause(1);
   ;	
	push	1
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@pause$qui
	add	sp,6
   ;	
   ;	    high_light(x1, 0, x2, menu_bar_height, field_64, 8, 1, 0);
   ;	
	push	0
	push	1
	push	8
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+102]
	push	word ptr es:[bx+100]
	mov	al,byte ptr DGROUP:_menu_bar_height
	mov	ah,0
	push	ax
	push	word ptr [bp-4]
	push	0
	push	word ptr [bp-2]
	push	cs
	call	near ptr @high_light$qiiiinuciiuc
	add	sp,18
   ;	
   ;	    draw_shadow_box(x1, menu_bar_height,
   ;	
   ;	
   ;	                    x1 - 2 + field_08, menu_bar_height + field_06 + 2);
   ;	
	mov	al,byte ptr DGROUP:_menu_bar_height
	mov	ah,0
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+6]
	add	ax,2
	push	ax
	mov	ax,word ptr [bp-2]
	add	ax,-2
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+8]
	push	ax
	mov	al,byte ptr DGROUP:_menu_bar_height
	mov	ah,0
	push	ax
	push	word ptr [bp-2]
	push	cs
	call	near ptr @draw_shadow_box$qiiii
	add	sp,8
   ;	
   ;	    y = menu_bar_height + 3;
   ;	
	mov	al,byte ptr DGROUP:_menu_bar_height
	mov	ah,0
	add	ax,3
	mov	word ptr [bp-8],ax
   ;	
   ;	    for (i = 0; i < field_0A; i++) {
   ;	
	mov	word ptr [bp-10],0
	jmp	@35@254
@35@58:
   ;	
   ;	        if (items[i]->enabled == 1) {
   ;	
	mov	ax,word ptr [bp-10]
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	les	bx,dword ptr es:[bx+20]
	cmp	byte ptr es:[bx+4],1
	jne	short @35@114
   ;	
   ;	            display->print_at_xy(x1 + 8, y, items[i]->s, 0);
   ;	
	push	0
	mov	ax,word ptr [bp-10]
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	les	bx,dword ptr es:[bx+20]
	push	word ptr es:[bx+2]
	push	word ptr es:[bx]
	push	word ptr [bp-8]
	mov	ax,word ptr [bp-2]
	add	ax,8
	push	ax
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@print_at_xy$qiinucuc
	add	sp,14
   ;	
   ;	        } else {
   ;	
	jmp	@35@198
@35@114:
   ;	
   ;	            save_bg = display->field_01;
   ;	
	les	bx,dword ptr DGROUP:_display
	mov	al,byte ptr es:[bx+1]
	mov	byte ptr [bp-5],al
   ;	
   ;	            save_fg = display->field_04;
   ;	
	les	bx,dword ptr DGROUP:_display
	mov	al,byte ptr es:[bx+4]
	mov	byte ptr [bp-6],al
   ;	
   ;	            display->field_04 = display->field_03;
   ;	
	les	bx,dword ptr DGROUP:_display
	mov	al,byte ptr es:[bx+3]
	les	bx,dword ptr DGROUP:_display
	mov	byte ptr es:[bx+4],al
   ;	
   ;	            if (save_bg != 0)
   ;	
	cmp	byte ptr [bp-5],0
	je	short @35@170
   ;	
   ;	                display->field_01 = 1;
   ;	
	les	bx,dword ptr DGROUP:_display
	mov	byte ptr es:[bx+1],1
@35@170:
   ;	
   ;	            display->print_at_xy(x1 + 8, y, items[i]->s, 0);
   ;	
	push	0
	mov	ax,word ptr [bp-10]
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	les	bx,dword ptr es:[bx+20]
	push	word ptr es:[bx+2]
	push	word ptr es:[bx]
	push	word ptr [bp-8]
	mov	ax,word ptr [bp-2]
	add	ax,8
	push	ax
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@print_at_xy$qiinucuc
	add	sp,14
   ;	
   ;	            display->field_04 = save_fg;
   ;	
	les	bx,dword ptr DGROUP:_display
	mov	al,byte ptr [bp-6]
	mov	byte ptr es:[bx+4],al
   ;	
   ;	            display->field_01 = save_bg;
   ;	
	les	bx,dword ptr DGROUP:_display
	mov	al,byte ptr [bp-5]
	mov	byte ptr es:[bx+1],al
@35@198:
   ;	
   ;	        }
   ;	        y += 0xC;
   ;	
	add	word ptr [bp-8],12
	inc	word ptr [bp-10]
@35@254:
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+10]
	cmp	ax,word ptr [bp-10]
	jbe short	@@5
	jmp	@35@58
@@5:
   ;	
   ;	    }
   ;	    field_6A = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+106],0
   ;	
   ;	    update_cur_selection();
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @pull_down@update_cur_selection$qv
	add	sp,4
   ;	
   ;	    mouse->show();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@show$qv
	add	sp,4
   ;	
   ;	    return poll();
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	les	bx,dword ptr [bp+6]
	mov	bx,word ptr es:[bx]
	call	dword ptr [bx+8]
	add	sp,4
   ;	
   ;	}
   ;	
	leave	
	ret	
@pull_down@activate$qv	endp
   ;	
   ;	void pull_down::update_cur_selection()
   ;	
	assume	cs:GUI_TEXT
@pull_down@update_cur_selection$qv	proc	far
	enter	8,0
   ;	
   ;	{
   ;	    int x1, x2, y1, y2;
   ;	    if (items[field_6A]->enabled != 1)
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+106]
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	les	bx,dword ptr es:[bx+20]
	cmp	byte ptr es:[bx+4],1
	jne	short @36@86
   ;	
   ;	        return;
   ;	    x1 = field_02 + 1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	inc	ax
	mov	word ptr [bp-2],ax
   ;	
   ;	    x2 = field_02 + field_08 - 3;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+8]
	sub	ax,3
	mov	word ptr [bp-4],ax
   ;	
   ;	    y1 = menu_bar_height + field_6A * 0xC + 1;
   ;	
	mov	al,byte ptr DGROUP:_menu_bar_height
	mov	ah,0
	les	bx,dword ptr [bp+6]
	mov	dx,word ptr es:[bx+106]
	imul	dx,dx,12
	add	ax,dx
	inc	ax
	mov	word ptr [bp-6],ax
   ;	
   ;	    y2 = y1 + 0xC;
   ;	
	mov	ax,word ptr [bp-6]
	add	ax,12
	mov	word ptr [bp-8],ax
   ;	
   ;	    high_light(x1, y1, x2, y2, items[field_6A]->s, 7, 2, 0);
   ;	
	push	0
	push	2
	push	7
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+106]
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	les	bx,dword ptr es:[bx+20]
	push	word ptr es:[bx+2]
	push	word ptr es:[bx]
	push	word ptr [bp-8]
	push	word ptr [bp-4]
	push	word ptr [bp-6]
	push	word ptr [bp-2]
	push	cs
	call	near ptr @high_light$qiiiinuciiuc
	add	sp,18
@36@86:
   ;	
   ;	}
   ;	
	leave	
	ret	
@pull_down@update_cur_selection$qv	endp
   ;	
   ;	void pull_down::erase_cur_selection()
   ;	
	assume	cs:GUI_TEXT
@pull_down@erase_cur_selection$qv	proc	far
	enter	8,0
   ;	
   ;	{
   ;	    int x1, x2, y1, y2;
   ;	    if (items[field_6A]->enabled != 1)
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+106]
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	les	bx,dword ptr es:[bx+20]
	cmp	byte ptr es:[bx+4],1
	jne	short @37@86
   ;	
   ;	        return;
   ;	    x1 = field_02 + 1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	inc	ax
	mov	word ptr [bp-2],ax
   ;	
   ;	    x2 = field_02 + field_08 - 3;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+8]
	sub	ax,3
	mov	word ptr [bp-4],ax
   ;	
   ;	    y1 = menu_bar_height + field_6A * 0xC + 1;
   ;	
	mov	al,byte ptr DGROUP:_menu_bar_height
	mov	ah,0
	les	bx,dword ptr [bp+6]
	mov	dx,word ptr es:[bx+106]
	imul	dx,dx,12
	add	ax,dx
	inc	ax
	mov	word ptr [bp-6],ax
   ;	
   ;	    y2 = y1 + 0xC;
   ;	
	mov	ax,word ptr [bp-6]
	add	ax,12
	mov	word ptr [bp-8],ax
   ;	
   ;	    high_light(x1, y1, x2, y2, items[field_6A]->s, 7, 2, 1);
   ;	
	push	1
	push	2
	push	7
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+106]
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	les	bx,dword ptr es:[bx+20]
	push	word ptr es:[bx+2]
	push	word ptr es:[bx]
	push	word ptr [bp-8]
	push	word ptr [bp-4]
	push	word ptr [bp-6]
	push	word ptr [bp-2]
	push	cs
	call	near ptr @high_light$qiiiinuciiuc
	add	sp,18
@37@86:
   ;	
   ;	}
   ;	
	leave	
	ret	
@pull_down@erase_cur_selection$qv	endp
   ;	
   ;	uchar pull_down::get_mouse_sel_location()
   ;	
	assume	cs:GUI_TEXT
@pull_down@get_mouse_sel_location$qv	proc	far
	enter	6,0
   ;	
   ;	{
   ;	    int sel_top = menu_bar_height + field_6A * 0xC + 1;
   ;	
	mov	al,byte ptr DGROUP:_menu_bar_height
	mov	ah,0
	les	bx,dword ptr [bp+6]
	mov	dx,word ptr es:[bx+106]
	imul	dx,dx,12
	add	ax,dx
	inc	ax
	mov	word ptr [bp-2],ax
   ;	
   ;	    int sel_bot = sel_top + 0xC;
   ;	
	mov	ax,word ptr [bp-2]
	add	ax,12
	mov	word ptr [bp-4],ax
   ;	
   ;	    int midx    = (mouse->field_0E - menu_bar_height) / 0xC;
   ;	
	mov	al,byte ptr DGROUP:_menu_bar_height
	mov	ah,0
	les	bx,dword ptr DGROUP:_mouse
	push	ax
	mov	ax,word ptr es:[bx+14]
	pop	dx
	sub	ax,dx
	mov	bx,12
	cwd	
	idiv	bx
	mov	word ptr [bp-6],ax
   ;	
   ;	
   ;	    if (items[midx]->enabled != 0) {
   ;	
	mov	ax,word ptr [bp-6]
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	les	bx,dword ptr es:[bx+20]
	cmp	byte ptr es:[bx+4],0
	je	short @38@170
   ;	
   ;	        if (mouse->field_0E < sel_top)
   ;	
	les	bx,dword ptr DGROUP:_mouse
	mov	ax,word ptr es:[bx+14]
	cmp	ax,word ptr [bp-2]
	jge	short @38@114
   ;	
   ;	            return 0;
   ;	
	mov	al,0
	jmp	short @38@198
@38@114:
   ;	
   ;	        if (mouse->field_0E > sel_bot)
   ;	
	les	bx,dword ptr DGROUP:_mouse
	mov	ax,word ptr es:[bx+14]
	cmp	ax,word ptr [bp-4]
	jle	short @38@170
   ;	
   ;	            return 1;
   ;	
	mov	al,1
	jmp	short @38@198
@38@170:
   ;	
   ;	    }
   ;	    return 2;
   ;	
	mov	al,2
@38@198:
   ;	
   ;	}
   ;	
	leave	
	ret	
@pull_down@get_mouse_sel_location$qv	endp
   ;	
   ;	void pull_down::increase_cur_selection()
   ;	
	assume	cs:GUI_TEXT
@pull_down@increase_cur_selection$qv	proc	far
	push	bp
	mov	bp,sp
	push	si
   ;	
   ;	{
   ;	    mouse->hide();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@hide$qv
	add	sp,4
   ;	
   ;	    erase_cur_selection();
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @pull_down@erase_cur_selection$qv
	add	sp,4
   ;	
   ;	    if (field_6A == field_0A - 1)
   ;	
	les	bx,dword ptr [bp+6]
	push	es
	les	si,dword ptr [bp+6]
	mov	ax,word ptr es:[si+10]
	dec	ax
	pop	es
	cmp	word ptr es:[bx+106],ax
	jne	short @39@86
   ;	
   ;	        field_6A = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+106],0
	jmp	short @39@114
@39@86:
   ;	
   ;	    else
   ;	        field_6A++;
   ;	
	les	bx,dword ptr [bp+6]
	inc	word ptr es:[bx+106]
@39@114:
   ;	
   ;	    update_cur_selection();
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @pull_down@update_cur_selection$qv
	add	sp,4
   ;	
   ;	    mouse->show();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@show$qv
	add	sp,4
   ;	
   ;	    if (items[field_6A]->enabled == 0)
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+106]
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	les	bx,dword ptr es:[bx+20]
	cmp	byte ptr es:[bx+4],0
	jne	short @39@170
   ;	
   ;	        increase_cur_selection();
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @pull_down@increase_cur_selection$qv
	add	sp,4
@39@170:
   ;	
   ;	}
   ;	
	pop	si
	pop	bp
	ret	
@pull_down@increase_cur_selection$qv	endp
   ;	
   ;	void pull_down::decrease_cur_selection()
   ;	
	assume	cs:GUI_TEXT
@pull_down@decrease_cur_selection$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    mouse->hide();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@hide$qv
	add	sp,4
   ;	
   ;	    erase_cur_selection();
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @pull_down@erase_cur_selection$qv
	add	sp,4
   ;	
   ;	    if (field_6A == 0)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+106],0
	jne	short @40@86
   ;	
   ;	        field_6A = field_0A - 1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+10]
	dec	ax
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+106],ax
	jmp	short @40@114
@40@86:
   ;	
   ;	    else
   ;	        field_6A--;
   ;	
	les	bx,dword ptr [bp+6]
	dec	word ptr es:[bx+106]
@40@114:
   ;	
   ;	    update_cur_selection();
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @pull_down@update_cur_selection$qv
	add	sp,4
   ;	
   ;	    mouse->show();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@show$qv
	add	sp,4
   ;	
   ;	    if (items[field_6A]->enabled == 0)
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+106]
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	les	bx,dword ptr es:[bx+20]
	cmp	byte ptr es:[bx+4],0
	jne	short @40@170
   ;	
   ;	        decrease_cur_selection();
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @pull_down@decrease_cur_selection$qv
	add	sp,4
@40@170:
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@pull_down@decrease_cur_selection$qv	endp
   ;	
   ;	uchar pull_down::poll()
   ;	
	assume	cs:GUI_TEXT
@pull_down@poll$qv	proc	far
	enter	12,0
   ;	
   ;	{
   ;	    int   done     = 0;
   ;	
	mov	word ptr [bp-2],0
   ;	
   ;	    int   dragging = 0;
   ;	
	mov	word ptr [bp-4],0
   ;	
   ;	    uchar result   = 0;
   ;	
	mov	byte ptr [bp-5],0
	jmp	@41@1066
@41@58:
   ;	
   ;	    int   selloc, midx;
   ;	    uchar over_title, over_drop;
   ;	
   ;	    while (done == 0) {
   ;	        if (byte_2D3AC != 0) {
   ;	
	cmp	byte ptr DGROUP:_byte_2D3AC,0
	je	short @41@114
   ;	
   ;	            field_6A = -1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+106],-1
   ;	
   ;	            done++;
   ;	
	inc	word ptr [bp-2]
@41@114:
   ;	
   ;	        }
   ;	        over_title = mouse->in_box(field_02, 0,
   ;	
   ;	
   ;	                                   field_02 + field_68 + 0x12, menu_bar_height);
   ;	
	mov	al,byte ptr DGROUP:_menu_bar_height
	mov	ah,0
	push	ax
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+104]
	mov	ah,0
	les	bx,dword ptr [bp+6]
	mov	dx,word ptr es:[bx+2]
	add	dx,ax
	add	dx,18
	push	dx
	push	0
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+2]
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@in_box$qiiii
	add	sp,12
	mov	byte ptr [bp-11],al
   ;	
   ;	        over_drop  = mouse->in_box(field_02 + 1, menu_bar_height + 1,
   ;	
   ;	
   ;	                                   field_02 + field_08 - 1,
   ;	                                   menu_bar_height + field_06 + 1);
   ;	
	mov	al,byte ptr DGROUP:_menu_bar_height
	mov	ah,0
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+6]
	inc	ax
	push	ax
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+8]
	dec	ax
	push	ax
	mov	al,byte ptr DGROUP:_menu_bar_height
	mov	ah,0
	inc	ax
	push	ax
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	inc	ax
	push	ax
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@in_box$qiiii
	add	sp,12
	mov	byte ptr [bp-12],al
   ;	
   ;	        if (mouse->field_00 == 0) {
   ;	
	les	bx,dword ptr DGROUP:_mouse
	cmp	byte ptr es:[bx],0
	je short	@@6
	jmp	@41@646
@@6:
   ;	
   ;	            if (dragging != 0 && over_drop != 0)
   ;	
	cmp	word ptr [bp-4],0
	je	short @41@226
	cmp	byte ptr [bp-12],0
	je	short @41@226
   ;	
   ;	                done++;
   ;	
	inc	word ptr [bp-2]
	jmp	short @41@254
@41@226:
   ;	
   ;	            else
   ;	                dragging = 0;
   ;	
	mov	word ptr [bp-4],0
@41@254:
   ;	
   ;	            if (i_external_left != 0) {
   ;	
	cmp	dword ptr DGROUP:_i_external_left,large 0
	jne short	@@7
	jmp	@41@1066
@@7:
   ;	
   ;	                if (i_external_left()) {
   ;	
	call	dword ptr DGROUP:_i_external_left
	or	al,al
	je	short @41@366
   ;	
   ;	                    result = 1; field_6A = -1; done++;
   ;	
	mov	byte ptr [bp-5],1
@41@338:
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+106],-1
	inc	word ptr [bp-2]
   ;	
   ;	                } else if (i_external_right()) {
   ;	
	jmp	short @41@562
@41@366:
	call	dword ptr DGROUP:_i_external_right
	or	al,al
	je	short @41@422
   ;	
   ;	                    result = 2; field_6A = -1; done++;
   ;	
	mov	byte ptr [bp-5],2
	jmp	short @41@338
@41@422:
   ;	
   ;	                } else if (i_external_up()) {
   ;	
	call	dword ptr DGROUP:_i_external_up
	or	al,al
	je	short @41@478
   ;	
   ;	                    decrease_cur_selection();
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @pull_down@decrease_cur_selection$qv
	jmp	short @41@534
@41@478:
   ;	
   ;	                    display->pause(0xF);
   ;	                } else if (i_external_down()) {
   ;	
	call	dword ptr DGROUP:_i_external_down
	or	al,al
	je	short @41@562
   ;	
   ;	                    increase_cur_selection();
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @pull_down@increase_cur_selection$qv
@41@534:
	add	sp,4
   ;	
   ;	                    display->pause(0xF);
   ;	
	push	15
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@pause$qui
	add	sp,6
@41@562:
   ;	
   ;	                }
   ;	                if (i_external_button())
   ;	
	call	dword ptr DGROUP:_i_external_button
	or	al,al
	jne short	@@8
	jmp	@41@1066
@@8:
	jmp	short @41@758
   ;	
   ;	                    done++;
   ;	            }
   ;	        } else {
   ;	
	jmp	@41@1066
@41@646:
   ;	
   ;	            if (over_title != 0)
   ;	
	cmp	byte ptr [bp-11],0
	je short	@@9
	jmp	@41@1066
@@9:
   ;	
   ;	                continue;
   ;	            if (over_drop == 0 && mouse->field_0E < menu_bar_height) {
   ;	
	cmp	byte ptr [bp-12],0
	jne	short @41@786
	mov	al,byte ptr DGROUP:_menu_bar_height
	mov	ah,0
	les	bx,dword ptr DGROUP:_mouse
	cmp	ax,word ptr es:[bx+14]
	jle	short @41@786
   ;	
   ;	                field_6A = -1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+106],-1
   ;	
   ;	                done++;
   ;	
@41@758:
	inc	word ptr [bp-2]
   ;	
   ;	                continue;
   ;	
	jmp	@41@1066
@41@786:
   ;	
   ;	            }
   ;	            if (dragging == 0) {
   ;	
	cmp	word ptr [bp-4],0
	je short	@@10
	jmp	@41@926
@@10:
   ;	
   ;	                if (over_drop != 0) {
   ;	
	cmp	byte ptr [bp-12],0
	jne short	@@11
	jmp	@41@1066
@@11:
   ;	
   ;	                    midx = (mouse->field_0E - menu_bar_height) / 0xC;
   ;	
	mov	al,byte ptr DGROUP:_menu_bar_height
	mov	ah,0
	les	bx,dword ptr DGROUP:_mouse
	push	ax
	mov	ax,word ptr es:[bx+14]
	pop	dx
	sub	ax,dx
	mov	bx,12
	cwd	
	idiv	bx
	mov	word ptr [bp-10],ax
   ;	
   ;	                    if (items[midx]->enabled == 1) {
   ;	
	mov	ax,word ptr [bp-10]
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	les	bx,dword ptr es:[bx+20]
	cmp	byte ptr es:[bx+4],1
	je short	@@12
	jmp	@41@1066
@@12:
   ;	
   ;	                        mouse->hide();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@hide$qv
	add	sp,4
   ;	
   ;	                        erase_cur_selection();
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @pull_down@erase_cur_selection$qv
	add	sp,4
   ;	
   ;	                        field_6A = midx;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp-10]
	mov	word ptr es:[bx+106],ax
   ;	
   ;	                        update_cur_selection();
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @pull_down@update_cur_selection$qv
	add	sp,4
   ;	
   ;	                        mouse->show();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@show$qv
	add	sp,4
   ;	
   ;	                        dragging = 1;
   ;	
	mov	word ptr [bp-4],1
	jmp	short @41@1066
   ;	
   ;	                    }
   ;	                }
   ;	            } else if (over_drop != 0) {
   ;	
	jmp	short @41@1066
@41@926:
	cmp	byte ptr [bp-12],0
	je	short @41@1066
   ;	
   ;	                selloc = get_mouse_sel_location();
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @pull_down@get_mouse_sel_location$qv
	add	sp,4
	mov	ah,0
	mov	word ptr [bp-8],ax
   ;	
   ;	                if (selloc == 0) decrease_cur_selection();
   ;	
	cmp	word ptr [bp-8],0
	jne	short @41@1010
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @pull_down@decrease_cur_selection$qv
	add	sp,4
@41@1010:
   ;	
   ;	                if (selloc == 1) increase_cur_selection();
   ;	
	cmp	word ptr [bp-8],1
	jne	short @41@1066
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @pull_down@increase_cur_selection$qv
	add	sp,4
@41@1066:
	cmp	word ptr [bp-2],0
	jne short	@@13
	jmp	@41@58
@@13:
   ;	
   ;	            }
   ;	        }
   ;	    }
   ;	    mouse->hide();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@hide$qv
	add	sp,4
   ;	
   ;	    display->put_bits(field_02, 0, field_02 + field_08,
   ;	
   ;	
   ;	                    menu_bar_height + 1 + field_06 + 2, field_0E, 0, 0);
   ;	
	push	0
	push	0
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+16]
	push	word ptr es:[bx+14]
	mov	al,byte ptr DGROUP:_menu_bar_height
	mov	ah,0
	inc	ax
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+6]
	add	ax,2
	push	ax
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+8]
	push	ax
	push	0
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+2]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@put_bits$qiiiinucuiui
	add	sp,20
   ;	
   ;	    delete field_0E;
   ;	
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+16]
	push	word ptr es:[bx+14]
	call	far ptr @$bdele$qnv
	add	sp,4
   ;	
   ;	    mouse->show();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@show$qv
	add	sp,4
   ;	
   ;	    if (field_6A != -1 && items[field_6A]->enabled != 0 &&
   ;	
   ;	
   ;	        items[field_6A]->cb != 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+106],-1
	je	short @41@1234
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+106]
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	les	bx,dword ptr es:[bx+20]
	cmp	byte ptr es:[bx+4],0
	je	short @41@1234
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+106]
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	les	bx,dword ptr es:[bx+20]
	mov	ax,word ptr es:[bx+6]
	or	ax,word ptr es:[bx+8]
	je	short @41@1234
   ;	
   ;	        items[field_6A]->cb();
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+106]
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	les	bx,dword ptr es:[bx+20]
	call	dword ptr es:[bx+6]
   ;	
   ;	        if (pd_redraws == 1)
   ;	
	cmp	byte ptr DGROUP:_pd_redraws,1
	jne	short @41@1234
   ;	
   ;	            result |= 0x80;
   ;	
	or	byte ptr [bp-5],128
@41@1234:
   ;	
   ;	    }
   ;	    field_6A = -1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+106],-1
   ;	
   ;	    return result;
   ;	
	mov	al,byte ptr [bp-5]
   ;	
   ;	}
   ;	
	leave	
	ret	
@pull_down@poll$qv	endp
   ;	
   ;	menu_bar::menu_bar()
   ;	
	assume	cs:GUI_TEXT
@menu_bar@$bctr$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	
	cmp	dword ptr [bp+6],large 0
	jne	short @42@86
	push	106
	call	far ptr @$bnew$qui
	pop	cx
	mov	word ptr [bp+8],dx
	mov	word ptr [bp+6],ax
	or	ax,dx
	je	short @42@114
@42@86:
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @gui_item@$bctr$qv
	add	sp,4
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx],offset @@menu_bar@
   ;	
   ;	    field_02 = 1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+2],1
   ;	
   ;	    field_04 = 1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+4],1
   ;	
   ;	    field_68 = field_13 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,0
	mov	byte ptr es:[bx+19],al
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+104],al
@42@114:
   ;	
   ;	}
   ;	
	mov	dx,word ptr [bp+8]
	mov	ax,word ptr [bp+6]
	pop	bp
	ret	
@menu_bar@$bctr$qv	endp
   ;	
   ;	void menu_bar::add_item(pull_down far *pd)
   ;	
	assume	cs:GUI_TEXT
@menu_bar@add_item$qn9pull_down	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    items[field_0A] = pd;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+10]
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	mov	ax,word ptr [bp+12]
	mov	dx,word ptr [bp+10]
	mov	word ptr es:[bx+26],ax
	mov	word ptr es:[bx+24],dx
   ;	
   ;	    if (field_0A > 0)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+10],0
	jbe	short @43@86
   ;	
   ;	        items[field_0A]->field_02 =
   ;	
   ;	
   ;	            items[field_0A - 1]->field_02 +
   ;	            strlen(items[field_0A - 1]->field_64) * 8 + 0xC;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+10]
	dec	ax
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	les	bx,dword ptr es:[bx+24]
	mov	ax,word ptr es:[bx+2]
	push	ax
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+10]
	dec	ax
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	les	bx,dword ptr es:[bx+24]
	push	word ptr es:[bx+102]
	push	word ptr es:[bx+100]
	call	far ptr _strlen
	add	sp,4
	shl	ax,3
	pop	dx
	add	dx,ax
	add	dx,12
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+10]
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	les	bx,dword ptr es:[bx+24]
	mov	word ptr es:[bx+2],dx
	jmp	short @43@114
@43@86:
   ;	
   ;	    else
   ;	        items[field_0A]->field_02 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+10]
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	les	bx,dword ptr es:[bx+24]
	mov	word ptr es:[bx+2],0
@43@114:
   ;	
   ;	    items[field_0A]->field_04 = 1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+10]
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	les	bx,dword ptr es:[bx+24]
	mov	word ptr es:[bx+4],1
   ;	
   ;	    field_0A++;
   ;	
	les	bx,dword ptr [bp+6]
	inc	word ptr es:[bx+10]
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@menu_bar@add_item$qn9pull_down	endp
   ;	
   ;	void menu_bar::draw()
   ;	
	assume	cs:GUI_TEXT
@menu_bar@draw$qv	proc	far
	enter	2,0
   ;	
   ;	{
   ;	    uint i;
   ;	    if (field_68 != 0)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+104],0
	je short	@@14
	jmp	@44@170
@@14:
   ;	
   ;	        return;
   ;	    field_68 = 1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+104],1
   ;	
   ;	    field_0E = (uchar far *)display->get_bits(0, 0, 0x140, menu_bar_height + 1);
   ;	
	mov	al,byte ptr DGROUP:_menu_bar_height
	mov	ah,0
	inc	ax
	push	ax
	push	320
	push	0
	push	0
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@get_bits$qiiii
	add	sp,12
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+16],dx
	mov	word ptr es:[bx+14],ax
   ;	
   ;	    display->fill_rect(0, 0, 0x140, menu_bar_height + 1,
   ;	
   ;	
   ;	                       display->field_02, 0xFFFF, 0);
   ;	
	push	0
	push	-1
	les	bx,dword ptr DGROUP:_display
	mov	al,byte ptr es:[bx+2]
	mov	ah,0
	push	ax
	mov	al,byte ptr DGROUP:_menu_bar_height
	mov	ah,0
	inc	ax
	push	ax
	push	320
	push	0
	push	0
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@fill_rect$qiiiiiiuc
	add	sp,18
   ;	
   ;	    display->fill_rect(0, menu_bar_height, 0x140, menu_bar_height + 1,
   ;	
   ;	
   ;	                       display->field_03, 0xFFFF, 0);
   ;	
	push	0
	push	-1
	les	bx,dword ptr DGROUP:_display
	mov	al,byte ptr es:[bx+3]
	mov	ah,0
	push	ax
	mov	al,byte ptr DGROUP:_menu_bar_height
	mov	ah,0
	inc	ax
	push	ax
	push	320
	mov	al,byte ptr DGROUP:_menu_bar_height
	mov	ah,0
	push	ax
	push	0
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@fill_rect$qiiiiiiuc
	add	sp,18
   ;	
   ;	    for (i = 0; i < field_0A; i++)
   ;	
	mov	word ptr [bp-2],0
	jmp	short @44@142
@44@86:
   ;	
   ;	        items[i]->draw();
   ;	
	mov	ax,word ptr [bp-2]
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	push	word ptr es:[bx+26]
	push	word ptr es:[bx+24]
	mov	ax,word ptr [bp-2]
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	les	bx,dword ptr es:[bx+24]
	mov	bx,word ptr es:[bx]
	call	dword ptr [bx]
	add	sp,4
	inc	word ptr [bp-2]
@44@142:
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+10]
	cmp	ax,word ptr [bp-2]
	ja	short @44@86
@44@170:
   ;	
   ;	}
   ;	
	leave	
	ret	
@menu_bar@draw$qv	endp
   ;	
   ;	void menu_bar::erase()
   ;	
	assume	cs:GUI_TEXT
@menu_bar@erase$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (field_68 == 0)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+104],0
	je	short @45@86
   ;	
   ;	        return;
   ;	    display->put_bits(0, 0, 0x140, menu_bar_height + 1, field_0E, 0, 0);
   ;	
	push	0
	push	0
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+16]
	push	word ptr es:[bx+14]
	mov	al,byte ptr DGROUP:_menu_bar_height
	mov	ah,0
	inc	ax
	push	ax
	push	320
	push	0
	push	0
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@put_bits$qiiiinucuiui
	add	sp,20
   ;	
   ;	    delete field_0E;
   ;	
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+16]
	push	word ptr es:[bx+14]
	call	far ptr @$bdele$qnv
	add	sp,4
   ;	
   ;	    field_68 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+104],0
@45@86:
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@menu_bar@erase$qv	endp
   ;	
   ;	uchar menu_bar::poll()
   ;	
	assume	cs:GUI_TEXT
@menu_bar@poll$qv	proc	far
	enter	10,0
   ;	
   ;	{
   ;	    uint i;
   ;	    pull_down far *pd;
   ;	    int x1, x2;
   ;	
   ;	    if (i_external_button != 0)
   ;	
	cmp	dword ptr DGROUP:_i_external_button,large 0
	je	short @46@86
@46@58:
   ;	
   ;	        while (i_external_button() != 0)
   ;	
	call	dword ptr DGROUP:_i_external_button
	or	al,al
	jne	short @46@58
@46@86:
   ;	
   ;	            ;
   ;	    if (mouse->field_2E == 0) {
   ;	
	les	bx,dword ptr DGROUP:_mouse
	cmp	byte ptr es:[bx+46],0
	jne	short @46@142
   ;	
   ;	        field_14 = items[0]->activate();
   ;	
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+26]
	push	word ptr es:[bx+24]
	push	cs
	call	near ptr @pull_down@activate$qv
	add	sp,4
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+20],al
   ;	
   ;	    } else if (field_16 != -1) {
   ;	
	jmp	@46@730
@46@142:
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+22],-1
	je	short @46@254
   ;	
   ;	        field_13 = field_16;
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+22]
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+19],al
   ;	
   ;	        field_14 = items[field_16]->activate();
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+22]
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	push	word ptr es:[bx+26]
	push	word ptr es:[bx+24]
	push	cs
	call	near ptr @pull_down@activate$qv
	add	sp,4
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+20],al
   ;	
   ;	        if (!(field_14 & 0x80))
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+20]
	mov	ah,0
	test	ax,128
	je short	@@15
	jmp	@46@730
@@15:
   ;	
   ;	            field_16 = -1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+22],-1
	jmp	@46@730
   ;	
   ;	    } else {
   ;	
	jmp	@46@730
@46@254:
   ;	
   ;	        field_14 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+20],0
   ;	
   ;	        for (i = 0; i < field_0A; i++) {
   ;	
	mov	word ptr [bp-2],0
	jmp	@46@366
@46@282:
   ;	
   ;	            pd = items[i];
   ;	
	mov	ax,word ptr [bp-2]
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	mov	ax,word ptr es:[bx+26]
	mov	dx,word ptr es:[bx+24]
	mov	word ptr [bp-4],ax
	mov	word ptr [bp-6],dx
   ;	
   ;	            x1 = pd->field_02;
   ;	
	les	bx,dword ptr [bp-6]
	mov	ax,word ptr es:[bx+2]
	mov	word ptr [bp-8],ax
   ;	
   ;	            x2 = pd->field_02 + strlen(pd->field_64) * 8 + 0xA;
   ;	
	les	bx,dword ptr [bp-6]
	push	word ptr es:[bx+102]
	push	word ptr es:[bx+100]
	call	far ptr _strlen
	add	sp,4
	shl	ax,3
	les	bx,dword ptr [bp-6]
	mov	dx,word ptr es:[bx+2]
	add	dx,ax
	add	dx,10
	mov	word ptr [bp-10],dx
   ;	
   ;	            if (mouse->pressed_in_box(x1, 0, x2, menu_bar_height)) {
   ;	
	mov	al,byte ptr DGROUP:_menu_bar_height
	mov	ah,0
	push	ax
	push	word ptr [bp-10]
	push	0
	push	word ptr [bp-8]
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@pressed_in_box$qiiii
	add	sp,12
	or	al,al
	je	short @46@338
   ;	
   ;	                field_14 = pd->activate();
   ;	
	push	word ptr [bp-4]
	push	word ptr [bp-6]
	push	cs
	call	near ptr @pull_down@activate$qv
	add	sp,4
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+20],al
   ;	
   ;	                field_13 = i;
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr [bp-2]
	mov	byte ptr es:[bx+19],al
   ;	
   ;	                break;
   ;	
	jmp	short @46@394
@46@338:
	inc	word ptr [bp-2]
@46@366:
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+10]
	cmp	ax,word ptr [bp-2]
	jbe short	@@16
	jmp	@46@282
@@16:
@46@394:
   ;	
   ;	            }
   ;	        }
   ;	        if (field_14 & 0x80)
   ;	
	les	bx,dword ptr [bp+6]
	test	byte ptr es:[bx+20],128
	jne short	@@17
	jmp	@46@730
@@17:
   ;	
   ;	            field_16 = i;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp-2]
	jmp	@46@702
	jmp	@46@730
@46@478:
   ;	
   ;	    }
   ;	    while (field_14 & 3) {
   ;	        if (field_14 == 1) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+20],1
	jne	short @46@590
   ;	
   ;	            if (--field_13 == 0xFF)
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+19]
	add	al,255
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+19],al
	cmp	al,255
	jne	short @46@646
   ;	
   ;	                field_13 = field_0A - 1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+10]
	dec	al
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+19],al
	jmp	short @46@646
   ;	
   ;	        } else {
   ;	
	jmp	short @46@646
@46@590:
   ;	
   ;	            if (++field_13 == field_0A)
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+19]
	inc	al
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+19],al
	mov	ah,0
	les	bx,dword ptr [bp+6]
	cmp	ax,word ptr es:[bx+10]
	jne	short @46@646
   ;	
   ;	                field_13 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+19],0
@46@646:
   ;	
   ;	        }
   ;	        display->pause(0xF);
   ;	
	push	15
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@pause$qui
	add	sp,6
   ;	
   ;	        field_14 = items[field_13]->activate();
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+19]
	mov	ah,0
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	push	word ptr es:[bx+26]
	push	word ptr es:[bx+24]
	push	cs
	call	near ptr @pull_down@activate$qv
	add	sp,4
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+20],al
   ;	
   ;	        if (field_14 & 0x80)
   ;	
	les	bx,dword ptr [bp+6]
	test	byte ptr es:[bx+20],128
	je	short @46@730
   ;	
   ;	            field_16 = field_13;
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+19]
	mov	ah,0
	les	bx,dword ptr [bp+6]
@46@702:
	mov	word ptr es:[bx+22],ax
@46@730:
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+20]
	mov	ah,0
	test	ax,3
	je short	@@18
	jmp	@46@478
@@18:
   ;	
   ;	    }
   ;	    return 0;
   ;	
	mov	al,0
   ;	
   ;	}
   ;	
	leave	
	ret	
@menu_bar@poll$qv	endp
   ;	
   ;	void menu_bar::toggle_item(uchar far *s1, uchar far *s2, uchar val)
   ;	
	assume	cs:GUI_TEXT
@menu_bar@toggle_item$qnuct1uc	proc	far
	enter	4,0
   ;	
   ;	{
   ;	    uchar found = 0;
   ;	
	mov	byte ptr [bp-1],0
   ;	
   ;	    uchar i = 0, j;
   ;	
	mov	byte ptr [bp-2],0
	jmp	@47@282
@47@58:
   ;	
   ;	
   ;	    while (i < field_0A) {
   ;	        if (strcmp(s1, items[i]->field_64) == 0) {
   ;	
	mov	al,byte ptr [bp-2]
	mov	ah,0
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	les	bx,dword ptr es:[bx+24]
	push	word ptr es:[bx+102]
	push	word ptr es:[bx+100]
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	call	far ptr _strcmp
	add	sp,8
	or	ax,ax
	je short	@@19
	jmp	@47@226
@@19:
   ;	
   ;	            j = 0;
   ;	
	mov	byte ptr [bp-3],0
	jmp	short @47@198
@47@114:
   ;	
   ;	            while (j < items[i]->field_0A) {
   ;	                if (strcmp(items[i]->items[j]->s, s2) == 0) {
   ;	
	push	word ptr [bp+16]
	push	word ptr [bp+14]
	mov	al,byte ptr [bp-2]
	mov	ah,0
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	les	bx,dword ptr es:[bx+24]
	mov	al,byte ptr [bp-3]
	mov	ah,0
	shl	ax,2
	add	bx,ax
	les	bx,dword ptr es:[bx+20]
	push	word ptr es:[bx+2]
	push	word ptr es:[bx]
	call	far ptr _strcmp
	add	sp,8
	or	ax,ax
	jne	short @47@170
   ;	
   ;	                    items[i]->items[j]->enabled = val;
   ;	
	mov	al,byte ptr [bp-2]
	mov	ah,0
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	les	bx,dword ptr es:[bx+24]
	mov	al,byte ptr [bp-3]
	mov	ah,0
	shl	ax,2
	add	bx,ax
	les	bx,dword ptr es:[bx+20]
	mov	al,byte ptr [bp+18]
	mov	byte ptr es:[bx+4],al
   ;	
   ;	                    found = 1;
   ;	
	mov	byte ptr [bp-1],1
   ;	
   ;	                    break;
   ;	
	jmp	short @47@226
@47@170:
   ;	
   ;	                }
   ;	                j++;
   ;	
	inc	byte ptr [bp-3]
@47@198:
	mov	al,byte ptr [bp-3]
	mov	ah,0
	mov	dl,byte ptr [bp-2]
	mov	dh,0
	shl	dx,2
	les	bx,dword ptr [bp+6]
	add	bx,dx
	les	bx,dword ptr es:[bx+24]
	cmp	ax,word ptr es:[bx+10]
	jae short	@@20
	jmp	@47@114
@@20:
@47@226:
   ;	
   ;	            }
   ;	        }
   ;	        if (found != 0)
   ;	
	cmp	byte ptr [bp-1],0
	jne	short @47@310
   ;	
   ;	            return;
   ;	        i++;
   ;	
	inc	byte ptr [bp-2]
@47@282:
	mov	al,byte ptr [bp-2]
	mov	ah,0
	les	bx,dword ptr [bp+6]
	cmp	ax,word ptr es:[bx+10]
	jae short	@@21
	jmp	@47@58
@@21:
@47@310:
   ;	
   ;	    }
   ;	}
   ;	
	leave	
	ret	
@menu_bar@toggle_item$qnuct1uc	endp
   ;	
   ;	button::button(uchar far *label, void far *cb, uchar centered) : gui_item()
   ;	
	assume	cs:GUI_TEXT
@button@$bctr$qnucnvuc	proc	far
	push	bp
	mov	bp,sp
	cmp	dword ptr [bp+6],large 0
	jne	short @48@86
	push	38
	call	far ptr @$bnew$qui
	pop	cx
	mov	word ptr [bp+8],dx
	mov	word ptr [bp+6],ax
	or	ax,dx
	je	short @48@114
@48@86:
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @gui_item@$bctr$qv
	add	sp,4
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx],offset @@button@
   ;	
   ;	{
   ;	    field_14 = label;
   ;	
	les	bx,dword ptr [bp+6]
	mov	eax,dword ptr [bp+10]
	mov	dword ptr es:[bx+20],eax
   ;	
   ;	    field_22 = cb;
   ;	
	les	bx,dword ptr [bp+6]
	mov	eax,dword ptr [bp+14]
	mov	dword ptr es:[bx+34],eax
   ;	
   ;	    field_08 = 0x40;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+8],64
   ;	
   ;	    field_06 = 0x0B;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+6],11
   ;	
   ;	    field_13 = centered;
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr [bp+18]
	mov	byte ptr es:[bx+19],al
   ;	
   ;	    field_20 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+32],0
@48@114:
   ;	
   ;	}
   ;	
	mov	dx,word ptr [bp+8]
	mov	ax,word ptr [bp+6]
	pop	bp
	ret	
@button@$bctr$qnucnvuc	endp
   ;	
   ;	void button::draw()
   ;	
	assume	cs:GUI_TEXT
@button@draw$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    draw_shadow_box(field_18, field_1A, field_18 + field_08,
   ;	
   ;	
   ;	                    field_1A + field_06 + (display->field_01 != 0));
   ;	
	les	bx,dword ptr DGROUP:_display
	cmp	byte ptr es:[bx+1],0
	je	short @49@86
	mov	ax,1
	jmp	short @49@114
@49@86:
	xor	ax,ax
@49@114:
	les	bx,dword ptr [bp+6]
	mov	dx,word ptr es:[bx+26]
	les	bx,dword ptr [bp+6]
	add	dx,word ptr es:[bx+6]
	add	dx,ax
	push	dx
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+24]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+8]
	push	ax
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+26]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+24]
	push	cs
	call	near ptr @draw_shadow_box$qiiii
	add	sp,8
   ;	
   ;	    field_1C = field_18 + (field_08 >> 1) - ((strlen(field_14) << 3) >> 1);
   ;	
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+22]
	push	word ptr es:[bx+20]
	call	far ptr _strlen
	add	sp,4
	shl	ax,3
	shr	ax,1
	les	bx,dword ptr [bp+6]
	mov	dx,word ptr es:[bx+24]
	les	bx,dword ptr [bp+6]
	mov	bx,word ptr es:[bx+8]
	shr	bx,1
	add	dx,bx
	sub	dx,ax
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+28],dx
   ;	
   ;	    field_1E = field_1A + 2;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+26]
	add	ax,2
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+30],ax
   ;	
   ;	    display->print_at_xy(field_1C, field_1E, field_14, 0);
   ;	
	push	0
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+22]
	push	word ptr es:[bx+20]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+30]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+28]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@print_at_xy$qiinucuc
	add	sp,14
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@button@draw$qv	endp
   ;	
   ;	uchar button::poll()
   ;	
	assume	cs:GUI_TEXT
@button@poll$qv	proc	far
	enter	2,0
   ;	
   ;	{
   ;	    int txoff = field_1C - field_18;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+28]
	les	bx,dword ptr [bp+6]
	sub	ax,word ptr es:[bx+24]
	mov	word ptr [bp-2],ax
   ;	
   ;	    if (mouse->in_box(field_18, field_1A, field_18 + field_08 + 1,
   ;	
   ;	
   ;	                      field_1A + field_06 + 1)
   ;	        && i_external_button != 0 && i_external_button() != 0) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+26]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+6]
	inc	ax
	push	ax
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+24]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+8]
	inc	ax
	push	ax
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+26]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+24]
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@in_box$qiiii
	add	sp,12
	or	al,al
	jne short	@@22
	jmp	@50@198
@@22:
	cmp	dword ptr DGROUP:_i_external_button,large 0
	jne short	@@23
	jmp	@50@198
@@23:
	call	dword ptr DGROUP:_i_external_button
	or	al,al
	jne short	@@24
	jmp	@50@198
@@24:
   ;	
   ;	        mouse->hide();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@hide$qv
	add	sp,4
   ;	
   ;	        high_light(field_18 + 1, field_1A + 1, field_18 + field_08 - 1,
   ;	
   ;	
   ;	                   field_1A + field_06, field_14, txoff, 2, 0);
   ;	
	push	0
	push	2
	push	word ptr [bp-2]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+22]
	push	word ptr es:[bx+20]
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+26]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+6]
	push	ax
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+24]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+8]
	dec	ax
	push	ax
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+26]
	inc	ax
	push	ax
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+24]
	inc	ax
	push	ax
	push	cs
	call	near ptr @high_light$qiiiinuciiuc
	add	sp,18
   ;	
   ;	        display->pause(2);
   ;	
	push	2
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@pause$qui
	add	sp,6
   ;	
   ;	        high_light(field_18 + 1, field_1A + 1, field_18 + field_08 - 1,
   ;	
   ;	
   ;	                   field_1A + field_06, field_14, txoff, 1, 1);
   ;	
	push	1
	push	1
	push	word ptr [bp-2]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+22]
	push	word ptr es:[bx+20]
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+26]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+6]
	push	ax
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+24]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+8]
	dec	ax
	push	ax
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+26]
	inc	ax
	push	ax
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+24]
	inc	ax
	push	ax
	push	cs
	call	near ptr @high_light$qiiiinuciiuc
	add	sp,18
   ;	
   ;	        mouse->show();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@show$qv
	add	sp,4
   ;	
   ;	        field_20 = 1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+32],1
   ;	
   ;	        if (field_22 == 0)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	dword ptr es:[bx+34],large 0
	jne	short @50@170
@50@142:
   ;	
   ;	            return 1;
   ;	
	mov	al,1
	jmp	@50@506
@50@170:
	jmp	@50@422
@50@198:
   ;	
   ;	        field_20 = 0;
   ;	        return ((uchar (far *)(void))field_22)();
   ;	    }
   ;	    if (mouse->pressed_in_box(field_18, field_1A, field_18 + field_08 + 1,
   ;	
   ;	
   ;	                              field_1A + field_06 + 1)) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+26]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+6]
	inc	ax
	push	ax
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+24]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+8]
	inc	ax
	push	ax
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+26]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+24]
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@pressed_in_box$qiiii
	add	sp,12
	or	al,al
	jne short	@@25
	jmp	@50@310
@@25:
   ;	
   ;	        if (field_20 != 1) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+32],1
	je	short @50@282
   ;	
   ;	            field_20 = 1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+32],1
   ;	
   ;	            mouse->hide();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@hide$qv
	add	sp,4
   ;	
   ;	            high_light(field_18 + 1, field_1A + 1, field_18 + field_08 - 1,
   ;	
   ;	
   ;	                       field_1A + field_06, field_14, txoff, 2, 0);
   ;	
	push	0
	push	2
	push	word ptr [bp-2]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+22]
	push	word ptr es:[bx+20]
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+26]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+6]
	push	ax
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+24]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+8]
	dec	ax
	push	ax
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+26]
	inc	ax
	push	ax
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+24]
	inc	ax
	push	ax
	push	cs
	call	near ptr @high_light$qiiiinuciiuc
	add	sp,18
   ;	
   ;	            mouse->show();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@show$qv
	add	sp,4
	jmp	@50@478
@50@282:
	jmp	@50@478
@50@310:
   ;	
   ;	        }
   ;	        return 0;
   ;	    }
   ;	    if (field_20 == 1) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+32],1
	je short	@@26
	jmp	@50@478
@@26:
   ;	
   ;	        if (mouse->field_00 == 0) {
   ;	
	les	bx,dword ptr DGROUP:_mouse
	cmp	byte ptr es:[bx],0
	je short	@@27
	jmp	@50@450
@@27:
   ;	
   ;	            mouse->hide();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@hide$qv
	add	sp,4
   ;	
   ;	            high_light(field_18 + 1, field_1A + 1, field_18 + field_08 - 1,
   ;	
   ;	
   ;	                       field_1A + field_06, field_14, txoff, 1, 1);
   ;	
	push	1
	push	1
	push	word ptr [bp-2]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+22]
	push	word ptr es:[bx+20]
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+26]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+6]
	push	ax
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+24]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+8]
	dec	ax
	push	ax
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+26]
	inc	ax
	push	ax
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+24]
	inc	ax
	push	ax
	push	cs
	call	near ptr @high_light$qiiiinuciiuc
	add	sp,18
   ;	
   ;	            mouse->show();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@show$qv
	add	sp,4
   ;	
   ;	            if (field_22 == 0)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	dword ptr es:[bx+34],large 0
	jne	short @50@422
	jmp	@50@142
@50@422:
   ;	
   ;	                return 1;
   ;	            field_20 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+32],0
   ;	
   ;	            return ((uchar (far *)(void))field_22)();
   ;	
	les	bx,dword ptr [bp+6]
	call	dword ptr es:[bx+34]
	jmp	short @50@506
@50@450:
   ;	
   ;	        }
   ;	        mouse->hide();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@hide$qv
	add	sp,4
   ;	
   ;	        high_light(field_18 + 1, field_1A + 1, field_18 + field_08 - 1,
   ;	
   ;	
   ;	                   field_1A + field_06, field_14, txoff, 1, 1);
   ;	
	push	1
	push	1
	push	word ptr [bp-2]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+22]
	push	word ptr es:[bx+20]
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+26]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+6]
	push	ax
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+24]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+8]
	dec	ax
	push	ax
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+26]
	inc	ax
	push	ax
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+24]
	inc	ax
	push	ax
	push	cs
	call	near ptr @high_light$qiiiinuciiuc
	add	sp,18
   ;	
   ;	        mouse->show();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@show$qv
	add	sp,4
   ;	
   ;	        field_20 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+32],0
@50@478:
   ;	
   ;	    }
   ;	    return 0;
   ;	
	mov	al,0
@50@506:
   ;	
   ;	}
   ;	
	leave	
	ret	
@button@poll$qv	endp
   ;	
   ;	void button::mouse_to_me()
   ;	
	assume	cs:GUI_TEXT
@button@mouse_to_me$qv	proc	far
	enter	2,0
   ;	
   ;	{
   ;	    uchar was_shown;
   ;	    if (mouse->field_02 != 0) {
   ;	
	les	bx,dword ptr DGROUP:_mouse
	cmp	byte ptr es:[bx+2],0
	je	short @51@86
   ;	
   ;	        was_shown = 1;
   ;	
	mov	byte ptr [bp-1],1
   ;	
   ;	        mouse->hide();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@hide$qv
	add	sp,4
   ;	
   ;	    } else
   ;	
	jmp	short @51@114
@51@86:
   ;	
   ;	        was_shown = 0;
   ;	
	mov	byte ptr [bp-1],0
@51@114:
   ;	
   ;	    mouse->set_coords(field_18 + (field_08 >> 1), field_1A + field_06 - 1);
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+26]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+6]
	dec	ax
	push	ax
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+24]
	les	bx,dword ptr [bp+6]
	mov	dx,word ptr es:[bx+8]
	shr	dx,1
	add	ax,dx
	push	ax
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@set_coords$qii
	add	sp,8
   ;	
   ;	    if (was_shown != 0)
   ;	
	cmp	byte ptr [bp-1],0
	je	short @51@170
   ;	
   ;	        mouse->show();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@show$qv
	add	sp,4
@51@170:
   ;	
   ;	}
   ;	
	leave	
	ret	
@button@mouse_to_me$qv	endp
   ;	
   ;	text_box::text_box(uchar far *title) : gui_item()
   ;	
	assume	cs:GUI_TEXT
@text_box@$bctr$qnuc	proc	far
	push	bp
	mov	bp,sp
	cmp	dword ptr [bp+6],large 0
	jne	short @52@86
	push	142
	call	far ptr @$bnew$qui
	pop	cx
	mov	word ptr [bp+8],dx
	mov	word ptr [bp+6],ax
	or	ax,dx
	jne short	@@28
	jmp	@52@114
@@28:
@52@86:
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @gui_item@$bctr$qv
	add	sp,4
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx],offset @@text_box@
   ;	
   ;	{
   ;	    field_72 = title;
   ;	
	les	bx,dword ptr [bp+6]
	mov	eax,dword ptr [bp+10]
	mov	dword ptr es:[bx+114],eax
   ;	
   ;	    field_06 = 0x24;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+6],36
   ;	
   ;	    field_08 = 0x64;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+8],100
   ;	
   ;	    field_02 = 0xA0 - (field_08 >> 1);
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+8]
	shr	ax,1
	mov	dx,160
	sub	dx,ax
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+2],dx
   ;	
   ;	    field_04 = 0x64 - (field_06 >> 1);
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+6]
	shr	ax,1
	mov	dx,100
	sub	dx,ax
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+4],dx
   ;	
   ;	    field_6C = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+108],0
   ;	
   ;	    field_6D = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+109],0
   ;	
   ;	    field_76 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+118],0
   ;	
   ;	    field_77 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+119],0
   ;	
   ;	    field_18 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	dword ptr es:[bx+24],large 0
   ;	
   ;	    field_6E = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	dword ptr es:[bx+110],large 0
   ;	
   ;	    field_16 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+22],0
   ;	
   ;	    field_14 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+20],0
   ;	
   ;	    field_78 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+120],0
@52@114:
   ;	
   ;	}
   ;	
	mov	dx,word ptr [bp+8]
	mov	ax,word ptr [bp+6]
	pop	bp
	ret	
@text_box@$bctr$qnuc	endp
   ;	
   ;	text_box::~text_box()
   ;	
	assume	cs:GUI_TEXT
@text_box@$bdtr$qv	proc	far
	enter	2,0
   ;	
   ;	{
   ;	
	cmp	dword ptr [bp+6],large 0
	jne short	@@29
	jmp	@53@282
@@29:
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx],offset @@text_box@
   ;	
   ;	    int i;
   ;	    erase();
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	les	bx,dword ptr [bp+6]
	mov	bx,word ptr es:[bx]
	call	dword ptr [bx+4]
	add	sp,4
   ;	
   ;	    for (i = 0; i < field_76; i++)
   ;	
	mov	word ptr [bp-2],0
	jmp	short @53@142
@53@86:
   ;	
   ;	        delete buttons[i];
   ;	
	push	3
	mov	ax,word ptr [bp-2]
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	push	word ptr es:[bx+124]
	push	word ptr es:[bx+122]
	call	far ptr @button@$bdtr$qv
	add	sp,6
	inc	word ptr [bp-2]
@53@142:
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+118]
	mov	ah,0
	cmp	ax,word ptr [bp-2]
	jg	short @53@86
   ;	
   ;	    if (field_18)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	dword ptr es:[bx+24],large 0
	je	short @53@226
   ;	
   ;	        delete field_18;
   ;	
	push	3
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+26]
	push	word ptr es:[bx+24]
	call	far ptr @file_box@$bdtr$qv
	add	sp,6
@53@226:
	push	0
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @gui_item@$bdtr$qv
	add	sp,6
	test	word ptr [bp+10],1
	je	short @53@282
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @$bdele$qnv
	add	sp,4
@53@282:
   ;	
   ;	}
   ;	
	leave	
	ret	
@text_box@$bdtr$qv	endp
   ;	
   ;	void text_box::add_bitmap(int off, int h, uchar far *bits)
   ;	
	assume	cs:GUI_TEXT
@text_box@add_bitmap$qiinuc	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    field_06 += h;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp+12]
	add	word ptr es:[bx+6],ax
   ;	
   ;	    field_04 = 0x64 - (field_06 >> 1);
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+6]
	shr	ax,1
	mov	dx,100
	sub	dx,ax
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+4],dx
   ;	
   ;	    field_14 = off;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp+10]
	mov	word ptr es:[bx+20],ax
   ;	
   ;	    field_16 = h;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp+12]
	mov	word ptr es:[bx+22],ax
   ;	
   ;	    field_6E = bits;
   ;	
	les	bx,dword ptr [bp+6]
	mov	eax,dword ptr [bp+14]
	mov	dword ptr es:[bx+110],eax
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@text_box@add_bitmap$qiinuc	endp
   ;	
   ;	void text_box::add_string(uchar far *s)
   ;	
	assume	cs:GUI_TEXT
@text_box@add_string$qnuc	proc	far
	enter	2,0
   ;	
   ;	{
   ;	    uint w;
   ;	    field_1C[field_0A++] = s;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+10]
	inc	word ptr es:[bx+10]
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	mov	ax,word ptr [bp+12]
	mov	dx,word ptr [bp+10]
	mov	word ptr es:[bx+30],ax
	mov	word ptr es:[bx+28],dx
   ;	
   ;	    w = strlen(s) * 8 + 0x20;
   ;	
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	call	far ptr _strlen
	add	sp,4
	shl	ax,3
	add	ax,32
	mov	word ptr [bp-2],ax
   ;	
   ;	    field_06 += 0xC;
   ;	
	les	bx,dword ptr [bp+6]
	add	word ptr es:[bx+6],12
   ;	
   ;	    if (field_08 < w)
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+8]
	cmp	ax,word ptr [bp-2]
	jae	short @55@86
   ;	
   ;	        field_08 = w;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp-2]
	mov	word ptr es:[bx+8],ax
@55@86:
   ;	
   ;	    field_02 = 0xA0 - (field_08 >> 1);
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+8]
	shr	ax,1
	mov	dx,160
	sub	dx,ax
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+2],dx
   ;	
   ;	    field_04 = 0x64 - (field_06 >> 1);
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+6]
	shr	ax,1
	mov	dx,100
	sub	dx,ax
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+4],dx
   ;	
   ;	}
   ;	
	leave	
	ret	
@text_box@add_string$qnuc	endp
   ;	
   ;	void text_box::add_file_box(uchar far *path)
   ;	
	assume	cs:GUI_TEXT
@text_box@add_file_box$qnuc	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    field_06 += 0x84;
   ;	
	les	bx,dword ptr [bp+6]
	add	word ptr es:[bx+6],132
   ;	
   ;	    field_08 = 0xE0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+8],224
   ;	
   ;	    field_02 = 0xA0 - (field_08 >> 1);
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+8]
	shr	ax,1
	mov	dx,160
	sub	dx,ax
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+2],dx
   ;	
   ;	    field_04 = 0x64 - (field_06 >> 1);
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+6]
	shr	ax,1
	mov	dx,100
	sub	dx,ax
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+4],dx
   ;	
   ;	    field_18 = new file_box(path);
   ;	
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	push	0
	push	0
	call	far ptr @file_box@$bctr$qnuc
	add	sp,8
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+26],dx
	mov	word ptr es:[bx+24],ax
   ;	
   ;	    field_18->field_02 = field_02 + 2;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	add	ax,2
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+24]
	mov	word ptr es:[bx+2],ax
   ;	
   ;	    field_18->field_04 = field_04 + 0x1A;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+4]
	add	ax,26
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+24]
	mov	word ptr es:[bx+4],ax
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@text_box@add_file_box$qnuc	endp
   ;	
   ;	void text_box::add_button(uchar far *label, void far *cb)
   ;	
	assume	cs:GUI_TEXT
@text_box@add_button$qnucnv	proc	far
	enter	4,0
   ;	
   ;	{
   ;	    button far *b = new button(label, cb, 0);
   ;	
	push	0
	push	word ptr [bp+16]
	push	word ptr [bp+14]
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	push	0
	push	0
	push	cs
	call	near ptr @button@$bctr$qnucnvuc
	add	sp,14
	mov	word ptr [bp-2],dx
	mov	word ptr [bp-4],ax
   ;	
   ;	    if (field_18 == 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	dword ptr es:[bx+24],large 0
	jne	short @57@86
   ;	
   ;	        b->field_18 = field_02 + field_08 - 4 - (field_76 + 1) * 0x44;
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+118]
	mov	ah,0
	inc	ax
	imul	ax,ax,68
	les	bx,dword ptr [bp+6]
	mov	dx,word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	add	dx,word ptr es:[bx+8]
	sub	dx,4
	sub	dx,ax
	les	bx,dword ptr [bp-4]
	mov	word ptr es:[bx+24],dx
   ;	
   ;	        b->field_1A = field_04 + field_06 - 0xF;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+4]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+6]
	sub	ax,15
	les	bx,dword ptr [bp-4]
	mov	word ptr es:[bx+26],ax
   ;	
   ;	    } else {
   ;	
	jmp	short @57@114
@57@86:
   ;	
   ;	        b->field_18 = field_02 + field_08 - 0x40 - 8;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+8]
	sub	ax,64
	sub	ax,8
	les	bx,dword ptr [bp-4]
	mov	word ptr es:[bx+24],ax
   ;	
   ;	        b->field_1A = field_04 + field_06 - field_76 * 0xF - 0xF;
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+118]
	mov	ah,0
	imul	ax,ax,15
	les	bx,dword ptr [bp+6]
	mov	dx,word ptr es:[bx+4]
	les	bx,dword ptr [bp+6]
	add	dx,word ptr es:[bx+6]
	sub	dx,ax
	sub	dx,15
	les	bx,dword ptr [bp-4]
	mov	word ptr es:[bx+26],dx
@57@114:
   ;	
   ;	    }
   ;	    if (field_76 == 0)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+118],0
	jne	short @57@170
   ;	
   ;	        b->mouse_to_me();
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	push	cs
	call	near ptr @button@mouse_to_me$qv
	add	sp,4
@57@170:
   ;	
   ;	    buttons[field_76++] = b;
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+118]
	inc	byte ptr es:[bx+118]
	mov	ah,0
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	mov	ax,word ptr [bp-2]
	mov	dx,word ptr [bp-4]
	mov	word ptr es:[bx+124],ax
	mov	word ptr es:[bx+122],dx
   ;	
   ;	}
   ;	
	leave	
	ret	
@text_box@add_button$qnucnv	endp
   ;	
   ;	void text_box::draw()
   ;	
	assume	cs:GUI_TEXT
@text_box@draw$qv	proc	far
	enter	16,0
   ;	
   ;	{
   ;	    int was_shown, sx, sy, tx, ty, bx, by, i;
   ;	    if (mouse->field_02 != 0) {
   ;	
	les	bx,dword ptr DGROUP:_mouse
	cmp	byte ptr es:[bx+2],0
	je	short @58@86
   ;	
   ;	        mouse->hide();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@hide$qv
	add	sp,4
   ;	
   ;	        was_shown = 1;
   ;	
	mov	word ptr [bp-2],1
   ;	
   ;	    } else
   ;	
	jmp	short @58@114
@58@86:
   ;	
   ;	        was_shown = 0;
   ;	
	mov	word ptr [bp-2],0
@58@114:
   ;	
   ;	    field_0E = (uchar far *)display->get_bits(field_02, field_04,
   ;	
   ;	
   ;	                                 field_02 + field_08 + 1, field_04 + field_06 + 1);
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+4]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+6]
	inc	ax
	push	ax
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+8]
	inc	ax
	push	ax
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+4]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+2]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@get_bits$qiiii
	add	sp,12
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+16],dx
	mov	word ptr es:[bx+14],ax
   ;	
   ;	    if (field_0E == 0)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	dword ptr es:[bx+14],large 0
	jne	short @58@170
   ;	
   ;	        no_heap("Text Box");
   ;	
	push	ds
	push	offset DGROUP:s@+137
	call	far ptr @no_heap$qnuc
	add	sp,4
@58@170:
   ;	
   ;	    draw_shadow_box(field_02, field_04, field_02 + field_08, field_04 + field_06);
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+4]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+6]
	push	ax
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+8]
	push	ax
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+4]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+2]
	push	cs
	call	near ptr @draw_shadow_box$qiiii
	add	sp,8
   ;	
   ;	    if (field_72 == 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	dword ptr es:[bx+114],large 0
	jne	short @58@226
   ;	
   ;	        display->fill_rect(field_02, field_04, field_02 + field_08,
   ;	
   ;	
   ;	                           field_04 + 0xA, display->field_03, -1, 0);
   ;	
	push	0
	push	-1
	les	bx,dword ptr DGROUP:_display
	mov	al,byte ptr es:[bx+3]
	mov	ah,0
	push	ax
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+4]
	add	ax,10
	push	ax
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+8]
	push	ax
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+4]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+2]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@fill_rect$qiiiiiiuc
	add	sp,18
   ;	
   ;	    } else {
   ;	
	jmp	@58@254
@58@226:
   ;	
   ;	        tx = 0xA0 - ((strlen(field_72) << 3) >> 1);
   ;	
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+116]
	push	word ptr es:[bx+114]
	call	far ptr _strlen
	add	sp,4
	shl	ax,3
	shr	ax,1
	mov	dx,160
	sub	dx,ax
	mov	word ptr [bp-8],dx
   ;	
   ;	        ty = field_04 + 1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+4]
	inc	ax
	mov	word ptr [bp-10],ax
   ;	
   ;	        display->fill_rect(field_02, field_04, field_02 + field_08,
   ;	
   ;	
   ;	                           field_04 + 0xA, display->field_03, -1, 0);
   ;	
	push	0
	push	-1
	les	bx,dword ptr DGROUP:_display
	mov	al,byte ptr es:[bx+3]
	mov	ah,0
	push	ax
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+4]
	add	ax,10
	push	ax
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+8]
	push	ax
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+4]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+2]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@fill_rect$qiiiiiiuc
	add	sp,18
   ;	
   ;	        display->print_at_xy(tx, ty, field_72, 0);
   ;	
	push	0
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+116]
	push	word ptr es:[bx+114]
	push	word ptr [bp-10]
	push	word ptr [bp-8]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@print_at_xy$qiinucuc
	add	sp,14
@58@254:
   ;	
   ;	    }
   ;	    sy = field_04 + 0xC;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+4]
	add	ax,12
	mov	word ptr [bp-6],ax
   ;	
   ;	    for (i = 0; i < field_0A; i++) {
   ;	
	mov	word ptr [bp-16],0
	jmp	@58@450
@58@282:
   ;	
   ;	        if (field_6C == 0)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+108],0
	jne	short @58@338
   ;	
   ;	            sx = 0xA0 - ((strlen(field_1C[i]) << 3) >> 1);
   ;	
	mov	ax,word ptr [bp-16]
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	push	word ptr es:[bx+30]
	push	word ptr es:[bx+28]
	call	far ptr _strlen
	add	sp,4
	shl	ax,3
	shr	ax,1
	mov	dx,160
	sub	dx,ax
	mov	word ptr [bp-4],dx
	jmp	short @58@394
@58@338:
   ;	
   ;	        else if (field_6C == 1)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+108],1
	jne	short @58@394
   ;	
   ;	            sx = field_02 + 4;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	add	ax,4
	mov	word ptr [bp-4],ax
@58@394:
   ;	
   ;	        display->print_at_xy(sx, sy, field_1C[i], 0);
   ;	
	push	0
	mov	ax,word ptr [bp-16]
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	push	word ptr es:[bx+30]
	push	word ptr es:[bx+28]
	push	word ptr [bp-6]
	push	word ptr [bp-4]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@print_at_xy$qiinucuc
	add	sp,14
   ;	
   ;	        sy += 0xC;
   ;	
	add	word ptr [bp-6],12
	inc	word ptr [bp-16]
@58@450:
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+10]
	cmp	ax,word ptr [bp-16]
	jbe short	@@30
	jmp	@58@282
@@30:
   ;	
   ;	    }
   ;	    for (i = 0; i < field_76; i++)
   ;	
	mov	word ptr [bp-16],0
	jmp	short @58@562
@58@506:
   ;	
   ;	        buttons[i]->draw();
   ;	
	mov	ax,word ptr [bp-16]
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	push	word ptr es:[bx+124]
	push	word ptr es:[bx+122]
	mov	ax,word ptr [bp-16]
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	les	bx,dword ptr es:[bx+122]
	mov	bx,word ptr es:[bx]
	call	dword ptr [bx]
	add	sp,4
	inc	word ptr [bp-16]
@58@562:
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+118]
	mov	ah,0
	cmp	ax,word ptr [bp-16]
	jg	short @58@506
   ;	
   ;	    if (field_18 != 0)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	dword ptr es:[bx+24],large 0
	je	short @58@646
   ;	
   ;	        field_18->draw();
   ;	
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+26]
	push	word ptr es:[bx+24]
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+24]
	mov	bx,word ptr es:[bx]
	call	dword ptr [bx]
	add	sp,4
@58@646:
   ;	
   ;	    if (field_6E != 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	dword ptr es:[bx+110],large 0
	je	short @58@702
   ;	
   ;	        bx = 0xA0 - field_14 / 2;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+20]
	cwd	
	sub	ax,dx
	sar	ax,1
	mov	dx,160
	sub	dx,ax
	mov	word ptr [bp-12],dx
   ;	
   ;	        by = field_04 + field_0A * 0xC + 0xC;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+4]
	les	bx,dword ptr [bp+6]
	mov	dx,word ptr es:[bx+10]
	imul	dx,dx,12
	add	ax,dx
	add	ax,12
	mov	word ptr [bp-14],ax
   ;	
   ;	        display->put_bits(bx, by, bx + field_14, by + field_16, field_6E, 0, 0);
   ;	
	push	0
	push	0
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+112]
	push	word ptr es:[bx+110]
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp-14]
	add	ax,word ptr es:[bx+22]
	push	ax
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp-12]
	add	ax,word ptr es:[bx+20]
	push	ax
	push	word ptr [bp-14]
	push	word ptr [bp-12]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@put_bits$qiiiinucuiui
	add	sp,20
@58@702:
   ;	
   ;	    }
   ;	    if (was_shown != 0)
   ;	
	cmp	word ptr [bp-2],0
	je	short @58@758
   ;	
   ;	        mouse->show();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@show$qv
	add	sp,4
@58@758:
   ;	
   ;	    if (i_external_button != 0)
   ;	
	cmp	dword ptr DGROUP:_i_external_button,large 0
	je	short @58@814
@58@786:
   ;	
   ;	        while (i_external_button() != 0)
   ;	
	call	dword ptr DGROUP:_i_external_button
	or	al,al
	jne	short @58@786
@58@814:
   ;	
   ;	            ;
   ;	}
   ;	
	leave	
	ret	
@text_box@draw$qv	endp
   ;	
   ;	uchar text_box::poll()
   ;	
	assume	cs:GUI_TEXT
@text_box@poll$qv	proc	far
	enter	2,0
   ;	
   ;	{
   ;	    int i;
   ;	    for (i = 0; i < field_76; i++) {
   ;	
	mov	word ptr [bp-2],0
	jmp	short @59@226
@59@58:
   ;	
   ;	        if (field_18 != 0 && field_18->poll())
   ;	
	les	bx,dword ptr [bp+6]
	cmp	dword ptr es:[bx+24],large 0
	je	short @59@142
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+26]
	push	word ptr es:[bx+24]
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+24]
	mov	bx,word ptr es:[bx]
	call	dword ptr [bx+8]
	add	sp,4
	or	al,al
	je	short @59@142
@59@114:
   ;	
   ;	            return 1;
   ;	
	mov	al,1
	jmp	@59@478
@59@142:
   ;	
   ;	        if (buttons[i]->poll())
   ;	
	mov	ax,word ptr [bp-2]
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	push	word ptr es:[bx+124]
	push	word ptr es:[bx+122]
	mov	ax,word ptr [bp-2]
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	les	bx,dword ptr es:[bx+122]
	mov	bx,word ptr es:[bx]
	call	dword ptr [bx+8]
	add	sp,4
	or	al,al
	je	short @59@198
	jmp	short @59@114
@59@198:
	inc	word ptr [bp-2]
@59@226:
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+118]
	mov	ah,0
	cmp	ax,word ptr [bp-2]
	jg	short @59@58
   ;	
   ;	            return 1;
   ;	    }
   ;	    if (i_external_left != 0) {
   ;	
	cmp	dword ptr DGROUP:_i_external_left,large 0
	jne short	@@31
	jmp	@59@450
@@31:
   ;	
   ;	        if (i_external_left() != 0) {
   ;	
	call	dword ptr DGROUP:_i_external_left
	or	al,al
	je	short @59@366
   ;	
   ;	            if (field_78 != field_76 - 1) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+120]
	mov	ah,0
	les	bx,dword ptr [bp+6]
	mov	dl,byte ptr es:[bx+118]
	mov	dh,0
	dec	dx
	cmp	ax,dx
	je	short @59@366
   ;	
   ;	                field_78++;
   ;	
	les	bx,dword ptr [bp+6]
	inc	byte ptr es:[bx+120]
   ;	
   ;	                buttons[field_78]->mouse_to_me();
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+120]
	mov	ah,0
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	push	word ptr es:[bx+124]
	push	word ptr es:[bx+122]
	push	cs
	call	near ptr @button@mouse_to_me$qv
	add	sp,4
   ;	
   ;	                display->pause(0xF);
   ;	
	push	15
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@pause$qui
	add	sp,6
@59@366:
   ;	
   ;	            }
   ;	        }
   ;	        if (i_external_right() != 0) {
   ;	
	call	dword ptr DGROUP:_i_external_right
	or	al,al
	je	short @59@450
   ;	
   ;	            if (field_78 != 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+120],0
	je	short @59@450
   ;	
   ;	                field_78--;
   ;	
	les	bx,dword ptr [bp+6]
	dec	byte ptr es:[bx+120]
   ;	
   ;	                buttons[field_78]->mouse_to_me();
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+120]
	mov	ah,0
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	push	word ptr es:[bx+124]
	push	word ptr es:[bx+122]
	push	cs
	call	near ptr @button@mouse_to_me$qv
	add	sp,4
   ;	
   ;	                display->pause(0xF);
   ;	
	push	15
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@pause$qui
	add	sp,6
@59@450:
   ;	
   ;	            }
   ;	        }
   ;	    }
   ;	    return 0;
   ;	
	mov	al,0
@59@478:
   ;	
   ;	}
   ;	
	leave	
	ret	
@text_box@poll$qv	endp
   ;	
   ;	void text_box::erase()
   ;	
	assume	cs:GUI_TEXT
@text_box@erase$qv	proc	far
	enter	2,0
   ;	
   ;	{
   ;	    uchar was_shown;
   ;	    if (field_77 == 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+119],0
	je short	@@32
	jmp	@60@198
@@32:
   ;	
   ;	        if (mouse->field_02 != 0) {
   ;	
	les	bx,dword ptr DGROUP:_mouse
	cmp	byte ptr es:[bx+2],0
	je	short @60@114
   ;	
   ;	            mouse->hide();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@hide$qv
	add	sp,4
   ;	
   ;	            was_shown = 1;
   ;	
	mov	byte ptr [bp-1],1
   ;	
   ;	        } else
   ;	
	jmp	short @60@142
@60@114:
   ;	
   ;	            was_shown = 0;
   ;	
	mov	byte ptr [bp-1],0
@60@142:
   ;	
   ;	        display->put_bits(field_02, field_04, field_02 + field_08 + 1,
   ;	
   ;	
   ;	                          field_04 + field_06 + 1, field_0E, 0, 0);
   ;	
	push	0
	push	0
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+16]
	push	word ptr es:[bx+14]
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+4]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+6]
	inc	ax
	push	ax
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+8]
	inc	ax
	push	ax
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+4]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+2]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@put_bits$qiiiinucuiui
	add	sp,20
   ;	
   ;	        if (was_shown != 0)
   ;	
	cmp	byte ptr [bp-1],0
	je	short @60@198
   ;	
   ;	            mouse->show();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@show$qv
	add	sp,4
@60@198:
   ;	
   ;	    }
   ;	    delete field_0E;
   ;	
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+16]
	push	word ptr es:[bx+14]
	call	far ptr @$bdele$qnv
	add	sp,4
   ;	
   ;	}
   ;	
	leave	
	ret	
@text_box@erase$qv	endp
   ;	
   ;	prompt_box::prompt_box(uchar far *prompt) : gui_item()
   ;	
	assume	cs:GUI_TEXT
@prompt_box@$bctr$qnuc	proc	far
	push	bp
	mov	bp,sp
	cmp	dword ptr [bp+6],large 0
	jne	short @61@86
	push	42
	call	far ptr @$bnew$qui
	pop	cx
	mov	word ptr [bp+8],dx
	mov	word ptr [bp+6],ax
	or	ax,dx
	je	short @61@114
@61@86:
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @gui_item@$bctr$qv
	add	sp,4
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx],offset @@prompt_box@
   ;	
   ;	{
   ;	    field_18 = prompt;
   ;	
	les	bx,dword ptr [bp+6]
	mov	eax,dword ptr [bp+10]
	mov	dword ptr es:[bx+24],eax
   ;	
   ;	    field_1C = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+28],0
   ;	
   ;	    field_1D = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+29],0
   ;	
   ;	    field_24 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+36],0
   ;	
   ;	    field_22 = maximum_text_length;
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr DGROUP:_maximum_text_length
	mov	byte ptr es:[bx+34],al
   ;	
   ;	    field_1E = new uchar[0x1E];
   ;	
	push	30
	call	far ptr @$bnew$qui
	pop	cx
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+32],dx
	mov	word ptr es:[bx+30],ax
   ;	
   ;	    memset(field_1E, 0, 0x1E);
   ;	
	push	30
	push	0
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+32]
	push	word ptr es:[bx+30]
	call	far ptr _memset
	add	sp,8
@61@114:
   ;	
   ;	}
   ;	
	mov	dx,word ptr [bp+8]
	mov	ax,word ptr [bp+6]
	pop	bp
	ret	
@prompt_box@$bctr$qnuc	endp
   ;	
   ;	prompt_box::~prompt_box()
   ;	
	assume	cs:GUI_TEXT
@prompt_box@$bdtr$qv	proc	far
	enter	2,0
   ;	
   ;	{
   ;	
	cmp	dword ptr [bp+6],large 0
	jne short	@@33
	jmp	@62@198
@@33:
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx],offset @@prompt_box@
   ;	
   ;	    int was_shown = mouse->field_02;
   ;	
	les	bx,dword ptr DGROUP:_mouse
	mov	al,byte ptr es:[bx+2]
	mov	ah,0
	mov	word ptr [bp-2],ax
   ;	
   ;	    mouse->hide();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@hide$qv
	add	sp,4
   ;	
   ;	    display->put_bits(field_02, field_04, field_02 + field_08 + 1,
   ;	
   ;	
   ;	                      field_04 + field_06 + 1, field_0E, 0, 0);
   ;	
	push	0
	push	0
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+16]
	push	word ptr es:[bx+14]
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+4]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+6]
	inc	ax
	push	ax
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+8]
	inc	ax
	push	ax
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+4]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+2]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@put_bits$qiiiinucuiui
	add	sp,20
   ;	
   ;	    delete field_0E;
   ;	
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+16]
	push	word ptr es:[bx+14]
	call	far ptr @$bdele$qnv
	add	sp,4
   ;	
   ;	    if (was_shown != 0)
   ;	
	cmp	word ptr [bp-2],0
	je	short @62@114
   ;	
   ;	        mouse->show();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@show$qv
	add	sp,4
@62@114:
   ;	
   ;	    delete field_1E;
   ;	
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+32]
	push	word ptr es:[bx+30]
	call	far ptr @$bdele$qnv
	add	sp,4
	push	0
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @gui_item@$bdtr$qv
	add	sp,6
	test	word ptr [bp+10],1
	je	short @62@198
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @$bdele$qnv
	add	sp,4
@62@198:
   ;	
   ;	}
   ;	
	leave	
	ret	
@prompt_box@$bdtr$qv	endp
   ;	
   ;	void prompt_box::draw()
   ;	
	assume	cs:GUI_TEXT
@prompt_box@draw$qv	proc	far
	enter	6,0
   ;	
   ;	{
   ;	    int was_shown, tx, ty;
   ;	    field_08 = (strlen(field_14) << 3) + 0x20;
   ;	
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+22]
	push	word ptr es:[bx+20]
	call	far ptr _strlen
	add	sp,4
	shl	ax,3
	add	ax,32
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+8],ax
   ;	
   ;	    if (maximum_text_length * 8 > field_08)
   ;	
	mov	al,byte ptr DGROUP:_maximum_text_length
	mov	ah,0
	shl	ax,3
	les	bx,dword ptr [bp+6]
	cmp	ax,word ptr es:[bx+8]
	jbe	short @63@86
   ;	
   ;	        field_08 = maximum_text_length * 8;
   ;	
	mov	al,byte ptr DGROUP:_maximum_text_length
	mov	ah,0
	shl	ax,3
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+8],ax
@63@86:
   ;	
   ;	    field_06 = 0x24;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+6],36
   ;	
   ;	    field_02 = 0xA0 - (field_08 >> 1);
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+8]
	shr	ax,1
	mov	dx,160
	sub	dx,ax
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+2],dx
   ;	
   ;	    field_04 = 0x64 - (field_06 >> 1);
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+6]
	shr	ax,1
	mov	dx,100
	sub	dx,ax
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+4],dx
   ;	
   ;	    field_26 = field_02 + 8;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	add	ax,8
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+38],ax
   ;	
   ;	    field_28 = field_04 + field_06 - 0xE;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+4]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+6]
	sub	ax,14
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+40],ax
   ;	
   ;	    was_shown = mouse->field_02;
   ;	
	les	bx,dword ptr DGROUP:_mouse
	mov	al,byte ptr es:[bx+2]
	mov	ah,0
	mov	word ptr [bp-2],ax
   ;	
   ;	    mouse->hide();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@hide$qv
	add	sp,4
   ;	
   ;	    field_0E = (uchar far *)display->get_bits(field_02, field_04,
   ;	
   ;	
   ;	                                 field_02 + field_08 + 1, field_04 + field_06 + 1);
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+4]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+6]
	inc	ax
	push	ax
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+8]
	inc	ax
	push	ax
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+4]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+2]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@get_bits$qiiii
	add	sp,12
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+16],dx
	mov	word ptr es:[bx+14],ax
   ;	
   ;	    draw_shadow_box(field_02, field_04, field_02 + field_08, field_04 + field_06);
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+4]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+6]
	push	ax
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+8]
	push	ax
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+4]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+2]
	push	cs
	call	near ptr @draw_shadow_box$qiiii
	add	sp,8
   ;	
   ;	    display->fill_rect(field_02, field_04, field_02 + field_08, field_04 + 0xA,
   ;	
   ;	
   ;	                       display->field_03, -1, 0);
   ;	
	push	0
	push	-1
	les	bx,dword ptr DGROUP:_display
	mov	al,byte ptr es:[bx+3]
	mov	ah,0
	push	ax
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+4]
	add	ax,10
	push	ax
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+8]
	push	ax
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+4]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+2]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@fill_rect$qiiiiiiuc
	add	sp,18
   ;	
   ;	    tx = 0xA0 - ((strlen(field_18) << 3) >> 1);
   ;	
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+26]
	push	word ptr es:[bx+24]
	call	far ptr _strlen
	add	sp,4
	shl	ax,3
	shr	ax,1
	mov	dx,160
	sub	dx,ax
	mov	word ptr [bp-4],dx
   ;	
   ;	    ty = field_04 + 1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+4]
	inc	ax
	mov	word ptr [bp-6],ax
   ;	
   ;	    display->print_at_xy(tx, ty, field_18, 0);
   ;	
	push	0
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+26]
	push	word ptr es:[bx+24]
	push	word ptr [bp-6]
	push	word ptr [bp-4]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@print_at_xy$qiinucuc
	add	sp,14
   ;	
   ;	    display->print_at_xy(0xA0 - ((strlen(field_14) << 3) >> 1), field_04 + 0xC,
   ;	
   ;	
   ;	                         field_14, 0);
   ;	
	push	0
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+22]
	push	word ptr es:[bx+20]
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+4]
	add	ax,12
	push	ax
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+22]
	push	word ptr es:[bx+20]
	call	far ptr _strlen
	add	sp,4
	shl	ax,3
	shr	ax,1
	mov	dx,160
	sub	dx,ax
	push	dx
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@print_at_xy$qiinucuc
	add	sp,14
   ;	
   ;	    display->fill_rect(field_26, field_28, field_26 + field_08 - 0x10,
   ;	
   ;	
   ;	                       field_28 + 0xC, display->field_02, display->field_03, 0);
   ;	
	push	0
	les	bx,dword ptr DGROUP:_display
	mov	al,byte ptr es:[bx+3]
	mov	ah,0
	push	ax
	les	bx,dword ptr DGROUP:_display
	mov	al,byte ptr es:[bx+2]
	mov	ah,0
	push	ax
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+40]
	add	ax,12
	push	ax
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+38]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+8]
	sub	ax,16
	push	ax
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+40]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+38]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@fill_rect$qiiiiiiuc
	add	sp,18
   ;	
   ;	    if (was_shown == 1)
   ;	
	cmp	word ptr [bp-2],1
	jne	short @63@142
   ;	
   ;	        mouse->show();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@show$qv
	add	sp,4
@63@142:
   ;	
   ;	}
   ;	
	leave	
	ret	
@prompt_box@draw$qv	endp
   ;	
   ;	uchar prompt_box::poll()
   ;	
	assume	cs:GUI_TEXT
@prompt_box@poll$qv	proc	far
	enter	4,0
   ;	
   ;	{
   ;	    uchar len = 0, done = 0, ch, i;
   ;	
	mov	byte ptr [bp-1],0
	mov	byte ptr [bp-2],0
   ;	
   ;	    disable_exit_routine = 1;
   ;	
	mov	byte ptr DGROUP:_disable_exit_routine,1
   ;	
   ;	    update_text(field_1E);
   ;	
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+32]
	push	word ptr es:[bx+30]
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @prompt_box@update_text$qnuc
	add	sp,8
	jmp	short @64@86
@64@58:
   ;	
   ;	    while (kbhit())
   ;	        getch();
   ;	
	call	far ptr _getch
@64@86:
	call	far ptr _kbhit
	or	ax,ax
	jne	short @64@58
	jmp	@64@422
@64@142:
   ;	
   ;	    while (!done) {
   ;	        ch = getch();
   ;	
	call	far ptr _getch
	mov	byte ptr [bp-3],al
   ;	
   ;	        if (ch == 8) {
   ;	
	cmp	byte ptr [bp-3],8
	jne	short @64@254
   ;	
   ;	            if (len > 0) {
   ;	
	cmp	byte ptr [bp-1],0
	jbe	short @64@422
   ;	
   ;	                len--;
   ;	
	dec	byte ptr [bp-1]
   ;	
   ;	                field_1E[len] = 0;
   ;	
	mov	al,byte ptr [bp-1]
	mov	ah,0
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+30]
	add	bx,ax
	mov	byte ptr es:[bx],0
	jmp	short @64@394
   ;	
   ;	                update_text(field_1E);
   ;	            }
   ;	        } else if (ch == 13 || ch == 27) {
   ;	
	jmp	short @64@422
@64@254:
	cmp	byte ptr [bp-3],13
	je	short @64@310
	cmp	byte ptr [bp-3],27
	jne	short @64@338
@64@310:
   ;	
   ;	            done = 1;
   ;	
	mov	byte ptr [bp-2],1
   ;	
   ;	        } else {
   ;	
	jmp	short @64@422
@64@338:
   ;	
   ;	            if (len < field_22) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+34]
	cmp	al,byte ptr [bp-1]
	jbe	short @64@422
   ;	
   ;	                field_1E[len] = ch;
   ;	
	mov	al,byte ptr [bp-1]
	mov	ah,0
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+30]
	add	bx,ax
	mov	al,byte ptr [bp-3]
	mov	byte ptr es:[bx],al
   ;	
   ;	                len++;
   ;	
	inc	byte ptr [bp-1]
@64@394:
   ;	
   ;	                update_text(field_1E);
   ;	
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+32]
	push	word ptr es:[bx+30]
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @prompt_box@update_text$qnuc
	add	sp,8
@64@422:
	mov	al,byte ptr [bp-2]
	mov	ah,0
	or	ax,ax
	jne short	@@34
	jmp	@64@142
@@34:
   ;	
   ;	            }
   ;	        }
   ;	    }
   ;	    if (ch != 0x1B) {
   ;	
	cmp	byte ptr [bp-3],27
	je	short @64@730
   ;	
   ;	        for (i = 0; i < len; i++) {
   ;	
	mov	byte ptr [bp-4],0
	jmp	short @64@618
@64@506:
   ;	
   ;	            if (field_1E[i] < '0' || field_1E[i] > '9')
   ;	
	mov	al,byte ptr [bp-4]
	mov	ah,0
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+30]
	add	bx,ax
	cmp	byte ptr es:[bx],48
	jb	short @64@562
	mov	al,byte ptr [bp-4]
	mov	ah,0
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+30]
	add	bx,ax
	cmp	byte ptr es:[bx],57
	jbe	short @64@590
@64@562:
   ;	
   ;	                field_1C++;
   ;	
	les	bx,dword ptr [bp+6]
	inc	byte ptr es:[bx+28]
@64@590:
	inc	byte ptr [bp-4]
@64@618:
	mov	al,byte ptr [bp-4]
	cmp	al,byte ptr [bp-1]
	jb	short @64@506
   ;	
   ;	        }
   ;	        if (field_1C == 0)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+28],0
	jne	short @64@758
   ;	
   ;	            field_24 = atoi(field_1E);
   ;	
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+32]
	push	word ptr es:[bx+30]
	call	far ptr @atoi$qnxuc
	add	sp,4
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+36],ax
	jmp	short @64@758
   ;	
   ;	    } else
   ;	
	jmp	short @64@758
@64@730:
   ;	
   ;	        field_1D++;
   ;	
	les	bx,dword ptr [bp+6]
	inc	byte ptr es:[bx+29]
@64@758:
   ;	
   ;	    disable_exit_routine = 0;
   ;	
	mov	byte ptr DGROUP:_disable_exit_routine,0
   ;	
   ;	    return 0;
   ;	
	mov	al,0
   ;	
   ;	}
   ;	
	leave	
	ret	
@prompt_box@poll$qv	endp
   ;	
   ;	void prompt_box::update_text(uchar far *s)
   ;	
	assume	cs:GUI_TEXT
@prompt_box@update_text$qnuc	proc	far
	enter	2,0
   ;	
   ;	{
   ;	    int right = field_26 + 2 + (strlen(s) << 3);
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+38]
	add	ax,2
	push	ax
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	call	far ptr _strlen
	add	sp,4
	shl	ax,3
	pop	dx
	add	dx,ax
	mov	word ptr [bp-2],dx
   ;	
   ;	    display->fill_rect(field_26, field_28, field_26 + (field_08 - 0x10),
   ;	
   ;	
   ;	                       field_28 + 0xC, display->field_02, display->field_03, 0);
   ;	
	push	0
	les	bx,dword ptr DGROUP:_display
	mov	al,byte ptr es:[bx+3]
	mov	ah,0
	push	ax
	les	bx,dword ptr DGROUP:_display
	mov	al,byte ptr es:[bx+2]
	mov	ah,0
	push	ax
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+40]
	add	ax,12
	push	ax
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+38]
	les	bx,dword ptr [bp+6]
	mov	dx,word ptr es:[bx+8]
	sub	dx,16
	add	ax,dx
	push	ax
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+40]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+38]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@fill_rect$qiiiiiiuc
	add	sp,18
   ;	
   ;	    display->print_at_xy(field_26 + 1, field_28 + 2, s, 0);
   ;	
	push	0
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+40]
	add	ax,2
	push	ax
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+38]
	inc	ax
	push	ax
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@print_at_xy$qiinucuc
	add	sp,14
   ;	
   ;	    display->print_at_xy(right, field_28 + 2, "_", 0);
   ;	
	push	0
	push	ds
	push	offset DGROUP:s@+146
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+40]
	add	ax,2
	push	ax
	push	word ptr [bp-2]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@print_at_xy$qiinucuc
	add	sp,14
   ;	
   ;	}
   ;	
	leave	
	ret	
@prompt_box@update_text$qnuc	endp
   ;	
   ;	file_box::file_box(uchar far *src) : gui_item()
   ;	
	assume	cs:GUI_TEXT
@file_box@$bctr$qnuc	proc	far
	enter	46,0
	push	si
	cmp	dword ptr [bp+6],large 0
	jne	short @66@86
	push	1110
	call	far ptr @$bnew$qui
	pop	cx
	mov	word ptr [bp+8],dx
	mov	word ptr [bp+6],ax
	or	ax,dx
	jne short	@@35
	jmp	@66@226
@@35:
@66@86:
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @gui_item@$bctr$qv
	add	sp,4
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx],offset @@file_box@
   ;	
   ;	{
   ;	    struct ffblk fb;
   ;	    int r;
   ;	    field_450 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+1104],0
   ;	
   ;	    field_451 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+1105],0
   ;	
   ;	    field_452 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+1106],0
   ;	
   ;	    field_14 = src;
   ;	
	les	bx,dword ptr [bp+6]
	mov	eax,dword ptr [bp+10]
	mov	dword ptr es:[bx+20],eax
   ;	
   ;	    current_directory(field_18);
   ;	
	mov	ax,word ptr [bp+6]
	add	ax,24
	push	word ptr [bp+8]
	push	ax
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @file_box@current_directory$qnuc
	add	sp,8
   ;	
   ;	    strcat(field_18, "\\");
   ;	
	push	ds
	push	offset DGROUP:s@+148
	mov	ax,word ptr [bp+6]
	add	ax,24
	push	word ptr [bp+8]
	push	ax
	call	far ptr _strcat
	add	sp,8
   ;	
   ;	    strcat(field_18, src);
   ;	
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	mov	ax,word ptr [bp+6]
	add	ax,24
	push	word ptr [bp+8]
	push	ax
	call	far ptr _strcat
	add	sp,8
   ;	
   ;	    field_08 = 0x68;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+8],104
   ;	
   ;	    field_06 = 0x7A;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+6],122
   ;	
   ;	    field_3E = -1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+62],-1
   ;	
   ;	    field_3C[0] = 0x1E;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+60],30
   ;	
   ;	    field_3C[1] = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+61],0
   ;	
   ;	    field_3A[0] = 0x1F;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+58],31
   ;	
   ;	    field_3A[1] = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+59],0
   ;	
   ;	    for (r = findfirst(field_14, &fb, 0); r == 0; r = findnext(&fb))
   ;	
	push	0
	push	ss
	lea	ax,word ptr [bp-46]
	push	ax
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+22]
	push	word ptr es:[bx+20]
	call	far ptr _findfirst
	add	sp,10
	jmp	short @66@170
@66@114:
   ;	
   ;	        field_50[field_0A++] = (uchar far *)strdup(fb.ff_name);
   ;	
	push	ss
	lea	ax,word ptr [bp-16]
	push	ax
	call	far ptr _strdup
	add	sp,4
	les	bx,dword ptr [bp+6]
	mov	si,word ptr es:[bx+10]
	inc	word ptr es:[bx+10]
	shl	si,2
	les	bx,dword ptr [bp+6]
	add	bx,si
	mov	word ptr es:[bx+82],dx
	mov	word ptr es:[bx+80],ax
	push	ss
	lea	ax,word ptr [bp-46]
	push	ax
	call	far ptr _findnext
	add	sp,4
@66@170:
	mov	word ptr [bp-2],ax
	cmp	word ptr [bp-2],0
	je	short @66@114
@66@226:
   ;	
   ;	}
   ;	
	mov	dx,word ptr [bp+8]
	mov	ax,word ptr [bp+6]
	pop	si
	leave	
	ret	
@file_box@$bctr$qnuc	endp
   ;	
   ;	file_box::~file_box()
   ;	
	assume	cs:GUI_TEXT
@file_box@$bdtr$qv	proc	far
	enter	2,0
   ;	
   ;	{
   ;	
	cmp	dword ptr [bp+6],large 0
	je	short @67@226
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx],offset @@file_box@
   ;	
   ;	    int i;
   ;	    for (i = 0; i < field_0A; i++)
   ;	
	mov	word ptr [bp-2],0
	jmp	short @67@142
@67@86:
   ;	
   ;	        farfree(field_50[i]);
   ;	
	mov	ax,word ptr [bp-2]
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	push	word ptr es:[bx+82]
	push	word ptr es:[bx+80]
	call	far ptr _farfree
	add	sp,4
	inc	word ptr [bp-2]
@67@142:
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+10]
	cmp	ax,word ptr [bp-2]
	ja	short @67@86
	push	0
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @gui_item@$bdtr$qv
	add	sp,6
	test	word ptr [bp+10],1
	je	short @67@226
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @$bdele$qnv
	add	sp,4
@67@226:
   ;	
   ;	}
   ;	
	leave	
	ret	
@file_box@$bdtr$qv	endp
   ;	
   ;	uchar far *file_box::current_directory(uchar far *dest)
   ;	
	assume	cs:GUI_TEXT
@file_box@current_directory$qnuc	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    strcpy(dest, "X:\\");
   ;	
	push	ds
	push	offset DGROUP:s@+150
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	call	far ptr _strcpy
	add	sp,8
   ;	
   ;	    dest[0] = getdisk() + 'A';
   ;	
	call	far ptr _getdisk
	add	al,65
	les	bx,dword ptr [bp+10]
	mov	byte ptr es:[bx],al
   ;	
   ;	    getcurdir(0, dest + 3);
   ;	
	mov	ax,word ptr [bp+10]
	add	ax,3
	push	word ptr [bp+12]
	push	ax
	push	0
	call	far ptr _getcurdir
	add	sp,6
   ;	
   ;	    return dest;
   ;	
	mov	dx,word ptr [bp+12]
	mov	ax,word ptr [bp+10]
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@file_box@current_directory$qnuc	endp
   ;	
   ;	void file_box::draw()
   ;	
	assume	cs:GUI_TEXT
@file_box@draw$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    mouse->hide();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@hide$qv
	add	sp,4
   ;	
   ;	    update();
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @file_box@update$qv
	add	sp,4
   ;	
   ;	    draw_arrows();
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @file_box@draw_arrows$qv
	add	sp,4
   ;	
   ;	    display->print_at_xy(field_02 + 2, field_04 - 0xC, field_18, 0);
   ;	
	push	0
	mov	ax,word ptr [bp+6]
	add	ax,24
	push	word ptr [bp+8]
	push	ax
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+4]
	sub	ax,12
	push	ax
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	add	ax,2
	push	ax
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@print_at_xy$qiinucuc
	add	sp,14
   ;	
   ;	    mouse->show();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@show$qv
	add	sp,4
   ;	
   ;	    field_454 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+1108],0
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@file_box@draw$qv	endp
   ;	
   ;	void file_box::update()
   ;	
	assume	cs:GUI_TEXT
@file_box@update$qv	proc	far
	enter	8,0
   ;	
   ;	{
   ;	    uchar far *dest;
   ;	    int y, i;
   ;	    display->fill_rect(field_02, field_04, field_02 + field_08, field_04 + field_06,
   ;	
   ;	
   ;	                       display->field_02, display->field_03, 0);
   ;	
	push	0
	les	bx,dword ptr DGROUP:_display
	mov	al,byte ptr es:[bx+3]
	mov	ah,0
	push	ax
	les	bx,dword ptr DGROUP:_display
	mov	al,byte ptr es:[bx+2]
	mov	ah,0
	push	ax
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+4]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+6]
	push	ax
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+8]
	push	ax
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+4]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+2]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@fill_rect$qiiiiiiuc
	add	sp,18
   ;	
   ;	    y = field_04 + 3;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+4]
	add	ax,3
	mov	word ptr [bp-6],ax
   ;	
   ;	    for (i = field_450; i < field_450 + 0xA; i++) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+1104]
	mov	ah,0
	mov	word ptr [bp-8],ax
	jmp	@70@142
@70@58:
   ;	
   ;	        if (field_0A > i) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+10]
	cmp	ax,word ptr [bp-8]
	jbe	short @70@114
   ;	
   ;	            dest = new uchar[0xF];
   ;	
	push	15
	call	far ptr @$bnew$qui
	pop	cx
	mov	word ptr [bp-2],dx
	mov	word ptr [bp-4],ax
   ;	
   ;	            strnset(dest, 0, 0xE);
   ;	
	push	14
	push	0
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr _strnset
	add	sp,8
   ;	
   ;	            strcpy(dest, field_50[i]);
   ;	
	mov	ax,word ptr [bp-8]
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	push	word ptr es:[bx+82]
	push	word ptr es:[bx+80]
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr _strcpy
	add	sp,8
   ;	
   ;	            display->print_at_xy(field_02 + 2, y, dest, 0);
   ;	
	push	0
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	push	word ptr [bp-6]
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	add	ax,2
	push	ax
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@print_at_xy$qiinucuc
	add	sp,14
   ;	
   ;	            y += 0xC;
   ;	
	add	word ptr [bp-6],12
   ;	
   ;	            delete dest;
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @$bdele$qnv
	add	sp,4
@70@114:
	inc	word ptr [bp-8]
@70@142:
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+1104]
	mov	ah,0
	add	ax,10
	cmp	ax,word ptr [bp-8]
	jle short	@@36
	jmp	@70@58
@@36:
   ;	
   ;	        }
   ;	    }
   ;	}
   ;	
	leave	
	ret	
@file_box@update$qv	endp
   ;	
   ;	void file_box::draw_arrows()
   ;	
	assume	cs:GUI_TEXT
@file_box@draw_arrows$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    field_40 = field_02 + field_08;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+8]
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+64],ax
   ;	
   ;	    field_42 = field_40 + 8;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+64]
	add	ax,8
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+66],ax
   ;	
   ;	    field_44 = field_04 + 1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+4]
	inc	ax
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+68],ax
   ;	
   ;	    field_46 = field_44 + 8;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+68]
	add	ax,8
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+70],ax
   ;	
   ;	    field_48 = field_02 + field_08;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+8]
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+72],ax
   ;	
   ;	    field_4A = field_48 + 8;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+72]
	add	ax,8
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+74],ax
   ;	
   ;	    field_4C = field_04 + field_06 - 8;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+4]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+6]
	sub	ax,8
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+76],ax
   ;	
   ;	    field_4E = field_4C + 7;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+76]
	add	ax,7
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+78],ax
   ;	
   ;	    display->fill_rect(field_02 + field_08 - 1, field_04,
   ;	
   ;	
   ;	                       field_02 + field_08 + 9, field_04 + field_06,
   ;	                       display->field_02, display->field_03, 0);
   ;	
	push	0
	les	bx,dword ptr DGROUP:_display
	mov	al,byte ptr es:[bx+3]
	mov	ah,0
	push	ax
	les	bx,dword ptr DGROUP:_display
	mov	al,byte ptr es:[bx+2]
	mov	ah,0
	push	ax
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+4]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+6]
	push	ax
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+8]
	add	ax,9
	push	ax
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+4]
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+8]
	dec	ax
	push	ax
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@fill_rect$qiiiiiiuc
	add	sp,18
   ;	
   ;	    display->print_at_xy(field_40, field_44, field_3C, 0);
   ;	
	push	0
	mov	ax,word ptr [bp+6]
	add	ax,60
	push	word ptr [bp+8]
	push	ax
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+68]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+64]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@print_at_xy$qiinucuc
	add	sp,14
   ;	
   ;	    display->print_at_xy(field_48, field_4C, field_3A, 0);
   ;	
	push	0
	mov	ax,word ptr [bp+6]
	add	ax,58
	push	word ptr [bp+8]
	push	ax
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+76]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+72]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@print_at_xy$qiinucuc
	add	sp,14
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@file_box@draw_arrows$qv	endp
   ;	
   ;	void file_box::poll_arrows()
   ;	
	assume	cs:GUI_TEXT
@file_box@poll_arrows$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (mouse->pressed_in_box(field_40, field_44, field_42, field_46)) {
   ;	
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+70]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+66]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+68]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+64]
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@pressed_in_box$qiiii
	add	sp,12
	or	al,al
	jne short	@@37
	jmp	@72@198
@@37:
   ;	
   ;	        if (field_450 - 1 > 0) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+1104]
	mov	ah,0
	dec	ax
	jg short	@@38
	jmp	@72@254
@@38:
   ;	
   ;	            if (!field_451) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+1105]
	mov	ah,0
	or	ax,ax
	jne	short @72@142
   ;	
   ;	                mouse->hide();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@hide$qv
	add	sp,4
   ;	
   ;	                high_light(field_40, field_44, field_42, field_46, field_3C, 0, 0, 0);
   ;	
	push	0
	push	0
	push	0
	mov	ax,word ptr [bp+6]
	add	ax,60
	push	word ptr [bp+8]
	push	ax
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+70]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+66]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+68]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+64]
	push	cs
	call	near ptr @high_light$qiiiinuciiuc
	add	sp,18
   ;	
   ;	                mouse->show();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@show$qv
	add	sp,4
@72@142:
   ;	
   ;	            }
   ;	            field_450 -= 2;
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+1104]
	add	al,254
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+1104],al
   ;	
   ;	            update();
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @file_box@update$qv
	add	sp,4
   ;	
   ;	            display->pause(5);
   ;	
	push	5
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@pause$qui
	add	sp,6
   ;	
   ;	            field_451 = 1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+1105],1
   ;	
   ;	            field_3E = -1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+62],-1
	jmp	short @72@254
   ;	
   ;	        }
   ;	    } else if (field_451) {
   ;	
	jmp	short @72@254
@72@198:
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+1105],0
	je	short @72@254
   ;	
   ;	        field_451 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+1105],0
   ;	
   ;	        mouse->hide();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@hide$qv
	add	sp,4
   ;	
   ;	        high_light(field_40, field_44, field_42, field_46, field_3C, 0, 0, 1);
   ;	
	push	1
	push	0
	push	0
	mov	ax,word ptr [bp+6]
	add	ax,60
	push	word ptr [bp+8]
	push	ax
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+70]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+66]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+68]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+64]
	push	cs
	call	near ptr @high_light$qiiiinuciiuc
	add	sp,18
   ;	
   ;	        mouse->show();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@show$qv
	add	sp,4
@72@254:
   ;	
   ;	    }
   ;	    if (mouse->pressed_in_box(field_48, field_4C, field_4A, field_4E)) {
   ;	
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+78]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+74]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+76]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+72]
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@pressed_in_box$qiiii
	add	sp,12
	or	al,al
	jne short	@@39
	jmp	@72@422
@@39:
   ;	
   ;	        if (field_450 + 0xB < field_0A) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+1104]
	mov	ah,0
	add	ax,11
	les	bx,dword ptr [bp+6]
	cmp	ax,word ptr es:[bx+10]
	jb short	@@40
	jmp	@72@478
@@40:
   ;	
   ;	            if (!field_452) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+1106]
	mov	ah,0
	or	ax,ax
	jne	short @72@366
   ;	
   ;	                mouse->hide();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@hide$qv
	add	sp,4
   ;	
   ;	                high_light(field_48, field_4C, field_4A, field_4E, field_3A, 0, 0, 0);
   ;	
	push	0
	push	0
	push	0
	mov	ax,word ptr [bp+6]
	add	ax,58
	push	word ptr [bp+8]
	push	ax
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+78]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+74]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+76]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+72]
	push	cs
	call	near ptr @high_light$qiiiinuciiuc
	add	sp,18
   ;	
   ;	                mouse->show();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@show$qv
	add	sp,4
@72@366:
   ;	
   ;	            }
   ;	            field_450 += 2;
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+1104]
	add	al,2
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+1104],al
   ;	
   ;	            update();
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @file_box@update$qv
	add	sp,4
   ;	
   ;	            display->pause(5);
   ;	
	push	5
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@pause$qui
	add	sp,6
   ;	
   ;	            field_452 = 1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+1106],1
   ;	
   ;	            field_3E = -1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+62],-1
	jmp	short @72@478
   ;	
   ;	        }
   ;	    } else if (field_452) {
   ;	
	jmp	short @72@478
@72@422:
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+1106],0
	je	short @72@478
   ;	
   ;	        field_452 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+1106],0
   ;	
   ;	        mouse->hide();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@hide$qv
	add	sp,4
   ;	
   ;	        high_light(field_48, field_4C, field_4A, field_4E, field_3A, 0, 0, 1);
   ;	
	push	1
	push	0
	push	0
	mov	ax,word ptr [bp+6]
	add	ax,58
	push	word ptr [bp+8]
	push	ax
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+78]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+74]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+76]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+72]
	push	cs
	call	near ptr @high_light$qiiiinuciiuc
	add	sp,18
   ;	
   ;	        mouse->show();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@show$qv
	add	sp,4
@72@478:
   ;	
   ;	    }
   ;	}
   ;	
	pop	bp
	ret	
@file_box@poll_arrows$qv	endp
   ;	
   ;	uchar file_box::poll()
   ;	
	assume	cs:GUI_TEXT
@file_box@poll$qv	proc	far
	enter	18,0
   ;	
   ;	{
   ;	    int i, x1, y1, x2, y2, ox1, oy1, ox2, oy2;
   ;	    if (field_0A == 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+10],0
	jne	short @73@86
@73@58:
   ;	
   ;	        field_36 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	dword ptr es:[bx+54],large 0
	jmp	@73@730
@73@86:
   ;	
   ;	        return 0;
   ;	    }
   ;	    poll_arrows();
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @file_box@poll_arrows$qv
	add	sp,4
   ;	
   ;	    display->pause(1);
   ;	
	push	1
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@pause$qui
	add	sp,6
   ;	
   ;	    if (field_453 > 0)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+1107],0
	jbe	short @73@142
   ;	
   ;	        field_453--;
   ;	
	les	bx,dword ptr [bp+6]
	dec	byte ptr es:[bx+1107]
@73@142:
   ;	
   ;	    for (i = 0; i < 0xA; i++) {
   ;	
	mov	word ptr [bp-2],0
	jmp	@73@618
@73@170:
   ;	
   ;	        if (i > 0xA)
   ;	
	cmp	word ptr [bp-2],10
	jle short	@@41
	jmp	@73@646
@@41:
   ;	
   ;	            break;
   ;	        if (field_0A < i)
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+10]
	cmp	ax,word ptr [bp-2]
	jae short	@@42
	jmp	@73@646
@@42:
   ;	
   ;	            break;
   ;	        x1 = field_02 + 1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	inc	ax
	mov	word ptr [bp-4],ax
   ;	
   ;	        x2 = field_02 + field_08 - 1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+8]
	dec	ax
	mov	word ptr [bp-8],ax
   ;	
   ;	        y1 = field_04 + i * 0xC + 1;
   ;	
	mov	ax,word ptr [bp-2]
	imul	ax,ax,12
	les	bx,dword ptr [bp+6]
	mov	dx,word ptr es:[bx+4]
	add	dx,ax
	inc	dx
	mov	word ptr [bp-6],dx
   ;	
   ;	        y2 = y1 + 0xC;
   ;	
	mov	ax,word ptr [bp-6]
	add	ax,12
	mov	word ptr [bp-10],ax
   ;	
   ;	        if (mouse->pressed_in_box(x1, y1, x2, y2)) {
   ;	
	push	word ptr [bp-10]
	push	word ptr [bp-8]
	push	word ptr [bp-6]
	push	word ptr [bp-4]
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@pressed_in_box$qiiii
	add	sp,12
	or	al,al
	jne short	@@43
	jmp	@73@590
@@43:
   ;	
   ;	            if (field_3E != -1 && field_3E != i && field_0A > i) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+62],-1
	jne short	@@44
	jmp	@73@366
@@44:
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+62]
	cmp	ax,word ptr [bp-2]
	jne short	@@45
	jmp	@73@366
@@45:
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+10]
	cmp	ax,word ptr [bp-2]
	ja short	@@46
	jmp	@73@366
@@46:
   ;	
   ;	                mouse->hide();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@hide$qv
	add	sp,4
   ;	
   ;	                ox1 = x1;
   ;	
	mov	ax,word ptr [bp-4]
	mov	word ptr [bp-12],ax
   ;	
   ;	                ox2 = x2;
   ;	
	mov	ax,word ptr [bp-8]
	mov	word ptr [bp-16],ax
   ;	
   ;	                oy1 = field_04 + field_3E * 0xC + 1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+62]
	imul	ax,ax,12
	les	bx,dword ptr [bp+6]
	mov	dx,word ptr es:[bx+4]
	add	dx,ax
	inc	dx
	mov	word ptr [bp-14],dx
   ;	
   ;	                oy2 = oy1 + 0xC;
   ;	
	mov	ax,word ptr [bp-14]
	add	ax,12
	mov	word ptr [bp-18],ax
   ;	
   ;	                high_light(ox1, oy1, ox2, oy2, field_50[field_3E + field_450], 1, 2, 1);
   ;	
	push	1
	push	2
	push	1
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+1104]
	mov	ah,0
	les	bx,dword ptr [bp+6]
	mov	dx,word ptr es:[bx+62]
	add	dx,ax
	shl	dx,2
	les	bx,dword ptr [bp+6]
	add	bx,dx
	push	word ptr es:[bx+82]
	push	word ptr es:[bx+80]
	push	word ptr [bp-18]
	push	word ptr [bp-16]
	push	word ptr [bp-14]
	push	word ptr [bp-12]
	push	cs
	call	near ptr @high_light$qiiiinuciiuc
	add	sp,18
   ;	
   ;	                mouse->show();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@show$qv
	add	sp,4
@73@366:
   ;	
   ;	            }
   ;	            if (field_3E != i && field_0A > i) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+62]
	cmp	ax,word ptr [bp-2]
	jne short	@@47
	jmp	@73@450
@@47:
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+10]
	cmp	ax,word ptr [bp-2]
	jbe	short @73@450
   ;	
   ;	                mouse->hide();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@hide$qv
	add	sp,4
   ;	
   ;	                field_3E = i;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp-2]
	mov	word ptr es:[bx+62],ax
   ;	
   ;	                high_light(x1, y1, x2, y2, field_50[i + field_450], 1, 2, 0);
   ;	
	push	0
	push	2
	push	1
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+1104]
	mov	ah,0
	mov	dx,word ptr [bp-2]
	add	dx,ax
	shl	dx,2
	les	bx,dword ptr [bp+6]
	add	bx,dx
	push	word ptr es:[bx+82]
	push	word ptr es:[bx+80]
	push	word ptr [bp-10]
	push	word ptr [bp-8]
	push	word ptr [bp-6]
	push	word ptr [bp-4]
	push	cs
	call	near ptr @high_light$qiiiinuciiuc
	add	sp,18
   ;	
   ;	                mouse->show();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@show$qv
	add	sp,4
   ;	
   ;	                mouse->field_01 = 0;
   ;	
	les	bx,dword ptr DGROUP:_mouse
	mov	byte ptr es:[bx+1],0
   ;	
   ;	                field_453 = 0x19;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+1107],25
@73@450:
   ;	
   ;	            }
   ;	            if (field_3E == i && mouse->field_01 != 0) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+62]
	cmp	ax,word ptr [bp-2]
	jne	short @73@590
	les	bx,dword ptr DGROUP:_mouse
	cmp	byte ptr es:[bx+1],0
	je	short @73@590
   ;	
   ;	                if (field_453 != 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+1107],0
	je	short @73@562
   ;	
   ;	                    field_454 = 1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+1108],1
   ;	
   ;	                    return 1;
   ;	
	mov	al,1
	jmp	short @73@758
@73@562:
   ;	
   ;	                }
   ;	                mouse->field_01 = 0;
   ;	
	les	bx,dword ptr DGROUP:_mouse
	mov	byte ptr es:[bx+1],0
   ;	
   ;	                field_453 = 0x19;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+1107],25
@73@590:
	inc	word ptr [bp-2]
@73@618:
	cmp	word ptr [bp-2],10
	jge short	@@48
	jmp	@73@170
@@48:
@73@646:
   ;	
   ;	            }
   ;	        }
   ;	    }
   ;	    if (field_3E == -1)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+62],-1
	jne	short @73@702
	jmp	@73@58
@73@702:
   ;	
   ;	        field_36 = 0;
   ;	    else
   ;	        field_36 = field_50[field_450 + field_3E];
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+1104]
	mov	ah,0
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+62]
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	mov	ax,word ptr es:[bx+82]
	mov	dx,word ptr es:[bx+80]
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+56],ax
	mov	word ptr es:[bx+54],dx
@73@730:
   ;	
   ;	    return 0;
   ;	
	mov	al,0
@73@758:
   ;	
   ;	}
   ;	
	leave	
	ret	
@file_box@poll$qv	endp
   ;	
   ;	text_pager::text_pager(uchar far *path, uchar arg_8, void (far *cb)(uchar)) : gui_item()
   ;	
	assume	cs:GUI_TEXT
@text_pager@$bctr$qnucucnquc$v	proc	far
	enter	18,0
	cmp	dword ptr [bp+6],large 0
	jne	short @74@86
	push	20
	call	far ptr @$bnew$qui
	pop	cx
	mov	word ptr [bp+8],dx
	mov	word ptr [bp+6],ax
	or	ax,dx
	jne short	@@49
	jmp	@74@1486
@@49:
@74@86:
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @gui_item@$bctr$qv
	add	sp,4
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx],offset @@text_pager@
   ;	
   ;	{
   ;	    button far *block, far *var_E;
   ;	    uchar var_A, buf;
   ;	    int var_8, var_6, var_4, var_2;
   ;	    if ((long)g_open_element(path) == -1L)
   ;	
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	call	far ptr @g_open_element$qnuc
	add	sp,4
	push	dx
	push	ax
	pop	eax
	cmp	eax,large -1
	jne	short @74@142
   ;	
   ;	        read_error(path);
   ;	
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	call	far ptr @read_error$qnuc
	add	sp,4
@74@142:
   ;	
   ;	    var_6 = 0;
   ;	
	mov	word ptr [bp-14],0
   ;	
   ;	    field_13 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+19],0
@74@170:
   ;	
   ;	    for (;;) {
   ;	        if (arg_8 == 0)
   ;	
	cmp	byte ptr [bp+14],0
	jne	short @74@226
   ;	
   ;	            display->blank_palette();
   ;	
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@blank_palette$qv
	jmp	short @74@254
@74@226:
   ;	
   ;	        else
   ;	            display->fade_down();
   ;	
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@fade_down$qv
@74@254:
	add	sp,4
   ;	
   ;	        var_4 = 5;
   ;	
	mov	word ptr [bp-16],5
   ;	
   ;	        var_2 = 5;
   ;	
	mov	word ptr [bp-18],5
   ;	
   ;	        if (cb != 0)
   ;	
	cmp	dword ptr [bp+16],large 0
	je	short @74@338
   ;	
   ;	            (*cb)(var_6);
   ;	
	mov	al,byte ptr [bp-14]
	push	ax
	call	dword ptr [bp+16]
	pop	cx
	jmp	short @74@366
@74@338:
   ;	
   ;	        else
   ;	            display->cls(display->field_02, 0);
   ;	
	push	0
	les	bx,dword ptr DGROUP:_display
	mov	al,byte ptr es:[bx+2]
	push	ax
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@cls$qucuc
	add	sp,8
@74@366:
   ;	
   ;	        var_8 = 0;
   ;	
	mov	word ptr [bp-12],0
	jmp	@74@562
@74@394:
   ;	
   ;	        while (var_8 < 0x13) {
   ;	            memset(_tmp, 0, 0x64);
   ;	
	push	100
	push	0
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _memset
	add	sp,8
   ;	
   ;	            var_A = 0;
   ;	
	mov	byte ptr [bp-9],0
   ;	
   ;	            if (g_element_read(&buf, 1) != 1)
   ;	
	push	1
	push	ss
	lea	ax,word ptr [bp-10]
	push	ax
	call	far ptr @g_element_read$qnvui
	push	dx
	push	ax
	pop	eax
	add	sp,6
	cmp	eax,large 1
	je	short @74@506
   ;	
   ;	                goto last_page;
   ;	
	jmp	@74@1178
	jmp	short @74@506
@74@478:
   ;	
   ;	            while (buf != 0x0A) {
   ;	                _tmp[var_A++] = buf;
   ;	
	mov	al,byte ptr [bp-9]
	mov	ah,0
	mov	dl,byte ptr [bp-10]
	mov	bx,ax
	mov	byte ptr DGROUP:__tmp[bx],dl
	inc	byte ptr [bp-9]
   ;	
   ;	                if (g_element_read(&buf, 1) != 1)
   ;	
	push	1
	push	ss
	lea	ax,word ptr [bp-10]
	push	ax
	call	far ptr @g_element_read$qnvui
	push	dx
	push	ax
	pop	eax
	add	sp,6
	cmp	eax,large 1
	je short	@@50
	jmp	@74@1178
@@50:
@74@506:
	cmp	byte ptr [bp-10],10
	jne	short @74@478
   ;	
   ;	                    goto last_page;
   ;	            }
   ;	            _tmp[strlen(_tmp) - 1] = 0;
   ;	
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _strlen
	add	sp,4
	dec	ax
	mov	bx,ax
	mov	byte ptr DGROUP:__tmp[bx],0
   ;	
   ;	            display->print_at_xy(var_2, var_4, _tmp, 0);
   ;	
	push	0
	push	ds
	push	offset DGROUP:__tmp
	push	word ptr [bp-16]
	push	word ptr [bp-18]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@print_at_xy$qiinucuc
	add	sp,14
   ;	
   ;	            var_4 += 0xA;
   ;	
	add	word ptr [bp-16],10
   ;	
   ;	            var_8++;
   ;	
	inc	word ptr [bp-12]
@74@562:
	cmp	word ptr [bp-12],19
	jge short	@@51
	jmp	@74@394
@@51:
   ;	
   ;	        }
   ;	        block = new button((uchar far *)"More >>", 0, 0);
   ;	
	push	0
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+154
	push	0
	push	0
	push	cs
	call	near ptr @button@$bctr$qnucnvuc
	add	sp,14
	mov	word ptr [bp-2],dx
	mov	word ptr [bp-4],ax
   ;	
   ;	        var_E = new button((uchar far *)"Exit", 0, 0);
   ;	
	push	0
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+162
	push	0
	push	0
	push	cs
	call	near ptr @button@$bctr$qnucnvuc
	add	sp,14
	mov	word ptr [bp-6],dx
	mov	word ptr [bp-8],ax
   ;	
   ;	        block->field_18 = 0xE6;
   ;	
	les	bx,dword ptr [bp-4]
	mov	word ptr es:[bx+24],230
   ;	
   ;	        var_E->field_18 = 0xA0;
   ;	
	les	bx,dword ptr [bp-8]
	mov	word ptr es:[bx+24],160
   ;	
   ;	        block->field_1A = var_E->field_1A = 0xB7;
   ;	
	les	bx,dword ptr [bp-8]
	mov	ax,183
	mov	word ptr es:[bx+26],ax
	les	bx,dword ptr [bp-4]
	mov	word ptr es:[bx+26],ax
   ;	
   ;	        block->draw();
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	les	bx,dword ptr [bp-4]
	mov	bx,word ptr es:[bx]
	call	dword ptr [bx]
	add	sp,4
   ;	
   ;	        var_E->draw();
   ;	
	push	word ptr [bp-6]
	push	word ptr [bp-8]
	les	bx,dword ptr [bp-8]
	mov	bx,word ptr es:[bx]
	call	dword ptr [bx]
	add	sp,4
   ;	
   ;	        block->mouse_to_me();
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	push	cs
	call	near ptr @button@mouse_to_me$qv
	add	sp,4
   ;	
   ;	        if (arg_8 == 0)
   ;	
	cmp	byte ptr [bp+14],0
	jne	short @74@646
   ;	
   ;	            display->set_palette();
   ;	
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@set_palette$qv
	jmp	short @74@674
@74@646:
   ;	
   ;	        else
   ;	            display->fade_up();
   ;	
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@fade_up$qv
@74@674:
	add	sp,4
   ;	
   ;	        mouse->show();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@show$qv
	add	sp,4
@74@730:
   ;	
   ;	        while (mouse->field_00 != 0 || gr_keys[57] != 0 || gr_keys[28] != 0)
   ;	
	les	bx,dword ptr DGROUP:_mouse
	cmp	byte ptr es:[bx],0
	jne	short @74@730
	cmp	byte ptr DGROUP:_gr_keys+57,0
	jne	short @74@730
	cmp	byte ptr DGROUP:_gr_keys+28,0
	jne	short @74@730
@74@814:
   ;	
   ;	            ;
   ;	        for (;;) {
   ;	            if (var_E->poll()) {
   ;	
	push	word ptr [bp-6]
	push	word ptr [bp-8]
	les	bx,dword ptr [bp-8]
	mov	bx,word ptr es:[bx]
	call	dword ptr [bx+8]
	add	sp,4
	or	al,al
	je	short @74@870
   ;	
   ;	                delete block;
   ;	
	push	3
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @button@$bdtr$qv
	add	sp,6
   ;	
   ;	                delete var_E;
   ;	
	push	3
	push	word ptr [bp-6]
	push	word ptr [bp-8]
	call	far ptr @button@$bdtr$qv
	add	sp,6
   ;	
   ;	                mouse->hide();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@hide$qv
	add	sp,4
	jmp	@74@1458
@74@870:
   ;	
   ;	                goto done;
   ;	            }
   ;	            if (block->poll()) {
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	les	bx,dword ptr [bp-4]
	mov	bx,word ptr es:[bx]
	call	dword ptr [bx+8]
	add	sp,4
	or	al,al
	je	short @74@926
   ;	
   ;	                mouse->hide();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@hide$qv
	add	sp,4
   ;	
   ;	                delete block;
   ;	
	push	3
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @button@$bdtr$qv
	add	sp,6
   ;	
   ;	                delete var_E;
   ;	
	push	3
	push	word ptr [bp-6]
	push	word ptr [bp-8]
	call	far ptr @button@$bdtr$qv
	add	sp,6
   ;	
   ;	                var_6++;
   ;	
	inc	word ptr [bp-14]
   ;	
   ;	                break;              /* next page */
   ;	
	jmp	@74@170
@74@926:
   ;	
   ;	            }
   ;	            if (i_external_left) {
   ;	
	cmp	dword ptr DGROUP:_i_external_left,large 0
	jne short	@@52
	jmp	@74@814
@@52:
   ;	
   ;	                if (i_external_left() && field_13 != 1) {
   ;	
	call	dword ptr DGROUP:_i_external_left
	or	al,al
	je	short @74@1038
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+19],1
	je	short @74@1038
   ;	
   ;	                    field_13++;
   ;	
	les	bx,dword ptr [bp+6]
	inc	byte ptr es:[bx+19]
   ;	
   ;	                    (&block)[field_13]->mouse_to_me();
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+19]
	mov	ah,0
	shl	ax,2
	lea	dx,word ptr [bp-4]
	add	ax,dx
	mov	bx,ax
	push	word ptr ss:[bx+2]
	push	word ptr ss:[bx]
	push	cs
	call	near ptr @button@mouse_to_me$qv
	add	sp,4
   ;	
   ;	                    display->pause(0xF);
   ;	
	push	15
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@pause$qui
	add	sp,6
@74@1038:
   ;	
   ;	                }
   ;	                if (i_external_right() && field_13 != 0) {
   ;	
	call	dword ptr DGROUP:_i_external_right
	or	al,al
	jne short	@@53
	jmp	@74@814
@@53:
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+19],0
	jne short	@@54
	jmp	@74@814
@@54:
   ;	
   ;	                    field_13--;
   ;	
	les	bx,dword ptr [bp+6]
	dec	byte ptr es:[bx+19]
   ;	
   ;	                    (&block)[field_13]->mouse_to_me();
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+19]
	mov	ah,0
	shl	ax,2
	lea	dx,word ptr [bp-4]
	add	ax,dx
	mov	bx,ax
	push	word ptr ss:[bx+2]
	push	word ptr ss:[bx]
	push	cs
	call	near ptr @button@mouse_to_me$qv
	add	sp,4
   ;	
   ;	                    display->pause(0xF);
   ;	
	push	15
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@pause$qui
	add	sp,6
	jmp	@74@814
	jmp	@74@814
	jmp	@74@170
@74@1178:
   ;	
   ;	                }
   ;	            }
   ;	        }
   ;	    }
   ;	last_page:
   ;	    block = new button((uchar far *)"Done", 0, 0);
   ;	
	push	0
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+167
	push	0
	push	0
	push	cs
	call	near ptr @button@$bctr$qnucnvuc
	add	sp,14
	mov	word ptr [bp-2],dx
	mov	word ptr [bp-4],ax
   ;	
   ;	    block->field_18 = 0xE6;
   ;	
	les	bx,dword ptr [bp-4]
	mov	word ptr es:[bx+24],230
   ;	
   ;	    block->field_1A = 0xB8;
   ;	
	les	bx,dword ptr [bp-4]
	mov	word ptr es:[bx+26],184
   ;	
   ;	    block->draw();
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	les	bx,dword ptr [bp-4]
	mov	bx,word ptr es:[bx]
	call	dword ptr [bx]
	add	sp,4
   ;	
   ;	    if (arg_8 == 0)
   ;	
	cmp	byte ptr [bp+14],0
	jne	short @74@1234
   ;	
   ;	        display->set_palette();
   ;	
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@set_palette$qv
	jmp	short @74@1262
@74@1234:
   ;	
   ;	    else
   ;	        display->fade_up();
   ;	
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@fade_up$qv
@74@1262:
	add	sp,4
   ;	
   ;	    mouse->show();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@show$qv
	add	sp,4
@74@1318:
   ;	
   ;	    while (mouse->field_00 != 0 || gr_keys[57] != 0 || gr_keys[28] != 0)
   ;	
	les	bx,dword ptr DGROUP:_mouse
	cmp	byte ptr es:[bx],0
	jne	short @74@1318
	cmp	byte ptr DGROUP:_gr_keys+57,0
	jne	short @74@1318
	cmp	byte ptr DGROUP:_gr_keys+28,0
	jne	short @74@1318
@74@1402:
   ;	
   ;	        ;
   ;	    while ((int)block->poll() == 0)
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	les	bx,dword ptr [bp-4]
	mov	bx,word ptr es:[bx]
	call	dword ptr [bx+8]
	add	sp,4
	or	al,al
	je	short @74@1402
   ;	
   ;	        ;
   ;	    mouse->hide();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	push	cs
	call	near ptr @ms_mouse@hide$qv
	add	sp,4
   ;	
   ;	    delete block;
   ;	
	push	3
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @button@$bdtr$qv
	add	sp,6
@74@1458:
   ;	
   ;	done:
   ;	    g_close_element();
   ;	
	call	far ptr @g_close_element$qv
@74@1486:
   ;	
   ;	}
   ;	
	mov	dx,word ptr [bp+8]
	mov	ax,word ptr [bp+6]
	leave	
	ret	
@text_pager@$bctr$qnucucnquc$v	endp
   ;	
   ;	text_pager::~text_pager()
   ;	
	assume	cs:GUI_TEXT
@text_pager@$bdtr$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	
	cmp	dword ptr [bp+6],large 0
	je	short @75@142
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx],offset @@text_pager@
	push	0
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @gui_item@$bdtr$qv
	add	sp,6
	test	word ptr [bp+10],1
	je	short @75@142
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @$bdele$qnv
	add	sp,4
@75@142:
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@text_pager@$bdtr$qv	endp
GUI_TEXT	ends
_DATA	segment word public use16 'DATA'
@text_pager@	segment	virtual
@@text_pager@	label	byte
	dd	@gui_item@draw$qv
	dd	@gui_item@erase$qv
@text_pager@	ends
_DATA	ends
_DATA	segment word public use16 'DATA'
@file_box@	segment	virtual
@@file_box@	label	byte
	dd	@file_box@draw$qv
	dd	@gui_item@erase$qv
	dd	@file_box@poll$qv
@file_box@	ends
_DATA	ends
_DATA	segment word public use16 'DATA'
@prompt_box@	segment	virtual
@@prompt_box@	label	byte
	dd	@prompt_box@draw$qv
	dd	@gui_item@erase$qv
	dd	@prompt_box@poll$qv
@prompt_box@	ends
_DATA	ends
_DATA	segment word public use16 'DATA'
@text_box@	segment	virtual
@@text_box@	label	byte
	dd	@text_box@draw$qv
	dd	@text_box@erase$qv
	dd	@text_box@poll$qv
@text_box@	ends
_DATA	ends
_DATA	segment word public use16 'DATA'
@button@	segment	virtual
@@button@	label	byte
	dd	@button@draw$qv
	dd	@gui_item@erase$qv
	dd	@button@poll$qv
@button@	ends
_DATA	ends
_DATA	segment word public use16 'DATA'
@menu_bar@	segment	virtual
@@menu_bar@	label	byte
	dd	@menu_bar@draw$qv
	dd	@menu_bar@erase$qv
	dd	@menu_bar@poll$qv
@menu_bar@	ends
_DATA	ends
_DATA	segment word public use16 'DATA'
@pull_down@	segment	virtual
@@pull_down@	label	byte
	dd	@pull_down@draw$qv
	dd	@gui_item@erase$qv
	dd	@pull_down@poll$qv
	dd	@@pull_down@$bdtr$qv
@pull_down@	ends
_DATA	ends
_DATA	segment word public use16 'DATA'
@gui_item@	segment	virtual
@@gui_item@	label	byte
	dd	@gui_item@draw$qv
	dd	@gui_item@erase$qv
@gui_item@	ends
_DATA	ends
GUI_TEXT	segment byte public use16 'CODE'
@pull_down@$bdtr$qv	segment	virtual
	assume	cs:@pull_down@$bdtr$qv
@@pull_down@$bdtr$qv	proc	far
	push	bp
	mov	bp,sp
	cmp	dword ptr [bp+6],large 0
	je	short @76@170
	push	0
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @gui_item@$bdtr$qv
	add	sp,6
	test	word ptr [bp+10],1
	je	short @76@114
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @$bdele$qnv
	add	sp,4
	jmp	short @76@170
@76@114:
	jmp	short @76@170
	jmp	short @76@170
@76@170:
	pop	bp
	ret	
@@pull_down@$bdtr$qv	endp
	?debug	C E9
	?debug	C FA00000000
@pull_down@$bdtr$qv	ends
GUI_TEXT	ends
_DATA	segment word public use16 'DATA'
s@	label	byte
	db	'This feature has not'
	db	10
	db	'been implemented yet.'
	db	0
	db	'Open File'
	db	0
	db	'Cancel'
	db	0
	db	'Ok'
	db	0
	db	'Cd'
	db	0
	db	'Change Directory'
	db	0
	db	'Enter new path:'
	db	0
	db	'Not a valid path.'
	db	0
	db	'No'
	db	0
	db	'Yes'
	db	0
	db	'Cancel'
	db	0
	db	'Ok'
	db	0
	db	'Ok'
	db	0
	db	'Text Box'
	db	0
	db	'_'
	db	0
	db	'\'
	db	0
	db	'X:\'
	db	0
	db	'More >>'
	db	0
	db	'Exit'
	db	0
	db	'Done'
	db	0
_DATA	ends
GUI_TEXT	segment byte public use16 'CODE'
GUI_TEXT	ends
	public	@erase_mouse$qv
	public	@draw_mouse$qv
	public	@mouse_handler$qv
	public	@i_load_file$qnuct1
	public	@i_get_string$qnuct1
	public	@i_hide_box$quc
	public	@high_light$qiiiinuciiuc
	public	@draw_shadow_box$qiiii
	public	@release_box_strings$qn8text_box
	public	@parse_box_string$qn8text_boxnuc
	public	@i_no_imp$qv
	public	@i_show_box$qnuciit1t1
	public	@i_get_int$qnuct1
	public	@i_inform$qnucuct1
	public	@i_poll_interface$qv
	public	@i_set_text$qucucucuc
	public	@i_init_interface$qnvt1t1t1t1
	extrn	@no_heap$qnuc:far
	extrn	@g_close_element$qv:far
	extrn	@g_element_read$qnvui:far
	extrn	@g_open_element$qnuc:far
	extrn	@read_error$qnuc:far
	public	@i_yes_cancel$qnucuc
	extrn	@atoi$qnxuc:far
	extrn	_default_mouse:byte
	extrn	__m_dont_handle:byte
	extrn	_byte_2D3AC:byte
	extrn	__tmp:byte
	extrn	_disable_exit_routine:byte
	extrn	_i_external_button:dword
	extrn	_i_external_down:dword
	extrn	_i_external_up:dword
	extrn	_i_external_right:dword
	extrn	_i_external_left:dword
	extrn	_maximum_text_length:byte
	extrn	_show_box:dword
	extrn	_menu_bar_height:byte
	extrn	_show_box_on:word
	extrn	_pd_redraws:byte
	extrn	_gr_keys:byte
	extrn	_the_menu_bar:dword
	extrn	_mouse:dword
	extrn	_display:dword
	public	@text_pager@$bdtr$qv
	public	@text_pager@$bctr$qnucucnquc$v
	public	@file_box@poll$qv
	public	@file_box@poll_arrows$qv
	public	@file_box@draw_arrows$qv
	public	@file_box@update$qv
	public	@file_box@draw$qv
	public	@file_box@current_directory$qnuc
	public	@file_box@$bdtr$qv
	public	@file_box@$bctr$qnuc
	public	@prompt_box@update_text$qnuc
	public	@prompt_box@poll$qv
	public	@prompt_box@draw$qv
	public	@prompt_box@$bdtr$qv
	public	@prompt_box@$bctr$qnuc
	public	@text_box@add_button$qnucnv
	public	@text_box@add_file_box$qnuc
	public	@text_box@add_string$qnuc
	public	@text_box@add_bitmap$qiinuc
	public	@text_box@poll$qv
	public	@text_box@erase$qv
	public	@text_box@draw$qv
	public	@text_box@$bdtr$qv
	public	@text_box@$bctr$qnuc
	public	@button@mouse_to_me$qv
	public	@button@poll$qv
	public	@button@draw$qv
	extrn	@button@$bdtr$qv:far
	public	@button@$bctr$qnucnvuc
	public	@menu_bar@toggle_item$qnuct1uc
	public	@menu_bar@poll$qv
	public	@menu_bar@erase$qv
	public	@menu_bar@draw$qv
	public	@menu_bar@add_item$qn9pull_down
	public	@menu_bar@$bctr$qv
	public	@pull_down@poll$qv
	public	@pull_down@decrease_cur_selection$qv
	public	@pull_down@increase_cur_selection$qv
	public	@pull_down@get_mouse_sel_location$qv
	public	@pull_down@erase_cur_selection$qv
	public	@pull_down@update_cur_selection$qv
	public	@pull_down@activate$qv
	public	@pull_down@draw$qv
	public	@pull_down@add_item$qnucnv
	public	@pull_down@$bctr$qnuc
	extrn	@gui_item@erase$qv:far
	extrn	@gui_item@draw$qv:far
	extrn	@gui_item@$bdtr$qv:far
	public	@gui_item@$bctr$qv
	public	@ms_mouse@get_status$qv
	public	@ms_mouse@doit$qv
	public	@ms_mouse@pressed_in_box$qiiii
	public	@ms_mouse@in_box$qiiii
	public	@ms_mouse@button_press$quc
	public	@ms_mouse@hide$qv
	public	@ms_mouse@show$qv
	public	@ms_mouse@set_coords$qii
	public	@ms_mouse@get_event$qv
	public	@ms_mouse@set_cursor$qnucii
	public	@ms_mouse@$bdtr$qv
	public	@ms_mouse@$bctr$qv
	extrn	@vga_display@put_bits_masked$qiiiinucuiuiuc:far
	extrn	@vga_display@put_bits$qiiiinucuiui:far
	extrn	@vga_display@copy_bits$qiiiiiiuiuiuiui:far
	extrn	@vga_display@get_bits$qiiii:far
	extrn	@vga_display@cls$qucuc:far
	extrn	@vga_display@fill_rect$qiiiiiiuc:far
	extrn	@vga_display@print_at_xy$qiinucuc:far
	extrn	@vga_display@set_palette$qv:far
	extrn	@vga_display@fade_down$qv:far
	extrn	@vga_display@fade_up$qv:far
	extrn	@vga_display@blank_palette$qv:far
	extrn	@vga_display@pause$qui:far
	extrn	_getdisk:far
	extrn	_getcurdir:far
	extrn	_findnext:far
	extrn	_findfirst:far
	extrn	_chdir:far
	extrn	_farfree:far
	extrn	_kbhit:far
	extrn	_getch:far
_pokeb	equ	pokeb
_poke	equ	poke
_peekb	equ	peekb
_peek	equ	peek
	extrn	_intr:far
	extrn	_int86:far
	extrn	_strnset:far
	extrn	_strdup:far
	extrn	_strncpy:far
	extrn	_strlen:far
	extrn	_strcpy:far
	extrn	_strcmp:far
	extrn	_strcat:far
	extrn	_memset:far
	extrn	@$bdele$qnv:far
	extrn	@$bnew$qui:far
_s@	equ	s@
	end
