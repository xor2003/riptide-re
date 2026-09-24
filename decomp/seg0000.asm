; decomp/seg0000.asm — seg0000 (extracted from RIPTIDE_.asm)
		.386p

SREGS		struc ;	(sizeof=0x8, align=0x2,	copyof_1) ; XREF: _int86/r
					; @vga_display@get_palette$qv/r
_es		dw ?			; XREF:	vga_display::get_palette(void)+18/w
_cs		dw ?
_ss		dw ?
_ds		dw ?
SREGS		ends

FILE		struc ;	(sizeof=0x14, align=0x2, copyof_7) ; XREF: seg2608:stru_2B114/r
					; seg2608:stru_2B128/r ...
level		dw ?
flags		dw ?			; XREF:	__setupio+8C/w __setupio+96/r
fd		db ?			; XREF:	__setupio+7D/r
hold		db ?
bsize		dw ?
buffer		dd ?			; offset
curp		dd ?			; offset
istemp		dw ?
token		dw ?
FILE		ends

		extrn	_main:near
		extrn	e087_trap:far
		extrn	e087_entry:far
		extrn	e087_shortcut:near
		extrn	e086_entry:near
		extrn	e086_shortcut:near
		public	@$bdele$qnv
		public	@$bnew$qui
		public	@set_new_handler$qnqv$v
		public	___first
		public	___fpreset
		public	___last
		public	___read
		public	___rover
		public	___write
		public	__brk
		public	__c0crtinit
		public	__c_exit
		public	__cexit
		public	__checknull
		public	__chmod
		public	__cleanup
		public	__close
		public	__cputn
		public	__crtinit
		public	__dos_getdrive
		public	__dos_getfileattr
		public	__dos_setdrive
		public	__dos_setfileattr
		public	__doserror
		public	__exit
		public	__fgetc
		public	__fperror
		public	__fpuint
		public	__fputc
		public	__fputn
		public	__getfp
		public	__ioerror
		public	__longtoa
		public	__mkname
		public	__mmodel
		public	__nfgetc
		public	__ngetche
		public	__nungetch
		public	__open
		public	__openfp
		public	__pow10
		public	__read
		public	__realcvt
		public	__restorezero
		public	__sbrk
		public	__screenio
		public	__scroll
		public	__setupio
		public	__stpcpy
		public	__terminate
		public	__tmpnam
		public	__utoa
		public	__validatexy
		public	__videoint
		public	__vprinter
		public	__vptr
		public	__vram
		public	__wherexy
		public	__write
		public	__xcvt
		public	__xfclose
		public	__xfflush
		public	_abort
		public	_atexit
		public	_atoi
		public	_atol
		public	_chdir
		public	_clock
		public	_close
		public	_clrscr
		public	_coreleft
		public	_cprintf
		public	_cputs
		public	_delay
		public	_eof
		public	_exit
		public	_farcoreleft
		public	_farfree
		public	_farmalloc
		public	_farrealloc
		public	_fclose
		public	_fflush
		public	_fgetc
		public	_fgetchar
		public	_filelength
		public	_findfirst
		public	_findnext
		public	_flushall
		public	_fopen
		public	_fprintf
		public	_fputc
		public	_fputchar
		public	_fseek
		public	_ftell
		public	_getch
		public	_getche
		public	_getcurdir
		public	_getdisk
		public	_gettext
		public	_getvect
		public	_highvideo
		public	_int86
		public	_int86x
		public	_intr
		public	_ioctl
		public	_isatty
		public	_itoa
		public	_kbhit
		public	_lowvideo
		public	_lseek
		public	_ltoa
		public	_malloc
		public	_memcpy
		public	_memset
		public	_movetext
		public	_normvideo
		public	_nosound
		public	_open
		public	_perror
		public	_pow10
		public	_printf
		public	_putch
		public	_puttext
		public	_rand
		public	_read
		public	_realloc
		public	_segread
		public	_setblock
		public	_setdisk
		public	_setmem
		public	_setvbuf
		public	_setvect
		public	_sound
		public	_srand
		public	_strcat
		public	_strcmp
		public	_strcpy
		public	_strdup
		public	_strlen
		public	_strncpy
		public	_strnset
		public	_strset
		public	_strupr
		public	_textattr
		public	_textbackground
		public	_textcolor
		public	_ultoa
		public	_ungetch
		public	_unlink
		public	_vfprintf
		public	_wherex
		public	_wherey
		public	_write
		public	ftol@
		public	F_FTOL@
		public	loc_3C37
		public	loc_3C6C
		public	loc_420A
		public	n_lxlsh@
		public	n_lxmul@
		public	n_padd@
		public	n_pcmp@
		public	n_psbp@
		public	nullsub_1
		public	nullsub_2
		public	nullsub_3
		public	scopy@
		public	F_SCOPY@
		public	start
		public	sub_2354
		public	sub_235D
		public	sub_23CD
		public	sub_2411
		public	sub_2452
		public	sub_24AE
		public	sub_24D9
		public	sub_2624
		public	sub_26F1
		public	sub_2886
		public	sub_2D4E
		public	sub_32F4
		public	sub_32FB
		public	sub_3304
		public	sub_3326
		public	sub_3333
		public	sub_333C
		public	sub_3A8D
		public	sub_3ABA
		public	sub_3C32
		public	sub_3C52
		public	sub_3CFA
		public	sub_3D5D
		public	sub_3DCE
		public	sub_3DF7
		public	sub_3E57
		public	sub_3EBB
		public	sub_3F15
		public	sub_3FBF
		public	sub_403B
		public	sub_4120
		public	sub_420D
		public	sub_461B
		public	sub_4653
		public	sub_4687
		public	sub_47E2
		public	sub_4A05
		public	sub_4EDE
		public	sub_5106
		public	sub_52E8
		public	sub_5326
		public	sub_5587
		public	sub_55A2
		public	unknown_libname_1
		public	unknown_libname_3

seg03f9		segment	byte public 'CODE' use16
seg03f9		ends

seg1a07		segment	byte public 'CODE' use16
seg1a07		ends

seg2333		segment	byte public 'CODE' use16
seg2333		ends

seg25ab		segment	byte public 'CODE' use16
seg25ab		ends

seg2608		segment	para public 'DATA' use16
		extrn	__version:byte
		extrn	__psp:word
		extrn	__envseg:word
		extrn	__heaptop:dword
		extrn	__envlng:word
		extrn	__envsize:word
		extrn	__stklen:word
		extrn	__heapbase:dword
		extrn	__brklvl:dword
		extrn	_the_cast:dword
		extrn	unk_2D704:byte
		extrn	__osminor:byte
		extrn	__nfile:word
		extrn	__starttime:dword
		extrn	byte_2B6DC:byte
		extrn	unk_2B6FA:byte
		extrn	__c0environ:dword
		extrn	__c0argv:dword
		extrn	__c0argc:word
		extrn	__int0vector:dword
		extrn	__int4vector:dword
		extrn	__int5vector:dword
		extrn	__int6vector:dword
		extrn	aDivideErrorAbn:byte
		extrn	__ldt:word
		extrn	__protected:byte
		extrn	__8087:word
		extrn	__default87:word
		extrn	___signalptr:dword
		extrn	aFloatingPointE:byte
		extrn	stru_2B128:FILE
		extrn	flt_2AFEC:qword
		extrn	flt_2AF70:dword
		extrn	flt_2AF90:dword
		extrn	dbl_2AF94:qword
		extrn	tbyte_2AF9C:tbyte
		extrn	tbyte_2AFA6:tbyte
		extrn	tbyte_2AFB0:tbyte
		extrn	tbyte_2AFBA:tbyte
		extrn	tbyte_2AFC4:tbyte
		extrn	tbyte_2AFCE:tbyte
		extrn	tbyte_2AFD8:tbyte
		extrn	tbyte_2AFE2:tbyte
		extrn	__atexitcnt:word
		extrn	word_2D66A:word
		extrn	__atexittbl:word
		extrn	byte_2D6E8:byte
		extrn	__exitbuf:dword
		extrn	__exitfopen:dword
		extrn	__exitopen:dword
		extrn	__doserrno:word
		extrn	__doserrortosv:byte
		extrn	_errno:word
		extrn	__openfd:word
		extrn	unk_2D6EA:byte
		extrn	aTmp:byte
		extrn	a__0:byte
		extrn	__new_handler:dword
		extrn	word_2B328:word
		extrn	word_2B326:word
		extrn	byte_2B104:byte
		extrn	__streams:word
		extrn	off_2B112:word
		extrn	word_2B102:word
		extrn	stru_2B114:FILE
		extrn	off_2826E:word
		extrn	byte_2B333:byte
		extrn	aNull:byte
		extrn	byte_2B39E:byte
		extrn	word_2B3A1:word
		extrn	word_2B3A3:word
		extrn	byte_2B3A0:byte
		extrn	__video:byte
		extrn	byte_2B397:byte
		extrn	byte_2B398:byte
		extrn	byte_2B399:byte
		extrn	byte_2B39A:byte
		extrn	byte_2B39B:byte
		extrn	byte_2B39F:byte
		extrn	_directvideo:word
		extrn	__wscroll:word
		extrn	byte_2B39C:byte
		extrn	byte_2B39D:byte
		extrn	aCompaq:byte
		extrn	aPrint:byte
		extrn	aScan:byte
		extrn	aFFloatingPoint:byte
		extrn	word_2B3E2:word
		extrn	word_2B3E0:word
		extrn	word_28264:word
		extrn	dataseg@:word
		extrn	word_2B3E4:word
		extrn	__cflag:byte
		extrn	__cchar:byte
		extrn	__realcvtvector:word
		extrn	off_2B3EE:word
		extrn	word_2B3F0:word
		extrn	word_2B3F2:word
		extrn	word_2B3F4:word
		extrn	word_2B3F6:word
		extrn	__argc:word
		extrn	__argv:word
		extrn	word_2B3EC:word
		extrn	__ctype:byte
		extrn	__fmode:word
		extrn	byte_2D700:byte
		extrn	__notumask:word
		extrn	_sys_nerr:word
		extrn	_sys_errlist:dword
		extrn	aUnknownError:byte
		extrn	aSS_0:byte
		extrn	byte_2D702:byte
		extrn	asc_2B6CC:byte
		extrn	word_2B6D0:word
		extrn	word_2B6CE:word
seg2608		ends

seg2b53		segment	byte stack 'STACK' use16
seg2b53		ends


; ---- segment seg0000 ----
seg0000		segment	byte public 'CODE' use16
		assume cs:seg0000
		assume es:nothing, ss:nothing, ds:nothing, fs:nothing, gs:nothing

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function noreturn

		public start
start		proc far		; DATA XREF: seg2608:off_2B3EEo
		mov	dx, seg	seg2608
		mov	cs:dgroup@, dx
		mov	ah, 30h
		int	21h		; DOS -	GET DOS	VERSION
					; Return: AL = major version number (00h for DOS 1.x)
		mov	bp, ds:2
		mov	bx, ds:2Ch
		mov	ds, dx
		assume ds:seg2608
		mov	word ptr __version, ax
		mov	__psp, es
		mov	__envseg, bx
		mov	word ptr __heaptop+2, bp
		call	sub_235D
		assume es:nothing
		mov	ax, __envseg

loc_220B::				; CODE XREF: _int86+27p
		mov	es, ax
		assume es:nothing
		xor	ax, ax
		mov	bx, ax
		mov	di, ax
		mov	cx, 7FFFh
		cld

loc_2217::				; CODE XREF: start+3Fj
		repne scasb
		jcxz	loc_225E
		inc	bx
		cmp	es:[di], al
		jnz	loc_2217
		or	ch, 80h
		neg	cx
		mov	__envlng, cx
		mov	cx, 2
		shl	bx, cl
		add	bx, 10h
		and	bx, 0FFF0h
		mov	__envsize, bx
		mov	dx, ss
		sub	bp, dx
		mov	di, seg	seg2608
		mov	es, di
		assume es:seg2608
		mov	di, es:__stklen
		cmp	di, 200h
		jnb	loc_2255
		mov	di, 200h
		mov	es:__stklen, di

loc_2255::				; CODE XREF: start+6Bj
		mov	cl, 4
		shr	di, cl
		inc	di
		cmp	bp, di
		jnb	loc_2261

loc_225E::				; CODE XREF: start+39j
		jmp	_abort
; ---------------------------------------------------------------------------

loc_2261::				; CODE XREF: start+7Cj
		mov	bx, di
		add	bx, dx
		mov	word ptr __heapbase+2, bx
		mov	word ptr __brklvl+2, bx
		mov	ax, __psp
		sub	bx, ax
		mov	es, ax
		assume es:nothing
		mov	ah, 4Ah	; 'J'
		push	di
		int	21h		; DOS -	2+ - ADJUST MEMORY BLOCK SIZE (SETBLOCK)
					; ES = segment address of block	to change
					; BX = new size	in paragraphs
		pop	di
		shl	di, cl
		cli
		mov	ss, dx
		assume ss:nothing
		mov	sp, di
		sti
		mov	ax, seg	seg2608
		mov	es, ax
		assume es:seg2608
		mov	es:__stklen, di
		xor	ax, ax
		mov	es, cs:dgroup@
		mov	di, offset _the_cast
		mov	cx, offset unk_2D704
		sub	cx, di
		cld
		rep stosb
		cmp	word ptr ds:3030h, 14h
		jbe	loc_22EC
		cmp	__version, 3
		jb	loc_22EC
		ja	loc_22B5
		cmp	__osminor, 1Eh
		jb	loc_22EC

loc_22B5::				; CODE XREF: start+CCj
		mov	ax, 5801h
		mov	bx, 2
		int	21h		; DOS -	3+ - GET/SET MEMORY ALLOCATION STRATEGY
					; AL = function	code: set allocation strategy
		jb	loc_22E9
		mov	ah, 67h	; 'g'
		mov	bx, __nfile
		int	21h		; DOS -	3.3+ - SET HANDLE COUNT
					; BX = desired number of handles (max 255)
		jb	loc_22E9
		mov	ah, 48h	; 'H'
		mov	bx, 1
		int	21h		; DOS -	2+ - ALLOCATE MEMORY
					; BX = number of 16-byte paragraphs desired
		jb	loc_22E9
		inc	ax
		mov	word ptr __heaptop+2, ax
		dec	ax
		mov	es, ax
		assume es:nothing
		mov	ah, 49h
		int	21h		; DOS -	2+ - FREE MEMORY
					; ES = segment address of area to be freed
		jb	loc_22E9
		mov	ax, 5801h
		mov	bx, 0
		int	21h		; DOS -	3+ - GET/SET MEMORY ALLOCATION STRATEGY
					; AL = function	code: set allocation strategy
		jnb	loc_22EC

loc_22E9::				; CODE XREF: start+DDj	start+E7j ...
		jmp	_abort
; ---------------------------------------------------------------------------
		assume es:seg2608

loc_22EC::				; CODE XREF: start+C3j	start+CAj ...
		mov	ah, 0
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		mov	word ptr __starttime, dx
		mov	word ptr __starttime+2,	cx
		or	al, al
		jz	loc_2308
		mov	ax, 40h	; '@'
		mov	es, ax
		assume es:nothing
		mov	bx, 70h	; 'p'
		mov	byte ptr es:[bx], 1
		assume es:seg2608

loc_2308::				; CODE XREF: start+11Aj
		xor	bp, bp
		mov	es, cs:dgroup@
		mov	si, offset byte_2B6DC
		mov	di, offset unk_2B6FA
		call	sub_23CD
		push	word ptr __c0environ+2
		push	word ptr __c0environ ; envp
		push	word ptr __c0argv+2
		push	word ptr __c0argv ; argv
		push	__c0argc	; argc
		call	far ptr	_main
; ---------------------------------------------------------------------------
		push	ax		; status
		nop
		push	cs
		call	near ptr _exit
; ---------------------------------------------------------------------------

__cleanup::				; CODE XREF: sub_2D4E+26p
		mov	es, cs:dgroup@
		assume es:nothing
		push	si
		push	di
		mov	si, offset unk_2B6FA
		mov	di, offset _the_cast
		call	sub_2411
		pop	di
		pop	si
		retf
start		endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

__checknull	proc far		; CODE XREF: sub_2D4E+34p
		retf
__checknull	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function noreturn	bp-based frame

__terminate	proc near		; CODE XREF: sub_2D4E+4Ep

arg_2		= byte ptr  4

		mov	bp, sp
		mov	ah, 4Ch	; 'L'
		mov	al, [bp+arg_2]
		int	21h		; DOS -	2+ - QUIT WITH EXIT CODE (EXIT)
__terminate	endp			; AL = exit code


; =============== S U B	R O U T	I N E =======================================

; Attributes: noreturn

sub_2354	proc near		; DATA XREF: sub_235D+3Co
		mov	cx, 0Eh
		mov	dx, 2Fh	; '/'
		jmp	loc_2460
sub_2354	endp

		assume es:nothing

; =============== S U B	R O U T	I N E =======================================


sub_235D	proc near		; CODE XREF: start+25p
		push	ds
		mov	ax, 3500h
		int	21h		; DOS -	2+ - GET INTERRUPT VECTOR
					; AL = interrupt number
					; Return: ES:BX	= value	of interrupt vector
		assume es:nothing
		mov	word ptr __int0vector, bx
		mov	word ptr __int0vector+2, es
		mov	ax, 3504h
		int	21h		; DOS -	2+ - GET INTERRUPT VECTOR
					; AL = interrupt number
					; Return: ES:BX	= value	of interrupt vector
		assume es:nothing
		mov	word ptr __int4vector, bx
		mov	word ptr __int4vector+2, es
		mov	ax, 3505h
		int	21h		; DOS -	2+ - GET INTERRUPT VECTOR
					; AL = interrupt number
					; Return: ES:BX	= value	of interrupt vector
		assume es:nothing
		mov	word ptr __int5vector, bx
		mov	word ptr __int5vector+2, es
		mov	ax, 3506h
		int	21h		; DOS -	2+ - GET INTERRUPT VECTOR
					; AL = interrupt number
					; Return: ES:BX	= value	of interrupt vector
		mov	word ptr __int6vector, bx
		mov	word ptr __int6vector+2, es
		mov	ax, 2500h
		mov	dx, cs
		mov	ds, dx
		assume ds:seg0000
		mov	dx, offset sub_2354
		int	21h		; DOS -	SET INTERRUPT VECTOR
					; AL = interrupt number
					; DS:DX	= new vector to	be used	for specified interrupt
		pop	ds
		assume ds:seg2608
		retn
sub_235D	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

__restorezero	proc far		; CODE XREF: sub_2D4E+2Fp
		push	ds
		mov	ax, 2500h
		lds	dx, __int0vector
		int	21h		; DOS -	SET INTERRUPT VECTOR
					; AL = interrupt number
					; DS:DX	= new vector to	be used	for specified interrupt
		pop	ds
		push	ds
		mov	ax, 2504h
		lds	dx, __int4vector
		int	21h		; DOS -	SET INTERRUPT VECTOR
					; AL = interrupt number
					; DS:DX	= new vector to	be used	for specified interrupt
		pop	ds
		push	ds
		mov	ax, 2505h
		lds	dx, __int5vector
		int	21h		; DOS -	SET INTERRUPT VECTOR
					; AL = interrupt number
					; DS:DX	= new vector to	be used	for specified interrupt
		pop	ds
		push	ds
		mov	ax, 2506h
		lds	dx, __int6vector
		int	21h		; DOS -	SET INTERRUPT VECTOR
					; AL = interrupt number
					; DS:DX	= new vector to	be used	for specified interrupt
		pop	ds
		retf
__restorezero	endp

		assume es:seg2608

; =============== S U B	R O U T	I N E =======================================


sub_23CD	proc near		; CODE XREF: start+135p sub_23CD+3Aj ...
		mov	ax, 100h
		mov	dx, di
		mov	bx, si

loc_23D4::				; CODE XREF: sub_23CD+22j
		cmp	bx, di
		jz	loc_23F1
		cmp	byte ptr es:[bx], 0FFh
		jz	loc_23EC
		mov	cl, es:[bx+1]
		xor	ch, ch
		cmp	cx, ax
		jnb	loc_23EC
		mov	ax, cx
		mov	dx, bx

loc_23EC::				; CODE XREF: sub_23CD+Fj sub_23CD+19j
		add	bx, 6
		jmp	loc_23D4
; ---------------------------------------------------------------------------

loc_23F1::				; CODE XREF: sub_23CD+9j
		cmp	dx, di
		jz	locret_2410
		mov	bx, dx
		cmp	byte ptr es:[bx], 0
		mov	byte ptr es:[bx], 0FFh
		push	es
		jz	loc_2409
		call	dword ptr es:[bx+2]
		pop	es
		jmp	sub_23CD
; ---------------------------------------------------------------------------

loc_2409::				; CODE XREF: sub_23CD+33j
		call	word ptr es:[bx+2]
		pop	es
		jmp	sub_23CD
; ---------------------------------------------------------------------------

locret_2410::				; CODE XREF: sub_23CD+26j
		retn
sub_23CD	endp


; =============== S U B	R O U T	I N E =======================================


sub_2411	proc near		; CODE XREF: start+164p sub_2411+37j ...
		mov	ah, 0
		mov	dx, di
		mov	bx, si

loc_2417::				; CODE XREF: sub_2411+1Fj
		cmp	bx, di
		jz	loc_2432
		cmp	byte ptr es:[bx], 0FFh
		jz	loc_242D
		cmp	es:[bx+1], ah
		jb	loc_242D
		mov	ah, es:[bx+1]
		mov	dx, bx

loc_242D::				; CODE XREF: sub_2411+Ej sub_2411+14j
		add	bx, 6
		jmp	loc_2417
; ---------------------------------------------------------------------------

loc_2432::				; CODE XREF: sub_2411+8j
		cmp	dx, di
		jz	locret_2451
		mov	bx, dx
		cmp	byte ptr es:[bx], 0
		mov	byte ptr es:[bx], 0FFh
		push	es
		jz	loc_244A
		call	dword ptr es:[bx+2]
		pop	es
		assume es:nothing
		jmp	sub_2411
; ---------------------------------------------------------------------------

loc_244A::				; CODE XREF: sub_2411+30j
		call	word ptr es:[bx+2]
		pop	es
		jmp	sub_2411
; ---------------------------------------------------------------------------

locret_2451::				; CODE XREF: sub_2411+23j
		retn
sub_2411	endp


; =============== S U B	R O U T	I N E =======================================


sub_2452	proc near		; CODE XREF: _abort+Bp
		mov	ah, 40h	; '@'
		mov	bx, 2
		int	21h		; DOS -	2+ - WRITE TO FILE WITH	HANDLE
					; BX = file handle, CX = number	of bytes to write, DS:DX -> buffer
		retn
sub_2452	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function noreturn

; void abort(void)
_abort		proc near		; CODE XREF: start:loc_225Ej
					; start:loc_22E9j ...
		mov	cx, 1Eh
		mov	dx, (offset aDivideErrorAbn+0Eh) ; "Abnormal program termination\r\n"

loc_2460::				; CODE XREF: sub_2354+6j
		mov	ds, cs:dgroup@
		call	sub_2452
		mov	ax, 3
		push	ax		; status
		nop
		push	cs
		call	near ptr __exit
_abort		endp

; ---------------------------------------------------------------------------
dgroup@		dw 0			; DATA XREF: start+3w start+AEr ...
__mmodel	dw 0C004h
		db    0
word_2476	dw 0			; DATA XREF: sub_24D9+2Bo
					; seg0000:04C6o
		dw 0
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
		db    0
		db    0
		db    0
		db    0
		dw 0
		dw 0
		dw 0
		dw 0
dword_24AA	dd 7F800000h		; DATA XREF: sub_24D9+AEr sub_24D9+B5r

; =============== S U B	R O U T	I N E =======================================


sub_24AE	proc far		; DATA XREF: sub_2624+32o
		push	ax
		xor	al, al
		out	0F0h, al	; AT 80287 latch clear.
					; 'Busy' gets latched upon an unmasked 287 error.
		mov	al, 20h	; ' '
		out	0A0h, al	; PIC 2	 same as 0020 for PIC 1
		out	20h, al		; Interrupt controller,	8259A.
		pop	ax
		int	2		; - external hardware -	NMI (NON-MASKABLE INTERRUPT)
					; Generated by NMI signal in hardware.
		iret
sub_24AE	endp

; ---------------------------------------------------------------------------

loc_24BD::				; DATA XREF: sub_2624+15o
		push	ax
		mov	ax, seg	seg2b53
		call	e087_trap
		jb	loc_24CE
		pop	ax
; ---------------------------------------------------------------------------
		db 0EAh
word_24CA	dw 0			; DATA XREF: sub_24D9+52w
word_24CC	dw 0			; DATA XREF: sub_24D9+56w
; ---------------------------------------------------------------------------

loc_24CE::				; CODE XREF: seg0000:02E6j
		xchg	ax, bx
		mov	ax, seg	seg2608
		mov	ds, ax
		call	__fperror
		pop	ax
		iret
		assume es:seg2608

; =============== S U B	R O U T	I N E =======================================

; Attributes: noreturn

sub_24D9	proc near		; DATA XREF: seg2608:347Eo
		push	ds
		push	si
		push	di
		mov	ax, 44h	; 'D'
		mov	ss:0Eh,	ax
		add	ax, 0C0h ; 'À'
		mov	ss:10h,	ax
		mov	ax, __ldt
		mov	ss:0Ah,	ax
		mov	al, __protected
		mov	ss:7, al
		mov	cx, cs
		xor	cl, al
		mov	ds, cx
		assume ds:seg0000
		mov	ax, 3534h
		mov	cx, 0Bh
		mov	di, offset word_2476

loc_2507::				; CODE XREF: sub_24D9+39j
		int	21h		; DOS -	2+ - GET INTERRUPT VECTOR
					; AL = interrupt number
					; Return: ES:BX	= value	of interrupt vector
		assume es:nothing
		mov	[di], bx
		mov	word ptr [di+2], es
		add	di, 4
		inc	ax
		loop	loc_2507
		mov	ax, 3575h
		int	21h		; DOS -	2+ - GET INTERRUPT VECTOR
					; AL = interrupt number
					; Return: ES:BX	= value	of interrupt vector
		assume es:nothing
		mov	[di], bx
		mov	word ptr [di+2], es
		add	di, 4
		mov	ax, 3502h
		int	21h		; DOS -	2+ - GET INTERRUPT VECTOR
					; AL = interrupt number
					; Return: ES:BX	= value	of interrupt vector
		assume es:nothing
		mov	[di], bx
		mov	word ptr [di+2], es
		mov	word_24CA, bx
		mov	word_24CC, es
		mov	ax, seg	seg2608
		mov	ds, ax
		assume ds:seg2608
		mov	bx, 0FFFFh
		mov	es, __psp
		assume es:nothing
		mov	es, word ptr es:2Ch
		assume es:nothing
		sub	di, di
		mov	cx, 7FFFh
		mov	al, 0
		cld

loc_254C::				; CODE XREF: sub_24D9+81j sub_24D9+8Aj
		repne scasb
		jcxz	loc_256F
		cmp	al, es:[di]
		jz	loc_256F
		cmp	word ptr es:[di], '78'
		jnz	loc_254C
		mov	dx, es:[di+2]
		cmp	dl, '='
		jnz	loc_254C
		inc	bx
		and	dh, 0DFh
		cmp	dh, 'Y'
		jnz	loc_256F
		inc	bx

loc_256F::				; CODE XREF: sub_24D9+75j sub_24D9+7Aj ...
		pop	di
		pop	si
		or	bx, bx
		jz	loc_25D9
		push	sp
		pop	cx
		cmp	cx, sp
		jnz	loc_259F
		or	bx, bx
		jg	loc_2585
		int	11h		; EQUIPMENT DETERMINATION
					; Return: AX = equipment flag bits
		and	al, 2
		jz	loc_25D7

loc_2585::				; CODE XREF: sub_24D9+A4j
		fninit
		fld	cs:dword_24AA
		fchs
		fcomp	cs:dword_24AA
		fstsw	ax
		sahf
		mov	al, 2
		jz	short loc_25D7
		inc	al
		jmp	short loc_25D7
; ---------------------------------------------------------------------------

loc_259F::				; CODE XREF: sub_24D9+A0j
		fninit
		mov	__8087,	0
		fnstcw	__8087
		mov	cx, 14h

loc_25AE::				; CODE XREF: sub_24D9:loc_25AEj
		loop	loc_25AE
		mov	cx, __8087
		and	cx, 0F3Fh
		cmp	cx, 33Fh
		jnz	short loc_25D7
		mov	__8087,	0FFFFh
		fnstsw	__8087
		mov	cx, 14h

loc_25CB::				; CODE XREF: sub_24D9:loc_25CBj
		loop	loc_25CB
		test	__8087,	0B8BFh
		jnz	short loc_25D7
		inc	al

loc_25D7::				; CODE XREF: sub_24D9+AAj sub_24D9+C0j ...
		cbw
		xchg	ax, bx

loc_25D9::				; CODE XREF: sub_24D9+9Aj
		mov	__8087,	bx
		mov	ss:6, bl
		pop	ds

___fpreset:
		push	ds
		push	bp
		mov	bp, sp
		sub	sp, 8
		mov	bx, seg	seg2608
		mov	ds, bx
		cmp	__8087,	0
		mov	word ptr [bp-8], offset	e087_entry
		mov	word ptr [bp-6], seg seg25ab
		mov	word ptr [bp-4], offset	e087_shortcut
		mov	word ptr [bp-2], seg seg25ab
		jnz	loc_261E
		mov	word ptr [bp-8], offset	e086_entry
		mov	word ptr [bp-6], seg seg2333
		mov	word ptr [bp-4], offset	e086_shortcut
		mov	word ptr [bp-2], seg seg2333

loc_261E::				; CODE XREF: sub_24D9+12Fj
		mov	ax, 2534h
		mov	cx, 0Ah
sub_24D9	endp ; sp-analysis failed


; =============== S U B	R O U T	I N E =======================================

; Attributes: noreturn

sub_2624	proc near		; CODE XREF: _clrscr+16p
		lds	dx, [bp-8]
		assume ds:seg25ab

loc_2627::				; CODE XREF: sub_2624+6j
		int	21h		; DOS -	SET INTERRUPT VECTOR
					; AL = interrupt number
					; DS:DX	= new vector to	be used	for specified interrupt
		inc	ax
		loop	loc_2627
		mov	ax, 253Eh
		lds	dx, [bp-4]
		int	21h		; DOS -	SET INTERRUPT VECTOR
					; AL = interrupt number
					; DS:DX	= new vector to	be used	for specified interrupt
		mov	ax, 2502h
		push	cs
		pop	ds
		assume ds:seg0000
		mov	dx, offset loc_24BD
		int	21h		; DOS -	SET INTERRUPT VECTOR
					; AL = interrupt number
					; DS:DX	= new vector to	be used	for specified interrupt
		mov	ds, bx
		assume ds:seg2608
		cmp	__8087,	0
		jz	loc_265B
		mov	ax, word ptr __version
		xchg	ah, al
		cmp	ax, 1403h
		jnz	loc_265B
		mov	ax, 2575h
		push	cs
		pop	ds
		assume ds:seg0000
		mov	dx, offset sub_24AE
		int	21h		; DOS -	SET INTERRUPT VECTOR
					; AL = interrupt number
					; DS:DX	= new vector to	be used	for specified interrupt
		assume ds:seg2608

loc_265B::				; CODE XREF: sub_2624+21j sub_2624+2Bj
		fninit			; (emulator call)
		mov	word ptr ss:20h, 0
		mov	word ptr ss:22h, 0
		mov	ds, bx
		mov	ax, __default87
		mov	[bp-8],	ax
		cmp	__8087,	3
		jl	loc_267F
		or	word ptr [bp-8], 2

loc_267F::				; CODE XREF: sub_2624+55j
		fldcw	word ptr [bp-8]	; (emulator call)
		mov	ax, [bp-8]
		and	ss:2, ax
		xor	ax, ax
		cwd
		mov	sp, bp
		pop	bp
		pop	ds
		retn
sub_2624	endp

; ---------------------------------------------------------------------------
		push	ds
		mov	ax, seg	seg2608
		mov	ds, ax
		cmp	__8087,	0
		jl	loc_26C8
		fninit			; (emulator call)
		mov	ax, 2534h
		mov	bx, offset word_2476
		mov	cx, 0Bh

loc_26AC::				; CODE XREF: seg0000:04D5j
		lds	dx, cs:[bx]
		int	21h		; DOS -	SET INTERRUPT VECTOR
					; AL = interrupt number
					; DS:DX	= new vector to	be used	for specified interrupt
		add	bx, 4
		inc	ax
		loop	loc_26AC
		mov	ax, 2575h
		lds	dx, cs:[bx]
		int	21h		; DOS -	SET INTERRUPT VECTOR
					; AL = interrupt number
					; DS:DX	= new vector to	be used	for specified interrupt
		mov	ax, 2502h
		lds	dx, cs:[bx+4]
		int	21h		; DOS -	SET INTERRUPT VECTOR
					; AL = interrupt number
					; DS:DX	= new vector to	be used	for specified interrupt

loc_26C8::				; CODE XREF: seg0000:04BEj
		pop	ds
		retn

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

__fpuint	proc far		; CODE XREF: sub_27C24:loc_27C61P
		mov	ax, 2
		retf
__fpuint	endp


; =============== S U B	R O U T	I N E =======================================

; TCC/TCC++/BCC++ 16 bit DOS
; Attributes: library function bp-based	frame

unknown_libname_1 proc near		; CODE XREF: sub_26F1+10Fp
					; sub_26F1+148p
		push	bp
		mov	bp, sp
		mov	al, 5Fh	; '_'
		and	al, dl
		cmp	al, 47h	; 'G'
		jnz	loc_26E7

loc_26D9::				; CODE XREF: unknown_libname_1+15j
		cmp	byte ptr es:[bx-1], '0'
		jnz	loc_26E7
		dec	bx
		cmp	bx, cx
		ja	loc_26D9
		jmp	loc_26EF
; ---------------------------------------------------------------------------

loc_26E7::				; CODE XREF: unknown_libname_1+9j
					; unknown_libname_1+10j
		cmp	byte ptr es:[bx-1], '.'
		jnz	loc_26EF
		dec	bx

loc_26EF::				; CODE XREF: unknown_libname_1+17j
					; unknown_libname_1+1Ej
		pop	bp
		retn
unknown_libname_1 endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

sub_26F1	proc near		; CODE XREF: __realcvtj
					; DATA XREF: seg2608:__realcvtvectoro

var_30		= byte ptr -30h
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  4
arg_2		= byte ptr  6
arg_4		= byte ptr  8
arg_6		= dword	ptr  0Ah
arg_A		= word ptr  0Eh
arg_C		= word ptr  10h
arg_E		= word ptr  12h

		push	bp
		mov	bp, sp
		sub	sp, 30h
		push	si
		push	di
		push	es
		mov	ax, [bp+arg_A]
		cmp	ax, 28h	; '('
		jbe	loc_2708
		mov	ax, 28h	; '('
		mov	[bp+arg_A], ax

loc_2708::				; CODE XREF: sub_26F1+Fj
		mov	[bp+var_4], ax
		mov	dl, [bp+arg_4]
		and	dl, 0DFh
		cmp	dl, 46h	; 'F'
		jnz	loc_2721
		neg	ax
		jle	loc_272A
		sub	ax, ax
		mov	[bp+arg_A], ax
		jmp	loc_272A
; ---------------------------------------------------------------------------

loc_2721::				; CODE XREF: sub_26F1+23j
		or	ax, ax
		jg	loc_272A
		mov	ax, 1
		jmp	loc_2733
; ---------------------------------------------------------------------------

loc_272A::				; CODE XREF: sub_26F1+27j sub_26F1+2Ej ...
		cmp	dl, 45h	; 'E'
		jnz	loc_2733
		inc	ax
		inc	[bp+arg_A]

loc_2733::				; CODE XREF: sub_26F1+37j sub_26F1+3Cj
		push	[bp+arg_E]
		push	[bp+arg_C]
		push	ax
		push	ss
		lea	bx, [bp+var_2]
		push	bx
		push	ss
		lea	si, [bp+var_30]
		push	si
		mov	ax, [bp+arg_0]
		push	ax
		call	__xcvt
		xchg	ax, bx
		les	di, [bp+arg_6]
		assume es:nothing
		cld
		cmp	bx, 7FFFh
		jz	loc_275E
		cmp	bx, 7FFEh
		jz	loc_2771
		jmp	loc_2783
; ---------------------------------------------------------------------------

loc_275E::				; CODE XREF: sub_26F1+63j
		mov	ax, 'I+'
		cmp	[bp+var_2], 0
		jz	loc_2769
		inc	ax
		inc	ax

loc_2769::				; CODE XREF: sub_26F1+74j
		stosw
		mov	ax, 'FN'
		stosw
		jmp	loc_287A
; ---------------------------------------------------------------------------

loc_2771::				; CODE XREF: sub_26F1+69j
		mov	ax, 'N+'
		cmp	[bp+var_2], 0
		jz	loc_277C
		inc	ax
		inc	ax

loc_277C::				; CODE XREF: sub_26F1+87j
		stosw
		mov	al, 'A'
		stosw
		jmp	loc_287A
; ---------------------------------------------------------------------------

loc_2783::				; CODE XREF: sub_26F1+6Bj
		cmp	byte ptr [bp+var_2], 0
		jz	loc_278C
		mov	al, '-'
		stosb

loc_278C::				; CODE XREF: sub_26F1+96j
		mov	dl, [bp+arg_4]
		and	dl, 5Fh

loc_2792::				; CODE XREF: sub_23CD:loc_2409p
		cmp	dl, 46h	; 'F'
		jz	loc_27AD
		cmp	dl, 45h	; 'E'
		jz	loc_280F
		cmp	bx, 0FFFDh
		jl	loc_280F
		mov	ax, [bp+arg_A]
		or	ax, ax
		jnz	loc_27A9
		inc	ax

loc_27A9::				; CODE XREF: sub_26F1+B5j
		cmp	bx, ax
		jg	loc_280F

loc_27AD::				; CODE XREF: sub_26F1+A4j
		cmp	bx, 40
		jg	loc_280F
		or	bx, bx
		jg	loc_27C5
		mov	ax, '.0'
		stosw
		mov	cx, 1
		jz	loc_27C8
		mov	al, '0'

loc_27C1::				; CODE XREF: sub_26F1+D2j
		stosb
		inc	bx
		jnz	loc_27C1

loc_27C5::				; CODE XREF: sub_26F1+C3j
		mov	cx, 0

loc_27C8::				; CODE XREF: sub_26F1+CCj sub_26F1+DFj ...
		lods	byte ptr ss:[si]
		or	al, al
		jz	loc_27D8
		stosb
		dec	bx
		jnz	loc_27C8
		mov	al, '.'
		stosb
		inc	cx
		jmp	loc_27C8
; ---------------------------------------------------------------------------

loc_27D8::				; CODE XREF: sub_26F1+DBj
		mov	ax, [bp+arg_A]
		add	cx, [bp+var_4]
		cmp	ax, cx
		jbe	loc_27EF
		sub	ax, cx
		mov	cx, ax
		add	bx, ax
		mov	al, '0'
		rep stosb
		dec	bx
		jz	loc_2805

