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
	?debug	S "kbd.cpp"
	?debug	C E96E4E385D076B62642E637070
	?debug	C E96E4E385D09726970746964652E68
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
KBD_TEXT	segment byte public use16 'CODE'
KBD_TEXT	ends
DGROUP	group	_DATA,_BSS
	assume	cs:KBD_TEXT,ds:DGROUP
_DATA	segment word public use16 'DATA'
d@	label	byte
d@w	label	word
_DATA	ends
_BSS	segment word public use16 'BSS'
b@	label	byte
b@w	label	word
_BSS	ends
_DATA	segment word public use16 'DATA'
_gr_old_int9	label	dword
	db	0
	db	0
	db	0
	db	0
_first_time	label	word
	db	1
	db	0
_DATA	ends
_BSS	segment word public use16 'BSS'
_fp_kbd_head	label	dword
	db	4 dup (?)
_fp_kbd_tail	label	dword
	db	4 dup (?)
_BSS	ends
KBD_TEXT	segment byte public use16 'CODE'
   ;	
   ;	void set_exit_routine(void (far *fn)(void))
   ;	
	assume	cs:KBD_TEXT
_set_exit_routine	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    exit_routine = fn;
   ;	
	mov	eax,dword ptr [bp+6]
	mov	dword ptr DGROUP:_exit_routine,eax
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_set_exit_routine	endp
   ;	
   ;	int gr_inkey(void)
   ;	
	assume	cs:KBD_TEXT
_gr_inkey	proc	far
	enter	10,0
   ;	
   ;	{
   ;	    int res = 0;
   ;	
	mov	word ptr [bp-2],0
   ;	
   ;	    word far *head, far *tail;
   ;	
   ;	    head = (word far *)0x40001A;
   ;	
	mov	dword ptr [bp-6],large 00040001Ah
   ;	
   ;	    tail = (word far *)0x40001C;
   ;	
	mov	dword ptr [bp-10],large 00040001Ch
   ;	
   ;	    disable();                                    /* cli */
   ;	
	db	250
   ;	
   ;	    if (*head != *tail) {                         /* buffer non-empty? */
   ;	
	les	bx,dword ptr [bp-6]
	mov	ax,word ptr es:[bx]
	les	bx,dword ptr [bp-10]
	cmp	ax,word ptr es:[bx]
	je	short @2@142
   ;	
   ;	        res = getch();
   ;	
	call	far ptr _getch
	mov	word ptr [bp-2],ax
   ;	
   ;	        if (res == 0)
   ;	
	cmp	word ptr [bp-2],0
	jne	short @2@114
   ;	
   ;	            res = getch() << 8;                   /* extended scancode */
   ;	
	call	far ptr _getch
	shl	ax,8
	mov	word ptr [bp-2],ax
@2@114:
   ;	
   ;	        *head = *tail;                            /* flush buffer */
   ;	
	les	bx,dword ptr [bp-10]
	mov	ax,word ptr es:[bx]
	les	bx,dword ptr [bp-6]
	mov	word ptr es:[bx],ax
@2@142:
   ;	
   ;	    }
   ;	    enable();                                     /* sti */
   ;	
	db	251
   ;	
   ;	    return res;
   ;	
	mov	ax,word ptr [bp-2]
   ;	
   ;	}
   ;	
	leave	
	ret	
_gr_inkey	endp
   ;	
   ;	void gr_end_kbd_grab(void)
   ;	
	assume	cs:KBD_TEXT
_gr_end_kbd_grab	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    setvect(9, gr_old_int9);
   ;	
	push	word ptr DGROUP:_gr_old_int9+2
	push	word ptr DGROUP:_gr_old_int9
	push	9
	call	far ptr _setvect
	add	sp,6
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_gr_end_kbd_grab	endp
   ;	
   ;	void gr_start_kbd_grab(void)
   ;	
	assume	cs:KBD_TEXT
_gr_start_kbd_grab	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    disable_exit_routine = 0;
   ;	
	mov	byte ptr DGROUP:_disable_exit_routine,0
   ;	
   ;	    exit_routine = 0;
   ;	
	mov	dword ptr DGROUP:_exit_routine,large 0
   ;	
   ;	    gr_old_int9 = getvect(9);
   ;	
	push	9
	call	far ptr _getvect
	pop	cx
	mov	word ptr DGROUP:_gr_old_int9+2,dx
	mov	word ptr DGROUP:_gr_old_int9,ax
   ;	
   ;	    memset(gr_keys, 0, 0x80);
   ;	
	push	128
	push	0
	push	ds
	push	offset DGROUP:_gr_keys
	call	far ptr _memset
	add	sp,8
   ;	
   ;	    setvect(9, gr_int9);
   ;	
	push	seg _gr_int9
	push	offset _gr_int9
	push	9
	call	far ptr _setvect
	add	sp,6
   ;	
   ;	    if (first_time != 0) {
   ;	
	cmp	word ptr DGROUP:_first_time,0
	je	short @4@86
   ;	
   ;	        atexit(gr_end_kbd_grab);
   ;	
	push	seg _gr_end_kbd_grab
	push	offset _gr_end_kbd_grab
	call	far ptr _atexit
	add	sp,4
   ;	
   ;	        first_time = 0;
   ;	
	mov	word ptr DGROUP:_first_time,0
@4@86:
   ;	
   ;	    }
   ;	}
   ;	
	pop	bp
	ret	
