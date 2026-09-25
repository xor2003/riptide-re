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
	?debug	S "gamemgr.cpp"
	?debug	C E95A4B395D0B67616D656D67722E637070
	?debug	C E95A4B395D09726970746964652E68
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
GAMEMGR_TEXT	segment byte public use16 'CODE'
GAMEMGR_TEXT	ends
DGROUP	group	_DATA,_BSS
	assume	cs:GAMEMGR_TEXT,ds:DGROUP
_DATA	segment word public use16 'DATA'
d@	label	byte
d@w	label	word
_DATA	ends
_BSS	segment word public use16 'BSS'
b@	label	byte
b@w	label	word
_BSS	ends
GAMEMGR_TEXT	segment byte public use16 'CODE'
   ;	
   ;	int far gm_open(uchar far *name)
   ;	
	assume	cs:GAMEMGR_TEXT
@gm_open$qnuc	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    return openelement(name);
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr _openelement
	add	sp,4
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@gm_open$qnuc	endp
   ;	
   ;	ulong far gm_read(void far *buf, uint len)
   ;	
	assume	cs:GAMEMGR_TEXT
@gm_read$qnvui	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    return elementread(buf, len);
   ;	
	push	word ptr [bp+10]
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr _elementread
	add	sp,6
	movzx	eax,ax
	shld	edx,eax,16
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@gm_read$qnvui	endp
   ;	
   ;	void interrupt far pc_sound_doit(...)
   ;	
	assume	cs:GAMEMGR_TEXT
@pc_sound_doit$qve	proc	far
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
   ;	
   ;	{
   ;	    if (++ticks18_2 >= 6) {
   ;	
	mov	al,byte ptr DGROUP:_ticks18_2
	inc	al
	mov	byte ptr DGROUP:_ticks18_2,al
	cmp	al,6
	jb	short @3@142
   ;	
   ;	        ticks18_2 = 0;
   ;	
	mov	byte ptr DGROUP:_ticks18_2,0
   ;	
   ;	        asm pushf;
   ;	
 	pushf	
   ;	
   ;	        theirhandler();
   ;	
	pushf	
	call	dword ptr DGROUP:_theirhandler
@3@142:
   ;	
   ;	    }
   ;	    if (the_game->field_1C != 0 && cur_sound != 0 &&
   ;	
   ;	
   ;	        ((cur_sound_t far *)cur_sound)->seq != 0) {
   ;	
	les	bx,dword ptr DGROUP:_the_game
	cmp	byte ptr es:[bx+28],0
	je	short @3@310
	cmp	dword ptr DGROUP:_cur_sound,large 0
	je	short @3@310
	les	bx,dword ptr DGROUP:_cur_sound
	cmp	dword ptr es:[bx+6],large 0
	je	short @3@310
   ;	
   ;	        if (((cur_sound_t far *)cur_sound)->index ==
   ;	
   ;	
   ;	            ((cur_sound_t far *)cur_sound)->seq->count) {
   ;	
	les	bx,dword ptr DGROUP:_cur_sound
	mov	al,byte ptr es:[bx+5]
	mov	ah,0
	les	bx,dword ptr DGROUP:_cur_sound
	les	bx,dword ptr es:[bx+6]
	cmp	ax,word ptr es:[bx+8]
	jne	short @3@282
   ;	
   ;	            cur_sound = 0;
   ;	
	mov	dword ptr DGROUP:_cur_sound,large 0
   ;	
   ;	            nosound();
   ;	
	call	far ptr _nosound
   ;	
   ;	        } else {
   ;	
	jmp	short @3@310
@3@282:
   ;	
   ;	            sound(((cur_sound_t far *)cur_sound)->seq->freqs
   ;	
   ;	
   ;	                  [((cur_sound_t far *)cur_sound)->index]);
   ;	
	les	bx,dword ptr DGROUP:_cur_sound
	mov	al,byte ptr es:[bx+5]
	mov	ah,0
	shl	ax,1
	les	bx,dword ptr DGROUP:_cur_sound
	les	bx,dword ptr es:[bx+6]
	les	bx,dword ptr es:[bx+4]
	add	bx,ax
	push	word ptr es:[bx]
	call	far ptr _sound
	pop	cx
   ;	
   ;	            ((cur_sound_t far *)cur_sound)->index++;
   ;	
	les	bx,dword ptr DGROUP:_cur_sound
	inc	byte ptr es:[bx+5]
@3@310:
   ;	
   ;	        }
   ;	    }
   ;	    outportb(0x20, 0x20);
   ;	
	mov	dx,32
	mov	al,32
	out	dx,al
   ;	
   ;	}
   ;	
	pop	bp
	pop	di
	pop	si
	pop	ds
	pop	es
	pop	dx
	pop	cx
	pop	bx
	pop	ax
	iret	
@pc_sound_doit$qve	endp
   ;	
   ;	game_manager::game_manager(uchar far *rsc_name)
   ;	
	assume	cs:GAMEMGR_TEXT
@game_manager@$bctr$qnuc	proc	far
	enter	6,0
   ;	
   ;	{
   ;	
	cmp	dword ptr [bp+6],large 0
	jne	short @4@86
	push	818
	call	far ptr @$bnew$qui
	pop	cx
	mov	word ptr [bp+8],dx
	mov	word ptr [bp+6],ax
	or	ax,dx
	jne short	@@199
	jmp	@4@618
@@199:
@4@86:
   ;	
   ;	    int var_4, var_2, var_6;
   ;	
   ;	    startworx();
   ;	
	call	far ptr _startworx
   ;	
   ;	    if (rsc_name != 0) {
   ;	
	cmp	dword ptr [bp+10],large 0
	je	short @4@226
   ;	
   ;	        var_4 = startresource(rsc_name);
   ;	
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	call	far ptr _startresource
	add	sp,4
	mov	word ptr [bp-2],ax
   ;	
   ;	        if (var_4 > 2) {
   ;	
	cmp	word ptr [bp-2],2
	jle	short @4@170
   ;	
   ;	            set_external_open((void far *)gm_open);
   ;	
	push	seg @gm_open$qnuc
	push	offset @gm_open$qnuc
	call	far ptr @set_external_open$qnv
	add	sp,4
   ;	
   ;	            set_external_read((void far *)gm_read);
   ;	
	push	seg @gm_read$qnvui
	push	offset @gm_read$qnvui
	call	far ptr @set_external_read$qnv
	add	sp,4
@4@170:
   ;	
   ;	        }
   ;	        if (var_4 == -1)
   ;	
	cmp	word ptr [bp-2],-1
	jne	short @4@226
   ;	
   ;	            read_error("RSC file.");
   ;	
	push	ds
	push	offset DGROUP:s@
	call	far ptr @read_error$qnuc
	add	sp,4
@4@226:
   ;	
   ;	    }
   ;	    field_04 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+4],0
   ;	
   ;	    field_1C = 1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+28],1
   ;	
   ;	    reset_player(0);
   ;	
	push	0
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @game_manager@reset_player$quc
	add	sp,6
   ;	
   ;	    reset_player(1);
   ;	
	push	1
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @game_manager@reset_player$quc
	add	sp,6
   ;	
   ;	    field_25 = field_2F = field_26 = field_30 = input_mode = field_2E = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,0
	mov	byte ptr es:[bx+46],al
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+36],al
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+48],al
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+38],al
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+47],al
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+37],al
   ;	
   ;	    field_00 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	dword ptr es:[bx],large 0
   ;	
   ;	    adlib_present = sb_present = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,0
	mov	byte ptr es:[bx+6],al
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+7],al
   ;	
   ;	    adlib_present = adlibdetect();
   ;	
	call	far ptr _adlibdetect
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+7],al
   ;	
   ;	    var_2 = dspreset();
   ;	
	call	far ptr _dspreset
	mov	word ptr [bp-4],ax
   ;	
   ;	    if (var_2 == -1 || force_pc_sound != 0)
   ;	
	cmp	word ptr [bp-4],-1
	je	short @4@282
	cmp	byte ptr DGROUP:_force_pc_sound,0
	je	short @4@310
@4@282:
   ;	
   ;	        sb_present = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+6],0
	jmp	short @4@338
@4@310:
   ;	
   ;	    else
   ;	        sb_present = 1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+6],1
@4@338:
   ;	
   ;	    if (sb_present != 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+6],0
	je	short @4@506
   ;	
   ;	        vochooksetting(1);
   ;	
	push	1
	call	far ptr _vochooksetting
	pop	cx
   ;	
   ;	        setfmvolume(8, 8);
   ;	
	push	8
	push	8
	call	far ptr _setfmvolume
	add	sp,4
   ;	
   ;	        setvocvolume(8, 8);
   ;	
	push	8
	push	8
	call	far ptr _setvocvolume
	add	sp,4
   ;	
   ;	        for (var_6 = 0; var_6 < 0x10; ++var_6)
   ;	
	mov	word ptr [bp-6],0
	jmp	short @4@450