loc_27EF::				; CODE XREF: sub_26F1+EFj
		dec	bx
		jz	loc_2805
		cmp	[bp+arg_2], 0
		jnz	loc_2805
		mov	dl, [bp+arg_4]
		mov	cx, word ptr [bp+arg_6]
		xchg	bx, di
		call	unknown_libname_1 ; TCC/TCC++/BCC++ 16 bit DOS
		xchg	di, bx

loc_2805::				; CODE XREF: sub_26F1+FCj sub_26F1+FFj ...
		cmp	di, word ptr [bp+arg_6]
		jnz	loc_280D
		mov	al, '0'
		stosb

loc_280D::				; CODE XREF: sub_26F1+117j
		jmp	loc_287A
; ---------------------------------------------------------------------------

loc_280F::				; CODE XREF: sub_26F1+A9j sub_26F1+AEj ...
		lods	word ptr ss:[si]
		stosb
		mov	al, '.'
		or	ah, ah
		jnz	loc_2821
		cmp	[bp+arg_2], 0
		jz	loc_283E
		stosb
		jmp	loc_283E
; ---------------------------------------------------------------------------

loc_2821::				; CODE XREF: sub_26F1+125j
		stosb
		mov	al, ah

loc_2824::				; CODE XREF: sub_26F1+138j
		stosb

loc_2825::				; CODE XREF: unknown_libname_3:loc_49E5p
		lods	byte ptr ss:[si]
		or	al, al
		jnz	loc_2824
		cmp	[bp+arg_2], 0
		jnz	loc_283E
		mov	dl, [bp+arg_4]
		mov	cx, word ptr [bp+arg_6]
		xchg	bx, di
		call	unknown_libname_1 ; TCC/TCC++/BCC++ 16 bit DOS
		xchg	di, bx

loc_283E::				; CODE XREF: sub_26F1+12Bj
					; sub_26F1+12Ej ...
		mov	al, ' '
		and	al, [bp+arg_4]
		or	al, 45h
		stosb
		mov	ax, '-+'
		dec	bx
		jge	loc_2850
		xchg	al, ah
		neg	bx

loc_2850::				; CODE XREF: sub_26F1+159j
		stosb
		xchg	ax, bx
		mov	cx, '00'
		cmp	ax, 99
		jbe	loc_2873
		cmp	ax, 999
		jbe	loc_2869
		cwd
		mov	bx, 1000
		div	bx
		add	al, cl
		stosb
		xchg	ax, dx

loc_2869::				; CODE XREF: sub_26F1+16Cj
		mov	bl, 100
		div	bl
		add	al, cl
		stosb
		xchg	al, ah
		cbw

loc_2873::				; CODE XREF: sub_26F1+167j
		mov	bl, 10
		div	bl
		add	ax, cx
		stosw

loc_287A::				; CODE XREF: sub_26F1+7Dj sub_26F1+8Fj ...
		xor	al, al
		stosb
		pop	es
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retn	10h
sub_26F1	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

sub_2886	proc near
		push	bp
		mov	bp, sp
		pop	bp
		retn
sub_2886	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

__xcvt		proc near		; CODE XREF: sub_26F1+57p

var_10		= tbyte	ptr -10h
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  4
arg_2		= dword	ptr  6
arg_6		= dword	ptr  0Ah
arg_A		= word ptr  0Eh
arg_C		= dword	ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 10h
		push	si
		push	di
		mov	[bp+var_2], 8000h
		mov	[bp+var_4], 0Ah
		push	es
		les	di, [bp+arg_C]
		mov	ax, 7FFFh
		mov	bx, [bp+arg_0]
		mov	cx, es:[bx+di]
		and	[bp+var_2], cx
		and	es:[bx+di], ax
		shr	bx, 1
		shr	bx, 1
		shl	bx, 1
		jmp	word ptr cs:loc_28BB[bx]
; ---------------------------------------------------------------------------

loc_28BB::				; CODE XREF: sub_4120+4Ap
					; DATA XREF: __xcvt+2Br
		loope	loc_28C1+2
		out	6, ax		; DMA controller, 8237A-5.
					; channel 3 base address
					; (also	sets current address)
		in	ax, dx
		push	es

loc_28C1::				; CODE XREF: __xcvt+2Bj
					; __xcvt:loc_28BBj
		fld	dword ptr es:[di] ; (emulator call)
		jmp	loc_28DE
; ---------------------------------------------------------------------------

loc_28C7::				; CODE XREF: __xcvt+2Bj
		fld	qword ptr es:[di] ; (emulator call)
		jmp	loc_28DE
; ---------------------------------------------------------------------------

loc_28CD::				; CODE XREF: __xcvt+2Bj
		and	ax, es:[di+8]
		cmp	ax, 7FFFh
		jz	loc_28DA
		and	byte ptr es:[di], 0F0h

loc_28DA::				; CODE XREF: __xcvt+49j
		fld	tbyte ptr es:[di] ; (emulator call)

loc_28DE::				; CODE XREF: __xcvt+3Aj __xcvt+40j
		xor	bx, bx
		shl	cx, 1
		rcl	bx, 1
		les	di, [bp+arg_6]
		mov	es:[di], bx
		fxam			; (emulator call)
		fnstsw	[bp+var_6]	; (emulator call)
		wait			; (emulator call)
		mov	ax, [bp+var_6]
		and	ah, 47h
		cmp	ah, 40h	; '@'
		jz	short loc_2914
		cmp	ah, 5
		jz	short loc_290F
		cmp	ah, 1
		jz	short loc_290A
		jmp	short loc_293A
; ---------------------------------------------------------------------------

loc_290A::				; CODE XREF: __xcvt+7Bj
		mov	dx, 7FFEh
		jmp	short loc_2934
; ---------------------------------------------------------------------------

loc_290F::				; CODE XREF: __xcvt+76j
		mov	dx, 7FFFh
		jmp	short loc_2934
; ---------------------------------------------------------------------------

loc_2914::				; CODE XREF: __xcvt+71j __xcvt+E2j ...
		mov	dx, 1
		mov	al, 30h	; '0'
		mov	cx, [bp+arg_A]
		or	cx, cx
		jg	short loc_2923
		neg	cx
		inc	cx

loc_2923::				; CODE XREF: __xcvt+93j
		cmp	cx, 28h	; '('
		jbe	short loc_292B
		mov	cx, 28h	; '('

loc_292B::				; CODE XREF: __xcvt+9Bj
		cld
		les	di, [bp+arg_2]
		rep stosb
		xor	al, al
		stosb

loc_2934::				; CODE XREF: __xcvt+82j __xcvt+87j
		fstp	st		; (emulator call)
		jmp	loc_2A7F
; ---------------------------------------------------------------------------

loc_293A::				; CODE XREF: __xcvt+7Dj
		fld	st		; (emulator call)
		fstp	[bp+var_10]	; (emulator call)
		wait			; (emulator call)
		mov	ax, word ptr [bp+var_10+8]
		sub	ax, 16383
		mov	dx, 19728
		imul	dx
		xchg	ax, bx
		mov	ah, 4Dh	; 'M'
		mov	al, byte ptr [bp+var_10+7]
		shl	al, 1
		mul	ah
		add	ax, bx
		adc	dx, 0
		neg	ax
		adc	dx, 0
		mov	ax, [bp+arg_A]
		or	ax, ax
		jg	loc_296F
		neg	ax
		add	ax, dx
		jl	loc_2914

loc_296F::				; CODE XREF: __xcvt+DCj
		cmp	ax, 12h
		jle	loc_2977
		mov	ax, 12h

loc_2977::				; CODE XREF: __xcvt+E7j
		mov	bx, ax
		sub	ax, dx

loc_297B::				; CODE XREF: __xcvt+110j __xcvt+118j
		jz	loc_29A5
		mov	si, ax
		jge	loc_2983
		neg	ax

loc_2983::				; CODE XREF: __xcvt+F4j
		cmp	ax, 1344h
		jle	loc_298B
		mov	ax, 1344h

loc_298B::				; CODE XREF: __xcvt+FBj
		push	ax		; p
		nop
		push	cs
		call	near ptr _pow10
		pop	ax
		or	si, si
		jg	loc_299D
		fdivp	st(1), st	; (emulator call)
		add	ax, si
		jmp	loc_297B
; ---------------------------------------------------------------------------

loc_299D::				; CODE XREF: __xcvt+109j
		fmulp	st(1), st	; (emulator call)
		xchg	ax, si
		sub	ax, si
		jmp	loc_297B
; ---------------------------------------------------------------------------

loc_29A5::				; CODE XREF: __xcvt:loc_297Bj
		push	bx		; p
		nop
		push	cs
		call	near ptr _pow10
		pop	ax
		fcomp	st(1)		; (emulator call)
		fnstsw	[bp+var_6]	; (emulator call)
		wait			; (emulator call)
		test	byte ptr [bp+var_6+1], 45h
		jz	loc_29CF
		inc	dx
		inc	bx
		cmp	bx, 12h
		ja	loc_29C8
		cmp	[bp+arg_A], 0
		jle	loc_29F5

loc_29C8::				; CODE XREF: __xcvt+135j
		fidiv	[bp+var_4]	; (emulator call)
		dec	bx
		jmp	loc_29F5
; ---------------------------------------------------------------------------

loc_29CF::				; CODE XREF: __xcvt+12Ej
		mov	ax, bx
		dec	ax
		push	ax		; p
		nop
		push	cs
		call	near ptr _pow10
		pop	ax
		fcomp	st(1)		; (emulator call)
		fnstsw	[bp+var_6]	; (emulator call)
		wait			; (emulator call)
		test	byte ptr [bp+var_6+1], 41h
		jnz	loc_29F5
		dec	dx
		dec	bx
		cmp	[bp+arg_A], 0
		jle	loc_29F5
		fimul	[bp+var_4]	; (emulator call)
		inc	bx

loc_29F5::				; CODE XREF: __xcvt+13Bj __xcvt+142j ...
		or	bx, bx
		jl	loc_2A1E
		frndint			; (emulator call)
		fbstp	[bp+var_10]	; (emulator call)
		les	di, [bp+arg_2]
		add	di, bx
		push	di
		xor	al, al
		std
		stosb
		lea	si, [bp+var_10]
		mov	cx, 4
		wait			; (emulator call)
		or	bx, bx
		jnz	loc_2A25
		mov	ch, ss:[si]
		xor	ch, 1
		jz	loc_2A40

loc_2A1E::				; CODE XREF: __xcvt+16Cj
		fldz			; (emulator call)
		pop	di
		jmp	loc_2914
; ---------------------------------------------------------------------------

loc_2A25::				; CODE XREF: __xcvt+189j __xcvt+1B3j
		mov	al, ss:[si]
		inc	si
		mov	ah, al
		shr	ah, cl
		and	al, 0Fh
		add	ax, '00'
		stosb
		or	ch, al
		dec	bx
		jz	loc_2A40
		mov	al, ah
		stosb
		or	ch, al
		dec	bx
		jnz	loc_2A25

loc_2A40::				; CODE XREF: __xcvt+191j __xcvt+1ABj
		pop	bx
		and	ch, 0Fh
		jnz	loc_2A57
		inc	dx
		cmp	[bp+arg_A], 0
		jg	loc_2A51
		mov	byte ptr es:[bx], '0'

loc_2A51::				; CODE XREF: __xcvt+1C0j
		inc	bx
		mov	byte ptr es:[di+1], '1'

loc_2A57::				; CODE XREF: __xcvt+1B9j
		mov	cx, [bp+arg_A]
		or	cx, cx
		jg	loc_2A62
		neg	cx
		add	cx, dx

loc_2A62::				; CODE XREF: __xcvt+1D1j
		cmp	cx, 28h	; '('
		jbe	loc_2A6A
		mov	cx, 28h	; '('

loc_2A6A::				; CODE XREF: __xcvt+1DAj
		mov	byte ptr es:[bx], 0
		mov	ax, bx
		sub	ax, word ptr [bp+arg_2]
		sub	cx, ax
		jbe	loc_2A7F

loc_2A77::				; CODE XREF: __xcvt+1F2j
		mov	word ptr es:[bx], '0'
		inc	bx
		loop	loc_2A77

loc_2A7F::				; CODE XREF: __xcvt+ACj __xcvt+1EAj
		cld
		les	di, [bp+arg_C]
		mov	bx, [bp+arg_0]
		mov	cx, [bp+var_2]
		or	es:[bx+di], cx
		pop	es
		mov	ax, dx
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retn	10h
__xcvt		endp ; sp-analysis failed


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

__fperror	proc near		; CODE XREF: seg0000:02F4p

var_8		= dword	ptr -8
var_4		= dword	ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 8
		mov	word ptr [bp+var_4+2], ss
		mov	word ptr [bp+var_4], bx
		mov	ax, word ptr ___signalptr
		or	ax, word ptr ___signalptr+2
		jz	loc_2B13
		xor	ax, ax
		xor	dx, dx
		push	ax
		push	dx
		mov	ax, 8
		push	ax
		call	___signalptr
		add	sp, 6
		mov	word ptr [bp+var_8+2], dx
		mov	word ptr [bp+var_8], ax
		push	dx
		push	ax
		mov	ax, 8
		push	ax
		call	___signalptr
		add	sp, 6
		cmp	word ptr [bp+var_8+2], 0
		jnz	loc_2ADC
		cmp	word ptr [bp+var_8], 1
		jz	loc_2B44

loc_2ADC::				; CODE XREF: __fperror+3Dj
		mov	ax, word ptr [bp+var_8]
		or	ax, word ptr [bp+var_8+2]
		jz	loc_2B13
		xor	ax, ax
		xor	dx, dx
		push	ax
		push	dx
		mov	ax, 8
		push	ax
		call	___signalptr
		add	sp, 6
		les	bx, [bp+var_4]
		mov	ax, es:[bx]
		mov	dx, 6
		imul	dx
		mov	bx, ax
		push	word ptr __protected[bx]
		mov	ax, 8
		push	ax
		call	[bp+var_8]
		pop	cx
		pop	cx
		jmp	loc_2B44
; ---------------------------------------------------------------------------
		jmp	loc_2B44
; ---------------------------------------------------------------------------

loc_2B13::				; CODE XREF: __fperror+13j
					; __fperror+4Bj
		les	bx, [bp+var_4]
		mov	ax, es:[bx]
		mov	dx, 6
		imul	dx
		mov	dx, offset __protected
		add	dx, 2
		add	ax, dx
		mov	bx, ax
		push	word ptr [bx+2]
		push	word ptr [bx]
		push	ds
		mov	ax, offset aFloatingPointE ; "Floating point error: %s.\n"
		push	ax		; format
		push	ds
		mov	ax, offset stru_2B128
		push	ax		; stream
		nop
		push	cs
		call	near ptr _fprintf
		add	sp, 0Ch
		nop
		push	cs
		call	_abort
; ---------------------------------------------------------------------------

loc_2B44::				; CODE XREF: __fperror+43j
					; __fperror+78j ...
		mov	sp, bp
		pop	bp
		retn
__fperror	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

__pow10		proc near		; CODE XREF: _pow10+6p

arg_0		= word ptr  4

		push	bp
		mov	bp, sp
		push	si
		mov	ax, [bp+arg_0]
		cmp	ax, 0ECBCh
		jge	loc_2B5A
		fldz			; (emulator call)
		jmp	loc_2C0C
; ---------------------------------------------------------------------------

loc_2B5A::				; CODE XREF: __pow10+Aj
		cmp	ax, 1344h
		jle	loc_2B67
		fld	flt_2AFEC	; (emulator call)
		jmp	loc_2C0C
; ---------------------------------------------------------------------------

loc_2B67::				; CODE XREF: __pow10+15j
		or	ax, ax
		jnz	loc_2B71
		fld1			; (emulator call)
		jmp	loc_2C0C
; ---------------------------------------------------------------------------

loc_2B71::				; CODE XREF: __pow10+21j
		or	ax, ax
		jge	loc_2B77
		neg	ax

loc_2B77::				; CODE XREF: __pow10+2Bj
		mov	si, 7
		and	si, ax
		shl	si, 1
		shl	si, 1
		fld	flt_2AF70[si]	; (emulator call)
		shr	ax, 1
		shr	ax, 1
		shr	ax, 1
		shr	ax, 1
		jnb	loc_2B94
		fmul	flt_2AF90	; (emulator call)

loc_2B94::				; CODE XREF: __pow10+45j
		jnz	loc_2B98
		jmp	loc_2C01
; ---------------------------------------------------------------------------

loc_2B98::				; CODE XREF: __pow10:loc_2B94j
		shr	ax, 1
		jnb	loc_2BA1
		fmul	dbl_2AF94	; (emulator call)

loc_2BA1::				; CODE XREF: __pow10+52j
		shr	ax, 1
		jnb	loc_2BAD
		fld	tbyte_2AF9C	; (emulator call)
		fmulp	st(1), st	; (emulator call)

loc_2BAD::				; CODE XREF: __pow10+5Bj
		shr	ax, 1
		jnb	loc_2BB9
		fld	tbyte_2AFA6	; (emulator call)
		fmulp	st(1), st	; (emulator call)

loc_2BB9::				; CODE XREF: __pow10+67j
		shr	ax, 1
		jnb	loc_2BC5
		fld	tbyte_2AFB0	; (emulator call)
		fmulp	st(1), st	; (emulator call)

loc_2BC5::				; CODE XREF: __pow10+73j
		shr	ax, 1
		jnb	loc_2BD1
		fld	tbyte_2AFBA	; (emulator call)
		fmulp	st(1), st	; (emulator call)

loc_2BD1::				; CODE XREF: __pow10+7Fj
		shr	ax, 1
		jnb	loc_2BDD
		fld	tbyte_2AFC4	; (emulator call)
		fmulp	st(1), st	; (emulator call)

loc_2BDD::				; CODE XREF: __pow10+8Bj
		shr	ax, 1
		jnb	loc_2BE9
		fld	tbyte_2AFCE	; (emulator call)
		fmulp	st(1), st	; (emulator call)

loc_2BE9::				; CODE XREF: __pow10+97j
		shr	ax, 1
		jnb	loc_2BF5
		fld	tbyte_2AFD8	; (emulator call)
		fmulp	st(1), st	; (emulator call)

loc_2BF5::				; CODE XREF: __pow10+A3j
		shr	ax, 1
		jnb	loc_2C01
		fld	tbyte_2AFE2	; (emulator call)
		fmulp	st(1), st	; (emulator call)

loc_2C01::				; CODE XREF: __pow10+4Ej __pow10+AFj
		test	byte ptr [bp+arg_0+1], 80h
		jz	loc_2C0C
		fdivr	flt_2AF70	; (emulator call)

loc_2C0C::				; CODE XREF: __pow10+Fj __pow10+1Cj ...
		pop	si
		pop	bp
		retn	2
__pow10		endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; double __cdecl pow10(int p)
_pow10		proc far		; CODE XREF: __xcvt+103p __xcvt+11Dp ...

p		= word ptr  6

		push	bp
		mov	bp, sp
		push	[bp+p]
		call	__pow10
		pop	bp
		retf
_pow10		endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

ftol@		proc far		; CODE XREF: show_stats(void)+110P
					; show_stats(void)+138P ...

var_A		= qword	ptr -0Ah
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 0Ah
		fnstcw	[bp+var_2]	; (emulator call)
		wait			; (emulator call)
		mov	al, byte ptr [bp+var_2+1]
		or	byte ptr [bp+var_2+1], 0Ch
		fldcw	[bp+var_2]	; (emulator call)
		fistp	[bp+var_A]	; (emulator call)
		mov	byte ptr [bp+var_2+1], al
		fldcw	[bp+var_2]	; (emulator call)
		mov	ax, word ptr [bp+var_A]
		mov	dx, word ptr [bp+var_A+2]
		mov	sp, bp
		pop	bp
		retf
ftol@		endp

		assume es:seg2608

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; int __cdecl atexit(void (*func)(void))
_atexit		proc far		; CODE XREF: _gr_start_kbd_grab+4EP

func		= dword	ptr  6

		push	bp
		mov	bp, sp
		cmp	__atexitcnt, 20h ; ' '
		jnz	loc_2C57
		mov	ax, 1
		jmp	loc_2C73
; ---------------------------------------------------------------------------

loc_2C57::				; CODE XREF: _atexit+8j
		mov	bx, __atexitcnt
		mov	cl, 2
		shl	bx, cl
		mov	ax, word ptr [bp+func+2]
		mov	dx, word ptr [bp+func]
		mov	word_2D66A[bx],	ax
		mov	__atexittbl[bx], dx
		inc	__atexitcnt
		xor	ax, ax

loc_2C73::				; CODE XREF: _atexit+Dj
		pop	bp
		retf
_atexit		endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; int __cdecl chdir(const char *path)
_chdir		proc far		; CODE XREF: i_load_file(uchar *,uchar *)+CCP

path_		= dword	ptr  6

		push	bp
		mov	bp, sp
		push	ds
		mov	ah, 3Bh	; ';'
		lds	dx, [bp+path_]
		int	21h		; DOS -	2+ - CHANGE THE	CURRENT	DIRECTORY (CHDIR)
					; DS:DX	-> ASCIZ directory name	(may include drive)
		pop	ds
		jb	loc_2C87
		xor	ax, ax
		jmp	loc_2C8B
; ---------------------------------------------------------------------------

loc_2C87::				; CODE XREF: _chdir+Cj
		push	ax
		call	__ioerror

loc_2C8B::				; CODE XREF: _chdir+10j
		pop	bp
		retf
_chdir		endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; clock_t clock(void)
_clock		proc far		; CODE XREF: init_game(void)+22DP
					; init_game(void)+2AAP	...

var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 4
		xor	ah, ah
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		add	byte_2D6E8, al
		mov	[bp+var_4], dx
		mov	[bp+var_2], cx
		or	al, al
		jz	loc_2CB4
		mov	ax, 40h	; '@'
		mov	es, ax
		assume es:nothing
		mov	byte ptr es:70h, 1
		mov	ah, 2Ah
		int	21h		; DOS -	GET CURRENT DATE
					; Return: DL = day, DH = month,	CX = year
					; AL = day of the week (0=Sunday, 1=Monday, etc.)
		assume es:seg2608

loc_2CB4::				; CODE XREF: _clock+16j
		cmp	byte_2D6E8, 0
		jz	loc_2CC4
		add	[bp+var_4], 0B0h ; '°'
		adc	[bp+var_2], 18h

loc_2CC4::				; CODE XREF: _clock+2Cj
		mov	dx, [bp+var_2]
		mov	ax, [bp+var_4]
		sub	ax, word ptr __starttime
		sbb	dx, word ptr __starttime+2
		mov	sp, bp
		pop	bp
		retf
_clock		endp

		assume es:nothing

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

; int __cdecl __far operator delete(void far *block)
@$bdele$qnv	proc far		; CODE XREF: end_game(void)+163P
					; end_game(void):loc_7BC2P ...

block		= dword	ptr  6

		push	bp
		mov	bp, sp
		push	word ptr [bp+block+2]
		push	word ptr [bp+block] ; block
		nop
		push	cs
		call	near ptr _farfree
		pop	cx
		pop	cx
		pop	bp
		retf
@$bdele$qnv	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; unsigned int __cdecl _dos_getfileattr(const char *filename, unsigned int *attrib)
__dos_getfileattr proc far		; CODE XREF: __tmpnam+43p

filename	= dword	ptr  6
attrib		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		push	ds
		mov	ah, 43h	; 'C'
		xor	al, al
		lds	dx, [bp+filename]
		int	21h		; DOS -	2+ - GET FILE ATTRIBUTES
					; DS:DX	-> ASCIZ file name or directory
					; name without trailing	slash
		pop	ds
		jb	loc_2D02
		les	bx, [bp+attrib]
		assume es:nothing
		mov	es:[bx], cx
		xor	ax, ax
		jmp	loc_2D06
; ---------------------------------------------------------------------------

loc_2D02::				; CODE XREF: __dos_getfileattr+Ej
		push	ax
		call	__doserror

loc_2D06::				; CODE XREF: __dos_getfileattr+18j
		pop	bp
		retf
__dos_getfileattr endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; unsigned int __cdecl _dos_setfileattr(const char *filename, unsigned int attrib)
__dos_setfileattr proc far

filename	= dword	ptr  6
attrib		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	ds
		mov	ah, 43h	; 'C'
		mov	al, 1
		lds	dx, [bp+filename]
		mov	cx, [bp+attrib]
		int	21h		; DOS -	2+ - SET FILE ATTRIBUTES
					; DS:DX	-> ASCIZ file name
					; CX = file attribute bits
		pop	ds
		jb	loc_2D1F
		xor	ax, ax
		jmp	loc_2D23
; ---------------------------------------------------------------------------

loc_2D1F::				; CODE XREF: __dos_setfileattr+11j
		push	ax
		call	__doserror

loc_2D23::				; CODE XREF: __dos_setfileattr+15j
		pop	bp
		retf
__dos_setfileattr endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; void __cdecl _dos_getdrive(unsigned int *drive)
__dos_getdrive	proc far		; CODE XREF: _getdisk+Dp

drive		= dword	ptr  6

		push	bp
		mov	bp, sp
		mov	ah, 19h
		int	21h		; DOS -	GET DEFAULT DISK NUMBER
		mov	ah, 0
		inc	ax
		les	bx, [bp+drive]
		mov	es:[bx], ax
		pop	bp
		retf
__dos_getdrive	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; void __cdecl _dos_setdrive(unsigned int drive, unsigned int *ndrives)
__dos_setdrive	proc far		; CODE XREF: _setdisk+12p

drive		= word ptr  6
ndrives		= dword	ptr  8

		push	bp
		mov	bp, sp
		mov	dl, byte ptr [bp+drive]
		dec	dl
		mov	ah, 0Eh
		int	21h		; DOS -	SELECT DISK
					; DL = new default drive number	(0 = A,	1 = B, etc.)
					; Return: AL = number of logical drives
		mov	ah, 0
		les	bx, [bp+ndrives]
		mov	es:[bx], ax
		pop	bp
		retf
__dos_setdrive	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

nullsub_1	proc far		; CODE XREF: sub_2D4E+29P sub_2D4E+41P ...
		retf
nullsub_1	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

sub_2D4E	proc near		; CODE XREF: _exit+Ap __exit+Dp ...

arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_4]
		or	si, si
		jnz	loc_2D7B
		jmp	loc_2D6B
; ---------------------------------------------------------------------------

loc_2D5B::				; CODE XREF: sub_2D4E+22j
		dec	__atexitcnt
		mov	bx, __atexitcnt
		mov	cl, 2
		shl	bx, cl
		call	dword ptr __atexittbl[bx]

loc_2D6B::				; CODE XREF: sub_2D4E+Bj
		cmp	__atexitcnt, 0
		jnz	loc_2D5B
		nop
		push	cs
		call	__cleanup
; ---------------------------------------------------------------------------
		call	__exitbuf

loc_2D7B::				; CODE XREF: sub_2D4E+9j
		nop
		push	cs
		call	near ptr __restorezero
		nop
		push	cs
		call	near ptr __checknull
		cmp	[bp+arg_2], 0
		jnz	loc_2DA0
		or	si, si
		jnz	loc_2D97
		call	__exitfopen
		call	__exitopen

loc_2D97::				; CODE XREF: sub_2D4E+3Fj
		push	[bp+arg_0]
		nop
		push	cs
		call	__terminate
; ---------------------------------------------------------------------------
		pop	cx

loc_2DA0::				; CODE XREF: sub_2D4E+3Bj
		pop	si
		pop	bp
		retn	6
sub_2D4E	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function noreturn	bp-based frame

; void __cdecl exit(int	status)
_exit		proc far		; CODE XREF: start+154p seg0fa9:0ADAP	...

status		= word ptr  6

		push	bp
		mov	bp, sp
		xor	ax, ax
		push	ax
		push	ax
		push	[bp+status]
		call	sub_2D4E
		pop	bp
		retf
_exit		endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function noreturn	bp-based frame

; void __cdecl _exit(int status)
__exit		proc far		; CODE XREF: _abort+14p

status		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 1
		push	ax
		xor	ax, ax
		push	ax
		push	[bp+status]
		call	sub_2D4E
		pop	bp
		retf
__exit		endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; void _cexit(void)
__cexit		proc far
		xor	ax, ax
		push	ax
		mov	ax, 1
		push	ax
		xor	ax, ax
		push	ax
		call	sub_2D4E
		retf
__cexit		endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; void _c_exit(void)
__c_exit	proc far
		mov	ax, 1
		push	ax
		push	ax
		xor	ax, ax
		push	ax
		call	sub_2D4E
		retf
__c_exit	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

scopy@		proc far		; CODE XREF: save_new_score(ulong,uchar	*,uchar)+33P
					; return_element(uchar,uchar)+10P

arg_0		= dword	ptr  6
arg_4		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		push	ds
		lds	si, [bp+arg_0]
		les	di, [bp+arg_4]
		cld
		shr	cx, 1
		rep movsw
		adc	cx, cx
		rep movsb
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf	8
scopy@		endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; int __cdecl getcurdir(int drive, char	*directory)
_getcurdir	proc far		; CODE XREF: file_box::current_directory(uchar *)+2EP

drive		= word ptr  6
directory	= dword	ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	ds
		mov	ah, 47h	; 'G'
		mov	dl, byte ptr [bp+drive]
		lds	si, [bp+directory]
		int	21h		; DOS -	2+ - GET CURRENT DIRECTORY
					; DL = drive (0=default, 1=A, etc.)
					; DS:SI	points to 64-byte buffer area
		pop	ds
		jb	loc_2E12
		xor	ax, ax
		jmp	loc_2E16
; ---------------------------------------------------------------------------

loc_2E12::				; CODE XREF: _getcurdir+10j
		push	ax
		call	__ioerror

loc_2E16::				; CODE XREF: _getcurdir+14j
		pop	si
		pop	bp
		retf
_getcurdir	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; int getdisk(void)
_getdisk	proc far		; CODE XREF: file_box::current_directory(uchar *)+15P

drive		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	ss
		lea	ax, [bp+drive]
		push	ax		; drive
		nop
		push	cs
		call	near ptr __dos_getdrive
		pop	cx
		pop	cx
		mov	ax, [bp+drive]
		dec	ax
		mov	sp, bp
		pop	bp
		retf
_getdisk	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; int __cdecl setdisk(int drive)
_setdisk	proc far

ndrives		= word ptr -2
drive		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	ss
		lea	ax, [bp+ndrives]
		push	ax		; ndrives
		mov	ax, [bp+drive]
		inc	ax
		push	ax		; drive
		nop

loc_2E44::				; CODE XREF: sub_2433E+81p
					; sub_24429+Ep	...
		push	cs
		call	near ptr __dos_setdrive
		add	sp, 6
		mov	ax, [bp+ndrives]
		mov	sp, bp
		pop	bp
		retf
_setdisk	endp

		assume es:seg2608

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; void (__cdecl	__interrupt far	*__cdecl getvect(int interruptno))()
_getvect	proc far		; CODE XREF: game_manager::game_manager(uchar *)+17AP
					; _gr_start_kbd_grab+13P

interruptno	= word ptr  6

		push	bp
		mov	bp, sp
		mov	ah, 35h	; '5'
		mov	al, byte ptr [bp+interruptno]
		int	21h		; DOS -	2+ - GET INTERRUPT VECTOR
					; AL = interrupt number
					; Return: ES:BX	= value	of interrupt vector
		assume es:nothing
		xchg	ax, bx
		mov	dx, es
		pop	bp
		retf
_getvect	endp

		assume es:seg2608

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; void __cdecl setvect(int interruptno,	void (__interrupt far *isr)())
_setvect	proc far		; CODE XREF: game_manager::game_manager(uchar *)+18FP
					; game_manager::~game_manager(void)+37P ...

interruptno	= word ptr  6
isr		= dword	ptr  8

		push	bp
		mov	bp, sp
		mov	ah, 25h	; '%'
		mov	al, byte ptr [bp+interruptno]
		push	ds
		lds	dx, [bp+isr]
		assume ds:seg1a07
		int	21h		; DOS -	SET INTERRUPT VECTOR
					; AL = interrupt number
					; DS:DX	= new vector to	be used	for specified interrupt
		pop	ds
		assume ds:seg2608
		pop	bp
		retf
_setvect	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

n_lxlsh@	proc far		; CODE XREF: __sbrk+Dp
		pop	bx
		push	cs
		push	bx

f_lxlsh@:
		cmp	cl, 10h
		jnb	loc_2E8A
		mov	bx, ax
		shl	ax, cl
		shl	dx, cl

loc_2E80::				; CODE XREF: _startworx+3p
		neg	cl
		add	cl, 10h
		shr	bx, cl
		or	dx, bx
		retf
; ---------------------------------------------------------------------------

loc_2E8A::				; CODE XREF: n_lxlsh@+6j
		sub	cl, 10h
		xchg	ax, dx
		xor	ax, ax
		shl	dx, cl
		retf
n_lxlsh@	endp ; sp-analysis failed


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

n_padd@		proc far		; CODE XREF: sub_420D+6p
		pop	es
		assume es:nothing
		push	cs
		push	es

padd@:
		or	cx, cx
		jge	loc_2EA6
		not	bx
		not	cx
		add	bx, 1
		adc	cx, 0
		jmp	loc_2ED5
; ---------------------------------------------------------------------------

loc_2EA6::				; CODE XREF: n_padd@+5j n_padd@+40j
		add	ax, bx
		jnb	loc_2EAE
		add	dx, 1000h

loc_2EAE::				; CODE XREF: n_padd@+15j
		mov	ch, cl
		mov	cl, 4
		shl	ch, cl
		add	dh, ch
		mov	ch, al
		shr	ax, cl
		add	dx, ax
		mov	al, ch
		and	ax, 0Fh
		retf
; ---------------------------------------------------------------------------

n_psub@:
		pop	es
		assume es:nothing
		push	cs
		push	es

psub@:
		or	cx, cx
		jge	loc_2ED5
		not	bx
		not	cx
		add	bx, 1
		adc	cx, 0
		jmp	loc_2EA6
; ---------------------------------------------------------------------------

loc_2ED5::				; CODE XREF: n_padd@+11j n_padd@+34j
		sub	ax, bx
		jnb	loc_2EDD
		sub	dx, 1000h

loc_2EDD::				; CODE XREF: n_padd@+44j
		mov	bh, cl
		mov	cl, 4
		shl	bh, cl
		xor	bl, bl
		sub	dx, bx
		mov	ch, al
		shr	ax, cl
		add	dx, ax
		mov	al, ch
		and	ax, 0Fh
		retf
n_padd@		endp ; sp-analysis failed

		assume es:nothing

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

n_psbp@		proc far		; CODE XREF: _farcoreleft+1Fp
		pop	es
		assume es:nothing
		push	cs
		push	es

f_psbp@:
		push	di
		mov	di, cx
		mov	ch, dh
		mov	cl, 4
		shl	dx, cl
		shr	ch, cl
		add	dx, ax
		adc	ch, 0
		mov	ax, di
		shl	di, cl
		shr	ah, cl
		add	bx, di
		adc	ah, 0
		sub	dx, bx
		sbb	ch, ah
		mov	al, ch
		cbw
		xchg	ax, dx
		pop	di
		retf
n_psbp@		endp ; sp-analysis failed

		assume es:seg2608

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

__ioerror	proc near		; CODE XREF: _chdir+13p _getcurdir+17p ...

arg_0		= word ptr  4

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jl	loc_2F3B
		cmp	si, 58h	; 'X'
		jle	loc_2F2E

loc_2F2B::				; CODE XREF: __ioerror+25j
		mov	si, 57h	; 'W'

loc_2F2E::				; CODE XREF: __ioerror+Ej
		mov	__doserrno, si
		mov	al, __doserrortosv[si]
		cbw
		mov	si, ax
		jmp	loc_2F48
; ---------------------------------------------------------------------------

loc_2F3B::				; CODE XREF: __ioerror+9j
		neg	si
		cmp	si, 30h	; '0'
		jg	loc_2F2B
		mov	__doserrno, 0FFFFh

loc_2F48::				; CODE XREF: __ioerror+1Ej
		mov	_errno,	si
		mov	ax, 0FFFFh
		pop	si
		pop	bp
		retn	2
__ioerror	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

__doserror	proc near		; CODE XREF: __dos_getfileattr+1Bp
					; __dos_setfileattr+18p

arg_0		= word ptr  4

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_0]
		push	si
		call	__ioerror
		mov	ax, si
		pop	si
		pop	bp
		retn	2
__doserror	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; int __cdecl isatty(int handle)
_isatty		proc far		; CODE XREF: __setupio+48p
					; __setupio+84p ...

handle		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, 4400h
		mov	bx, [bp+handle]
		int	21h		; DOS -	2+ - IOCTL - GET DEVICE	INFORMATION
					; BX = file or device handle
		xchg	ax, dx
		and	ax, 80h
		pop	bp
		retf
_isatty		endp

		assume es:nothing

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

__longtoa	proc near		; CODE XREF: __utoa+19p
					; __vprinter+220p ...

var_22		= byte ptr -22h
arg_0		= byte ptr  4
arg_2		= byte ptr  6
arg_4		= word ptr  8
arg_6		= dword	ptr  0Ah
arg_A		= word ptr  0Eh
arg_C		= word ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 22h
		push	si
		push	di
		push	es
		les	di, [bp+arg_6]
		assume es:seg2608
		mov	bx, [bp+arg_4]
		cmp	bx, 24h	; '$'
		ja	loc_2FE7
		cmp	bl, 2
		jb	loc_2FE7
		mov	ax, [bp+arg_A]
		mov	cx, [bp+arg_C]
		or	cx, cx
		jge	loc_2FAC
		cmp	[bp+arg_2], 0
		jz	loc_2FAC
		mov	byte ptr es:[di], 2Dh ;	'-'
		inc	di
		neg	cx
		neg	ax
		sbb	cx, 0

loc_2FAC::				; CODE XREF: __longtoa+21j
					; __longtoa+27j
		lea	si, [bp+var_22]
		jcxz	loc_2FC1

loc_2FB1::				; CODE XREF: __longtoa+48j
		xchg	ax, cx
		sub	dx, dx
		div	bx
		xchg	ax, cx
		div	bx
		mov	ss:[si], dl
		inc	si
		jcxz	loc_2FC9
		jmp	loc_2FB1
; ---------------------------------------------------------------------------

loc_2FC1::				; CODE XREF: __longtoa+38j
					; __longtoa+54j
		sub	dx, dx
		div	bx
		mov	ss:[si], dl
		inc	si

loc_2FC9::				; CODE XREF: __longtoa+46j
		or	ax, ax
		jnz	loc_2FC1
		lea	cx, [bp+var_22]
		neg	cx
		add	cx, si
		cld

loc_2FD5::				; CODE XREF: __longtoa+6Ej
		dec	si
		mov	al, ss:[si]
		sub	al, 0Ah
		jnb	loc_2FE1
		add	al, 3Ah	; ':'
		jmp	loc_2FE4
; ---------------------------------------------------------------------------

