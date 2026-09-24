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
	?debug	S "util.cpp"
	?debug	C E92050385D087574696C2E637070
	?debug	C E92050385D09726970746964652E68
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
UTIL_TEXT	segment byte public use16 'CODE'
UTIL_TEXT	ends
DGROUP	group	_DATA,_BSS
	assume	cs:UTIL_TEXT,ds:DGROUP
_DATA	segment word public use16 'DATA'
d@	label	byte
d@w	label	word
_DATA	ends
_BSS	segment word public use16 'BSS'
b@	label	byte
b@w	label	word
_BSS	ends
_DATA	segment word public use16 'DATA'
_g_handle	label	word
	db	255
	db	255
_external_open	label	dword
	db	0
	db	0
	db	0
	db	0
_external_read	label	dword
	db	0
	db	0
	db	0
	db	0
_DATA	ends
UTIL_TEXT	segment byte public use16 'CODE'
   ;	
   ;	void beep(void)
   ;	
	assume	cs:UTIL_TEXT
@beep$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    sound(400);
   ;	
	push	400
	call	far ptr _sound
	pop	cx
   ;	
   ;	    delay(100);
   ;	
	push	100
	call	far ptr _delay
	pop	cx
   ;	
   ;	    nosound();
   ;	
	call	far ptr _nosound
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@beep$qv	endp
   ;	
   ;	void terminate(uchar far *a, uchar far *b)
   ;	
	assume	cs:UTIL_TEXT
@terminate$qnuct1	proc	far
	enter	16,0
   ;	
   ;	{
   ;	    union REGS regs;
   ;	
   ;	    regs.x.ax = 3;                                /* BIOS mode 3 — text */
   ;	
	mov	word ptr [bp-16],3
   ;	
   ;	    int86(0x10, &regs, &regs);
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
   ;	    if (b)
   ;	
	cmp	dword ptr [bp+10],large 0
	je	short @2@86
   ;	
   ;	        printf("%s %s\n", a, b);
   ;	
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	ds
	push	offset DGROUP:s@
	call	far ptr _printf
	add	sp,12
	jmp	short @2@114
@2@86:
   ;	
   ;	    else
   ;	        printf("%s\n", a);
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	ds
	push	offset DGROUP:s@+7
	call	far ptr _printf
	add	sp,8
@2@114:
   ;	
   ;	    gr_end_kbd_grab();
   ;	
	call	far ptr _gr_end_kbd_grab
   ;	
   ;	    exit(1);
   ;	
	push	1
	call	far ptr _exit
	pop	cx
   ;	
   ;	}
   ;	
	leave	
	ret	
@terminate$qnuct1	endp
   ;	
   ;	void pause(uint n)
   ;	
	assume	cs:UTIL_TEXT
@pause$qui	proc	far
	push	bp
	mov	bp,sp
	jmp	short @3@114
@3@58:
   ;	
   ;	{
   ;	    while (n--) {
   ;	        while (inportb(0x3DA) & 8)  ;             /* wait for vsync to clear */
   ;	
	mov	dx,986
	in	al,dx
	mov	ah,0
	test	ax,8
	jne	short @3@58
@3@86:
   ;	
   ;	        while (!(inportb(0x3DA) & 8));            /* wait for vsync to start */
   ;	
	mov	dx,986
	in	al,dx
	mov	ah,0
	test	ax,8
	je	short @3@86
@3@114:
	mov	ax,word ptr [bp+6]
	dec	word ptr [bp+6]
	or	ax,ax
	jne	short @3@58
   ;	
   ;	    }
   ;	}
   ;	
	pop	bp
	ret	
@pause$qui	endp
   ;	
   ;	byte request_mem(ulong size)
   ;	
	assume	cs:UTIL_TEXT