@4@394:
   ;	
   ;	            setchannelvolume(var_6, 0x6E);
   ;	
	push	110
	push	word ptr [bp-6]
	call	far ptr _setchannelvolume
	add	sp,4
	inc	word ptr [bp-6]
@4@450:
	cmp	word ptr [bp-6],16
	jl	short @4@394
   ;	
   ;	        printf("SoundBlaster detected.\n");
   ;	
	push	ds
	push	offset DGROUP:s@+10
	call	far ptr _printf
	add	sp,4
   ;	
   ;	    } else {
   ;	
	jmp	short @4@590
@4@506:
   ;	
   ;	        asm { mov ah, 0x2E
   ;	
 	mov	 ah, 02EH
   ;	
   ;	              int 0x63 }
   ;	
	int	 063H 
   ;	
   ;	        theirhandler = getvect(8);
   ;	
	push	8
	call	far ptr _getvect
	pop	cx
	mov	word ptr DGROUP:_theirhandler+2,dx
	mov	word ptr DGROUP:_theirhandler,ax
   ;	
   ;	        setvect(8, pc_sound_doit);
   ;	
	push	seg @pc_sound_doit$qve
	push	offset @pc_sound_doit$qve
	push	8
	call	far ptr _setvect
	add	sp,6
   ;	
   ;	        outportb(0x43, 0x34);
   ;	
	mov	dx,67
	mov	al,52
	out	dx,al
   ;	
   ;	        outportb(0x40, 0xC3);
   ;	
	mov	dx,64
	mov	al,195
	out	dx,al
   ;	
   ;	        outportb(0x40, 0x2A);
   ;	
	mov	dx,64
	mov	al,42
	out	dx,al
@4@590:
   ;	
   ;	    }
   ;	    clear_flags();
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @game_manager@clear_flags$qv
	add	sp,4
   ;	
   ;	    game_speed = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+34],0
   ;	
   ;	    field_38 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+56],0
   ;	
   ;	    field_39 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+57],0
   ;	
   ;	    field_1E = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	dword ptr es:[bx+30],large 0
   ;	
   ;	    cur_sound = 0;
   ;	
	mov	dword ptr DGROUP:_cur_sound,large 0
@4@618:
   ;	
   ;	}
   ;	
	mov	dx,word ptr [bp+8]
	mov	ax,word ptr [bp+6]
	leave	
	ret	
@game_manager@$bctr$qnuc	endp
   ;	
   ;	game_manager::~game_manager()
   ;	
	assume	cs:GAMEMGR_TEXT
@game_manager@$bdtr$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	
	cmp	dword ptr [bp+6],large 0
	je	short @5@226
   ;	
   ;	    if (sb_present != 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+6],0
	je	short @5@114
   ;	
   ;	        dspclose();
   ;	
	call	far ptr _dspclose
   ;	
   ;	    } else {
   ;	
	jmp	short @5@142
@5@114:
   ;	
   ;	        outportb(0x43, 0x34);
   ;	
	mov	dx,67
	mov	al,52
	out	dx,al
   ;	
   ;	        outportb(0x40, 0x00);
   ;	
	mov	dx,64
	mov	al,0
	out	dx,al
   ;	
   ;	        outportb(0x40, 0x00);
   ;	
	mov	dx,64
	mov	al,0
	out	dx,al
   ;	
   ;	        setvect(8, theirhandler);
   ;	
	push	word ptr DGROUP:_theirhandler+2
	push	word ptr DGROUP:_theirhandler
	push	8
	call	far ptr _setvect
	add	sp,6
@5@142:
   ;	
   ;	    }
   ;	    closeworx();
   ;	
	call	far ptr _closeworx
   ;	
   ;	    nosound();
   ;	
	call	far ptr _nosound
	test	word ptr [bp+10],1
	je	short @5@226
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @$bdele$qnv
	add	sp,4
@5@226:
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@game_manager@$bdtr$qv	endp
   ;	
   ;	void game_manager::doit()
   ;	
	assume	cs:GAMEMGR_TEXT
@game_manager@doit$qv	proc	far
	enter	4,0
   ;	
   ;	{
   ;	    int var_2, var_4;
   ;	
   ;	    if (cur_sound != 0 && sb_present != 0 && vocplaying() == 0)
   ;	
	cmp	dword ptr DGROUP:_cur_sound,large 0
	je	short @6@142
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+6],0
	je	short @6@142
	call	far ptr _vocplaying
	or	ax,ax
	jne	short @6@142
   ;	
   ;	        cur_sound = 0;
   ;	
	mov	dword ptr DGROUP:_cur_sound,large 0
@6@142:
   ;	
   ;	    reset_player(0);
   ;	
	push	0
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @game_manager@reset_player$quc
	add	sp,6
   ;	
   ;	    if (gr_keys[0x4D] != 0) field_2A = 1;
   ;	
	cmp	byte ptr DGROUP:_gr_keys+77,0
	je	short @6@198
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+42],1
@6@198:
   ;	
   ;	    if (gr_keys[0x4B] != 0) field_29 = 1;
   ;	
	cmp	byte ptr DGROUP:_gr_keys+75,0
	je	short @6@254
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+41],1
@6@254:
   ;	
   ;	    if (gr_keys[0x50] != 0) field_28 = 1;
   ;	
	cmp	byte ptr DGROUP:_gr_keys+80,0
	je	short @6@310
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+40],1
@6@310:
   ;	
   ;	    if (gr_keys[0x48] != 0) field_27 = 1;
   ;	
	cmp	byte ptr DGROUP:_gr_keys+72,0
	je	short @6@366
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+39],1
@6@366:
   ;	
   ;	    if (gr_keys[0x39] != 0) field_2B = 1;
   ;	
	cmp	byte ptr DGROUP:_gr_keys+57,0
	je	short @6@422
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+43],1
@6@422:
   ;	
   ;	    if (gr_keys[0x38] != 0 || gr_keys[0x1D] != 0) field_2C = 1;
   ;	
	cmp	byte ptr DGROUP:_gr_keys+56,0
	jne	short @6@478
	cmp	byte ptr DGROUP:_gr_keys+29,0
	je	short @6@506
@6@478:
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+44],1
@6@506:
   ;	
   ;	    if (input_mode == 1) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+36],1
	je short	@@200
	jmp	@6@954
@@200:
   ;	
   ;	        asm cli;
   ;	
 	cli	
   ;	
   ;	        joystickupdate();
   ;	
	call	far ptr _joystickupdate
   ;	
   ;	        var_2 = joystickx();
   ;	
	call	far ptr _joystickx
	mov	word ptr [bp-2],ax
   ;	
   ;	        var_4 = joysticky();
   ;	
	call	far ptr _joysticky
	mov	word ptr [bp-4],ax
   ;	
   ;	        asm sti;
   ;	
 	sti	
   ;	
   ;	        if (var_2 <= 0x1D) field_29 = 1;
   ;	
	cmp	word ptr [bp-2],29
	jg	short @6@674
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+41],1
	jmp	short @6@730
@6@674:
   ;	
   ;	        else if (var_2 >= 0x63) field_2A = 1;
   ;	
	cmp	word ptr [bp-2],99
	jl	short @6@730
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+42],1
@6@730:
   ;	
   ;	        if (var_4 >= 0x54) field_28 = 1;
   ;	
	cmp	word ptr [bp-4],84
	jl	short @6@786
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+40],1
	jmp	short @6@842
@6@786:
   ;	
   ;	        else if (var_4 <= 0x2C) field_27 = 1;
   ;	
	cmp	word ptr [bp-4],44
	jg	short @6@842
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+39],1
@6@842:
   ;	
   ;	        if (joystickbutton(0) != 0) field_2B = 1;
   ;	
	push	0
	call	far ptr _joystickbutton
	pop	cx
	or	ax,ax
	je	short @6@898
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+43],1
@6@898:
   ;	
   ;	        if (joystickbutton(1) != 0) field_2C = 1;
   ;	
	push	1
	call	far ptr _joystickbutton
	pop	cx
	or	ax,ax
	je	short @6@954
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+44],1
@6@954:
   ;	
   ;	    }
   ;	    if (field_00 != 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	dword ptr es:[bx],large 0
	je	short @6@1010
   ;	
   ;	        reset_player(1);
   ;	
	push	1
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @game_manager@reset_player$quc
	add	sp,6
   ;	
   ;	        ((void (far *)())field_00)();
   ;	
	les	bx,dword ptr [bp+6]
	call	dword ptr es:[bx]
@6@1010:
   ;	
   ;	    }
   ;	}
   ;	
	leave	
	ret	