loc_2FE1::				; CODE XREF: __longtoa+64j
		add	al, [bp+arg_0]

loc_2FE4::				; CODE XREF: __longtoa+68j
		stosb
		loop	loc_2FD5

loc_2FE7::				; CODE XREF: __longtoa+12j
					; __longtoa+17j
		mov	al, 0
		stosb
		pop	es
		assume es:nothing

loc_2FEB::				; CODE XREF: sub_2192A+8p
					; sub_2192A+11p ...
		mov	dx, word ptr [bp+arg_6+2]
		mov	ax, word ptr [bp+arg_6]
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retn	0Eh
__longtoa	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

__utoa		proc near		; CODE XREF: __mkname+3Dp

arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8

		push	bp

loc_2FFA::				; CODE XREF: sub_219F3+1Dp
		mov	bp, sp
		xor	ax, ax
		push	ax
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	[bp+arg_0]
		mov	ax, 0Ah
		push	ax
		mov	al, 0
		push	ax
		mov	al, 61h	; 'a'
		push	ax
		call	__longtoa
		pop	bp
		retn	6
__utoa		endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; __int32 __cdecl lseek(int handle, __int32 offset, int	fromwhere)
_lseek		proc far		; CODE XREF: _fseek+66p _ftell+1Bp ...

handle		= word ptr  6
offset_		= dword	ptr  8
fromwhere	= word ptr  0Ch

		push	bp
		mov	bp, sp
		mov	bx, [bp+handle]
		shl	bx, 1
		and	__openfd[bx], 0FDFFh
		mov	ah, 42h	; 'B'
		mov	al, byte ptr [bp+fromwhere]
		mov	bx, [bp+handle]
		mov	cx, word ptr [bp+offset_+2]
		mov	dx, word ptr [bp+offset_]
		int	21h		; DOS -	2+ - MOVE FILE READ/WRITE POINTER (LSEEK)
					; AL = method:
					; 0-from beginnig,1-from current,2-from	end
		jb	loc_303B
		jmp	loc_3040
; ---------------------------------------------------------------------------

loc_303B::				; CODE XREF: _lseek+1Ej
		push	ax
		call	__ioerror
		cwd

loc_3040::				; CODE XREF: _lseek+20j
		pop	bp
		retf
_lseek		endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; int __stdcall	_mkname(int, int, int, char *dest)
__mkname	proc near		; CODE XREF: __tmpnam+2Dp _fclose+9Ep

arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8
dest		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, word ptr [bp+dest]
		or	ax, word ptr [bp+dest+2]
		jnz	loc_3055
		mov	word ptr [bp+dest+2], ds
		mov	word ptr [bp+dest], offset unk_2D6EA

loc_3055::				; CODE XREF: __mkname+9j
		push	[bp+arg_0]
		mov	ax, [bp+arg_2]
		or	ax, [bp+arg_4]
		jnz	loc_3067
		mov	dx, ds
		mov	ax, offset aTmp	; "TMP"
		jmp	loc_306D
; ---------------------------------------------------------------------------

loc_3067::				; CODE XREF: __mkname+1Cj
		mov	dx, [bp+arg_4]
		mov	ax, [bp+arg_2]

loc_306D::				; CODE XREF: __mkname+23j
		push	dx
		push	ax		; src
		push	word ptr [bp+dest+2]
		push	word ptr [bp+dest] ; dest
		nop
		push	cs
		call	near ptr __stpcpy
		add	sp, 8
		push	dx
		push	ax
		call	__utoa
		push	ds
		mov	ax, offset a__0	; ".$$$"
		push	ax		; src
		push	word ptr [bp+dest+2]
		push	word ptr [bp+dest] ; dest
		nop
		push	cs
		call	near ptr _strcat
		add	sp, 8
		mov	dx, word ptr [bp+dest+2]
		mov	ax, word ptr [bp+dest]
		pop	bp
		retn	0Ah
__mkname	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; int __stdcall	_tmpnam(__int32, char *filename)
__tmpnam	proc near

attrib		= word ptr -2
arg_0		= dword	ptr  4
filename	= dword	ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 2

loc_30A5::				; CODE XREF: __tmpnam+4Bj
		push	word ptr [bp+filename+2]
		push	word ptr [bp+filename] ; dest
		xor	ax, ax
		xor	dx, dx
		push	ax		; int
		push	dx		; int
		les	bx, [bp+arg_0]
		assume es:nothing
		cmp	word ptr es:[bx], 0FFFFh
		jnz	loc_30BF
		mov	ax, 2
		jmp	loc_30C2
; ---------------------------------------------------------------------------

loc_30BF::				; CODE XREF: __tmpnam+19j
		mov	ax, 1

loc_30C2::				; CODE XREF: __tmpnam+1Ej
		les	bx, [bp+arg_0]
		add	es:[bx], ax
		mov	ax, es:[bx]
		push	ax		; int
		call	__mkname
		mov	word ptr [bp+filename+2], dx
		mov	word ptr [bp+filename],	ax
		push	ss
		lea	ax, [bp+attrib]
		push	ax		; attrib
		push	word ptr [bp+filename+2]
		push	word ptr [bp+filename] ; filename
		nop
		push	cs
		call	near ptr __dos_getfileattr
		add	sp, 8
		or	ax, ax
		jz	loc_30A5
		mov	dx, word ptr [bp+filename+2]
		mov	ax, word ptr [bp+filename]
		mov	sp, bp
		pop	bp
		retn	8
__tmpnam	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; _DWORD __cdecl set_new_handler(void (*)(void))
@set_new_handler$qnqv$v	proc far

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	ax, word ptr __new_handler+2
		mov	dx, word ptr __new_handler
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		mov	ax, word ptr [bp+arg_0+2]
		mov	dx, word ptr [bp+arg_0]
		mov	word ptr __new_handler+2, ax
		mov	word ptr __new_handler,	dx
		mov	dx, [bp+var_2]
		mov	ax, [bp+var_4]
		mov	sp, bp
		pop	bp
		retf
@set_new_handler$qnqv$v	endp

		assume es:seg2608

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; _DWORD __cdecl operator new(unsigned int)
@$bnew$qui	proc far		; CODE XREF: show_stats(void)+153P
					; game_manager::game_manager(uchar *)+EP ...

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, [bp+arg_0]
		or	si, si
		jz	loc_3134
		mov	ax, si
		jmp	loc_3137
; ---------------------------------------------------------------------------

loc_3134::				; CODE XREF: operator new(uint)+Cj
		mov	ax, 1

loc_3137::				; CODE XREF: operator new(uint)+10j
		mov	si, ax
		jmp	loc_313F
; ---------------------------------------------------------------------------

loc_313B::				; CODE XREF: operator new(uint)+35j
		call	__new_handler

loc_313F::				; CODE XREF: operator new(uint)+17j
		push	si		; size
		nop
		push	cs
		call	near ptr _malloc
		assume es:nothing
		pop	cx
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		or	ax, dx
		jnz	loc_3159
		mov	ax, word ptr __new_handler
		or	ax, word ptr __new_handler+2
		jnz	loc_313B

loc_3159::				; CODE XREF: operator new(uint)+2Cj
		mov	dx, [bp+var_2]
		mov	ax, [bp+var_4]
		pop	si
		mov	sp, bp
		pop	bp
		retf
@$bnew$qui	endp

		assume es:nothing

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

n_lxmul@	proc near		; CODE XREF: _rand+Ep _delay+1Cp
		push	si
		xchg	ax, si
		xchg	ax, dx
		test	ax, ax
		jz	loc_316D
		mul	bx

loc_316D::				; CODE XREF: n_lxmul@+5j
		jcxz	loc_3174
		assume es:nothing
		xchg	ax, cx
		mul	si
		add	ax, cx
		assume es:nothing

loc_3174::				; CODE XREF: n_lxmul@:loc_316Dj
		xchg	ax, si
		mul	bx
		add	dx, si
		pop	si
		retn
n_lxmul@	endp

		assume es:nothing

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

n_pcmp@		proc near		; CODE XREF: __brk+11p	__brk+24p ...
		push	cx
		mov	ch, al
		mov	cl, 4
		shr	ax, cl
		add	dx, ax
		mov	al, ch
		mov	ah, bl
		shr	bx, cl
		pop	cx
		add	cx, bx
		mov	bl, ah
		and	ax, 0Fh
		and	bx, 0Fh
		cmp	dx, cx
		jnz	locret_319B
		cmp	ax, bx

locret_319B::				; CODE XREF: n_pcmp@+1Cj
		retn
n_pcmp@		endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; void __cdecl srand(unsigned int seed)
_srand		proc far

seed		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ax, [bp+seed]
		mov	word_2B328, 0
		mov	word_2B326, ax
		pop	bp
		retf
_srand		endp

		assume es:nothing

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; int rand(void)
_rand		proc far		; CODE XREF: random(int)+3P
		mov	cx, word_2B328
		mov	bx, word_2B326
		mov	dx, 15Ah
		mov	ax, 4E35h
		call	n_lxmul@
		add	ax, 1
		adc	dx, 0
		mov	word_2B328, dx
		mov	word_2B326, ax
		mov	ax, word_2B328
		cwd
		and	ax, 7FFFh
		retf
_rand		endp

		assume es:seg2608

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; int __cdecl _read(int	handle,	void *buf, unsigned int	len)
__read		proc far		; CODE XREF: ___read+44p ___read+91p

handle		= word ptr  6
buf		= dword	ptr  8
len		= word ptr  0Ch

		push	bp
		mov	bp, sp
		mov	bx, [bp+handle]
		shl	bx, 1
		test	__openfd[bx], 2
		jz	loc_31E9
		mov	ax, 5
		push	ax
		jmp	loc_31FD
; ---------------------------------------------------------------------------

loc_31E9::				; CODE XREF: __read+Ej
		push	ds
		mov	ah, 3Fh	; '?'
		mov	bx, [bp+handle]
		mov	cx, [bp+len]
		lds	dx, [bp+buf]
		int	21h		; DOS -	2+ - READ FROM FILE WITH HANDLE
					; BX = file handle, CX = number	of bytes to read
					; DS:DX	-> buffer
		pop	ds
		jb	loc_31FC
		jmp	loc_3200
; ---------------------------------------------------------------------------

loc_31FC::				; CODE XREF: __read+25j
		push	ax

loc_31FD::				; CODE XREF: __read+14j
		call	__ioerror

loc_3200::				; CODE XREF: __read+27j
		pop	bp
		retf
__read		endp

		assume es:nothing

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; void __cdecl segread(struct SREGS *segp)
_segread	proc far		; CODE XREF: _int86+Dp

segp		= dword	ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	bx, es
		les	si, [bp+segp]
		assume es:seg2b53
		mov	es:[si], bx
		mov	ax, [bp+4]
		mov	es:[si+2], ax
		mov	word ptr es:[si+4], ss
		mov	word ptr es:[si+6], ds
		mov	es, bx
		assume es:nothing
		pop	si
		pop	bp
		retf
_segread	endp

		assume es:seg2608

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

__setupio	proc near		; DATA XREF: seg2608:3484o
		mov	cx, 5
		cmp	cx, __nfile
		jnb	loc_3263

loc_322B::				; CODE XREF: __setupio+3Fj
		mov	bx, cx
		shl	bx, 1
		mov	__openfd[bx], 0
		mov	ax, cx
		mov	dx, 14h
		imul	dx
		mov	bx, ax
		mov	byte_2B104[bx],	0FFh
		mov	ax, cx
		mov	dx, 14h
		imul	dx
		add	ax, offset __streams
		push	ax
		mov	ax, cx
		mov	dx, 14h
		imul	dx
		mov	bx, ax
		pop	ax
		mov	off_2B112[bx], ax
		inc	cx
		cmp	cx, __nfile
		jb	loc_322B

loc_3263::				; CODE XREF: __setupio+7j
		mov	al, byte_2B104
		cbw
		push	ax		; handle
		nop
		push	cs
		call	near ptr _isatty
		pop	cx
		or	ax, ax
		jnz	loc_3278
		and	word_2B102, 0FDFFh

loc_3278::				; CODE XREF: __setupio+4Ej
		mov	ax, 200h
		push	ax
		test	word_2B102, 200h
		jz	loc_3289
		mov	ax, 1
		jmp	loc_328B
; ---------------------------------------------------------------------------

loc_3289::				; CODE XREF: __setupio+60j
		xor	ax, ax

loc_328B::				; CODE XREF: __setupio+65j
		push	ax		; size
		xor	ax, ax
		xor	dx, dx
		push	ax		; type
		push	dx
		push	ds		; buf
		mov	ax, offset __streams
		push	ax
		nop
		push	cs		; stream
		call	near ptr _setvbuf
		add	sp, 0Ch
		mov	al, stru_2B114.fd
		cbw
		push	ax		; handle
		nop
		push	cs
		call	near ptr _isatty
		pop	cx
		or	ax, ax
		jnz	loc_32B4
		and	stru_2B114.flags, 0FDFFh

loc_32B4::				; CODE XREF: __setupio+8Aj
		mov	ax, 200h
		push	ax
		test	stru_2B114.flags, 200h
		jz	loc_32C5
		mov	ax, 2
		jmp	loc_32C7
; ---------------------------------------------------------------------------

loc_32C5::				; CODE XREF: __setupio+9Cj
		xor	ax, ax

loc_32C7::				; CODE XREF: __setupio+A1j
		push	ax		; size
		xor	ax, ax
		xor	dx, dx
		push	ax		; type
		push	dx
		push	ds		; buf
		mov	ax, offset stru_2B114
		push	ax
		nop
		push	cs		; stream
		call	near ptr _setvbuf
		add	sp, 0Ch
		retn
__setupio	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; int __cdecl unlink(const char	*path)
_unlink		proc far		; CODE XREF: _fclose+A5p

path_		= dword	ptr  6

		push	bp
		mov	bp, sp

loc_32DF::				; CODE XREF: sub_219F3+1Dp
		push	ds
		mov	ah, 41h	; 'A'
		lds	dx, [bp+path_]
		int	21h		; DOS -	2+ - DELETE A FILE (UNLINK)
					; DS:DX	-> ASCIZ pathname of file to delete (no	wildcards allowed)
		pop	ds
		jb	loc_32EE
		xor	ax, ax
		jmp	loc_32F2
; ---------------------------------------------------------------------------

loc_32EE::				; CODE XREF: _unlink+Cj
		push	ax
		call	__ioerror

loc_32F2::				; CODE XREF: _unlink+10j
		pop	bp
		retf
_unlink		endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

sub_32F4	proc near		; CODE XREF: __vprinter+257p
					; __vprinter+260p
		mov	al, dh
		call	sub_32FB
		mov	al, dl
sub_32F4	endp ; sp-analysis failed


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

sub_32FB	proc near		; CODE XREF: sub_32F4+2p
		aam	;10h
		xchg	ah, al
		call	sub_3304
		xchg	ah, al
sub_32FB	endp ; sp-analysis failed


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

sub_3304	proc near		; CODE XREF: sub_32FB+4p
		add	al, 90h	; ''
		daa
		adc	al, 40h	; '@'
		daa
		stosb
		retn
sub_3304	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

__vprinter	proc near		; CODE XREF: _cprintf+17p _fprintf+17p ...

var_96		= byte ptr -96h
var_46		= byte ptr -46h
var_45		= byte ptr -45h
var_16		= word ptr -16h
var_14		= word ptr -14h
var_12		= word ptr -12h
var_10		= word ptr -10h
var_E		= word ptr -0Eh
var_B		= byte ptr -0Bh
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= byte ptr -6
var_5		= byte ptr -5
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  4
arg_2		= dword	ptr  6

; FUNCTION CHUNK AT 1190 SIZE 0000042F BYTES

		push	bp
		mov	bp, sp
		sub	sp, 96h
		push	si
		push	di
		mov	[bp+var_12], 0
		mov	[bp+var_14], 50h ; 'P'
		mov	[bp+var_16], 0
		jmp	loc_3370
__vprinter	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

sub_3326	proc near		; CODE XREF: __vprinter:loc_35DDp
					; __vprinter:loc_363Dp	...
		push	di
		mov	cx, 0FFFFh
		xor	al, al
		repne scasb
		not	cx
		dec	cx
		pop	di
		retn
sub_3326	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

sub_3333	proc near		; CODE XREF: __vprinter+3B7p
					; __vprinter+3C8p ...
		mov	ss:[di], al
		inc	di
		dec	byte ptr [bp-14h]
		jnz	locret_336F
sub_3333	endp ; sp-analysis failed


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

sub_333C	proc near		; CODE XREF: __vprinter+86p
					; __vprinter+40Ep ...
		push	bx
		push	cx
		push	dx
		push	es
		lea	ax, [bp-96h]
		sub	di, ax
		push	ss
		lea	ax, [bp-96h]
		push	ax
		push	di
		push	word ptr [bp+0Ch]
		push	word ptr [bp+0Ah]
		call	ss:off_2826E[bp]
		assume es:seg2b53
		or	ax, ax
		jnz	loc_335F
		mov	word ptr [bp-16h], 1

loc_335F::				; CODE XREF: sub_333C+1Cj
		mov	word ptr [bp-14h], 50h ; 'P'

loc_3364::				; CODE XREF: _memset+11p
		add	[bp-12h], di
		lea	di, [bp-96h]
		pop	es
		assume es:seg2608
		pop	dx
		pop	cx
		pop	bx

locret_336F::				; CODE XREF: sub_3333+7j
		retn
sub_333C	endp ; sp-analysis failed

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR __vprinter

loc_3370::				; CODE XREF: __vprinter+18j
		push	es
		cld
		lea	di, [bp+var_96]
		mov	[bp+var_4], di

loc_3379::				; CODE XREF: __vprinter:loc_3768j
		mov	di, [bp+var_4]

loc_337C::				; CODE XREF: __vprinter:loc_372Cj
		les	si, [bp+arg_2]

loc_337F::				; CODE XREF: __vprinter+84j
					; __vprinter+89j
		lods	byte ptr es:[si]
		or	al, al
		jz	loc_3397
		cmp	al, 25h	; '%'
		jz	loc_339A	; CODE XREF: _gr_start_kbd_grab+29p

loc_3389::				; CODE XREF: __vprinter+95j
		mov	ss:[di], al
		inc	di
		dec	byte ptr [bp+var_14]
		jg	loc_337F
		call	sub_333C
		jmp	loc_337F
; ---------------------------------------------------------------------------

loc_3397::				; CODE XREF: __vprinter+77j
		jmp	loc_377F
; ---------------------------------------------------------------------------

loc_339A::				; CODE XREF: __vprinter+7Bj
		mov	[bp+var_10], si
		lods	byte ptr es:[si]
		cmp	al, 25h	; '%'
		jz	loc_3389
		mov	[bp+var_4], di
		xor	cx, cx
		mov	[bp+var_E], cx
		mov	[bp+var_2], 20h	; ' '
		mov	[bp+var_B], cl
		mov	[bp+var_8], 0FFFFh
		mov	[bp+var_A], 0FFFFh
		jmp	loc_33C1
; ---------------------------------------------------------------------------

loc_33BF::				; CODE XREF: __vprinter+E2j
					; __vprinter+EDj ...
		lods	byte ptr es:[si]

loc_33C1::				; CODE XREF: __vprinter+B1j
		xor	ah, ah
		mov	dx, ax
		mov	bx, ax
		sub	bl, 20h	; ' '
		cmp	bl, 60h	; '`'
		jnb	loc_33E2
		mov	bl, byte_2B333[bx]
		cmp	bx, 17h		; switch 24 cases
		jbe	loc_33DB
		jmp	loc_376B	; jumptable 000111FD default case
; ---------------------------------------------------------------------------

loc_33DB::				; CODE XREF: __vprinter+CAj
		shl	bx, 1
		jmp	cs:off_379F[bx]	; switch jump
; ---------------------------------------------------------------------------

loc_33E2::				; CODE XREF: __vprinter+C1j
					; __vprinter+DCj ...
		jmp	loc_376B	; jumptable 000111FD default case
; ---------------------------------------------------------------------------

loc_33E5::				; CODE XREF: __vprinter+D1j
					; DATA XREF: seg0000:off_379Fo
		cmp	ch, 0		; jumptable 000111FD case 1
		ja	loc_33E2
		or	[bp+var_2], 1
		jmp	loc_33BF
; ---------------------------------------------------------------------------

loc_33F0::				; CODE XREF: __vprinter+D1j
					; DATA XREF: seg0000:off_379Fo
		cmp	ch, 0		; jumptable 000111FD case 3
		ja	loc_33E2
		or	[bp+var_2], 2
		jmp	loc_33BF
; ---------------------------------------------------------------------------

loc_33FB::				; CODE XREF: __vprinter+D1j
					; DATA XREF: seg0000:off_379Fo
		cmp	ch, 0		; jumptable 000111FD case 0
		ja	loc_33E2
		cmp	[bp+var_B], 2Bh	; '+'
		jz	loc_3409
		mov	[bp+var_B], dl

loc_3409::				; CODE XREF: __vprinter+F8j
		jmp	loc_33BF
; ---------------------------------------------------------------------------

loc_340B::				; CODE XREF: __vprinter+D1j
					; DATA XREF: seg0000:off_379Fo
		and	[bp+var_2], 0FFDFh ; jumptable 000111FD	case 22
		jmp	loc_3415
; ---------------------------------------------------------------------------

loc_3411::				; CODE XREF: __vprinter+D1j
					; DATA XREF: seg0000:off_379Fo
		or	[bp+var_2], 20h	; jumptable 000111FD case 23

loc_3415::				; CODE XREF: __vprinter+103j
					; __vprinter+1A1j ...
		mov	ch, 5
		jmp	loc_33BF
; ---------------------------------------------------------------------------

loc_3419::				; CODE XREF: __vprinter+D1j
					; DATA XREF: seg0000:off_379Fo
		cmp	ch, 0		; jumptable 000111FD case 9
		ja	loc_346B	; jumptable 000111FD case 5
		test	[bp+var_2], 2
		jnz	loc_344E
		or	[bp+var_2], 8
		mov	ch, 1
		jmp	loc_33BF
; ---------------------------------------------------------------------------

loc_342D::				; CODE XREF: __vprinter+148j
					; __vprinter+155j ...
		jmp	loc_376B	; jumptable 000111FD default case
; ---------------------------------------------------------------------------

loc_3430::				; CODE XREF: __vprinter+D1j
					; DATA XREF: seg0000:off_379Fo
		mov	di, [bp+arg_0]	; jumptable 000111FD case 2
		mov	ax, ss:[di]
		add	[bp+arg_0], 2
		cmp	ch, 2
		jnb	loc_3451
		or	ax, ax
		jns	loc_3449
		neg	ax
		or	[bp+var_2], 2

loc_3449::				; CODE XREF: __vprinter+135j
		mov	[bp+var_8], ax
		mov	ch, 3

loc_344E::				; CODE XREF: __vprinter+117j
					; __vprinter+16Fj ...
		jmp	loc_33BF
; ---------------------------------------------------------------------------

loc_3451::				; CODE XREF: __vprinter+131j
		cmp	ch, 4
		jnz	loc_342D
		mov	[bp+var_A], ax
		inc	ch
		jmp	loc_33BF
; ---------------------------------------------------------------------------

loc_345E::				; CODE XREF: __vprinter+D1j
					; DATA XREF: seg0000:off_379Fo
		cmp	ch, 4		; jumptable 000111FD case 4
		jnb	loc_342D
		mov	ch, 4
		inc	[bp+var_A]
		jmp	loc_33BF
; ---------------------------------------------------------------------------

loc_346B::				; CODE XREF: __vprinter+D1j
					; __vprinter+110j
					; DATA XREF: ...
		xchg	ax, dx		; jumptable 000111FD case 5
		sub	al, 30h	; '0'
		cbw
		cmp	ch, 2
		ja	loc_348D
		mov	ch, 2
		xchg	ax, [bp+var_8]
		or	ax, ax
		jl	loc_344E
		shl	ax, 1
		mov	dx, ax
		shl	ax, 1
		shl	ax, 1
		add	ax, dx
		add	[bp+var_8], ax
		jmp	loc_33BF
; ---------------------------------------------------------------------------

loc_348D::				; CODE XREF: __vprinter+166j
		cmp	ch, 4
		jnz	loc_342D
		xchg	ax, [bp+var_A]
		or	ax, ax
		jz	loc_344E
		shl	ax, 1
		mov	dx, ax
		shl	ax, 1
		shl	ax, 1
		add	ax, dx
		add	[bp+var_A], ax
		jmp	loc_33BF
; ---------------------------------------------------------------------------

loc_34A9::				; CODE XREF: __vprinter+D1j
					; DATA XREF: seg0000:off_379Fo
		or	[bp+var_2], 10h	; jumptable 000111FD case 6
		jmp	loc_3415
; ---------------------------------------------------------------------------

loc_34B0::				; CODE XREF: __vprinter+D1j
					; DATA XREF: seg0000:off_379Fo
		or	[bp+var_2], 100h ; jumptable 000111FD case 7

loc_34B5::				; CODE XREF: __vprinter+D1j
					; DATA XREF: seg0000:off_379Fo
		and	[bp+var_2], 0FFEFh ; jumptable 000111FD	case 8
		jmp	loc_3415
; ---------------------------------------------------------------------------

loc_34BC::				; CODE XREF: __vprinter+D1j
					; DATA XREF: seg0000:off_379Fo
		mov	bh, 8		; jumptable 000111FD case 11
		jmp	loc_34CA
; ---------------------------------------------------------------------------

loc_34C0::				; CODE XREF: __vprinter+D1j
					; DATA XREF: seg0000:off_379Fo
		mov	bh, 0Ah		; jumptable 000111FD case 12
		jmp	loc_34CE
; ---------------------------------------------------------------------------

loc_34C4::				; CODE XREF: __vprinter+D1j
					; DATA XREF: seg0000:off_379Fo
		mov	bh, 10h		; jumptable 000111FD case 13
		mov	bl, 0E9h ; 'é'
		add	bl, dl

loc_34CA::				; CODE XREF: __vprinter+1B2j
		mov	[bp+var_B], 0

loc_34CE::				; CODE XREF: __vprinter+1B6j
		mov	[bp+var_5], dl
		xor	dx, dx
		mov	[bp+var_6], dl
		mov	di, [bp+arg_0]
		mov	ax, ss:[di]
		jmp	loc_34EE
; ---------------------------------------------------------------------------

loc_34DE::				; CODE XREF: __vprinter+D1j
					; DATA XREF: seg0000:off_379Fo
		mov	bh, 0Ah		; jumptable 000111FD case 10
		mov	[bp+var_6], 1
		mov	[bp+var_5], dl
		mov	di, [bp+arg_0]
		mov	ax, ss:[di]
		cwd

loc_34EE::				; CODE XREF: __vprinter+1D0j
		inc	di
		inc	di
		mov	word ptr [bp+arg_2], si
		test	[bp+var_2], 10h
		jz	loc_34FF
		mov	dx, ss:[di]
		inc	di
		inc	di

loc_34FF::				; CODE XREF: __vprinter+1ECj
		mov	[bp+arg_0], di
		lea	di, [bp+var_45]
		or	ax, ax
		jnz	loc_351B
		or	dx, dx
		jnz	loc_351B
		cmp	[bp+var_A], 0
		jnz	loc_351F
		mov	byte ptr ss:[di], 0
		mov	ax, di
		jmp	loc_352F
; ---------------------------------------------------------------------------

loc_351B::				; CODE XREF: __vprinter+1FBj
					; __vprinter+1FFj
		or	[bp+var_2], 4

loc_351F::				; CODE XREF: __vprinter+205j
		push	dx
		push	ax
		push	ss
		push	di
		mov	al, bh
		cbw
		push	ax
		mov	al, [bp+var_6]
		push	ax
		push	bx
		call	__longtoa

loc_352F::				; CODE XREF: __vprinter+20Dj
		push	ss
		pop	es
		assume es:nothing
		mov	dx, [bp+var_A]
		or	dx, dx
		jge	loc_353B
		jmp	loc_362F
; ---------------------------------------------------------------------------

loc_353B::				; CODE XREF: __vprinter+22Aj
		jmp	loc_363D
; ---------------------------------------------------------------------------

loc_353E::				; CODE XREF: __vprinter+D1j
					; DATA XREF: seg0000:off_379Fo
		mov	[bp+var_5], dl	; jumptable 000111FD case 14
		mov	word ptr [bp+arg_2], si
		lea	di, [bp+var_46]
		mov	bx, [bp+arg_0]
		push	word ptr ss:[bx]
		inc	bx
		inc	bx
		mov	[bp+arg_0], bx
		test	[bp+var_2], 20h
		jz	loc_3569
		mov	dx, ss:[bx]
		inc	bx
		inc	bx
		mov	[bp+arg_0], bx
		push	ss
		pop	es
		call	sub_32F4
		mov	al, 3Ah	; ':'
		stosb

loc_3569::				; CODE XREF: __vprinter+24Bj
		push	ss
		pop	es
		pop	dx
		call	sub_32F4
		mov	byte ptr ss:[di], 0
		mov	[bp+var_6], 0
		and	[bp+var_2], 0FFFBh
		lea	cx, [bp+var_46]
		sub	di, cx
		xchg	cx, di
		mov	dx, [bp+var_A]
		cmp	dx, cx
		jg	loc_358B
		mov	dx, cx

loc_358B::				; CODE XREF: __vprinter+27Bj
		jmp	loc_362F
; ---------------------------------------------------------------------------

loc_358E::				; CODE XREF: __vprinter+D1j
					; DATA XREF: seg0000:off_379Fo
		mov	word ptr [bp+arg_2], si	; jumptable 000111FD case 16
		mov	[bp+var_5], dl
		mov	di, [bp+arg_0]
		mov	ax, ss:[di]
		add	[bp+arg_0], 2
		push	ss
		pop	es
		lea	di, [bp+var_45]
		xor	ah, ah
		mov	ss:[di], ax
		mov	cx, 1
		jmp	loc_3672
; ---------------------------------------------------------------------------
		assume es:seg2608

loc_35AE::				; CODE XREF: __vprinter+D1j
					; DATA XREF: seg0000:off_379Fo
		mov	word ptr [bp+arg_2], si	; jumptable 000111FD case 17
		mov	[bp+var_5], dl
		mov	di, [bp+arg_0]
		test	[bp+var_2], 20h
		jnz	loc_35CB
		mov	di, ss:[di]
		add	[bp+arg_0], 2
		push	ds
		pop	es
		or	di, di
		jmp	loc_35D6
; ---------------------------------------------------------------------------

loc_35CB::				; CODE XREF: __vprinter+2B0j
		les	di, ss:[di]
		add	[bp+arg_0], 4
		mov	ax, es
		or	ax, di

loc_35D6::				; CODE XREF: __vprinter+2BDj
		jnz	loc_35DD
		push	ds
		pop	es
		mov	di, offset aNull ; "(null)"

loc_35DD::				; CODE XREF: __vprinter:loc_35D6j
		call	sub_3326
		cmp	cx, [bp+var_A]
		jbe	loc_35E8
		mov	cx, [bp+var_A]

loc_35E8::				; CODE XREF: __vprinter+2D7j
					; init_game(void)+16p
		jmp	loc_3672
; ---------------------------------------------------------------------------

loc_35EB::				; CODE XREF: __vprinter+D1j
					; DATA XREF: seg0000:off_379Fo
		mov	word ptr [bp+arg_2], si	; jumptable 000111FD case 15
		mov	[bp+var_5], dl
		mov	di, [bp+arg_0]
		mov	cx, [bp+var_A]
		or	cx, cx
		jge	loc_35FE
		mov	cx, 6

loc_35FE::				; CODE XREF: __vprinter+2EDj
		push	ss
		push	di
		push	cx
		push	ss
		lea	bx, [bp+var_45]
		push	bx
		push	dx
		mov	ax, 1
		and	ax, [bp+var_2]
		push	ax
		mov	ax, [bp+var_2]
		test	ax, 100h
		jz	loc_361F
		mov	ax, 8
		add	[bp+arg_0], 0Ah
		jmp	loc_3626
; ---------------------------------------------------------------------------

loc_361F::				; CODE XREF: __vprinter+308j
		add	[bp+arg_0], 8
		mov	ax, 6

loc_3626::				; CODE XREF: __vprinter+311j
		push	ax
		call	__realcvt
		push	ss
		pop	es
		assume es:nothing
		lea	di, [bp+var_45]

loc_362F::				; CODE XREF: __vprinter+22Cj
					; __vprinter:loc_358Bj
		test	[bp+var_2], 8
		jz	loc_364E
		mov	dx, [bp+var_8]
		or	dx, dx
		jle	loc_364E

loc_363D::				; CODE XREF: __vprinter:loc_353Bj
		call	sub_3326
		cmp	byte ptr es:[di], 2Dh ;	'-'
		jnz	loc_3647
		dec	cx

loc_3647::				; CODE XREF: __vprinter+338j
		sub	dx, cx
		jle	loc_364E
		mov	[bp+var_E], dx

loc_364E::				; CODE XREF: __vprinter+328j
					; __vprinter+32Fj ...
		cmp	byte ptr es:[di], 2Dh ;	'-'
		jz	loc_365F
		mov	al, [bp+var_B]
		or	al, al
		jz	loc_366F
		dec	di
		mov	es:[di], al

loc_365F::				; CODE XREF: __vprinter+346j
		cmp	[bp+var_E], 0
		jle	loc_366F
		mov	cx, [bp+var_A]
		or	cx, cx
		jge	loc_366F
		dec	[bp+var_E]

loc_366F::				; CODE XREF: __vprinter+34Dj
					; __vprinter+357j ...
		call	sub_3326
		assume es:seg2608

loc_3672::				; CODE XREF: __vprinter+29Fj
					; __vprinter:loc_35E8j
		mov	si, di
		mov	di, [bp+var_4]
		mov	bx, [bp+var_8]
		mov	ax, 5
		and	ax, [bp+var_2]
		cmp	ax, 5
		jnz	loc_3698
		mov	ah, [bp+var_5]
		cmp	ah, 6Fh	; 'o'
		jnz	loc_369A
		cmp	[bp+var_E], 0
		jg	loc_3698
		mov	[bp+var_E], 1

loc_3698::				; CODE XREF: __vprinter+377j
					; __vprinter+385j
		jmp	loc_36B5
; ---------------------------------------------------------------------------

loc_369A::				; CODE XREF: __vprinter+37Fj
		cmp	ah, 78h	; 'x'
		jz	loc_36A4
		cmp	ah, 58h	; 'X'
		jnz	loc_36B5

loc_36A4::				; CODE XREF: __vprinter+391j
		or	[bp+var_2], 40h
		dec	bx
		dec	bx
		sub	[bp+var_E], 2
		jge	loc_36B5
		mov	[bp+var_E], 0

loc_36B5::				; CODE XREF: __vprinter:loc_3698j
					; __vprinter+396j ...
		add	cx, [bp+var_E]
		test	[bp+var_2], 2
		jnz	loc_36CB
		jmp	loc_36C7
; ---------------------------------------------------------------------------

loc_36C1::				; CODE XREF: __vprinter+3BDj
		mov	al, 20h	; ' '
		call	sub_3333
		dec	bx

loc_36C7::				; CODE XREF: __vprinter+3B3j
		cmp	bx, cx
		jg	loc_36C1

loc_36CB::				; CODE XREF: __vprinter+3B1j
		test	[bp+var_2], 40h
		jz	loc_36DD
		mov	al, 30h	; '0'
		call	sub_3333
		mov	al, [bp+var_5]
		call	sub_3333

loc_36DD::				; CODE XREF: __vprinter+3C4j
		mov	dx, [bp+var_E]
		or	dx, dx
		jle	loc_370B
		sub	cx, dx
		sub	bx, dx
		mov	al, es:[si]
		cmp	al, 2Dh	; '-'   ; CODE XREF: sub_23069+7Dp
		jz	loc_36F7
		cmp	al, 20h	; ' '
		jz	loc_36F7
		cmp	al, 2Bh	; '+'
		jnz	loc_36FE

loc_36F7::				; CODE XREF: __vprinter+3E1j
					; __vprinter+3E5j
		lods	byte ptr es:[si]
		call	sub_3333
		dec	cx
		dec	bx

loc_36FE::				; CODE XREF: __vprinter+3E9j
		xchg	cx, dx
		jcxz	loc_3709

loc_3702::				; CODE XREF: __vprinter+3FBj
		mov	al, 30h	; '0'
		call	sub_3333
		loop	loc_3702

loc_3709::				; CODE XREF: __vprinter+3F4j
		xchg	cx, dx

loc_370B::				; CODE XREF: __vprinter+3D6j
		jcxz	loc_371F

loc_370D::				; CODE XREF: sub_219F3+1Dp
					; sub_23069+82p
		sub	bx, cx

loc_370F::				; CODE XREF: __vprinter:loc_371Dj
		lods	byte ptr es:[si]
		mov	ss:[di], al
		inc	di
		dec	byte ptr [bp+var_14]
		jg	loc_371D
		call	sub_333C

loc_371D::				; CODE XREF: __vprinter+40Cj
		loop	loc_370F

loc_371F::				; CODE XREF: __vprinter:loc_370Bj
		or	bx, bx
		jle	loc_372C
		mov	cx, bx

loc_3725::				; CODE XREF: __vprinter+41Ej
		mov	al, 20h	; ' '
		call	sub_3333
		loop	loc_3725

loc_372C::				; CODE XREF: __vprinter+415j
					; sub_219F3+1Dp ...
		jmp	loc_337C
; ---------------------------------------------------------------------------

loc_372F::				; CODE XREF: __vprinter+D1j
					; DATA XREF: seg0000:off_379Fo
		mov	word ptr [bp+arg_2], si	; jumptable 000111FD case 18
		mov	di, [bp+arg_0]
		test	[bp+var_2], 20h
		jnz	loc_3747
		mov	di, ss:[di]
		add	[bp+arg_0], 2
		push	ds
		pop	es
		jmp	loc_374E
; ---------------------------------------------------------------------------

loc_3747::				; CODE XREF: __vprinter+42Ej
		les	di, ss:[di]
		assume es:nothing
		add	[bp+arg_0], 4

loc_374E::				; CODE XREF: __vprinter+439j
		mov	ax, 50h	; 'P'
		sub	al, byte ptr [bp+var_14]
		add	ax, [bp+var_12]
		mov	es:[di], ax
		test	[bp+var_2], 10h
		jz	loc_3768
		inc	di
		inc	di
		mov	word ptr es:[di], 0

loc_3768::				; CODE XREF: __vprinter+453j
		jmp	loc_3379
; ---------------------------------------------------------------------------

loc_376B::				; CODE XREF: __vprinter+CCj
					; __vprinter+D1j ...
		mov	si, [bp+var_10]	; jumptable 000111FD default case
		mov	es, word ptr [bp+arg_2+2]
		mov	di, [bp+var_4]
		mov	al, 25h	; '%'

loc_3776::				; CODE XREF: __vprinter+471j
		call	sub_3333
		lods	byte ptr es:[si]
		or	al, al
		jnz	loc_3776
		assume es:seg2608