@request_mem$qul	proc	far
	enter	4,0
   ;	
   ;	{
   ;	    ulong avail;
   ;	
   ;	    avail = coreleft();
   ;	
	call	far ptr _coreleft
	push	dx
	push	ax
	pop	eax
	mov	dword ptr [bp-4],eax
   ;	
   ;	    return size <= avail;
   ;	
	mov	eax,dword ptr [bp+6]
	cmp	eax,dword ptr [bp-4]
	ja	short @4@86
	mov	ax,1
	jmp	short @4@114
@4@86:
	xor	ax,ax
@4@114:
   ;	
   ;	}
   ;	
	leave	
	ret	
@request_mem$qul	endp
   ;	
   ;	void no_heap(uchar far *path)     { terminate((uchar far *)"Out of heap : ", path); }
   ;	
	assume	cs:UTIL_TEXT
@no_heap$qnuc	proc	far
	push	bp
	mov	bp,sp
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	ds
	push	offset DGROUP:s@+11
	push	cs
	call	near ptr @terminate$qnuct1
	add	sp,8
	pop	bp
	ret	
@no_heap$qnuc	endp
   ;	
   ;	void read_error(uchar far *path)  { terminate((uchar far *)"Read error : ", path); }
   ;	
	assume	cs:UTIL_TEXT
@read_error$qnuc	proc	far
	push	bp
	mov	bp,sp
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	ds
	push	offset DGROUP:s@+26
	push	cs
	call	near ptr @terminate$qnuct1
	add	sp,8
	pop	bp
	ret	
@read_error$qnuc	endp
   ;	
   ;	void write_error(uchar far *path) { terminate((uchar far *)"Write error : ", path); }
   ;	
	assume	cs:UTIL_TEXT
@write_error$qnuc	proc	far
	push	bp
	mov	bp,sp
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	ds
	push	offset DGROUP:s@+40
	push	cs
	call	near ptr @terminate$qnuct1
	add	sp,8
	pop	bp
	ret	
@write_error$qnuc	endp
   ;	
   ;	void set_external_open(void far *fn)
   ;	
	assume	cs:UTIL_TEXT
@set_external_open$qnv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    external_open = (long far (*)(uchar far *))fn;
   ;	
	mov	eax,dword ptr [bp+6]
	mov	dword ptr DGROUP:_external_open,eax
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@set_external_open$qnv	endp
   ;	
   ;	void set_external_read(void far *fn)
   ;	
	assume	cs:UTIL_TEXT
@set_external_read$qnv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    external_read = (long far (*)(void far *, uint))fn;
   ;	
	mov	eax,dword ptr [bp+6]
	mov	dword ptr DGROUP:_external_read,eax
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@set_external_read$qnv	endp
   ;	
   ;	long g_open_element(uchar far *path)
   ;	
	assume	cs:UTIL_TEXT
@g_open_element$qnuc	proc	far
	enter	4,0
   ;	
   ;	{
   ;	    long res;
   ;	
   ;	    if (external_open)
   ;	
	cmp	dword ptr DGROUP:_external_open,large 0
	je	short @10@86
   ;	
   ;	        return external_open(path);
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	dword ptr DGROUP:_external_open
	add	sp,4
	jmp	short @10@254
@10@86:
   ;	
   ;	    if (g_handle != -1)
   ;	
	cmp	word ptr DGROUP:_g_handle,-1
	je	short @10@142
   ;	
   ;	        terminate((uchar far *)"Request to open more than one element.", 0);
   ;	
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+55
	push	cs
	call	near ptr @terminate$qnuct1
	add	sp,8
@10@142:
   ;	
   ;	    g_handle = open(path, 0x8001);
   ;	
	push	-32767
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr _open
	add	sp,6
	mov	word ptr DGROUP:_g_handle,ax
   ;	
   ;	    if (g_handle == -1)
   ;	
	cmp	word ptr DGROUP:_g_handle,-1
	jne	short @10@198
   ;	
   ;	        res = -1;
   ;	
	mov	dword ptr [bp-4],large -1
	jmp	short @10@226
@10@198:
   ;	
   ;	    else
   ;	        res = filelength(g_handle);
   ;	
	push	word ptr DGROUP:_g_handle
	call	far ptr _filelength
	push	dx
	push	ax
	pop	eax
	pop	cx
	mov	dword ptr [bp-4],eax
@10@226:
   ;	
   ;	    return res;
   ;	
	mov	eax,dword ptr [bp-4]
	shld	edx,eax,16
@10@254:
   ;	
   ;	}
   ;	
	leave	
	ret	