@game_manager@doit$qv	endp
   ;	
   ;	void game_manager::clear_flags()
   ;	
	assume	cs:GAMEMGR_TEXT
@game_manager@clear_flags$qv	proc	far
	enter	2,0
   ;	
   ;	{
   ;	    int var_2;
   ;	    for (var_2 = 0; var_2 < 0x14; ++var_2)
   ;	
	mov	word ptr [bp-2],0
	jmp	short @7@114
@7@58:
   ;	
   ;	        ((uchar far *)this)[8 + var_2] = 0;
   ;	
	mov	bx,word ptr [bp-2]
	mov	es,word ptr [bp+8]
	add	bx,word ptr [bp+6]
	mov	byte ptr es:[bx+8],0
	inc	word ptr [bp-2]
@7@114:
	cmp	word ptr [bp-2],20
	jl	short @7@58
   ;	
   ;	}
   ;	
	leave	
	ret	
@game_manager@clear_flags$qv	endp
   ;	
   ;	void game_manager::joy_update()
   ;	
	assume	cs:GAMEMGR_TEXT
@game_manager@joy_update$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    joystickupdate();
   ;	
	call	far ptr _joystickupdate
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@game_manager@joy_update$qv	endp
   ;	
   ;	void game_manager::reset_player(uchar p)
   ;	
	assume	cs:GAMEMGR_TEXT
@game_manager@reset_player$quc	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    ((uchar far *)this + p * 0x0A)[0x29] =
   ;	
   ;	
   ;	        ((uchar far *)this + p * 0x0A)[0x2A] =
   ;	        ((uchar far *)this + p * 0x0A)[0x27] =
   ;	        ((uchar far *)this + p * 0x0A)[0x28] =
   ;	        ((uchar far *)this + p * 0x0A)[0x2B] =
   ;	        ((uchar far *)this + p * 0x0A)[0x2C] = 0;
   ;	
	mov	al,byte ptr [bp+10]
	mov	ah,0
	imul	ax,ax,10
	les	bx,dword ptr [bp+6]
	add	bx,ax
	mov	al,0
	mov	byte ptr es:[bx+44],al
	mov	dl,byte ptr [bp+10]
	mov	dh,0
	imul	dx,dx,10
	les	bx,dword ptr [bp+6]
	add	bx,dx
	mov	byte ptr es:[bx+43],al
	mov	dl,byte ptr [bp+10]
	mov	dh,0
	imul	dx,dx,10
	les	bx,dword ptr [bp+6]
	add	bx,dx
	mov	byte ptr es:[bx+40],al
	mov	dl,byte ptr [bp+10]
	mov	dh,0
	imul	dx,dx,10
	les	bx,dword ptr [bp+6]
	add	bx,dx
	mov	byte ptr es:[bx+39],al
	mov	dl,byte ptr [bp+10]
	mov	dh,0
	imul	dx,dx,10
	les	bx,dword ptr [bp+6]
	add	bx,dx
	mov	byte ptr es:[bx+42],al
	mov	dl,byte ptr [bp+10]
	mov	dh,0
	imul	dx,dx,10
	les	bx,dword ptr [bp+6]
	add	bx,dx
	mov	byte ptr es:[bx+41],al
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@game_manager@reset_player$quc	endp
   ;	
   ;	void game_manager::turn_sound(uchar on)
   ;	
	assume	cs:GAMEMGR_TEXT
@game_manager@turn_sound$quc	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (field_1C != on) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+28]
	cmp	al,byte ptr [bp+10]
	je	short @10@282
   ;	
   ;	        field_1C = on;
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr [bp+10]
	mov	byte ptr es:[bx+28],al
   ;	
   ;	        if (on == 1) {
   ;	
	cmp	byte ptr [bp+10],1
	jne	short @10@170
   ;	
   ;	            if (field_1E != 0)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	dword ptr es:[bx+30],large 0
	je	short @10@282
   ;	
   ;	                playcmfblock((void far *)field_1E);
   ;	
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+32]
	push	word ptr es:[bx+30]
	call	far ptr _playcmfblock
	add	sp,4
	jmp	short @10@282
   ;	
   ;	        } else {
   ;	
	jmp	short @10@282
@10@170:
   ;	
   ;	            if (field_1E != 0)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	dword ptr es:[bx+30],large 0
	je	short @10@226
   ;	
   ;	                stopsequence();
   ;	
	call	far ptr _stopsequence
@10@226:
   ;	
   ;	            if (vocplaying() != 0)
   ;	
	call	far ptr _vocplaying
	or	ax,ax
	je	short @10@282
   ;	
   ;	                stopvoc();
   ;	
	call	far ptr _stopvoc
@10@282:
   ;	
   ;	        }
   ;	    }
   ;	}
   ;	
	pop	bp
	ret	
@game_manager@turn_sound$quc	endp
   ;	
   ;	void game_manager::remove_sound(uchar far *s1)
   ;	
	assume	cs:GAMEMGR_TEXT
@game_manager@remove_sound$qnuc	proc	far
	enter	4,0
	push	si
   ;	
   ;	{
   ;	    int var_2, var_4;
   ;	
   ;	    if (vocplaying() != 0)
   ;	
	call	far ptr _vocplaying
	or	ax,ax
	je	short @11@86
   ;	
   ;	        stopvoc();
   ;	
	call	far ptr _stopvoc
@11@86:
   ;	
   ;	    for (var_2 = 0; var_2 < field_39; ++var_2) {
   ;	
	mov	word ptr [bp-2],0
	jmp	short @11@170
@11@114:
   ;	
   ;	        if (strcmp(sounds[var_2]->name, s1) == 0)
   ;	
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	mov	ax,word ptr [bp-2]
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	les	bx,dword ptr es:[bx+658]
	push	word ptr es:[bx+2]
	push	word ptr es:[bx]
	call	far ptr _strcmp
	add	sp,8
	or	ax,ax
	je	short @11@198
	inc	word ptr [bp-2]
@11@170:
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+57]
	mov	ah,0
	cmp	ax,word ptr [bp-2]
	jg	short @11@114
@11@198:
   ;	
   ;	            break;
   ;	    }
   ;	    if (var_2 == field_39)
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+57]
	mov	ah,0
	cmp	ax,word ptr [bp-2]
	jne short	@@201
	jmp	@11@506
@@201:
   ;	
   ;	        return;
   ;	    if (sb_present != 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+6],0
	je	short @11@282
   ;	
   ;	        delete sounds[var_2]->voc->name;
   ;	
	mov	ax,word ptr [bp-2]
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	les	bx,dword ptr es:[bx+658]
	les	bx,dword ptr es:[bx+10]
	push	word ptr es:[bx+2]
	push	word ptr es:[bx]
	call	far ptr @$bdele$qnv
	add	sp,4
   ;	
   ;	        farfree(sounds[var_2]->voc->seq);
   ;	
	mov	ax,word ptr [bp-2]
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	les	bx,dword ptr es:[bx+658]
	les	bx,dword ptr es:[bx+10]
	push	word ptr es:[bx+6]
	push	word ptr es:[bx+4]
	call	far ptr _farfree
	add	sp,4
   ;	
   ;	        delete sounds[var_2]->voc;
   ;	
	mov	ax,word ptr [bp-2]
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	les	bx,dword ptr es:[bx+658]
	push	word ptr es:[bx+12]
	push	word ptr es:[bx+10]
	jmp	short @11@338
@11@282:
   ;	
   ;	    } else if (sounds[var_2]->pcs != 0) {
   ;	
	mov	ax,word ptr [bp-2]
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	les	bx,dword ptr es:[bx+658]
	mov	ax,word ptr es:[bx+6]
	or	ax,word ptr es:[bx+8]
	je	short @11@366
   ;	
   ;	        delete sounds[var_2]->pcs->name;
   ;	
	mov	ax,word ptr [bp-2]
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	les	bx,dword ptr es:[bx+658]
	les	bx,dword ptr es:[bx+6]
	push	word ptr es:[bx+2]
	push	word ptr es:[bx]
	call	far ptr @$bdele$qnv
	add	sp,4
   ;	
   ;	        delete sounds[var_2]->pcs->freqs;
   ;	
	mov	ax,word ptr [bp-2]
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	les	bx,dword ptr es:[bx+658]
	les	bx,dword ptr es:[bx+6]
	push	word ptr es:[bx+6]
	push	word ptr es:[bx+4]
	call	far ptr @$bdele$qnv
	add	sp,4
   ;	
   ;	        delete sounds[var_2]->pcs;
   ;	
	mov	ax,word ptr [bp-2]
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	les	bx,dword ptr es:[bx+658]
	push	word ptr es:[bx+8]
	push	word ptr es:[bx+6]
@11@338:
	call	far ptr @$bdele$qnv
	add	sp,4
@11@366:
   ;	
   ;	    }
   ;	    delete sounds[var_2];
   ;	
	mov	ax,word ptr [bp-2]
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	push	word ptr es:[bx+660]
	push	word ptr es:[bx+658]
	call	far ptr @$bdele$qnv
	add	sp,4
   ;	
   ;	    for (var_4 = var_2 + 1; var_4 < field_39; ++var_4)
   ;	
	mov	ax,word ptr [bp-2]
	inc	ax
	mov	word ptr [bp-4],ax
	jmp	short @11@450