loc_377F::				; CODE XREF: __vprinter:loc_3397j
		cmp	byte ptr [bp+var_14], 50h ; 'P'
		jge	loc_3788
		call	sub_333C

loc_3788::				; CODE XREF: __vprinter+477j
		pop	es
		cmp	[bp+var_16], 0
		jz	loc_3794
		mov	ax, 0FFFFh
		jmp	loc_3797
; ---------------------------------------------------------------------------

loc_3794::				; CODE XREF: __vprinter+481j
		mov	ax, [bp+var_12]

loc_3797::				; CODE XREF: __vprinter+486j
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retn	0Ch
; END OF FUNCTION CHUNK	FOR __vprinter
; ---------------------------------------------------------------------------
off_379F	dw offset loc_33FB	; DATA XREF: __vprinter+D1r
		dw offset loc_33E5	; jump table for switch	statement
		dw offset loc_3430
		dw offset loc_33F0
		dw offset loc_345E
		dw offset loc_346B
		dw offset loc_34A9
		dw offset loc_34B0
		dw offset loc_34B5
		dw offset loc_3419
		dw offset loc_34DE
		dw offset loc_34BC
		dw offset loc_34C0
		dw offset loc_34C4
		dw offset loc_353E
		dw offset loc_35EB
		dw offset loc_358E
		dw offset loc_35AE
		dw offset loc_372F
		dw offset loc_376B
		dw offset loc_376B
		dw offset loc_376B
		dw offset loc_340B
		dw offset loc_3411

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

__vptr		proc near		; CODE XREF: __cputn+8Fp _gettext+34p	...

arg_0		= word ptr  4
arg_2		= word ptr  6

		push	bp
		mov	bp, sp
		mov	al, byte_2B39E
		mov	ah, 0
		mov	dx, [bp+arg_0]
		dec	dx
		imul	dx
		push	ax
		mov	ax, word_2B3A1
		pop	dx
		add	ax, dx
		mov	dx, [bp+arg_2]
		dec	dx
		add	ax, dx
		shl	ax, 1
		mov	dx, word_2B3A3
		pop	bp
		retn	4
__vptr		endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

__vram		proc near		; CODE XREF: __cputn+9Dp
					; __screenio+23p

var_2		= word ptr -2
arg_0		= word ptr  4
arg_2		= dword	ptr  6
arg_6		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	al, byte_2B3A0
		mov	ah, 0
		mov	[bp+var_2], ax
		push	ds
		mov	cx, [bp+arg_0]
		jcxz	loc_3864
		les	di, [bp+arg_6]
		assume es:nothing
		lds	si, [bp+arg_2]
		cld
		cmp	si, di
		jnb	loc_381F
		mov	ax, cx
		dec	ax
		shl	ax, 1
		add	si, ax
		add	di, ax
		std

loc_381F::				; CODE XREF: __vram+1Fj
		cmp	[bp+var_2], 0
		jnz	short loc_3829
		rep movsw
		jmp	short loc_3864
; ---------------------------------------------------------------------------

loc_3829::				; CODE XREF: __vram+2Fj
		mov	dx, 3DAh
		mov	ax, es
		mov	bx, ds
		cmp	ax, bx
		jz	short loc_3845

loc_3834::				; CODE XREF: __vram+4Dj
		cli

loc_3835::				; CODE XREF: __vram+44j
		in	al, dx		; Video	status bits:
					; 0: retrace.  1=display is in vert or horiz retrace.
					; 1: 1=light pen is triggered; 0=armed
					; 2: 1=light pen switch	is open; 0=closed
					; 3: 1=vertical	sync pulse is occurring.
		ror	al, 1
		jb	short loc_3835

loc_383A::				; CODE XREF: __vram+49j
		in	al, dx		; Video	status bits:
					; 0: retrace.  1=display is in vert or horiz retrace.
					; 1: 1=light pen is triggered; 0=armed
					; 2: 1=light pen switch	is open; 0=closed
					; 3: 1=vertical	sync pulse is occurring.
		ror	al, 1
		jnb	short loc_383A
		movsw
		sti
		loop	loc_3834
		jmp	short loc_3864
; ---------------------------------------------------------------------------

loc_3845::				; CODE XREF: __vram+3Ej __vram+6Ej
		cli

loc_3846::				; CODE XREF: __vram+55j
		in	al, dx		; Video	status bits:
					; 0: retrace.  1=display is in vert or horiz retrace.
					; 1: 1=light pen is triggered; 0=armed
					; 2: 1=light pen switch	is open; 0=closed
					; 3: 1=vertical	sync pulse is occurring.
		ror	al, 1
		jb	short loc_3846

loc_384B::				; CODE XREF: __vram+5Aj
		in	al, dx		; Video	status bits:
					; 0: retrace.  1=display is in vert or horiz retrace.
					; 1: 1=light pen is triggered; 0=armed
					; 2: 1=light pen switch	is open; 0=closed
					; 3: 1=vertical	sync pulse is occurring.
		ror	al, 1
		jnb	short loc_384B
		lodsw
		sti
		mov	bx, ax

loc_3854::				; CODE XREF: __vram+63j
		in	al, dx		; Video	status bits:
					; 0: retrace.  1=display is in vert or horiz retrace.
					; 1: 1=light pen is triggered; 0=armed
					; 2: 1=light pen switch	is open; 0=closed
					; 3: 1=vertical	sync pulse is occurring.
		ror	al, 1
		jb	short loc_3854

loc_3859::				; CODE XREF: __vram+68j
		in	al, dx		; Video	status bits:
					; 0: retrace.  1=display is in vert or horiz retrace.
					; 1: 1=light pen is triggered; 0=armed
					; 2: 1=light pen switch	is open; 0=closed
					; 3: 1=vertical	sync pulse is occurring.
		ror	al, 1
		jnb	short loc_3859
		mov	ax, bx
		stosw
		sti
		loop	loc_3845

loc_3864::				; CODE XREF: __vram+14j __vram+33j ...
		cld
		pop	ds
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retn	0Ah
__vram		endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; char *__cdecl	_stpcpy(char *dest, const char *src)
__stpcpy	proc far		; CODE XREF: __mkname+35p

dest		= dword	ptr  6
src		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	word ptr [bp+src+2]
		push	word ptr [bp+src] ; s
		nop
		push	cs
		call	near ptr _strlen
		pop	cx
		pop	cx
		mov	si, ax
		inc	ax
		push	ax		; n
		push	word ptr [bp+src+2]
		push	word ptr [bp+src] ; src
		push	word ptr [bp+dest+2]
		push	word ptr [bp+dest] ; dest
		nop
		push	cs
		call	near ptr _memcpy
		add	sp, 0Ah
		mov	dx, word ptr [bp+dest+2]
		mov	ax, word ptr [bp+dest]
		add	ax, si
		pop	si
		pop	bp
		retf
__stpcpy	endp

		assume es:seg2608

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; void clrscr(void)
_clrscr		proc far		; CODE XREF: init_game(void)+9P
		mov	al, 6
		push	ax
		mov	al, __video
		push	ax
		mov	al, byte_2B397
		push	ax
		mov	al, byte_2B398
		push	ax
		mov	al, byte_2B399
		push	ax
		mov	al, 0
		push	ax
		call	__scroll
_clrscr		endp ; sp-analysis failed

		mov	dl, __video
		mov	dh, byte_2B397
		mov	ah, 2
		mov	bh, 0
		call	__videoint
		retf

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; void __cdecl textcolor(int newcolor)
_textcolor	proc far		; CODE XREF: print_form(uchar *,uchar)+50P

newcolor	= word ptr  6

		push	bp
		mov	bp, sp
		mov	al, byte_2B39A
		and	al, 70h
		mov	dl, byte ptr [bp+newcolor]
		and	dl, 8Fh
		or	al, dl
		mov	byte_2B39A, al
		pop	bp
		retf
_textcolor	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; void __cdecl textbackground(int newcolor)
_textbackground	proc far		; CODE XREF: print_form(uchar *,uchar)+48P

newcolor	= word ptr  6

		push	bp
		mov	bp, sp
		mov	al, byte_2B39A
		and	al, 8Fh
		mov	dl, byte ptr [bp+newcolor]
		mov	cl, 4
		shl	dl, cl
		and	dl, 7Fh
		or	al, dl
		mov	byte_2B39A, al
		pop	bp

locret_38F8::				; CODE XREF: sub_219F3+1Dp
		retf
_textbackground	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; void __cdecl textattr(int newattr)
_textattr	proc far

newattr		= word ptr  6

		push	bp
		mov	bp, sp
		mov	al, byte ptr [bp+newattr] ; CODE XREF: sub_2233A+6Ep
		mov	byte_2B39A, al
		pop	bp
		retf
_textattr	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; void highvideo(void)
_highvideo	proc far
		or	byte_2B39A, 8
		retf
_highvideo	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; void lowvideo(void)
_lowvideo	proc far
		and	byte_2B39A, 0F7h
		retf
_lowvideo	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; void normvideo(void)
_normvideo	proc far
		mov	al, byte_2B39B
		mov	byte_2B39A, al
		retf
_normvideo	endp

		assume es:nothing

; =============== S U B	R O U T	I N E =======================================


; unsigned int coreleft(void)
_coreleft	proc far		; CODE XREF: init_game(void)+6EP
					; seg1a1e:00A4P
		nop
		push	cs
		call	near ptr _farcoreleft
		assume es:nothing
		retf
_coreleft	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

__cputn		proc near		; CODE XREF: _cputs+1Dp _putch+12p
					; DATA XREF: ...

var_8		= word ptr -8
var_5		= byte ptr -5
var_4		= word ptr -4
var_2		= word ptr -2
arg_4		= word ptr  8
arg_6		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	si
		mov	si, [bp+arg_4]
		mov	[bp+var_5], 0
		call	__wherexy
		mov	ah, 0
		mov	[bp+var_2], ax
		call	__wherexy
		mov	cl, 8
		shr	ax, cl
		mov	ah, 0
		mov	[bp+var_4], ax
		jmp	loc_3A1E
; ---------------------------------------------------------------------------

loc_3942::				; CODE XREF: __cputn+108j
		les	bx, [bp+arg_6]
		assume es:nothing
		inc	word ptr [bp+arg_6]
		mov	al, es:[bx]
		mov	[bp+var_5], al
		mov	ah, 0
		sub	ax, 7
		mov	bx, ax
		cmp	bx, 6		; switch 7 cases
		ja	loc_3988	; jumptable 0001177C default case
		shl	bx, 1
		jmp	cs:off_3A41[bx]	; switch jump
; ---------------------------------------------------------------------------

loc_3961::				; CODE XREF: __cputn+3Fj
					; DATA XREF: seg0000:off_3A41o
		mov	ah, 0Eh		; jumptable 0001177C case 0
		mov	al, 7
		call	__videoint
		jmp	loc_39E0
; ---------------------------------------------------------------------------

loc_396A::				; CODE XREF: __cputn+3Fj
					; DATA XREF: seg0000:off_3A41o
		mov	al, __video	; jumptable 0001177C case 1
		mov	ah, 0
		cmp	ax, [bp+var_2]
		jge	loc_39E0
		dec	[bp+var_2]
		jmp	loc_39E0
; ---------------------------------------------------------------------------

loc_3979::				; CODE XREF: __cputn+3Fj
					; DATA XREF: seg0000:off_3A41o
		mov	al, __video	; jumptable 0001177C case 6
		mov	ah, 0
		mov	[bp+var_2], ax
		jmp	loc_39E0
; ---------------------------------------------------------------------------

loc_3983::				; CODE XREF: __cputn+3Fj
					; DATA XREF: seg0000:off_3A41o
		inc	[bp+var_4]	; jumptable 0001177C case 3
		jmp	loc_39E0
; ---------------------------------------------------------------------------

loc_3988::				; CODE XREF: __cputn+3Bj __cputn+3Fj
					; DATA XREF: ...
		mov	al, byte_2B39F	; jumptable 0001177C default case
		mov	ah, 0
		or	ax, ax
		jnz	loc_39BF
		cmp	_directvideo, 0
		jz	loc_39BF
		mov	ah, byte_2B39A
		mov	al, [bp+var_5]
		mov	[bp+var_8], ax
		mov	ax, [bp+var_2]
		inc	ax
		push	ax
		mov	ax, [bp+var_4]
		inc	ax
		push	ax
		call	__vptr
		push	dx
		push	ax
		push	ss
		lea	ax, [bp+var_8]
		push	ax
		mov	ax, 1
		push	ax
		call	__vram
		jmp	loc_39DD
; ---------------------------------------------------------------------------

loc_39BF::				; CODE XREF: __cputn+72j __cputn+79j
		mov	dl, byte ptr [bp+var_2]
		mov	dh, byte ptr [bp+var_4]
		mov	ah, 2
		mov	bh, 0
		call	__videoint
		mov	bl, byte_2B39A
		mov	al, [bp+var_5]
		mov	ah, 9
		mov	bh, 0
		mov	cx, 1
		call	__videoint

loc_39DD::				; CODE XREF: __cputn+A0j
		inc	[bp+var_2]

loc_39E0::				; CODE XREF: __cputn+4Bj __cputn+55j ...
		mov	al, byte_2B398
		mov	ah, 0
		cmp	ax, [bp+var_2]
		jge	loc_39F8
		mov	al, __video
		mov	ah, 0
		mov	[bp+var_2], ax
		mov	ax, __wscroll
		add	[bp+var_4], ax

loc_39F8::				; CODE XREF: __cputn+CBj
		mov	al, byte_2B399
		mov	ah, 0
		cmp	ax, [bp+var_4]
		jge	loc_3A1E
		mov	al, 6
		push	ax
		mov	al, __video
		push	ax
		mov	al, byte_2B397	; CODE XREF: sub_22228+2p
		push	ax
		mov	al, byte_2B398
		push	ax
		mov	al, byte_2B399
		push	ax
		mov	al, 1
		push	ax
		call	__scroll
		dec	[bp+var_4]

loc_3A1E::				; CODE XREF: __cputn+22j __cputn+E3j
		mov	ax, si
		dec	si
		or	ax, ax
		jz	loc_3A28
		jmp	loc_3942
; ---------------------------------------------------------------------------

loc_3A28::				; CODE XREF: __cputn+106j
		mov	dl, byte ptr [bp+var_2]
		mov	dh, byte ptr [bp+var_4]
		mov	ah, 2
		mov	bh, 0
		call	__videoint
		mov	al, [bp+var_5]
		mov	ah, 0
		pop	si
		mov	sp, bp
		pop	bp
		retn	0Ah
__cputn		endp

; ---------------------------------------------------------------------------
off_3A41	dw offset loc_3961	; DATA XREF: __cputn+3Fr
		dw offset loc_396A	; jump table for switch	statement
		dw offset loc_3988
		dw offset loc_3983
		dw offset loc_3988
		dw offset loc_3988
		dw offset loc_3979

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; int cprintf(const char *format, ...)
_cprintf	proc far

format____	= dword	ptr  6
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, offset __cputn
		push	ax
		xor	ax, ax
		xor	dx, dx
		push	ax
		push	dx
		push	word ptr [bp+format____+2]
		push	word ptr [bp+format____]
		lea	ax, [bp+arg_4]
		push	ax
		call	__vprinter
		pop	bp
		retf
_cprintf	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; int __cdecl cputs(const char *str)
_cputs		proc far		; CODE XREF: print_form(uchar *,uchar)+129P

str_		= dword	ptr  6

		push	bp
		mov	bp, sp
		push	word ptr [bp+str_+2]
		push	word ptr [bp+str_]
		push	word ptr [bp+str_+2]
		push	word ptr [bp+str_] ; s
		nop
		push	cs
		call	near ptr _strlen
		pop	cx
		pop	cx
		push	ax
		xor	ax, ax
		xor	dx, dx
		push	ax
		push	dx
		call	__cputn
		pop	bp
		retf
_cputs		endp

		assume es:seg2608

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

sub_3A8D	proc near		; CODE XREF: __crtinit+78p

arg_0		= dword	ptr  4
arg_4		= dword	ptr  8

		push	bp
		mov	bp, sp
		jmp	loc_3AAA
; ---------------------------------------------------------------------------

loc_3A92::				; CODE XREF: sub_3A8D+24j
		les	bx, [bp+arg_0]
		inc	word ptr [bp+arg_0]
		mov	al, es:[bx]
		les	bx, [bp+arg_4]
		assume es:nothing
		inc	word ptr [bp+arg_4]

loc_3AA1::				; CODE XREF: __setupio+77p
					; __setupio+B3p
		cmp	al, es:[bx]
		jz	loc_3AAA
		xor	ax, ax
		jmp	loc_3AB6
; ---------------------------------------------------------------------------
		assume es:seg2608

loc_3AAA::				; CODE XREF: sub_3A8D+3j sub_3A8D+17j
		les	bx, [bp+arg_0]
		cmp	byte ptr es:[bx], 0
		jnz	loc_3A92
		mov	ax, 1
		assume es:nothing

loc_3AB6::				; CODE XREF: sub_3A8D+1Bj
		pop	bp
		retn	8
sub_3A8D	endp

		assume es:seg2608, ds:nothing

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

sub_3ABA	proc near		; CODE XREF: __videoint+77p
					; __crtinit+7Fp
		mov	ah, 12h
		mov	bl, 10h
		call	__videoint
		mov	al, bl
		add	al, 0F0h ; 'ð'
		mov	ah, 0
		retn
sub_3ABA	endp

		assume ds:seg2608

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

__videoint	proc near		; CODE XREF: seg0000:16E7p __cputn+48p ...
		push	bp
		push	ds
		push	cx
		mov	cx, 40h	; '@'
		mov	ds, cx
		assume ds:nothing
		pop	cx
		cmp	ah, 0
		jz	loc_3ADF
		cmp	ah, 0Fh
		jz	loc_3B34

loc_3ADB::				; CODE XREF: __videoint+36j
					; __videoint+3Aj
		int	10h		; - VIDEO -
		jmp	loc_3B50
; ---------------------------------------------------------------------------

loc_3ADF::				; CODE XREF: __videoint+Cj
		cmp	al, 2
		jz	loc_3AE7
		cmp	al, 3
		jnz	loc_3B00

loc_3AE7::				; CODE XREF: __videoint+19j
		push	ax
		mov	ax, 1A00h
		int	10h		; - VIDEO - DISPLAY COMBINATION	(PS,VGA/MCGA): read display combination	code
		cmp	al, 1Ah
		jz	loc_3AF6
		and	byte ptr ds:87h, 0FEh

loc_3AF6::				; CODE XREF: __videoint+27j
		mov	ah, 1
		mov	cx, 607h
		int	10h		; - VIDEO - SET	CURSOR CHARACTERISTICS
					; CH bits 0-4 =	start line for cursor in character cell
					; bits 5-6 = blink attribute
					; CL bits 0-4 =	end line for cursor in character cell
		pop	ax
		jmp	loc_3ADB
; ---------------------------------------------------------------------------

loc_3B00::				; CODE XREF: __videoint+1Dj
		cmp	al, 40h	; '@'
		jnz	loc_3ADB
		mov	bl, 10h
		mov	ah, 12h
		int	10h		; - VIDEO - ALTERNATE FUNCTION SELECT (PS, EGA,	VGA, MCGA) - GET EGA INFO
					; Return: BH = 00h color mode in effect	CH = feature bits, CL =	switch settings
		cmp	bl, 10h
		jz	loc_3B50
		mov	ax, 1112h
		xor	bl, bl
		int	10h		; - VIDEO - TEXT-MODE CHARACTER	GENERATOR FUNCTIONS (PS, EGA, VGA)
					; AL = 00h, 10h: load user-specified patterns
					; AL = 01h, 11h: load ROM monochrome patterns (8 by 14)
					; AL = 02h, 12h: load ROM 8 by 8 double-dot patterns
					; AL = 03h: set	block specifier
		mov	ax, 1200h
		mov	bl, 20h	; ' '
		int	10h		; - VIDEO - ALTERNATE FUNCTION SELECT (PS,EGA,VGA,MCGA)	- ALTERNATE PRTSC
					; select alternate print screen	routine
		mov	ax, 1A00h
		int	10h		; - VIDEO - DISPLAY COMBINATION	(PS,VGA/MCGA): read display combination	code
		cmp	al, 1Ah
		jz	loc_3B50
		or	byte ptr ds:87h, 1
		mov	ah, 1
		mov	cx, 600h
		int	10h		; - VIDEO - SET	CURSOR CHARACTERISTICS
					; CH bits 0-4 =	start line for cursor in character cell
					; bits 5-6 = blink attribute
					; CL bits 0-4 =	end line for cursor in character cell
		jmp	loc_3B50
; ---------------------------------------------------------------------------

loc_3B34::				; CODE XREF: __videoint+11j
		int	10h		; - VIDEO -
		cmp	al, 2
		jz	loc_3B3E
		cmp	al, 3
		jnz	loc_3B50

loc_3B3E::				; CODE XREF: __videoint+70j
		push	ax
		call	sub_3ABA
		or	al, al
		pop	ax
		jz	loc_3B50
		cmp	byte ptr ds:84h, 18h
		jz	loc_3B50
		mov	al, 40h	; '@'

loc_3B50::				; CODE XREF: __videoint+15j
					; __videoint+45j ...
		pop	ds
		pop	bp
		retn
__videoint	endp

		assume ds:seg2608

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

__c0crtinit	proc near		; DATA XREF: seg2608:348Ao
		mov	ah, 0Fh
		call	__videoint
		push	ax
		call	__crtinit
		assume es:nothing
		pop	cx
		mov	ah, 8
		mov	bh, 0
		call	__videoint
		and	ah, 7Fh
		mov	byte_2B39B, ah
		mov	byte_2B39A, ah
		retn
__c0crtinit	endp

		assume es:seg2608

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

__crtinit	proc near		; CODE XREF: __c0crtinit+6p

arg_0		= byte ptr  4

		push	bp
		mov	bp, sp
		mov	al, [bp+arg_0]
		mov	byte_2B39C, al
		mov	ah, 0Fh
		call	__videoint
		mov	byte_2B39E, ah
		cmp	al, byte_2B39C
		jz	loc_3B9C
		mov	al, byte_2B39C
		mov	ah, 0
		call	__videoint
		mov	ah, 0Fh
		call	__videoint
		mov	byte_2B39C, al
		mov	byte_2B39E, ah

loc_3B9C::				; CODE XREF: __crtinit+16j
		cmp	byte_2B39C, 3
		jbe	loc_3BB6
		cmp	byte_2B39C, 40h	; '@'
		jnb	loc_3BB6
		cmp	byte_2B39C, 7
		jz	loc_3BB6
		mov	ax, 1
		jmp	loc_3BB8
; ---------------------------------------------------------------------------

loc_3BB6::				; CODE XREF: __crtinit+31j
					; __crtinit+38j ...
		xor	ax, ax

loc_3BB8::				; CODE XREF: __crtinit+44j
		mov	byte_2B39F, al
		cmp	byte_2B39C, 40h	; '@'
		jz	loc_3BC6
		mov	al, 19h
		jmp	loc_3BD1
; ---------------------------------------------------------------------------

loc_3BC6::				; CODE XREF: __crtinit+50j
		mov	ax, 40h	; '@'
		mov	es, ax
		assume es:nothing
		mov	al, es:84h
		inc	al
		assume es:seg2608

loc_3BD1::				; CODE XREF: __crtinit+54j
		mov	byte_2B39D, al
		cmp	byte_2B39C, 7
		jz	loc_3BFB
		mov	ax, 0F000h
		mov	dx, 0FFEAh
		push	ax
		push	dx
		push	ds
		mov	ax, offset aCompaq ; "COMPAQ"
		push	ax
		call	sub_3A8D
		assume es:nothing
		or	ax, ax
		jnz	loc_3BFB
		call	sub_3ABA
		or	ax, ax
		jnz	loc_3BFB
		mov	ax, 1
		jmp	loc_3BFD
; ---------------------------------------------------------------------------

loc_3BFB::				; CODE XREF: __crtinit+69j
					; __crtinit+7Dj ...
		xor	ax, ax

loc_3BFD::				; CODE XREF: __crtinit+89j
					; parse_options(int,uchar **)+31p ...
		mov	byte_2B3A0, al
		cmp	byte_2B39C, 7
		jnz	loc_3C0C
		mov	ax, 0B000h
		jmp	loc_3C0F
; ---------------------------------------------------------------------------

loc_3C0C::				; CODE XREF: __crtinit+95j
		mov	ax, 0B800h

loc_3C0F::				; CODE XREF: __crtinit+9Aj
		mov	word_2B3A3, ax
		mov	word_2B3A1, 0
		mov	al, 0
		mov	byte_2B397, al
		mov	__video, al
		mov	al, byte_2B39E
		add	al, 0FFh
		mov	byte_2B398, al
		mov	al, byte_2B39D
		add	al, 0FFh
		mov	byte_2B399, al
		pop	bp
		retn
__crtinit	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function noreturn

sub_3C32	proc near		; DATA XREF: seg2608:3474o
		mov	dx, offset aPrint ; "print"
		jmp	loc_3C3A
; ---------------------------------------------------------------------------

loc_3C37::				; DATA XREF: seg2608:__scantodvectoro
					; seg2608:3478o ...
		mov	dx, offset aScan ; " scan"

loc_3C3A::				; CODE XREF: sub_3C32+3j
		mov	cx, 5
		mov	ah, 40h	; '@'
		mov	bx, 2
		int	21h		; DOS -	2+ - WRITE TO FILE WITH	HANDLE
					; BX = file handle, CX = number	of bytes to write, DS:DX -> buffer
		mov	cx, 39
		mov	dx, offset aFFloatingPoint ; "f	: floating point formats not linked\r"...
		mov	ah, 40h
		int	21h		; DOS -	2+ - WRITE TO FILE WITH	HANDLE
					; BX = file handle, CX = number	of bytes to write, DS:DX -> buffer
		jmp	_abort
sub_3C32	endp

		assume es:seg2608

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

nullsub_2	proc near		; CODE XREF: sub_3C52+6p sub_3C52+Dp
		retn
nullsub_2	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

sub_3C52	proc near		; CODE XREF: seg0000:loc_3C6Fp
					; _delay+7p ...
		pushf
		cli
		mov	al, 0
		out	43h, al		; Timer	8253-5 (AT: 8254.2).
		call	nullsub_2
		in	al, 40h		; Timer	8253-5 (AT: 8254.2).
		mov	bl, al
		call	nullsub_2
		in	al, 40h		; Timer	8253-5 (AT: 8254.2).
		mov	bh, al
		not	bx
		popf
		mov	ax, bx
		retn
sub_3C52	endp

; ---------------------------------------------------------------------------

loc_3C6C::				; DATA XREF: seg2608:3490o
		push	si
		xor	si, si

loc_3C6F::				; CODE XREF: seg0000:1AA9j
		call	sub_3C52
		test	ax, 1
		jnz	loc_3C85
		mov	word_2B3E2, 0
		mov	word_2B3E0, 4A9h
		jmp	loc_3C8B
; ---------------------------------------------------------------------------

loc_3C85::				; CODE XREF: seg0000:1A95j
		inc	si
		cmp	si, 64h	; 'd'
		jl	loc_3C6F

loc_3C8B::				; CODE XREF: seg0000:1AA3j
		pop	si
		retf

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; void __cdecl delay(unsigned int milliseconds)
_delay		proc far		; CODE XREF: beep(void)+EP

var_4		= word ptr -4
var_2		= word ptr -2
milliseconds	= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		call	sub_3C52
		mov	si, ax
		xor	dx, dx
		mov	bx, [bp+milliseconds]
		xor	cx, cx
		push	ax
		push	dx
		mov	dx, word_2B3E2
		mov	ax, word_2B3E0
		call	n_lxmul@
		pop	bx
		pop	cx
		add	cx, ax
		adc	bx, dx
		mov	[bp+var_2], bx
		mov	[bp+var_4], cx
		jmp	loc_3CD6
; ---------------------------------------------------------------------------

loc_3CBA::				; CODE XREF: _delay+53j _delay+5Aj
		cmp	bx, si
		jnb	loc_3CD4
		cmp	[bp+var_2], 1
		ja	loc_3CCC
		jb	loc_3CE9
		cmp	[bp+var_4], 0
		jb	loc_3CE9

loc_3CCC::				; CODE XREF: _delay+35j
		sub	[bp+var_4], 0
		sbb	[bp+var_2], 1

loc_3CD4::				; CODE XREF: _delay+2Fj
		mov	si, bx

loc_3CD6::				; CODE XREF: _delay+2Bj
		call	sub_3C52
		mov	bx, ax
		xor	dx, dx
		cmp	dx, [bp+var_2]
		jb	loc_3CBA
		jnz	loc_3CE9
		cmp	ax, [bp+var_4]
		jb	loc_3CBA

loc_3CE9::				; CODE XREF: _delay+37j _delay+3Dj ...
		pop	si
		mov	sp, bp
		pop	bp
		retf
_delay		endp

; ---------------------------------------------------------------------------
___first	dw 0			; DATA XREF: sub_3CFAr	sub_3CFA+1Dr ...
___last		dw 0			; DATA XREF: sub_3CFA+14w sub_3CFA+27w ...
___rover	dw 0			; DATA XREF: sub_3CFA+4Cw sub_3DCE+19w ...
word_3CF4	dw 0			; DATA XREF: sub_3CFA+32r
					; sub_3CFA:loc_3D4Dr ...
word_3CF6	dw 0			; DATA XREF: sub_3FBF+1r _realloc+1Aw
; unsigned __int32 nbytes
nbytes		dw 0			; DATA XREF: sub_3FBF+7r _realloc+1Fw
		assume es:nothing

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

sub_3CFA	proc near		; CODE XREF: _farfree+18p
		cmp	dx, cs:___first
		jz	loc_3D38
		mov	ds, dx
		assume ds:nothing
		mov	ds, word ptr ds:2
		assume ds:nothing
		cmp	word ptr ds:2, 0
		jz	loc_3D15
		mov	cs:___last, ds
		jmp	loc_3D4D
; ---------------------------------------------------------------------------
		assume es:nothing, ds:nothing

loc_3D15::				; CODE XREF: sub_3CFA+12j
		mov	ax, ds
		cmp	ax, cs:___first
		jz	loc_3D33
		mov	ax, ds:8
		mov	cs:___last, ax
		push	ds
		xor	ax, ax
		push	ax
		call	sub_3DCE
		mov	ds, cs:word_3CF4
		assume ds:seg2608
		jmp	loc_3D56
; ---------------------------------------------------------------------------

loc_3D33::				; CODE XREF: sub_3CFA+22j
		mov	dx, cs:___first

loc_3D38::				; CODE XREF: sub_3CFA+5j
		mov	cs:___first, 0
		mov	cs:___last, 0
		mov	cs:___rover, 0
		assume es:nothing, ds:nothing

loc_3D4D::				; CODE XREF: sub_3CFA+19j
		mov	ds, cs:word_3CF4
		assume ds:seg2608
		push	dx
		xor	ax, ax
		push	ax

loc_3D56::				; CODE XREF: sub_3CFA+37j
		call	__brk
		add	sp, 4
		retn
sub_3CFA	endp

		assume es:nothing

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

sub_3D5D	proc near		; CODE XREF: _farfree:loc_3E4Bp
		mov	ds, dx
		assume ds:nothing
		push	ds
		mov	es, word ptr ds:2
		assume es:nothing
		mov	word ptr ds:2, 0
		mov	word ptr ds:8, es
		cmp	dx, cs:___first
		jz	loc_3DA3
		cmp	word ptr es:2, 0
		jnz	loc_3DA3
		assume es:nothing, ds:nothing
		mov	ax, ds:0
		pop	bx
		push	es
		add	es:0, ax
		mov	cx, es
		add	dx, ax
		mov	es, dx
		assume es:nothing
		cmp	word ptr es:2, 0 ; CODE	XREF: __fputn+1EBp
		jnz	loc_3D9C
		assume es:nothing, ds:nothing
		mov	es:8, cx
		jmp	loc_3DA6
; ---------------------------------------------------------------------------
		assume es:nothing, ds:nothing

loc_3D9C::				; CODE XREF: sub_3D5D+36j
		mov	es:2, cx
		jmp	loc_3DA6
; ---------------------------------------------------------------------------
		assume es:nothing, ds:nothing

loc_3DA3::				; CODE XREF: sub_3D5D+16j sub_3D5D+1Ej
		call	sub_3DF7

loc_3DA6::				; CODE XREF: sub_3D5D+3Dj sub_3D5D+44j
		pop	es
		assume es:nothing
		mov	ax, es
		add	ax, es:0
		mov	ds, ax
		assume ds:nothing
		cmp	word ptr ds:2, 0
		jz	loc_3DB8
		retn
; ---------------------------------------------------------------------------
		assume es:nothing, ds:nothing

loc_3DB8::				; CODE XREF: sub_3D5D+58j
		mov	ax, ds:0
		add	es:0, ax
		mov	ax, es
		mov	bx, ds
		add	bx, ds:0
		mov	es, bx
		assume es:nothing
		mov	es:2, ax
sub_3D5D	endp ; sp-analysis failed

		assume es:nothing, ds:nothing

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

sub_3DCE	proc near		; CODE XREF: sub_3CFA+2Fp
					; _farmalloc+66p
		mov	bx, ds
		cmp	bx, ds:6
		jz	loc_3DEF
		assume es:nothing, ds:nothing
		mov	es, word ptr ds:6
		assume es:nothing
		mov	ds, word ptr ds:4
		assume ds:nothing
		mov	word ptr ds:6, es
		mov	word ptr es:4, ds
		mov	cs:___rover, ds
		mov	ds, bx
		assume ds:nothing
		retn
; ---------------------------------------------------------------------------
		assume es:nothing, ds:nothing

loc_3DEF::				; CODE XREF: sub_3DCE+6j
		mov	cs:___rover, 0
		retn
sub_3DCE	endp

		assume es:nothing

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

sub_3DF7	proc near		; CODE XREF: sub_3D5D:loc_3DA3p
		mov	ax, cs:___rover
		or	ax, ax
		jz	loc_3E20
		assume es:nothing, ds:nothing
		mov	bx, ss
		pushf
		cli
		mov	ss, ax
		mov	es, word ptr ss:6
		assume es:nothing
		mov	word ptr ss:6, ds
		mov	word ptr ds:4, ss
		mov	ss, bx
		popf
		mov	word ptr es:4, ds
		mov	word ptr ds:6, es
		retn
; ---------------------------------------------------------------------------
		assume es:nothing, ds:nothing

loc_3E20::				; CODE XREF: sub_3DF7+6j
		mov	cs:___rover, ds
		mov	word ptr ds:4, ds
		mov	word ptr ds:6, ds
		retn
sub_3DF7	endp

		assume es:nothing, ds:seg2608

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; void __cdecl farfree(void far	*block)
_farfree	proc far		; CODE XREF: operator delete(void *)+Bp
					; sub_3FBF+71p	...

arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	cs:word_3CF4, ds
		mov	dx, [bp+arg_2]
		or	dx, dx
		jz	loc_3E4E
		cmp	dx, cs:___last
		jnz	loc_3E4B
		call	sub_3CFA
		jmp	loc_3E4E
; ---------------------------------------------------------------------------
		assume es:nothing

loc_3E4B::				; CODE XREF: _farfree+16j
		call	sub_3D5D
		assume es:nothing

loc_3E4E::				; CODE XREF: _farfree+Fj _farfree+1Bj
		mov	ds, cs:word_3CF4
		pop	di
		pop	si
		pop	bp
		retf
_farfree	endp

		assume es:seg2608

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

sub_3E57	proc near		; CODE XREF: _farmalloc:loc_3F97p
		push	ax
		mov	ds, cs:word_3CF4
		xor	ax, ax
		push	ax
		push	ax
		call	__sbrk
		assume es:nothing
		add	sp, 4
		and	ax, 0Fh
		jz	loc_3E80
		mov	dx, 10h
		sub	dx, ax
		xor	ax, ax
		mov	ds, cs:word_3CF4
		push	ax
		push	dx
		call	__sbrk
		add	sp, 4

loc_3E80::				; CODE XREF: sub_3E57+13j
		pop	ax
		push	ax
		xor	bx, bx

loc_3E84::				; CODE XREF: sub_219F3+1Dp
		mov	bl, ah
		mov	cl, 4
		shr	bx, cl
		shl	ax, cl
		mov	ds, cs:word_3CF4
		push	bx
		push	ax
		call	__sbrk
		add	sp, 4
		pop	bx
		cmp	ax, 0FFFFh
		jz	loc_3EB7
		mov	cs:___first, dx
		mov	cs:___last, dx
		mov	ds, dx
		assume ds:nothing
		mov	ds:0, bx
		mov	ds:2, dx
		mov	ax, 4
		retn
; ---------------------------------------------------------------------------

loc_3EB7::				; CODE XREF: sub_3E57+46j
		xor	ax, ax
		cwd
		retn
sub_3E57	endp

		assume es:seg2608, ds:seg2608

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

sub_3EBB	proc near		; CODE XREF: _farmalloc:loc_3F92p
		push	ax
		xor	bx, bx
		mov	bl, ah
		mov	cl, 4
		shr	bx, cl
		shl	ax, cl
		mov	ds, cs:word_3CF4
		push	bx
		push	ax
		call	__sbrk
		assume es:nothing
		add	sp, 4
		pop	bx
		cmp	ax, 0FFFFh
		jz	loc_3F11
		and	ax, 0Fh
		jnz	loc_3EF6

loc_3EDE::				; CODE XREF: sub_3EBB+54j
					; ___write+12Ep
		mov	cx, cs:___last
		mov	cs:___last, dx
		mov	ds, dx
		assume ds:nothing
		mov	ds:0, bx
		mov	ds:2, cx
		mov	ax, 4
		retn
; ---------------------------------------------------------------------------

loc_3EF6::				; CODE XREF: sub_3EBB+21j
		push	bx
		push	dx
		neg	ax
		add	ax, 10h
		xor	bx, bx
		push	bx
		push	ax
		call	__sbrk
		add	sp, 4
		pop	dx
		pop	bx
		cmp	ax, 0FFFFh
		jz	loc_3F11
		inc	dx
		jmp	loc_3EDE
; ---------------------------------------------------------------------------

loc_3F11::				; CODE XREF: sub_3EBB+1Cj sub_3EBB+51j
		xor	ax, ax
		cwd
		retn
sub_3EBB	endp

		assume es:nothing, ds:nothing

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

sub_3F15	proc near		; CODE XREF: _farmalloc:loc_3F9Cp
		mov	bx, dx
		sub	ds:0, ax
		add	dx, ds:0
		mov	ds, dx
		assume ds:nothing
		mov	ds:0, ax
		mov	ds:2, bx
		mov	bx, dx
		add	bx, ds:0
		mov	ds, bx
		assume ds:nothing
		mov	ds:2, dx
		mov	ax, 4
		retn
sub_3F15	endp

		assume es:seg2608, ds:seg2608

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; void *__cdecl	malloc(size_t size)
_malloc		proc far		; CODE XREF: operator new(uint)+20p
					; _setvbuf+D2p	...

size_		= word ptr  6

		push	bp
		mov	bp, sp
		xor	dx, dx
		mov	ax, [bp+size_]
		jmp	loc_3F4B