@g_open_element$qnuc	endp
   ;	
   ;	long g_element_read(void far *buf, uint len)
   ;	
	assume	cs:UTIL_TEXT
@g_element_read$qnvui	proc	far
	enter	2,0
   ;	
   ;	{
   ;	    uint n;
   ;	
   ;	    if (external_read)
   ;	
	cmp	dword ptr DGROUP:_external_read,large 0
	je	short @11@86
   ;	
   ;	        return external_read(buf, len);
   ;	
	push	word ptr [bp+10]
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	dword ptr DGROUP:_external_read
	add	sp,6
	jmp	short @11@170
@11@86:
   ;	
   ;	    if (g_handle == -1)
   ;	
	cmp	word ptr DGROUP:_g_handle,-1
	jne	short @11@142
   ;	
   ;	        terminate((uchar far *)"Element not open.", 0);
   ;	
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+94
	push	cs
	call	near ptr @terminate$qnuct1
	add	sp,8
@11@142:
   ;	
   ;	    n = read(g_handle, buf, len);
   ;	
	push	word ptr [bp+10]
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	word ptr DGROUP:_g_handle
	call	far ptr _read
	add	sp,8
	mov	word ptr [bp-2],ax
   ;	
   ;	    return n;
   ;	
	movzx	eax,word ptr [bp-2]
	shld	edx,eax,16
@11@170:
   ;	
   ;	}
   ;	
	leave	
	ret	
@g_element_read$qnvui	endp
   ;	
   ;	void g_close_element(void)
   ;	
	assume	cs:UTIL_TEXT
@g_close_element$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (external_open == 0 && g_handle != -1) {
   ;	
	cmp	dword ptr DGROUP:_external_open,large 0
	jne	short @12@114
	cmp	word ptr DGROUP:_g_handle,-1
	je	short @12@114
   ;	
   ;	        close(g_handle);
   ;	
	push	word ptr DGROUP:_g_handle
	call	far ptr _close
	pop	cx
   ;	
   ;	        g_handle = -1;
   ;	
	mov	word ptr DGROUP:_g_handle,-1
@12@114:
   ;	
   ;	    }
   ;	}
   ;	
	pop	bp
	ret	
@g_close_element$qv	endp
	?debug	C E9
	?debug	C FA00000000
UTIL_TEXT	ends
_DATA	segment word public use16 'DATA'
s@	label	byte
	db	'%s %s'
	db	10
	db	0
	db	'%s'
	db	10
	db	0
	db	'Out of heap : '
	db	0
	db	'Read error : '
	db	0
	db	'Write error : '
	db	0
	db	'Request to open more than one element.'
	db	0
	db	'Element not open.'
	db	0
_DATA	ends
UTIL_TEXT	segment byte public use16 'CODE'
UTIL_TEXT	ends
	public	_external_read
	public	_external_open
	public	_g_handle
	public	@set_external_read$qnv
	public	@set_external_open$qnv
	public	@write_error$qnuc
	public	@request_mem$qul
	public	@beep$qv
	public	@no_heap$qnuc
	public	@g_close_element$qv
	public	@g_element_read$qnvui
	public	@g_open_element$qnuc
	public	@read_error$qnuc
	public	@pause$qui
	public	@terminate$qnuct1
	extrn	_gr_end_kbd_grab:far
	extrn	_exit:far
	extrn	_coreleft:far
	extrn	_sound:far
_pokeb	equ	pokeb
_poke	equ	poke
_peekb	equ	peekb
_peek	equ	peek
	extrn	_nosound:far
	extrn	_int86:far
	extrn	_delay:far
	extrn	_read:far
	extrn	_open:far
	extrn	_filelength:far
	extrn	_close:far
	extrn	_printf:far
_s@	equ	s@
	end