@11@394:
   ;	
   ;	        sounds[var_4 - 1] = sounds[var_4];
   ;	
	mov	ax,word ptr [bp-4]
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	mov	ax,word ptr es:[bx+660]
	mov	dx,word ptr es:[bx+658]
	mov	bx,word ptr [bp-4]
	dec	bx
	shl	bx,2
	les	si,dword ptr [bp+6]
	add	si,bx
	mov	word ptr es:[si+660],ax
	mov	word ptr es:[si+658],dx
	inc	word ptr [bp-4]
@11@450:
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+57]
	mov	ah,0
	cmp	ax,word ptr [bp-4]
	jg	short @11@394
   ;	
   ;	    field_39--;
   ;	
	les	bx,dword ptr [bp+6]
	dec	byte ptr es:[bx+57]
@11@506:
   ;	
   ;	}
   ;	
	pop	si
	leave	
	ret	
@game_manager@remove_sound$qnuc	endp
   ;	
   ;	void game_manager::define_sound(uchar far *src, uchar)
   ;	
	assume	cs:GAMEMGR_TEXT
@game_manager@define_sound$qnucuc	proc	far
	enter	4,0
   ;	
   ;	{
   ;	    gm_sound far *snd;
   ;	
   ;	    if (field_39 == 0x27)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+57],39
	jne	short @12@86
   ;	
   ;	        terminate((uchar far *)"Sound storage full.", (uchar far *)0);
   ;	
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+34
	call	far ptr @terminate$qnuct1
	add	sp,8
@12@86:
   ;	
   ;	    snd = (gm_sound far *)new gm_sound;
   ;	
	push	14
	call	far ptr @$bnew$qui
	pop	cx
	mov	word ptr [bp-2],dx
	mov	word ptr [bp-4],ax
   ;	
   ;	    snd->name = src;
   ;	
	les	bx,dword ptr [bp-4]
	mov	eax,dword ptr [bp+10]
	mov	dword ptr es:[bx],eax
   ;	
   ;	    if (sb_present != 0)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+6],0
	je	short @12@142
   ;	
   ;	        snd->voc = load_voc(src);
   ;	
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @game_manager@load_voc$qnuc
	add	sp,8
	les	bx,dword ptr [bp-4]
	mov	word ptr es:[bx+12],dx
	mov	word ptr es:[bx+10],ax
	jmp	short @12@170
@12@142:
   ;	
   ;	    else
   ;	        snd->pcs = load_pcs(src);
   ;	
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @game_manager@load_pcs$qnuc
	add	sp,8
	les	bx,dword ptr [bp-4]
	mov	word ptr es:[bx+8],dx
	mov	word ptr es:[bx+6],ax
@12@170:
   ;	
   ;	    sounds[field_39++] = snd;
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+57]
	inc	byte ptr es:[bx+57]
	mov	ah,0
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	mov	ax,word ptr [bp-2]
	mov	dx,word ptr [bp-4]
	mov	word ptr es:[bx+660],ax
	mov	word ptr es:[bx+658],dx
   ;	
   ;	}
   ;	
	leave	
	ret	
@game_manager@define_sound$qnucuc	endp
   ;	
   ;	gm_sound far *game_manager::get_sound(uchar far *s2)
   ;	
	assume	cs:GAMEMGR_TEXT
@game_manager@get_sound$qnuc	proc	far
	enter	2,0
   ;	
   ;	{
   ;	    int var_2;
   ;	
   ;	    for (var_2 = 0; var_2 < field_39; ++var_2) {
   ;	
	mov	word ptr [bp-2],0
	jmp	short @13@142
@13@58:
   ;	
   ;	        if (strcmp(sounds[var_2]->name, s2) == 0)
   ;	
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	mov	ax,word ptr [bp-2]
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	les	bx,dword ptr es:[bx+658]
	push	word ptr es:[bx+2]
	push	word ptr es:[bx]
	call	far ptr _strcmp
	add	sp,8
	or	ax,ax
	jne	short @13@114
   ;	
   ;	            return sounds[var_2];
   ;	
	mov	ax,word ptr [bp-2]
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	mov	dx,word ptr es:[bx+660]
	mov	ax,word ptr es:[bx+658]
	jmp	short @13@198
@13@114:
	inc	word ptr [bp-2]
@13@142:
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+57]
	mov	ah,0
	cmp	ax,word ptr [bp-2]
	jg	short @13@58
   ;	
   ;	    }
   ;	    terminate((uchar far *)"Snd not in storage.", s2);
   ;	
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	push	ds
	push	offset DGROUP:s@+54
	call	far ptr @terminate$qnuct1
	add	sp,8
   ;	
   ;	    return 0;
   ;	
	xor	dx,dx
	xor	ax,ax
@13@198:
   ;	
   ;	}
   ;	
	leave	
	ret	
@game_manager@get_sound$qnuc	endp
   ;	
   ;	void game_manager::play_sound_file(uchar far *src)
   ;	
	assume	cs:GAMEMGR_TEXT
@game_manager@play_sound_file$qnuc	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (field_1C != 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+28],0
	je	short @14@170
   ;	
   ;	        if (sb_present != 0)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+6],0
	je	short @14@114
   ;	
   ;	            play_voc_file(src);
   ;	
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @game_manager@play_voc_file$qnuc
	jmp	short @14@142
@14@114:
   ;	
   ;	        else
   ;	            play_pcs_file(src);
   ;	
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @game_manager@play_pcs_file$qnuc
@14@142:
	add	sp,8
@14@170:
   ;	
   ;	    }
   ;	}
   ;	
	pop	bp
	ret	
@game_manager@play_sound_file$qnuc	endp
   ;	
   ;	void game_manager::play_sound(uchar far *s2, uchar prio)
   ;	
	assume	cs:GAMEMGR_TEXT
@game_manager@play_sound$qnucuc	proc	far
	enter	4,0
   ;	
   ;	{
   ;	    gm_sound far *snd;
   ;	
   ;	    if (cur_sound == 0) {
   ;	
	cmp	dword ptr DGROUP:_cur_sound,large 0
	je short	@@202
	jmp	@15@198
@@202:
   ;	
   ;	        snd = get_sound(s2);
   ;	
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @game_manager@get_sound$qnuc
	add	sp,8
	mov	word ptr [bp-2],dx
	mov	word ptr [bp-4],ax
   ;	
   ;	        if (sb_present != 0 || snd->pcs != 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+6],0
	jne	short @15@114
	les	bx,dword ptr [bp-4]
	cmp	dword ptr es:[bx+6],large 0
	jne short	@@203
	jmp	@15@338
@@203:
@15@114:
   ;	
   ;	            cur_sound = snd;
   ;	
	mov	eax,dword ptr [bp-4]
	mov	dword ptr DGROUP:_cur_sound,eax
   ;	
   ;	            ((cur_sound_t far *)cur_sound)->prio = prio;
   ;	
	les	bx,dword ptr DGROUP:_cur_sound
	mov	al,byte ptr [bp+14]
	mov	byte ptr es:[bx+4],al
   ;	
   ;	            ((cur_sound_t far *)cur_sound)->index = 0;
   ;	
	les	bx,dword ptr DGROUP:_cur_sound
	mov	byte ptr es:[bx+5],0
   ;	
   ;	            if (sb_present != 0)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+6],0
	jne short	@@204
	jmp	@15@338
@@204:
@15@142:
   ;	
   ;	                play_voc((uchar far *)((gm_sound far *)cur_sound)->voc->seq);
   ;	
	les	bx,dword ptr DGROUP:_cur_sound
	les	bx,dword ptr es:[bx+10]
	push	word ptr es:[bx+6]
	push	word ptr es:[bx+4]
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @game_manager@play_voc$qnuc
	add	sp,8
	jmp	short @15@338
   ;	
   ;	        }
   ;	    } else {
   ;	
	jmp	short @15@338
@15@198:
   ;	
   ;	        if (((cur_sound_t far *)cur_sound)->prio > prio)
   ;	
	les	bx,dword ptr DGROUP:_cur_sound
	mov	al,byte ptr es:[bx+4]
	cmp	al,byte ptr [bp+14]
	ja	short @15@338
   ;	
   ;	            return;
   ;	        snd = get_sound(s2);
   ;	
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @game_manager@get_sound$qnuc
	add	sp,8
	mov	word ptr [bp-2],dx
	mov	word ptr [bp-4],ax
   ;	
   ;	        if (sb_present != 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+6],0
	je	short @15@282
   ;	
   ;	            cur_sound = snd;
   ;	
	mov	eax,dword ptr [bp-4]
	mov	dword ptr DGROUP:_cur_sound,eax
   ;	
   ;	            ((cur_sound_t far *)cur_sound)->prio = prio;
   ;	
	les	bx,dword ptr DGROUP:_cur_sound
	mov	al,byte ptr [bp+14]
	mov	byte ptr es:[bx+4],al
	jmp	short @15@142
@15@282:
   ;	
   ;	            play_voc((uchar far *)((gm_sound far *)cur_sound)->voc->seq);
   ;	        } else if (snd->pcs != 0) {
   ;	
	les	bx,dword ptr [bp-4]
	cmp	dword ptr es:[bx+6],large 0
	je	short @15@338
   ;	
   ;	            cur_sound = snd;
   ;	
	mov	eax,dword ptr [bp-4]
	mov	dword ptr DGROUP:_cur_sound,eax
   ;	
   ;	            ((cur_sound_t far *)cur_sound)->prio = prio;
   ;	
	les	bx,dword ptr DGROUP:_cur_sound
	mov	al,byte ptr [bp+14]
	mov	byte ptr es:[bx+4],al
   ;	
   ;	            ((cur_sound_t far *)cur_sound)->index = 0;
   ;	
	les	bx,dword ptr DGROUP:_cur_sound
	mov	byte ptr es:[bx+5],0
@15@338:
   ;	
   ;	        }
   ;	    }
   ;	}
   ;	
	leave	
	ret	