_malloc		endp

		assume es:nothing

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; void far *__cdecl farmalloc(unsigned __int32 nbytes)
_farmalloc	proc far		; CODE XREF: sub_3FBF+Ep _realloc+64p	...

nbytes_		= dword	ptr  6

		push	bp
		mov	bp, sp
		mov	dx, word ptr [bp+nbytes_+2]
		mov	ax, word ptr [bp+nbytes_]
		assume es:seg2608

loc_3F4B::				; CODE XREF: _malloc+8j
		mov	cx, ax
		or	cx, dx
		push	si
		push	di
		mov	cs:word_3CF4, ds
		jz	loc_3FB6
		add	ax, 13h
		adc	dx, 0
		jb	loc_3FA1
		test	dx, 0FFF0h
		jnz	loc_3FA1
		mov	cl, 4
		shr	ax, cl
		shl	dx, cl
		or	ah, dl
		mov	dx, cs:___first
		or	dx, dx
		jz	loc_3F97
		mov	dx, cs:___rover
		or	dx, dx
		jz	loc_3F92
		assume es:nothing
		mov	bx, dx

loc_3F82::				; CODE XREF: _farmalloc+4Ej
		mov	ds, dx
		assume ds:nothing
		cmp	ds:0, ax
		jnb	loc_3FA6
		assume es:nothing
		mov	dx, ds:6
		cmp	dx, bx
		jnz	loc_3F82
		assume es:seg2608, ds:seg2608

loc_3F92::				; CODE XREF: _farmalloc+3Cj
		call	sub_3EBB
		assume es:nothing, ds:nothing
		jmp	loc_3FB6
; ---------------------------------------------------------------------------
		assume es:seg2608, ds:seg2608

loc_3F97::				; CODE XREF: _farmalloc+33j
		call	sub_3E57
		assume es:nothing, ds:nothing
		jmp	loc_3FB6
; ---------------------------------------------------------------------------
		assume es:nothing, ds:nothing

loc_3F9C::				; CODE XREF: _farmalloc:loc_3FA6j
		call	sub_3F15
		assume ds:nothing
		jmp	loc_3FB6
; ---------------------------------------------------------------------------

loc_3FA1::				; CODE XREF: _farmalloc+1Cj
					; _farmalloc+22j
		xor	ax, ax
		cwd
		jmp	loc_3FB6
; ---------------------------------------------------------------------------
		assume ds:nothing

loc_3FA6::				; CODE XREF: _farmalloc+46j
		ja	loc_3F9C
		assume es:nothing, ds:nothing
		call	sub_3DCE
		assume es:nothing
		mov	bx, ds:8
		mov	ds:2, bx
		mov	ax, offset word_28264
		assume es:nothing, ds:nothing

loc_3FB6::				; CODE XREF: _farmalloc+14j
					; _farmalloc+53j ...
		mov	ds, cs:word_3CF4
		assume ds:seg2608
		pop	di
		pop	si
		pop	bp
		retf
_farmalloc	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

sub_3FBF	proc near		; CODE XREF: _realloc:loc_40FBp
		push	bx
		mov	si, cs:word_3CF6
		push	si
		mov	si, cs:nbytes
		push	si		; nbytes
		push	cs
		call	near ptr _farmalloc
		add	sp, 4
		or	dx, dx
		jnz	loc_3FD9
		pop	bx
		retn
; ---------------------------------------------------------------------------

loc_3FD9::				; CODE XREF: sub_3FBF+16j
		pop	ds
		mov	es, dx
		assume es:nothing
		push	es
		push	ds
		push	bx		; block
		mov	dx, dataseg@
		cld
		dec	dx
		mov	di, 4
		mov	si, di
		mov	cx, 6
		rep movsw
		or	dx, dx
		jz	loc_402A
		mov	ax, es
		inc	ax
		mov	es, ax
		assume es:nothing
		mov	ax, ds
		inc	ax
		mov	ds, ax
		assume ds:nothing

loc_3FFD::				; CODE XREF: sub_3FBF+69j
		xor	di, di
		mov	si, di
		mov	cx, dx
		cmp	cx, 1000h
		jbe	loc_400C
		mov	cx, 1000h

loc_400C::				; CODE XREF: sub_3FBF+48j
		shl	cx, 1
		shl	cx, 1
		shl	cx, 1
		rep movsw
		sub	dx, 1000h
		jbe	loc_402A
		mov	ax, es
		add	ax, 1000h
		mov	es, ax
		assume es:nothing
		mov	ax, ds
		add	ax, 1000h
		mov	ds, ax
		assume ds:nothing
		jmp	loc_3FFD
; ---------------------------------------------------------------------------

loc_402A::				; CODE XREF: sub_3FBF+32j sub_3FBF+59j
		mov	ds, cs:word_3CF4
		assume ds:seg2608
		push	cs
		call	near ptr _farfree
		add	sp, 4
		pop	dx
		mov	ax, 4
		retn
sub_3FBF	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; int __fastcall sub_403B(void far *block)
sub_403B	proc near		; CODE XREF: _realloc:loc_40F6p
		cmp	bx, cs:___last
		jz	loc_4087
		mov	di, bx
		add	di, ax
		mov	es, di
		assume es:nothing
		mov	si, cx
		sub	si, ax
		mov	es:0, si
		mov	es:2, bx
		push	es
		push	ax		; block
		mov	es, bx
		mov	es:0, ax
		mov	dx, bx
		add	dx, cx
		mov	es, dx
		cmp	word ptr es:2, 0
		jz	loc_4073
		mov	es:2, di
		jmp	loc_4078
; ---------------------------------------------------------------------------

loc_4073::				; CODE XREF: sub_403B+2Fj
		mov	es:8, di

loc_4078::				; CODE XREF: sub_403B+36j
		mov	si, bx
		push	cs
		call	near ptr _farfree
		add	sp, 4
		mov	dx, si
		mov	ax, 4
		retn
; ---------------------------------------------------------------------------

loc_4087::				; CODE XREF: sub_403B+5j
		push	bx
		mov	es, bx
		mov	es:0, ax
		add	bx, ax
		push	bx
		xor	ax, ax
		push	ax

loc_4094::				; CODE XREF: seg1c75:loc_22A87p
		call	__brk
		add	sp, 4
		pop	dx
		mov	ax, 4
		retn
sub_403B	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; void *__cdecl	realloc(void *block, size_t size)
_realloc	proc far

arg_2		= word ptr  8
size_		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		xor	dx, dx
		jmp	loc_40AC
; ---------------------------------------------------------------------------

; void far *__cdecl farrealloc(void far	*oldblock, unsigned __int32 nbytes)
_farrealloc:
		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_6]

loc_40AC::				; CODE XREF: _realloc+5j
		mov	ax, [bp+size_]
		mov	bx, [bp+arg_2]
		push	si
		push	di
		mov	cs:word_3CF4, ds
		mov	cs:word_3CF6, dx
		mov	cs:nbytes, ax
		or	bx, bx
		jz	loc_4100
		mov	cx, ax
		or	cx, dx
		jz	loc_410B
		add	ax, 13h
		adc	dx, 0
		jb	loc_4114
		test	dx, 0FFF0h
		jnz	loc_4114
		mov	cl, 4
		shr	ax, cl
		shl	dx, cl
		or	ah, dl		; block
		mov	es, bx
		mov	cx, es:0
		cmp	cx, ax
		jb	loc_40FB
		ja	loc_40F6
		mov	dx, bx
		mov	ax, 4
		jmp	loc_4117
; ---------------------------------------------------------------------------

loc_40F6::				; CODE XREF: _realloc+4Ej
		call	sub_403B
		jmp	loc_4117
; ---------------------------------------------------------------------------

loc_40FB::				; CODE XREF: _realloc+4Cj
		call	sub_3FBF
		jmp	loc_4117
; ---------------------------------------------------------------------------

loc_4100::				; CODE XREF: _realloc+25j
		push	dx
		push	ax		; nbytes
		push	cs
		call	near ptr _farmalloc
		add	sp, 4
		jmp	loc_4117
; ---------------------------------------------------------------------------

loc_410B::				; CODE XREF: _realloc+2Bj
		push	bx
		push	ax		; block
		push	cs
		call	near ptr _farfree
		add	sp, 4

loc_4114::				; CODE XREF: _realloc+33j _realloc+39j
		xor	ax, ax
		cwd

loc_4117::				; CODE XREF: _realloc+55j _realloc+5Aj ...
		mov	ds, cs:word_3CF4
		pop	di
		pop	si
		pop	bp
		retf
_realloc	endp

		assume es:nothing

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

sub_4120	proc near		; CODE XREF: __brk+2Fp	sub_420D+42p

arg_0		= word ptr  4
arg_2		= word ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+arg_2]
		inc	si
		sub	si, __psp
		add	si, 3Fh	; '?'
		mov	cl, 6
		shr	si, cl
		cmp	si, word_2B3E4
		jnz	loc_414B
		assume es:nothing

loc_4139::				; CODE XREF: sub_4120+5Fj
		mov	ax, [bp+arg_2]
		mov	dx, [bp+arg_0]
		mov	word ptr __brklvl+2, ax
		mov	word ptr __brklvl, dx
		mov	ax, 1
		jmp	loc_4191
; ---------------------------------------------------------------------------
		assume es:nothing

loc_414B::				; CODE XREF: sub_4120+17j
		mov	cl, 6
		shl	si, cl
		mov	dx, word ptr __heaptop+2
		mov	ax, si
		add	ax, __psp
		cmp	ax, dx
		jbe	loc_4163
		mov	si, dx
		sub	si, __psp

loc_4163::				; CODE XREF: sub_4120+3Bj
		push	si		; newsize
		push	__psp		; newsize
		nop
		push	cs		; segx
		call	near ptr _setblock
		assume es:nothing
		pop	cx
		pop	cx
		mov	dx, ax
		cmp	dx, 0FFFFh
		jnz	loc_4181
		mov	ax, si
		mov	cl, 6
		shr	ax, cl
		mov	ds:3184h, ax
		jmp	loc_4139
; ---------------------------------------------------------------------------

loc_4181::				; CODE XREF: sub_4120+54j
		mov	ax, __psp
		add	ax, dx
		mov	word ptr __heaptop+2, ax
		mov	word ptr __heaptop, 0
		xor	ax, ax

loc_4191::				; CODE XREF: sub_4120+29j
		pop	si
		pop	bp
		retn	4
sub_4120	endp

		assume es:nothing

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

__brk		proc near		; CODE XREF: sub_3CFA:loc_3D56p
					; sub_403B:loc_4094p

arg_0		= word ptr  4
arg_2		= word ptr  6

		push	bp
		mov	bp, sp
		mov	cx, word ptr __heapbase+2
		mov	bx, word ptr __heapbase
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		call	n_pcmp@
		jb	loc_41CC
		mov	cx, word ptr __heaptop+2
		mov	bx, word ptr __heaptop
		mov	dx, [bp+arg_2]
		mov	ax, [bp+arg_0]
		call	n_pcmp@
		ja	loc_41CC
		push	[bp+arg_2]
		push	[bp+arg_0]
		call	sub_4120
		or	ax, ax
		jnz	loc_41D1

loc_41CC::				; CODE XREF: __brk+14j	__brk+27j
		mov	ax, 0FFFFh
		jmp	loc_41D3
; ---------------------------------------------------------------------------

loc_41D1::				; CODE XREF: __brk+34j
		xor	ax, ax

loc_41D3::				; CODE XREF: __brk+39j
		pop	bp
		retn
__brk		endp

		assume es:seg2608

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

__sbrk		proc near		; CODE XREF: sub_3E57+Ap sub_3E57+23p	...

arg_0		= word ptr  4
arg_2		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8
		mov	ax, word ptr __brklvl+2
		xor	dx, dx
		mov	cl, 4
		call	near ptr n_lxlsh@
		add	ax, word ptr __brklvl
		adc	dx, 0
		add	ax, [bp+arg_0]
		adc	dx, [bp+arg_2]
		cmp	dx, 0Fh
		jl	loc_4206
		jg	loc_41FE
		cmp	ax, 0FFFFh
		jbe	loc_4206

loc_41FE::				; CODE XREF: __sbrk+22j sub_420D+1Aj ...
		mov	dx, 0FFFFh
		mov	ax, 0FFFFh
		jmp	loc_425C
; ---------------------------------------------------------------------------

loc_4206::				; CODE XREF: __sbrk+20j __sbrk+27j
		mov	dx, word ptr __brklvl+2

loc_420A::				; CODE XREF: sub_333C+17p
					; DATA XREF: seg2608:off_2826Eo
		mov	ax, word ptr __brklvl
__sbrk		endp ; sp-analysis failed


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

sub_420D	proc near		; CODE XREF: sub_333C+17p
					; DATA XREF: seg2608:off_28270o
		mov	cx, [bp+6]
		mov	bx, [bp+4]
		call	near ptr n_padd@
		assume es:nothing
		mov	[bp-2],	dx
		mov	[bp-4],	ax
		mov	cx, word ptr __heapbase+2
		mov	bx, word ptr __heapbase
		call	n_pcmp@
		jb	loc_41FE
		mov	cx, word ptr __heaptop+2
		mov	bx, word ptr __heaptop
		mov	dx, [bp-2]
		mov	ax, [bp-4]
		call	n_pcmp@
		ja	loc_41FE
		mov	ax, word ptr __brklvl+2
		mov	dx, word ptr __brklvl
		mov	[bp-6],	ax
		mov	[bp-8],	dx
		push	word ptr [bp-2]
		push	word ptr [bp-4]
		call	sub_4120
		assume es:nothing
		or	ax, ax
		jz	loc_41FE
		mov	dx, [bp-6]
		mov	ax, [bp-8]

loc_425C::				; CODE XREF: __sbrk+2Fj
		mov	sp, bp
		pop	bp
		retn
sub_420D	endp ; sp-analysis failed

		assume es:nothing

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

; unsigned __int32 farcoreleft(void)
_farcoreleft	proc far		; CODE XREF: _coreleft+2p
					; activate_menu_bar(void)+B5P ...

var_4		= word ptr -4
var_2		= word ptr -2

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	[bp+var_2], 0
		mov	[bp+var_4], 0
		mov	dx, word ptr __heaptop+2
		mov	ax, word ptr __heaptop
		mov	cx, word ptr __brklvl+2
		mov	bx, word ptr __brklvl
		call	near ptr n_psbp@
		assume es:nothing
		mov	[bp+var_2], dx
		mov	[bp+var_4], ax
		cmp	[bp+var_2], 0
		jb	loc_429E
		ja	loc_4296
		cmp	[bp+var_4], 10h
		jbe	loc_429E

loc_4296::				; CODE XREF: _farcoreleft+2Ej
		sub	[bp+var_4], 10h
		sbb	[bp+var_2], 0

loc_429E::				; CODE XREF: _farcoreleft+2Cj
					; _farcoreleft+34j
		and	[bp+var_4], 0FFF0h
		and	[bp+var_2], 0FFFFh
		mov	dx, [bp+var_2]
		mov	ax, [bp+var_4]
		mov	sp, bp
		pop	bp
		retf
_farcoreleft	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; int getch(void)
_getch		proc far		; CODE XREF: seg0000:20F5p
					; seg0000:20FDp ...
		cmp	__cflag, 0
		jz	loc_42C1
		mov	__cflag, 0
		mov	al, __cchar
		jmp	loc_42C6
; ---------------------------------------------------------------------------

loc_42C1::				; CODE XREF: _getch+5j
		mov	ax, 700h
		int	21h		; DOS -	DIRECT STDIN INPUT, NO ECHO

loc_42C6::				; CODE XREF: _getch+Fj
		mov	ah, 0
		retf
_getch		endp

; ---------------------------------------------------------------------------

__ngetche:
		pop	ax
		push	cs
		push	ax

; int getche(void)
_getche:
		push	si
		cmp	__cflag, 0
		jz	loc_42DC
		push	cs
		call	near ptr _getch
		mov	si, ax
		jmp	loc_42E9
; ---------------------------------------------------------------------------

loc_42DC::				; CODE XREF: seg0000:20F2j
		push	cs
		call	near ptr _getch
		mov	si, ax
		push	ax		; c
		nop
		push	cs
		call	near ptr _putch
		pop	cx

loc_42E9::				; CODE XREF: seg0000:20FAj
		mov	ax, si
		pop	si
		retf
; ---------------------------------------------------------------------------

__nungetch:
		pop	ax
		push	cs
		push	ax

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; int __cdecl ungetch(int ch)
_ungetch	proc far

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		cmp	__cflag, 0
		jz	loc_42FF
		mov	ax, 0FFFFh
		jmp	loc_430C
; ---------------------------------------------------------------------------

loc_42FF::				; CODE XREF: _ungetch+8j
		mov	__cflag, 1
		mov	al, byte ptr [bp+arg_0]
		mov	__cchar, al
		mov	ah, 0

loc_430C::				; CODE XREF: _ungetch+Dj
		pop	bp
		retf
_ungetch	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; int __cdecl gettext(int left,	int top, int right, int	bottom,	void *destin)
_gettext	proc far		; CODE XREF: __scroll+88p
					; __scroll+11Ap

var_2		= word ptr -2
left		= word ptr  6
top		= word ptr  8
right		= word ptr  0Ah
bottom		= word ptr  0Ch
destin		= dword	ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	di, [bp+left]
		mov	si, [bp+top]
		push	di
		push	si
		push	[bp+right]
		push	[bp+bottom]
		call	__validatexy
		or	ax, ax
		jnz	loc_432F
		xor	ax, ax
		jmp	loc_435E
; ---------------------------------------------------------------------------

loc_432F::				; CODE XREF: _gettext+1Bj
		mov	ax, [bp+right]
		sub	ax, di
		inc	ax
		mov	[bp+var_2], ax
		jmp	loc_4356
; ---------------------------------------------------------------------------

loc_433A::				; CODE XREF: _gettext+4Bj
		push	word ptr [bp+destin+2]
		push	word ptr [bp+destin]
		push	di
		push	si
		call	__vptr
		push	dx
		push	ax
		push	[bp+var_2]
		call	__screenio
		mov	ax, [bp+var_2]
		shl	ax, 1
		add	word ptr [bp+destin], ax
		inc	si

loc_4356::				; CODE XREF: _gettext+2Aj
		cmp	si, [bp+bottom]
		jle	loc_433A
		mov	ax, 1

loc_435E::				; CODE XREF: _gettext+1Fj
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
_gettext	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; int __cdecl puttext(int left,	int top, int right, int	bottom,	void *source)
_puttext	proc far		; CODE XREF: __scroll+C3p

var_2		= word ptr -2
left		= word ptr  6
top		= word ptr  8
right		= word ptr  0Ah
bottom		= word ptr  0Ch
source		= dword	ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	di, [bp+left]
		mov	si, [bp+top]
		push	di
		push	si
		push	[bp+right]
		push	[bp+bottom]
		call	__validatexy
		or	ax, ax
		jnz	loc_4385
		xor	ax, ax
		jmp	loc_43B4
; ---------------------------------------------------------------------------

loc_4385::				; CODE XREF: _puttext+1Bj
		mov	ax, [bp+right]
		sub	ax, di
		inc	ax
		mov	[bp+var_2], ax
		jmp	loc_43AC
; ---------------------------------------------------------------------------

loc_4390::				; CODE XREF: _puttext+4Bj
		push	di
		push	si
		call	__vptr
		push	dx
		push	ax
		push	word ptr [bp+source+2]
		push	word ptr [bp+source]
		push	[bp+var_2]
		call	__screenio
		mov	ax, [bp+var_2]
		shl	ax, 1
		add	word ptr [bp+source], ax
		inc	si

loc_43AC::				; CODE XREF: _puttext+2Aj
		cmp	si, [bp+bottom]
		jle	loc_4390
		mov	ax, 1

loc_43B4::				; CODE XREF: _puttext+1Fj
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
_puttext	endp

		assume es:nothing

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; int __cdecl int86(int	intno, union REGS *inregs, union REGS *outregs)
_int86		proc far		; CODE XREF: print_form(uchar *,uchar)+6DP
					; ms_mouse::ms_mouse(void)+78P	...

segp		= SREGS	ptr -8
intno		= word ptr  6
inregs		= dword	ptr  8
outregs		= dword	ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 8
		push	ss
		lea	ax, [bp+segp]
		push	ax		; segp
		nop
		push	cs
		call	near ptr _segread
		pop	cx
		pop	cx
		push	ss
		lea	ax, [bp+segp]
		push	ax		; segregs
		push	word ptr [bp+outregs+2]
		push	word ptr [bp+outregs] ;	outregs
		push	word ptr [bp+inregs+2]
		push	word ptr [bp+inregs] ; inregs
		push	[bp+intno]	; intno
		push	cs
		call	near ptr _int86x
		add	sp, 0Eh
		mov	sp, bp
		pop	bp
		retf
_int86		endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; int __cdecl int86x(int intno,	union REGS *inregs, union REGS *outregs, struct	SREGS *segregs)
_int86x		proc far		; CODE XREF: _int86+27p
					; vga_display::get_palette(void)+3BP

var_E		= byte ptr -0Eh
var_D		= byte ptr -0Dh
var_C		= byte ptr -0Ch
var_B		= word ptr -0Bh
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= dword	ptr -4
intno		= word ptr  6
inregs		= dword	ptr  8
outregs		= dword	ptr  0Ch
segregs		= dword	ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 0Eh
		push	si
		push	di
		push	ds
		lea	cx, [bp+var_E]
		mov	word ptr [bp+var_4], cx
		mov	word ptr [bp+var_4+2], ss
		mov	[bp+var_E], 55h	; 'U'
		mov	[bp+var_D], 0CDh ; 'Í'
		mov	ax, [bp+intno]
		mov	[bp+var_C], al
		mov	[bp+var_B], 0CB5Dh
		cmp	al, 25h	; '%'
		jb	loc_4429
		cmp	al, 26h	; '&'
		ja	loc_4429
		mov	byte ptr [bp+var_B], 36h ; '6'
		mov	[bp+var_B+1], 68Fh
		mov	[bp+var_8], cx	; CODE XREF: seg1c75:4110p
		mov	[bp+var_6], 0CB5Dh

loc_4429::				; CODE XREF: _int86x+27j _int86x+2Bj
		lds	si, [bp+segregs]
		assume ds:seg2b53
		push	word ptr [si]
		push	word ptr [si+6]
		lds	si, [bp+inregs]
		mov	ax, [si]
		mov	bx, [si+2]
		mov	cx, [si+4]
		mov	dx, [si+6]
		mov	di, [si+0Ah]
		mov	si, [si+8]
		pop	ds
		assume ds:seg2608
		pop	es
		call	[bp+var_4]
		pushf
		pushf
		push	si
		push	ds
		push	es
		lds	si, [bp+segregs]
		assume ds:seg2b53
		pop	word ptr [si]
		pop	word ptr [si+6]
		lds	si, [bp+outregs]
		pop	word ptr [si+8]
		pop	word ptr [si+0Eh]
		pop	word ptr [si+0Ch]
		and	word ptr [si+0Ch], 1
		mov	[si+0Ah], di
		mov	[si+6],	dx
		mov	[si+4],	cx
		mov	[si+2],	bx
		mov	[si], ax
		pop	ds
		assume ds:seg2608
		jz	loc_447E
		assume es:seg2608
		push	ax
		push	ax
		call	__ioerror
		pop	ax
		assume es:nothing

loc_447E::				; CODE XREF: _int86x+8Bj
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
_int86x		endp

		assume es:nothing

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; void __cdecl intr(int	intno, struct REGPACK *preg)
_intr		proc far		; CODE XREF: ms_mouse::ms_mouse(void)+D7P
					; vga_display::vga_display(uchar)+7DP

var_12		= word ptr -12h
var_10		= byte ptr -10h
var_F		= byte ptr -0Fh
var_E		= byte ptr -0Eh
var_D		= byte ptr -0Dh
var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= byte ptr -8
var_7		= word ptr -7
var_4		= dword	ptr -4
intno		= word ptr  6
preg		= dword	ptr  8

; FUNCTION CHUNK AT 22EB SIZE 0000005D BYTES

		push	bp
		mov	bp, sp
		sub	sp, 12h
		push	si
		push	di
		push	bp
		push	ds
		pushf
		lea	cx, [bp+var_12]
		mov	word ptr [bp+var_4], cx
		mov	word ptr [bp+var_4+2], ss
		mov	[bp+var_12], 6E8Bh
		mov	[bp+var_10], 0DEh ; 'Þ'
		mov	[bp+var_F], 0CDh ; 'Í'
		mov	ax, [bp+intno]
		mov	[bp+var_E], al
		cmp	al, 25h	; '%'
		jb	short loc_44CB
		assume es:nothing
		cmp	al, 26h	; '&'
		ja	short loc_44CB
		mov	[bp+var_D], 36h	; '6'
		mov	[bp+var_C], 68Fh
		mov	[bp+var_A], cx
		mov	[bp+var_8], 0CAh ; 'Ê'
		mov	[bp+var_7], 2
		jmp	short loc_44D4
_intr		endp

		assume es:nothing, ds:seg2b53

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

nullsub_3	proc far		; CODE XREF: _intr+99p
		iret
nullsub_3	endp

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR _intr
		assume es:nothing, ds:seg2608

loc_44CB::				; CODE XREF: _intr+29j	_intr+2Dj
		mov	[bp+var_D], 0CAh ; 'Ê'
		mov	[bp+var_C], 2

loc_44D4::				; CODE XREF: _intr+44j
		lds	di, [bp+preg]
		assume ds:seg2b53
		push	ds
		push	di
		mov	ax, [di]
		mov	bx, [di+2]
		mov	cx, [di+4]
		mov	dx, [di+6]
		push	word ptr [di+8]
		mov	si, [di+0Ah]
		mov	es, word ptr [di+10h]
		assume es:nothing
		lds	di, [di+0Ch]
		assume ds:nothing
		call	[bp+var_4]
		assume es:nothing
		push	ds
		push	di
		push	bp
		pushf
		mov	bp, sp
		lds	di, [bp+preg]
		assume ds:seg2b53
		mov	[di], ax
		mov	[di+2],	bx
		mov	[di+4],	cx
		mov	[di+6],	dx
		mov	[di+0Ah], si
		mov	word ptr [di+10h], es
		pop	word ptr [di+12h]
		pop	word ptr [di+8]
		pop	word ptr [di+0Ch]
		pop	word ptr [di+0Eh]
		add	sp, 4
		push	cs
		call	near ptr nullsub_3
		pop	ds
		assume ds:seg2608
		pop	bp
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
; END OF FUNCTION CHUNK	FOR _intr
		assume es:seg2608

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; int ioctl(int	handle,	int func, ...)
_ioctl		proc far		; CODE XREF: _open+D4p	_open+FCp

handle		= word ptr  6
func		= word ptr  8
arg_4		= dword	ptr  0Ah
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	ds
		lds	dx, [bp+arg_4]
		assume ds:nothing
		mov	ah, 44h	; 'D'
		mov	al, byte ptr [bp+func]
		mov	bx, [bp+handle]
		mov	cx, [bp+arg_8]
		int	21h		; DOS -	2+ - IOCTL -
		pop	ds
		assume ds:seg2608
		jb	loc_454B
		cmp	[bp+func], 0
		jnz	loc_4549
		mov	ax, dx
		jmp	loc_454F
; ---------------------------------------------------------------------------

loc_4549::				; CODE XREF: _ioctl+1Bj
		jmp	loc_454F
; ---------------------------------------------------------------------------

loc_454B::				; CODE XREF: _ioctl+15j
		push	ax
		call	__ioerror

loc_454F::				; CODE XREF: _ioctl+1Fj
					; _ioctl:loc_4549j
		pop	bp
		retf
_ioctl		endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; int kbhit(void)
_kbhit		proc far		; CODE XREF: seg137f:loc_1897AP
		cmp	__cflag, 0
		jz	loc_455D
		mov	ax, 1
		jmp	locret_4562
; ---------------------------------------------------------------------------

loc_455D::				; CODE XREF: _kbhit+5j
		mov	ah, 0Bh
		int	21h		; DOS -	CHECK STANDARD INPUT STATUS
					; Return: AL = FFh if character	available
					; 00h if no character
		cbw

locret_4562::				; CODE XREF: _kbhit+Aj
		retf
_kbhit		endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; int __cdecl movetext(int left, int top, int right, int bottom, int destleft, int desttop)
_movetext	proc far		; CODE XREF: __scroll+62p __scroll+F4p

var_4		= word ptr -4
var_2		= word ptr -2
left		= word ptr  6
top		= word ptr  8
right		= word ptr  0Ah
bottom		= word ptr  0Ch
destleft	= word ptr  0Eh
desttop		= word ptr  10h

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+top]
		mov	di, [bp+bottom]
		push	[bp+left]
		push	si
		push	[bp+right]
		push	di
		call	__validatexy
		or	ax, ax
		jz	loc_45A3
		push	[bp+destleft]
		push	[bp+desttop]
		mov	ax, [bp+right]
		sub	ax, [bp+left]
		mov	dx, [bp+destleft]
		add	dx, ax
		push	dx
		mov	ax, di
		sub	ax, si
		mov	dx, [bp+desttop]
		add	dx, ax
		push	dx
		call	__validatexy
		or	ax, ax
		jnz	loc_45A7

loc_45A3::				; CODE XREF: _movetext+1Bj
		xor	ax, ax
		jmp	loc_45FA
; ---------------------------------------------------------------------------

loc_45A7::				; CODE XREF: _movetext+3Ej
		mov	dx, si
		mov	[bp+var_2], di
		mov	[bp+var_4], 1
		cmp	si, [bp+desttop]
		jge	loc_45C0
		mov	dx, di
		mov	[bp+var_2], si
		mov	[bp+var_4], 0FFFFh

loc_45C0::				; CODE XREF: _movetext+51j
		mov	di, dx
		jmp	loc_45ED
; ---------------------------------------------------------------------------

loc_45C4::				; CODE XREF: _movetext+92j
		push	[bp+destleft]
		mov	ax, di
		sub	ax, si
		mov	dx, [bp+desttop]
		add	dx, ax
		push	dx
		call	__vptr
		push	dx
		push	ax
		push	[bp+left]
		push	di
		call	__vptr

loc_45DD::				; CODE XREF: sub_21C0F+7p
		push	dx
		push	ax
		mov	ax, [bp+right]
		sub	ax, [bp+left]
		inc	ax
		push	ax
		call	__screenio
		add	di, [bp+var_4]

loc_45ED::				; CODE XREF: _movetext+5Fj
		mov	ax, [bp+var_2]
		add	ax, [bp+var_4]
		cmp	ax, di
		jnz	loc_45C4
		mov	ax, 1

loc_45FA::				; CODE XREF: _movetext+42j
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
_movetext	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; int __cdecl putch(int	c)
_putch		proc far		; CODE XREF: seg0000:2105p

c_		= word ptr  6

		push	bp
		mov	bp, sp
		push	ss
		lea	ax, [bp+c_]
		push	ax
		mov	ax, 1
		push	ax
		xor	ax, ax
		xor	dx, dx
		push	ax
		push	dx
		call	__cputn
		pop	bp
		retf
_putch		endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

__realcvt	proc near		; CODE XREF: __vprinter+31Bp
					; _core_startworx+72p
		jmp	__realcvtvector
__realcvt	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

sub_461B	proc near		; CODE XREF: sub_4687+31p sub_4687+54p

var_1		= byte ptr -1
arg_0		= word ptr  4

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	ax, [bp+arg_0]
		shr	ax, 1
		mov	cx, ax
		mov	al, byte_2B39E
		mov	ah, 0
		push	ax
		mov	ax, cx
		xor	dx, dx
		pop	bx
		div	bx
		mov	bl, al
		mov	ah, 0
		mov	dl, byte_2B39E
		mov	dh, 0
		imul	dx
		mov	dl, cl
		sub	dl, al
		mov	[bp+var_1], dl
		mov	ah, bl
		mov	al, [bp+var_1]
		mov	sp, bp
		pop	bp
		retn	4
sub_461B	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

sub_4653	proc near		; CODE XREF: sub_4687+6Cp sub_4687+94p

arg_0		= dword	ptr  4
arg_4		= dword	ptr  8

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_4]
		assume es:nothing
		mov	dx, es:[bx]
		les	bx, [bp+arg_0]
		cmp	dx, es:[bx]
		jz	loc_4671
		mov	bh, 0
		mov	ah, 2
		call	__videoint
		les	bx, [bp+arg_0]
		mov	es:[bx], dx

loc_4671::				; CODE XREF: sub_4653+Fj
		inc	dl
		cmp	dl, byte_2B39E
		jb	loc_467D
		inc	dh
		mov	dl, 0

loc_467D::				; CODE XREF: sub_4653+24j
		les	bx, [bp+arg_4]
		mov	es:[bx], dx
		pop	bp
		retn	8
sub_4653	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

sub_4687	proc near		; CODE XREF: __screenio+35p

var_C		= word ptr -0Ch
var_A		= word ptr -0Ah
var_8		= word ptr -8
var_6		= word ptr -6
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  4
arg_2		= dword	ptr  6
arg_6		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 0Ch
		push	si
		push	di
		mov	di, [bp+arg_0]
		call	__wherexy
		mov	[bp+var_8], ax
		mov	[bp+var_6], ax
		mov	ax, word ptr [bp+arg_6+2]
		cmp	ax, word_2B3A3
		jnz	loc_46A9
		mov	ax, 1
		jmp	loc_46AB
; ---------------------------------------------------------------------------

loc_46A9::				; CODE XREF: sub_4687+1Bj
		xor	ax, ax

loc_46AB::				; CODE XREF: sub_4687+20j
		mov	[bp+var_A], ax
		or	ax, ax
		jz	loc_46BE
		push	word ptr [bp+arg_6+2]
		push	word ptr [bp+arg_6]
		call	sub_461B
		mov	[bp+var_2], ax

loc_46BE::				; CODE XREF: sub_4687+29j
		mov	ax, word ptr [bp+arg_2+2]
		cmp	ax, word_2B3A3
		jnz	loc_46CC
		mov	ax, 1
		jmp	loc_46CE
; ---------------------------------------------------------------------------

loc_46CC::				; CODE XREF: sub_4687+3Ej
		xor	ax, ax

loc_46CE::				; CODE XREF: sub_4687+43j
		mov	[bp+var_C], ax
		or	ax, ax
		jz	loc_4738
		push	word ptr [bp+arg_2+2]
		push	word ptr [bp+arg_2]
		call	sub_461B
		mov	[bp+var_4], ax
		jmp	loc_4738
; ---------------------------------------------------------------------------

loc_46E3::				; CODE XREF: sub_4687+B6j
		cmp	[bp+var_C], 0
		jz	loc_4701
		push	ss
		lea	ax, [bp+var_4]
		push	ax
		push	ss
		lea	ax, [bp+var_6]
		push	ax
		call	sub_4653
		mov	bh, 0
		mov	ah, 8
		call	__videoint
		mov	si, ax
		jmp	loc_470B
; ---------------------------------------------------------------------------

loc_4701::				; CODE XREF: sub_4687+60j
		les	bx, [bp+arg_2]
		mov	si, es:[bx]
		add	word ptr [bp+arg_2], 2

loc_470B::				; CODE XREF: sub_4687+78j
		cmp	[bp+var_A], 0
		jz	loc_472E
		push	ss
		lea	ax, [bp+var_2]
		push	ax
		push	ss
		lea	ax, [bp+var_6]
		push	ax
		call	sub_4653
		mov	ax, si
		mov	bl, ah
		mov	cx, 1
		mov	bh, 0
		mov	ah, 9
		call	__videoint
		jmp	loc_4738
; ---------------------------------------------------------------------------

loc_472E::				; CODE XREF: sub_4687+88j
		les	bx, [bp+arg_6]
		mov	es:[bx], si
		add	word ptr [bp+arg_6], 2

loc_4738::				; CODE XREF: sub_4687+4Cj sub_4687+5Aj ...
		mov	ax, di
		dec	di
		or	ax, ax
		jnz	loc_46E3
		mov	dx, [bp+var_8]
		mov	bh, 0
		mov	ah, 2
		call	__videoint
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retn	0Ah
sub_4687	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

__screenio	proc near		; CODE XREF: _gettext+3Cp _puttext+3Cp ...

arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8
arg_6		= word ptr  0Ah
arg_8		= word ptr  0Ch

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_0]
		mov	al, byte_2B39F
		mov	ah, 0
		or	ax, ax
		jnz	loc_4779
		cmp	_directvideo, 0
		jz	loc_4779
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	dx
		call	__vram
		jmp	loc_4789
; ---------------------------------------------------------------------------

loc_4779::				; CODE XREF: __screenio+Dj
					; __screenio+14j
		push	[bp+arg_8]
		push	[bp+arg_6]
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	dx
		call	sub_4687

loc_4789::				; CODE XREF: __screenio+26j
		pop	bp
		retn	0Ah
__screenio	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

__validatexy	proc near		; CODE XREF: _gettext+16p _puttext+16p ...

arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8
arg_6		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	bx, [bp+arg_6]
		mov	si, [bp+arg_4]
		mov	di, [bp+arg_2]
		mov	al, byte_2B39E
		mov	ah, 0
		mov	cx, ax
		mov	al, byte_2B39D
		mov	ah, 0
		mov	dx, ax
		cmp	bx, cx
		ja	short loc_47DA
		cmp	di, cx
		ja	short loc_47DA
		cmp	bx, di
		jg	short loc_47DA
		cmp	si, dx
		ja	short loc_47DA
		cmp	[bp+arg_0], dx
		ja	short loc_47DA
		cmp	si, [bp+arg_0]
		jg	short loc_47DA
		or	bx, bx
		jle	short loc_47DA
		or	di, di
		jle	short loc_47DA
		or	si, si
		jle	short loc_47DA
		cmp	[bp+arg_0], 0
		jle	short loc_47DA
		mov	ax, 1
		jmp	short loc_47DC
; ---------------------------------------------------------------------------

loc_47DA::				; CODE XREF: __validatexy+1Ej
					; __validatexy+22j ...
		xor	ax, ax

loc_47DC::				; CODE XREF: __validatexy+4Bj
		pop	di
		pop	si
		pop	bp
		retn	8
__validatexy	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

sub_47E2	proc near		; CODE XREF: __scroll+A0p
					; __scroll+132p

arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= dword	ptr  8

		push	bp
		mov	bp, sp
		mov	dx, [bp+arg_2]
		mov	ch, byte_2B39A
		mov	cl, 20h	; ' '
		jmp	loc_47FB
; ---------------------------------------------------------------------------

loc_47F0::				; CODE XREF: sub_47E2+1Cj
		les	bx, [bp+arg_4]
		mov	es:[bx], cx
		add	word ptr [bp+arg_4], 2
		inc	dx

loc_47FB::				; CODE XREF: sub_47E2+Cj
		cmp	dx, [bp+arg_0]
		jle	loc_47F0
		pop	bp
		retn	8
sub_47E2	endp

		assume es:seg2608

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

__scroll	proc near		; CODE XREF: _clrscr+16p __cputn+FBp