_gr_start_kbd_grab	endp
   ;	
   ;	void interrupt far gr_int9(...)
   ;	
	assume	cs:KBD_TEXT
_gr_int9	proc	far
	push	ax
	push	bx
	push	cx
	push	dx
	push	es
	push	ds
	push	si
	push	di
	push	bp
	mov	bp,DGROUP
	mov	ds,bp
	mov	bp,sp
	sub	sp,2
   ;	
   ;	{
   ;	    byte scan;
   ;	
   ;	    scan = inportb(0x60);                         /* 8042 data port */
   ;	
	mov	dx,96
	in	al,dx
	mov	byte ptr [bp-1],al
   ;	
   ;	    if (scan & 0x80)                              /* key release */
   ;	
	test	byte ptr [bp-1],128
	je	short @5@86
   ;	
   ;	        gr_keys[scan & 0x7F] = 0;
   ;	
	mov	al,byte ptr [bp-1]
	mov	ah,0
	and	ax,127
	mov	bx,ax
	mov	byte ptr DGROUP:_gr_keys[bx],0
	jmp	short @5@114
@5@86:
   ;	
   ;	    else                                          /* key press */
   ;	        gr_keys[scan] = 1;
   ;	
	mov	al,byte ptr [bp-1]
	mov	ah,0
	mov	bx,ax
	mov	byte ptr DGROUP:_gr_keys[bx],1
@5@114:
   ;	
   ;	    fp_kbd_tail = (word far *)0x40001A;
   ;	
	mov	dword ptr DGROUP:_fp_kbd_tail,large 00040001Ah
   ;	
   ;	    fp_kbd_head = (word far *)0x40001C;
   ;	
	mov	dword ptr DGROUP:_fp_kbd_head,large 00040001Ch
   ;	
   ;	    *fp_kbd_tail = *fp_kbd_head;                  /* flush BIOS buffer */
   ;	
	les	bx,dword ptr DGROUP:_fp_kbd_head
	mov	ax,word ptr es:[bx]
	les	bx,dword ptr DGROUP:_fp_kbd_tail
	mov	word ptr es:[bx],ax
   ;	
   ;	    asm pushf;
   ;	
 	pushf	
   ;	
   ;	    gr_old_int9();                                /* chain to old int9 (pushf;call) */
   ;	
	pushf	
	call	dword ptr DGROUP:_gr_old_int9
   ;	
   ;	    if (scan == 0x44 && disable_exit_routine == 0 && exit_routine != 0)
   ;	
	cmp	byte ptr [bp-1],68
	jne	short @5@282
	cmp	byte ptr DGROUP:_disable_exit_routine,0
	jne	short @5@282
	cmp	dword ptr DGROUP:_exit_routine,large 0
	je	short @5@282
   ;	
   ;	        (*exit_routine)();
   ;	
	call	dword ptr DGROUP:_exit_routine
@5@282:
   ;	
   ;	    outportb(0x20, 0x20);                         /* EOI to 8259A */
   ;	
	mov	dx,32
	mov	al,32
	out	dx,al
   ;	
   ;	}
   ;	
	leave	
	pop	di
	pop	si
	pop	ds
	pop	es
	pop	dx
	pop	cx
	pop	bx
	pop	ax
	iret	
_gr_int9	endp
	?debug	C E9
	?debug	C FA00000000
KBD_TEXT	ends
_DATA	segment word public use16 'DATA'
s@	label	byte
_DATA	ends
KBD_TEXT	segment byte public use16 'CODE'
KBD_TEXT	ends
	extrn	_atexit:far
	public	_fp_kbd_tail
	public	_fp_kbd_head
	public	_first_time
	public	_gr_old_int9
	public	_gr_int9
	public	_gr_inkey
	public	_set_exit_routine
	public	_gr_end_kbd_grab
	public	_gr_start_kbd_grab
	extrn	_disable_exit_routine:byte
	extrn	_exit_routine:dword
	extrn	_gr_keys:byte
	extrn	_getch:far
	extrn	_setvect:far
	extrn	_getvect:far
_pokeb	equ	pokeb
_poke	equ	poke
_peekb	equ	peekb
_peek	equ	peek
	extrn	_memset:far
_s@	equ	s@
	end