@game_manager@play_sound$qnucuc	endp
   ;	
   ;	void game_manager::reset_sound()
   ;	
	assume	cs:GAMEMGR_TEXT
@game_manager@reset_sound$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (sb_present != 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+6],0
	je	short @16@114
   ;	
   ;	        stop_song();
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @game_manager@stop_song$qv
	add	sp,4
   ;	
   ;	        if (vocplaying() != 0)
   ;	
	call	far ptr _vocplaying
	or	ax,ax
	je	short @16@114
   ;	
   ;	            stopvoc();
   ;	
	call	far ptr _stopvoc
@16@114:
   ;	
   ;	    }
   ;	    cur_sound = 0;
   ;	
	mov	dword ptr DGROUP:_cur_sound,large 0
   ;	
   ;	    nosound();
   ;	
	call	far ptr _nosound
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@game_manager@reset_sound$qv	endp
   ;	
   ;	void game_manager::play_song(uchar far *src)
   ;	
	assume	cs:GAMEMGR_TEXT
@game_manager@play_song$qnuc	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (sb_present != 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+6],0
	je	short @17@170
   ;	
   ;	        stop_song();
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @game_manager@stop_song$qv
	add	sp,4
   ;	
   ;	        field_1E = getsequence(src);
   ;	
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	call	far ptr _getsequence
	add	sp,4
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+32],dx
	mov	word ptr es:[bx+30],ax
   ;	
   ;	        if (field_1E == 0)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	dword ptr es:[bx+30],large 0
	jne	short @17@114
   ;	
   ;	            terminate((uchar far *)"Can't find song ", src);
   ;	
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	push	ds
	push	offset DGROUP:s@+74
	call	far ptr @terminate$qnuct1
	add	sp,8
@17@114:
   ;	
   ;	        if (field_1C != 0)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+28],0
	je	short @17@170
   ;	
   ;	            playcmfblock(field_1E);
   ;	
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+32]
	push	word ptr es:[bx+30]
	call	far ptr _playcmfblock
	add	sp,4
@17@170:
   ;	
   ;	    }
   ;	}
   ;	
	pop	bp
	ret	
@game_manager@play_song$qnuc	endp
   ;	
   ;	void game_manager::stop_song()
   ;	
	assume	cs:GAMEMGR_TEXT
@game_manager@stop_song$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (sb_present != 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+6],0
	je	short @18@114
   ;	
   ;	        if (field_1E != 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	dword ptr es:[bx+30],large 0
	je	short @18@114
   ;	
   ;	            stopsequence();
   ;	
	call	far ptr _stopsequence
   ;	
   ;	            farfree(field_1E);
   ;	
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+32]
	push	word ptr es:[bx+30]
	call	far ptr _farfree
	add	sp,4
   ;	
   ;	            field_1E = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	dword ptr es:[bx+30],large 0
@18@114:
   ;	
   ;	        }
   ;	    }
   ;	}
   ;	
	pop	bp
	ret	
@game_manager@stop_song$qv	endp
   ;	
   ;	void game_manager::pause_song()
   ;	
	assume	cs:GAMEMGR_TEXT
@game_manager@pause_song$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (sb_present != 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+6],0
	je	short @19@114
   ;	
   ;	        if (field_1E != 0)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	dword ptr es:[bx+30],large 0
	je	short @19@114
   ;	
   ;	            stopsequence();
   ;	
	call	far ptr _stopsequence
@19@114:
   ;	
   ;	    }
   ;	}
   ;	
	pop	bp
	ret	
@game_manager@pause_song$qv	endp
   ;	
   ;	void game_manager::continue_song()
   ;	
	assume	cs:GAMEMGR_TEXT
@game_manager@continue_song$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (sb_present != 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+6],0
	je	short @20@114
   ;	
   ;	        if (field_1E != 0)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	dword ptr es:[bx+30],large 0
	je	short @20@114
   ;	
   ;	            continuesequence();
   ;	
	call	far ptr _continuesequence
@20@114:
   ;	
   ;	    }
   ;	}
   ;	
	pop	bp
	ret	
@game_manager@continue_song$qv	endp
   ;	
   ;	void game_manager::play_voc(uchar far *arg_4)
   ;	
	assume	cs:GAMEMGR_TEXT
@game_manager@play_voc$qnuc	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (field_1C != 0 && sb_present != 0)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+28],0
	je	short @21@114
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+6],0
	je	short @21@114
   ;	
   ;	        playvocblock((void far *)arg_4);
   ;	
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	call	far ptr _playvocblock
	add	sp,4
@21@114:
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@game_manager@play_voc$qnuc	endp
   ;	
   ;	void game_manager::play_voc_file(uchar far *src)
   ;	
	assume	cs:GAMEMGR_TEXT
@game_manager@play_voc_file$qnuc	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (sb_present != 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+6],0
	je	short @22@170
   ;	
   ;	        if (vocplaying() != 0)
   ;	
	call	far ptr _vocplaying
	or	ax,ax
	je	short @22@114
   ;	
   ;	            stopvoc();
   ;	
	call	far ptr _stopvoc
@22@114:
   ;	
   ;	        strcpy(_tmp, src);
   ;	
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _strcpy
	add	sp,8
   ;	
   ;	        strcat(_tmp, ".voc");
   ;	
	push	ds
	push	offset DGROUP:s@+91
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _strcat
	add	sp,8
   ;	
   ;	        playvocfile(_tmp);
   ;	
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _playvocfile
	add	sp,4
@22@142:
   ;	
   ;	        while (vocplaying() != 0)
   ;	
	call	far ptr _vocplaying
	or	ax,ax
	jne	short @22@142
@22@170:
   ;	
   ;	            ;
   ;	    }
   ;	}
   ;	
	pop	bp
	ret	
@game_manager@play_voc_file$qnuc	endp
   ;	
   ;	uchar game_manager::voc_playing()
   ;	
	assume	cs:GAMEMGR_TEXT
@game_manager@voc_playing$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (sb_present != 0)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+6],0
	je	short @23@86
   ;	
   ;	        return vocplaying();
   ;	
	call	far ptr _vocplaying
	jmp	short @23@114
@23@86:
   ;	
   ;	    return 0;
   ;	
	mov	al,0
@23@114:
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@game_manager@voc_playing$qv	endp
   ;	
   ;	voc_block far *game_manager::load_voc(uchar far *src)
   ;	
	assume	cs:GAMEMGR_TEXT