destin		= byte ptr -0A0h
arg_0		= byte ptr  4
arg_2		= byte ptr  6
arg_4		= byte ptr  8
arg_6		= byte ptr  0Ah
arg_8		= byte ptr  0Ch
arg_A		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 0A0h
		mov	al, byte_2B39F
		mov	ah, 0
		or	ax, ax
		jz	loc_4817
		jmp	loc_4951
; ---------------------------------------------------------------------------

loc_4817::				; CODE XREF: __scroll+Ej
		cmp	_directvideo, 0
		jnz	loc_4821
		jmp	loc_4951
; ---------------------------------------------------------------------------

loc_4821::				; CODE XREF: __scroll+18j
		cmp	[bp+arg_0], 1
		jz	loc_482A
		jmp	loc_4951
; ---------------------------------------------------------------------------

loc_482A::				; CODE XREF: __scroll+21j
		inc	[bp+arg_8]
		inc	[bp+arg_6]
		inc	[bp+arg_4]
		inc	[bp+arg_2]
		cmp	[bp+arg_A], 6
		jz	loc_483F
		jmp	loc_48D0
; ---------------------------------------------------------------------------

loc_483F::				; CODE XREF: __scroll+36j
		mov	al, [bp+arg_6]
		mov	ah, 0
		push	ax		; desttop
		mov	al, [bp+arg_8]
		mov	ah, 0
		push	ax		; destleft
		mov	al, [bp+arg_2]
		mov	ah, 0
		push	ax		; bottom
		mov	al, [bp+arg_4]
		mov	ah, 0
		push	ax		; right
		mov	al, [bp+arg_6]
		mov	ah, 0
		inc	ax
		push	ax		; top
		mov	al, [bp+arg_8]
		mov	ah, 0
		push	ax		; left
		nop
		push	cs
		call	near ptr _movetext
		add	sp, 0Ch
		push	ss
		lea	ax, [bp+destin]
		push	ax		; destin
		mov	al, [bp+arg_2]
		mov	ah, 0
		push	ax		; bottom
		mov	al, [bp+arg_8]
		mov	ah, 0
		push	ax		; right
		mov	al, [bp+arg_2]
		mov	ah, 0
		push	ax		; top
		mov	al, [bp+arg_8]
		mov	ah, 0
		push	ax		; left
		nop
		push	cs
		call	near ptr _gettext
		add	sp, 0Ch
		push	ss
		lea	ax, [bp+destin]
		push	ax
		mov	al, [bp+arg_8]
		mov	ah, 0
		push	ax
		mov	al, [bp+arg_4]
		mov	ah, 0
		push	ax
		call	sub_47E2
		push	ss
		lea	ax, [bp+destin]
		push	ax		; source
		mov	al, [bp+arg_2]
		mov	ah, 0
		push	ax		; bottom
		mov	al, [bp+arg_4]
		mov	ah, 0
		push	ax		; right
		mov	al, [bp+arg_2]

loc_48BC::				; CODE XREF: __scroll+14Aj
		mov	ah, 0
		push	ax		; top
		mov	al, [bp+arg_8]
		mov	ah, 0
		push	ax		; left
		nop
		push	cs
		call	near ptr _puttext
		add	sp, 0Ch
		jmp	loc_496A
; ---------------------------------------------------------------------------

loc_48D0::				; CODE XREF: __scroll+38j
		mov	al, [bp+arg_6]
		mov	ah, 0
		inc	ax
		push	ax		; desttop
		mov	al, [bp+arg_8]
		mov	ah, 0
		push	ax		; destleft
		mov	al, [bp+arg_2]
		mov	ah, 0
		dec	ax
		push	ax		; bottom
		mov	al, [bp+arg_4]
		mov	ah, 0
		push	ax		; right
		mov	al, [bp+arg_6]
		mov	ah, 0
		push	ax		; top
		mov	al, [bp+arg_8]
		mov	ah, 0
		push	ax		; left
		nop
		push	cs
		call	near ptr _movetext
		add	sp, 0Ch
		push	ss
		lea	ax, [bp+destin]
		push	ax		; destin
		mov	al, [bp+arg_6]
		mov	ah, 0
		push	ax		; bottom
		mov	al, [bp+arg_8]
		mov	ah, 0
		push	ax		; right
		mov	al, [bp+arg_6]
		mov	ah, 0
		push	ax		; top
		mov	al, [bp+arg_8]
		mov	ah, 0
		push	ax		; left
		nop
		push	cs
		call	near ptr _gettext
		add	sp, 0Ch
		push	ss
		lea	ax, [bp+destin]
		push	ax
		mov	al, [bp+arg_8]
		mov	ah, 0
		push	ax
		mov	al, [bp+arg_4]
		mov	ah, 0
		push	ax
		call	sub_47E2
		push	ss
		lea	ax, [bp+destin]
		push	ax
		mov	al, [bp+arg_6]
		mov	ah, 0
		push	ax
		mov	al, [bp+arg_4]
		mov	ah, 0
		push	ax
		mov	al, [bp+arg_6]
		jmp	loc_48BC
; ---------------------------------------------------------------------------

loc_4951::				; CODE XREF: __scroll+10j __scroll+1Aj ...
		mov	bh, byte_2B39A
		mov	ah, [bp+arg_A]
		mov	al, [bp+arg_0]
		mov	ch, [bp+arg_6]
		mov	cl, [bp+arg_8]
		mov	dh, [bp+arg_2]
		mov	dl, [bp+arg_4]
		call	__videoint

loc_496A::				; CODE XREF: __scroll+C9j
		mov	sp, bp
		pop	bp
		retn	0Ch
__scroll	endp

; ---------------------------------------------------------------------------
word_4970	dw 0			; DATA XREF: unknown_libname_3+Cw
					; unknown_libname_3+C3r ...

; =============== S U B	R O U T	I N E =======================================

; TCC/TCC++/BCC++ 16 bit DOS
; Attributes: library function

unknown_libname_3 proc near		; DATA XREF: seg2608:3496o

; FUNCTION CHUNK AT 284D SIZE 0000006E BYTES

		pop	off_2B3EE
		pop	word_2B3F0
		pop	word_2B3F2
		mov	cs:word_4970, ds
		mov	word_2B3F4, si
		mov	word_2B3F6, di
		cld
		mov	es, __psp
		assume es:nothing
		mov	si, 80h	; ''
		xor	ah, ah
		lods	byte ptr es:[si]
		inc	ax
		mov	bp, es
		xchg	dx, si
		xchg	ax, bx
		mov	si, __envlng
		inc	si
		inc	si
		mov	cx, 1
		cmp	__version, 3
		jb	loc_49BE
		mov	es, __envseg
		assume es:nothing
		mov	di, si
		mov	cl, 7Fh	; ''
		xor	al, al
		repne scasb
		jcxz	loc_4A2D
		xor	cl, 7Fh

loc_49BE::				; CODE XREF: unknown_libname_3+39j
		push	ax
		mov	ax, cx
		add	ax, bx
		inc	ax
		and	ax, 0FFFEh
		mov	di, sp
		sub	di, ax
		jb	loc_4A2D
		mov	sp, di
		push	es
		pop	ds
		assume ds:nothing
		push	ss
		pop	es
		assume es:seg2b53
		push	cx
		dec	cx
		rep movsb
		xor	al, al
		stosb
		mov	ds, bp
		assume ds:nothing
		xchg	si, dx
		xchg	bx, cx
		mov	ax, bx
		mov	dx, ax
		inc	bx

loc_49E5::				; CODE XREF: unknown_libname_3+8Dj
					; unknown_libname_3+91j
		call	sub_4A05
		ja	loc_49F5

loc_49EA::				; CODE XREF: unknown_libname_3+81j
		jb	loc_4A32
		cmp	al, 0Dh
		jz	loc_4A01
		call	sub_4A05
		ja	loc_49EA

loc_49F5::				; CODE XREF: unknown_libname_3+76j
		cmp	al, 20h	; ' '
		jz	loc_4A01
		cmp	al, 0Dh
		jz	loc_4A01
		cmp	al, 9
		jnz	loc_49E5

loc_4A01::				; CODE XREF: unknown_libname_3+7Cj
					; unknown_libname_3+85j ...
		xor	al, al
		jmp	loc_49E5
unknown_libname_3 endp ; sp-analysis failed


; =============== S U B	R O U T	I N E =======================================


sub_4A05	proc near		; CODE XREF: unknown_libname_3:loc_49E5p
					; unknown_libname_3+7Ep
		or	ax, ax
		jz	loc_4A10
		inc	dx
		stosb
		or	al, al
		jnz	loc_4A10
		inc	bx

loc_4A10::				; CODE XREF: sub_4A05+2j sub_4A05+8j
		xchg	ah, al
		xor	al, al
		stc
		jcxz	locret_4A2C
		lodsb
		dec	cx
		sub	al, 22h	; '"'
		jz	locret_4A2C
		add	al, 22h	; '"'
		cmp	al, 5Ch	; '\'
		jnz	loc_4A2A
		cmp	byte ptr [si], 22h ; '"'
		jnz	loc_4A2A
		lodsb
		dec	cx

loc_4A2A::				; CODE XREF: sub_4A05+1Cj sub_4A05+21j
		or	si, si

locret_4A2C::				; CODE XREF: sub_4A05+10j sub_4A05+16j
		retn
sub_4A05	endp

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR unknown_libname_3

loc_4A2D::				; CODE XREF: unknown_libname_3+47j
					; unknown_libname_3+59j ...
		nop
		nop
		jmp	_abort
; ---------------------------------------------------------------------------

loc_4A32::				; CODE XREF: unknown_libname_3:loc_49EAj
		pop	cx
		add	cx, dx
		mov	ds, cs:word_4970
		assume ds:seg2608
		mov	__argc,	bx
		inc	bx
		add	bx, bx
		add	bx, bx
		mov	si, sp
		mov	bp, sp
		sub	bp, bx
		jb	loc_4A2D
		mov	sp, bp
		mov	__argv,	bp
		mov	word_2B3EC, ss

loc_4A55::				; CODE XREF: unknown_libname_3+F4j
		jcxz	loc_4A68
		mov	[bp+0],	si
		mov	word ptr [bp+2], ss
		add	bp, 4

loc_4A60::				; CODE XREF: unknown_libname_3+F2j
		lods	byte ptr ss:[si]
		or	al, al
		loopne	loc_4A60
		jz	loc_4A55

loc_4A68::				; CODE XREF: unknown_libname_3:loc_4A55j
		xor	ax, ax
		mov	[bp+0],	ax
		mov	[bp+2],	ax
		mov	ds, cs:word_4970
		mov	si, word_2B3F4
		mov	di, word_2B3F6
		push	word_2B3F2
		push	word_2B3F0
		mov	ax, __argc
		mov	__c0argc, ax
		mov	ax, word_2B3EC
		mov	word ptr __c0argv+2, ax
		mov	ax, __argv
		mov	word ptr __c0argv, ax
		jmp	off_2B3EE
; END OF FUNCTION CHUNK	FOR unknown_libname_3
		assume es:nothing

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; int __cdecl setblock(unsigned	int segx, unsigned int newsize)
_setblock	proc far		; CODE XREF: sub_4120+4Ap

segx		= word ptr  6
newsize		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ah, 4Ah	; 'J'
		mov	bx, [bp+newsize]
		mov	es, [bp+segx]
		assume es:nothing
		int	21h		; DOS -	2+ - ADJUST MEMORY BLOCK SIZE (SETBLOCK)
					; ES = segment address of block	to change
					; BX = new size	in paragraphs
		jb	loc_4AAF
		mov	ax, 0FFFFh
		jmp	loc_4AB5
; ---------------------------------------------------------------------------

loc_4AAF::				; CODE XREF: _setblock+Dj
		push	bx
		push	ax
		call	__ioerror
		pop	ax

loc_4AB5::				; CODE XREF: _setblock+12j
		pop	bp
		retf
_setblock	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; void __cdecl sound(unsigned int frequency)
_sound		proc far		; CODE XREF: @pc_sound_doit$qve+80P
					; beep(void)+6P

frequency	= word ptr  6

		push	bp
		mov	bp, sp
		mov	bx, [bp+frequency]
		mov	ax, 34DDh
		mov	dx, 12h
		cmp	dx, bx
		jnb	loc_4AE1
		div	bx
		mov	bx, ax
		in	al, 61h		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	ÍËÍ OR	03H=spkr ON
					; 1: Tmr 2 data	Í¼  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		test	al, 3
		jnz	loc_4AD9
		or	al, 3
		out	61h, al		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	ÍËÍ OR	03H=spkr ON
					; 1: Tmr 2 data	Í¼  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		mov	al, 0B6h ; '¶'
		out	43h, al		; Timer	8253-5 (AT: 8254.2).

loc_4AD9::				; CODE XREF: _sound+18j
		mov	al, bl
		out	42h, al		; Timer	8253-5 (AT: 8254.2).
		mov	al, bh
		out	42h, al		; Timer	8253-5 (AT: 8254.2).

loc_4AE1::				; CODE XREF: _sound+Ej
		pop	bp
		retf
_sound		endp

		assume es:nothing

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; void nosound(void)
_nosound	proc far		; CODE XREF: game_manager::~game_manager(void)+44P
					; @pc_sound_doit$qve+99P ...
		in	al, 61h		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	ÍËÍ OR	03H=spkr ON
					; 1: Tmr 2 data	Í¼  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		and	al, 0FCh
		out	61h, al		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	ÍËÍ OR	03H=spkr ON
					; 1: Tmr 2 data	Í¼  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		retf
_nosound	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

__wherexy	proc near		; CODE XREF: __cputn+Ep __cputn+16p ...
		mov	ah, 3
		mov	bh, 0
		call	__videoint
		mov	ax, dx
		retn
__wherexy	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; int wherex(void)
_wherex		proc far
		call	__wherexy
		mov	ah, 0
		mov	dl, __video
		mov	dh, 0
		sub	ax, dx
		inc	ax
		retf
_wherex		endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; int wherey(void)
_wherey		proc far
		call	__wherexy
		mov	cl, 8
		shr	ax, cl
		mov	ah, 0
		mov	dl, byte_2B397
		mov	dh, 0
		sub	ax, dx
		inc	ax
		retf
_wherey		endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; __int32 __cdecl atol(const char *s)
_atol		proc far		; CODE XREF: _atoi+Ap atoi(uchar *)+9P

s		= dword	ptr  6

		push	bp
		mov	bp, sp
		push	si
		push	di
		push	es
		push	bp
		les	si, [bp+s]
		assume es:nothing
		cld
		sub	ax, ax
		cwd
		mov	cx, 0Ah
		mov	bh, 0
		mov	di, (offset __ctype+1)

loc_4B2C::				; CODE XREF: _atol+1Dj
		mov	bl, es:[si]
		inc	si
		test	byte ptr [bx+di], 1
		jnz	loc_4B2C
		mov	bp, 0
		cmp	bl, 2Bh	; '+'
		jz	loc_4B43
		cmp	bl, 2Dh	; '-'
		jnz	loc_4B47
		inc	bp

loc_4B43::				; CODE XREF: _atol+25j	_atol+41j
		mov	bl, es:[si]
		inc	si

loc_4B47::				; CODE XREF: _atol+2Aj
		cmp	bl, 39h	; '9'
		ja	loc_4B7B
		sub	bl, 30h	; '0'
		jb	loc_4B7B
		mul	cx
		add	ax, bx
		adc	dl, dh
		jz	loc_4B43
		jmp	loc_4B6D
; ---------------------------------------------------------------------------

loc_4B5B::				; CODE XREF: _atol+63j
		mov	di, dx
		mov	cx, 0Ah
		mul	cx
		xchg	ax, di
		xchg	dx, cx
		mul	dx
		xchg	ax, dx
		xchg	ax, di
		add	ax, bx
		adc	dx, cx

loc_4B6D::				; CODE XREF: _atol+43j
		mov	bl, es:[si]
		inc	si
		cmp	bl, 39h	; '9'
		ja	loc_4B7B
		sub	bl, 30h	; '0'
		jnb	loc_4B5B

loc_4B7B::				; CODE XREF: _atol+34j	_atol+39j ...
		dec	bp
		jl	loc_4B85
		neg	dx
		neg	ax
		sbb	dx, 0

loc_4B85::				; CODE XREF: _atol+66j
		pop	bp
		pop	es
		pop	di
		pop	si
		pop	bp
		retf
_atol		endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; int __cdecl atoi(const char *s)
_atoi		proc far

s		= dword	ptr  6

		push	bp
		mov	bp, sp
		push	word ptr [bp+s+2]
		push	word ptr [bp+s]	; s
		push	cs
		call	near ptr _atol
		pop	cx
		pop	cx
		pop	bp
		retf
_atoi		endp

		assume es:seg2608

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; int _chmod(const char	*pathname, int func, ...)
__chmod		proc far		; CODE XREF: _open+27p	_open+12Ep

pathname	= dword	ptr  6
func		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	ds
		mov	cx, [bp+arg_6]
		mov	ah, 43h	; 'C'
		mov	al, byte ptr [bp+func]
		lds	dx, [bp+pathname]
		int	21h		; DOS -
		pop	ds
		jb	loc_4BB3
		xchg	ax, cx
		jmp	loc_4BB7
; ---------------------------------------------------------------------------

loc_4BB3::				; CODE XREF: __chmod+12j
		push	ax
		call	__ioerror

loc_4BB7::				; CODE XREF: __chmod+15j
		pop	bp
		retf
__chmod		endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; int __cdecl close(int	handle)
_close		proc far		; CODE XREF: _fclose+6Cp seg1783:0AAFP ...

handle		= word ptr  6

		push	bp
		mov	bp, sp
		mov	dx, [bp+handle]
		cmp	dx, __nfile
		jb	loc_4BCE
		mov	ax, 6
		push	ax
		call	__ioerror
		jmp	loc_4BDF
; ---------------------------------------------------------------------------

loc_4BCE::				; CODE XREF: _close+Aj
		mov	bx, dx
		shl	bx, 1
		mov	__openfd[bx], 0
		push	dx		; handle
		nop
		push	cs
		call	near ptr __close
		pop	cx

loc_4BDF::				; CODE XREF: _close+13j
		pop	bp
		retf
_close		endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; int __cdecl _close(int handle)
__close		proc far		; CODE XREF: _close+22p _open+9Ep

handle		= word ptr  6

		push	bp
		mov	bp, sp
		mov	ah, 3Eh	; '>'
		mov	bx, [bp+handle]
		int	21h		; DOS -	2+ - CLOSE A FILE WITH HANDLE
					; BX = file handle
		jb	loc_4BF9
		shl	bx, 1
		mov	__openfd[bx], 0
		xor	ax, ax
		jmp	loc_4BFD
; ---------------------------------------------------------------------------

loc_4BF9::				; CODE XREF: __close+Aj
		push	ax
		call	__ioerror

loc_4BFD::				; CODE XREF: __close+16j
		pop	bp
		retf
__close		endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; int __cdecl eof(int handle)
_eof		proc far		; CODE XREF: _fgetc+A4p

var_4		= word ptr -4
var_2		= word ptr -2
handle		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	ax, [bp+handle]
		cmp	ax, __nfile
		jb	loc_4C14
		mov	ax, 6
		push	ax
		jmp	loc_4C6F
; ---------------------------------------------------------------------------

loc_4C14::				; CODE XREF: _eof+Dj
		mov	bx, [bp+handle]
		shl	bx, 1
		test	__openfd[bx], 200h
		jz	loc_4C26

loc_4C21::				; CODE XREF: _eof:loc_4C68j
		mov	ax, 1
		jmp	loc_4C72
; ---------------------------------------------------------------------------

loc_4C26::				; CODE XREF: _eof+20j
		mov	ax, 4400h
		mov	bx, [bp+handle]
		int	21h		; DOS -	2+ - IOCTL - GET DEVICE	INFORMATION
					; BX = file or device handle
		jb	loc_4C6E
		test	dl, 80h
		jnz	loc_4C6A
		mov	ax, 4201h
		xor	cx, cx
		mov	dx, cx
		int	21h		; DOS -	2+ - MOVE FILE READ/WRITE POINTER (LSEEK)
					; AL = method: offset from present location
		jb	loc_4C6E
		push	dx
		push	ax
		mov	ax, 4202h
		xor	cx, cx
		mov	dx, cx
		int	21h		; DOS -	2+ - MOVE FILE READ/WRITE POINTER (LSEEK)
					; AL = method: offset from end of file
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		pop	dx
		pop	cx
		jb	loc_4C6E
		mov	ax, 4200h
		int	21h		; DOS -	2+ - MOVE FILE READ/WRITE POINTER (LSEEK)
					; AL = method: offset from beginning of	file
		jb	loc_4C6E
		cmp	dx, [bp+var_2]
		jb	loc_4C6A
		ja	loc_4C68
		cmp	ax, [bp+var_4]
		jb	loc_4C6A

loc_4C68::				; CODE XREF: _eof+62j
		jmp	loc_4C21
; ---------------------------------------------------------------------------

loc_4C6A::				; CODE XREF: _eof+34j _eof+60j ...
		xor	ax, ax
		jmp	loc_4C72
; ---------------------------------------------------------------------------

loc_4C6E::				; CODE XREF: _eof+2Fj _eof+3Fj ...
		push	ax

loc_4C6F::				; CODE XREF: _eof+13j
		call	__ioerror

loc_4C72::				; CODE XREF: _eof+25j _eof+6Dj
		mov	sp, bp
		pop	bp
		retf
_eof		endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; int __cdecl fclose(FILE *stream)
_fclose		proc far		; CODE XREF: __openfp+B5p
					; __xfclose+28p ...

stream		= dword	ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	si, 0FFFFh
		mov	ax, word ptr [bp+stream]
		or	ax, word ptr [bp+stream+2]
		jnz	loc_4C88
		jmp	loc_4D29
; ---------------------------------------------------------------------------

loc_4C88::				; CODE XREF: _fclose+Dj
		les	bx, [bp+stream]
		mov	ax, es:[bx+12h]
		cmp	ax, word ptr [bp+stream]
		jz	loc_4C97
		jmp	loc_4D29
; ---------------------------------------------------------------------------

loc_4C97::				; CODE XREF: _fclose+1Cj
		les	bx, [bp+stream]
		cmp	word ptr es:[bx+6], 0
		jz	loc_4CD0
		cmp	word ptr es:[bx], 0
		jge	loc_4CB6
		push	word ptr [bp+stream+2]
		push	bx		; stream
		nop
		push	cs
		call	near ptr _fflush
		pop	cx
		pop	cx
		or	ax, ax
		jnz	loc_4D29

loc_4CB6::				; CODE XREF: _fclose+2Fj
		les	bx, [bp+stream]
		test	word ptr es:[bx+2], 4
		jz	loc_4CD0
		push	word ptr es:[bx+0Ah]
		push	word ptr es:[bx+8] ; block
		nop
		push	cs
		call	near ptr _farfree
		assume es:nothing
		pop	cx
		pop	cx

loc_4CD0::				; CODE XREF: _fclose+29j _fclose+49j
		les	bx, [bp+stream]
		assume es:seg2608
		cmp	byte ptr es:[bx+4], 0
		jl	loc_4CE8
		mov	al, es:[bx+4]
		cbw
		push	ax		; handle
		nop
		push	cs
		call	near ptr _close
		pop	cx
		mov	si, ax

loc_4CE8::				; CODE XREF: _fclose+62j
		les	bx, [bp+stream]
		mov	word ptr es:[bx+2], 0
		mov	word ptr es:[bx+6], 0
		mov	word ptr es:[bx], 0
		mov	byte ptr es:[bx+4], 0FFh
		cmp	word ptr es:[bx+10h], 0
		jz	loc_4D29
		xor	ax, ax
		xor	dx, dx
		push	ax
		push	dx		; dest
		push	ax		; int
		push	dx		; int
		push	word ptr es:[bx+10h] ; int
		call	__mkname
		push	dx
		push	ax		; path
		nop
		push	cs
		call	near ptr _unlink
		pop	cx
		pop	cx
		les	bx, [bp+stream]
		assume es:nothing
		mov	word ptr es:[bx+10h], 0
		assume es:seg2608

loc_4D29::				; CODE XREF: _fclose+Fj _fclose+1Ej ...
		mov	ax, si
		pop	si
		pop	bp
		retf
_fclose		endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; int __cdecl fflush(FILE *stream)
_fflush		proc far		; CODE XREF: _fclose+37p _flushall+29p ...

stream		= dword	ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	ax, word ptr [bp+stream]
		or	ax, word ptr [bp+stream+2]
		jnz	loc_4D42
		nop
		push	cs
		call	near ptr _flushall
		jmp	loc_4DF6
; ---------------------------------------------------------------------------

loc_4D42::				; CODE XREF: _fflush+Aj
		les	bx, [bp+stream]
		assume es:nothing
		mov	ax, es:[bx+12h]
		cmp	ax, word ptr [bp+stream]
		jz	loc_4D54

loc_4D4E::				; CODE XREF: _fflush+C5j
		mov	ax, 0FFFFh
		jmp	loc_4DF8
; ---------------------------------------------------------------------------

loc_4D54::				; CODE XREF: _fflush+1Ej
		les	bx, [bp+stream]
		cmp	word ptr es:[bx], 0
		jl	loc_4DAE
		test	word ptr es:[bx+2], 8
		jnz	loc_4D7D
		mov	ax, es:[bx+0Eh]
		mov	dx, word ptr [bp+stream]
		add	dx, 5
		cmp	ax, word ptr [bp+stream+2]
		jz	loc_4D77
		jmp	loc_4DF6
; ---------------------------------------------------------------------------

loc_4D77::				; CODE XREF: _fflush+44j
		cmp	es:[bx+0Ch], dx
		jnz	loc_4DF6

loc_4D7D::				; CODE XREF: _fflush+35j
		les	bx, [bp+stream]
		mov	word ptr es:[bx], 0
		mov	ax, es:[bx+0Eh]
		mov	dx, word ptr [bp+stream]
		add	dx, 5
		cmp	ax, word ptr [bp+stream+2]
		jnz	loc_4DF6
		cmp	es:[bx+0Ch], dx
		jnz	loc_4DF6
		mov	ax, es:[bx+0Ah]
		mov	dx, es:[bx+8]
		mov	es:[bx+0Eh], ax
		mov	es:[bx+0Ch], dx
		jmp	loc_4DF6
; ---------------------------------------------------------------------------
		jmp	loc_4DF6
; ---------------------------------------------------------------------------

loc_4DAE::				; CODE XREF: _fflush+2Dj
		les	bx, [bp+stream]
		mov	ax, es:[bx+6]
		add	ax, es:[bx]
		inc	ax
		mov	si, ax
		sub	es:[bx], si
		push	ax		; len
		mov	ax, es:[bx+0Ah]
		mov	dx, es:[bx+8]
		mov	es:[bx+0Eh], ax
		mov	es:[bx+0Ch], dx
		push	ax
		push	dx		; buf
		mov	al, es:[bx+4]
		cbw
		push	ax		; handle
		nop
		push	cs
		call	near ptr ___write
		add	sp, 8
		cmp	ax, si
		jz	loc_4DF6
		les	bx, [bp+stream]
		test	word ptr es:[bx+2], 200h
		jnz	loc_4DF6
		or	word ptr es:[bx+2], 10h
		jmp	loc_4D4E
; ---------------------------------------------------------------------------

loc_4DF6::				; CODE XREF: _fflush+11j _fflush+46j ...
		xor	ax, ax

loc_4DF8::				; CODE XREF: _fflush+23j
		pop	si
		pop	bp
		retf
_fflush		endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; int __cdecl findfirst(const char *path, struct ffblk *ffblk, int attrib)
_findfirst	proc far		; CODE XREF: file_box::file_box(uchar *)+F1P
					; seg1891:125FP

path__		= dword	ptr  6
ffblk_		= dword	ptr  0Ah
attrib		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	ds
		mov	ah, 2Fh
		int	21h		; DOS -	GET DISK TRANSFER AREA ADDRESS
					; Return: ES:BX	-> DTA
		push	es
		push	bx
		mov	ah, 1Ah
		lds	dx, [bp+ffblk_]
		int	21h		; DOS -	SET DISK TRANSFER AREA ADDRESS
					; DS:DX	-> disk	transfer buffer
		mov	ah, 4Eh	; 'N'
		mov	cx, [bp+attrib]
		lds	dx, [bp+path__]
		int	21h		; DOS -	2+ - FIND FIRST	ASCIZ (FINDFIRST)
					; CX = search attributes
					; DS:DX	-> ASCIZ filespec
					; (drive, path,	and wildcards allowed)
		pushf
		pop	cx
		xchg	ax, bx
		mov	ah, 1Ah
		pop	dx
		pop	ds
		int	21h		; DOS -	SET DISK TRANSFER AREA ADDRESS
					; DS:DX	-> disk	transfer buffer
		push	cx
		popf
		pop	ds
		jb	loc_4E28
		xor	ax, ax
		jmp	loc_4E2C
; ---------------------------------------------------------------------------

loc_4E28::				; CODE XREF: _findfirst+27j
		push	bx
		call	__ioerror

loc_4E2C::				; CODE XREF: _findfirst+2Bj
		pop	bp
		retf
_findfirst	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; int __cdecl findnext(struct ffblk *ffblk)
_findnext	proc far		; CODE XREF: file_box::file_box(uchar *)+128P
					; seg1891:128DP

ffblk__		= dword	ptr  6

		push	bp
		mov	bp, sp
		push	ds
		mov	ah, 2Fh
		int	21h		; DOS -	GET DISK TRANSFER AREA ADDRESS
					; Return: ES:BX	-> DTA
		push	es
		push	bx
		mov	ah, 1Ah
		lds	dx, [bp+ffblk__]
		int	21h		; DOS -	SET DISK TRANSFER AREA ADDRESS
					; DS:DX	-> disk	transfer buffer
		mov	ah, 4Fh
		int	21h		; DOS -	2+ - FIND NEXT ASCIZ (FINDNEXT)
					; [DTA]	= data block from
					; last AH = 4Eh/4Fh call
		pushf
		pop	cx
		xchg	ax, bx
		mov	ah, 1Ah
		pop	dx
		pop	ds
		int	21h		; DOS -	SET DISK TRANSFER AREA ADDRESS
					; DS:DX	-> disk	transfer buffer
		push	cx
		popf
		pop	ds
		jb	loc_4E55
		xor	ax, ax
		jmp	loc_4E59
; ---------------------------------------------------------------------------

loc_4E55::				; CODE XREF: _findnext+21j
		push	bx
		call	__ioerror

loc_4E59::				; CODE XREF: _findnext+25j
		pop	bp
		retf
_findnext	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; __int32 __cdecl filelength(int handle)
_filelength	proc far		; CODE XREF: g_open_element(uchar *)+5CP

var_4		= word ptr -4
var_2		= word ptr -2
handle		= word ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	ax, 4201h
		mov	bx, [bp+handle]
		xor	cx, cx
		xor	dx, dx
		int	21h		; DOS -	2+ - MOVE FILE READ/WRITE POINTER (LSEEK)
					; AL = method: offset from present location
		jb	loc_4E93
		push	dx
		push	ax
		mov	ax, 4202h
		xor	cx, cx
		xor	dx, dx
		int	21h		; DOS -	2+ - MOVE FILE READ/WRITE POINTER (LSEEK)
					; AL = method: offset from end of file
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		pop	dx
		pop	cx
		jb	loc_4E93
		mov	ax, 4200h
		int	21h		; DOS -	2+ - MOVE FILE READ/WRITE POINTER (LSEEK)
					; AL = method: offset from beginning of	file
		jb	loc_4E93
		mov	dx, [bp+var_2]
		mov	ax, [bp+var_4]
		jmp	loc_4E98
; ---------------------------------------------------------------------------

loc_4E93::				; CODE XREF: _filelength+12j
					; _filelength+27j ...
		push	ax
		call	__ioerror
		cwd

loc_4E98::				; CODE XREF: _filelength+36j
		mov	sp, bp
		pop	bp
		retf
_filelength	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; int flushall(void)
_flushall	proc far		; CODE XREF: _fflush+Ep

stream		= dword	ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		xor	di, di
		mov	si, __nfile
		mov	word ptr [bp+stream+2],	ds
		mov	word ptr [bp+stream], offset __streams
		jmp	loc_4ECF
; ---------------------------------------------------------------------------

loc_4EB4::				; CODE XREF: _flushall+38j
		les	bx, [bp+stream]
		test	word ptr es:[bx+2], 3
		jz	loc_4ECB
		push	word ptr [bp+stream+2]
		push	bx		; stream
		nop
		push	cs
		call	near ptr _fflush
		pop	cx
		pop	cx
		inc	di

loc_4ECB::				; CODE XREF: _flushall+21j
		add	word ptr [bp+stream], 14h

loc_4ECF::				; CODE XREF: _flushall+16j
		mov	ax, si
		dec	si
		or	ax, ax
		jnz	loc_4EB4
		mov	ax, di
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
_flushall	endp

		assume es:seg2608

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

sub_4EDE	proc near		; CODE XREF: __openfp+16p

arg_0		= dword	ptr  4
arg_4		= dword	ptr  8
arg_8		= dword	ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		push	di
		xor	di, di
		les	bx, [bp+arg_8]
		inc	word ptr [bp+arg_8]
		mov	cl, es:[bx]
		mov	al, cl
		cmp	al, 72h	; 'r'
		jnz	loc_4EFC
		mov	dx, 1
		mov	si, 1
		jmp	loc_4F1A
; ---------------------------------------------------------------------------

loc_4EFC::				; CODE XREF: sub_4EDE+14j
		cmp	cl, 77h	; 'w'
		jnz	loc_4F06
		mov	dx, 302h
		jmp	loc_4F0E
; ---------------------------------------------------------------------------

loc_4F06::				; CODE XREF: sub_4EDE+21j
		cmp	cl, 61h	; 'a'
		jnz	loc_4F16
		mov	dx, 902h

loc_4F0E::				; CODE XREF: sub_4EDE+26j
		mov	di, 80h	; ''
		mov	si, 2
		jmp	loc_4F1A
; ---------------------------------------------------------------------------

loc_4F16::				; CODE XREF: sub_4EDE+2Bj
		xor	ax, ax
		jmp	loc_4F94
; ---------------------------------------------------------------------------

loc_4F1A::				; CODE XREF: sub_4EDE+1Cj sub_4EDE+36j
		les	bx, [bp+arg_8]
		mov	cl, es:[bx]
		inc	word ptr [bp+arg_8]
		cmp	cl, 2Bh	; '+'
		jz	loc_4F3B
		les	bx, [bp+arg_8]
		cmp	byte ptr es:[bx], 2Bh ;	'+'
		jnz	loc_4F52
		cmp	cl, 74h	; 't'
		jz	loc_4F3B
		cmp	cl, 62h	; 'b'
		jnz	loc_4F52

loc_4F3B::				; CODE XREF: sub_4EDE+48j sub_4EDE+56j
		cmp	cl, 2Bh	; '+'
		jnz	loc_4F46
		les	bx, [bp+arg_8]
		assume es:nothing
		mov	cl, es:[bx]

loc_4F46::				; CODE XREF: sub_4EDE+60j
		and	dx, 0FFFCh
		or	dx, 4
		mov	di, 180h
		mov	si, 3
		assume es:seg2608

loc_4F52::				; CODE XREF: sub_4EDE+51j sub_4EDE+5Bj
		cmp	cl, 74h	; 't'
		jnz	loc_4F5D
		or	dx, 4000h
		jmp	loc_4F7A
; ---------------------------------------------------------------------------

loc_4F5D::				; CODE XREF: sub_4EDE+77j
		cmp	cl, 62h	; 'b'
		jnz	loc_4F68
		or	dx, 8000h
		jmp	loc_4F77
; ---------------------------------------------------------------------------

loc_4F68::				; CODE XREF: sub_4EDE+82j
		mov	ax, __fmode
		and	ax, 0C000h
		or	dx, ax

loc_4F70::
		mov	ax, dx
		test	ax, 8000h
		jz	loc_4F7A

loc_4F77::				; CODE XREF: sub_4EDE+88j
		or	si, 40h

loc_4F7A::				; CODE XREF: sub_4EDE+7Dj sub_4EDE+97j
		mov	word ptr ds:2E9Ah, seg seg0000
		mov	word ptr __exitfopen, offset __xfclose
		les	bx, [bp+arg_4]
		assume es:seg2b53
		mov	es:[bx], dx
		les	bx, [bp+arg_0]
		mov	es:[bx], di
		mov	ax, si

loc_4F94::				; CODE XREF: sub_4EDE+3Aj
		pop	di
		pop	si
		pop	bp
		retn	0Ch
sub_4EDE	endp

		assume es:seg2608

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; int __stdcall	_openfp(int, int, int, char *path___, FILE *stream)
__openfp	proc near		; CODE XREF: _fopen+2Ep

var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  4
arg_2		= word ptr  6
arg_4		= word ptr  8
path___		= dword	ptr  0Ah
stream		= dword	ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	[bp+arg_4]
		push	[bp+arg_2]
		push	ss
		lea	ax, [bp+var_2]
		push	ax
		push	ss
		lea	ax, [bp+var_4]
		push	ax
		call	sub_4EDE
		assume es:seg2b53
		les	bx, [bp+stream]
		assume es:seg2608
		mov	es:[bx+2], ax
		or	ax, ax
		jz	loc_4FE8
		cmp	byte ptr es:[bx+4], 0
		jge	loc_4FFC
		push	[bp+var_4]
		mov	ax, [bp+var_2]
		or	ax, [bp+arg_0]
		push	ax		; access
		push	word ptr [bp+path___+2]
		push	word ptr [bp+path___] ;	path
		nop
		push	cs
		call	near ptr _open
		add	sp, 8
		les	bx, [bp+stream]
		mov	es:[bx+4], al
		or	al, al
		jge	loc_4FFC

loc_4FE8::				; CODE XREF: __openfp+22j
		les	bx, [bp+stream]
		assume es:nothing
		mov	byte ptr es:[bx+4], 0FFh
		mov	word ptr es:[bx+2], 0

loc_4FF6::				; CODE XREF: __openfp+BAj
		xor	dx, dx
		xor	ax, ax
		jmp	loc_5065
; ---------------------------------------------------------------------------
		assume es:seg2608

loc_4FFC::				; CODE XREF: __openfp+29j __openfp+4Cj
		les	bx, [bp+stream]
		mov	al, es:[bx+4]
		cbw
		push	ax		; handle
		nop
		push	cs
		call	near ptr _isatty
		pop	cx
		or	ax, ax
		jz	loc_5018
		les	bx, [bp+stream]
		assume es:nothing
		or	word ptr es:[bx+2], 200h
		assume es:seg2608

loc_5018::				; CODE XREF: __openfp+73j
		mov	ax, 200h
		push	ax		; size
		les	bx, [bp+stream]
		test	word ptr es:[bx+2], 200h
		jz	loc_502C
		mov	ax, 1
		jmp	loc_502E
; ---------------------------------------------------------------------------

loc_502C::				; CODE XREF: __openfp+8Bj
		xor	ax, ax