@game_manager@load_voc$qnuc	proc	far
	enter	8,0
   ;	
   ;	{
   ;	    voc_block far *block;
   ;	    void far *var_8;
   ;	
   ;	    strcpy(_tmp, src);
   ;	
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _strcpy
	add	sp,8
   ;	
   ;	    strcat(_tmp, ".voc");
   ;	
	push	ds
	push	offset DGROUP:s@+96
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _strcat
	add	sp,8
   ;	
   ;	    block = (voc_block far *)new voc_block;
   ;	
	push	8
	call	far ptr @$bnew$qui
	pop	cx
	mov	word ptr [bp-2],dx
	mov	word ptr [bp-4],ax
   ;	
   ;	    var_8 = getsequence(_tmp);
   ;	
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _getsequence
	add	sp,4
	mov	word ptr [bp-6],dx
	mov	word ptr [bp-8],ax
   ;	
   ;	    if (var_8 == 0)
   ;	
	cmp	dword ptr [bp-8],large 0
	jne	short @24@86
   ;	
   ;	        terminate((uchar far *)"Voc not found: ", _tmp);
   ;	
	push	ds
	push	offset DGROUP:__tmp
	push	ds
	push	offset DGROUP:s@+101
	call	far ptr @terminate$qnuct1
	add	sp,8
@24@86:
   ;	
   ;	    block->name = strdup(_tmp);
   ;	
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _strdup
	add	sp,4
	les	bx,dword ptr [bp-4]
	mov	word ptr es:[bx+2],dx
	mov	word ptr es:[bx],ax
   ;	
   ;	    block->seq = var_8;
   ;	
	les	bx,dword ptr [bp-4]
	mov	eax,dword ptr [bp-8]
	mov	dword ptr es:[bx+4],eax
   ;	
   ;	    return block;
   ;	
	mov	dx,word ptr [bp-2]
	mov	ax,word ptr [bp-4]
   ;	
   ;	}
   ;	
	leave	
	ret	
@game_manager@load_voc$qnuc	endp
   ;	
   ;	pcs_note_seq far *game_manager::load_pcs(uchar far *src)
   ;	
	assume	cs:GAMEMGR_TEXT
@game_manager@load_pcs$qnuc	proc	far
	enter	6,0
   ;	
   ;	{
   ;	    pcs_note_seq far *block;
   ;	    int len;
   ;	
   ;	    strcpy(_tmp, src);
   ;	
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _strcpy
	add	sp,8
   ;	
   ;	    strcat(_tmp, ".pcs");
   ;	
	push	ds
	push	offset DGROUP:s@+117
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _strcat
	add	sp,8
   ;	
   ;	    if ((long)g_open_element(_tmp) == -1L) {
   ;	
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr @g_open_element$qnuc
	push	dx
	push	ax
	pop	eax
	add	sp,4
	cmp	eax,large -1
	jne	short @25@86
   ;	
   ;	        g_close_element();
   ;	
	call	far ptr @g_close_element$qv
	jmp	@25@198
@25@86:
   ;	
   ;	        return 0;
   ;	    }
   ;	    block = (pcs_note_seq far *)new pcs_note_seq;
   ;	
	push	10
	call	far ptr @$bnew$qui
	pop	cx
	mov	word ptr [bp-2],dx
	mov	word ptr [bp-4],ax
   ;	
   ;	    block->name = strdup(_tmp);
   ;	
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _strdup
	add	sp,4
	les	bx,dword ptr [bp-4]
	mov	word ptr es:[bx+2],dx
	mov	word ptr es:[bx],ax
   ;	
   ;	    if (g_element_read(&block->count, 2) != 2)
   ;	
	push	2
	mov	ax,word ptr [bp-4]
	add	ax,8
	push	word ptr [bp-2]
	push	ax
	call	far ptr @g_element_read$qnvui
	push	dx
	push	ax
	pop	eax
	add	sp,6
	cmp	eax,large 2
	jne	short @25@170
   ;	
   ;	        goto fail;
   ;	    block->freqs = (word far *)new char[block->count * 2];
   ;	
	les	bx,dword ptr [bp-4]
	mov	ax,word ptr es:[bx+8]
	shl	ax,1
	push	ax
	call	far ptr @$bnew$qui
	pop	cx
	les	bx,dword ptr [bp-4]
	mov	word ptr es:[bx+6],dx
	mov	word ptr es:[bx+4],ax
   ;	
   ;	    len = block->count * 2;
   ;	
	les	bx,dword ptr [bp-4]
	mov	ax,word ptr es:[bx+8]
	shl	ax,1
	mov	word ptr [bp-6],ax
   ;	
   ;	    if (g_element_read(block->freqs, len) != len)
   ;	
	push	word ptr [bp-6]
	les	bx,dword ptr [bp-4]
	push	word ptr es:[bx+6]
	push	word ptr es:[bx+4]
	call	far ptr @g_element_read$qnvui
	push	dx
	push	ax
	pop	eax
	add	sp,6
	movsx	edx,word ptr [bp-6]
	cmp	eax,edx
	jne	short @25@170
   ;	
   ;	        goto fail;
   ;	    g_close_element();
   ;	
	call	far ptr @g_close_element$qv
   ;	
   ;	    return block;
   ;	
	mov	dx,word ptr [bp-2]
	mov	ax,word ptr [bp-4]
	jmp	short @25@226
@25@170:
   ;	
   ;	fail:
   ;	    g_close_element();
   ;	
	call	far ptr @g_close_element$qv
   ;	
   ;	    terminate((uchar far *)"Error loading pcs:", src);
   ;	
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	push	ds
	push	offset DGROUP:s@+122
	call	far ptr @terminate$qnuct1
	add	sp,8
@25@198:
   ;	
   ;	    return 0;
   ;	
	xor	dx,dx
	xor	ax,ax
@25@226:
   ;	
   ;	}
   ;	
	leave	
	ret	
@game_manager@load_pcs$qnuc	endp
   ;	
   ;	void game_manager::play_pcs_file(uchar far *src)
   ;	
	assume	cs:GAMEMGR_TEXT
@game_manager@play_pcs_file$qnuc	proc	far
	enter	8,0
   ;	
   ;	{
   ;	    pcs_note_seq far *block;
   ;	    cur_sound_t far *var_8;
   ;	
   ;	    block = load_pcs(src);
   ;	
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @game_manager@load_pcs$qnuc
	add	sp,8
	mov	word ptr [bp-2],dx
	mov	word ptr [bp-4],ax
   ;	
   ;	    if (block == 0)
   ;	
	cmp	dword ptr [bp-4],large 0
	je	short @26@114
   ;	
   ;	        return;
   ;	    var_8 = (cur_sound_t far *)new cur_sound_t;
   ;	
	push	14
	call	far ptr @$bnew$qui
	pop	cx
	mov	word ptr [bp-6],dx
	mov	word ptr [bp-8],ax
   ;	
   ;	    var_8->seq = block;
   ;	
	les	bx,dword ptr [bp-8]
	mov	eax,dword ptr [bp-4]
	mov	dword ptr es:[bx+6],eax
   ;	
   ;	    cur_sound = var_8;
   ;	
	mov	eax,dword ptr [bp-8]
	mov	dword ptr DGROUP:_cur_sound,eax
   ;	
   ;	    ((cur_sound_t far *)cur_sound)->index = 0;
   ;	
	les	bx,dword ptr DGROUP:_cur_sound
	mov	byte ptr es:[bx+5],0
   ;	
   ;	    if (cur_sound == 0) {
   ;	
	cmp	dword ptr DGROUP:_cur_sound,large 0
	jne	short @26@114
   ;	
   ;	        delete block->name;
   ;	
	les	bx,dword ptr [bp-4]
	push	word ptr es:[bx+2]
	push	word ptr es:[bx]
	call	far ptr @$bdele$qnv
	add	sp,4
   ;	
   ;	        delete block->freqs;
   ;	
	les	bx,dword ptr [bp-4]
	push	word ptr es:[bx+6]
	push	word ptr es:[bx+4]
	call	far ptr @$bdele$qnv
	add	sp,4
   ;	
   ;	        delete block;
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @$bdele$qnv
	add	sp,4
   ;	
   ;	        delete var_8;
   ;	
	push	word ptr [bp-6]
	push	word ptr [bp-8]
	call	far ptr @$bdele$qnv
	add	sp,4
@26@114:
   ;	
   ;	    }
   ;	}
   ;	
	leave	
	ret	
@game_manager@play_pcs_file$qnuc	endp
   ;	
   ;	void far *game_manager::get_loop(uchar far *s2)
   ;	
	assume	cs:GAMEMGR_TEXT
@game_manager@get_loop$qnuc	proc	far
	enter	2,0
   ;	
   ;	{
   ;	    int var_2;
   ;	
   ;	    for (var_2 = 0; var_2 < field_38; ++var_2) {
   ;	
	mov	word ptr [bp-2],0
	jmp	short @27@142
@27@58:
   ;	
   ;	        if (strcmp(loops[var_2]->name, s2) == 0)
   ;	
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	mov	ax,word ptr [bp-2]
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	les	bx,dword ptr es:[bx+58]
	push	word ptr es:[bx+4]
	push	word ptr es:[bx+2]
	call	far ptr _strcmp
	add	sp,8
	or	ax,ax
	jne	short @27@114
   ;	
   ;	            return loops[var_2];
   ;	
	mov	ax,word ptr [bp-2]
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	mov	dx,word ptr es:[bx+60]
	mov	ax,word ptr es:[bx+58]
	jmp	short @27@198
@27@114:
	inc	word ptr [bp-2]
@27@142:
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+56]
	mov	ah,0
	cmp	ax,word ptr [bp-2]
	jg	short @27@58
   ;	
   ;	    }
   ;	    return 0;
   ;	
	xor	dx,dx
	xor	ax,ax
@27@198:
   ;	
   ;	}
   ;	
	leave	
	ret	
@game_manager@get_loop$qnuc	endp
   ;	
   ;	void far *game_manager::load_loop(uchar far *src)
   ;	
	assume	cs:GAMEMGR_TEXT
@game_manager@load_loop$qnuc	proc	far
	enter	10,0
	push	si
   ;	
   ;	{
   ;	    gm_loop far *buf;
   ;	    byte var_5, var_6;
   ;	    int len, var_2;
   ;	
   ;	    if (field_38 == 0x96)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+56],150
	jne	short @28@86
   ;	
   ;	        terminate((uchar far *)"Loop storage full!", (uchar far *)0);
   ;	
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+141
	call	far ptr @terminate$qnuct1
	add	sp,8
@28@86:
   ;	
   ;	    buf = (gm_loop far *)new gm_loop;
   ;	
	push	70
	call	far ptr @$bnew$qui
	pop	cx
	mov	word ptr [bp-2],dx
	mov	word ptr [bp-4],ax
   ;	
   ;	    if (buf == 0)
   ;	
	cmp	dword ptr [bp-4],large 0
	jne	short @28@142
   ;	
   ;	        no_heap("Adding a loop to game_manager.");
   ;	
	push	ds
	push	offset DGROUP:s@+160
	call	far ptr @no_heap$qnuc
	add	sp,4
@28@142:
   ;	
   ;	    buf->name = strdup(src);
   ;	
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	call	far ptr _strdup
	add	sp,4
	les	bx,dword ptr [bp-4]
	mov	word ptr es:[bx+4],dx
	mov	word ptr es:[bx+2],ax
   ;	
   ;	    strcpy(_tmp, src);
   ;	
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _strcpy
	add	sp,8
   ;	
   ;	    strupr(_tmp);
   ;	
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _strupr
	add	sp,4
   ;	
   ;	    if ((long)g_open_element(_tmp) == -1L)
   ;	
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr @g_open_element$qnuc
	push	dx
	push	ax
	pop	eax
	add	sp,4
	cmp	eax,large -1
	jne	short @28@198
	jmp	@28@618
@28@198:
   ;	
   ;	        return 0;
   ;	    if (g_element_read(buf, 1) != 1)
   ;	
	push	1
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @g_element_read$qnvui
	push	dx
	push	ax
	pop	eax
	add	sp,6
	cmp	eax,large 1
	je	short @28@254
   ;	
   ;	        return 0;
   ;	
	jmp	@28@618
@28@254:
   ;	
   ;	    for (var_2 = 0; var_2 < buf->count; ++var_2) {
   ;	
	mov	word ptr [bp-10],0
	jmp	@28@534
@28@282:
   ;	
   ;	        buf->frames[var_2] = (gm_frame far *)new gm_frame;
   ;	
	push	8
	call	far ptr @$bnew$qui
	pop	cx
	mov	bx,word ptr [bp-10]
	shl	bx,2
	les	si,dword ptr [bp-4]
	add	si,bx
	mov	word ptr es:[si+8],dx
	mov	word ptr es:[si+6],ax
   ;	
   ;	        if (buf->frames[var_2] == 0)
   ;	
	mov	ax,word ptr [bp-10]
	shl	ax,2
	les	bx,dword ptr [bp-4]
	add	bx,ax
	mov	ax,word ptr es:[bx+6]
	or	ax,word ptr es:[bx+8]
	jne short	@@205
	jmp	@28@590
@@205:
   ;	
   ;	            goto oom;
   ;	        if (g_element_read(&var_5, 1) != 1)
   ;	
	push	1
	push	ss
	lea	ax,word ptr [bp-5]
	push	ax
	call	far ptr @g_element_read$qnvui
	push	dx
	push	ax
	pop	eax
	add	sp,6
	cmp	eax,large 1
	je	short @28@366
   ;	
   ;	            return 0;
   ;	
	jmp	@28@618
@28@366:
   ;	
   ;	        if (g_element_read(&var_6, 1) != 1)
   ;	
	push	1
	push	ss
	lea	ax,word ptr [bp-6]
	push	ax
	call	far ptr @g_element_read$qnvui
	push	dx
	push	ax
	pop	eax
	add	sp,6
	cmp	eax,large 1
	je	short @28@422
   ;	
   ;	            return 0;
   ;	
	jmp	@28@618
@28@422:
   ;	
   ;	        buf->frames[var_2]->w = var_5;
   ;	
	mov	al,byte ptr [bp-5]
	mov	ah,0
	mov	dx,word ptr [bp-10]
	shl	dx,2
	les	bx,dword ptr [bp-4]
	add	bx,dx
	les	bx,dword ptr es:[bx+6]
	mov	word ptr es:[bx+6],ax
   ;	
   ;	        buf->frames[var_2]->h = var_6;
   ;	
	mov	al,byte ptr [bp-6]
	mov	ah,0
	mov	dx,word ptr [bp-10]
	shl	dx,2
	les	bx,dword ptr [bp-4]
	add	bx,dx
	les	bx,dword ptr es:[bx+6]
	mov	word ptr es:[bx+4],ax
   ;	
   ;	        len = var_5 * var_6;
   ;	
	mov	al,byte ptr [bp-5]
	mov	ah,0
	mov	dl,byte ptr [bp-6]
	mov	dh,0
	imul	dx
	mov	word ptr [bp-8],ax
   ;	
   ;	        field_04 += len;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp-8]
	add	word ptr es:[bx+4],ax
   ;	
   ;	        buf->frames[var_2]->data = (void far *)new char[len];
   ;	
	push	word ptr [bp-8]
	call	far ptr @$bnew$qui
	pop	cx
	mov	bx,word ptr [bp-10]
	shl	bx,2
	les	si,dword ptr [bp-4]
	add	si,bx
	les	bx,dword ptr es:[si+6]
	mov	word ptr es:[bx+2],dx
	mov	word ptr es:[bx],ax
   ;	
   ;	        if (buf->frames[var_2]->data == 0)
   ;	
	mov	ax,word ptr [bp-10]
	shl	ax,2
	les	bx,dword ptr [bp-4]
	add	bx,ax
	les	bx,dword ptr es:[bx+6]
	mov	ax,word ptr es:[bx]
	or	ax,word ptr es:[bx+2]
	je	short @28@590
   ;	
   ;	            goto oom;
   ;	        if (g_element_read(buf->frames[var_2]->data, len) != len)
   ;	
	push	word ptr [bp-8]
	mov	ax,word ptr [bp-10]
	shl	ax,2
	les	bx,dword ptr [bp-4]
	add	bx,ax
	les	bx,dword ptr es:[bx+6]
	push	word ptr es:[bx+2]
	push	word ptr es:[bx]
	call	far ptr @g_element_read$qnvui
	push	dx
	push	ax
	pop	eax
	add	sp,6
	movsx	edx,word ptr [bp-8]
	cmp	eax,edx
	je	short @28@506
   ;	
   ;	            return 0;
   ;	
	jmp	short @28@618
@28@506:
	inc	word ptr [bp-10]
@28@534:
	les	bx,dword ptr [bp-4]
	mov	al,byte ptr es:[bx]
	mov	ah,0
	cmp	ax,word ptr [bp-10]
	jle short	@@206
	jmp	@28@282
@@206:
   ;	
   ;	    }
   ;	    loops[field_38++] = buf;
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+56]
	inc	byte ptr es:[bx+56]
	mov	ah,0
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	mov	ax,word ptr [bp-2]
	mov	dx,word ptr [bp-4]
	mov	word ptr es:[bx+60],ax
	mov	word ptr es:[bx+58],dx
   ;	
   ;	    g_close_element();
   ;	
	call	far ptr @g_close_element$qv
   ;	
   ;	    return buf;
   ;	
	mov	dx,word ptr [bp-2]
	mov	ax,word ptr [bp-4]
	jmp	short @28@646
@28@590:
   ;	
   ;	oom:
   ;	    no_heap("Loading loop.");
   ;	
	push	ds
	push	offset DGROUP:s@+191
	call	far ptr @no_heap$qnuc
	add	sp,4
   ;	
   ;	    g_close_element();
   ;	
	call	far ptr @g_close_element$qv
   ;	
   ;	    return 0;
   ;	