loc_502E::				; CODE XREF: __openfp+90j
		push	ax		; type
		xor	ax, ax
		xor	dx, dx
		push	ax
		push	dx		; buf
		push	word ptr [bp+stream+2]
		push	word ptr [bp+stream] ; stream
		nop
		push	cs
		call	near ptr _setvbuf
		add	sp, 0Ch
		or	ax, ax
		jz	loc_5056
		push	word ptr [bp+stream+2]
		push	word ptr [bp+stream] ; stream
		nop
		push	cs
		call	near ptr _fclose
		pop	cx
		pop	cx
		jmp	loc_4FF6
; ---------------------------------------------------------------------------

loc_5056::				; CODE XREF: __openfp+ABj
		les	bx, [bp+stream]
		mov	word ptr es:[bx+10h], 0
		mov	dx, word ptr [bp+stream+2]
		mov	ax, word ptr [bp+stream]

loc_5065::				; CODE XREF: __openfp+60j
		mov	sp, bp
		pop	bp
		retn	0Eh
__openfp	endp

		assume es:nothing

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

__getfp		proc near		; CODE XREF: _fopen+6p

var_4		= dword	ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	word ptr [bp+var_4+2], ds
		mov	word ptr [bp+var_4], offset __streams

loc_5079::				; CODE XREF: __getfp+2Ej
		les	bx, [bp+var_4]
		assume es:seg2608
		cmp	byte ptr es:[bx+4], 0
		jl	loc_509B
		mov	ax, word ptr [bp+var_4]
		add	word ptr [bp+var_4], 14h
		push	ax
		mov	ax, __nfile
		mov	dx, 14h
		imul	dx
		add	ax, offset __streams
		pop	dx
		cmp	dx, ax
		jb	loc_5079

loc_509B::				; CODE XREF: __getfp+16j
		les	bx, [bp+var_4]
		cmp	byte ptr es:[bx+4], 0
		jl	loc_50AB
		xor	dx, dx
		xor	ax, ax
		jmp	loc_50B1
; ---------------------------------------------------------------------------

loc_50AB::				; CODE XREF: __getfp+38j
		mov	dx, word ptr [bp+var_4+2]
		mov	ax, word ptr [bp+var_4]

loc_50B1::				; CODE XREF: __getfp+3Ej
		mov	sp, bp
		pop	bp
		retn
__getfp		endp

		assume es:nothing

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; FILE *__cdecl	fopen(const char *path,	const char *mode)
_fopen		proc far		; CODE XREF: init_game(void)+2E3P
					; seg0fa9:0A42P ...

stream		= dword	ptr -4
path____	= dword	ptr  6
mode		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 4
		call	__getfp
		assume es:seg2608
		mov	word ptr [bp+stream+2],	dx
		mov	word ptr [bp+stream], ax
		or	ax, dx
		jnz	loc_50CE
		xor	dx, dx
		xor	ax, ax
		jmp	loc_50E6
; ---------------------------------------------------------------------------

loc_50CE::				; CODE XREF: _fopen+11j
		push	word ptr [bp+stream+2]
		push	word ptr [bp+stream] ; stream
		push	word ptr [bp+path____+2]
		push	word ptr [bp+path____] ; path___
		push	word ptr [bp+mode+2] ; int
		push	word ptr [bp+mode] ; int
		xor	ax, ax
		push	ax		; int
		call	__openfp

loc_50E6::				; CODE XREF: _fopen+17j
		mov	sp, bp
		pop	bp
		retf
_fopen		endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; int fprintf(FILE *stream, const char *format,	...)
_fprintf	proc far		; CODE XREF: __fperror+A2p _perror+4Ep

stream		= dword	ptr  6
format_		= dword	ptr  0Ah
arg_8		= byte ptr  0Eh

		push	bp
		mov	bp, sp
		mov	ax, offset __fputn
		push	ax
		push	word ptr [bp+stream+2]
		push	word ptr [bp+stream]
		push	word ptr [bp+format_+2]
		push	word ptr [bp+format_]
		lea	ax, [bp+arg_8]
		push	ax
		call	__vprinter
		pop	bp
		retf
_fprintf	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

sub_5106	proc near		; CODE XREF: _fseek+2Fp _ftell+BAp ...

var_4		= dword	ptr -4
arg_0		= dword	ptr  4

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		les	bx, [bp+arg_0]
		assume es:nothing
		cmp	word ptr es:[bx], 0
		jge	loc_5122
		mov	cx, es:[bx+6]
		add	cx, es:[bx]
		inc	cx
		mov	si, cx
		jmp	loc_5131
; ---------------------------------------------------------------------------

loc_5122::				; CODE XREF: sub_5106+Ej
		les	bx, [bp+arg_0]
		mov	ax, es:[bx]
		cwd
		xor	ax, dx
		sub	ax, dx
		mov	cx, ax
		mov	si, ax

loc_5131::				; CODE XREF: sub_5106+1Aj
		les	bx, [bp+arg_0]
		test	word ptr es:[bx+2], 40h
		jnz	loc_517F
		les	bx, [bp+arg_0]
		mov	ax, es:[bx+0Eh]
		mov	dx, es:[bx+0Ch]
		mov	word ptr [bp+var_4+2], ax
		mov	word ptr [bp+var_4], dx
		cmp	word ptr es:[bx], 0
		jge	loc_5178
		jmp	loc_5162
; ---------------------------------------------------------------------------

loc_5155::				; CODE XREF: sub_5106+61j
		dec	word ptr [bp+var_4]
		les	bx, [bp+var_4]
		cmp	byte ptr es:[bx], 0Ah
		jnz	loc_5162
		inc	si

loc_5162::				; CODE XREF: sub_5106+4Dj sub_5106+59j
		mov	ax, cx
		dec	cx
		or	ax, ax
		jnz	loc_5155
		jmp	loc_517F
; ---------------------------------------------------------------------------

loc_516B::				; CODE XREF: sub_5106+77j
		les	bx, [bp+var_4]
		inc	word ptr [bp+var_4]
		cmp	byte ptr es:[bx], 0Ah
		jnz	loc_5178
		inc	si

loc_5178::				; CODE XREF: sub_5106+4Bj sub_5106+6Fj
		mov	ax, cx
		dec	cx
		or	ax, ax
		jnz	loc_516B

loc_517F::				; CODE XREF: sub_5106+34j sub_5106+63j
		mov	ax, si
		pop	si
		mov	sp, bp
		pop	bp
		retn	4
sub_5106	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; int __cdecl fseek(FILE *stream, __int32 offset, int whence)
_fseek		proc far		; CODE XREF: _setvbuf+6Bp

stream		= dword	ptr  6
offset__	= dword	ptr  0Ah
fromwhere	= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+fromwhere]
		push	word ptr [bp+stream+2]
		push	word ptr [bp+stream] ; stream
		nop
		push	cs
		call	near ptr _fflush
		pop	cx
		pop	cx
		or	ax, ax
		jz	loc_51A5
		mov	ax, 0FFFFh
		jmp	loc_5205
; ---------------------------------------------------------------------------

loc_51A5::				; CODE XREF: _fseek+16j
		cmp	si, 1
		jnz	loc_51C1
		les	bx, [bp+stream]
		cmp	word ptr es:[bx], 0
		jle	loc_51C1
		push	word ptr [bp+stream+2]
		push	bx
		call	sub_5106
		cwd
		sub	word ptr [bp+offset__],	ax
		sbb	word ptr [bp+offset__+2], dx

loc_51C1::				; CODE XREF: _fseek+20j _fseek+29j
		les	bx, [bp+stream]
		and	word ptr es:[bx+2], 0FE5Fh
		mov	word ptr es:[bx], 0
		mov	ax, es:[bx+0Ah]
		mov	dx, es:[bx+8]
		mov	es:[bx+0Eh], ax
		mov	es:[bx+0Ch], dx
		push	si		; fromwhere
		push	word ptr [bp+offset__+2]
		push	word ptr [bp+offset__] ; offset
		mov	al, es:[bx+4]
		cbw
		push	ax		; handle
		nop
		push	cs
		call	near ptr _lseek
		add	sp, 8
		cmp	dx, 0FFFFh
		jnz	loc_5203
		cmp	ax, 0FFFFh
		jnz	loc_5203
		mov	ax, 0FFFFh
		jmp	loc_5205
; ---------------------------------------------------------------------------

loc_5203::				; CODE XREF: _fseek+6Fj _fseek+74j
		xor	ax, ax

loc_5205::				; CODE XREF: _fseek+1Bj _fseek+79j
		pop	si
		pop	bp
		retf
_fseek		endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; __int32 __cdecl ftell(FILE *stream)
_ftell		proc far

var_8		= word ptr -8
var_6		= word ptr -6
offset___	= dword	ptr -4
stream		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 8

loc_520E::
		mov	ax, 1
		push	ax		; fromwhere
		xor	ax, ax
		xor	dx, dx
		push	ax
		push	dx		; offset
		les	bx, [bp+stream]
		mov	al, es:[bx+4]
		cbw
		push	ax		; handle
		nop
		push	cs
		call	near ptr _lseek
		add	sp, 8
		mov	word ptr [bp+offset___+2], dx
		mov	word ptr [bp+offset___], ax
		cmp	dx, 0FFFFh
		jnz	loc_523C
		cmp	ax, 0FFFFh
		jnz	loc_523C
		jmp	loc_52DE
; ---------------------------------------------------------------------------

loc_523C::				; CODE XREF: _ftell+2Aj _ftell+2Fj
		les	bx, [bp+stream]
		cmp	word ptr es:[bx], 0
		jl	loc_5248
		jmp	loc_52CE
; ---------------------------------------------------------------------------

loc_5248::				; CODE XREF: _ftell+3Bj
		mov	al, es:[bx+4]
		cbw
		shl	ax, 1
		mov	bx, ax
		test	__openfd[bx], 800h
		jz	loc_52BC
		mov	ax, 2
		push	ax		; fromwhere
		xor	ax, ax
		xor	dx, dx
		push	ax
		push	dx		; offset
		mov	bx, word ptr [bp+stream]
		mov	al, es:[bx+4]
		cbw
		push	ax		; handle
		nop
		push	cs
		call	near ptr _lseek
		add	sp, 8
		mov	[bp+var_6], dx
		mov	[bp+var_8], ax
		cmp	dx, 0FFFFh
		jnz	loc_5284
		cmp	ax, 0FFFFh
		jz	loc_52E4

loc_5284::				; CODE XREF: _ftell+75j
		xor	ax, ax
		push	ax		; fromwhere
		push	word ptr [bp+offset___+2]
		push	word ptr [bp+offset___]	; offset
		les	bx, [bp+stream]
		mov	al, es:[bx+4]
		cbw
		push	ax		; handle
		nop
		push	cs
		call	near ptr _lseek
		add	sp, 8
		cmp	dx, 0FFFFh
		jnz	loc_52B0
		cmp	ax, 0FFFFh
		jnz	loc_52B0
		mov	dx, 0FFFFh
		mov	ax, 0FFFFh
		jmp	loc_52E4
; ---------------------------------------------------------------------------

loc_52B0::				; CODE XREF: _ftell+99j _ftell+9Ej
		mov	ax, [bp+var_6]
		mov	dx, [bp+var_8]
		mov	word ptr [bp+offset___+2], ax
		mov	word ptr [bp+offset___], dx

loc_52BC::				; CODE XREF: _ftell+4Fj
		push	word ptr [bp+stream+2]
		push	word ptr [bp+stream]
		call	sub_5106
		cwd
		add	word ptr [bp+offset___], ax
		adc	word ptr [bp+offset___+2], dx
		jmp	loc_52DE
; ---------------------------------------------------------------------------

loc_52CE::				; CODE XREF: _ftell+3Dj
		push	word ptr [bp+stream+2]
		push	word ptr [bp+stream]
		call	sub_5106
		cwd
		sub	word ptr [bp+offset___], ax
		sbb	word ptr [bp+offset___+2], dx

loc_52DE::				; CODE XREF: _ftell+31j _ftell+C4j
		mov	dx, word ptr [bp+offset___+2]
		mov	ax, word ptr [bp+offset___]

loc_52E4::				; CODE XREF: _ftell+7Aj _ftell+A6j
		mov	sp, bp
		pop	bp
		retf
_ftell		endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

sub_52E8	proc near		; CODE XREF: sub_5326+Ep _fgetc+78p

stream		= dword	ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, 14h
		mov	word ptr [bp+stream+2],	ds
		mov	word ptr [bp+stream], offset __streams
		jmp	loc_531A
; ---------------------------------------------------------------------------

loc_52FC::				; CODE XREF: sub_52E8+37j
		les	bx, [bp+stream]
		mov	ax, es:[bx+2]
		and	ax, 300h
		cmp	ax, 300h
		jnz	loc_5316
		push	word ptr [bp+stream+2]
		push	bx		; stream
		nop
		push	cs
		call	near ptr _fflush
		pop	cx
		pop	cx

loc_5316::				; CODE XREF: sub_52E8+21j
		add	word ptr [bp+stream], 14h

loc_531A::				; CODE XREF: sub_52E8+12j
		mov	ax, si
		dec	si
		or	ax, ax
		jnz	loc_52FC
		pop	si
		mov	sp, bp
		pop	bp
		retn
sub_52E8	endp

		assume es:seg2608

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

sub_5326	proc near		; CODE XREF: _fgetc+62p

arg_0		= dword	ptr  4

		push	bp
		mov	bp, sp
		les	bx, [bp+arg_0]
		test	word ptr es:[bx+2], 200h
		jz	loc_5337
		call	sub_52E8

loc_5337::				; CODE XREF: sub_5326+Cj
		les	bx, [bp+arg_0]
		push	word ptr es:[bx+6] ; len
		mov	ax, es:[bx+0Ah]
		mov	dx, es:[bx+8]
		mov	es:[bx+0Eh], ax
		mov	es:[bx+0Ch], dx
		push	ax
		push	dx		; buf
		mov	al, es:[bx+4]
		cbw
		push	ax		; handle
		nop
		push	cs
		call	near ptr ___read
		add	sp, 8
		les	bx, [bp+arg_0]
		mov	es:[bx], ax

loc_5364::
		or	ax, ax
		jle	loc_5371
		and	word ptr es:[bx+2], 0FFDFh
		xor	ax, ax
		jmp	loc_539A
; ---------------------------------------------------------------------------

loc_5371::				; CODE XREF: sub_5326+40j
		les	bx, [bp+arg_0]
		assume es:nothing
		cmp	word ptr es:[bx], 0
		jnz	loc_538A
		mov	ax, es:[bx+2]
		and	ax, 0FE7Fh
		or	ax, 20h
		mov	es:[bx+2], ax
		jmp	loc_5397
; ---------------------------------------------------------------------------

loc_538A::				; CODE XREF: sub_5326+52j
		les	bx, [bp+arg_0]
		mov	word ptr es:[bx], 0
		or	word ptr es:[bx+2], 10h

loc_5397::				; CODE XREF: sub_5326+62j
		mov	ax, 0FFFFh
		assume es:seg2608

loc_539A::				; CODE XREF: sub_5326+49j
		pop	bp
		retn	4
sub_5326	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; int __cdecl _fgetc(FILE *stream)
__fgetc		proc far

stream		= dword	ptr  6

		push	bp
		mov	bp, sp
		les	bx, [bp+stream]
		assume es:nothing
		inc	word ptr es:[bx]
		push	word ptr [bp+stream+2]
		push	bx		; stream
		push	cs
		call	near ptr _fgetc
		pop	cx
		pop	cx
		pop	bp
		retf
__fgetc		endp

; ---------------------------------------------------------------------------

__nfgetc:
		pop	ax
		push	cs
		push	ax
		assume es:seg2608

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; int __cdecl fgetc(FILE *stream)
_fgetc		proc far		; CODE XREF: __fgetc+Ep _fgetchar+6p ...

stream		= dword	ptr  6

		push	bp
		mov	bp, sp
		push	si
		mov	ax, word ptr [bp+stream]
		or	ax, word ptr [bp+stream+2]
		jnz	loc_53C8

loc_53C2::				; CODE XREF: _fgetc+69j _fgetc+B5j ...
		mov	ax, 0FFFFh
		jmp	loc_54A1
; ---------------------------------------------------------------------------

loc_53C8::				; CODE XREF: _fgetc+Aj
		les	bx, [bp+stream]
		cmp	word ptr es:[bx], 0
		jle	loc_53EB

loc_53D1::				; CODE XREF: _fgetc+67j _fgetc+6Bj
		les	bx, [bp+stream]
		dec	word ptr es:[bx]
		mov	ax, es:[bx+0Eh]
		mov	si, es:[bx+0Ch]
		inc	word ptr es:[bx+0Ch]
		mov	es, ax
		assume es:nothing
		mov	al, es:[si]
		jmp	loc_549F
; ---------------------------------------------------------------------------
		assume es:seg2608

loc_53EB::				; CODE XREF: _fgetc+19j
		les	bx, [bp+stream]
		cmp	word ptr es:[bx], 0
		jl	loc_5463
		test	word ptr es:[bx+2], 110h
		jnz	loc_5463
		test	word ptr es:[bx+2], 1
		jz	loc_5463
		les	bx, [bp+stream]
		or	word ptr es:[bx+2], 80h
		cmp	word ptr es:[bx+6], 0
		jz	loc_5423
		push	word ptr [bp+stream+2]
		push	bx
		call	sub_5326
		or	ax, ax
		jz	loc_53D1
		jmp	loc_53C2
; ---------------------------------------------------------------------------
		jmp	loc_53D1
; ---------------------------------------------------------------------------

loc_5423::				; CODE XREF: _fgetc+5Cj _fgetc+DCj
		les	bx, [bp+stream]
		assume es:nothing
		test	word ptr es:[bx+2], 200h
		jz	loc_5431
		call	sub_52E8

loc_5431::				; CODE XREF: _fgetc+76j
		mov	ax, 1
		push	ax		; len
		push	ds
		mov	ax, offset byte_2D700
		push	ax		; buf
		les	bx, [bp+stream]
		mov	al, es:[bx+4]
		cbw
		push	ax		; handle
		nop
		push	cs
		call	near ptr ___read
		add	sp, 8
		or	ax, ax
		jnz	loc_5482
		les	bx, [bp+stream]
		mov	al, es:[bx+4]
		cbw
		push	ax		; handle
		nop
		push	cs
		call	near ptr _eof
		pop	cx
		cmp	ax, 1
		jz	loc_546E

loc_5463::				; CODE XREF: _fgetc+3Cj _fgetc+44j ...
		les	bx, [bp+stream]
		or	word ptr es:[bx+2], 10h
		jmp	loc_53C2
; ---------------------------------------------------------------------------

loc_546E::				; CODE XREF: _fgetc+ABj
		les	bx, [bp+stream]
		mov	ax, es:[bx+2]
		and	ax, 0FE7Fh
		or	ax, 20h
		mov	es:[bx+2], ax
		jmp	loc_53C2
; ---------------------------------------------------------------------------

loc_5482::				; CODE XREF: _fgetc+97j
		cmp	byte_2D700, 0Dh
		jnz	loc_5494
		les	bx, [bp+stream]
		test	word ptr es:[bx+2], 40h
		jz	loc_5423

loc_5494::				; CODE XREF: _fgetc+D1j
		les	bx, [bp+stream]
		and	word ptr es:[bx+2], 0FFDFh
		mov	al, byte_2D700
		assume es:nothing

loc_549F::				; CODE XREF: _fgetc+32j
		mov	ah, 0

loc_54A1::				; CODE XREF: _fgetc+Fj
		pop	si
		pop	bp
		retf
_fgetc		endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function

; int fgetchar(void)
_fgetchar	proc far
		push	ds
		mov	ax, offset __streams
		push	ax		; stream
		push	cs
		call	near ptr _fgetc
		pop	cx
		pop	cx
		retf
_fgetchar	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; char *__cdecl	itoa(int value,	char *string, int radix)
_itoa		proc far		; CODE XREF: show_high_scores(uchar)+BBP
					; show_stats(void)+205P ...

value		= word ptr  6
string		= dword	ptr  8
radix		= word ptr  0Ch

		push	bp
		mov	bp, sp
		mov	bx, [bp+value]
		mov	cx, [bp+radix]
		cmp	cx, 0Ah
		jnz	loc_54C3
		mov	ax, bx
		cwd
		jmp	loc_54C7
; ---------------------------------------------------------------------------

loc_54C3::				; CODE XREF: _itoa+Cj
		mov	ax, bx
		xor	dx, dx

loc_54C7::				; CODE XREF: _itoa+11j
		push	dx
		push	ax
		push	word ptr [bp+string+2]
		push	word ptr [bp+string]
		push	cx
		mov	al, 1
		push	ax
		mov	al, 61h	; 'a'
		push	ax
		call	__longtoa
		pop	bp
		retf
_itoa		endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; char *__cdecl	ultoa(unsigned __int32 value, char *string, int	radix)
_ultoa		proc far		; CODE XREF: seg0fa9:106BP
					; return_element(uchar,uchar)+41P

value		= dword	ptr  6
string		= dword	ptr  0Ah
radix		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	word ptr [bp+value+2]
		push	word ptr [bp+value]
		push	word ptr [bp+string+2]
		push	word ptr [bp+string]
		push	[bp+radix]
		mov	al, 0
		push	ax
		mov	al, 61h	; 'a'
		push	ax
		call	__longtoa
		pop	bp
		retf
_ultoa		endp

		assume es:nothing

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; char *__cdecl	ltoa(__int32 value, char *string, int radix)
_ltoa		proc far		; CODE XREF: update_men(void)+3AP
					; update_score(int,int)+3CP ...

value		= dword	ptr  6
string		= dword	ptr  0Ah
radix		= word ptr  0Eh

		push	bp
		mov	bp, sp
		mov	ax, [bp+radix]
		push	word ptr [bp+value+2]
		push	word ptr [bp+value]
		push	word ptr [bp+string+2]
		push	word ptr [bp+string]
		push	ax
		cmp	ax, 0Ah
		jnz	loc_5515
		mov	ax, 1
		jmp	loc_5517
; ---------------------------------------------------------------------------

loc_5515::				; CODE XREF: _ltoa+16j
		xor	ax, ax

loc_5517::				; CODE XREF: _ltoa+1Bj
		push	ax
		mov	al, 61h	; 'a'
		push	ax
		call	__longtoa
		pop	bp
		retf
_ltoa		endp

		assume es:nothing

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; void *__cdecl	memcpy(void *dest, const void *src, size_t n)
_memcpy		proc far		; CODE XREF: __stpcpy+23p __fputn+112p ...

dest		= dword	ptr  6
src		= dword	ptr  0Ah
n		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	dx, ds
		les	di, [bp+dest]
		assume es:nothing
		lds	si, [bp+src]
		assume ds:nothing
		mov	cx, [bp+n]
		shr	cx, 1
		cld
		rep movsw
		jnb	loc_5538
		assume es:nothing, ds:seg2608
		movsb
		assume es:nothing, ds:nothing

loc_5538::				; CODE XREF: _memcpy+15j
		mov	ds, dx
		assume ds:seg2608
		mov	dx, word ptr [bp+dest+2]
		mov	ax, word ptr [bp+dest]
		pop	di
		pop	si
		pop	bp
		retf
_memcpy		endp

		assume es:nothing

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; void __cdecl setmem(void *dest, unsigned int length, char value)
_setmem		proc far		; CODE XREF: _memset+11p _strnset+29p	...

dest		= dword	ptr  6
length_		= word ptr  0Ah
value		= byte ptr  0Ch

		push	bp
		mov	bp, sp
		push	di
		les	di, [bp+dest]
		assume es:seg2608
		mov	cx, [bp+length_]
		mov	al, [bp+value]
		mov	ah, al
		cld
		test	di, 1
		jz	loc_555E
		jcxz	loc_5565
		stosb
		dec	cx

loc_555E::				; CODE XREF: _setmem+14j
		shr	cx, 1
		rep stosw
		jnb	loc_5565
		stosb

loc_5565::				; CODE XREF: _setmem+16j _setmem+1Ej
		pop	di
		pop	bp
		retf
_setmem		endp

		assume es:nothing

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; void *__cdecl	memset(void *s,	int c, size_t n)
_memset		proc far		; CODE XREF: print_form(uchar *,uchar)+12P
					; prompt_box::prompt_box(uchar *)+82P ...

s		= dword	ptr  6
c_		= word ptr  0Ah
n		= word ptr  0Ch

		push	bp
		mov	bp, sp
		mov	al, byte ptr [bp+c_]
		push	ax		; value
		push	[bp+n]		; value
		push	word ptr [bp+s+2] ; length
		push	word ptr [bp+s]	; dest
		push	cs		; dest
		call	near ptr _setmem
		assume es:seg2608
		add	sp, 8
		mov	dx, word ptr [bp+s+2]
		mov	ax, word ptr [bp+s]
		pop	bp
		retf
_memset		endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

sub_5587	proc near		; CODE XREF: _open+8Fp	_open+ADp

arg_0		= word ptr  4
arg_2		= dword	ptr  6

		push	bp
		mov	bp, sp
		push	ds
		mov	cx, [bp+arg_0]
		mov	ah, 3Ch	; '<'
		lds	dx, [bp+arg_2]
		int	21h		; DOS -	2+ - CREATE A FILE WITH	HANDLE (CREAT)
					; CX = attributes for file
					; DS:DX	-> ASCIZ filename (may include drive and path)
		pop	ds
		jb	loc_559A
		jmp	loc_559E
; ---------------------------------------------------------------------------

loc_559A::				; CODE XREF: sub_5587+Fj
		push	ax
		call	__ioerror

loc_559E::				; CODE XREF: sub_5587+11j
		pop	bp
		retn	6
sub_5587	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

sub_55A2	proc near		; CODE XREF: _open+10Bp

arg_0		= word ptr  4

		push	bp
		mov	bp, sp
		mov	bx, [bp+arg_0]
		sub	cx, cx
		sub	dx, dx
		mov	ah, 40h
		int	21h		; DOS -	2+ - WRITE TO FILE WITH	HANDLE
					; BX = file handle, CX = number	of bytes to write, DS:DX -> buffer
		pop	bp
		retn	2
sub_55A2	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; int open(const char *path, int access, ...)
_open		proc far		; CODE XREF: __openfp+3Dp
					; seg1783:09A7P ...

var_4		= word ptr -4
var_2		= word ptr -2
pathname	= dword	ptr  6
access		= word ptr  0Ah
arg_6		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	si, [bp+access]
		mov	di, [bp+arg_6]
		test	si, 0C000h
		jnz	loc_55D0
		mov	ax, __fmode
		and	ax, 0C000h
		or	si, ax

loc_55D0::				; CODE XREF: _open+12j
		xor	ax, ax
		push	ax		; func
		push	word ptr [bp+pathname+2]
		push	word ptr [bp+pathname] ; pathname
		nop
		push	cs
		call	near ptr __chmod
		add	sp, 6
		mov	[bp+var_2], ax
		test	si, 100h
		jnz	loc_55ED
		jmp	loc_566D
; ---------------------------------------------------------------------------

loc_55ED::				; CODE XREF: _open+34j
		and	di, __notumask
		mov	ax, di
		test	ax, 180h
		jnz	loc_55FF
		mov	ax, 1
		push	ax
		call	__ioerror

loc_55FF::				; CODE XREF: _open+42j
		cmp	[bp+var_2], 0FFFFh
		jnz	loc_5628
		cmp	__doserrno, 2
		jz	loc_5616
		push	__doserrno

loc_5610::				; CODE XREF: _open+7Ej
		call	__ioerror
		jmp	loc_571D
; ---------------------------------------------------------------------------

loc_5616::				; CODE XREF: _open+56j
		test	di, 80h
		jz	loc_5620
		xor	ax, ax
		jmp	loc_5623
; ---------------------------------------------------------------------------

loc_5620::				; CODE XREF: _open+66j
		mov	ax, 1

loc_5623::				; CODE XREF: _open+6Aj
		mov	[bp+var_2], ax
		jmp	loc_5634
; ---------------------------------------------------------------------------

loc_5628::				; CODE XREF: _open+4Fj
		test	si, 400h
		jz	loc_566D
		mov	ax, 50h	; 'P'
		push	ax
		jmp	loc_5610
; ---------------------------------------------------------------------------

loc_5634::				; CODE XREF: _open+72j
		test	si, 0F0h
		jz	loc_5658
		push	word ptr [bp+pathname+2]
		push	word ptr [bp+pathname]
		xor	ax, ax
		push	ax
		call	sub_5587
		mov	di, ax
		or	ax, ax
		jge	loc_564F
		jmp	loc_571B
; ---------------------------------------------------------------------------

loc_564F::				; CODE XREF: _open+96j
		push	di		; handle
		nop
		push	cs
		call	near ptr __close
		pop	cx
		jmp	loc_566D
; ---------------------------------------------------------------------------

loc_5658::				; CODE XREF: _open+84j
		push	word ptr [bp+pathname+2]
		push	word ptr [bp+pathname]
		push	[bp+var_2]
		call	sub_5587
		mov	di, ax
		or	ax, ax
		jge	loc_56E8
		jmp	loc_571B
; ---------------------------------------------------------------------------

loc_566D::				; CODE XREF: _open+36j	_open+78j ...
		push	si		; oflags
		push	word ptr [bp+pathname+2]
		push	word ptr [bp+pathname] ; path
		nop
		push	cs
		call	near ptr __open
		add	sp, 6
		mov	di, ax
		or	ax, ax
		jl	loc_56E8
		xor	ax, ax
		push	ax		; func
		push	di		; handle
		nop
		push	cs
		call	near ptr _ioctl
		pop	cx
		pop	cx
		mov	[bp+var_4], ax
		test	ax, 80h
		jz	loc_56B8
		or	si, 2000h
		test	si, 8000h
		jz	loc_56C2
		and	ax, 0FFh
		or	ax, 20h
		xor	dx, dx
		push	dx
		push	ax
		mov	ax, 1
		push	ax		; func
		push	di		; handle
		nop
		push	cs
		call	near ptr _ioctl
		add	sp, 8
		jmp	loc_56C2
; ---------------------------------------------------------------------------

loc_56B8::				; CODE XREF: _open+DFj
		test	si, 200h
		jz	loc_56C2
		push	di
		call	sub_55A2

loc_56C2::				; CODE XREF: _open+E9j	_open+102j ...
		test	[bp+var_2], 1
		jz	loc_56E8
		test	si, 100h
		jz	loc_56E8
		test	si, 0F0h
		jz	loc_56E8
		mov	ax, 1
		push	ax
		push	ax		; func
		push	word ptr [bp+pathname+2]
		push	word ptr [bp+pathname] ; pathname
		nop
		push	cs
		call	near ptr __chmod
		add	sp, 8

loc_56E8::				; CODE XREF: _open+B4j	_open+CCj ...
		or	di, di
		jl	loc_571B
		test	si, 300h
		jz	loc_56F7
		mov	ax, 1000h
		jmp	loc_56F9
; ---------------------------------------------------------------------------

loc_56F7::				; CODE XREF: _open+13Cj
		xor	ax, ax

loc_56F9::				; CODE XREF: _open+141j
		mov	dx, si
		and	dx, 0F8FFh
		or	dx, ax
		push	dx
		test	[bp+var_2], 1
		jz	loc_570D
		xor	ax, ax
		jmp	loc_5710
; ---------------------------------------------------------------------------

loc_570D::				; CODE XREF: _open+153j
		mov	ax, 100h

loc_5710::				; CODE XREF: _open+157j
		pop	dx
		or	dx, ax
		mov	bx, di
		shl	bx, 1
		mov	__openfd[bx], dx

loc_571B::				; CODE XREF: _open+98j	_open+B6j ...
		mov	ax, di

loc_571D::				; CODE XREF: _open+5Fj
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
_open		endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; int __cdecl _open(const char *path, int oflags)
__open		proc far		; CODE XREF: _open+C2p

var_2		= word ptr -2
path_____	= dword	ptr  6
oflags		= word ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		mov	al, 1
		mov	cx, [bp+oflags]
		test	cx, 2
		jnz	loc_573E
		mov	al, 2
		test	cx, 4
		jnz	loc_573E
		mov	al, 0

loc_573E::				; CODE XREF: __open+Fj	__open+17j
		push	ds
		lds	dx, [bp+path_____]
		mov	cl, 0F0h ; 'ð'
		and	cl, byte ptr [bp+oflags]
		or	al, cl
		mov	ah, 3Dh
		int	21h		; DOS -	2+ - OPEN DISK FILE WITH HANDLE
					; DS:DX	-> ASCIZ filename
					; AL = access mode
					; 0 - read, 1 -	write, 2 - read	& write
		pop	ds
		jb	loc_576A
		mov	[bp+var_2], ax
		mov	ax, [bp+oflags]
		and	ax, 0B8FFh
		or	ax, 8000h
		mov	bx, [bp+var_2]
		shl	bx, 1
		mov	__openfd[bx], ax
		mov	ax, [bp+var_2]
		jmp	loc_576E
; ---------------------------------------------------------------------------

loc_576A::				; CODE XREF: __open+2Bj
		push	ax
		call	__ioerror

loc_576E::				; CODE XREF: __open+45j
		mov	sp, bp
		pop	bp
		retf
__open		endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; void __cdecl perror(const char *s)
_perror		proc far		; CODE XREF: save_all_scores(void)+22P
					; load_scores_in(void)+1FP

var_4		= word ptr -4
var_2		= word ptr -2
s		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	ax, _errno
		cmp	ax, _sys_nerr
		jge	loc_57A0
		cmp	_errno,	0
		jl	loc_57A0
		mov	bx, _errno
		mov	cl, 2
		shl	bx, cl
		mov	ax, word ptr (_sys_errlist+2)[bx]
		mov	dx, word ptr _sys_errlist[bx]
		mov	[bp+var_2], ax
		mov	[bp+var_4], dx
		jmp	loc_57A8
; ---------------------------------------------------------------------------

loc_57A0::				; CODE XREF: _perror+Dj _perror+14j
		mov	[bp+var_2], ds
		mov	[bp+var_4], offset aUnknownError ; "Unknown error"

loc_57A8::				; CODE XREF: _perror+2Cj
		push	[bp+var_2]
		push	[bp+var_4]
		push	word ptr [bp+s+2]
		push	word ptr [bp+s]
		push	ds
		mov	ax, offset aSS_0 ; "%s:	%s\n"
		push	ax		; format
		push	ds
		mov	ax, offset stru_2B128
		push	ax		; stream
		nop
		push	cs
		call	near ptr _fprintf
		add	sp, 10h
		mov	sp, bp
		pop	bp
		retf
_perror		endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; int printf(const char	*format, ...)
_printf		proc far		; CODE XREF: init_game(void)+16P
					; init_game(void)+29P ...

format__	= dword	ptr  6
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		mov	ax, offset __fputn
		push	ax
		push	ds
		mov	ax, offset stru_2B114
		push	ax
		push	word ptr [bp+format__+2]
		push	word ptr [bp+format__]
		lea	ax, [bp+arg_4]
		push	ax
		call	__vprinter
		pop	bp
		retf
_printf		endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; int __cdecl _fputc(char c, FILE *stream)
__fputc		proc far		; CODE XREF: __fputn+1C2p

c_		= byte ptr  6
stream		= dword	ptr  8

		push	bp
		mov	bp, sp
		les	bx, [bp+stream]
		assume es:nothing
		dec	word ptr es:[bx]
		push	word ptr [bp+stream+2]
		push	bx		; stream
		mov	al, [bp+c_]
		cbw
		push	ax		; c
		nop
		push	cs
		call	near ptr _fputc
		add	sp, 6
		pop	bp
		retf
__fputc		endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; int __cdecl fputc(int	c, FILE	*stream)
_fputc		proc far		; CODE XREF: __fputc+14p _fputchar+Cp	...

c__		= word ptr  6
stream		= dword	ptr  8

		push	bp
		mov	bp, sp
		push	si
		mov	al, byte ptr [bp+c__]
		mov	byte_2D702, al
		les	bx, [bp+stream]
		cmp	word ptr es:[bx], 0FFFFh
		jge	loc_5868
		inc	word ptr es:[bx]
		mov	ax, es:[bx+0Eh]
		mov	si, es:[bx+0Ch]
		inc	word ptr es:[bx+0Ch]
		mov	dl, byte_2D702
		mov	es, ax
		mov	es:[si], dl
		mov	es, word ptr [bp+stream+2]
		test	word ptr es:[bx+2], 8
		jnz	loc_583A
		jmp	loc_598E
; ---------------------------------------------------------------------------

loc_583A::				; CODE XREF: _fputc+34j
		cmp	byte_2D702, 0Ah
		jz	loc_584B
		cmp	byte_2D702, 0Dh
		jz	loc_584B
		jmp	loc_598E
; ---------------------------------------------------------------------------

loc_584B::				; CODE XREF: _fputc+3Ej _fputc+45j
		push	word ptr [bp+stream+2]
		push	word ptr [bp+stream] ; stream
		nop
		push	cs
		call	near ptr _fflush
		pop	cx
		pop	cx
		or	ax, ax
		jnz	loc_585F
		jmp	loc_598E
; ---------------------------------------------------------------------------

loc_585F::				; CODE XREF: _fputc+59j _fputc+82j ...
		mov	ax, 0FFFFh
		jmp	loc_5993
; ---------------------------------------------------------------------------
		jmp	loc_598E
; ---------------------------------------------------------------------------

loc_5868::				; CODE XREF: _fputc+11j
		les	bx, [bp+stream]
		test	word ptr es:[bx+2], 90h
		jnz	loc_587B
		test	word ptr es:[bx+2], 2
		jnz	loc_5885

loc_587B::				; CODE XREF: _fputc+70j _fputc+18Aj
		les	bx, [bp+stream]
		or	word ptr es:[bx+2], 10h
		jmp	loc_585F
; ---------------------------------------------------------------------------

loc_5885::				; CODE XREF: _fputc+78j
		les	bx, [bp+stream]
		or	word ptr es:[bx+2], 100h
		cmp	word ptr es:[bx+6], 0
		jz	loc_5904
		cmp	word ptr es:[bx], 0
		jz	loc_58AA
		push	word ptr [bp+stream+2]
		push	bx		; stream
		nop
		push	cs
		call	near ptr _fflush
		pop	cx
		pop	cx
		or	ax, ax
		jnz	loc_585F

loc_58AA::				; CODE XREF: _fputc+98j
		les	bx, [bp+stream]
		mov	ax, es:[bx+6]
		neg	ax
		mov	es:[bx], ax
		mov	ax, es:[bx+0Eh]
		mov	si, es:[bx+0Ch]
		inc	word ptr es:[bx+0Ch]
		mov	dl, byte_2D702
		mov	es, ax
		mov	es:[si], dl
		mov	es, word ptr [bp+stream+2]
		test	word ptr es:[bx+2], 8
		jnz	loc_58D9
		jmp	loc_598E
; ---------------------------------------------------------------------------

loc_58D9::				; CODE XREF: _fputc+D3j
		cmp	byte_2D702, 0Ah
		jz	loc_58EA
		cmp	byte_2D702, 0Dh
		jz	loc_58EA
		jmp	loc_598E
; ---------------------------------------------------------------------------