@28@618:
	xor	dx,dx
	xor	ax,ax
@28@646:
   ;	
   ;	}
   ;	
	pop	si
	leave	
	ret	
@game_manager@load_loop$qnuc	endp
   ;	
   ;	void game_manager::remove_loop(uchar far *s2)
   ;	
	assume	cs:GAMEMGR_TEXT
@game_manager@remove_loop$qnuc	proc	far
	enter	8,0
   ;	
   ;	{
   ;	    gm_loop far *block;
   ;	    int var_2, var_4;
   ;	
   ;	    for (var_2 = 0; var_2 < field_38; ++var_2) {
   ;	
	mov	word ptr [bp-6],0
	jmp	short @29@114
@29@58:
   ;	
   ;	        if (strcmp(loops[var_2]->name, s2) == 0)
   ;	
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	mov	ax,word ptr [bp-6]
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	les	bx,dword ptr es:[bx+58]
	push	word ptr es:[bx+4]
	push	word ptr es:[bx+2]
	call	far ptr _strcmp
	add	sp,8
	or	ax,ax
	je	short @29@142
	inc	word ptr [bp-6]
@29@114:
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+56]
	mov	ah,0
	cmp	ax,word ptr [bp-6]
	jg	short @29@58
@29@142:
   ;	
   ;	            break;
   ;	    }
   ;	    if (var_2 == field_38)
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+56]
	mov	ah,0
	cmp	ax,word ptr [bp-6]
	jne short	@@207
	jmp	@29@310
@@207:
   ;	
   ;	        return;
   ;	    var_4 = var_2;
   ;	
	mov	ax,word ptr [bp-6]
	mov	word ptr [bp-8],ax
   ;	
   ;	    block = loops[var_4];
   ;	
	mov	ax,word ptr [bp-8]
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	mov	ax,word ptr es:[bx+60]
	mov	dx,word ptr es:[bx+58]
	mov	word ptr [bp-2],ax
	mov	word ptr [bp-4],dx
   ;	
   ;	    delete block->name;
   ;	
	les	bx,dword ptr [bp-4]
	push	word ptr es:[bx+4]
	push	word ptr es:[bx+2]
	call	far ptr @$bdele$qnv
	add	sp,4
   ;	
   ;	    for (var_2 = 0; var_2 < block->count; ++var_2) {
   ;	
	mov	word ptr [bp-6],0
	jmp	short @29@254
@29@198:
   ;	
   ;	        delete block->frames[var_2]->data;
   ;	
	mov	ax,word ptr [bp-6]
	shl	ax,2
	les	bx,dword ptr [bp-4]
	add	bx,ax
	les	bx,dword ptr es:[bx+6]
	push	word ptr es:[bx+2]
	push	word ptr es:[bx]
	call	far ptr @$bdele$qnv
	add	sp,4
   ;	
   ;	        delete block->frames[var_2];
   ;	
	mov	ax,word ptr [bp-6]
	shl	ax,2
	les	bx,dword ptr [bp-4]
	add	bx,ax
	push	word ptr es:[bx+8]
	push	word ptr es:[bx+6]
	call	far ptr @$bdele$qnv
	add	sp,4
	inc	word ptr [bp-6]
@29@254:
	les	bx,dword ptr [bp-4]
	mov	al,byte ptr es:[bx]
	mov	ah,0
	cmp	ax,word ptr [bp-6]
	jg	short @29@198
   ;	
   ;	    }
   ;	    delete block;
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @$bdele$qnv
	add	sp,4
   ;	
   ;	    my_movsd(&loops[var_4], &loops[var_4 + 1], field_38 - var_4);
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+56]
	mov	ah,0
	sub	ax,word ptr [bp-8]
	push	ax
	mov	ax,word ptr [bp-8]
	inc	ax
	shl	ax,2
	mov	dx,word ptr [bp+6]
	add	dx,ax
	add	dx,58
	push	word ptr [bp+8]
	push	dx
	mov	ax,word ptr [bp-8]
	shl	ax,2
	mov	dx,word ptr [bp+6]
	add	dx,ax
	add	dx,58
	push	word ptr [bp+8]
	push	dx
	call	far ptr _my_movsd
	add	sp,10
   ;	
   ;	    field_38--;
   ;	
	les	bx,dword ptr [bp+6]
	dec	byte ptr es:[bx+56]
@29@310:
   ;	
   ;	}
   ;	
	leave	
	ret	
@game_manager@remove_loop$qnuc	endp
	?debug	C E9
	?debug	C FA00000000
GAMEMGR_TEXT	ends
_DATA	segment word public use16 'DATA'
s@	label	byte
	db	'RSC file.'
	db	0
	db	'SoundBlaster detected.'
	db	10
	db	0
	db	'Sound storage full.'
	db	0
	db	'Snd not in storage.'
	db	0
	db	'Can'
	db	39
	db	't find song '
	db	0
	db	'.voc'
	db	0
	db	'.voc'
	db	0
	db	'Voc not found: '
	db	0
	db	'.pcs'
	db	0
	db	'Error loading pcs:'
	db	0
	db	'Loop storage full!'
	db	0
	db	'Adding a loop to game_manager.'
	db	0
	db	'Loading loop.'
	db	0
_DATA	ends
GAMEMGR_TEXT	segment byte public use16 'CODE'
GAMEMGR_TEXT	ends
	extrn	@set_external_read$qnv:far
	extrn	@set_external_open$qnv:far
	public	@gm_read$qnvui
	public	@gm_open$qnuc
	public	@pc_sound_doit$qve
	extrn	_ticks18_2:byte
	extrn	_joysticky:far
	extrn	_joystickx:far
	extrn	_joystickupdate:far
	extrn	_vocplaying:far
	extrn	_stopvoc:far
	extrn	_playvocfile:far
	extrn	_playvocblock:far
	extrn	_continuesequence:far
	extrn	_stopsequence:far
	extrn	_playcmfblock:far
	extrn	_getsequence:far
	extrn	_elementread:far
	extrn	_openelement:far
	extrn	_setchannelvolume:far
	extrn	_setvocvolume:far
	extrn	_setfmvolume:far
	extrn	_vochooksetting:far
	extrn	_adlibdetect:far
	extrn	_dspclose:far
	extrn	_dspreset:far
	extrn	_closeworx:far
	extrn	_startresource:far
	extrn	_startworx:far
	extrn	_joystickbutton:far
	extrn	@no_heap$qnuc:far
	extrn	_my_movsd:far
	extrn	@g_close_element$qv:far
	extrn	@g_element_read$qnvui:far
	extrn	@g_open_element$qnuc:far
	extrn	@read_error$qnuc:far
	extrn	@terminate$qnuct1:far
	extrn	_theirhandler:dword
	extrn	_cur_sound:dword
	extrn	__tmp:byte
	extrn	_gr_keys:byte
	extrn	_force_pc_sound:byte
	extrn	_the_game:dword
	public	@game_manager@remove_loop$qnuc
	public	@game_manager@get_loop$qnuc
	public	@game_manager@load_loop$qnuc
	public	@game_manager@play_pcs_file$qnuc
	public	@game_manager@load_pcs$qnuc
	public	@game_manager@load_voc$qnuc
	public	@game_manager@voc_playing$qv
	public	@game_manager@play_voc_file$qnuc
	public	@game_manager@play_voc$qnuc
	public	@game_manager@continue_song$qv
	public	@game_manager@pause_song$qv
	public	@game_manager@stop_song$qv
	public	@game_manager@play_song$qnuc
	public	@game_manager@reset_sound$qv
	public	@game_manager@play_sound$qnucuc
	public	@game_manager@play_sound_file$qnuc
	public	@game_manager@get_sound$qnuc
	public	@game_manager@define_sound$qnucuc
	public	@game_manager@remove_sound$qnuc
	public	@game_manager@turn_sound$quc
	public	@game_manager@reset_player$quc
	public	@game_manager@joy_update$qv
	public	@game_manager@clear_flags$qv
	public	@game_manager@doit$qv
	public	@game_manager@$bdtr$qv
	public	@game_manager@$bctr$qnuc
	extrn	_farfree:far
	extrn	_setvect:far
	extrn	_getvect:far
	extrn	_sound:far
_pokeb	equ	pokeb
_poke	equ	poke
_peekb	equ	peekb
_peek	equ	peek
	extrn	_nosound:far
	extrn	_strupr:far
	extrn	_strdup:far
	extrn	_strcpy:far
	extrn	_strcmp:far
	extrn	_strcat:far
	extrn	_printf:far
	extrn	@$bdele$qnv:far
	extrn	@$bnew$qui:far
_s@	equ	s@
	end