loc_58EA::				; CODE XREF: _fputc+DDj _fputc+E4j
		push	word ptr [bp+stream+2]
		push	word ptr [bp+stream] ; stream
		nop
		push	cs
		call	near ptr _fflush
		pop	cx
		pop	cx
		or	ax, ax
		jnz	loc_58FE
		jmp	loc_598E
; ---------------------------------------------------------------------------

loc_58FE::				; CODE XREF: _fputc+F8j
		jmp	loc_585F
; ---------------------------------------------------------------------------
		jmp	loc_598E
; ---------------------------------------------------------------------------

loc_5904::				; CODE XREF: _fputc+92j
		les	bx, [bp+stream]
		mov	al, es:[bx+4]
		cbw
		shl	ax, 1
		mov	bx, ax
		test	__openfd[bx], 800h
		jz	loc_5933
		mov	ax, 2
		push	ax		; fromwhere
		xor	ax, ax
		xor	dx, dx
		push	ax
		push	dx		; offset
		mov	bx, word ptr [bp+stream]
		mov	al, es:[bx+4]
		cbw
		push	ax		; handle
		nop
		push	cs
		call	near ptr _lseek
		add	sp, 8

loc_5933::				; CODE XREF: _fputc+115j
		cmp	byte_2D702, 0Ah
		jnz	loc_5961
		les	bx, [bp+stream]
		test	word ptr es:[bx+2], 40h
		jnz	loc_5961
		mov	ax, 1
		push	ax		; len
		push	ds
		mov	ax, offset asc_2B6CC ; "\r"
		push	ax		; buf
		mov	al, es:[bx+4]
		cbw
		push	ax		; handle
		nop
		push	cs
		call	near ptr __write
		add	sp, 8
		cmp	ax, 1
		jnz	loc_5980

loc_5961::				; CODE XREF: _fputc+137j _fputc+142j
		mov	ax, 1
		push	ax		; len
		push	ds
		mov	ax, offset byte_2D702
		push	ax		; buf
		les	bx, [bp+stream]
		mov	al, es:[bx+4]
		cbw
		push	ax		; handle
		nop
		push	cs
		call	near ptr __write
		add	sp, 8
		cmp	ax, 1
		jz	loc_598E

loc_5980::				; CODE XREF: _fputc+15Ej
		les	bx, [bp+stream]
		test	word ptr es:[bx+2], 200h
		jnz	loc_598E
		jmp	loc_587B
; ---------------------------------------------------------------------------

loc_598E::				; CODE XREF: _fputc+36j _fputc+47j ...
		mov	al, byte_2D702
		mov	ah, 0

loc_5993::				; CODE XREF: _fputc+61j
		pop	si
		pop	bp
		retf
_fputc		endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; int __cdecl fputchar(int c)
_fputchar	proc far

c____		= word ptr  6

		push	bp
		mov	bp, sp
		push	ds
		mov	ax, offset stru_2B114
		push	ax		; stream
		push	[bp+c____]	; c
		push	cs
		call	near ptr _fputc
		add	sp, 6
		pop	bp
		retf
_fputchar	endp

		assume es:seg2608

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; int __stdcall	_fputn(FILE *stream, size_t n, void *src)
__fputn		proc near		; DATA XREF: _fprintf+3o _printf+3o ...

var_2		= word ptr -2
stream		= dword	ptr  4
n		= word ptr  8
src		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		sub	sp, 2
		push	si
		push	di
		mov	di, [bp+n]
		mov	[bp+var_2], di
		les	bx, [bp+stream]
		test	word ptr es:[bx+2], 8
		jz	loc_59F1
		jmp	loc_59E7
; ---------------------------------------------------------------------------

loc_59C5::				; CODE XREF: __fputn+42j
		push	word ptr [bp+stream+2]
		push	word ptr [bp+stream] ; stream
		les	bx, [bp+src]
		assume es:nothing
		inc	word ptr [bp+src]
		mov	al, es:[bx]
		cbw
		push	ax		; c
		push	cs
		call	near ptr _fputc
		add	sp, 6
		cmp	ax, 0FFFFh
		jnz	loc_59E7	; CODE XREF: sub_23069+A7p
					; sub_2433E+6p	...

loc_59E2::				; CODE XREF: __fputn+78j
					; __fputn:loc_5A72j ...
		xor	ax, ax
		jmp	loc_5BA5
; ---------------------------------------------------------------------------

loc_59E7::				; CODE XREF: __fputn+19j __fputn+36j
		mov	ax, di
		dec	di
		or	ax, ax
		jnz	loc_59C5
		jmp	loc_5BA2
; ---------------------------------------------------------------------------
		assume es:seg2608

loc_59F1::				; CODE XREF: __fputn+17j
		les	bx, [bp+stream]
		test	word ptr es:[bx+2], 40h
		jnz	loc_59FF
		jmp	loc_5B27
; ---------------------------------------------------------------------------

loc_59FF::				; CODE XREF: __fputn+50j
		cmp	word ptr es:[bx+6], 0
		jnz	loc_5A09
		jmp	loc_5AD4
; ---------------------------------------------------------------------------

loc_5A09::				; CODE XREF: __fputn+5Aj
		cmp	es:[bx+6], di
		jnb	loc_5A78	; CODE XREF: sub_23069:loc_230B2p
		cmp	word ptr es:[bx], 0
		jz	loc_5A24
		push	word ptr [bp+stream+2]
		push	bx		; stream
		nop
		push	cs
		call	near ptr _fflush
		pop	cx
		pop	cx
		or	ax, ax
		jnz	loc_59E2

loc_5A24::				; CODE XREF: __fputn+69j
		les	bx, [bp+stream]
		assume es:nothing
		mov	al, es:[bx+4]
		cbw
		shl	ax, 1
		mov	bx, ax
		test	__openfd[bx], 800h
		jz	loc_5A53
		mov	ax, 2
		push	ax		; fromwhere
		xor	ax, ax
		xor	dx, dx
		push	ax
		push	dx		; offset
		mov	bx, word ptr [bp+stream]
		mov	al, es:[bx+4]
		cbw
		push	ax		; handle
		nop
		push	cs
		call	near ptr _lseek
		add	sp, 8

loc_5A53::				; CODE XREF: __fputn+8Cj
		push	di		; len
		push	word ptr [bp+src+2]
		push	word ptr [bp+src] ; buf
		les	bx, [bp+stream]
		mov	al, es:[bx+4]
		cbw
		push	ax		; handle
		nop
		push	cs
		call	near ptr __write
		add	sp, 8
		cmp	ax, di
		jnz	loc_5A72
		jmp	loc_5BA2
; ---------------------------------------------------------------------------

loc_5A72::				; CODE XREF: __fputn+C3j
		jmp	loc_59E2
; ---------------------------------------------------------------------------
		jmp	loc_5BA2
; ---------------------------------------------------------------------------

loc_5A78::				; CODE XREF: __fputn+63j
		les	bx, [bp+stream]
		mov	ax, es:[bx]
		add	ax, di

loc_5A80::
		jl	loc_5AA8
		cmp	word ptr es:[bx], 0
		jnz	loc_5A94
		mov	ax, 0FFFFh
		sub	ax, es:[bx+6]
		mov	es:[bx], ax
		jmp	loc_5AA8
; ---------------------------------------------------------------------------

loc_5A94::				; CODE XREF: __fputn+DCj
		push	word ptr [bp+stream+2]
		push	word ptr [bp+stream] ; stream
		nop
		push	cs
		call	near ptr _fflush
		pop	cx
		pop	cx
		or	ax, ax
		jz	loc_5AA8
		jmp	loc_59E2
; ---------------------------------------------------------------------------

loc_5AA8::				; CODE XREF: __fputn:loc_5A80j
					; __fputn+E8j ...
		push	di		; n
		push	word ptr [bp+src+2]
		push	word ptr [bp+src] ; src
		les	bx, [bp+stream]
		push	word ptr es:[bx+0Eh]
		push	word ptr es:[bx+0Ch] ; dest
		nop
		push	cs
		call	near ptr _memcpy
		add	sp, 0Ah
		les	bx, [bp+stream]
		mov	ax, es:[bx]
		add	ax, di
		mov	es:[bx], ax
		add	es:[bx+0Ch], di
		jmp	loc_5BA2
; ---------------------------------------------------------------------------

loc_5AD4::				; CODE XREF: __fputn+5Cj
		les	bx, [bp+stream]
		mov	al, es:[bx+4]
		cbw
		shl	ax, 1
		mov	bx, ax
		test	__openfd[bx], 800h
		jz	loc_5B03
		mov	ax, 2
		push	ax		; fromwhere
		xor	ax, ax
		xor	dx, dx
		push	ax
		push	dx		; offset
		mov	bx, word ptr [bp+stream]
		mov	al, es:[bx+4]

loc_5AF9::				; CODE XREF: sub_23069+40p
		cbw
		push	ax		; handle
		nop
		push	cs
		call	near ptr _lseek
		add	sp, 8

loc_5B03::				; CODE XREF: __fputn+13Cj
		push	di		; len
		push	word ptr [bp+src+2]
		push	word ptr [bp+src] ; buf
		les	bx, [bp+stream]
		mov	al, es:[bx+4]
		cbw
		push	ax		; handle
		nop
		push	cs
		call	near ptr __write
		add	sp, 8
		cmp	ax, di
		jnz	loc_5B22
		jmp	loc_5BA2
; ---------------------------------------------------------------------------

loc_5B22::				; CODE XREF: __fputn+173j
		jmp	loc_59E2
; ---------------------------------------------------------------------------
		jmp	loc_5BA2
; ---------------------------------------------------------------------------
		assume es:seg2608

loc_5B27::				; CODE XREF: __fputn+52j
		les	bx, [bp+stream]
		cmp	word ptr es:[bx+6], 0
		jz	loc_5B83
		jmp	loc_5B7A
; ---------------------------------------------------------------------------

loc_5B33::				; CODE XREF: __fputn+1D5j
		les	bx, [bp+stream]
		assume es:nothing
		inc	word ptr es:[bx]
		jge	loc_5B5B
		mov	ax, es:[bx+0Eh]
		mov	si, es:[bx+0Ch]
		inc	word ptr es:[bx+0Ch]
		les	bx, [bp+src]
		inc	word ptr [bp+src]
		mov	dl, es:[bx]
		mov	es, ax
		mov	es:[si], dl
		mov	al, dl
		mov	ah, 0
		jmp	loc_5B72
; ---------------------------------------------------------------------------

loc_5B5B::				; CODE XREF: __fputn+18Fj
		push	word ptr [bp+stream+2]
		push	word ptr [bp+stream] ; stream
		les	bx, [bp+src]
		inc	word ptr [bp+src]
		mov	al, es:[bx]
		push	ax		; c
		push	cs
		call	near ptr __fputc
		add	sp, 6

loc_5B72::				; CODE XREF: __fputn+1AFj
		cmp	ax, 0FFFFh
		jnz	loc_5B7A
		jmp	loc_59E2
; ---------------------------------------------------------------------------

loc_5B7A::				; CODE XREF: __fputn+187j __fputn+1CBj
		mov	ax, di
		dec	di
		or	ax, ax
		jnz	loc_5B33
		jmp	loc_5BA2
; ---------------------------------------------------------------------------
		assume es:seg2608

loc_5B83::				; CODE XREF: __fputn+185j
		push	di		; len
		push	word ptr [bp+src+2] ; len
		push	word ptr [bp+src] ; buf
		les	bx, [bp+stream]
		mov	al, es:[bx+4]
		cbw
		push	ax		; buf
		nop
		push	cs		; handle
		call	near ptr ___write
		assume es:seg2b53
		add	sp, 8
		cmp	ax, di
		jz	loc_5BA2
		jmp	loc_59E2
; ---------------------------------------------------------------------------

loc_5BA2::				; CODE XREF: __fputn+44j __fputn+C5j ...
		mov	ax, [bp+var_2]

loc_5BA5::				; CODE XREF: __fputn+3Aj
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retn	0Ah
__fputn		endp

		assume es:seg2608

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; int __cdecl __far __read(int handle, void *buf, unsigned int len)
___read		proc far		; CODE XREF: sub_5326+32p _fgetc+8Fp ...

var_3		= byte ptr -3
var_2		= word ptr -2
handle		= word ptr  6
buf		= dword	ptr  8
len		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	di
		mov	ax, [bp+handle]
		cmp	ax, __nfile
		jb	loc_5BC8
		mov	ax, 6
		push	ax
		call	__ioerror
		jmp	loc_5C78
; ---------------------------------------------------------------------------

loc_5BC8::				; CODE XREF: ___read+Fj
		mov	ax, [bp+len]
		inc	ax
		cmp	ax, 2
		jb	loc_5BDE
		mov	bx, [bp+handle]
		shl	bx, 1
		test	__openfd[bx], 200h
		jz	loc_5BE3

loc_5BDE::				; CODE XREF: ___read+22j
		xor	ax, ax
		jmp	loc_5C78
; ---------------------------------------------------------------------------

loc_5BE3::				; CODE XREF: ___read+2Fj ___read+A2j
		push	[bp+len]	; len
		push	word ptr [bp+buf+2]
		push	word ptr [bp+buf] ; buf
		push	[bp+handle]	; handle
		nop
		push	cs
		call	near ptr __read
		add	sp, 8
		mov	[bp+var_2], ax
		inc	ax
		cmp	ax, 2
		jb	loc_5C0D
		mov	bx, [bp+handle]
		shl	bx, 1
		test	__openfd[bx], 4000h
		jnz	loc_5C12

loc_5C0D::				; CODE XREF: ___read+51j
		mov	ax, [bp+var_2]
		jmp	loc_5C78
; ---------------------------------------------------------------------------

loc_5C12::				; CODE XREF: ___read+5Ej
		mov	cx, [bp+var_2]
		les	si, [bp+buf]
		assume es:nothing
		mov	di, si
		mov	bx, si
		cld

loc_5C1D::				; CODE XREF: ___read+7Bj
					; ___read:loc_5C2Cj
		lods	byte ptr es:[si]
		cmp	al, 1Ah
		jz	loc_5C53
		cmp	al, 0Dh
		jz	loc_5C2C
		stosb
		loop	loc_5C1D
		jmp	loc_5C4B
; ---------------------------------------------------------------------------

loc_5C2C::				; CODE XREF: ___read+78j
		loop	loc_5C1D
		push	es
		push	bx
		mov	ax, 1
		push	ax		; len
		lea	ax, [bp+var_3]
		push	ss
		push	ax		; buf
		push	[bp+handle]	; handle
		nop
		push	cs
		call	near ptr __read
		add	sp, 8
		pop	bx
		pop	es
		cld
		mov	al, [bp+var_3]
		stosb

loc_5C4B::				; CODE XREF: ___read+7Dj
		cmp	di, bx
		jnz	loc_5C51
		jmp	loc_5BE3
; ---------------------------------------------------------------------------

loc_5C51::				; CODE XREF: ___read+A0j
		jmp	loc_5C75
; ---------------------------------------------------------------------------

loc_5C53::				; CODE XREF: ___read+74j
		push	bx
		mov	ax, 1
		push	ax		; fromwhere
		neg	cx
		sbb	ax, ax
		push	ax
		push	cx		; offset
		push	[bp+handle]	; handle
		nop
		push	cs
		call	near ptr _lseek
		add	sp, 8
		mov	bx, [bp+handle]
		shl	bx, 1
		or	__openfd[bx], 200h
		pop	bx

loc_5C75::				; CODE XREF: ___read:loc_5C51j
		sub	di, bx
		xchg	ax, di
		assume es:seg2608

loc_5C78::				; CODE XREF: ___read+18j ___read+33j ...
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
___read		endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame thunk

; int __cdecl __far read(int handle, void *buf,	unsigned int len)
_read		proc far		; CODE XREF: seg1891:12F4P
					; load_scores_in(void)+38P ...

handle		= word ptr  6
buf		= dword	ptr  8
len		= word ptr  0Ch

		jmp	near ptr ___read
_read		endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; int __cdecl setvbuf(FILE *stream, char *buf, int type, size_t	size)
_setvbuf	proc far		; CODE XREF: __setupio+77p
					; __setupio+B3p ...

stream		= dword	ptr  6
buf		= dword	ptr  0Ah
type_		= word ptr  0Eh
size_		= word ptr  10h

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	di, [bp+type_]
		mov	si, [bp+size_]
		les	bx, [bp+stream]
		mov	ax, es:[bx+12h]
		cmp	ax, word ptr [bp+stream]
		jnz	loc_5CA3
		cmp	di, 2
		jg	loc_5CA3
		cmp	si, 7FFFh
		jbe	loc_5CA9

loc_5CA3::				; CODE XREF: _setvbuf+15j _setvbuf+1Aj ...
		mov	ax, 0FFFFh
		jmp	loc_5D9A
; ---------------------------------------------------------------------------

loc_5CA9::				; CODE XREF: _setvbuf+20j
		cmp	word_2B6D0, 0
		jnz	loc_5CBF
		cmp	word ptr [bp+stream], offset stru_2B114
		jnz	loc_5CBF
		mov	word_2B6D0, 1
		jmp	loc_5CD3
; ---------------------------------------------------------------------------

loc_5CBF::				; CODE XREF: _setvbuf+2Dj _setvbuf+34j
		cmp	word_2B6CE, 0
		jnz	loc_5CD3
		cmp	word ptr [bp+stream], offset __streams
		jnz	loc_5CD3
		mov	word_2B6CE, 1

loc_5CD3::				; CODE XREF: _setvbuf+3Cj _setvbuf+43j ...
		les	bx, [bp+stream]
		cmp	word ptr es:[bx], 0
		jz	loc_5CF2
		mov	ax, 1
		push	ax		; whence
		xor	ax, ax
		xor	dx, dx
		push	ax
		push	dx		; offset
		push	word ptr [bp+stream+2]
		push	bx		; stream
		nop
		push	cs
		call	near ptr _fseek
		add	sp, 0Ah

loc_5CF2::				; CODE XREF: _setvbuf+59j
		les	bx, [bp+stream]
		test	word ptr es:[bx+2], 4
		jz	loc_5D0C
		push	word ptr es:[bx+0Ah]
		push	word ptr es:[bx+8] ; block
		nop
		push	cs
		call	near ptr _farfree
		pop	cx
		pop	cx

loc_5D0C::				; CODE XREF: _setvbuf+7Aj
		les	bx, [bp+stream]
		and	word ptr es:[bx+2], 0FFF3h
		mov	word ptr es:[bx+6], 0
		mov	ax, word ptr [bp+stream+2]
		mov	dx, word ptr [bp+stream]
		add	dx, 5
		mov	es:[bx+0Ah], ax
		mov	es:[bx+8], dx
		mov	es:[bx+0Eh], ax
		mov	es:[bx+0Ch], dx
		cmp	di, 2
		jz	loc_5D98
		or	si, si
		jbe	loc_5D98
		mov	word ptr __exitbuf+2, seg seg0000
		mov	word ptr __exitbuf, offset __xfflush
		mov	ax, word ptr [bp+buf]
		or	ax, word ptr [bp+buf+2]
		jnz	loc_5D71
		push	si		; size
		nop
		push	cs
		call	near ptr _malloc
		assume es:nothing
		pop	cx
		mov	word ptr [bp+buf+2], dx
		mov	word ptr [bp+buf], ax
		or	ax, dx
		jnz	loc_5D64
		jmp	loc_5CA3
; ---------------------------------------------------------------------------

loc_5D64::				; CODE XREF: _setvbuf+DEj
		les	bx, [bp+stream]
		assume es:seg2608
		or	word ptr es:[bx+2], 4

loc_5D6C::				; CODE XREF: sub_229C4+51p
		jmp	loc_5D71
; ---------------------------------------------------------------------------
		jmp	loc_5CA3
; ---------------------------------------------------------------------------

loc_5D71::				; CODE XREF: _setvbuf+CDj
					; _setvbuf:loc_5D6Cj
		les	bx, [bp+stream]
		mov	ax, word ptr [bp+buf+2]
		mov	dx, word ptr [bp+buf]
		mov	es:[bx+0Eh], ax
		mov	es:[bx+0Ch], dx
		mov	es:[bx+0Ah], ax
		mov	es:[bx+8], dx
		mov	es:[bx+6], si
		cmp	di, 1
		jnz	loc_5D98
		or	word ptr es:[bx+2], 8

loc_5D98::				; CODE XREF: _setvbuf+B5j _setvbuf+B9j ...
		xor	ax, ax

loc_5D9A::				; CODE XREF: _setvbuf+25j
		pop	di
		pop	si
		pop	bp
		retf
_setvbuf	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; char *__cdecl	strcat(char *dest, const char *src)
_strcat		proc far		; CODE XREF: __mkname+4Dp
					; play_game(uchar)+6DFP ...

dest		= dword	ptr  6
src		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		cld
		push	ds
		les	di, [bp+dest]
		mov	dx, di
		xor	al, al
		mov	cx, 0FFFFh
		repne scasb
		push	es
		lea	si, [di-1]
		les	di, [bp+src]
		mov	cx, 0FFFFh
		repne scasb
		not	cx
		sub	di, cx
		push	es
		pop	ds
		pop	es
		xchg	si, di
		test	si, 1
		jz	loc_5DCE
		movsb
		dec	cx

loc_5DCE::				; CODE XREF: _strcat+2Cj
		shr	cx, 1
		rep movsw
		jnb	loc_5DD5
		movsb

loc_5DD5::				; CODE XREF: _strcat+34j
		xchg	ax, dx
		mov	dx, es
		pop	ds
		pop	di
		pop	si
		pop	bp
		retf
_strcat		endp

		assume es:seg2b53

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; int __cdecl strcmp(const char	*s1, const char	*s2)
_strcmp		proc far		; CODE XREF: parse_options(int,uchar **)+31P
					; parse_options(int,uchar **)+58P ...

s1		= dword	ptr  6
s2		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		mov	dx, ds
		cld
		xor	ax, ax
		mov	bx, ax
		les	di, [bp+s2]
		assume es:seg2608
		mov	si, di
		xor	al, al
		mov	cx, 0FFFFh
		repne scasb
		not	cx
		mov	di, si
		lds	si, [bp+s1]
		assume ds:seg2b53
		repe cmpsb
		mov	al, [si-1]
		mov	bl, es:[di-1]
		sub	ax, bx
		mov	ds, dx
		assume ds:seg2608
		pop	di
		pop	si
		pop	bp
		retf
_strcmp		endp

		assume es:nothing

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; char *__cdecl	strcpy(char *dest, const char *src)
_strcpy		proc far		; CODE XREF: play_game(uchar)+6C1P
					; add_barrel(uint,uint)+12P ...

dest		= dword	ptr  6
src		= dword	ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	di
		cld
		les	di, [bp+src]
		assume es:seg2608
		mov	si, di
		xor	al, al
		mov	cx, 0FFFFh
		repne scasb
		not	cx
		push	ds
		mov	ax, es
		mov	ds, ax
		les	di, [bp+dest]
		rep movsb
		pop	ds
		mov	dx, word ptr [bp+dest+2]
		mov	ax, word ptr [bp+dest]
		pop	di
		pop	si
		pop	bp
		retf
_strcpy		endp

		assume es:nothing

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; char *__cdecl	strdup(const char *s)
_strdup		proc far		; CODE XREF: game_manager::load_voc(uchar *)+61P
					; game_manager::load_pcs(uchar *)+51P ...

dest		= dword	ptr -4
src		= dword	ptr  6

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		push	word ptr [bp+src+2]
		push	word ptr [bp+src] ; s
		nop
		push	cs
		call	near ptr _strlen
		assume es:seg2608
		pop	cx
		pop	cx
		inc	ax
		mov	si, ax
		push	ax		; size
		nop
		push	cs
		call	near ptr _malloc
		assume es:nothing
		pop	cx
		mov	word ptr [bp+dest+2], dx
		mov	word ptr [bp+dest], ax
		or	ax, dx
		jz	loc_5E71
		push	si		; n
		push	word ptr [bp+src+2]
		push	word ptr [bp+src] ; src
		push	dx
		push	word ptr [bp+dest] ; dest
		nop
		push	cs
		call	near ptr _memcpy
		assume es:nothing
		add	sp, 0Ah

loc_5E71::				; CODE XREF: _strdup+26j
		mov	dx, word ptr [bp+dest+2]
		mov	ax, word ptr [bp+dest]
		pop	si
		mov	sp, bp
		pop	bp
		retf
_strdup		endp

		assume es:nothing

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; size_t __cdecl strlen(const char *s)
_strlen		proc far		; CODE XREF: __stpcpy+Cp _cputs+11p ...

s		= dword	ptr  6

		push	bp
		mov	bp, sp
		push	di
		les	di, [bp+s]
		assume es:seg2608
		xor	ax, ax
		cmp	ax, word ptr [bp+s+2]
		jnz	loc_5E8E
		cmp	ax, di
		jz	loc_5E98

loc_5E8E::				; CODE XREF: _strlen+Cj
		cld
		mov	cx, 0FFFFh
		repne scasb
		xchg	ax, cx
		not	ax
		dec	ax

loc_5E98::				; CODE XREF: _strlen+10j
		pop	di
		pop	bp
		retf
_strlen		endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; char *__cdecl	strncpy(char *dest, const char *src, size_t maxlen)
_strncpy	proc far		; CODE XREF: parse_box_string(text_box *,uchar *)+7BP

dest		= dword	ptr  6
src		= dword	ptr  0Ah
maxlen		= word ptr  0Eh

		push	bp
		mov	bp, sp
		push	si
		push	di
		cld
		les	di, [bp+src]
		assume es:nothing
		mov	si, di
		xor	al, al
		mov	bx, [bp+maxlen]
		mov	cx, bx
		repne scasb
		sub	bx, cx
		push	ds
		mov	di, es
		mov	ds, di
		les	di, [bp+dest]
		xchg	cx, bx
		rep movsb
		mov	cx, bx
		rep stosb
		pop	ds
		mov	dx, word ptr [bp+dest+2]
		mov	ax, word ptr [bp+dest]
		pop	di
		pop	si
		pop	bp
		retf
_strncpy	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

; int __cdecl __far strnset(void *dest,	char, unsigned int length_)
_strnset	proc far		; CODE XREF: print_form(uchar *,uchar)+9FP
					; file_box::update(void)+99P

dest		= dword	ptr  6
arg_4		= byte ptr  0Ah
length_		= word ptr  0Ch

		push	bp
		mov	bp, sp
		push	si
		mov	si, [bp+length_]
		push	word ptr [bp+dest+2]
		push	word ptr [bp+dest] ; s
		nop
		push	cs
		call	near ptr _strlen
		pop	cx
		pop	cx
		mov	dx, ax
		cmp	dx, si
		jnb	loc_5EE8
		mov	si, dx

loc_5EE8::				; CODE XREF: _strnset+18j
		mov	al, [bp+arg_4]
		push	ax		; value
		push	si		; length
		push	word ptr [bp+dest+2]
		push	word ptr [bp+dest] ; dest
		nop
		push	cs
		call	near ptr _setmem
		add	sp, 8
		mov	dx, word ptr [bp+dest+2]
		mov	ax, word ptr [bp+dest]
		pop	si
		pop	bp
		retf
_strnset	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

; int __cdecl __far strset(void	*dest, char)
_strset		proc far		; CODE XREF: seg0fa9:loc_12BCEP

dest		= dword	ptr  6
arg_4		= byte ptr  0Ah

		push	bp
		mov	bp, sp
		mov	al, [bp+arg_4]
		push	ax		; value
		push	word ptr [bp+dest+2]
		push	word ptr [bp+dest] ; s
		nop
		push	cs
		call	near ptr _strlen
		pop	cx
		pop	cx
		push	ax		; length
		push	word ptr [bp+dest+2]
		push	word ptr [bp+dest] ; dest
		nop
		push	cs
		call	near ptr _setmem
		add	sp, 8
		mov	dx, word ptr [bp+dest+2]
		mov	ax, word ptr [bp+dest]
		pop	bp
		retf
_strset		endp

		assume es:seg2608

; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; char *__cdecl	strupr(char *s)
_strupr		proc far		; CODE XREF: seg0fa9:06EAP
					; game_manager::load_loop(uchar	*)+6FP

s		= dword	ptr  6

		push	bp
		mov	bp, sp
		push	si
		cld
		push	ds
		lds	si, [bp+s]
		mov	dx, si
		jmp	loc_5F47
; ---------------------------------------------------------------------------

loc_5F3C::				; CODE XREF: _strupr+1Bj
		sub	al, 61h	; 'a'
		cmp	al, 19h
		ja	loc_5F47
		add	al, 41h	; 'A'
		mov	[si-1],	al

loc_5F47::				; CODE XREF: _strupr+Bj _strupr+11j
		lodsb
		and	al, al
		jnz	loc_5F3C
		xchg	ax, dx
		mov	dx, ds
		pop	ds
		pop	si
		pop	bp
		retf
_strupr		endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; int __cdecl vfprintf(FILE *stream, const char	*format, void *arglist)
_vfprintf	proc far		; CODE XREF: print_form(uchar *,uchar)+13FP
					; print_form(uchar *,uchar)+16CP

stream		= dword	ptr  6
format____	= dword	ptr  0Ah
arglist		= dword	ptr  0Eh

		push	bp
		mov	bp, sp
		mov	ax, offset __fputn
		push	ax
		push	word ptr [bp+stream+2]
		push	word ptr [bp+stream]
		push	word ptr [bp+format____+2]
		push	word ptr [bp+format____]
		push	word ptr [bp+arglist]
		call	__vprinter
		pop	bp
		retf
_vfprintf	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; int __cdecl __far __write(int	handle,	void *buf, unsigned int	len)
___write	proc far		; CODE XREF: _fflush+ABp __fputn+1EBp	...

var_8E		= byte ptr -8Eh
var_C		= dword	ptr -0Ch
var_7		= byte ptr -7
var_6		= word ptr -6
var_4		= dword	ptr -4
handle		= word ptr  6
buf		= dword	ptr  8
len		= word ptr  0Ch

		push	bp
		mov	bp, sp
		sub	sp, 8Eh
		push	si
		push	di
		mov	di, [bp+handle]
		cmp	di, __nfile
		jb	short loc_5F8A
		mov	ax, 6
		push	ax
		call	__ioerror
		jmp	loc_60B9
; ---------------------------------------------------------------------------

loc_5F8A::				; CODE XREF: ___write+10j
		mov	ax, [bp+len]
		inc	ax
		cmp	ax, 2
		jnb	short loc_5F98
		xor	ax, ax
		jmp	loc_60B9
; ---------------------------------------------------------------------------

loc_5F98::				; CODE XREF: ___write+23j
		mov	bx, di
		shl	bx, 1
		test	__openfd[bx], 800h
		jz	short loc_5FB7
		mov	ax, 2
		push	ax		; fromwhere
		xor	ax, ax
		xor	dx, dx
		push	ax
		push	dx		; offset
		push	di		; handle
		nop
		push	cs
		call	near ptr _lseek
		add	sp, 8

loc_5FB7::				; CODE XREF: ___write+34j
		mov	bx, di
		shl	bx, 1
		test	__openfd[bx], 4000h
		jnz	loc_5FD8
		push	[bp+len]	; len
		push	word ptr [bp+buf+2]
		push	word ptr [bp+buf] ; buf
		push	di		; handle
		nop
		push	cs
		call	near ptr __write
		add	sp, 8
		jmp	loc_60B9
; ---------------------------------------------------------------------------

loc_5FD8::				; CODE XREF: ___write+53j
		mov	bx, di
		shl	bx, 1
		and	__openfd[bx], 0FDFFh
		mov	ax, word ptr [bp+buf+2]
		mov	dx, word ptr [bp+buf]
		mov	word ptr [bp+var_C+2], ax
		mov	word ptr [bp+var_C], dx
		mov	ax, [bp+len]
		mov	[bp+var_6], ax
		jmp	loc_606B
; ---------------------------------------------------------------------------

loc_5FF6::				; CODE XREF: ___write+10Dj
		dec	[bp+var_6]
		les	bx, [bp+var_C]
		assume es:seg2b53
		inc	word ptr [bp+var_C]
		mov	al, es:[bx]
		mov	[bp+var_7], al
		cmp	al, 0Ah
		jnz	loc_6013
		les	bx, [bp+var_4]
		mov	byte ptr es:[bx], 0Dh
		inc	word ptr [bp+var_4]

loc_6013::				; CODE XREF: ___write+99j
		les	bx, [bp+var_4]
		mov	al, [bp+var_7]
		mov	es:[bx], al
		inc	word ptr [bp+var_4]
		lea	ax, [bp+var_8E]
		mov	dx, word ptr [bp+var_4]
		xor	bx, bx
		sub	dx, ax
		sbb	bx, 0
		or	bx, bx
		jl	short loc_6075
		jnz	short loc_6039
		cmp	dx, 80h	; ''
		jb	short loc_6075

loc_6039::				; CODE XREF: ___write+C3j
		lea	ax, [bp+var_8E]
		mov	si, word ptr [bp+var_4]
		xor	dx, dx
		sub	si, ax
		sbb	dx, 0
		push	si		; len
		push	ss
		push	ax		; buf
		push	di		; handle
		nop
		push	cs
		call	near ptr __write
		add	sp, 8
		mov	dx, ax
		cmp	ax, si
		jz	loc_606B
		cmp	dx, 0FFFFh
		jnz	loc_6063

loc_605E::				; CODE XREF: ___write+13Dj
		mov	ax, 0FFFFh
		jmp	loc_60B4
; ---------------------------------------------------------------------------

loc_6063::				; CODE XREF: ___write+EEj
		mov	ax, [bp+len]
		sub	ax, [bp+var_6]
		jmp	loc_60B0
; ---------------------------------------------------------------------------
		assume es:seg2608

loc_606B::				; CODE XREF: ___write+86j ___write+E9j
		lea	ax, [bp+var_8E]
		mov	word ptr [bp+var_4+2], ss
		mov	word ptr [bp+var_4], ax

loc_6075::				; CODE XREF: ___write+C1j ___write+C9j
		cmp	[bp+var_6], 0
		jz	loc_607E
		jmp	loc_5FF6
; ---------------------------------------------------------------------------
		assume es:seg2b53

loc_607E::				; CODE XREF: ___write+10Bj
		lea	ax, [bp+var_8E]
		mov	si, word ptr [bp+var_4]
		xor	dx, dx
		sub	si, ax
		sbb	dx, 0
		mov	ax, si
		or	ax, ax
		jbe	loc_60B6
		push	si		; len
		push	ss		; len
		lea	ax, [bp+var_8E]
		push	ax		; buf
		push	di		; buf
		nop
		push	cs		; handle
		call	near ptr __write
		add	sp, 8
		mov	dx, ax
		cmp	ax, si
		jz	loc_60B6
		cmp	dx, 0FFFFh
		jz	loc_605E
		mov	ax, [bp+len]

loc_60B0::				; CODE XREF: ___write+FBj
		add	ax, dx
		sub	ax, si

loc_60B4::				; CODE XREF: ___write+F3j
		jmp	loc_60B9
; ---------------------------------------------------------------------------

loc_60B6::				; CODE XREF: ___write+122j
					; ___write+138j
		mov	ax, [bp+len]

loc_60B9::				; CODE XREF: ___write+19j ___write+27j ...
		pop	di
		pop	si
		mov	sp, bp
		pop	bp
		retf
___write	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

; int __cdecl _write(int handle, const void *buf, unsigned int len)
__write		proc far		; CODE XREF: _fputc+155p _fputc+174p ...

handle		= word ptr  6
buf		= dword	ptr  8
len		= word ptr  0Ch

		push	bp
		mov	bp, sp
		mov	bx, [bp+handle]
		shl	bx, 1
		test	__openfd[bx], 1
		jz	loc_60D5
		mov	ax, 5
		push	ax
		jmp	loc_60F6
; ---------------------------------------------------------------------------

loc_60D5::				; CODE XREF: __write+Ej
		push	ds
		mov	ah, 40h	; '@'
		mov	bx, [bp+handle]
		mov	cx, [bp+len]
		lds	dx, [bp+buf]
		assume ds:seg2b53
		int	21h		; DOS -	2+ - WRITE TO FILE WITH	HANDLE
					; BX = file handle, CX = number	of bytes to write, DS:DX -> buffer
		pop	ds
		assume ds:seg2608
		jb	loc_60F5
		push	ax
		mov	bx, [bp+handle]
		shl	bx, 1
		or	__openfd[bx], 1000h
		pop	ax
		jmp	loc_60F9
; ---------------------------------------------------------------------------

loc_60F5::				; CODE XREF: __write+25j
		push	ax

loc_60F6::				; CODE XREF: __write+14j
		call	__ioerror

loc_60F9::				; CODE XREF: __write+34j
		pop	bp
		retf
__write		endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame thunk

; int __cdecl __far write(int handle, void *buf, unsigned int len)
_write		proc far		; CODE XREF: seg1783:09C9P
					; seg1783:09E8P ...

handle		= word ptr  6
buf		= dword	ptr  8
len		= word ptr  0Ch

		jmp	near ptr ___write
_write		endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

__xfclose	proc far		; DATA XREF: sub_4EDE+A2o

stream		= dword	ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		xor	si, si
		mov	word ptr [bp+stream+2],	ds
		mov	word ptr [bp+stream], offset __streams
		cmp	si, __nfile
		jnb	loc_6136

loc_6115::				; CODE XREF: __xfclose+36j
		les	bx, [bp+stream]
		assume es:nothing
		test	word ptr es:[bx+2], 3
		jz	loc_612B
		push	word ptr [bp+stream+2]
		push	bx		; stream
		nop
		push	cs
		call	near ptr _fclose
		pop	cx
		pop	cx

loc_612B::				; CODE XREF: __xfclose+20j
		add	word ptr [bp+stream], 14h
		inc	si
		cmp	si, __nfile
		jb	loc_6115

loc_6136::				; CODE XREF: __xfclose+15j
		pop	si
		mov	sp, bp
		pop	bp
		retf
__xfclose	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: library function bp-based	frame

__xfflush	proc far		; DATA XREF: _setvbuf+C1o

stream		= dword	ptr -4

		push	bp
		mov	bp, sp
		sub	sp, 4
		push	si
		mov	si, 4
		mov	word ptr [bp+stream+2],	ds
		mov	word ptr [bp+stream], offset __streams
		jmp	loc_616A
; ---------------------------------------------------------------------------

loc_614F::				; CODE XREF: __xfflush+31j
		les	bx, [bp+stream]
		test	word ptr es:[bx+2], 3
		jz	loc_6165
		push	word ptr [bp+stream+2]
		push	bx		; stream
		nop
		push	cs
		call	near ptr _fflush
		pop	cx
		pop	cx

loc_6165::				; CODE XREF: __xfflush+1Dj
		dec	si

loc_6166::
		add	word ptr [bp+stream], 14h

loc_616A::				; CODE XREF: __xfflush+12j
		or	si, si
		jnz	loc_614F
		pop	si

loc_616F::
		mov	sp, bp
		pop	bp
		retf
__xfflush	endp

seg0000		ends
		; ---- BC RTL helper aliases (F_* names emitted by BCC -> original labels) ----
F_FTOL@		equ	ftol@			; float -> long conversion
F_SCOPY@	equ	scopy@			; struct copy
		end start
