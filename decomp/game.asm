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
	?debug	V 301h
	?debug	S "game.cpp"
	?debug	C E92074375D0867616D652E637070
	?debug	C E96F72375D09726970746964652E68
	?debug	C E9402079222C2F686F6D652F786F722F696E65727469615F706C61+
	?debug	C 7965722F4243352F494E434C5544455C737464696F+
	?debug	C 2E68
	?debug	C E9402079222C2F686F6D652F786F722F696E65727469615F706C61+
	?debug	C 7965722F4243352F494E434C5544455C5F64656673+
	?debug	C 2E68
	?debug	C E9402079222D2F686F6D652F786F722F696E65727469615F706C61+
	?debug	C 7965722F4243352F494E434C5544455C5F6E66696C+
	?debug	C 652E68
	?debug	C E9402079222C2F686F6D652F786F722F696E65727469615F706C61+
	?debug	C 7965722F4243352F494E434C5544455C5F6E756C6C+
	?debug	C 2E68
	?debug	C E9402079222D2F686F6D652F786F722F696E65727469615F706C61+
	?debug	C 7965722F4243352F494E434C5544455C737472696E+
	?debug	C 672E68
	?debug	C E9402079222D2F686F6D652F786F722F696E65727469615F706C61+
	?debug	C 7965722F4243352F494E434C5544455C7374646465+
	?debug	C 662E68
	?debug	C E9402079222A2F686F6D652F786F722F696E65727469615F706C61+
	?debug	C 7965722F4243352F494E434C5544455C646F732E68
	?debug	C E9402079222C2F686F6D652F786F722F696E65727469615F706C61+
	?debug	C 7965722F4243352F494E434C5544455C636F6E696F+
	?debug	C 2E68
	?debug	C E9402079222C2F686F6D652F786F722F696E65727469615F706C61+
	?debug	C 7965722F4243352F494E434C5544455C616C6C6F63+
	?debug	C 2E68
	?debug	C E9402079222B2F686F6D652F786F722F696E65727469615F706C61+
	?debug	C 7965722F4243352F494E434C5544455C74696D652E+
	?debug	C 68
GAME_TEXT	segment byte public use16 'CODE'
GAME_TEXT	ends
DGROUP	group	_DATA,_BSS
	assume	cs:GAME_TEXT,ds:DGROUP
_DATA	segment word public use16 'DATA'
d@	label	byte
d@w	label	word
_DATA	ends
_BSS	segment word public use16 'BSS'
b@	label	byte
b@w	label	word
_BSS	ends
GAME_TEXT	segment byte public use16 'CODE'
	assume	cs:GAME_TEXT,ds:DGROUP
_main	proc	far
	?debug	C E8010867616D652E6370702074375D
	?debug	C E80809726970746964652E686F72375D
	?debug	C E8022C2F686F6D652F786F722F696E6572746961+
	?debug	C 5F706C617965722F4243352F494E434C5544455C+
	?debug	C 737464696F2E6840207922
	?debug	C E8092C2F686F6D652F786F722F696E6572746961+
	?debug	C 5F706C617965722F4243352F494E434C5544455C+
	?debug	C 5F646566732E6840207922
	?debug	C E802
	?debug	C E80A2D2F686F6D652F786F722F696E6572746961+
	?debug	C 5F706C617965722F4243352F494E434C5544455C+
	?debug	C 5F6E66696C652E6840207922
	?debug	C E802
	?debug	C E80B2C2F686F6D652F786F722F696E6572746961+
	?debug	C 5F706C617965722F4243352F494E434C5544455C+
	?debug	C 5F6E756C6C2E6840207922
	?debug	C E802
	?debug	C E808
	?debug	C E80C2D2F686F6D652F786F722F696E6572746961+
	?debug	C 5F706C617965722F4243352F494E434C5544455C+
	?debug	C 737472696E672E6840207922
	?debug	C E8032D2F686F6D652F786F722F696E6572746961+
	?debug	C 5F706C617965722F4243352F494E434C5544455C+
	?debug	C 7374646465662E6840207922
	?debug	C E80C
	?debug	C E808
	?debug	C E8042A2F686F6D652F786F722F696E6572746961+
	?debug	C 5F706C617965722F4243352F494E434C5544455C+
	?debug	C 646F732E6840207922
	?debug	C E808
	?debug	C E8052C2F686F6D652F786F722F696E6572746961+
	?debug	C 5F706C617965722F4243352F494E434C5544455C+
	?debug	C 636F6E696F2E6840207922
	?debug	C E808
	?debug	C E8062C2F686F6D652F786F722F696E6572746961+
	?debug	C 5F706C617965722F4243352F494E434C5544455C+
	?debug	C 616C6C6F632E6840207922
	?debug	C E808
	?debug	C E8072B2F686F6D652F786F722F696E6572746961+
	?debug	C 5F706C617965722F4243352F494E434C5544455C+
	?debug	C 74696D652E6840207922
	?debug	C E808
	?debug	C E801
   ;	
   ;	int main(int argc, char *argv[], char *envp[])
   ;	
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    parse_options(argc, (uchar **)argv);
   ;	
	push	word ptr [bp+10]
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @parse_options$qinnuc
	add	sp,6
   ;	
   ;	    init_game();
   ;	
	call	far ptr @init_game$qv
@1@2:
   ;	
   ;	    while (1) {
   ;	        if (debug_mode == 0)
   ;	
	cmp	byte ptr DGROUP:_debug_mode,0
	jne	short @1@4
   ;	
   ;	            start_title_loop();
   ;	
	call	far ptr @start_title_loop$qv
@1@4:
   ;	
   ;	        play_game(zoom_to_map);
   ;	
	mov	al,byte ptr DGROUP:_zoom_to_map
	push	ax
	call	far ptr @play_game$quc
	pop	cx
	jmp	short @1@2
   ;	
   ;	    }
   ;	}
   ;	
	pop	bp
	ret	
_main	endp
GAME_TEXT	ends
GAME_TEXT	segment byte public use16 'CODE'
@_$DCC$@init_game$qv	label	word
	dd	@@$xt$n12game_manager
	db	135
	db	32
	db	252
	db	255
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	dd	@@$xt$n9game_cast
	db	135
	db	32
	db	248
	db	255
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
@_$ECTD$@init_game$qv	label	word
	db	0
	db	0
	db	0
	db	0
	db	218
	db	255
	db	0
	db	0
	db	5
	db	0
	db	0
	db	0
	db	255
	db	255
	db	6
	db	0
	db	5
	db	0
	db	0
	db	0
	dw	@_$DCC$@init_game$qv
	db	0
	db	0
	db	5
	db	0
	db	0
	db	0
	db	255
	db	255
	db	22
	db	0
	db	5
	db	0
	db	0
	db	0
	dw	@_$DCC$@init_game$qv+14
	assume	cs:GAME_TEXT,ds:DGROUP
@init_game$qv	proc	far
   ;	
   ;	void init_game(void)
   ;	
	enter	66,0
	mov	ax,GAME_TEXT
	mov	bx,offset @_$ECTD$@init_game$qv
	call	far ptr ___InitExceptBlock
   ;	
   ;	{
   ;	    FILE *stream;
   ;	    unsigned long need, free_mem;
   ;	    loop_ent far *loopdat;
   ;	    long t2, t1;
   ;	    unsigned long i;
   ;	
   ;	    _gr_start_kbd_grab();
   ;	
	call	far ptr @_gr_start_kbd_grab$qv
   ;	
   ;	    clrscr();
   ;	
	call	far ptr _clrscr
   ;	
   ;	    printf("%s\n", "Riptide (Registered) 1.0\t(C) 1994 MindStorm Software");
   ;	
	push	ds
	push	offset DGROUP:s@+4
	push	ds
	push	offset DGROUP:s@
	call	far ptr _printf
	add	sp,8
   ;	
   ;	    if (debug_mode == 1)
   ;	
	cmp	byte ptr DGROUP:_debug_mode,1
	jne	short @2@4
   ;	
   ;	        printf(">> DEBUG\tMODE ENABLED <<\n");
   ;	
	push	ds
	push	offset DGROUP:s@+57
	call	far ptr _printf
	add	sp,4
@2@4:
   ;	
   ;	    if (force_pc_sound == 1)
   ;	
	cmp	byte ptr DGROUP:_force_pc_sound,1
	jne	short @2@6
   ;	
   ;	        printf(">>  FORCING PC SOUND  <<\n");
   ;	
	push	ds
	push	offset DGROUP:s@+83
	call	far ptr _printf
	add	sp,4
@2@6:
   ;	
   ;	
   ;	    the_game = new game_manager((uchar *)"riptide.dat");
   ;	
	push	818
	call	far ptr @$bnew$qui
	pop	cx
	mov	word ptr [bp-2],dx
	mov	word ptr [bp-4],ax
	or	ax,dx
	je	short @2@8
	mov	word ptr [bp-26],14
	push	ds
	push	offset DGROUP:s@+109
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @game_manager@$bctr$qnuc
	add	sp,8
	dec	dword ptr ss:[16]
	mov	word ptr [bp-26],6
@2@8:
	mov	dx,word ptr [bp-2]
	mov	ax,word ptr [bp-4]
	mov	word ptr DGROUP:_the_game+2,dx
	mov	word ptr DGROUP:_the_game,ax
   ;	
   ;	    the_cast = new game_cast();
   ;	
	push	802
	call	far ptr @$bnew$qui
	pop	cx
	mov	word ptr [bp-6],dx
	mov	word ptr [bp-8],ax
	or	ax,dx
	je	short @2@11
	mov	word ptr [bp-26],30
	push	word ptr [bp-6]
	push	word ptr [bp-8]
	call	far ptr @game_cast@$bctr$qv
	add	sp,4
	dec	dword ptr ss:[16]
	mov	word ptr [bp-26],22
@2@11:
	mov	dx,word ptr [bp-6]
	mov	ax,word ptr [bp-8]
	mov	word ptr DGROUP:_the_cast+2,dx
	mov	word ptr DGROUP:_the_cast,ax
   ;	
   ;	    free_mem = coreleft();
   ;	
	call	far ptr _coreleft
	mov	word ptr [bp-48],dx
	mov	word ptr [bp-50],ax
   ;	
   ;	
   ;	    if (debug_mode == 0) {
   ;	
	cmp	byte ptr DGROUP:_debug_mode,0
	jne	@2@22
   ;	
   ;	        if (the_game->sb_present)
   ;	
	les	bx,dword ptr DGROUP:_the_game
	cmp	byte ptr es:[bx+6],0
	je	short @2@15
   ;	
   ;	            need = 0x65518;                 /* 415000 */
   ;	
	mov	dword ptr [bp-46],large 000065518h
	jmp	short @2@16
@2@15:
   ;	
   ;	        else
   ;	            need = 0x4CE78;                 /* 315000 */
   ;	
	mov	dword ptr [bp-46],large 00004CE78h
@2@16:
   ;	
   ;	        if (free_mem < need) {
   ;	
	mov	eax,dword ptr [bp-50]
	cmp	eax,dword ptr [bp-46]
	jae	short @2@21
   ;	
   ;	            delete the_game;
   ;	
	inc	dword ptr ss:[16]
	push	3
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@$bdtr$qv
	add	sp,6
   ;	
   ;	            if (the_game->sb_present)
   ;	
	les	bx,dword ptr DGROUP:_the_game
	cmp	byte ptr es:[bx+6],0
	je	short @2@19
   ;	
   ;	                terminate((uchar *)"Riptide requires 600k with digital sound.", 0);
   ;	
	push	large 0
	push	ds
	push	offset DGROUP:s@+121
	jmp	short @2@20
@2@19:
   ;	
   ;	            else
   ;	                terminate((uchar *)"Riptide requires 500k running pc sound.", 0);
   ;	
	push	large 0
	push	ds
	push	offset DGROUP:s@+163
@2@20:
	call	far ptr @terminate$qnuct1
	add	sp,8
@2@21:
   ;	
   ;	        }
   ;	        init_display(0);
   ;	
	push	0
	call	far ptr @init_display$quc
	pop	cx
   ;	
   ;	        display->blank_palette();
   ;	
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@blank_palette$qv
	add	sp,4
   ;	
   ;	        display->show_pcx((uchar *)"logos.pcx", 1, 0, -1);
   ;	
	push	-1
	push	0
	push	1
	push	ds
	push	offset DGROUP:s@+203
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@show_pcx$qnucucuii
	add	sp,14
   ;	
   ;	        load_resources();
   ;	
	call	far ptr @load_resources$qv
   ;	
   ;	        display->fade_down();
   ;	
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@fade_down$qv
	add	sp,4
   ;	
   ;	    } else {
   ;	
	jmp	short @2@23
@2@22:
   ;	
   ;	        printf("Bytes free %lu\n", free_mem);
   ;	
	push	dword ptr [bp-50]
	push	ds
	push	offset DGROUP:s@+213
	call	far ptr _printf
	add	sp,8
   ;	
   ;	        load_resources();
   ;	
	call	far ptr @load_resources$qv
   ;	
   ;	        init_display(0);
   ;	
	push	0
	call	far ptr @init_display$quc
	pop	cx
@2@23:
   ;	
   ;	    }
   ;	
   ;	    display->field_07 = 0;
   ;	
	les	bx,dword ptr DGROUP:_display
	mov	byte ptr es:[bx+7],0
   ;	
   ;	    i_init_interface(de_left, de_right, de_up, de_down, de_button);
   ;	
	push	seg @de_button$qv
	push	offset @de_button$qv
	push	seg @de_down$qv
	push	offset @de_down$qv
	push	seg @de_up$qv
	push	offset @de_up$qv
	push	seg @de_right$qv
	push	offset @de_right$qv
	push	seg @de_left$qv
	push	offset @de_left$qv
	call	far ptr @i_init_interface$qnvt1t1t1t1
	add	sp,20
   ;	
   ;	    loopdat = (loop_ent far *)the_game->get_loop((uchar far *)"mouse.l");
   ;	
	push	ds
	push	offset DGROUP:s@+229
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@get_loop$qnuc
	add	sp,8
	mov	word ptr [bp-52],dx
	mov	word ptr [bp-54],ax
   ;	
   ;	    mouse->set_cursor(loopdat->img->bitmap,
   ;	
   ;	
   ;	                      loopdat->img->field_6, loopdat->img->field_4);
   ;	
	les	bx,dword ptr [bp-54]
	les	bx,dword ptr es:[bx+6]
	push	word ptr es:[bx+4]
	les	bx,dword ptr [bp-54]
	les	bx,dword ptr es:[bx+6]
	push	word ptr es:[bx+6]
	les	bx,dword ptr [bp-54]
	les	bx,dword ptr es:[bx+6]
	push	word ptr es:[bx+2]
	push	word ptr es:[bx]
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	call	far ptr @ms_mouse@set_cursor$qnucii
	add	sp,12
   ;	
   ;	    pd_redraws = 1;
   ;	
	mov	byte ptr DGROUP:_pd_redraws,1
   ;	
   ;	    i_set_text(0x30, 2, 0x18, 0x1d);   /* asm pushes 1D,18,2,30 r-to-l */
   ;	
	push	29
	push	24
	push	2
	push	48
	call	far ptr @i_set_text$qucucucuc
	add	sp,8
   ;	
   ;	    setup_options();
   ;	
	call	far ptr @setup_options$qv
   ;	
   ;	    init_scores_array();
   ;	
	call	far ptr @init_scores_array$qv
   ;	
   ;	    load_scores_in();
   ;	
	call	far ptr @load_scores_in$qv
   ;	
   ;	    the_map = NULL;
   ;	
	mov	dword ptr DGROUP:_the_map,large 0
   ;	
   ;	    new_map_name = NULL;
   ;	
	mov	dword ptr DGROUP:_new_map_name,large 0
   ;	
   ;	
   ;	    gun_underbits = 0;
   ;	
	mov	dword ptr DGROUP:_gun_underbits,large 0
   ;	
   ;	    jguage_underbits = 0;
   ;	
	mov	dword ptr DGROUP:_jguage_underbits,large 0
   ;	
   ;	    game_in_progress = 0;
   ;	
	mov	byte ptr DGROUP:_game_in_progress,0
   ;	
   ;	    god_mode = 0;
   ;	
	mov	byte ptr DGROUP:_god_mode,0
   ;	
   ;	    cheat_mode = 0;
   ;	
	mov	byte ptr DGROUP:_cheat_mode,0
   ;	
   ;	    display->blank_palette();
   ;	
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@blank_palette$qv
	add	sp,4
   ;	
   ;	
   ;	    t1 = clock();
   ;	
	call	far ptr _clock
	mov	word ptr [bp-60],dx
	mov	word ptr [bp-62],ax
   ;	
   ;	    for (i = 40; i--;)
   ;	
	mov	dword ptr [bp-66],large 40
	jmp	short @2@25
@2@24:
   ;	
   ;	        display->put_bits(i, i, i + 0x32, i + 0x1e, (uchar *)_tmp, 0, 0);
   ;	
	push	0
	push	0
	push	ds
	push	offset DGROUP:__tmp
	mov	ax,word ptr [bp-66]
	add	ax,30
	push	ax
	mov	ax,word ptr [bp-66]
	add	ax,50
	push	ax
	push	word ptr [bp-66]
	push	word ptr [bp-66]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@put_bits$qiiiinucuiui
	add	sp,20
@2@25:
	mov	eax,dword ptr [bp-66]
	dec	dword ptr [bp-66]
	cmp	eax,large 0
	jne	short @2@24
   ;	
   ;	    for (i = 5; i--;)
   ;	
	mov	dword ptr [bp-66],large 5
	jmp	short @2@28
@2@27:
   ;	
   ;	        display->copy_page(1, 0);
   ;	
	push	0
	push	1
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@copy_page$qucuc
	add	sp,8
@2@28:
	mov	eax,dword ptr [bp-66]
	dec	dword ptr [bp-66]
	cmp	eax,large 0
	jne	short @2@27
   ;	
   ;	    t2 = clock();
   ;	
	call	far ptr _clock
	mov	word ptr [bp-56],dx
	mov	word ptr [bp-58],ax
   ;	
   ;	    system_bench = (byte)(t2 - t1);
   ;	
	mov	al,byte ptr [bp-58]
	sub	al,byte ptr [bp-62]
	mov	byte ptr DGROUP:_system_bench,al
   ;	
   ;	
   ;	    if (system_bench <= 4)
   ;	
	cmp	byte ptr DGROUP:_system_bench,4
	ja	short @2@31
   ;	
   ;	        the_game->game_speed = 2;
   ;	
	les	bx,dword ptr DGROUP:_the_game
	mov	byte ptr es:[bx+34],2
	jmp	short @2@32
@2@31:
   ;	
   ;	    else
   ;	        the_game->game_speed = 1;
   ;	
	les	bx,dword ptr DGROUP:_the_game
	mov	byte ptr es:[bx+34],1
@2@32:
   ;	
   ;	
   ;	    stream = fopen("config.rip", "rb");
   ;	
	push	ds
	push	offset DGROUP:s@+248
	push	ds
	push	offset DGROUP:s@+237
	call	far ptr _fopen
	add	sp,8
	mov	word ptr [bp-40],dx
	mov	word ptr [bp-42],ax
   ;	
   ;	    if (stream) {
   ;	
	cmp	dword ptr [bp-42],large 0
	je	short @2@36
   ;	
   ;	        the_game->field_1C = fgetc(stream);
   ;	
	push	word ptr [bp-40]
	push	word ptr [bp-42]
	call	far ptr _fgetc
	add	sp,4
	les	bx,dword ptr DGROUP:_the_game
	mov	byte ptr es:[bx+28],al
   ;	
   ;	        the_game->game_speed = fgetc(stream);
   ;	
	push	word ptr [bp-40]
	push	word ptr [bp-42]
	call	far ptr _fgetc
	add	sp,4
	les	bx,dword ptr DGROUP:_the_game
	mov	byte ptr es:[bx+34],al
   ;	
   ;	        if (fgetc(stream) != 0) {
   ;	
	push	word ptr [bp-40]
	push	word ptr [bp-42]
	call	far ptr _fgetc
	add	sp,4
	or	ax,ax
	je	short @2@35
   ;	
   ;	            the_game->input_mode = 1;
   ;	
	les	bx,dword ptr DGROUP:_the_game
	mov	byte ptr es:[bx+36],1
   ;	
   ;	            the_game->joy_update();
   ;	
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@joy_update$qv
	add	sp,4
@2@35:
   ;	
   ;	        }
   ;	        fclose(stream);
   ;	
	push	word ptr [bp-40]
	push	word ptr [bp-42]
	call	far ptr _fclose
	add	sp,4
@2@36:
   ;	
   ;	    }
   ;	    _set_exit_routine(cb_quit);
   ;	
	push	seg @cb_quit$qv
	push	offset @cb_quit$qv
	call	far ptr @_set_exit_routine$qnqv$v
	add	sp,4
   ;	
   ;	}
   ;	
	mov	ax,word ptr [bp-38]
	mov	word ptr ss:[20],ax
	leave	
	ret	
@init_game$qv	endp
GAME_TEXT	ends
_DATA	segment word public use16 'DATA'
_all_secrets	label	byte
	db	22
	db	4
	db	23
	db	9
_all_maps	label	word
	dd	DGROUP:s@+251
	dd	DGROUP:s@+257
	dd	DGROUP:s@+263
	dd	DGROUP:s@+265
	db	0
	db	0
	db	0
	db	0
	dd	DGROUP:s@+277
	dd	DGROUP:s@+283
	dd	DGROUP:s@+289
	dd	DGROUP:s@+295
	db	0
	db	0
	db	0
	db	0
	dd	DGROUP:s@+308
	dd	DGROUP:s@+314
	dd	DGROUP:s@+320
	dd	DGROUP:s@+326
	db	0
	db	0
	db	0
	db	0
	dd	DGROUP:s@+338
	dd	DGROUP:s@+344
	dd	DGROUP:s@+350
	dd	DGROUP:s@+356
	db	0
	db	0
	db	0
	db	0
	dd	DGROUP:s@+365
	dd	DGROUP:s@+371
	dd	DGROUP:s@+377
	dd	DGROUP:s@+385
	db	0
	db	0
	db	0
	db	0
	dd	DGROUP:s@+402
	dd	DGROUP:s@+408
	dd	DGROUP:s@+414
	dd	DGROUP:s@+418
	db	0
	db	0
	db	0
	db	0
	dd	DGROUP:s@+429
	dd	DGROUP:s@+435
	dd	DGROUP:s@+441
	dd	DGROUP:s@+445
	dd	@bs1_start_up$qv
	dd	DGROUP:s@+458
	dd	DGROUP:s@+464
	dd	DGROUP:s@+475
	dd	DGROUP:s@+482
	db	0
	db	0
	db	0
	db	0
	dd	DGROUP:s@+491
	dd	DGROUP:s@+497
	dd	DGROUP:s@+503
	dd	DGROUP:s@+511
	db	0
	db	0
	db	0
	db	0
	dd	DGROUP:s@+526
	dd	DGROUP:s@+532
	dd	DGROUP:s@+542
	dd	DGROUP:s@+546
	db	0
	db	0
	db	0
	db	0
	dd	DGROUP:s@+562
	dd	DGROUP:s@+568
	dd	DGROUP:s@+574
	dd	DGROUP:s@+581
	db	0
	db	0
	db	0
	db	0
	dd	DGROUP:s@+593
	dd	DGROUP:s@+599
	dd	DGROUP:s@+609
	dd	DGROUP:s@+616
	db	0
	db	0
	db	0
	db	0
	dd	DGROUP:s@+631
	dd	DGROUP:s@+637
	dd	DGROUP:s@+647
	dd	DGROUP:s@+651
	dd	@bs2_start_up$qv
	dd	DGROUP:s@+662
	dd	DGROUP:s@+668
	dd	DGROUP:s@+674
	dd	DGROUP:s@+680
	db	0
	db	0
	db	0
	db	0
	dd	DGROUP:s@+691
	dd	DGROUP:s@+697
	dd	DGROUP:s@+708
	dd	DGROUP:s@+715
	db	0
	db	0
	db	0
	db	0
	dd	DGROUP:s@+727
	dd	DGROUP:s@+733
	dd	DGROUP:s@+739
	dd	DGROUP:s@+743
	db	0
	db	0
	db	0
	db	0
	dd	DGROUP:s@+756
	dd	DGROUP:s@+762
	dd	DGROUP:s@+768
	dd	DGROUP:s@+775
	db	0
	db	0
	db	0
	db	0
	dd	DGROUP:s@+784
	dd	DGROUP:s@+790
	dd	DGROUP:s@+800
	dd	DGROUP:s@+806
	db	0
	db	0
	db	0
	db	0
	dd	DGROUP:s@+816
	dd	DGROUP:s@+822
	dd	DGROUP:s@+831
	dd	DGROUP:s@+838
	db	0
	db	0
	db	0
	db	0
	dd	DGROUP:s@+853
	dd	DGROUP:s@+859
	dd	DGROUP:s@+865
	dd	DGROUP:s@+869
	db	0
	db	0
	db	0
	db	0
	dd	DGROUP:s@+883
	dd	DGROUP:s@+889
	dd	DGROUP:s@+900
	dd	DGROUP:s@+904
	db	0
	db	0
	db	0
	db	0
	dd	DGROUP:s@+920
	dd	DGROUP:s@+926
	dd	DGROUP:s@+932
	dd	DGROUP:s@+936
	dd	@bs3_start_up$qv
	dd	DGROUP:s@+950
	dd	DGROUP:s@+957
	dd	DGROUP:s@+963
	dd	DGROUP:s@+968
	db	0
	db	0
	db	0
	db	0
	dd	DGROUP:s@+983
	dd	DGROUP:s@+990
	dd	DGROUP:s@+1000
	dd	DGROUP:s@+1005
	db	0
	db	0
	db	0
	db	0
_DATA	ends
GAME_TEXT	segment byte public use16 'CODE'
	assume	cs:GAME_TEXT,ds:DGROUP
@play_game$quc	proc	far
   ;	
   ;	void play_game(uchar map_id)
   ;	
	enter	2,0
   ;	
   ;	{
   ;	    uchar done;
   ;	
   ;	    display->blank_palette();
   ;	
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@blank_palette$qv
	add	sp,4
   ;	
   ;	    display->show_pcx((uchar far *)"p_frame.pcx", 0, 0, -1);
   ;	
	push	-1
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+1012
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@show_pcx$qnucucuii
	add	sp,14
   ;	
   ;	    gun_underbits   = display->get_bits(0x80, 0x97, 0xBE, 0xA1);
   ;	
	push	161
	push	190
	push	151
	push	128
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@get_bits$qiiii
	add	sp,12
	mov	word ptr DGROUP:_gun_underbits+2,dx
	mov	word ptr DGROUP:_gun_underbits,ax
   ;	
   ;	    jguage_underbits = display->get_bits(0x0C, 0xA7, 0x2C, 0xAD);
   ;	
	push	173
	push	44
	push	167
	push	12
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@get_bits$qiiii
	add	sp,12
	mov	word ptr DGROUP:_jguage_underbits+2,dx
	mov	word ptr DGROUP:_jguage_underbits,ax
   ;	
   ;	    display->copy_page(1, 0);
   ;	
	push	0
	push	1
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@copy_page$qucuc
	add	sp,8
@3@2:
   ;	
   ;	
   ;	restart_map:                                        /* loc_6596 */
   ;	    cur_map = map_id;
   ;	
	mov	al,byte ptr [bp+6]
	mov	byte ptr DGROUP:_cur_map,al
@3@3:
   ;	
   ;	reset_game:                                         /* loc_659C */
   ;	    game_in_progress = 1;
   ;	
	mov	byte ptr DGROUP:_game_in_progress,1
   ;	
   ;	    done = 0;
   ;	
	mov	byte ptr [bp-1],0
   ;	
   ;	    score_count = 0;
   ;	
	mov	byte ptr DGROUP:_score_count,0
   ;	
   ;	    score = 0;
   ;	
	mov	dword ptr DGROUP:_score,large 0
   ;	
   ;	    gun_count = 0;
   ;	
	mov	byte ptr DGROUP:_gun_count,0
   ;	
   ;	    men = 2;
   ;	
	mov	byte ptr DGROUP:_men,2
   ;	
   ;	    auto_fire_count = 0;
   ;	
	mov	byte ptr DGROUP:_auto_fire_count,0
   ;	
   ;	    jason_fire = auto_fire = top_fire = 0;
   ;	
	mov	al,0
	mov	byte ptr DGROUP:_top_fire,al
	mov	byte ptr DGROUP:_auto_fire,al
	mov	byte ptr DGROUP:_jason_fire,al
   ;	
   ;	    shot_size = 0;
   ;	
	mov	byte ptr DGROUP:_shot_size,0
   ;	
   ;	    jason_on = 0;
   ;	
	mov	byte ptr DGROUP:_jason_on,0
   ;	
   ;	    jason_present = 1;
   ;	
	mov	byte ptr DGROUP:_jason_present,1
   ;	
   ;	    maximum_jason_power = 0x64;
   ;	
	mov	byte ptr DGROUP:_maximum_jason_power,100
   ;	
   ;	    the_game->clear_flags();
   ;	
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@clear_flags$qv
	add	sp,4
@3@4:
   ;	
   ;	
   ;	    do {                                            /* loc_6C4A -> loc_65F3 */
   ;	        the_game->field_09 = 0;
   ;	
	les	bx,dword ptr DGROUP:_the_game
	mov	byte ptr es:[bx+9],0
   ;	
   ;	        the_game->field_08 = 0;
   ;	
	les	bx,dword ptr DGROUP:_the_game
	mov	byte ptr es:[bx+8],0
   ;	
   ;	        show_prelude();
   ;	
	call	far ptr @show_prelude$qv
@3@5:
   ;	
   ;	replay:                                             /* loc_660A */
   ;	        the_game->play_song(all_maps[cur_map].song);
   ;	
	mov	al,byte ptr DGROUP:_cur_map
	mov	ah,0
	imul	ax,ax,20
	mov	bx,ax
	push	word ptr DGROUP:_all_maps[bx+6]
	push	word ptr DGROUP:_all_maps[bx+4]
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_song$qnuc
	add	sp,8
   ;	
   ;	        switch (cur_map - 4) {                      /* jumptable off_6CBA */
   ;	
	mov	al,byte ptr DGROUP:_cur_map
	mov	ah,0
	add	ax,-4
	mov	bx,ax
	cmp	bx,19
	ja	@3@20
	add	bx,bx
	jmp	word ptr cs:@3@C214[bx]
@3@9:
   ;	
   ;	        case 2:                                     /* cur_map=6 bs1.m */
   ;	            if (jason_present == 1)
   ;	
	cmp	byte ptr DGROUP:_jason_present,1
	jne	short @3@11
   ;	
   ;	                jason_present = 0;
   ;	
	mov	byte ptr DGROUP:_jason_present,0
@3@11:
   ;	
   ;	            the_game->load_loop((uchar far *)"bs1_bdl.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1024
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	            the_game->load_loop((uchar far *)"bs1_bdr.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1034
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	            the_game->load_loop((uchar far *)"bs1dr.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1044
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	            the_game->load_loop((uchar far *)"bosshit.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1052
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	            the_game->define_sound((uchar far *)"badgrunt", 0);
   ;	
	push	0
	push	ds
	push	offset DGROUP:s@+1062
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@define_sound$qnucuc
	add	sp,10
   ;	
   ;	            break;
   ;	
	jmp	@3@20
@3@12:
   ;	
   ;	        case 8:                                     /* cur_map=12 bs2.m */
   ;	            if (jason_present == 1)
   ;	
	cmp	byte ptr DGROUP:_jason_present,1
	jne	short @3@14
   ;	
   ;	                jason_present = 0;
   ;	
	mov	byte ptr DGROUP:_jason_present,0
@3@14:
   ;	
   ;	            the_game->load_loop((uchar far *)"bs2_bod.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1071
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	            the_game->load_loop((uchar far *)"bs2_tnr1.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1081
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	            the_game->load_loop((uchar far *)"bs2_tnl1.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1092
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	            the_game->load_loop((uchar far *)"bs2_tnr2.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1103
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	            the_game->load_loop((uchar far *)"bs2_tnl2.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1114
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	            the_game->load_loop((uchar far *)"msl_inkl.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1125
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	            the_game->load_loop((uchar far *)"msl_inkr.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1136
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	            the_game->load_loop((uchar far *)"otiseyes.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1147
	jmp	@3@19
@3@15:
   ;	
   ;	            break;
   ;	        case 17:                                    /* cur_map=21 bs3.m */
   ;	            if (jason_present == 1)
   ;	
	cmp	byte ptr DGROUP:_jason_present,1
	jne	short @3@17
   ;	
   ;	                jason_present = 0;
   ;	
	mov	byte ptr DGROUP:_jason_present,0
@3@17:
   ;	
   ;	            the_game->load_loop((uchar far *)"bs3_bdr.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1158
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	            the_game->load_loop((uchar far *)"bs3_arr.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1168
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	            the_game->load_loop((uchar far *)"bs3_bdl.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1178
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	            the_game->load_loop((uchar far *)"bs3_arl.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1188
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	            the_game->load_loop((uchar far *)"bs3_dthr.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1198
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	            the_game->load_loop((uchar far *)"bs3_prpl.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1209
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	            the_game->load_loop((uchar far *)"bs3_prpr.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1220
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	            the_game->load_loop((uchar far *)"bs3_facl.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1231
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	            the_game->load_loop((uchar far *)"bs3_facr.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1242
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	            the_game->load_loop((uchar far *)"chain.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1253
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	            the_game->load_loop((uchar far *)"exp3.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1261
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	            the_game->define_sound((uchar far *)"plunk2", 0);
   ;	
	push	0
	push	ds
	push	offset DGROUP:s@+1268
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@define_sound$qnucuc
	add	sp,10
   ;	
   ;	            break;
   ;	
	jmp	short @3@20
@3@18:
   ;	
   ;	        case 0:  case 3:  case 6:  case 10: case 11:/* shark levels */
   ;	        case 14: case 16: case 18: case 19:
   ;	            the_game->load_loop((uchar far *)"sharkr.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1275
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	            the_game->load_loop((uchar far *)"sharkl.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1284
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	            the_game->load_loop((uchar far *)"sharkdie.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1293
@3@19:
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	            break;
   ;	
@3@20:
   ;	
   ;	        default:
   ;	            break;
   ;	        }
   ;	
   ;	        start_room(all_maps[cur_map].map);          /* loc_6898 */
   ;	
	mov	al,byte ptr DGROUP:_cur_map
	mov	ah,0
	imul	ax,ax,20
	mov	bx,ax
	push	word ptr DGROUP:_all_maps[bx+2]
	push	word ptr DGROUP:_all_maps[bx]
	call	far ptr @start_room$qnuc
	add	sp,4
   ;	
   ;	        if (all_maps[cur_map].start_up)
   ;	
	mov	al,byte ptr DGROUP:_cur_map
	mov	ah,0
	imul	ax,ax,20
	mov	bx,ax
	mov	ax,word ptr DGROUP:_all_maps[bx+16]
	or	ax,word ptr DGROUP:_all_maps[bx+18]
	je	short @3@22
   ;	
   ;	            all_maps[cur_map].start_up();
   ;	
	mov	al,byte ptr DGROUP:_cur_map
	mov	ah,0
	imul	ax,ax,20
	mov	bx,ax
	call	dword ptr DGROUP:_all_maps[bx+16]
@3@22:
   ;	
   ;	
   ;	        do {
   ;	            de_doit();                              /* loc_68D6/68DB */
   ;	
	call	far ptr @de_doit$qv
   ;	
   ;	        } while (stop_room == 0);
   ;	
	cmp	byte ptr DGROUP:_stop_room,0
	je	short @3@22
   ;	
   ;	
   ;	        switch (cur_map - 4) {                      /* jumptable off_6C92 */
   ;	
	mov	al,byte ptr DGROUP:_cur_map
	mov	ah,0
	add	ax,-4
	mov	bx,ax
	cmp	bx,19
	ja	@3@31
	add	bx,bx
	jmp	word ptr cs:@3@C219[bx]
@3@27:
   ;	
   ;	        case 2:                                     /* bs1 */
   ;	            the_game->remove_loop((uchar far *)"bs1_bdl.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1304
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@remove_loop$qnuc
	add	sp,8
   ;	
   ;	            the_game->remove_loop((uchar far *)"bs1_bdr.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1314
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@remove_loop$qnuc
	add	sp,8
   ;	
   ;	            the_game->remove_loop((uchar far *)"bs1dr.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1324
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@remove_loop$qnuc
	add	sp,8
   ;	
   ;	            the_game->remove_loop((uchar far *)"bosshit.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1332
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@remove_loop$qnuc
	add	sp,8
   ;	
   ;	            the_game->remove_sound((uchar far *)"badgrunt");
   ;	
	push	ds
	push	offset DGROUP:s@+1342
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@remove_sound$qve
	add	sp,8
@3@28:
   ;	
   ;	            /* fall through */
   ;	        case 8:                                     /* bs2 */
   ;	            the_game->remove_loop((uchar far *)"bs2_bod.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1351
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@remove_loop$qnuc
	add	sp,8
   ;	
   ;	            the_game->remove_loop((uchar far *)"bs2_tnr1.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1361
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@remove_loop$qnuc
	add	sp,8
   ;	
   ;	            the_game->remove_loop((uchar far *)"bs2_tnl1.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1372
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@remove_loop$qnuc
	add	sp,8
   ;	
   ;	            the_game->remove_loop((uchar far *)"bs2_tnr2.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1383
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@remove_loop$qnuc
	add	sp,8
   ;	
   ;	            the_game->remove_loop((uchar far *)"bs2_tnl2.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1394
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@remove_loop$qnuc
	add	sp,8
   ;	
   ;	            the_game->remove_loop((uchar far *)"msl_inkl.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1405
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@remove_loop$qnuc
	add	sp,8
   ;	
   ;	            the_game->remove_loop((uchar far *)"msl_inkr.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1416
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@remove_loop$qnuc
	add	sp,8
   ;	
   ;	            the_game->remove_loop((uchar far *)"otiseyes.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1427
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@remove_loop$qnuc
	add	sp,8
@3@29:
   ;	
   ;	            /* fall through */
   ;	        case 17:                                    /* bs3 */
   ;	            the_game->remove_loop((uchar far *)"bs3_bdr.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1438
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@remove_loop$qnuc
	add	sp,8
   ;	
   ;	            the_game->remove_loop((uchar far *)"bs3_arr.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1448
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@remove_loop$qnuc
	add	sp,8
   ;	
   ;	            the_game->remove_loop((uchar far *)"bs3_bdl.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1458
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@remove_loop$qnuc
	add	sp,8
   ;	
   ;	            the_game->remove_loop((uchar far *)"bs3_arl.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1468
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@remove_loop$qnuc
	add	sp,8
   ;	
   ;	            the_game->remove_loop((uchar far *)"bs3_prpl.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1478
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@remove_loop$qnuc
	add	sp,8
   ;	
   ;	            the_game->remove_loop((uchar far *)"bs3_prpr.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1489
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@remove_loop$qnuc
	add	sp,8
   ;	
   ;	            the_game->remove_loop((uchar far *)"bs3_facl.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1500
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@remove_loop$qnuc
	add	sp,8
   ;	
   ;	            the_game->remove_loop((uchar far *)"bs3_facr.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1511
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@remove_loop$qnuc
	add	sp,8
   ;	
   ;	            the_game->remove_loop((uchar far *)"bs3_dthr.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1522
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@remove_loop$qnuc
	add	sp,8
   ;	
   ;	            the_game->remove_loop((uchar far *)"chain.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1533
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@remove_loop$qnuc
	add	sp,8
   ;	
   ;	            the_game->remove_loop((uchar far *)"exp3.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1541
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@remove_loop$qnuc
	add	sp,8
   ;	
   ;	            the_game->remove_sound((uchar far *)"plunk2");
   ;	
	push	ds
	push	offset DGROUP:s@+1548
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@remove_sound$qve
	add	sp,8
@3@30:
   ;	
   ;	            /* fall through */
   ;	        case 0:  case 3:  case 6:  case 10: case 11:
   ;	        case 14: case 16: case 18: case 19:
   ;	            the_game->remove_loop((uchar far *)"sharkr.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1555
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@remove_loop$qnuc
	add	sp,8
   ;	
   ;	            the_game->remove_loop((uchar far *)"sharkl.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1564
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@remove_loop$qnuc
	add	sp,8
   ;	
   ;	            the_game->remove_loop((uchar far *)"sharkdie.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1573
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@remove_loop$qnuc
	add	sp,8
   ;	
   ;	            break;
   ;	
@3@31:
   ;	
   ;	        default:
   ;	            break;
   ;	        }
   ;	
   ;	        display->copy_page(non_displayed_page, displayed_page);  /* loc_6B2F */
   ;	
	mov	al,byte ptr DGROUP:_displayed_page
	push	ax
	mov	al,byte ptr DGROUP:_non_displayed_page
	push	ax
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@copy_page$qucuc
	add	sp,8
   ;	
   ;	        the_cast->kill_all();
   ;	
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@kill_all$qv
	add	sp,4
   ;	
   ;	        display->copy_page(1, 0);
   ;	
	push	0
	push	1
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@copy_page$qucuc
	add	sp,8
   ;	
   ;	
   ;	        switch (stop_room - 1) {                    /* jumptable off_6C86 */
   ;	
	mov	al,byte ptr DGROUP:_stop_room
	mov	ah,0
	dec	ax
	mov	bx,ax
	cmp	bx,5
	ja	@3@48
	add	bx,bx
	jmp	word ptr cs:@3@C224[bx]
@3@35:
   ;	
   ;	        case 0:                                     /* level completed */
   ;	            end_room();
   ;	
	call	far ptr @end_room$qv
   ;	
   ;	            if (cur_map < 0x15)
   ;	
	cmp	byte ptr DGROUP:_cur_map,21
	jae	short @3@37
   ;	
   ;	                ++cur_map;
   ;	
	mov	al,byte ptr DGROUP:_cur_map
	inc	al
	mov	byte ptr DGROUP:_cur_map,al
	jmp	short @3@40
@3@37:
   ;	
   ;	            else if (cur_map >= 0x16)
   ;	
	cmp	byte ptr DGROUP:_cur_map,22
	jb	short @3@39
   ;	
   ;	                exit_secret_level();
   ;	
	call	far ptr @exit_secret_level$qv
	jmp	short @3@40
@3@39:
   ;	
   ;	            else {
   ;	                end_game();
   ;	
	call	far ptr @end_game$qv
   ;	
   ;	                ++done;
   ;	
	mov	al,byte ptr [bp-1]
	inc	al
	mov	byte ptr [bp-1],al
@3@40:
   ;	
   ;	            }
   ;	            switch (cur_map - 1) {                  /* jumptable off_6C58 */
   ;	
	mov	al,byte ptr DGROUP:_cur_map
	mov	ah,0
	dec	ax
	mov	bx,ax
	cmp	bx,22
	ja	@3@48
	add	bx,bx
	jmp	word ptr cs:@3@C229[bx]
@3@43:
   ;	
   ;	            case 0:  case 1:  case 2:  case 3:  case 4:
   ;	            case 7:  case 8:  case 9:  case 10:
   ;	            case 12: case 13: case 14: case 15: case 16:
   ;	            case 17: case 18: case 19: case 21: case 22:
   ;	                strcpy((char *)_tmp, "New password : ");
   ;	
	push	ds
	push	offset DGROUP:s@+1584
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _strcpy
	add	sp,8
   ;	
   ;	                strcat((char *)_tmp, (char *)all_maps[cur_map].password);
   ;	
	mov	al,byte ptr DGROUP:_cur_map
	mov	ah,0
	imul	ax,ax,20
	mov	bx,ax
	push	word ptr DGROUP:_all_maps[bx+10]
	push	word ptr DGROUP:_all_maps[bx+8]
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _strcat
	add	sp,8
   ;	
   ;	                i_inform(_tmp, 0, 0);
   ;	
	push	0
	push	0
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr @i_inform$qnucuce
	add	sp,8
   ;	
   ;	                break;
   ;	
	jmp	short @3@48
@3@44:
   ;	
   ;	            default:                                /* 5,6,11,20: no pw */
   ;	                break;
   ;	            }
   ;	            break;
   ;	        case 1:                                     /* jump to zoom_to_map */
   ;	            cur_map = zoom_to_map;
   ;	
	mov	al,byte ptr DGROUP:_zoom_to_map
	mov	byte ptr DGROUP:_cur_map,al
   ;	
   ;	            display->fade_down();
   ;	
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@fade_down$qv
	add	sp,4
   ;	
   ;	            goto reset_game;
   ;	
	jmp	@3@3
@3@45:
   ;	
   ;	        case 2:                                     /* replay map, keep state */
   ;	            goto replay;
   ;	        case 3:                                     /* died: restart level */
   ;	            display->fade_down();
   ;	
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@fade_down$qv
	add	sp,4
   ;	
   ;	            goto restart_map;
   ;	
	jmp	@3@2
@3@46:
   ;	
   ;	        case 4:                                     /* game over */
   ;	            end_game();
   ;	
	call	far ptr @end_game$qv
   ;	
   ;	            ++done;
   ;	
	mov	al,byte ptr [bp-1]
	inc	al
	mov	byte ptr [bp-1],al
   ;	
   ;	            break;
   ;	
	jmp	short @3@48
@3@47:
   ;	
   ;	        case 5:                                     /* secret level entrance */
   ;	            end_room();
   ;	
	call	far ptr @end_room$qv
   ;	
   ;	            setup_secret_level();
   ;	
	call	far ptr @setup_secret_level$qv
   ;	
   ;	            break;
   ;	
@3@48:
   ;	
   ;	        default:
   ;	            break;
   ;	        }
   ;	    } while (!done);
   ;	
	cmp	byte ptr [bp-1],0
	je	@3@4
   ;	
   ;	}
   ;	
	leave	
	ret	
@play_game$quc	endp
@3@C229	label	word
	dw	@3@43
	dw	@3@43
	dw	@3@43
	dw	@3@43
	dw	@3@43
	dw	@3@48
	dw	@3@48
	dw	@3@43
	dw	@3@43
	dw	@3@43
	dw	@3@43
	dw	@3@48
	dw	@3@43
	dw	@3@43
	dw	@3@43
	dw	@3@43
	dw	@3@43
	dw	@3@43
	dw	@3@43
	dw	@3@43
	dw	@3@48
	dw	@3@43
	dw	@3@43
@3@C224	label	word
	dw	@3@35
	dw	@3@44
	dw	@3@5
	dw	@3@45
	dw	@3@46
	dw	@3@47
@3@C219	label	word
	dw	@3@30
	dw	@3@31
	dw	@3@27
	dw	@3@30
	dw	@3@31
	dw	@3@31
	dw	@3@30
	dw	@3@31
	dw	@3@28
	dw	@3@31
	dw	@3@30
	dw	@3@30
	dw	@3@31
	dw	@3@31
	dw	@3@30
	dw	@3@31
	dw	@3@30
	dw	@3@29
	dw	@3@30
	dw	@3@30
@3@C214	label	word
	dw	@3@18
	dw	@3@20
	dw	@3@9
	dw	@3@18
	dw	@3@20
	dw	@3@20
	dw	@3@18
	dw	@3@20
	dw	@3@12
	dw	@3@20
	dw	@3@18
	dw	@3@18
	dw	@3@20
	dw	@3@20
	dw	@3@18
	dw	@3@20
	dw	@3@18
	dw	@3@15
	dw	@3@18
	dw	@3@18
	assume	cs:GAME_TEXT,ds:DGROUP
@setup_secret_level$qv	proc	far
   ;	
   ;	void setup_secret_level(void)
   ;	
	enter	2,0
   ;	
   ;	{
   ;	    uchar i;
   ;	
   ;	    the_game->field_0D = 1;                         /* in-secret-level flag */
   ;	
	les	bx,dword ptr DGROUP:_the_game
	mov	byte ptr es:[bx+13],1
   ;	
   ;	    for (i = 0; i < 2; ++i)
   ;	
	mov	byte ptr [bp-1],0
	jmp	short @4@4
@4@2:
   ;	
   ;	        if (all_secrets[i * 2 + 1] == cur_map)
   ;	
	mov	al,byte ptr [bp-1]
	mov	ah,0
	add	ax,ax
	mov	bx,ax
	mov	al,byte ptr DGROUP:_all_secrets[bx+1]
	cmp	al,byte ptr DGROUP:_cur_map
	je	short @4@5
	mov	al,byte ptr [bp-1]
	inc	al
	mov	byte ptr [bp-1],al
@4@4:
	cmp	byte ptr [bp-1],2
	jb	short @4@2
@4@5:
   ;	
   ;	            break;
   ;	    if (i == 2)
   ;	
	cmp	byte ptr [bp-1],2
	jne	short @4@7
   ;	
   ;	        terminate((uchar far *)"Invalid secret level exit.", 0);
   ;	
	push	large 0
	push	ds
	push	offset DGROUP:s@+1600
	call	far ptr @terminate$qnuct1
	add	sp,8
@4@7:
   ;	
   ;	    cur_map = all_secrets[i * 2];
   ;	
	mov	al,byte ptr [bp-1]
	mov	ah,0
	add	ax,ax
	mov	bx,ax
	mov	al,byte ptr DGROUP:_all_secrets[bx]
	mov	byte ptr DGROUP:_cur_map,al
   ;	
   ;	}
   ;	
	leave	
	ret	
@setup_secret_level$qv	endp
	assume	cs:GAME_TEXT,ds:DGROUP
@exit_secret_level$qv	proc	far
   ;	
   ;	void exit_secret_level(void)
   ;	
	enter	2,0
   ;	
   ;	{
   ;	    uchar i;
   ;	
   ;	    for (i = 0; i < 2; ++i)
   ;	
	mov	byte ptr [bp-1],0
	jmp	short @5@4
@5@2:
   ;	
   ;	        if (all_secrets[i * 2] == cur_map)
   ;	
	mov	al,byte ptr [bp-1]
	mov	ah,0
	add	ax,ax
	mov	bx,ax
	mov	al,byte ptr DGROUP:_all_secrets[bx]
	cmp	al,byte ptr DGROUP:_cur_map
	je	short @5@5
	mov	al,byte ptr [bp-1]
	inc	al
	mov	byte ptr [bp-1],al
@5@4:
	cmp	byte ptr [bp-1],2
	jb	short @5@2
@5@5:
   ;	
   ;	            break;
   ;	    if (i == 2)
   ;	
	cmp	byte ptr [bp-1],2
	jne	short @5@7
   ;	
   ;	        terminate((uchar far *)"Invalid secret level re-entrance.", 0);
   ;	
	push	large 0
	push	ds
	push	offset DGROUP:s@+1627
	call	far ptr @terminate$qnuct1
	add	sp,8
@5@7:
   ;	
   ;	    cur_map = all_secrets[i * 2 + 1] + 1;
   ;	
	mov	al,byte ptr [bp-1]
	mov	ah,0
	add	ax,ax
	mov	bx,ax
	mov	al,byte ptr DGROUP:_all_secrets[bx+1]
	inc	al
	mov	byte ptr DGROUP:_cur_map,al
   ;	
   ;	}
   ;	
	leave	
	ret	
@exit_secret_level$qv	endp
GAME_TEXT	ends
GAME_TEXT	segment byte public use16 'CODE'
@_$DCE$@start_room$qnuc	label	word
	dd	@@$xt$n7tilemap
	db	135
	db	32
	db	252
	db	255
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
@_$ECTF$@start_room$qnuc	label	word
	db	0
	db	0
	db	0
	db	0
	db	222
	db	255
	db	0
	db	0
	db	5
	db	0
	db	0
	db	0
	db	255
	db	255
	db	6
	db	0
	db	5
	db	0
	db	0
	db	0
	dw	@_$DCE$@start_room$qnuc
	assume	cs:GAME_TEXT,ds:DGROUP
@start_room$qnuc	proc	far
   ;	
   ;	void start_room(uchar far *path)
   ;	
	enter	40,0
	mov	ax,GAME_TEXT
	mov	bx,offset @_$ECTF$@start_room$qnuc
	call	far ptr ___InitExceptBlock
   ;	
   ;	{
   ;	    uint pos, attr, bits;
   ;	
   ;	    zoom_to_map = 0;
   ;	
	mov	byte ptr DGROUP:_zoom_to_map,0
   ;	
   ;	    display->blank_palette();
   ;	
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@blank_palette$qv
	add	sp,4
   ;	
   ;	    display->copy_page(0, 1);
   ;	
	push	1
	push	0
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@copy_page$qucuc
	add	sp,8
   ;	
   ;	    non_displayed_page = 0;
   ;	
	mov	byte ptr DGROUP:_non_displayed_page,0
   ;	
   ;	    displayed_page = 1;
   ;	
	mov	byte ptr DGROUP:_displayed_page,1
   ;	
   ;	    the_game->reset_player(0);
   ;	
	push	0
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@reset_player$quc
	add	sp,6
   ;	
   ;	    end_door_ptr = NULL;
   ;	
	mov	dword ptr DGROUP:_end_door_ptr,large 0
   ;	
   ;	    ego_x_speed = 4;
   ;	
	mov	byte ptr DGROUP:_ego_x_speed,4
   ;	
   ;	    ego_y_speed = ego_x_speed + 0xFF;       /* byte: 4-1 = 3 */
   ;	
	mov	al,byte ptr DGROUP:_ego_x_speed
	add	al,255
	mov	byte ptr DGROUP:_ego_y_speed,al
   ;	
   ;	    stop_room = 0;
   ;	
	mov	byte ptr DGROUP:_stop_room,0
   ;	
   ;	    control = 1;
   ;	
	mov	byte ptr DGROUP:_control,1
   ;	
   ;	    zapper_count = 0;
   ;	
	mov	byte ptr DGROUP:_zapper_count,0
   ;	
   ;	    got_key = 0;
   ;	
	mov	byte ptr DGROUP:_got_key,0
   ;	
   ;	    smart_missiles = 0;
   ;	
	mov	byte ptr DGROUP:_smart_missiles,0
   ;	
   ;	    the_game->field_0B = 0;
   ;	
	les	bx,dword ptr DGROUP:_the_game
	mov	byte ptr es:[bx+11],0
   ;	
   ;	    the_game->field_0A = 0;
   ;	
	les	bx,dword ptr DGROUP:_the_game
	mov	byte ptr es:[bx+10],0
   ;	
   ;	    goodies_found = 0;
   ;	
	mov	byte ptr DGROUP:_goodies_found,0
   ;	
   ;	    enemies_killed = 0;
   ;	
	mov	byte ptr DGROUP:_enemies_killed,0
   ;	
   ;	    goody_count = 0;
   ;	
	mov	byte ptr DGROUP:_goody_count,0
   ;	
   ;	    enemy_count = 0;
   ;	
	mov	byte ptr DGROUP:_enemy_count,0
   ;	
   ;	    air_count = 0;
   ;	
	mov	byte ptr DGROUP:_air_count,0
   ;	
   ;	    air_speed = 0x28;
   ;	
	mov	byte ptr DGROUP:_air_speed,40
   ;	
   ;	    air_supply = 0x96;
   ;	
	mov	word ptr DGROUP:_air_supply,150
   ;	
   ;	    if (shld_supply < 0x3C)
   ;	
	cmp	word ptr DGROUP:_shld_supply,60
	jge	short @6@4
   ;	
   ;	        shld_supply = 0x3C;
   ;	
	mov	word ptr DGROUP:_shld_supply,60
@6@4:
   ;	
   ;	    cur_message = -1;
   ;	
	mov	word ptr DGROUP:_cur_message,-1
   ;	
   ;	    message_posted = 0;
   ;	
	mov	byte ptr DGROUP:_message_posted,0
   ;	
   ;	    clear_message();
   ;	
	call	far ptr @clear_message$qv
   ;	
   ;	    update_shld_guage(0, 0x68, 0xB3);
   ;	
	push	179
	push	104
	push	0
	call	far ptr @update_shld_guage$qiii
	add	sp,6
   ;	
   ;	    update_air_guage(0, 0x68, 0xA7);
   ;	
	push	167
	push	104
	push	0
	call	far ptr @update_air_guage$qiii
	add	sp,6
   ;	
   ;	    update_score(0x10D, 0x9F);
   ;	
	push	159
	push	269
	call	far ptr @update_score$qii
	add	sp,4
   ;	
   ;	    update_men();
   ;	
	call	far ptr @update_men$qv
   ;	
   ;	    update_gun();
   ;	
	call	far ptr @update_gun$qv
   ;	
   ;	    update_key_guage();
   ;	
	call	far ptr @update_key_guage$qv
   ;	
   ;	    top_shot_count = 0;
   ;	
	mov	byte ptr DGROUP:_top_shot_count,0
   ;	
   ;	    shot_count = 0;
   ;	
	mov	byte ptr DGROUP:_shot_count,0
   ;	
   ;	    jason_count = 0;
   ;	
	mov	byte ptr DGROUP:_jason_count,0
   ;	
   ;	    boss = NULL;
   ;	
	mov	dword ptr DGROUP:_boss,large 0
   ;	
   ;	
   ;	    if (the_map == NULL) {
   ;	
	cmp	dword ptr DGROUP:_the_map,large 0
	jne	short @6@9
   ;	
   ;	        the_map = new tilemap(path, 0, 0);
   ;	
	push	930
	call	far ptr @$bnew$qui
	pop	cx
	mov	word ptr [bp-2],dx
	mov	word ptr [bp-4],ax
	or	ax,dx
	je	short @6@7
	mov	word ptr [bp-22],14
	push	0
	push	0
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @tilemap@$bctr$qnucii
	add	sp,12
	dec	dword ptr ss:[16]
	mov	word ptr [bp-22],6
@6@7:
	mov	dx,word ptr [bp-2]
	mov	ax,word ptr [bp-4]
	mov	word ptr DGROUP:_the_map+2,dx
	mov	word ptr DGROUP:_the_map,ax
   ;	
   ;	        the_map->set_viewport(0x10, 8, 0x120, 0x87);
   ;	
	push	135
	push	288
	push	8
	push	16
	push	word ptr DGROUP:_the_map+2
	push	word ptr DGROUP:_the_map
	call	far ptr @tilemap@set_viewport$qiiii
	jmp	short @6@10
@6@9:
   ;	
   ;	    } else {
   ;	        the_map->new_map(path, 0, 0);
   ;	
	push	0
	push	0
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	word ptr DGROUP:_the_map+2
	push	word ptr DGROUP:_the_map
	call	far ptr @tilemap@new_map$qve
@6@10:
	add	sp,12
   ;	
   ;	    }
   ;	    the_map->exploded = the_game->game_speed;
   ;	
	les	bx,dword ptr DGROUP:_the_game
	mov	al,byte ptr es:[bx+34]
	les	bx,dword ptr DGROUP:_the_map
	mov	byte ptr es:[bx+924],al
   ;	
   ;	    the_map->purge_tiles();
   ;	
	push	word ptr DGROUP:_the_map+2
	push	word ptr DGROUP:_the_map
	call	far ptr @tilemap@purge_tiles$qv
	add	sp,4
   ;	
   ;	
   ;	    start_x = (the_map->map_hdr[0] % the_map->map_width) << 3;
   ;	
	les	bx,dword ptr DGROUP:_the_map
	mov	ax,word ptr es:[bx+36]
	les	bx,dword ptr DGROUP:_the_map
	cwd	
	idiv	word ptr es:[bx+142]
	shl	dx,3
	mov	word ptr DGROUP:_start_x,dx
   ;	
   ;	    start_y = (the_map->map_hdr[0] / the_map->map_width) << 3;
   ;	
	les	bx,dword ptr DGROUP:_the_map
	mov	ax,word ptr es:[bx+36]
	les	bx,dword ptr DGROUP:_the_map
	cwd	
	idiv	word ptr es:[bx+142]
	shl	ax,3
	mov	word ptr DGROUP:_start_y,ax
   ;	
   ;	    the_map->center_on(start_x, start_y);
   ;	
	push	word ptr DGROUP:_start_y
	push	word ptr DGROUP:_start_x
	push	word ptr DGROUP:_the_map+2
	push	word ptr DGROUP:_the_map
	call	far ptr @tilemap@center_on$quiui
	add	sp,8
   ;	
   ;	
   ;	    for (pos = 0; pos < (uint)the_map->map_size; ++pos) {
   ;	
	mov	word ptr [bp-36],0
	jmp	short @6@19
@6@12:
   ;	
   ;	        attr = the_map->tile_attr[pos * 2 + 1];     /* 4-byte recs, word at +2 */
   ;	
	les	bx,dword ptr DGROUP:_the_map
	les	bx,dword ptr es:[bx+926]
	mov	ax,word ptr [bp-36]
	add	ax,ax
	inc	ax
	add	ax,ax
	add	bx,ax
	mov	ax,word ptr es:[bx]
	mov	word ptr [bp-38],ax
   ;	
   ;	        bits = attr & 0xC0;
   ;	
	mov	ax,word ptr [bp-38]
	and	ax,192
	mov	word ptr [bp-40],ax
   ;	
   ;	        if (bits) add_switch(pos, bits);
   ;	
	cmp	word ptr [bp-40],0
	je	short @6@14
	push	word ptr [bp-40]
	push	word ptr [bp-36]
	call	far ptr @add_switch$quiui
	add	sp,4
@6@14:
   ;	
   ;	        bits = attr & 0x300;
   ;	
	mov	ax,word ptr [bp-38]
	and	ax,768
	mov	word ptr [bp-40],ax
   ;	
   ;	        if (bits) add_door(pos, bits);
   ;	
	cmp	word ptr [bp-40],0
	je	short @6@16
	push	word ptr [bp-40]
	push	word ptr [bp-36]
	call	far ptr @add_door$quiui
	add	sp,4
@6@16:
   ;	
   ;	        bits = attr & 0x3F;
   ;	
	mov	ax,word ptr [bp-38]
	and	ax,63
	mov	word ptr [bp-40],ax
   ;	
   ;	        if (bits) add_barrel(pos, bits);
   ;	
	cmp	word ptr [bp-40],0
	je	short @6@18
	push	word ptr [bp-40]
	push	word ptr [bp-36]
	call	far ptr @add_barrel$quiui
	add	sp,4
@6@18:
	inc	word ptr [bp-36]
@6@19:
	les	bx,dword ptr DGROUP:_the_map
	mov	ax,word ptr es:[bx+148]
	cmp	ax,word ptr [bp-36]
	ja	@6@12
   ;	
   ;	    }
   ;	    for (pos = 0; pos < (uint)the_map->map_size; ++pos) {
   ;	
	mov	word ptr [bp-36],0
	jmp	short @6@24
@6@21:
   ;	
   ;	        attr = the_map->tile_attr[pos * 2 + 1];
   ;	
	les	bx,dword ptr DGROUP:_the_map
	les	bx,dword ptr es:[bx+926]
	mov	ax,word ptr [bp-36]
	add	ax,ax
	inc	ax
	add	ax,ax
	add	bx,ax
	mov	ax,word ptr es:[bx]
	mov	word ptr [bp-38],ax
   ;	
   ;	        bits = attr & 0xFC00;
   ;	
	mov	ax,word ptr [bp-38]
	and	ax,-1024
	mov	word ptr [bp-40],ax
   ;	
   ;	        if (bits) add_map_item(pos, bits);
   ;	
	cmp	word ptr [bp-40],0
	je	short @6@23
	push	word ptr [bp-40]
	push	word ptr [bp-36]
	call	far ptr @add_map_item$quiui
	add	sp,4
@6@23:
	inc	word ptr [bp-36]
@6@24:
	les	bx,dword ptr DGROUP:_the_map
	mov	ax,word ptr es:[bx+148]
	cmp	ax,word ptr [bp-36]
	ja	short @6@21
   ;	
   ;	    }
   ;	
   ;	    if (the_map->map_hdr[0] % 2) {                  /* odd start -> face left */
   ;	
	les	bx,dword ptr DGROUP:_the_map
	mov	ax,word ptr es:[bx+36]
	mov	bx,2
	cwd	
	idiv	bx
	or	dx,dx
	je	short @6@27
   ;	
   ;	        ego = the_cast->add((uchar *)"subl.l", mv_ego, do_ego);
   ;	
	push	seg @do_ego$qn7m_actor
	push	offset @do_ego$qn7m_actor
	push	seg @mv_ego$qn7m_actornit2
	push	offset @mv_ego$qn7m_actornit2
	push	ds
	push	offset DGROUP:s@+1661
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_ego+2,dx
	mov	word ptr DGROUP:_ego,ax
   ;	
   ;	        ego->direction = 1;
   ;	
	les	bx,dword ptr DGROUP:_ego
	mov	byte ptr es:[bx+52],1
   ;	
   ;	    } else {
   ;	
	jmp	short @6@28
@6@27:
   ;	
   ;	        ego = the_cast->add((uchar *)"subr.l", mv_ego, do_ego);
   ;	
	push	seg @do_ego$qn7m_actor
	push	offset @do_ego$qn7m_actor
	push	seg @mv_ego$qn7m_actornit2
	push	offset @mv_ego$qn7m_actornit2
	push	ds
	push	offset DGROUP:s@+1668
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_ego+2,dx
	mov	word ptr DGROUP:_ego,ax
   ;	
   ;	        ego->direction = 0;
   ;	
	les	bx,dword ptr DGROUP:_ego
	mov	byte ptr es:[bx+52],0
@6@28:
   ;	
   ;	    }
   ;	    ego->set_cycle(0x0C, 1);
   ;	
	push	1
	push	12
	push	word ptr DGROUP:_ego+2
	push	word ptr DGROUP:_ego
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
   ;	
   ;	    ego->state = 0;
   ;	
	les	bx,dword ptr DGROUP:_ego
	mov	byte ptr es:[bx+61],0
   ;	
   ;	    ego->set_xy(start_x, start_y);
   ;	
	push	word ptr DGROUP:_start_y
	push	word ptr DGROUP:_start_x
	push	word ptr DGROUP:_ego+2
	push	word ptr DGROUP:_ego
	call	far ptr @m_actor@set_xy$qii
	add	sp,8
   ;	
   ;	    ego->type = 0x11;
   ;	
	les	bx,dword ptr DGROUP:_ego
	mov	byte ptr es:[bx+53],17
   ;	
   ;	    ego_map_w = (ego->width >> 3) + 1;
   ;	
	les	bx,dword ptr DGROUP:_ego
	mov	ax,word ptr es:[bx+16]
	sar	ax,3
	inc	ax
	mov	word ptr DGROUP:_ego_map_w,ax
   ;	
   ;	    ego_map_h = (ego->height >> 3) + 1;
   ;	
	les	bx,dword ptr DGROUP:_ego
	mov	ax,word ptr es:[bx+18]
	sar	ax,3
	inc	ax
	mov	word ptr DGROUP:_ego_map_h,ax
   ;	
   ;	    cur_sub = ego;
   ;	
	mov	eax,dword ptr DGROUP:_ego
	mov	dword ptr DGROUP:_cur_sub,eax
   ;	
   ;	    if (jason_present)
   ;	
	cmp	byte ptr DGROUP:_jason_present,0
	je	short @6@30
   ;	
   ;	        add_jason();
   ;	
	call	far ptr @add_jason$qv
@6@30:
   ;	
   ;	    update_jason_guage();
   ;	
	call	far ptr @update_jason_guage$qv
   ;	
   ;	    hook_up_switches();
   ;	
	call	far ptr @hook_up_switches$qv
   ;	
   ;	    finish_tile = the_map->map_hdr[1];
   ;	
	les	bx,dword ptr DGROUP:_the_map
	mov	ax,word ptr es:[bx+38]
	mov	word ptr DGROUP:_finish_tile,ax
   ;	
   ;	    end_door_tile = the_map->map_hdr[2];
   ;	
	les	bx,dword ptr DGROUP:_the_map
	mov	ax,word ptr es:[bx+40]
	mov	word ptr DGROUP:_end_door_tile,ax
   ;	
   ;	    add_door(the_map->map_hdr[3], 0xFF);
   ;	
	push	255
	les	bx,dword ptr DGROUP:_the_map
	push	word ptr es:[bx+42]
	call	far ptr @add_door$quiui
	add	sp,4
   ;	
   ;	    secret_tile = the_map->map_hdr[4];
   ;	
	les	bx,dword ptr DGROUP:_the_map
	mov	ax,word ptr es:[bx+44]
	mov	word ptr DGROUP:_secret_tile,ax
   ;	
   ;	
   ;	    teleport_count = 0;
   ;	
	mov	byte ptr DGROUP:_teleport_count,0
   ;	
   ;	    for (pos = 0x0A; pos < 0x1E; pos += 2) {        /* teleport pairs */
   ;	
	mov	word ptr [bp-36],10
	jmp	short @6@34
@6@31:
   ;	
   ;	        if (the_map->map_hdr[pos] != 0) {
   ;	
	mov	ax,word ptr [bp-36]
	add	ax,ax
	les	bx,dword ptr DGROUP:_the_map
	add	bx,ax
	cmp	word ptr es:[bx+36],0
	je	short @6@33
   ;	
   ;	            all_teleports[teleport_count][0] = the_map->map_hdr[pos];
   ;	
	mov	ax,word ptr [bp-36]
	add	ax,ax
	les	bx,dword ptr DGROUP:_the_map
	add	bx,ax
	mov	ax,word ptr es:[bx+36]
	mov	dl,byte ptr DGROUP:_teleport_count
	mov	dh,0
	shl	dx,2
	mov	bx,dx
	mov	word ptr DGROUP:_all_teleports[bx],ax
   ;	
   ;	            all_teleports[teleport_count][1] = the_map->map_hdr[pos + 1];
   ;	
	mov	ax,word ptr [bp-36]
	inc	ax
	add	ax,ax
	les	bx,dword ptr DGROUP:_the_map
	add	bx,ax
	mov	ax,word ptr es:[bx+36]
	mov	dl,byte ptr DGROUP:_teleport_count
	mov	dh,0
	shl	dx,2
	mov	bx,dx
	mov	word ptr DGROUP:_all_teleports[bx+2],ax
   ;	
   ;	            ++teleport_count;
   ;	
	mov	al,byte ptr DGROUP:_teleport_count
	inc	al
	mov	byte ptr DGROUP:_teleport_count,al
@6@33:
	add	word ptr [bp-36],2
@6@34:
	cmp	word ptr [bp-36],30
	jb	short @6@31
   ;	
   ;	        }
   ;	    }
   ;	
   ;	    message_count = 0;
   ;	
	mov	byte ptr DGROUP:_message_count,0
   ;	
   ;	    for (pos = 0x1E; pos < 0x28; pos += 2) {        /* message pairs */
   ;	
	mov	word ptr [bp-36],30
	jmp	short @6@39
@6@36:
   ;	
   ;	        if (the_map->map_hdr[pos] == 0)
   ;	
	mov	ax,word ptr [bp-36]
	add	ax,ax
	les	bx,dword ptr DGROUP:_the_map
	add	bx,ax
	cmp	word ptr es:[bx+36],0
	je	short @6@40
   ;	
   ;	            break;
   ;	        map_messages[message_count]     = the_map->map_hdr[pos];
   ;	
	mov	ax,word ptr [bp-36]
	add	ax,ax
	les	bx,dword ptr DGROUP:_the_map
	add	bx,ax
	mov	ax,word ptr es:[bx+36]
	mov	dl,byte ptr DGROUP:_message_count
	mov	dh,0
	add	dx,dx
	mov	bx,dx
	mov	word ptr DGROUP:_map_messages[bx],ax
   ;	
   ;	        map_messages[message_count + 1] = the_map->map_hdr[pos + 1];
   ;	
	mov	ax,word ptr [bp-36]
	inc	ax
	add	ax,ax
	les	bx,dword ptr DGROUP:_the_map
	add	bx,ax
	mov	ax,word ptr es:[bx+36]
	mov	dl,byte ptr DGROUP:_message_count
	mov	dh,0
	add	dx,dx
	mov	bx,dx
	mov	word ptr DGROUP:_map_messages[bx+2],ax
   ;	
   ;	        message_count += 2;
   ;	
	mov	al,byte ptr DGROUP:_message_count
	add	al,2
	mov	byte ptr DGROUP:_message_count,al
	add	word ptr [bp-36],2
@6@39:
	cmp	word ptr [bp-36],40
	jb	short @6@36
@6@40:
   ;	
   ;	    }
   ;	
   ;	    display->field_06 = 1;
   ;	
	les	bx,dword ptr DGROUP:_display
	mov	byte ptr es:[bx+6],1
   ;	
   ;	    control = 0;
   ;	
	mov	byte ptr DGROUP:_control,0
   ;	
   ;	    de_doit();                                      /* draw initial frame */
   ;	
	call	far ptr @de_doit$qv
   ;	
   ;	    control = 1;
   ;	
	mov	byte ptr DGROUP:_control,1
   ;	
   ;	    display->field_06 = 0;
   ;	
	les	bx,dword ptr DGROUP:_display
	mov	byte ptr es:[bx+6],0
   ;	
   ;	    display->copy_page(non_displayed_page, displayed_page);
   ;	
	mov	al,byte ptr DGROUP:_displayed_page
	push	ax
	mov	al,byte ptr DGROUP:_non_displayed_page
	push	ax
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@copy_page$qucuc
	add	sp,8
   ;	
   ;	    if (heavy_timer <= 5 && heavy_timer != 0)
   ;	
	cmp	word ptr DGROUP:_heavy_timer,5
	jg	short @6@43
	cmp	word ptr DGROUP:_heavy_timer,0
	je	short @6@43
   ;	
   ;	        display->put_bits(0x80, 0x97, 0xBE, 0xA1,
   ;	
   ;	
   ;	                          (uchar far *)gun_underbits, 0, 0);
   ;	
	push	0
	push	0
	push	word ptr DGROUP:_gun_underbits+2
	push	word ptr DGROUP:_gun_underbits
	push	161
	push	190
	push	151
	push	128
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@put_bits$qiiiinucuiui
	add	sp,20
@6@43:
   ;	
   ;	    display->fade_up();
   ;	
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@fade_up$qv
	add	sp,4
   ;	
   ;	}
   ;	
	mov	ax,word ptr [bp-34]
	mov	word ptr ss:[20],ax
	leave	
	ret	
@start_room$qnuc	endp
	assume	cs:GAME_TEXT,ds:DGROUP
@de_doit$qv	proc	far
   ;	
   ;	void de_doit(void)
   ;	
	enter	14,0
	push	si
   ;	
   ;	{
   ;	    uint i;             /* var_8 */
   ;	    int  cx;            /* var_4 */
   ;	    int  cy;            /* var_6 */
   ;	    uchar centered;     /* var_1 */
   ;	    uint dist;          /* var_A */
   ;	    ulong n;            /* var_E */
   ;	
   ;	    barrier_count = shootable_count = 0;
   ;	
	mov	al,0
	mov	byte ptr DGROUP:_shootable_count,al
	mov	byte ptr DGROUP:_barrier_count,al
   ;	
   ;	
   ;	    for (i = 0; i < the_cast->count; i++) {
   ;	
	mov	word ptr [bp-2],0
	jmp	@7@15
@7@2:
   ;	
   ;	        act = the_cast->actors[i];
   ;	
	mov	ax,word ptr [bp-2]
	shl	ax,2
	les	bx,dword ptr DGROUP:_the_cast
	add	bx,ax
	mov	ax,word ptr es:[bx+4]
	mov	dx,word ptr es:[bx+2]
	mov	word ptr DGROUP:_act+2,ax
	mov	word ptr DGROUP:_act,dx
   ;	
   ;	        if (act->type & 2) {
   ;	
	les	bx,dword ptr DGROUP:_act
	test	byte ptr es:[bx+53],2
	je	short @7@7
   ;	
   ;	            if (barrier_count == 0x22)
   ;	
	cmp	byte ptr DGROUP:_barrier_count,34
	jne	short @7@5
   ;	
   ;	                terminate((uchar far *)"Too many barriers for list.", 0);
   ;	
	push	large 0
	push	ds
	push	offset DGROUP:s@+1675
	call	far ptr @terminate$qnuct1
	add	sp,8
@7@5:
   ;	
   ;	            if (!act->inactive)
   ;	
	les	bx,dword ptr DGROUP:_act
	test	byte ptr es:[bx+82],32
	setne	al
	jne	short @7@7
   ;	
   ;	                barrier_list[barrier_count++] = act;
   ;	
	mov	al,byte ptr DGROUP:_barrier_count
	mov	ah,0
	shl	ax,2
	mov	dx,word ptr DGROUP:_act+2
	mov	bx,word ptr DGROUP:_act
	mov	si,ax
	mov	word ptr DGROUP:_barrier_list[si+2],dx
	mov	word ptr DGROUP:_barrier_list[si],bx
	inc	byte ptr DGROUP:_barrier_count
@7@7:
   ;	
   ;	        }
   ;	        if (act->shootable == 1 && (act->type & 1) && !(act->type & 0x10)) {
   ;	
	les	bx,dword ptr DGROUP:_act
	test	byte ptr es:[bx+82],2
	setne	al
	mov	ah,0
	cmp	ax,1
	jne	short @7@14
	les	bx,dword ptr DGROUP:_act
	test	byte ptr es:[bx+53],1
	je	short @7@14
	les	bx,dword ptr DGROUP:_act
	test	byte ptr es:[bx+53],16
	jne	short @7@14
   ;	
   ;	            if (shootable_count == 0x1D)
   ;	
	cmp	byte ptr DGROUP:_shootable_count,29
	jne	short @7@12
   ;	
   ;	                terminate((uchar far *)"Too many shootables.", 0);
   ;	
	push	large 0
	push	ds
	push	offset DGROUP:s@+1703
	call	far ptr @terminate$qnuct1
	add	sp,8
@7@12:
   ;	
   ;	            if (!act->inactive)
   ;	
	les	bx,dword ptr DGROUP:_act
	test	byte ptr es:[bx+82],32
	setne	al
	jne	short @7@14
   ;	
   ;	                shootable_list[shootable_count++] = act;
   ;	
	mov	al,byte ptr DGROUP:_shootable_count
	mov	ah,0
	shl	ax,2
	mov	dx,word ptr DGROUP:_act+2
	mov	bx,word ptr DGROUP:_act
	mov	si,ax
	mov	word ptr DGROUP:_shootable_list[si+2],dx
	mov	word ptr DGROUP:_shootable_list[si],bx
	inc	byte ptr DGROUP:_shootable_count
@7@14:
	inc	word ptr [bp-2]
@7@15:
	les	bx,dword ptr DGROUP:_the_cast
	mov	al,byte ptr es:[bx]
	mov	ah,0
	cmp	ax,word ptr [bp-2]
	ja	@7@2
   ;	
   ;	        }
   ;	    }
   ;	
   ;	    cx = cur_sub->center_x & ~3;
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	mov	ax,word ptr es:[bx+8]
	and	ax,-4
	mov	word ptr [bp-4],ax
   ;	
   ;	    cy = cur_sub->center_y;
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	mov	ax,word ptr es:[bx+10]
	mov	word ptr [bp-6],ax
   ;	
   ;	    if (ego->state != 2)
   ;	
	les	bx,dword ptr DGROUP:_ego
	cmp	byte ptr es:[bx+61],2
	je	short @7@18
   ;	
   ;	        centered = the_map->center_on(cx, cy);
   ;	
	push	word ptr [bp-6]
	push	word ptr [bp-4]
	push	word ptr DGROUP:_the_map+2
	push	word ptr DGROUP:_the_map
	call	far ptr @tilemap@center_on$quiui
	add	sp,8
	mov	byte ptr [bp-7],al
	jmp	short @7@19
@7@18:
   ;	
   ;	    else
   ;	        centered = 0;
   ;	
	mov	byte ptr [bp-7],0
@7@19:
   ;	
   ;	    the_cast->update(centered);
   ;	
	mov	al,byte ptr [bp-7]
	push	ax
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@update$quc
	add	sp,6
   ;	
   ;	    the_map->update(page_offsets[non_displayed_page]);
   ;	
	mov	al,byte ptr DGROUP:_non_displayed_page
	mov	ah,0
	add	ax,ax
	mov	bx,ax
	push	word ptr DGROUP:_page_offsets[bx]
	push	word ptr DGROUP:_the_map+2
	push	word ptr DGROUP:_the_map
	call	far ptr @tilemap@update$qui
	add	sp,6
   ;	
   ;	    if (cur_map == 6 || cur_map == 0x0C || cur_map == 0x15)
   ;	
	cmp	byte ptr DGROUP:_cur_map,6
	je	short @7@22
	cmp	byte ptr DGROUP:_cur_map,12
	je	short @7@22
	cmp	byte ptr DGROUP:_cur_map,21
	jne	short @7@23
@7@22:
   ;	
   ;	        update_boss_guage();
   ;	
	call	far ptr @update_boss_guage$qv
@7@23:
   ;	
   ;	    i = display->doit();
   ;	
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@doit$qv
	add	sp,4
	mov	ah,0
	mov	word ptr [bp-2],ax
   ;	
   ;	    display->show_offset(page_offsets[non_displayed_page]);
   ;	
	mov	al,byte ptr DGROUP:_non_displayed_page
	mov	ah,0
	add	ax,ax
	mov	bx,ax
	push	word ptr DGROUP:_page_offsets[bx]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@show_offset$qui
	add	sp,6
   ;	
   ;	    if (i && !display->field_06)
   ;	
	cmp	word ptr [bp-2],0
	je	short @7@26
	les	bx,dword ptr DGROUP:_display
	cmp	byte ptr es:[bx+6],0
	jne	short @7@26
   ;	
   ;	        forcepal(palette, 1);
   ;	
	push	1
	push	ds
	push	offset DGROUP:_palette
	call	far ptr _forcepal
	add	sp,6
@7@26:
   ;	
   ;	    if (the_map->exploded == 2)
   ;	
	les	bx,dword ptr DGROUP:_the_map
	cmp	byte ptr es:[bx+924],2
	jne	short @7@28
   ;	
   ;	        display->pause(1);
   ;	
	push	1
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@pause$qui
	add	sp,6
@7@28:
   ;	
   ;	    displayed_page = non_displayed_page;
   ;	
	mov	al,byte ptr DGROUP:_non_displayed_page
	mov	byte ptr DGROUP:_displayed_page,al
   ;	
   ;	    non_displayed_page ^= 1;
   ;	
	xor	byte ptr DGROUP:_non_displayed_page,1
   ;	
   ;	    the_game->doit();
   ;	
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@doit$qv
	add	sp,4
   ;	
   ;	    check_user();
   ;	
	call	far ptr @check_user$qv
   ;	
   ;	    check_guages();
   ;	
	call	far ptr @check_guages$qv
   ;	
   ;	
   ;	    if (jason_on == 0) {
   ;	
	cmp	byte ptr DGROUP:_jason_on,0
	jne	@7@42
   ;	
   ;	        if (ego->on_pos(finish_tile))
   ;	
	push	word ptr DGROUP:_finish_tile
	push	word ptr DGROUP:_ego+2
	push	word ptr DGROUP:_ego
	call	far ptr @m_actor@on_pos$qui
	add	sp,6
	or	al,al
	je	short @7@31
   ;	
   ;	            stop_room = 1;
   ;	
	mov	byte ptr DGROUP:_stop_room,1
@7@31:
   ;	
   ;	        if (secret_tile && ego->on_pos(secret_tile))
   ;	
	cmp	word ptr DGROUP:_secret_tile,0
	je	short @7@34
	push	word ptr DGROUP:_secret_tile
	push	word ptr DGROUP:_ego+2
	push	word ptr DGROUP:_ego
	call	far ptr @m_actor@on_pos$qui
	add	sp,6
	or	al,al
	je	short @7@34
   ;	
   ;	            stop_room = 6;
   ;	
	mov	byte ptr DGROUP:_stop_room,6
@7@34:
   ;	
   ;	        if (ego->on_pos(end_door_tile)) {
   ;	
	push	word ptr DGROUP:_end_door_tile
	push	word ptr DGROUP:_ego+2
	push	word ptr DGROUP:_ego
	call	far ptr @m_actor@on_pos$qui
	add	sp,6
	or	al,al
	je	short @7@42
   ;	
   ;	            if (!end_door_ptr)
   ;	
	cmp	dword ptr DGROUP:_end_door_ptr,large 0
	jne	short @7@37
   ;	
   ;	                terminate((uchar far *)"End door switch without door.", 0);
   ;	
	push	large 0
	push	ds
	push	offset DGROUP:s@+1724
	call	far ptr @terminate$qnuct1
	add	sp,8
@7@37:
   ;	
   ;	            if (!end_door_ptr->door_open && got_key)
   ;	
	les	bx,dword ptr DGROUP:_end_door_ptr
	test	byte ptr es:[bx+82],64
	setne	al
	jne	short @7@40
	cmp	byte ptr DGROUP:_got_key,0
	je	short @7@40
   ;	
   ;	                end_door_ptr->door_open = 1;
   ;	
	les	bx,dword ptr DGROUP:_end_door_ptr
	or	byte ptr es:[bx+82],64
@7@40:
   ;	
   ;	            if (!got_key)
   ;	
	cmp	byte ptr DGROUP:_got_key,0
	jne	short @7@42
   ;	
   ;	                post_message(0);
   ;	
	push	0
	call	far ptr @post_message$quc
	pop	cx
@7@42:
   ;	
   ;	        }
   ;	    }
   ;	
   ;	    if (heavy_timer) {
   ;	
	cmp	word ptr DGROUP:_heavy_timer,0
	je	short @7@47
   ;	
   ;	        if (heavy_timer == 5)
   ;	
	cmp	word ptr DGROUP:_heavy_timer,5
	jne	short @7@45
   ;	
   ;	            display->put_bits(0x80, 0x97, 0xBE, 0xA1,
   ;	
   ;	
   ;	                              (uchar far *)gun_underbits, 0, 0);
   ;	
	push	0
	push	0
	push	word ptr DGROUP:_gun_underbits+2
	push	word ptr DGROUP:_gun_underbits
	push	161
	push	190
	push	151
	push	128
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@put_bits$qiiiinucuiui
	add	sp,20
@7@45:
   ;	
   ;	        if (heavy_timer == 1) {
   ;	
	cmp	word ptr DGROUP:_heavy_timer,1
	jne	short @7@47
   ;	
   ;	            gun_count = 0;
   ;	
	mov	byte ptr DGROUP:_gun_count,0
   ;	
   ;	            shot_size = 0;
   ;	
	mov	byte ptr DGROUP:_shot_size,0
   ;	
   ;	            display->copy_bits(0x80, 0x97, 0xBE, 0xA1, 0x80, 0x97,
   ;	
   ;	
   ;	                               page_offsets[0], page_offsets[1], 0x140, 0x140);
   ;	
	push	320
	push	320
	push	word ptr DGROUP:_page_offsets+2
	push	word ptr DGROUP:_page_offsets
	push	151
	push	128
	push	161
	push	190
	push	151
	push	128
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@copy_bits$qiiiiiiuiuiuiui
	add	sp,24
@7@47:
   ;	
   ;	        }
   ;	    }
   ;	
   ;	    if (score_count++ == 0x28) {
   ;	
	mov	al,byte ptr DGROUP:_score_count
	inc	byte ptr DGROUP:_score_count
	cmp	al,40
	jne	short @7@50
   ;	
   ;	        score_count = 0;
   ;	
	mov	byte ptr DGROUP:_score_count,0
   ;	
   ;	        update_score(0x10D, 0x9F);
   ;	
	push	159
	push	269
	call	far ptr @update_score$qii
	add	sp,4
   ;	
   ;	        if (random(3) == 0)
   ;	
	push	3
	call	far ptr @random$qi
	pop	cx
	or	ax,ax
	jne	short @7@50
   ;	
   ;	            the_game->play_sound((uchar far *)"bubbles2", 2);
   ;	
	push	2
	push	ds
	push	offset DGROUP:s@+1754
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_sound$qnucuc
	add	sp,10
@7@50:
   ;	
   ;	    }
   ;	
   ;	    if (displayed_page == 0) {
   ;	
	cmp	byte ptr DGROUP:_displayed_page,0
	jne	@7@73
   ;	
   ;	        if (cur_map == 0) {
   ;	
	cmp	byte ptr DGROUP:_cur_map,0
	jne	@7@64
   ;	
   ;	            if (!jason_msg && cur_sub->on_pos(0x823)) {
   ;	
	cmp	byte ptr DGROUP:_jason_msg,0
	jne	short @7@55
	push	2083
	push	word ptr DGROUP:_cur_sub+2
	push	word ptr DGROUP:_cur_sub
	call	far ptr @m_actor@on_pos$qui
	add	sp,6
	or	al,al
	je	short @7@55
   ;	
   ;	                jason_msg = 1;
   ;	
	mov	byte ptr DGROUP:_jason_msg,1
   ;	
   ;	                post_message(0x0E);
   ;	
	push	14
	call	far ptr @post_message$quc
	pop	cx
@7@55:
   ;	
   ;	            }
   ;	            if (!barrel_msg && cur_sub->on_pos(0x403)) {
   ;	
	cmp	byte ptr DGROUP:_barrel_msg,0
	jne	short @7@58
	push	1027
	push	word ptr DGROUP:_cur_sub+2
	push	word ptr DGROUP:_cur_sub
	call	far ptr @m_actor@on_pos$qui
	add	sp,6
	or	al,al
	je	short @7@58
   ;	
   ;	                barrel_msg = 1;
   ;	
	mov	byte ptr DGROUP:_barrel_msg,1
   ;	
   ;	                post_message(0x0A);
   ;	
	push	10
	call	far ptr @post_message$quc
	pop	cx
@7@58:
   ;	
   ;	            }
   ;	            if (!gun_msg && cur_sub->on_pos(0xC23)) {
   ;	
	cmp	byte ptr DGROUP:_gun_msg,0
	jne	short @7@61
	push	3107
	push	word ptr DGROUP:_cur_sub+2
	push	word ptr DGROUP:_cur_sub
	call	far ptr @m_actor@on_pos$qui
	add	sp,6
	or	al,al
	je	short @7@61
   ;	
   ;	                gun_msg = 1;
   ;	
	mov	byte ptr DGROUP:_gun_msg,1
   ;	
   ;	                post_message(0x0C);
   ;	
	push	12
	call	far ptr @post_message$quc
	pop	cx
@7@61:
   ;	
   ;	            }
   ;	            if (!cave_msg && cur_sub->on_pos(0x687)) {
   ;	
	cmp	byte ptr DGROUP:_cave_msg,0
	jne	short @7@64
	push	1671
	push	word ptr DGROUP:_cur_sub+2
	push	word ptr DGROUP:_cur_sub
	call	far ptr @m_actor@on_pos$qui
	add	sp,6
	or	al,al
	je	short @7@64
   ;	
   ;	                cave_msg = 1;
   ;	
	mov	byte ptr DGROUP:_cave_msg,1
   ;	
   ;	                post_message(0x0D);
   ;	
	push	13
	call	far ptr @post_message$quc
	pop	cx
@7@64:
   ;	
   ;	            }
   ;	        }
   ;	        for (i = 0; i < message_count; i += 2) {
   ;	
	mov	word ptr [bp-2],0
	jmp	short @7@69
@7@65:
   ;	
   ;	            if (map_messages[i] && cur_sub->on_pos(map_messages[i])) {
   ;	
	mov	bx,word ptr [bp-2]
	add	bx,bx
	cmp	word ptr DGROUP:_map_messages[bx],0
	je	short @7@68
	mov	bx,word ptr [bp-2]
	add	bx,bx
	push	word ptr DGROUP:_map_messages[bx]
	push	word ptr DGROUP:_cur_sub+2
	push	word ptr DGROUP:_cur_sub
	call	far ptr @m_actor@on_pos$qui
	add	sp,6
	or	al,al
	je	short @7@68
   ;	
   ;	                post_message(map_messages[i + 1]);
   ;	
	mov	bx,word ptr [bp-2]
	inc	bx
	add	bx,bx
	mov	al,byte ptr DGROUP:_map_messages[bx]
	push	ax
	call	far ptr @post_message$quc
	pop	cx
   ;	
   ;	                map_messages[i] = 0;
   ;	
	mov	bx,word ptr [bp-2]
	add	bx,bx
	mov	word ptr DGROUP:_map_messages[bx],0
@7@68:
	add	word ptr [bp-2],2
@7@69:
	mov	al,byte ptr DGROUP:_message_count
	mov	ah,0
	cmp	ax,word ptr [bp-2]
	ja	short @7@65
   ;	
   ;	            }
   ;	        }
   ;	        if (message_posted && --message_posted == 0)
   ;	
	cmp	byte ptr DGROUP:_message_posted,0
	je	short @7@73
	mov	al,byte ptr DGROUP:_message_posted
	add	al,255
	mov	byte ptr DGROUP:_message_posted,al
	or	al,al
	jne	short @7@73
   ;	
   ;	            clear_message();
   ;	
	call	far ptr @clear_message$qv
@7@73:
   ;	
   ;	    }
   ;	
   ;	    if (cur_map == 0x15 && the_game->field_0F == 1) {
   ;	
	cmp	byte ptr DGROUP:_cur_map,21
	jne	@7@101
	les	bx,dword ptr DGROUP:_the_game
	cmp	byte ptr es:[bx+15],1
	jne	@7@101
   ;	
   ;	        pause(2);
   ;	
	push	2
	call	far ptr @pause$qui
	pop	cx
   ;	
   ;	        dist = abs(ego->x - boss->old_x);
   ;	
	les	bx,dword ptr DGROUP:_boss
	push	es
	les	si,dword ptr DGROUP:_ego
	mov	ax,word ptr es:[si]
	pop	es
	sub	ax,word ptr es:[bx+4]
	push	ax
	call	far ptr @abs$qi
	pop	cx
	mov	word ptr [bp-10],ax
   ;	
   ;	        if (the_game->field_10 == 0) {
   ;	
	les	bx,dword ptr DGROUP:_the_game
	cmp	byte ptr es:[bx+16],0
	jne	@7@89
   ;	
   ;	            if (control)
   ;	
	cmp	byte ptr DGROUP:_control,0
	je	short @7@78
   ;	
   ;	                control = 0;
   ;	
	mov	byte ptr DGROUP:_control,0
@7@78:
   ;	
   ;	            if (cur_sub->old_y != boss->center_y) {
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	mov	ax,word ptr es:[bx+6]
	les	bx,dword ptr DGROUP:_boss
	cmp	ax,word ptr es:[bx+10]
	je	short @7@82
   ;	
   ;	                ego->x_speed = 0;
   ;	
	les	bx,dword ptr DGROUP:_ego
	mov	word ptr es:[bx+20],0
   ;	
   ;	                if (ego->old_y < boss->center_y)
   ;	
	les	bx,dword ptr DGROUP:_ego
	mov	ax,word ptr es:[bx+6]
	les	bx,dword ptr DGROUP:_boss
	cmp	ax,word ptr es:[bx+10]
	jge	short @7@81
   ;	
   ;	                    ego->y_speed = 1;
   ;	
	les	bx,dword ptr DGROUP:_ego
	mov	word ptr es:[bx+22],1
	jmp	@7@101
@7@81:
   ;	
   ;	                else
   ;	                    ego->y_speed = -1;
   ;	
	les	bx,dword ptr DGROUP:_ego
	mov	word ptr es:[bx+22],-1
	jmp	@7@101
@7@82:
   ;	
   ;	            } else if (dist > 4) {
   ;	
	cmp	word ptr [bp-10],4
	jbe	short @7@86
   ;	
   ;	                ego->y_speed = 0;
   ;	
	les	bx,dword ptr DGROUP:_ego
	mov	word ptr es:[bx+22],0
   ;	
   ;	                if (boss->old_x > ego->x)
   ;	
	les	bx,dword ptr DGROUP:_boss
	mov	ax,word ptr es:[bx+4]
	les	bx,dword ptr DGROUP:_ego
	cmp	ax,word ptr es:[bx]
	jle	short @7@85
   ;	
   ;	                    ego->x_speed = 4;
   ;	
	les	bx,dword ptr DGROUP:_ego
	mov	word ptr es:[bx+20],4
	jmp	@7@101
@7@85:
   ;	
   ;	                else
   ;	                    ego->x_speed = -4;
   ;	
	les	bx,dword ptr DGROUP:_ego
	mov	word ptr es:[bx+20],-4
	jmp	@7@101
@7@86:
   ;	
   ;	            } else {
   ;	                the_game->field_10 = 1;
   ;	
	les	bx,dword ptr DGROUP:_the_game
	mov	byte ptr es:[bx+16],1
   ;	
   ;	                if (ego->direction) {
   ;	
	les	bx,dword ptr DGROUP:_ego
	cmp	byte ptr es:[bx+52],0
	je	short @7@88
   ;	
   ;	                    ego->new_loop((uchar far *)"subr.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1763
	push	word ptr DGROUP:_ego+2
	push	word ptr DGROUP:_ego
	call	far ptr @m_actor@new_loop$qnuc
	add	sp,8
   ;	
   ;	                    ego->direction = 0;
   ;	
	les	bx,dword ptr DGROUP:_ego
	mov	byte ptr es:[bx+52],0
@7@88:
   ;	
   ;	                }
   ;	                act = the_cast->add((uchar far *)"chain.l", 0, 0);
   ;	
	push	large 0
	push	large 0
	push	ds
	push	offset DGROUP:s@+1770
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_act+2,dx
	mov	word ptr DGROUP:_act,ax
   ;	
   ;	                act->set_xy(cur_sub->center_x + 5 - act->width,
   ;	
   ;	
   ;	                            cur_sub->old_y);
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	push	word ptr es:[bx+6]
	les	bx,dword ptr DGROUP:_cur_sub
	mov	ax,word ptr es:[bx+8]
	add	ax,5
	les	bx,dword ptr DGROUP:_act
	sub	ax,word ptr es:[bx+16]
	push	ax
	push	word ptr DGROUP:_act+2
	push	word ptr DGROUP:_act
	call	far ptr @m_actor@set_xy$qii
	add	sp,8
   ;	
   ;	                act->set_cycle(0, 4);
   ;	
	push	4
	push	0
	push	word ptr DGROUP:_act+2
	push	word ptr DGROUP:_act
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
   ;	
   ;	                ego->target = act;
   ;	
	les	bx,dword ptr DGROUP:_ego
	mov	eax,dword ptr DGROUP:_act
	mov	dword ptr es:[bx+44],eax
   ;	
   ;	                ego->x_speed = ego->y_speed = 0;
   ;	
	les	bx,dword ptr DGROUP:_ego
	xor	ax,ax
	mov	word ptr es:[bx+22],ax
	les	bx,dword ptr DGROUP:_ego
	mov	word ptr es:[bx+20],ax
	jmp	@7@101
@7@89:
   ;	
   ;	            }
   ;	        } else {
   ;	            if (ego->target->current_loop == 2)
   ;	
	les	bx,dword ptr DGROUP:_ego
	les	bx,dword ptr es:[bx+44]
	cmp	byte ptr es:[bx+60],2
	jne	short @7@91
   ;	
   ;	                the_game->play_sound((uchar far *)"plunk2", 0x0F);
   ;	
	push	15
	push	ds
	push	offset DGROUP:s@+1778
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_sound$qnucuc
	add	sp,10
@7@91:
   ;	
   ;	            if (boss->x_speed == 0 && !ego->target->frame)
   ;	
	les	bx,dword ptr DGROUP:_boss
	cmp	word ptr es:[bx+20],0
	jne	short @7@94
	les	bx,dword ptr DGROUP:_ego
	les	bx,dword ptr es:[bx+44]
	cmp	byte ptr es:[bx+56],0
	jne	short @7@94
   ;	
   ;	                ego->x_speed = ego->target->x_speed = boss->x_speed = 4;
   ;	
	les	bx,dword ptr DGROUP:_boss
	mov	ax,4
	mov	word ptr es:[bx+20],ax
	les	bx,dword ptr DGROUP:_ego
	les	bx,dword ptr es:[bx+44]
	mov	word ptr es:[bx+20],ax
	les	bx,dword ptr DGROUP:_ego
	mov	word ptr es:[bx+20],ax
@7@94:
   ;	
   ;	            pause(3);
   ;	
	push	3
	call	far ptr @pause$qui
	pop	cx
   ;	
   ;	            if (ego->x > 0x258 && !displayed_page) {
   ;	
	les	bx,dword ptr DGROUP:_ego
	cmp	word ptr es:[bx],600
	jle	@7@101
	cmp	byte ptr DGROUP:_displayed_page,0
	jne	@7@101
   ;	
   ;	                show_loop((uchar far *)"the.l", 0x23, 0x41, 0, 0);
   ;	
	push	0
	push	0
	push	65
	push	35
	push	ds
	push	offset DGROUP:s@+1785
	call	far ptr @show_loop$qnuciiucui
	add	sp,12
   ;	
   ;	                show_loop((uchar far *)"end.l", 0xA5, 0x41, 0, 0);
   ;	
	push	0
	push	0
	push	65
	push	165
	push	ds
	push	offset DGROUP:s@+1791
	call	far ptr @show_loop$qnuciiucui
	add	sp,12
   ;	
   ;	                pause(0x12C);
   ;	
	push	300
	call	far ptr @pause$qui
	pop	cx
   ;	
   ;	                for (n = 0; n < 0x1F400; n++) {
   ;	
	mov	dword ptr [bp-14],large 0
	jmp	short @7@99
@7@97:
   ;	
   ;	                    cx = random(0x140);
   ;	
	push	320
	call	far ptr @random$qi
	pop	cx
	mov	word ptr [bp-4],ax
   ;	
   ;	                    cy = random(0xC8);
   ;	
	push	200
	call	far ptr @random$qi
	pop	cx
	mov	word ptr [bp-6],ax
   ;	
   ;	                    display->fill_rect(cx, cy, cx + 2, cy + 2,
   ;	
   ;	
   ;	                                       random(0x10) + 0x90, -1, 0);
   ;	
	push	0
	push	-1
	push	16
	call	far ptr @random$qi
	pop	cx
	add	ax,144
	push	ax
	mov	ax,word ptr [bp-6]
	add	ax,2
	push	ax
	mov	ax,word ptr [bp-4]
	add	ax,2
	push	ax
	push	word ptr [bp-6]
	push	word ptr [bp-4]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@fill_rect$qiiiiiiuc
	add	sp,18
	inc	dword ptr [bp-14]
@7@99:
	cmp	dword ptr [bp-14],large 00001F400h
	jb	short @7@97
   ;	
   ;	                }
   ;	                stop_room = 1;
   ;	
	mov	byte ptr DGROUP:_stop_room,1
@7@101:
   ;	
   ;	            }
   ;	        }
   ;	    }
   ;	}
   ;	
	pop	si
	leave	
	ret	
@de_doit$qv	endp
	assume	cs:GAME_TEXT,ds:DGROUP
@end_room$qv	proc	far
   ;	
   ;	void end_room(void)
   ;	
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    display->fade_down();
   ;	
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@fade_down$qv
	add	sp,4
   ;	
   ;	    show_stats();
   ;	
	call	far ptr @show_stats$qv
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@end_room$qv	endp
	assume	cs:GAME_TEXT,ds:DGROUP
@end_game$qv	proc	far
   ;	
   ;	void end_game(void)
   ;	
	enter	6,0
   ;	
   ;	{
   ;	    uchar       is_rec;     /* var_5 */
   ;	    uchar far   *name;      /* src   */
   ;	
   ;	    the_game->reset_sound();
   ;	
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@reset_sound$qv
	add	sp,4
   ;	
   ;	    display->show_offset(0);
   ;	
	push	0
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@show_offset$qui
	add	sp,6
   ;	
   ;	    if (stop_room == 5) {
   ;	
	cmp	byte ptr DGROUP:_stop_room,5
	jne	@9@11
   ;	
   ;	        if (random(2) == 0)
   ;	
	push	2
	call	far ptr @random$qi
	pop	cx
	or	ax,ax
	jne	short @9@4
   ;	
   ;	            display->show_pcx((uchar far *)"p_death1.pcx", 0, 0, -1);
   ;	
	push	-1
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+1797
	jmp	short @9@5
@9@4:
   ;	
   ;	        else
   ;	            display->show_pcx((uchar far *)"p_death2.pcx", 0, 0, -1);
   ;	
	push	-1
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+1810
@9@5:
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@show_pcx$qnucucuii
	add	sp,14
   ;	
   ;	        display->fade_up();
   ;	
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@fade_up$qv
	add	sp,4
   ;	
   ;	        if (the_game->sb_present)
   ;	
	les	bx,dword ptr DGROUP:_the_game
	cmp	byte ptr es:[bx+6],0
	je	short @9@8
   ;	
   ;	            the_game->play_sound_file((uchar far *)"bubbles2");
   ;	
	push	ds
	push	offset DGROUP:s@+1823
	jmp	short @9@9
@9@8:
   ;	
   ;	        else
   ;	            the_game->play_sound_file((uchar far *)"dead");
   ;	
	push	ds
	push	offset DGROUP:s@+1832
@9@9:
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_sound_file$qnuc
	add	sp,8
   ;	
   ;	        display->pause(0x5A);
   ;	
	push	90
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@pause$qui
	add	sp,6
   ;	
   ;	        display->fade_down();
   ;	
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@fade_down$qv
	add	sp,4
   ;	
   ;	        display->cls(0, 0);
   ;	
	push	0
	push	0
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@cls$qucuc
	add	sp,8
   ;	
   ;	        display->set_palette();
   ;	
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@set_palette$qv
	add	sp,4
@9@11:
   ;	
   ;	    }
   ;	    is_rec = is_record(score);
   ;	
	push	dword ptr DGROUP:_score
	call	far ptr @is_record$qul
	add	sp,4
	mov	byte ptr [bp-1],al
   ;	
   ;	    if (is_rec) {
   ;	
	cmp	byte ptr [bp-1],0
	je	short @9@17
   ;	
   ;	        if (cheat_mode == 1) {
   ;	
	cmp	byte ptr DGROUP:_cheat_mode,1
	jne	short @9@14
   ;	
   ;	            i_inform((uchar far *)"You made the top 10!  Unfortunately\nyou are a big cheater, so no cigar.", 0, (uchar far *)0)
   ;	
	push	large 0
	push	0
	push	ds
	push	offset DGROUP:s@+1837
	call	far ptr @i_inform$qnucuce
	add	sp,10
   ;	
   ;	            is_rec = 0;
   ;	
	mov	byte ptr [bp-1],0
   ;	
   ;	        } else {
   ;	
	jmp	short @9@17
@9@14:
   ;	
   ;	            name = i_get_string((uchar far *)"Enter Name",
   ;	
   ;	
   ;	                                (uchar far *)"You're in the top 10!");
   ;	
	push	ds
	push	offset DGROUP:s@+1920
	push	ds
	push	offset DGROUP:s@+1909
	call	far ptr @i_get_string$qnuct1
	add	sp,8
	mov	word ptr [bp-4],dx
	mov	word ptr [bp-6],ax
   ;	
   ;	            if (name == 0)
   ;	
	cmp	dword ptr [bp-6],large 0
	jne	short @9@16
   ;	
   ;	                name = (uchar far *)"";
   ;	
	mov	word ptr [bp-4],ds
	mov	word ptr [bp-6],offset DGROUP:s@+1942
@9@16:
   ;	
   ;	            save_new_score(score, name, 0);
   ;	
	push	0
	push	word ptr [bp-4]
	push	word ptr [bp-6]
	push	dword ptr DGROUP:_score
	call	far ptr @save_new_score$qulnucuc
	add	sp,10
@9@17:
   ;	
   ;	        }
   ;	    }
   ;	    show_high_scores(is_rec);
   ;	
	mov	al,byte ptr [bp-1]
	push	ax
	call	far ptr @show_high_scores$quc
	pop	cx
   ;	
   ;	    game_in_progress = 0;
   ;	
	mov	byte ptr DGROUP:_game_in_progress,0
   ;	
   ;	    delete gun_underbits;
   ;	
	push	word ptr DGROUP:_gun_underbits+2
	push	word ptr DGROUP:_gun_underbits
	call	far ptr @$bdele$qnv
	add	sp,4
   ;	
   ;	    delete jguage_underbits;
   ;	
	push	word ptr DGROUP:_jguage_underbits+2
	push	word ptr DGROUP:_jguage_underbits
	call	far ptr @$bdele$qnv
	add	sp,4
   ;	
   ;	    gun_underbits = 0;
   ;	
	mov	dword ptr DGROUP:_gun_underbits,large 0
   ;	
   ;	}
   ;	
	leave	
	ret	
@end_game$qv	endp
	assume	cs:GAME_TEXT,ds:DGROUP
@kill_ego$qii	proc	far
   ;	
   ;	void kill_ego(int arg0, int arg2)
   ;	
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (god_mode == 1)
   ;	
	cmp	byte ptr DGROUP:_god_mode,1
	je	@10@33
   ;	
   ;	        return;
   ;	    if (cur_sub->state == 6)
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	cmp	byte ptr es:[bx+61],6
	je	@10@33
   ;	
   ;	        return;
   ;	    if (ego->state == 2) {
   ;	
	les	bx,dword ptr DGROUP:_ego
	cmp	byte ptr es:[bx+61],2
	jne	@10@6
   ;	
   ;	        ego->erase();
   ;	
	push	word ptr DGROUP:_ego+2
	push	word ptr DGROUP:_ego
	call	far ptr @m_actor@erase$qv
	add	sp,4
   ;	
   ;	        if (death_type == 0) {
   ;	
	cmp	byte ptr DGROUP:_death_type,0
	jne	@10@9
   ;	
   ;	            the_game->load_loop(src);
   ;	
	push	ds
	push	offset DGROUP:_src
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	            ego->new_loop((uchar far *)"egodie2.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1943
	push	word ptr DGROUP:_ego+2
	push	word ptr DGROUP:_ego
	call	far ptr @m_actor@new_loop$qnuc
	add	sp,8
   ;	
   ;	            ego->set_cycle(2, 4);
   ;	
	push	4
	push	2
	push	word ptr DGROUP:_ego+2
	push	word ptr DGROUP:_ego
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
   ;	
   ;	            ego->set_xy(ego->x + 1, ego->y - 10);
   ;	
	les	bx,dword ptr DGROUP:_ego
	mov	ax,word ptr es:[bx+2]
	add	ax,-10
	push	ax
	les	bx,dword ptr DGROUP:_ego
	mov	ax,word ptr es:[bx]
	inc	ax
	push	ax
	push	word ptr DGROUP:_ego+2
	push	word ptr DGROUP:_ego
	call	far ptr @m_actor@set_xy$qii
	add	sp,8
	jmp	@10@9
@10@6:
   ;	
   ;	        }
   ;	    } else {
   ;	        the_game->play_sound((uchar far *)"swish", 0x0F);
   ;	
	push	15
	push	ds
	push	offset DGROUP:s@+1953
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_sound$qnucuc
	add	sp,10
   ;	
   ;	        the_game->load_loop((uchar far *)"gotcha.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1959
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	        ego->new_loop((uchar far *)"gotcha.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1968
	push	word ptr DGROUP:_ego+2
	push	word ptr DGROUP:_ego
	call	far ptr @m_actor@new_loop$qnuc
	add	sp,8
   ;	
   ;	        ego->set_cycle(1, 4);
   ;	
	push	4
	push	1
	push	word ptr DGROUP:_ego+2
	push	word ptr DGROUP:_ego
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
   ;	
   ;	        ego->set_xy(arg0 - 28, arg2 - 28);
   ;	
	mov	ax,word ptr [bp+8]
	add	ax,-28
	push	ax
	mov	ax,word ptr [bp+6]
	add	ax,-28
	push	ax
	push	word ptr DGROUP:_ego+2
	push	word ptr DGROUP:_ego
	call	far ptr @m_actor@set_xy$qii
	add	sp,8
   ;	
   ;	        the_game->play_sound((uchar far *)"smash", 0x0F);
   ;	
	push	15
	push	ds
	push	offset DGROUP:s@+1977
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_sound$qnucuc
	add	sp,10
   ;	
   ;	        ego->state = 2;
   ;	
	les	bx,dword ptr DGROUP:_ego
	mov	byte ptr es:[bx+61],2
   ;	
   ;	        ego->counter_24 = 0x3C;
   ;	
	les	bx,dword ptr DGROUP:_ego
	mov	word ptr es:[bx+34],60
   ;	
   ;	        ego->x_speed = ego->y_speed = 0;
   ;	
	les	bx,dword ptr DGROUP:_ego
	xor	ax,ax
	mov	word ptr es:[bx+22],ax
	les	bx,dword ptr DGROUP:_ego
	mov	word ptr es:[bx+20],ax
   ;	
   ;	        if (jason_present == 1)
   ;	
	cmp	byte ptr DGROUP:_jason_present,1
	jne	short @10@8
   ;	
   ;	            kill_jason();
   ;	
	call	far ptr @kill_jason$qv
@10@8:
   ;	
   ;	        control = 0;
   ;	
	mov	byte ptr DGROUP:_control,0
@10@9:
   ;	
   ;	    }
   ;	    if (death_type == 0 && ego->current_loop == 4)
   ;	
	cmp	byte ptr DGROUP:_death_type,0
	jne	short @10@12
	les	bx,dword ptr DGROUP:_ego
	cmp	byte ptr es:[bx+60],4
	jne	short @10@12
   ;	
   ;	        the_game->play_sound((uchar far *)"exp2", 0x0F);
   ;	
	push	15
	push	ds
	push	offset DGROUP:s@+1983
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_sound$qnucuc
	add	sp,10
@10@12:
   ;	
   ;	    if (ego->current_loop > 4 && !ego->door_open)
   ;	
	les	bx,dword ptr DGROUP:_ego
	cmp	byte ptr es:[bx+60],4
	jbe	short @10@15
	les	bx,dword ptr DGROUP:_ego
	test	byte ptr es:[bx+82],64
	setne	al
	jne	short @10@15
   ;	
   ;	        add_bubble(ego->x + random(ego->width),
   ;	
   ;	
   ;	                   ego->y + random(ego->height), 0);
   ;	
	push	0
	les	bx,dword ptr DGROUP:_ego
	push	word ptr es:[bx+18]
	call	far ptr @random$qi
	pop	cx
	les	bx,dword ptr DGROUP:_ego
	add	ax,word ptr es:[bx+2]
	push	ax
	les	bx,dword ptr DGROUP:_ego
	push	word ptr es:[bx+16]
	call	far ptr @random$qi
	pop	cx
	les	bx,dword ptr DGROUP:_ego
	add	ax,word ptr es:[bx]
	push	ax
	call	far ptr @add_bubble$qiii
	add	sp,6
@10@15:
   ;	
   ;	    if (ego->frame)
   ;	
	les	bx,dword ptr DGROUP:_ego
	cmp	byte ptr es:[bx+56],0
	jne	@10@33
   ;	
   ;	        return;
   ;	    if (death_type == 0)
   ;	
	cmp	byte ptr DGROUP:_death_type,0
	jne	short @10@18
   ;	
   ;	        the_game->remove_loop((uchar far *)"egodie2.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1988
	jmp	short @10@19
@10@18:
   ;	
   ;	    else
   ;	        the_game->remove_loop((uchar far *)"gotcha.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1998
@10@19:
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@remove_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->reset_sound();
   ;	
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@reset_sound$qv
	add	sp,4
   ;	
   ;	    switch (men % 2) {
   ;	
	mov	al,byte ptr DGROUP:_men
	mov	ah,0
	mov	bx,2
	cwd	
	idiv	bx
	or	dx,dx
	je	short @10@25
	cmp	dx,1
	je	short @10@26
	jmp	short @10@28
@10@25:
   ;	
   ;	        case 0: the_game->play_sound_file((uchar far *)"cry");     break;
   ;	
	push	ds
	push	offset DGROUP:s@+2007
	jmp	short @10@27
@10@26:
   ;	
   ;	        case 1: the_game->play_sound_file((uchar far *)"villans"); break;
   ;	
	push	ds
	push	offset DGROUP:s@+2011
@10@27:
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_sound_file$qnuc
	add	sp,8
@10@28:
   ;	
   ;	    }
   ;	    display->fade_down();
   ;	
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@fade_down$qv
	add	sp,4
   ;	
   ;	    if (men == 0) {
   ;	
	cmp	byte ptr DGROUP:_men,0
	jne	short @10@30
   ;	
   ;	        stop_room = 5;
   ;	
	mov	byte ptr DGROUP:_stop_room,5
	pop	bp
	ret	
@10@30:
   ;	
   ;	        return;
   ;	    }
   ;	    stop_room = 3;
   ;	
	mov	byte ptr DGROUP:_stop_room,3
   ;	
   ;	    if (heavy_timer == 0)
   ;	
	cmp	word ptr DGROUP:_heavy_timer,0
	jne	short @10@32
   ;	
   ;	        shot_size = 0;
   ;	
	mov	byte ptr DGROUP:_shot_size,0
@10@32:
   ;	
   ;	    auto_fire = 0;
   ;	
	mov	byte ptr DGROUP:_auto_fire,0
   ;	
   ;	    top_fire = 0;
   ;	
	mov	byte ptr DGROUP:_top_fire,0
   ;	
   ;	    jason_fire = 0;
   ;	
	mov	byte ptr DGROUP:_jason_fire,0
   ;	
   ;	    jason_on = jason_present = 0;
   ;	
	mov	al,0
	mov	byte ptr DGROUP:_jason_present,al
	mov	byte ptr DGROUP:_jason_on,al
   ;	
   ;	    shld_supply = 0x3C;
   ;	
	mov	word ptr DGROUP:_shld_supply,60
   ;	
   ;	    heavy_timer = 0;
   ;	
	mov	word ptr DGROUP:_heavy_timer,0
   ;	
   ;	    --men;
   ;	
	mov	al,byte ptr DGROUP:_men
	add	al,255
	mov	byte ptr DGROUP:_men,al
   ;	
   ;	    update_men();
   ;	
	call	far ptr @update_men$qv
@10@33:
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@kill_ego$qii	endp
	assume	cs:GAME_TEXT,ds:DGROUP
@score_at$qiii	proc	far
   ;	
   ;	void score_at(int x, int y, int val)
   ;	
	enter	6,0
   ;	
   ;	{
   ;	    uchar far *s2;
   ;	
   ;	    switch (val)
   ;	
	mov	ax,word ptr [bp+10]
	mov	word ptr [bp-6],ax
	mov	cx,6
	mov	bx,offset @11@C31
@11@3:
	mov	ax,word ptr cs:[bx]
	cmp	ax,word ptr [bp-6]
	je	short @11@6
	add	bx,2
	loop	short @11@3
	jmp	short @11@13
@11@6:
	jmp	word ptr cs:[bx+12]
@11@7:
   ;	
   ;	    {
   ;	    case 100:  s2 = (uchar far *)"scr_100.l";  break;
   ;	
	mov	word ptr [bp-2],ds
	mov	word ptr [bp-4],offset DGROUP:s@+2019
	jmp	short @11@14
@11@8:
   ;	
   ;	    case 500:  s2 = (uchar far *)"scr_500.l";  break;
   ;	
	mov	word ptr [bp-2],ds
	mov	word ptr [bp-4],offset DGROUP:s@+2029
	jmp	short @11@14
@11@9:
   ;	
   ;	    case 1000: s2 = (uchar far *)"scr_1000.l"; break;
   ;	
	mov	word ptr [bp-2],ds
	mov	word ptr [bp-4],offset DGROUP:s@+2039
	jmp	short @11@14
@11@10:
   ;	
   ;	    case 2000: s2 = (uchar far *)"scr_2000.l"; break;
   ;	
	mov	word ptr [bp-2],ds
	mov	word ptr [bp-4],offset DGROUP:s@+2050
	jmp	short @11@14
@11@11:
   ;	
   ;	    case 3000: s2 = (uchar far *)"scr_3000.l"; break;
   ;	
	mov	word ptr [bp-2],ds
	mov	word ptr [bp-4],offset DGROUP:s@+2061
	jmp	short @11@14
@11@12:
   ;	
   ;	    case 4000: s2 = (uchar far *)"scr_4000.l"; break;
   ;	
	mov	word ptr [bp-2],ds
	mov	word ptr [bp-4],offset DGROUP:s@+2072
	jmp	short @11@14
@11@13:
   ;	
   ;	    default:
   ;	        terminate((uchar far *)"Undefined score animation.", 0);
   ;	
	push	large 0
	push	ds
	push	offset DGROUP:s@+2083
	call	far ptr @terminate$qnuct1
	add	sp,8
   ;	
   ;	        break;
   ;	
@11@14:
   ;	
   ;	    }
   ;	
   ;	    score += val;
   ;	
	movsx	eax,word ptr [bp+10]
	add	dword ptr DGROUP:_score,eax
   ;	
   ;	    act = the_cast->add(s2, 0, do_score);
   ;	
	push	seg @do_score$qn7m_actor
	push	offset @do_score$qn7m_actor
	push	large 0
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_act+2,dx
	mov	word ptr DGROUP:_act,ax
   ;	
   ;	    act->y_speed = -(random(2) + 2);
   ;	
	push	2
	call	far ptr @random$qi
	pop	cx
	add	ax,2
	neg	ax
	les	bx,dword ptr DGROUP:_act
	mov	word ptr es:[bx+22],ax
   ;	
   ;	    act->set_xy(x, y);
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	word ptr DGROUP:_act+2
	push	word ptr DGROUP:_act
	call	far ptr @m_actor@set_xy$qii
	add	sp,8
   ;	
   ;	}
   ;	
	leave	
	ret	
@score_at$qiii	endp
@11@C31	label	word
	db	100
	db	0
	db	244
	db	1
	db	232
	db	3
	db	208
	db	7
	db	184
	db	11
	db	160
	db	15
	dw	@11@7
	dw	@11@8
	dw	@11@9
	dw	@11@10
	dw	@11@11
	dw	@11@12
	assume	cs:GAME_TEXT,ds:DGROUP
@post_message$quc	proc	far
   ;	
   ;	void post_message(uchar msg)
   ;	
	enter	6,0
   ;	
   ;	{
   ;	    uchar far *s2;
   ;	    int var_2;
   ;	
   ;	    if (msg == cur_message)
   ;	
	mov	al,byte ptr [bp+6]
	mov	ah,0
	cmp	ax,word ptr DGROUP:_cur_message
	je	@12@24
   ;	
   ;	        return;
   ;	
   ;	    if (msg >= 10)
   ;	
	cmp	byte ptr [bp+6],10
	jb	@12@23
   ;	
   ;	    {
   ;	        switch (msg - 10)
   ;	
	mov	al,byte ptr [bp+6]
	mov	ah,0
	add	ax,-10
	mov	bx,ax
	cmp	bx,4
	ja	short @12@10
	add	bx,bx
	jmp	word ptr cs:@12@C65[bx]
@12@6:
   ;	
   ;	        {
   ;	        case 0: s2 = (uchar far *)"msg_bar.l";  break;
   ;	
	mov	word ptr [bp-2],ds
	mov	word ptr [bp-4],offset DGROUP:s@+2110
	jmp	short @12@10
@12@7:
   ;	
   ;	        case 2: s2 = (uchar far *)"msg_gun.l";  break;
   ;	
	mov	word ptr [bp-2],ds
	mov	word ptr [bp-4],offset DGROUP:s@+2120
	jmp	short @12@10
@12@8:
   ;	
   ;	        case 3: s2 = (uchar far *)"msg_cave.l"; break;
   ;	
	mov	word ptr [bp-2],ds
	mov	word ptr [bp-4],offset DGROUP:s@+2130
	jmp	short @12@10
@12@9:
   ;	
   ;	        case 4: s2 = (uchar far *)"msg_jasn.l"; break;
   ;	
	mov	word ptr [bp-2],ds
	mov	word ptr [bp-4],offset DGROUP:s@+2141
@12@10:
   ;	
   ;	        }
   ;	        show_loop(s2, 0x69, 0x37, 0, page_offsets[displayed_page]);
   ;	
	mov	al,byte ptr DGROUP:_displayed_page
	mov	ah,0
	add	ax,ax
	mov	bx,ax
	push	word ptr DGROUP:_page_offsets[bx]
	push	0
	push	55
	push	105
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @show_loop$qnuciiucui
	add	sp,12
	jmp	short @12@12
@12@11:
   ;	
   ;	        while (gr_keys[0x1C] || the_game->field_2C)
   ;	            the_game->doit();
   ;	
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@doit$qv
	add	sp,4
@12@12:
	cmp	byte ptr DGROUP:_gr_keys+28,0
	jne	short @12@11
	les	bx,dword ptr DGROUP:_the_game
	cmp	byte ptr es:[bx+44],0
	jne	short @12@11
	jmp	short @12@16
@12@15:
   ;	
   ;	        while (!gr_keys[0x1C] && !the_game->field_2C)
   ;	            the_game->doit();
   ;	
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@doit$qv
	add	sp,4
@12@16:
	cmp	byte ptr DGROUP:_gr_keys+28,0
	jne	short @12@20
	les	bx,dword ptr DGROUP:_the_game
	cmp	byte ptr es:[bx+44],0
	je	short @12@15
	jmp	short @12@20
@12@19:
   ;	
   ;	        while (gr_keys[0x1C] || the_game->field_2C)
   ;	            the_game->doit();
   ;	
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@doit$qv
	add	sp,4
@12@20:
	cmp	byte ptr DGROUP:_gr_keys+28,0
	jne	short @12@19
	les	bx,dword ptr DGROUP:_the_game
	cmp	byte ptr es:[bx+44],0
	jne	short @12@19
   ;	
   ;	        return;
   ;	
	leave	
	ret	
@12@23:
   ;	
   ;	    }
   ;	
   ;	    message_posted = 0x3C;
   ;	
	mov	byte ptr DGROUP:_message_posted,60
   ;	
   ;	    var_2 = 0xA0 - ((strlen(all_messages[msg]) >> 1) << 3);
   ;	
	mov	al,byte ptr [bp+6]
	mov	ah,0
	shl	ax,2
	mov	bx,ax
	push	word ptr DGROUP:_all_messages[bx+2]
	push	word ptr DGROUP:_all_messages[bx]
	call	far ptr _strlen
	add	sp,4
	shr	ax,1
	shl	ax,3
	mov	dx,160
	sub	dx,ax
	mov	word ptr [bp-6],dx
   ;	
   ;	    display->fill_rect(0, 0xBE, 0x140, 0xC8, 0, 0xFFFF, 0);
   ;	
	push	0
	push	-1
	push	0
	push	200
	push	320
	push	190
	push	0
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@fill_rect$qiiiiiiuc
	add	sp,18
   ;	
   ;	    vga_text(var_2, 0xBF, all_messages[msg], 0x17, 3);
   ;	
	push	3
	push	23
	mov	al,byte ptr [bp+6]
	mov	ah,0
	shl	ax,2
	mov	bx,ax
	push	word ptr DGROUP:_all_messages[bx+2]
	push	word ptr DGROUP:_all_messages[bx]
	push	191
	push	word ptr [bp-6]
	call	far ptr @vga_text$qiinucucuc
	add	sp,12
   ;	
   ;	    display->copy_bits(0, 0xBE, 0x140, 0xC8, 0, 0xBE,
   ;	
   ;	
   ;	                       page_offsets[0], page_offsets[1], 0x140, 0x140);
   ;	
	push	320
	push	320
	push	word ptr DGROUP:_page_offsets+2
	push	word ptr DGROUP:_page_offsets
	push	190
	push	0
	push	200
	push	320
	push	190
	push	0
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@copy_bits$qiiiiiiuiuiuiui
	add	sp,24
   ;	
   ;	    cur_message = msg;
   ;	
	mov	al,byte ptr [bp+6]
	mov	ah,0
	mov	word ptr DGROUP:_cur_message,ax
@12@24:
   ;	
   ;	}
   ;	
	leave	
	ret	
@post_message$quc	endp
@12@C65	label	word
	dw	@12@6
	dw	@12@10
	dw	@12@7
	dw	@12@8
	dw	@12@9
	assume	cs:GAME_TEXT,ds:DGROUP
@clear_message$qv	proc	far
   ;	
   ;	void clear_message(void)
   ;	
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    display->fill_rect(0, 0xBE, 0x140, 0xC8, 0, 0xFFFF, 0);
   ;	
	push	0
	push	-1
	push	0
	push	200
	push	320
	push	190
	push	0
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@fill_rect$qiiiiiiuc
	add	sp,18
   ;	
   ;	    display->copy_bits(0, 0xBE, 0x140, 0xC8, 0, 0xBE,
   ;	
   ;	
   ;	                       page_offsets[0], page_offsets[1], 0x140, 0x140);
   ;	
	push	320
	push	320
	push	word ptr DGROUP:_page_offsets+2
	push	word ptr DGROUP:_page_offsets
	push	190
	push	0
	push	200
	push	320
	push	190
	push	0
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@copy_bits$qiiiiiiuiuiuiui
	add	sp,24
   ;	
   ;	    cur_message = -1;
   ;	
	mov	word ptr DGROUP:_cur_message,-1
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@clear_message$qv	endp
	assume	cs:GAME_TEXT,ds:DGROUP
@add_map_item$quiui	proc	far
   ;	
   ;	void add_map_item(uint arg_0, uint arg_2)
   ;	
	enter	12,0
   ;	
   ;	{
   ;	    uchar far *s2;
   ;	    byte var_5;
   ;	    int var_2, var_4;
   ;	
   ;	    if (arg_2 & 0xF)
   ;	
	test	word ptr [bp+8],15
	je	short @14@4
   ;	
   ;	    {
   ;	        add_map_pup(arg_0, arg_2 & 0xF);
   ;	
	mov	ax,word ptr [bp+8]
	and	ax,15
	push	ax
	push	word ptr [bp+6]
	call	far ptr @add_map_pup$quiui
@14@3:
	add	sp,4
	leave	
	ret	
@14@4:
   ;	
   ;	        return;
   ;	    }
   ;	    var_5 = !(arg_0 & 1);
   ;	
	test	word ptr [bp+6],1
	jne	short @14@6
	mov	ax,1
	jmp	short @14@7
@14@6:
	xor	ax,ax
@14@7:
	mov	byte ptr [bp-5],al
   ;	
   ;	    get_map_coords(arg_0, &var_2, &var_4);
   ;	
	push	ss
	lea	ax,word ptr [bp-10]
	push	ax
	push	ss
	lea	ax,word ptr [bp-8]
	push	ax
	push	word ptr [bp+6]
	call	far ptr @get_map_coords$quinit2
	add	sp,10
   ;	
   ;	    switch (arg_2)
   ;	
	mov	ax,word ptr [bp+8]
	mov	word ptr [bp-12],ax
	mov	cx,31
	mov	bx,offset @14@C349
@14@10:
	mov	ax,word ptr cs:[bx]
	cmp	ax,word ptr [bp-12]
	je	short @14@13
	add	bx,2
	loop	short @14@10
	jmp	@14@114
@14@13:
	jmp	word ptr cs:[bx+62]
@14@14:
   ;	
   ;	    {
   ;	    case 0x10:                  /* coin / gem / bonus group */
   ;	    case 0x400:
   ;	    case 0x2800:
   ;	    case 0x5000:
   ;	        if (arg_2 == 0x2800)
   ;	
	cmp	word ptr [bp+8],10240
	jne	short @14@16
   ;	
   ;	            s2 = (uchar far *)"gem.l";
   ;	
	mov	word ptr [bp-2],ds
	mov	word ptr [bp-4],offset DGROUP:s@+2152
	jmp	short @14@24
@14@16:
   ;	
   ;	        else if (arg_2 == 0x5000)
   ;	
	cmp	word ptr [bp+8],20480
	jne	short @14@23
   ;	
   ;	        {
   ;	            switch (var_5)
   ;	
	mov	al,byte ptr [bp-5]
	mov	ah,0
	or	ax,ax
	je	short @14@21
	cmp	ax,1
	je	short @14@22
	jmp	short @14@24
@14@21:
   ;	
   ;	            {
   ;	            case 0: s2 = (uchar far *)"bonus1.l"; break;
   ;	
	mov	word ptr [bp-2],ds
	mov	word ptr [bp-4],offset DGROUP:s@+2158
	jmp	short @14@24
@14@22:
   ;	
   ;	            case 1: s2 = (uchar far *)"bonus2.l"; break;
   ;	
	mov	word ptr [bp-2],ds
	mov	word ptr [bp-4],offset DGROUP:s@+2167
	jmp	short @14@24
@14@23:
   ;	
   ;	            }
   ;	        }
   ;	        else
   ;	            s2 = (uchar far *)"coin.l";
   ;	
	mov	word ptr [bp-2],ds
	mov	word ptr [bp-4],offset DGROUP:s@+2176
@14@24:
   ;	
   ;	        act = the_cast->add(s2, 0, do_coin);
   ;	
	push	seg @do_coin$qn7m_actor
	push	offset @do_coin$qn7m_actor
	push	large 0
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_act+2,dx
	mov	word ptr DGROUP:_act,ax
   ;	
   ;	        act->set_cycle(random(2) + 1, 1);
   ;	
	push	1
	push	2
	call	far ptr @random$qi
	pop	cx
	inc	al
	push	ax
	push	word ptr DGROUP:_act+2
	push	word ptr DGROUP:_act
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
   ;	
   ;	        if (arg_2 == 0x2800) act->flag_7 = 1;
   ;	
	cmp	word ptr [bp+8],10240
	jne	short @14@26
	les	bx,dword ptr DGROUP:_act
	or	byte ptr es:[bx+82],128
@14@26:
   ;	
   ;	        var_2 += act->width >> 1;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	ax,word ptr es:[bx+16]
	sar	ax,1
	add	word ptr [bp-8],ax
   ;	
   ;	        if (arg_2 != 0x10) ++goody_count;
   ;	
	cmp	word ptr [bp+8],16
	je	@14@114
	jmp	@14@87
@14@28:
   ;	
   ;	        break;
   ;	
   ;	    case 0x20:                  /* pod */
   ;	    case 0x1000:
   ;	        if (var_5)
   ;	
	cmp	byte ptr [bp-5],0
	je	short @14@30
   ;	
   ;	            act = the_cast->add((uchar far *)"pod1.l", mv_std, do_pod);
   ;	
	push	seg @do_pod$qn7m_actor
	push	offset @do_pod$qn7m_actor
	push	seg @mv_std$qn7m_actornit2
	push	offset @mv_std$qn7m_actornit2
	push	ds
	push	offset DGROUP:s@+2183
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_act+2,dx
	mov	word ptr DGROUP:_act,ax
	jmp	short @14@31
@14@30:
   ;	
   ;	        else
   ;	        {
   ;	            act = the_cast->add((uchar far *)"pod2.l", mv_std, do_pod);
   ;	
	push	seg @do_pod$qn7m_actor
	push	offset @do_pod$qn7m_actor
	push	seg @mv_std$qn7m_actornit2
	push	offset @mv_std$qn7m_actornit2
	push	ds
	push	offset DGROUP:s@+2190
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_act+2,dx
	mov	word ptr DGROUP:_act,ax
   ;	
   ;	            act->health = 1;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	word ptr es:[bx+38],1
@14@31:
   ;	
   ;	        }
   ;	        act->set_cycle(2, 1);
   ;	
	push	1
	push	2
	push	word ptr DGROUP:_act+2
	push	word ptr DGROUP:_act
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
   ;	
   ;	        act->type = 1;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	byte ptr es:[bx+53],1
   ;	
   ;	        if (arg_2 == 0x1000) ++enemy_count;
   ;	
	cmp	word ptr [bp+8],4096
	jne	@14@95
	jmp	@14@93
@14@33:
   ;	
   ;	        else var_4 += act->height;
   ;	        break;
   ;	
   ;	    case 0x800:                 /* mine */
   ;	        act = the_cast->add((uchar far *)"mine.l", 0, do_mine1);
   ;	
	push	seg @do_mine1$qn7m_actor
	push	offset @do_mine1$qn7m_actor
	push	large 0
	push	ds
	push	offset DGROUP:s@+2197
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_act+2,dx
	mov	word ptr DGROUP:_act,ax
   ;	
   ;	        var_2 = var_2 - act->width / 2;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	ax,word ptr es:[bx+16]
	cwd	
	sub	ax,dx
	sar	ax,1
	mov	dx,word ptr [bp-8]
	sub	dx,ax
	mov	word ptr [bp-8],dx
   ;	
   ;	        var_4 = var_4 - act->height;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	ax,word ptr [bp-10]
	sub	ax,word ptr es:[bx+18]
	mov	word ptr [bp-10],ax
   ;	
   ;	        act->type = 0x21;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	byte ptr es:[bx+53],33
   ;	
   ;	        act->set_cycle(random(0xA) + 0xF, 1);
   ;	
	push	1
	push	10
	call	far ptr @random$qi
	pop	cx
	add	al,15
@14@34:
	push	ax
@14@35:
	push	word ptr DGROUP:_act+2
	push	word ptr DGROUP:_act
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
   ;	
   ;	        break;
   ;	
	jmp	@14@114
@14@36:
   ;	
   ;	
   ;	    case 0xC00:                 /* zapper */
   ;	        ++zapper_count;
   ;	
	mov	al,byte ptr DGROUP:_zapper_count
	inc	al
	mov	byte ptr DGROUP:_zapper_count,al
   ;	
   ;	        act = the_cast->add((uchar far *)"zap_ud.l", 0, do_zapper);
   ;	
	push	seg @do_zapper$qn7m_actor
	push	offset @do_zapper$qn7m_actor
	push	large 0
	push	ds
	push	offset DGROUP:s@+2204
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_act+2,dx
	mov	word ptr DGROUP:_act,ax
   ;	
   ;	        var_2 = var_2 - 3;
   ;	
	mov	ax,word ptr [bp-8]
	add	ax,-3
	mov	word ptr [bp-8],ax
   ;	
   ;	        var_4 = var_4 + 8;
   ;	
	mov	ax,word ptr [bp-10]
	add	ax,8
	mov	word ptr [bp-10],ax
   ;	
   ;	        act->counter_26 = zapper_count % 2 * 0xA + 0x28;
   ;	
	mov	al,byte ptr DGROUP:_zapper_count
	mov	ah,0
	mov	bx,2
	cwd	
	idiv	bx
	imul	dx,dx,10
	add	dx,40
	les	bx,dword ptr DGROUP:_act
	mov	word ptr es:[bx+36],dx
   ;	
   ;	        act->set_cycle(0, 0);
   ;	
	push	0
	push	0
	push	word ptr DGROUP:_act+2
	push	word ptr DGROUP:_act
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
   ;	
   ;	        act->type = 1;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	byte ptr es:[bx+53],1
   ;	
   ;	        break;
   ;	
	jmp	@14@114
@14@37:
   ;	
   ;	
   ;	    case 0x1400:                /* fish */
   ;	        if (var_5)
   ;	
	cmp	byte ptr [bp-5],0
	je	short @14@39
   ;	
   ;	        {
   ;	            act = the_cast->add((uchar far *)"fish1r.l", 0, do_fish);
   ;	
	push	seg @do_fish$qn7m_actor
	push	offset @do_fish$qn7m_actor
	push	large 0
	push	ds
	push	offset DGROUP:s@+2213
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_act+2,dx
	mov	word ptr DGROUP:_act,ax
   ;	
   ;	            act->health = 1;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	word ptr es:[bx+38],1
   ;	
   ;	        }
   ;	
	jmp	short @14@40
@14@39:
   ;	
   ;	        else
   ;	        {
   ;	            act = the_cast->add((uchar far *)"fish2r.l", 0, do_fish);
   ;	
	push	seg @do_fish$qn7m_actor
	push	offset @do_fish$qn7m_actor
	push	large 0
	push	ds
	push	offset DGROUP:s@+2222
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_act+2,dx
	mov	word ptr DGROUP:_act,ax
   ;	
   ;	            act->health = 2;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	word ptr es:[bx+38],2
@14@40:
   ;	
   ;	        }
   ;	        var_4 -= act->height / 2;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	ax,word ptr es:[bx+18]
	cwd	
	sub	ax,dx
	sar	ax,1
	sub	word ptr [bp-10],ax
   ;	
   ;	        act->direction = 0;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	byte ptr es:[bx+52],0
   ;	
   ;	        act->x_speed = 1;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	word ptr es:[bx+20],1
   ;	
   ;	        act->counter_26 = random(0x64) + 0x64;
   ;	
	push	100
	call	far ptr @random$qi
	pop	cx
	add	ax,100
	les	bx,dword ptr DGROUP:_act
	mov	word ptr es:[bx+36],ax
   ;	
   ;	        act->set_cycle(3, 1);
   ;	
	push	1
	push	3
	jmp	@14@35
@14@41:
   ;	
   ;	        break;
   ;	
   ;	    case 0x1800:                /* weed */
   ;	        act = the_cast->add((uchar far *)"weed1.l", 0, 0);
   ;	
	push	large 0
	push	large 0
	push	ds
	push	offset DGROUP:s@+2231
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_act+2,dx
	mov	word ptr DGROUP:_act,ax
   ;	
   ;	        var_2 -= act->width / 2;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	ax,word ptr es:[bx+16]
	cwd	
	sub	ax,dx
	sar	ax,1
	sub	word ptr [bp-8],ax
   ;	
   ;	        var_4 -= act->height - 2;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	ax,word ptr es:[bx+18]
	add	ax,-2
	sub	word ptr [bp-10],ax
   ;	
   ;	        act->set_cycle(random(5) + 0xA, 1);
   ;	
	push	1
	push	5
	call	far ptr @random$qi
	pop	cx
	add	al,10
	jmp	@14@34
@14@42:
   ;	
   ;	        break;
   ;	
   ;	    case 0x1C00:                /* tulip */
   ;	        act = the_cast->add((uchar far *)"tulip.l", 0, do_tulip);
   ;	
	push	seg @do_tulip$qn7m_actor
	push	offset @do_tulip$qn7m_actor
	push	large 0
	push	ds
	push	offset DGROUP:s@+2239
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_act+2,dx
	mov	word ptr DGROUP:_act,ax
   ;	
   ;	        act->counter_26 = 0x16;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	word ptr es:[bx+36],22
   ;	
   ;	        act->set_cycle(0, 0);
   ;	
	push	0
	push	0
	push	word ptr DGROUP:_act+2
	push	word ptr DGROUP:_act
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
   ;	
   ;	        var_2 -= 0xB;
   ;	
	sub	word ptr [bp-8],11
   ;	
   ;	        var_4 -= ((loop_rec far *)act->loop_data)->fa->f_04 + 3;
   ;	
	les	bx,dword ptr DGROUP:_act
	les	bx,dword ptr es:[bx+70]
	les	bx,dword ptr es:[bx+10]
	mov	ax,word ptr es:[bx+4]
	add	ax,3
	jmp	@14@101
@14@43:
   ;	
   ;	        break;
   ;	
   ;	    case 0x2000:                /* chest */
   ;	        act = the_cast->add((uchar far *)"chest.l", 0, do_chest);
   ;	
	push	seg @do_chest$qn7m_actor
	push	offset @do_chest$qn7m_actor
	push	large 0
	push	ds
	push	offset DGROUP:s@+2247
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_act+2,dx
	mov	word ptr DGROUP:_act,ax
   ;	
   ;	        act->type = 3;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	byte ptr es:[bx+53],3
   ;	
   ;	        var_2 -= act->width / 2;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	ax,word ptr es:[bx+16]
	cwd	
	sub	ax,dx
	sar	ax,1
	sub	word ptr [bp-8],ax
   ;	
   ;	        var_4 -= act->height;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	ax,word ptr es:[bx+18]
	sub	word ptr [bp-10],ax
   ;	
   ;	        act->set_cycle(0, 0);
   ;	
	push	0
	push	0
	push	word ptr DGROUP:_act+2
	push	word ptr DGROUP:_act
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
   ;	
   ;	        goody_count += 0xA;
   ;	
	mov	al,byte ptr DGROUP:_goody_count
	add	al,10
@14@44:
	mov	byte ptr DGROUP:_goody_count,al
   ;	
   ;	        break;
   ;	
	jmp	@14@114
@14@45:
   ;	
   ;	
   ;	    case 0x2C00:                /* duct left/right */
   ;	        if (var_5)
   ;	
	cmp	byte ptr [bp-5],0
	je	short @14@47
   ;	
   ;	        {
   ;	            act = the_cast->add((uchar far *)"duct_r.l", 0, do_duct_lr);
   ;	
	push	seg @do_duct_lr$qn7m_actor
	push	offset @do_duct_lr$qn7m_actor
	push	large 0
	push	ds
	push	offset DGROUP:s@+2255
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_act+2,dx
	mov	word ptr DGROUP:_act,ax
   ;	
   ;	            act->direction = 0;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	byte ptr es:[bx+52],0
   ;	
   ;	        }
   ;	
	jmp	short @14@48
@14@47:
   ;	
   ;	        else
   ;	        {
   ;	            act = the_cast->add((uchar far *)"duct_l.l", 0, do_duct_lr);
   ;	
	push	seg @do_duct_lr$qn7m_actor
	push	offset @do_duct_lr$qn7m_actor
	push	large 0
	push	ds
	push	offset DGROUP:s@+2264
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_act+2,dx
	mov	word ptr DGROUP:_act,ax
   ;	
   ;	            act->direction = 1;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	byte ptr es:[bx+52],1
@14@48:
   ;	
   ;	        }
   ;	        var_4 += 8;
   ;	
	add	word ptr [bp-10],8
	jmp	short @14@53
@14@49:
   ;	
   ;	        act->set_cycle(1, 1);
   ;	        break;
   ;	
   ;	    case 0x3000:                /* duct up/down */
   ;	        if (var_5)
   ;	
	cmp	byte ptr [bp-5],0
	je	short @14@51
   ;	
   ;	        {
   ;	            act = the_cast->add((uchar far *)"duct_u.l", 0, do_duct_ud);
   ;	
	push	seg @do_duct_ud$qn7m_actor
	push	offset @do_duct_ud$qn7m_actor
	push	large 0
	push	ds
	push	offset DGROUP:s@+2273
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_act+2,dx
	mov	word ptr DGROUP:_act,ax
   ;	
   ;	            act->direction = 2;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	byte ptr es:[bx+52],2
   ;	
   ;	        }
   ;	
	jmp	short @14@52
@14@51:
   ;	
   ;	        else
   ;	        {
   ;	            act = the_cast->add((uchar far *)"duct_d.l", 0, do_duct_ud);
   ;	
	push	seg @do_duct_ud$qn7m_actor
	push	offset @do_duct_ud$qn7m_actor
	push	large 0
	push	ds
	push	offset DGROUP:s@+2282
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_act+2,dx
	mov	word ptr DGROUP:_act,ax
   ;	
   ;	            act->direction = 3;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	byte ptr es:[bx+52],3
@14@52:
   ;	
   ;	        }
   ;	        var_2 += 8;
   ;	
	add	word ptr [bp-8],8
@14@53:
   ;	
   ;	        act->set_cycle(1, 1);
   ;	
	push	1
	push	1
	jmp	@14@35
@14@54:
   ;	
   ;	        break;
   ;	
   ;	    case 0x2400:                /* pirana */
   ;	        if (var_5)
   ;	
	cmp	byte ptr [bp-5],0
	je	short @14@56
   ;	
   ;	        {
   ;	            act = the_cast->add((uchar far *)"piranar.l", mv_pirana, do_pirana);
   ;	
	push	seg @do_pirana$qn7m_actor
	push	offset @do_pirana$qn7m_actor
	push	seg @mv_pirana$qn7m_actornit2
	push	offset @mv_pirana$qn7m_actornit2
	push	ds
	push	offset DGROUP:s@+2291
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_act+2,dx
	mov	word ptr DGROUP:_act,ax
   ;	
   ;	            act->x_speed = 1;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	word ptr es:[bx+20],1
   ;	
   ;	            act->direction = 0;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	byte ptr es:[bx+52],0
   ;	
   ;	        }
   ;	
	jmp	short @14@57
@14@56:
   ;	
   ;	        else
   ;	        {
   ;	            act = the_cast->add((uchar far *)"piranal.l", mv_pirana, do_pirana);
   ;	
	push	seg @do_pirana$qn7m_actor
	push	offset @do_pirana$qn7m_actor
	push	seg @mv_pirana$qn7m_actornit2
	push	offset @mv_pirana$qn7m_actornit2
	push	ds
	push	offset DGROUP:s@+2301
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_act+2,dx
	mov	word ptr DGROUP:_act,ax
   ;	
   ;	            act->x_speed = -1;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	word ptr es:[bx+20],-1
   ;	
   ;	            act->direction = 1;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	byte ptr es:[bx+52],1
@14@57:
   ;	
   ;	        }
   ;	        act->type = 1;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	byte ptr es:[bx+53],1
   ;	
   ;	        var_2 -= act->width / 2;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	ax,word ptr es:[bx+16]
	cwd	
	sub	ax,dx
	sar	ax,1
	sub	word ptr [bp-8],ax
   ;	
   ;	        var_4 -= act->height / 2;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	ax,word ptr es:[bx+18]
	cwd	
	sub	ax,dx
	sar	ax,1
	sub	word ptr [bp-10],ax
   ;	
   ;	        act->set_cycle(5, 1);
   ;	
	push	1
	push	5
@14@58:
	push	word ptr DGROUP:_act+2
	push	word ptr DGROUP:_act
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
	jmp	@14@93
@14@59:
   ;	
   ;	        ++enemy_count;
   ;	        break;
   ;	
   ;	    case 0x3400:                /* block */
   ;	        if (var_5) act = the_cast->add((uchar far *)"block2.l", 0, do_block);
   ;	
	cmp	byte ptr [bp-5],0
	je	short @14@61
	push	seg @do_block$qn7m_actor
	push	offset @do_block$qn7m_actor
	push	large 0
	push	ds
	push	offset DGROUP:s@+2311
	jmp	short @14@62
@14@61:
   ;	
   ;	        else       act = the_cast->add((uchar far *)"block.l", 0, do_block);
   ;	
	push	seg @do_block$qn7m_actor
	push	offset @do_block$qn7m_actor
	push	large 0
	push	ds
	push	offset DGROUP:s@+2320
@14@62:
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_act+2,dx
	mov	word ptr DGROUP:_act,ax
   ;	
   ;	        act->type = 3;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	byte ptr es:[bx+53],3
   ;	
   ;	        break;
   ;	
	jmp	@14@114
@14@64:
   ;	
   ;	
   ;	    case 0x3800:                /* face left/right */
   ;	    case 0x7000:
   ;	        if (arg_2 == 0x3800)
   ;	
	cmp	word ptr [bp+8],14336
	jne	short @14@66
   ;	
   ;	        {
   ;	            act = the_cast->add((uchar far *)"face_r.l", 0, do_face);
   ;	
	push	seg @do_face$qn7m_actor
	push	offset @do_face$qn7m_actor
	push	large 0
	push	ds
	push	offset DGROUP:s@+2328
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_act+2,dx
	mov	word ptr DGROUP:_act,ax
   ;	
   ;	            act->direction = 0;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	byte ptr es:[bx+52],0
   ;	
   ;	            var_2 += 7;
   ;	
	add	word ptr [bp-8],7
   ;	
   ;	        }
   ;	
	jmp	short @14@67
@14@66:
   ;	
   ;	        else
   ;	        {
   ;	            act = the_cast->add((uchar far *)"face_l.l", 0, do_face);
   ;	
	push	seg @do_face$qn7m_actor
	push	offset @do_face$qn7m_actor
	push	large 0
	push	ds
	push	offset DGROUP:s@+2337
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_act+2,dx
	mov	word ptr DGROUP:_act,ax
   ;	
   ;	            act->direction = 1;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	byte ptr es:[bx+52],1
   ;	
   ;	            var_2 -= act->width - 1;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	ax,word ptr es:[bx+16]
	dec	ax
	sub	word ptr [bp-8],ax
@14@67:
   ;	
   ;	        }
   ;	        act->set_cycle(0, 0);
   ;	
	push	0
	push	0
	push	word ptr DGROUP:_act+2
	push	word ptr DGROUP:_act
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
   ;	
   ;	        act->type = 1;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	byte ptr es:[bx+53],1
   ;	
   ;	        var_4 -= 2;
   ;	
	sub	word ptr [bp-10],2
	jmp	@14@93
@14@68:
   ;	
   ;	        ++enemy_count;
   ;	        break;
   ;	
   ;	    case 0x3C00:                /* serpent */
   ;	        if (var_5)
   ;	
	cmp	byte ptr [bp-5],0
	je	short @14@70
   ;	
   ;	        {
   ;	            act = the_cast->add((uchar far *)"serp_r.l", mv_pace, do_serpent);
   ;	
	push	seg @do_serpent$qn7m_actor
	push	offset @do_serpent$qn7m_actor
	push	seg @mv_pace$qn7m_actornit2
	push	offset @mv_pace$qn7m_actornit2
	push	ds
	push	offset DGROUP:s@+2346
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_act+2,dx
	mov	word ptr DGROUP:_act,ax
   ;	
   ;	            act->direction = 0;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	byte ptr es:[bx+52],0
   ;	
   ;	            act->x_speed = 1;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	word ptr es:[bx+20],1
   ;	
   ;	        }
   ;	
	jmp	short @14@71
@14@70:
   ;	
   ;	        else
   ;	        {
   ;	            act = the_cast->add((uchar far *)"serp_l.l", mv_pace, do_serpent);
   ;	
	push	seg @do_serpent$qn7m_actor
	push	offset @do_serpent$qn7m_actor
	push	seg @mv_pace$qn7m_actornit2
	push	offset @mv_pace$qn7m_actornit2
	push	ds
	push	offset DGROUP:s@+2355
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_act+2,dx
	mov	word ptr DGROUP:_act,ax
   ;	
   ;	            act->direction = 1;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	byte ptr es:[bx+52],1
   ;	
   ;	            act->x_speed = -1;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	word ptr es:[bx+20],-1
@14@71:
   ;	
   ;	        }
   ;	        var_2 -= act->width / 2;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	ax,word ptr es:[bx+16]
	cwd	
	sub	ax,dx
	sar	ax,1
	sub	word ptr [bp-8],ax
   ;	
   ;	        var_4 -= act->height;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	ax,word ptr es:[bx+18]
	sub	word ptr [bp-10],ax
   ;	
   ;	        act->type = 1;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	byte ptr es:[bx+53],1
   ;	
   ;	        act->set_cycle(1, 1);
   ;	
	push	1
	push	1
	jmp	@14@58
@14@72:
   ;	
   ;	        ++enemy_count;
   ;	        break;
   ;	
   ;	    case 0x4000:                /* crab */
   ;	        act = the_cast->add((uchar far *)"crab.l", mv_pace, do_crab);
   ;	
	push	seg @do_crab$qn7m_actor
	push	offset @do_crab$qn7m_actor
	push	seg @mv_pace$qn7m_actornit2
	push	offset @mv_pace$qn7m_actornit2
	push	ds
	push	offset DGROUP:s@+2364
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_act+2,dx
	mov	word ptr DGROUP:_act,ax
   ;	
   ;	        if (var_5) { act->direction = 0; act->x_speed = 2; }
   ;	
	cmp	byte ptr [bp-5],0
	je	short @14@74
	les	bx,dword ptr DGROUP:_act
	mov	byte ptr es:[bx+52],0
	les	bx,dword ptr DGROUP:_act
	mov	word ptr es:[bx+20],2
	jmp	short @14@75
@14@74:
   ;	
   ;	        else       { act->direction = 1; act->x_speed = -2; }
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	byte ptr es:[bx+52],1
	les	bx,dword ptr DGROUP:_act
	mov	word ptr es:[bx+20],-2
@14@75:
   ;	
   ;	        act->set_cycle(1, 1);
   ;	
	push	1
	push	1
	push	word ptr DGROUP:_act+2
	push	word ptr DGROUP:_act
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
   ;	
   ;	        act->type = 1;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	byte ptr es:[bx+53],1
   ;	
   ;	        var_4 -= act->height;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	ax,word ptr es:[bx+18]
	sub	word ptr [bp-10],ax
	jmp	@14@93
@14@76:
   ;	
   ;	        ++enemy_count;
   ;	        break;
   ;	
   ;	    case 0x4400:                /* gun piece */
   ;	        if (the_game->field_09 == 1 || gun_count == 4)
   ;	
	les	bx,dword ptr DGROUP:_the_game
	cmp	byte ptr es:[bx+9],1
	je	short @14@78
	cmp	byte ptr DGROUP:_gun_count,4
	jne	short @14@79
@14@78:
   ;	
   ;	        {
   ;	            add_barrel(arg_0, 0x10);
   ;	
	push	16
	push	word ptr [bp+6]
	call	far ptr @add_barrel$quiui
	jmp	@14@3
@14@79:
   ;	
   ;	            return;
   ;	        }
   ;	        switch (gun_count)
   ;	
	mov	al,byte ptr DGROUP:_gun_count
	mov	ah,0
	mov	bx,ax
	cmp	bx,3
	ja	short @14@86
	add	bx,bx
	jmp	word ptr cs:@14@C363[bx]
@14@82:
   ;	
   ;	        {
   ;	        case 0: s2 = (uchar far *)"piece_1.l"; break;
   ;	
	mov	word ptr [bp-2],ds
	mov	word ptr [bp-4],offset DGROUP:s@+2371
	jmp	short @14@86
@14@83:
   ;	
   ;	        case 1: s2 = (uchar far *)"piece_2.l"; break;
   ;	
	mov	word ptr [bp-2],ds
	mov	word ptr [bp-4],offset DGROUP:s@+2381
	jmp	short @14@86
@14@84:
   ;	
   ;	        case 2: s2 = (uchar far *)"piece_3.l"; break;
   ;	
	mov	word ptr [bp-2],ds
	mov	word ptr [bp-4],offset DGROUP:s@+2391
	jmp	short @14@86
@14@85:
   ;	
   ;	        case 3: s2 = (uchar far *)"piece_4.l"; break;
   ;	
	mov	word ptr [bp-2],ds
	mov	word ptr [bp-4],offset DGROUP:s@+2401
@14@86:
   ;	
   ;	        }
   ;	        act = the_cast->add(s2, 0, do_gun_piece);
   ;	
	push	seg @do_gun_piece$qn7m_actor
	push	offset @do_gun_piece$qn7m_actor
	push	large 0
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_act+2,dx
	mov	word ptr DGROUP:_act,ax
   ;	
   ;	        act->set_cycle(6, 1);
   ;	
	push	1
	push	6
	push	word ptr DGROUP:_act+2
	push	word ptr DGROUP:_act
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
   ;	
   ;	        var_4 -= act->height;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	ax,word ptr es:[bx+18]
	sub	word ptr [bp-10],ax
   ;	
   ;	        ++goody_count;
   ;	
@14@87:
	mov	al,byte ptr DGROUP:_goody_count
	inc	al
	jmp	@14@44
@14@88:
   ;	
   ;	        break;
   ;	
   ;	    case 0x4800:                /* jelly */
   ;	        act = the_cast->add((uchar far *)"jelly.l", 0, do_jelly);
   ;	
	push	seg @do_jelly$qn7m_actor
	push	offset @do_jelly$qn7m_actor
	push	large 0
	push	ds
	push	offset DGROUP:s@+2411
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_act+2,dx
	mov	word ptr DGROUP:_act,ax
   ;	
   ;	        act->type = 1;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	byte ptr es:[bx+53],1
   ;	
   ;	        act->set_cycle(random(2) + 4, 1);
   ;	
	push	1
	push	2
	call	far ptr @random$qi
	pop	cx
	add	al,4
	push	ax
	push	word ptr DGROUP:_act+2
	push	word ptr DGROUP:_act
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
   ;	
   ;	        var_2 -= act->width / 2;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	ax,word ptr es:[bx+16]
	cwd	
	sub	ax,dx
	sar	ax,1
	sub	word ptr [bp-8],ax
	jmp	@14@93
@14@89:
   ;	
   ;	        ++enemy_count;
   ;	        break;
   ;	
   ;	    case 0x4C00:                /* shark */
   ;	        if (var_5)
   ;	
	cmp	byte ptr [bp-5],0
	je	short @14@91
   ;	
   ;	        {
   ;	            act = the_cast->add((uchar far *)"sharkr.l", mv_shark, do_shark);
   ;	
	push	seg @do_shark$qn7m_actor
	push	offset @do_shark$qn7m_actor
	push	seg @mv_shark$qn7m_actornit2
	push	offset @mv_shark$qn7m_actornit2
	push	ds
	push	offset DGROUP:s@+2419
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_act+2,dx
	mov	word ptr DGROUP:_act,ax
   ;	
   ;	            act->direction = 0;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	byte ptr es:[bx+52],0
   ;	
   ;	        }
   ;	
	jmp	short @14@92
@14@91:
   ;	
   ;	        else
   ;	        {
   ;	            act = the_cast->add((uchar far *)"sharkl.l", mv_shark, do_shark);
   ;	
	push	seg @do_shark$qn7m_actor
	push	offset @do_shark$qn7m_actor
	push	seg @mv_shark$qn7m_actornit2
	push	offset @mv_shark$qn7m_actornit2
	push	ds
	push	offset DGROUP:s@+2428
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_act+2,dx
	mov	word ptr DGROUP:_act,ax
   ;	
   ;	            act->direction = 1;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	byte ptr es:[bx+52],1
@14@92:
   ;	
   ;	        }
   ;	        act->type = 1;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	byte ptr es:[bx+53],1
   ;	
   ;	        act->set_cycle(0, 0);
   ;	
	push	0
	push	0
	push	word ptr DGROUP:_act+2
	push	word ptr DGROUP:_act
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
   ;	
   ;	        var_2 -= act->width / 2;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	ax,word ptr es:[bx+16]
	cwd	
	sub	ax,dx
	sar	ax,1
	sub	word ptr [bp-8],ax
@14@93:
   ;	
   ;	        ++enemy_count;
   ;	
	mov	al,byte ptr DGROUP:_enemy_count
	inc	al
	mov	byte ptr DGROUP:_enemy_count,al
   ;	
   ;	        break;
   ;	
	jmp	@14@114
@14@94:
   ;	
   ;	
   ;	    case 0x5400:                /* tentacle */
   ;	        act = the_cast->add((uchar far *)"tent_out.l", 0, do_tentacle);
   ;	
	push	seg @do_tentacle$qn7m_actor
	push	offset @do_tentacle$qn7m_actor
	push	large 0
	push	ds
	push	offset DGROUP:s@+2437
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_act+2,dx
	mov	word ptr DGROUP:_act,ax
   ;	
   ;	        act->type = 1;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	byte ptr es:[bx+53],1
   ;	
   ;	        act->counter_24 = 0x19;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	word ptr es:[bx+34],25
   ;	
   ;	        act->set_cycle(0, 0);
   ;	
	push	0
	push	0
	push	word ptr DGROUP:_act+2
	push	word ptr DGROUP:_act
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
   ;	
   ;	        var_2 -= 0xF;
   ;	
	sub	word ptr [bp-8],15
   ;	
   ;	        var_4 += act->height;
   ;	
@14@95:
	les	bx,dword ptr DGROUP:_act
	mov	ax,word ptr es:[bx+18]
	add	word ptr [bp-10],ax
   ;	
   ;	        break;
   ;	
	jmp	@14@114
@14@96:
   ;	
   ;	
   ;	    case 0x5800:                /* spikes */
   ;	        if (var_5)
   ;	
	cmp	byte ptr [bp-5],0
	je	short @14@98
   ;	
   ;	        {
   ;	            act = the_cast->add((uchar far *)"spikes_d.l", 0, do_spikes);
   ;	
	push	seg @do_spikes$qn7m_actor
	push	offset @do_spikes$qn7m_actor
	push	large 0
	push	ds
	push	offset DGROUP:s@+2448
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_act+2,dx
	mov	word ptr DGROUP:_act,ax
   ;	
   ;	            var_4 += 8;
   ;	
	add	word ptr [bp-10],8
   ;	
   ;	        }
   ;	
	jmp	short @14@99
@14@98:
   ;	
   ;	        else
   ;	        {
   ;	            act = the_cast->add((uchar far *)"spikes_u.l", 0, do_spikes);
   ;	
	push	seg @do_spikes$qn7m_actor
	push	offset @do_spikes$qn7m_actor
	push	large 0
	push	ds
	push	offset DGROUP:s@+2459
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_act+2,dx
	mov	word ptr DGROUP:_act,ax
   ;	
   ;	            var_4 -= act->height;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	ax,word ptr es:[bx+18]
	sub	word ptr [bp-10],ax
@14@99:
   ;	
   ;	        }
   ;	        act->counter_26 = random(0x19) + 0x28;
   ;	
	push	25
	call	far ptr @random$qi
	pop	cx
	add	ax,40
	les	bx,dword ptr DGROUP:_act
	mov	word ptr es:[bx+36],ax
   ;	
   ;	        act->type = 1;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	byte ptr es:[bx+53],1
   ;	
   ;	        act->set_cycle(0, 0);
   ;	
	push	0
	push	0
	push	word ptr DGROUP:_act+2
	push	word ptr DGROUP:_act
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
	jmp	@14@107
@14@100:
   ;	
   ;	        var_2 += act->width;
   ;	        break;
   ;	
   ;	    case 0x5C00:                /* statue */
   ;	        act = the_cast->add((uchar far *)"statue.l", 0, 0);
   ;	
	push	large 0
	push	large 0
	push	ds
	push	offset DGROUP:s@+2470
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_act+2,dx
	mov	word ptr DGROUP:_act,ax
   ;	
   ;	        var_2 -= act->width / 2;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	ax,word ptr es:[bx+16]
	cwd	
	sub	ax,dx
	sar	ax,1
	sub	word ptr [bp-8],ax
   ;	
   ;	        var_4 -= act->height;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	ax,word ptr es:[bx+18]
@14@101:
	sub	word ptr [bp-10],ax
   ;	
   ;	        break;
   ;	
	jmp	@14@114
@14@102:
   ;	
   ;	
   ;	    case 0x6000:                /* fire pit */
   ;	        act = the_cast->add((uchar far *)"fire_pit.l", 0, do_fire_pit);
   ;	
	push	seg @do_fire_pit$qn7m_actor
	push	offset @do_fire_pit$qn7m_actor
	push	large 0
	push	ds
	push	offset DGROUP:s@+2479
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_act+2,dx
	mov	word ptr DGROUP:_act,ax
   ;	
   ;	        act->set_cycle(3, 1);
   ;	
	push	1
	push	3
	push	word ptr DGROUP:_act+2
	push	word ptr DGROUP:_act
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
   ;	
   ;	        if (var_5) act->counter_26 = 0x50;
   ;	
	cmp	byte ptr [bp-5],0
	je	short @14@104
	les	bx,dword ptr DGROUP:_act
	mov	word ptr es:[bx+36],80
	jmp	short @14@105
@14@104:
   ;	
   ;	        else       act->counter_26 = 0x28;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	word ptr es:[bx+36],40
@14@105:
   ;	
   ;	        var_4 -= 5;
   ;	
	sub	word ptr [bp-10],5
   ;	
   ;	        break;
   ;	
	jmp	@14@114
@14@106:
   ;	
   ;	
   ;	    case 0x6400:                /* shuttle */
   ;	        act = the_cast->add((uchar far *)"shutl_l.l", 0, do_shuttle);
   ;	
	push	seg @do_shuttle$qn7m_actor
	push	offset @do_shuttle$qn7m_actor
	push	large 0
	push	ds
	push	offset DGROUP:s@+2490
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_act+2,dx
	mov	word ptr DGROUP:_act,ax
   ;	
   ;	        act->type = 1;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	byte ptr es:[bx+53],1
   ;	
   ;	        act->direction = 1;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	byte ptr es:[bx+52],1
@14@107:
   ;	
   ;	        var_2 += act->width;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	ax,word ptr es:[bx+16]
	add	word ptr [bp-8],ax
   ;	
   ;	        break;
   ;	
	jmp	@14@114
@14@108:
   ;	
   ;	
   ;	    case 0x6800:                /* clam */
   ;	        act = the_cast->add((uchar far *)"clam.l", 0, do_clam);
   ;	
	push	seg @do_clam$qn7m_actor
	push	offset @do_clam$qn7m_actor
	push	large 0
	push	ds
	push	offset DGROUP:s@+2500
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_act+2,dx
	mov	word ptr DGROUP:_act,ax
   ;	
   ;	        act->type = 1;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	byte ptr es:[bx+53],1
   ;	
   ;	        act->set_cycle(0, 0);
   ;	
	push	0
	push	0
	push	word ptr DGROUP:_act+2
	push	word ptr DGROUP:_act
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
   ;	
   ;	        var_2 -= act->width / 2;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	ax,word ptr es:[bx+16]
	cwd	
	sub	ax,dx
	sar	ax,1
	sub	word ptr [bp-8],ax
   ;	
   ;	        var_4 -= act->height - 2;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	ax,word ptr es:[bx+18]
	add	ax,-2
	jmp	@14@101
@14@109:
   ;	
   ;	        break;
   ;	
   ;	    case 0x6C00:                /* cannon */
   ;	        act = the_cast->add((uchar far *)"cannonr.l", mv_std, do_cannon);
   ;	
	push	seg @do_cannon$qn7m_actor
	push	offset @do_cannon$qn7m_actor
	push	seg @mv_std$qn7m_actornit2
	push	offset @mv_std$qn7m_actornit2
	push	ds
	push	offset DGROUP:s@+2507
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_act+2,dx
	mov	word ptr DGROUP:_act,ax
   ;	
   ;	        act->type = 1;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	byte ptr es:[bx+53],1
   ;	
   ;	        act->direction = 0;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	byte ptr es:[bx+52],0
   ;	
   ;	        act->set_cycle(0, 0);
   ;	
	push	0
	push	0
	push	word ptr DGROUP:_act+2
	push	word ptr DGROUP:_act
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
   ;	
   ;	        act->y_speed = 1;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	word ptr es:[bx+22],1
   ;	
   ;	        var_2 -= ((loop_rec far *)act->loop_data)->fe->f_06 / 2;
   ;	
	les	bx,dword ptr DGROUP:_act
	les	bx,dword ptr es:[bx+70]
	les	bx,dword ptr es:[bx+14]
	mov	ax,word ptr es:[bx+6]
	cwd	
	sub	ax,dx
	sar	ax,1
	sub	word ptr [bp-8],ax
   ;	
   ;	        break;
   ;	
	jmp	@14@114
@14@110:
   ;	
   ;	
   ;	    case 0x7400:                /* ship */
   ;	        if (var_5)
   ;	
	cmp	byte ptr [bp-5],0
	je	short @14@112
   ;	
   ;	        {
   ;	            act = the_cast->add((uchar far *)"shipl.l", mv_ship, do_ship);
   ;	
	push	seg @do_ship$qn7m_actor
	push	offset @do_ship$qn7m_actor
	push	seg @mv_ship$qn7m_actornit2
	push	offset @mv_ship$qn7m_actornit2
	push	ds
	push	offset DGROUP:s@+2517
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_act+2,dx
	mov	word ptr DGROUP:_act,ax
   ;	
   ;	            act->x_speed = -5;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	word ptr es:[bx+20],-5
   ;	
   ;	            act->direction = 1;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	byte ptr es:[bx+52],1
   ;	
   ;	        }
   ;	
	jmp	short @14@113
@14@112:
   ;	
   ;	        else
   ;	        {
   ;	            act = the_cast->add((uchar far *)"shipr.l", mv_ship, do_ship);
   ;	
	push	seg @do_ship$qn7m_actor
	push	offset @do_ship$qn7m_actor
	push	seg @mv_ship$qn7m_actornit2
	push	offset @mv_ship$qn7m_actornit2
	push	ds
	push	offset DGROUP:s@+2525
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_act+2,dx
	mov	word ptr DGROUP:_act,ax
   ;	
   ;	            act->x_speed = 5;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	word ptr es:[bx+20],5
   ;	
   ;	            act->direction = 0;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	byte ptr es:[bx+52],0
@14@113:
   ;	
   ;	        }
   ;	        act->set_cycle(1, 0xA);
   ;	
	push	10
	push	1
	push	word ptr DGROUP:_act+2
	push	word ptr DGROUP:_act
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
   ;	
   ;	        act->type = 1;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	byte ptr es:[bx+53],1
   ;	
   ;	        var_2 -= act->width / 2;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	ax,word ptr es:[bx+16]
	cwd	
	sub	ax,dx
	sar	ax,1
	sub	word ptr [bp-8],ax
   ;	
   ;	        var_4 -= 0x14;
   ;	
	sub	word ptr [bp-10],20
   ;	
   ;	        break;
   ;	
@14@114:
   ;	
   ;	    }
   ;	    act->set_xy(var_2, var_4);
   ;	
	push	word ptr [bp-10]
	push	word ptr [bp-8]
	push	word ptr DGROUP:_act+2
	push	word ptr DGROUP:_act
	call	far ptr @m_actor@set_xy$qii
	add	sp,8
   ;	
   ;	}
   ;	
	leave	
	ret	
@add_map_item$quiui	endp
@14@C363	label	word
	dw	@14@82
	dw	@14@83
	dw	@14@84
	dw	@14@85
@14@C349	label	word
	db	16
	db	0
	db	32
	db	0
	db	0
	db	4
	db	0
	db	8
	db	0
	db	12
	db	0
	db	16
	db	0
	db	20
	db	0
	db	24
	db	0
	db	28
	db	0
	db	32
	db	0
	db	36
	db	0
	db	40
	db	0
	db	44
	db	0
	db	48
	db	0
	db	52
	db	0
	db	56
	db	0
	db	60
	db	0
	db	64
	db	0
	db	68
	db	0
	db	72
	db	0
	db	76
	db	0
	db	80
	db	0
	db	84
	db	0
	db	88
	db	0
	db	92
	db	0
	db	96
	db	0
	db	100
	db	0
	db	104
	db	0
	db	108
	db	0
	db	112
	db	0
	db	116
	dw	@14@14
	dw	@14@28
	dw	@14@14
	dw	@14@33
	dw	@14@36
	dw	@14@28
	dw	@14@37
	dw	@14@41
	dw	@14@42
	dw	@14@43
	dw	@14@54
	dw	@14@14
	dw	@14@45
	dw	@14@49
	dw	@14@59
	dw	@14@64
	dw	@14@68
	dw	@14@72
	dw	@14@76
	dw	@14@88
	dw	@14@89
	dw	@14@14
	dw	@14@94
	dw	@14@96
	dw	@14@100
	dw	@14@102
	dw	@14@106
	dw	@14@108
	dw	@14@109
	dw	@14@64
	dw	@14@110
	assume	cs:GAME_TEXT,ds:DGROUP
@add_barrel$quiui	proc	far
   ;	
   ;	void add_barrel(uint arg_0, uint arg_2)
   ;	
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (arg_2 & 0xF)
   ;	
	test	word ptr [bp+8],15
	je	short @15@3
   ;	
   ;	        strcpy((char *)_tmp, "barrel2.l");
   ;	
	push	ds
	push	offset DGROUP:s@+2533
	jmp	short @15@9
@15@3:
   ;	
   ;	    else
   ;	        switch ((arg_2 + goody_count + enemy_count) & 1)
   ;	
	mov	al,byte ptr DGROUP:_goody_count
	mov	ah,0
	add	ax,word ptr [bp+8]
	mov	dl,byte ptr DGROUP:_enemy_count
	mov	dh,0
	add	ax,dx
	and	ax,1
	or	ax,ax
	je	short @15@7
	cmp	ax,1
	je	short @15@8
	jmp	short @15@10
@15@7:
   ;	
   ;	        {
   ;	        case 0: strcpy((char *)_tmp, "barrel1.l"); break;
   ;	
	push	ds
	push	offset DGROUP:s@+2543
	jmp	short @15@9
@15@8:
   ;	
   ;	        case 1: strcpy((char *)_tmp, "barrel3.l"); break;
   ;	
	push	ds
	push	offset DGROUP:s@+2553
@15@9:
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _strcpy
	add	sp,8
@15@10:
   ;	
   ;	        }
   ;	    act = the_cast->add(_tmp, mv_barrel, do_barrel);
   ;	
	push	seg @do_barrel$qn7m_actor
	push	offset @do_barrel$qn7m_actor
	push	seg @mv_barrel$qn7m_actornit2
	push	offset @mv_barrel$qn7m_actornit2
	push	ds
	push	offset DGROUP:__tmp
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_act+2,dx
	mov	word ptr DGROUP:_act,ax
   ;	
   ;	    act->type = 3;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	byte ptr es:[bx+53],3
   ;	
   ;	    act->counter_24 = arg_2;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	ax,word ptr [bp+8]
	mov	word ptr es:[bx+34],ax
   ;	
   ;	    act->y_speed = 1;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	word ptr es:[bx+22],1
   ;	
   ;	    get_map_coords(arg_0, (int *)act, (int *)act + 1);
   ;	
	mov	ax,word ptr DGROUP:_act
	add	ax,2
	push	word ptr DGROUP:_act+2
	push	ax
	push	word ptr DGROUP:_act+2
	push	word ptr DGROUP:_act
	push	word ptr [bp+6]
	call	far ptr @get_map_coords$quinit2
	add	sp,10
   ;	
   ;	    act->set_xy(act->x - act->width / 2, act->y - act->height);
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	ax,word ptr es:[bx+2]
	les	bx,dword ptr DGROUP:_act
	sub	ax,word ptr es:[bx+18]
	push	ax
	les	bx,dword ptr DGROUP:_act
	mov	ax,word ptr es:[bx+16]
	cwd	
	sub	ax,dx
	sar	ax,1
	les	bx,dword ptr DGROUP:_act
	mov	dx,word ptr es:[bx]
	sub	dx,ax
	push	dx
	push	word ptr DGROUP:_act+2
	push	word ptr DGROUP:_act
	call	far ptr @m_actor@set_xy$qii
	add	sp,8
   ;	
   ;	    if (arg_2 & 0xF)  ++goody_count;
   ;	
	test	word ptr [bp+8],15
	je	short @15@12
	mov	al,byte ptr DGROUP:_goody_count
	inc	al
	mov	byte ptr DGROUP:_goody_count,al
@15@12:
   ;	
   ;	    if (arg_2 & 0x10) ++goody_count;
   ;	
	test	word ptr [bp+8],16
	je	short @15@14
	mov	al,byte ptr DGROUP:_goody_count
	inc	al
	mov	byte ptr DGROUP:_goody_count,al
@15@14:
   ;	
   ;	    if (arg_2 & 0x20) ++enemy_count;
   ;	
	test	word ptr [bp+8],32
	je	short @15@16
	mov	al,byte ptr DGROUP:_enemy_count
	inc	al
	mov	byte ptr DGROUP:_enemy_count,al
@15@16:
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@add_barrel$quiui	endp
	assume	cs:GAME_TEXT,ds:DGROUP
@add_map_pup$quiui	proc	far
   ;	
   ;	void add_map_pup(uint arg_0, uint arg_2)
   ;	
	enter	4,0
   ;	
   ;	{
   ;	    int var_2, var_4;
   ;	
   ;	    switch (arg_2)
   ;	
	mov	bx,word ptr [bp+8]
	dec	bx
	cmp	bx,8
	ja	@16@21
	add	bx,bx
	jmp	word ptr cs:@16@C76[bx]
@16@4:
   ;	
   ;	    {
   ;	    case 1:
   ;	        strcpy((char *)_tmp, "pu_air.l");
   ;	
	push	ds
	push	offset DGROUP:s@+2563
	jmp	@16@20
@16@5:
   ;	
   ;	        break;
   ;	    case 2:
   ;	        strcpy((char *)_tmp, "pu_shld.l");
   ;	
	push	ds
	push	offset DGROUP:s@+2572
	jmp	@16@20
@16@6:
   ;	
   ;	        break;
   ;	    case 3:
   ;	        if (heavy_timer) goto skip;
   ;	
	cmp	word ptr DGROUP:_heavy_timer,0
	jne	@16@24
   ;	
   ;	        strcpy((char *)_tmp, "pu_fire.l");
   ;	
	push	ds
	push	offset DGROUP:s@+2582
	jmp	@16@20
@16@8:
   ;	
   ;	        break;
   ;	    case 4:
   ;	        if (top_fire) goto skip;
   ;	
	cmp	byte ptr DGROUP:_top_fire,0
	jne	@16@24
   ;	
   ;	        strcpy((char *)_tmp, "pu_top.l");
   ;	
	push	ds
	push	offset DGROUP:s@+2592
	jmp	short @16@20
@16@10:
   ;	
   ;	        break;
   ;	    case 5:
   ;	        if (the_game->field_08 != 1)
   ;	
	les	bx,dword ptr DGROUP:_the_game
	cmp	byte ptr es:[bx+8],1
	je	@16@24
   ;	
   ;	        {
   ;	            strcpy((char *)_tmp, "pu_1up.l");
   ;	
	push	ds
	push	offset DGROUP:s@+2601
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _strcpy
	add	sp,8
   ;	
   ;	            arg_0 -= the_map->map_width;
   ;	
	les	bx,dword ptr DGROUP:_the_map
	mov	ax,word ptr es:[bx+142]
	sub	word ptr [bp+6],ax
   ;	
   ;	        }
   ;	
	jmp	short @16@23
@16@12:
   ;	
   ;	        else
   ;	            goto skip;
   ;	        break;
   ;	    case 6:
   ;	        strcpy((char *)_tmp, "pu_key.l");
   ;	
	push	ds
	push	offset DGROUP:s@+2610
	jmp	short @16@20
@16@13:
   ;	
   ;	        break;
   ;	    case 7:
   ;	        if (auto_fire != 1)
   ;	
	cmp	byte ptr DGROUP:_auto_fire,1
	je	@16@24
   ;	
   ;	            strcpy((char *)_tmp, "pu_auto.l");
   ;	
	push	ds
	push	offset DGROUP:s@+2619
	jmp	short @16@20
@16@15:
   ;	
   ;	        else
   ;	            goto skip;
   ;	        break;
   ;	    case 8:
   ;	        if (jason_present) goto skip;
   ;	
	cmp	byte ptr DGROUP:_jason_present,0
	jne	@16@24
   ;	
   ;	        strcpy((char *)_tmp, "pu_jason.l");
   ;	
	push	ds
	push	offset DGROUP:s@+2629
	jmp	short @16@20
@16@17:
   ;	
   ;	        break;
   ;	    case 9:
   ;	        if (jason_present != 0)
   ;	
	cmp	byte ptr DGROUP:_jason_present,0
	je	@16@24
   ;	
   ;	        {
   ;	            if (jason_fire != 1)
   ;	
	cmp	byte ptr DGROUP:_jason_fire,1
	je	@16@24
   ;	
   ;	            {
   ;	                strcpy((char *)_tmp, "pu_jf.l");
   ;	
	push	ds
	push	offset DGROUP:s@+2640
@16@20:
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _strcpy
	jmp	short @16@22
@16@21:
   ;	
   ;	                break;
   ;	            }
   ;	        }
   ;	        goto skip;
   ;	    default:
   ;	        terminate((uchar far *)"Pup not defined!", 0);
   ;	
	push	large 0
	push	ds
	push	offset DGROUP:s@+2648
	call	far ptr @terminate$qnuct1
@16@22:
	add	sp,8
@16@23:
   ;	
   ;	    }
   ;	    act = the_cast->add(_tmp, 0, do_pup);
   ;	
	push	seg @do_pup$qn7m_actor
	push	offset @do_pup$qn7m_actor
	push	large 0
	push	ds
	push	offset DGROUP:__tmp
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_act+2,dx
	mov	word ptr DGROUP:_act,ax
   ;	
   ;	    act->counter_24 = arg_2;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	ax,word ptr [bp+8]
	mov	word ptr es:[bx+34],ax
   ;	
   ;	    act->inactive = 1;
   ;	
	les	bx,dword ptr DGROUP:_act
	or	byte ptr es:[bx+82],32
   ;	
   ;	    act->set_cycle(2, 1);
   ;	
	push	1
	push	2
	push	word ptr DGROUP:_act+2
	push	word ptr DGROUP:_act
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
   ;	
   ;	    get_map_coords(arg_0, &var_2, &var_4);
   ;	
	push	ss
	lea	ax,word ptr [bp-4]
	push	ax
	push	ss
	lea	ax,word ptr [bp-2]
	push	ax
	push	word ptr [bp+6]
	call	far ptr @get_map_coords$quinit2
	add	sp,10
   ;	
   ;	    act->set_xy(var_2, var_4);
   ;	
	push	word ptr [bp-4]
	push	word ptr [bp-2]
	push	word ptr DGROUP:_act+2
	push	word ptr DGROUP:_act
	call	far ptr @m_actor@set_xy$qii
	add	sp,8
	leave	
	ret	
@16@24:
   ;	
   ;	    return;
   ;	skip:
   ;	    add_map_item(arg_0, 0x400);
   ;	
	push	1024
	push	word ptr [bp+6]
	push	cs
	call	near ptr @add_map_item$quiui
	add	sp,4
   ;	
   ;	    --goody_count;
   ;	
	mov	al,byte ptr DGROUP:_goody_count
	add	al,255
	mov	byte ptr DGROUP:_goody_count,al
   ;	
   ;	}
   ;	
	leave	
	ret	
@add_map_pup$quiui	endp
@16@C76	label	word
	dw	@16@4
	dw	@16@5
	dw	@16@6
	dw	@16@8
	dw	@16@10
	dw	@16@12
	dw	@16@13
	dw	@16@15
	dw	@16@17
	assume	cs:GAME_TEXT,ds:DGROUP
@hook_up_switches$qv	proc	far
   ;	
   ;	void hook_up_switches(void)
   ;	
	enter	4,0
   ;	
   ;	{
   ;	    int i, j;
   ;	
   ;	    for (i = 0; i < the_cast->count; ++i)
   ;	
	mov	word ptr [bp-2],0
	jmp	@17@12
@17@2:
   ;	
   ;	    {
   ;	        act = the_cast->actors[i];
   ;	
	mov	ax,word ptr [bp-2]
	shl	ax,2
	les	bx,dword ptr DGROUP:_the_cast
	add	bx,ax
	mov	ax,word ptr es:[bx+4]
	mov	dx,word ptr es:[bx+2]
	mov	word ptr DGROUP:_act+2,ax
	mov	word ptr DGROUP:_act,dx
   ;	
   ;	        if (act->type & 4)
   ;	
	les	bx,dword ptr DGROUP:_act
	test	byte ptr es:[bx+53],4
	je	@17@11
   ;	
   ;	            for (j = 0; j < the_cast->count; ++j)
   ;	
	mov	word ptr [bp-4],0
	jmp	@17@10
@17@4:
   ;	
   ;	            {
   ;	                if ((the_cast->actors[j]->type & 8) &&
   ;	
   ;	
   ;	                    the_cast->actors[j]->counter_24 == act->counter_24)
   ;	
	mov	ax,word ptr [bp-4]
	shl	ax,2
	les	bx,dword ptr DGROUP:_the_cast
	add	bx,ax
	les	bx,dword ptr es:[bx+2]
	test	byte ptr es:[bx+53],8
	je	short @17@9
	mov	ax,word ptr [bp-4]
	shl	ax,2
	les	bx,dword ptr DGROUP:_the_cast
	add	bx,ax
	les	bx,dword ptr es:[bx+2]
	mov	ax,word ptr es:[bx+34]
	les	bx,dword ptr DGROUP:_act
	cmp	ax,word ptr es:[bx+34]
	jne	short @17@9
   ;	
   ;	                {
   ;	                    if (act->target == 0)
   ;	
	les	bx,dword ptr DGROUP:_act
	cmp	dword ptr es:[bx+44],large 0
	jne	short @17@8
   ;	
   ;	                        act->target = the_cast->actors[j];
   ;	
	mov	ax,word ptr [bp-4]
	shl	ax,2
	les	bx,dword ptr DGROUP:_the_cast
	add	bx,ax
	mov	ax,word ptr es:[bx+4]
	mov	dx,word ptr es:[bx+2]
	les	bx,dword ptr DGROUP:_act
	mov	word ptr es:[bx+46],ax
	mov	word ptr es:[bx+44],dx
	jmp	short @17@9
@17@8:
   ;	
   ;	                    else
   ;	                        act->linked = the_cast->actors[j];
   ;	
	mov	ax,word ptr [bp-4]
	shl	ax,2
	les	bx,dword ptr DGROUP:_the_cast
	add	bx,ax
	mov	ax,word ptr es:[bx+4]
	mov	dx,word ptr es:[bx+2]
	les	bx,dword ptr DGROUP:_act
	mov	word ptr es:[bx+50],ax
	mov	word ptr es:[bx+48],dx
@17@9:
	inc	word ptr [bp-4]
@17@10:
	les	bx,dword ptr DGROUP:_the_cast
	mov	al,byte ptr es:[bx]
	mov	ah,0
	cmp	ax,word ptr [bp-4]
	jg	@17@4
@17@11:
	inc	word ptr [bp-2]
@17@12:
	les	bx,dword ptr DGROUP:_the_cast
	mov	al,byte ptr es:[bx]
	mov	ah,0
	cmp	ax,word ptr [bp-2]
	jg	@17@2
   ;	
   ;	                }
   ;	            }
   ;	    }
   ;	}
   ;	
	leave	
	ret	
@hook_up_switches$qv	endp
	assume	cs:GAME_TEXT,ds:DGROUP
@add_switch$quiui	proc	far
   ;	
   ;	void add_switch(uint arg_0, uint arg_2)
   ;	
	enter	4,0
   ;	
   ;	{
   ;	    int var_2, var_4;
   ;	
   ;	    get_map_coords(arg_0, &var_2, &var_4);
   ;	
	push	ss
	lea	ax,word ptr [bp-4]
	push	ax
	push	ss
	lea	ax,word ptr [bp-2]
	push	ax
	push	word ptr [bp+6]
	call	far ptr @get_map_coords$quinit2
	add	sp,10
   ;	
   ;	    act = the_cast->add((uchar far *)"switch.l", 0, do_switch);
   ;	
	push	seg @do_switch$qn7m_actor
	push	offset @do_switch$qn7m_actor
	push	large 0
	push	ds
	push	offset DGROUP:s@+2665
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_act+2,dx
	mov	word ptr DGROUP:_act,ax
   ;	
   ;	    act->type = 5;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	byte ptr es:[bx+53],5
   ;	
   ;	    act->counter_24 = arg_2 >> 6;
   ;	
	mov	ax,word ptr [bp+8]
	shr	ax,6
	les	bx,dword ptr DGROUP:_act
	mov	word ptr es:[bx+34],ax
   ;	
   ;	    act->set_xy(var_2 - 1, var_4);
   ;	
	push	word ptr [bp-4]
	mov	ax,word ptr [bp-2]
	dec	ax
	push	ax
	push	word ptr DGROUP:_act+2
	push	word ptr DGROUP:_act
	call	far ptr @m_actor@set_xy$qii
	add	sp,8
   ;	
   ;	    act->set_cycle(0, 0);
   ;	
	push	0
	push	0
	push	word ptr DGROUP:_act+2
	push	word ptr DGROUP:_act
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
   ;	
   ;	    act->current_loop = 1;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	byte ptr es:[bx+60],1
   ;	
   ;	}
   ;	
	leave	
	ret	
@add_switch$quiui	endp
	assume	cs:GAME_TEXT,ds:DGROUP
@add_door$quiui	proc	far
   ;	
   ;	void add_door(uint arg_0, uint arg_2)
   ;	
	enter	4,0
   ;	
   ;	{
   ;	    int var_2, var_4;
   ;	
   ;	    arg_0 += the_map->map_width;
   ;	
	les	bx,dword ptr DGROUP:_the_map
	mov	ax,word ptr es:[bx+142]
	add	word ptr [bp+6],ax
   ;	
   ;	    get_map_coords(arg_0, &var_2, &var_4);
   ;	
	push	ss
	lea	ax,word ptr [bp-4]
	push	ax
	push	ss
	lea	ax,word ptr [bp-2]
	push	ax
	push	word ptr [bp+6]
	call	far ptr @get_map_coords$quinit2
	add	sp,10
   ;	
   ;	    if (arg_2 == 0xFF)
   ;	
	cmp	word ptr [bp+8],255
	jne	short @19@3
   ;	
   ;	    {
   ;	        act = the_cast->add((uchar far *)"end_dr.l", 0, do_door);
   ;	
	push	seg @do_door$qn7m_actor
	push	offset @do_door$qn7m_actor
	push	large 0
	push	ds
	push	offset DGROUP:s@+2674
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_act+2,dx
	mov	word ptr DGROUP:_act,ax
   ;	
   ;	        end_door_ptr = act;
   ;	
	mov	eax,dword ptr DGROUP:_act
	mov	dword ptr DGROUP:_end_door_ptr,eax
   ;	
   ;	    }
   ;	
	jmp	short @19@4
@19@3:
   ;	
   ;	    else
   ;	        act = the_cast->add((uchar far *)"door_ud.l", 0, do_door);
   ;	
	push	seg @do_door$qn7m_actor
	push	offset @do_door$qn7m_actor
	push	large 0
	push	ds
	push	offset DGROUP:s@+2683
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_act+2,dx
	mov	word ptr DGROUP:_act,ax
@19@4:
   ;	
   ;	    act->type = 0xB;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	byte ptr es:[bx+53],11
   ;	
   ;	    act->counter_24 = arg_2 >> 8;
   ;	
	mov	ax,word ptr [bp+8]
	shr	ax,8
	les	bx,dword ptr DGROUP:_act
	mov	word ptr es:[bx+34],ax
   ;	
   ;	    act->set_xy(var_2 - 4, var_4);
   ;	
	push	word ptr [bp-4]
	mov	ax,word ptr [bp-2]
	add	ax,-4
	push	ax
	push	word ptr DGROUP:_act+2
	push	word ptr DGROUP:_act
	call	far ptr @m_actor@set_xy$qii
	add	sp,8
   ;	
   ;	    act->set_cycle(0, 0);
   ;	
	push	0
	push	0
	push	word ptr DGROUP:_act+2
	push	word ptr DGROUP:_act
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
   ;	
   ;	}
   ;	
	leave	
	ret	
@add_door$quiui	endp
	assume	cs:GAME_TEXT,ds:DGROUP
@add_bubble$qiii	proc	far
   ;	
   ;	void add_bubble(int arg_0, int arg_2, int arg_4)
   ;	
	enter	2,0
   ;	
   ;	{
   ;	    byte var_1;
   ;	
   ;	    if (the_cast->count > 0x7D) return;
   ;	
	les	bx,dword ptr DGROUP:_the_cast
	cmp	byte ptr es:[bx],125
	ja	@20@7
   ;	
   ;	    var_1 = random(2);
   ;	
	push	2
	call	far ptr @random$qi
	pop	cx
	mov	byte ptr [bp-1],al
   ;	
   ;	    if (random(3) == 0)
   ;	
	push	3
	call	far ptr @random$qi
	pop	cx
	or	ax,ax
	jne	short @20@4
   ;	
   ;	        act = the_cast->add((uchar far *)"bubmd.l", 0, do_bubble);
   ;	
	push	seg @do_bubble$qn7m_actor
	push	offset @do_bubble$qn7m_actor
	push	large 0
	push	ds
	push	offset DGROUP:s@+2693
	jmp	short @20@5
@20@4:
   ;	
   ;	    else
   ;	        act = the_cast->add((uchar far *)"bubsm.l", 0, do_bubble);
   ;	
	push	seg @do_bubble$qn7m_actor
	push	offset @do_bubble$qn7m_actor
	push	large 0
	push	ds
	push	offset DGROUP:s@+2701
@20@5:
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_act+2,dx
	mov	word ptr DGROUP:_act,ax
   ;	
   ;	    act->x_speed = arg_4;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	ax,word ptr [bp+10]
	mov	word ptr es:[bx+20],ax
   ;	
   ;	    act->y_speed = -(var_1 + 1);
   ;	
	mov	al,byte ptr [bp-1]
	mov	ah,0
	inc	ax
	neg	ax
	les	bx,dword ptr DGROUP:_act
	mov	word ptr es:[bx+22],ax
   ;	
   ;	    act->set_xy(arg_0, arg_2);
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	word ptr DGROUP:_act+2
	push	word ptr DGROUP:_act
	call	far ptr @m_actor@set_xy$qii
	add	sp,8
   ;	
   ;	    act->set_cycle(var_1, 1);
   ;	
	push	1
	mov	al,byte ptr [bp-1]
	push	ax
	push	word ptr DGROUP:_act+2
	push	word ptr DGROUP:_act
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
@20@7:
   ;	
   ;	}
   ;	
	leave	
	ret	
@add_bubble$qiii	endp
	assume	cs:GAME_TEXT,ds:DGROUP
@add_jason$qv	proc	far
   ;	
   ;	void add_jason(void)
   ;	
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    jason = the_cast->add((uchar far *)"prober.l", mv_ego, do_probe);
   ;	
	push	seg @do_probe$qn7m_actor
	push	offset @do_probe$qn7m_actor
	push	seg @mv_ego$qn7m_actornit2
	push	offset @mv_ego$qn7m_actornit2
	push	ds
	push	offset DGROUP:s@+2709
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_jason+2,dx
	mov	word ptr DGROUP:_jason,ax
   ;	
   ;	    jason->type = 0x11;
   ;	
	les	bx,dword ptr DGROUP:_jason
	mov	byte ptr es:[bx+53],17
   ;	
   ;	    jason->direction = 0;
   ;	
	les	bx,dword ptr DGROUP:_jason
	mov	byte ptr es:[bx+52],0
   ;	
   ;	    if (ego->direction == 0)
   ;	
	les	bx,dword ptr DGROUP:_ego
	cmp	byte ptr es:[bx+52],0
	jne	short @21@3
   ;	
   ;	        jason->set_xy(ego->x - 2, ego->y);
   ;	
	les	bx,dword ptr DGROUP:_ego
	push	word ptr es:[bx+2]
	les	bx,dword ptr DGROUP:_ego
	mov	ax,word ptr es:[bx]
	add	ax,-2
	push	ax
	jmp	short @21@4
@21@3:
   ;	
   ;	    else
   ;	        jason->set_xy(ego->old_x, ego->y);
   ;	
	les	bx,dword ptr DGROUP:_ego
	push	word ptr es:[bx+2]
	les	bx,dword ptr DGROUP:_ego
	push	word ptr es:[bx+4]
@21@4:
	push	word ptr DGROUP:_jason+2
	push	word ptr DGROUP:_jason
	call	far ptr @m_actor@set_xy$qii
	add	sp,8
   ;	
   ;	    jason->set_cycle(0xC, 1);
   ;	
	push	1
	push	12
	push	word ptr DGROUP:_jason+2
	push	word ptr DGROUP:_jason
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
   ;	
   ;	    jason_power = 100;
   ;	
	mov	byte ptr DGROUP:_jason_power,100
   ;	
   ;	    jason_present = 1;
   ;	
	mov	byte ptr DGROUP:_jason_present,1
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@add_jason$qv	endp
	assume	cs:GAME_TEXT,ds:DGROUP
@kill_jason$qv	proc	far
   ;	
   ;	void kill_jason(void)
   ;	
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    jason->flag_0 = 1;
   ;	
	les	bx,dword ptr DGROUP:_jason
	or	byte ptr es:[bx+82],1
   ;	
   ;	    add_explosion(jason->center_x, jason->center_y, 2, 0);
   ;	
	push	large 0
	push	2
	les	bx,dword ptr DGROUP:_jason
	push	word ptr es:[bx+10]
	les	bx,dword ptr DGROUP:_jason
	push	word ptr es:[bx+8]
	call	far ptr @add_explosion$qiiucnuc
	add	sp,10
   ;	
   ;	    if (jason_on == 1 && ego->state != 2)
   ;	
	cmp	byte ptr DGROUP:_jason_on,1
	jne	short @22@4
	les	bx,dword ptr DGROUP:_ego
	cmp	byte ptr es:[bx+61],2
	je	short @22@4
   ;	
   ;	        scroll_to(ego);
   ;	
	push	word ptr DGROUP:_ego+2
	push	word ptr DGROUP:_ego
	call	far ptr @scroll_to$qn7m_actor
	add	sp,4
@22@4:
   ;	
   ;	    jason_on = jason_present = 0;
   ;	
	mov	al,0
	mov	byte ptr DGROUP:_jason_present,al
	mov	byte ptr DGROUP:_jason_on,al
   ;	
   ;	    cur_sub = ego;
   ;	
	mov	eax,dword ptr DGROUP:_ego
	mov	dword ptr DGROUP:_cur_sub,eax
   ;	
   ;	    update_jason_guage();
   ;	
	call	far ptr @update_jason_guage$qv
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@kill_jason$qv	endp
	assume	cs:GAME_TEXT,ds:DGROUP
@toggle_sub_control$qv	proc	far
   ;	
   ;	void toggle_sub_control(void)
   ;	
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (jason_present != 0)
   ;	
	cmp	byte ptr DGROUP:_jason_present,0
	je	short @23@5
   ;	
   ;	    {
   ;	        the_game->play_sound_file((uchar far *)"squeek");
   ;	
	push	ds
	push	offset DGROUP:s@+2718
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_sound_file$qnuc
	add	sp,8
   ;	
   ;	        cur_sub->x_speed = cur_sub->y_speed = 0;
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	xor	ax,ax
	mov	word ptr es:[bx+22],ax
	les	bx,dword ptr DGROUP:_cur_sub
	mov	word ptr es:[bx+20],ax
   ;	
   ;	        if (jason_on == 1)
   ;	
	cmp	byte ptr DGROUP:_jason_on,1
	jne	short @23@4
   ;	
   ;	        {
   ;	            scroll_to(ego);
   ;	
	push	word ptr DGROUP:_ego+2
	push	word ptr DGROUP:_ego
	call	far ptr @scroll_to$qn7m_actor
	add	sp,4
   ;	
   ;	            jason_on = 0;
   ;	
	mov	byte ptr DGROUP:_jason_on,0
   ;	
   ;	            cur_sub = ego;
   ;	
	mov	eax,dword ptr DGROUP:_ego
	mov	dword ptr DGROUP:_cur_sub,eax
   ;	
   ;	        }
   ;	
	pop	bp
	ret	
@23@4:
   ;	
   ;	        else
   ;	        {
   ;	            ego->y_speed = 0;
   ;	
	les	bx,dword ptr DGROUP:_ego
	mov	word ptr es:[bx+22],0
   ;	
   ;	            scroll_to(jason);
   ;	
	push	word ptr DGROUP:_jason+2
	push	word ptr DGROUP:_jason
	call	far ptr @scroll_to$qn7m_actor
	add	sp,4
   ;	
   ;	            jason_on = 1;
   ;	
	mov	byte ptr DGROUP:_jason_on,1
   ;	
   ;	            cur_sub = jason;
   ;	
	mov	eax,dword ptr DGROUP:_jason
	mov	dword ptr DGROUP:_cur_sub,eax
@23@5:
   ;	
   ;	        }
   ;	    }
   ;	}
   ;	
	pop	bp
	ret	
@toggle_sub_control$qv	endp
	assume	cs:GAME_TEXT,ds:DGROUP
@check_user$qv	proc	far
   ;	
   ;	void check_user(void)
   ;	
	enter	4,0
   ;	
   ;	{
   ;	    int   var_4;
   ;	    uchar var_1;
   ;	
   ;	    if (control == 0) goto no_input;
   ;	
	cmp	byte ptr DGROUP:_control,0
	je	@24@88
   ;	
   ;	
   ;	    if (gr_keys[1] || gr_keys[0x3B])
   ;	
	cmp	byte ptr DGROUP:_gr_keys+1,0
	jne	short @24@4
	cmp	byte ptr DGROUP:_gr_keys+59,0
	je	short @24@6
@24@4:
   ;	
   ;	        if (!displayed_page)
   ;	
	cmp	byte ptr DGROUP:_displayed_page,0
	jne	short @24@6
   ;	
   ;	            activate_menu_bar();
   ;	
	call	far ptr @activate_menu_bar$qv
@24@6:
   ;	
   ;	
   ;	    if (the_game->field_2B == 1)
   ;	
	les	bx,dword ptr DGROUP:_the_game
	cmp	byte ptr es:[bx+43],1
	jne	short @24@14
   ;	
   ;	    {
   ;	        if (auto_fire == 1 && jason_on == 0)
   ;	
	cmp	byte ptr DGROUP:_auto_fire,1
	jne	short @24@11
	cmp	byte ptr DGROUP:_jason_on,0
	jne	short @24@11
   ;	
   ;	        {
   ;	            if (auto_fire_count++ == 2)
   ;	
	mov	al,byte ptr DGROUP:_auto_fire_count
	inc	byte ptr DGROUP:_auto_fire_count
	cmp	al,2
	jne	short @24@16
   ;	
   ;	            {
   ;	                auto_fire_count = 0;
   ;	
	mov	byte ptr DGROUP:_auto_fire_count,0
   ;	
   ;	                ego_fire();
   ;	
	call	far ptr @ego_fire$qv
	jmp	short @24@16
@24@11:
   ;	
   ;	            }
   ;	        }
   ;	        else
   ;	        {
   ;	            if (space_bar_been_up != 0)
   ;	
	cmp	word ptr DGROUP:_space_bar_been_up,0
	je	short @24@13
   ;	
   ;	                ego_fire();
   ;	
	call	far ptr @ego_fire$qv
@24@13:
   ;	
   ;	            space_bar_been_up = 0;
   ;	
	mov	word ptr DGROUP:_space_bar_been_up,0
	jmp	short @24@16
@24@14:
   ;	
   ;	        }
   ;	    }
   ;	    else
   ;	    {
   ;	        if (space_bar_been_up == 0)
   ;	
	cmp	word ptr DGROUP:_space_bar_been_up,0
	jne	short @24@16
   ;	
   ;	            space_bar_been_up++;
   ;	
	inc	word ptr DGROUP:_space_bar_been_up
@24@16:
   ;	
   ;	    }
   ;	
   ;	    if (the_game->field_2C == 1 && ego->state == 0)
   ;	
	les	bx,dword ptr DGROUP:_the_game
	cmp	byte ptr es:[bx+44],1
	jne	@24@26
	les	bx,dword ptr DGROUP:_ego
	cmp	byte ptr es:[bx+61],0
	jne	short @24@26
   ;	
   ;	    {
   ;	        for (var_4 = 0; var_4 < teleport_count; var_4++)
   ;	
	mov	word ptr [bp-2],0
	jmp	short @24@22
@24@19:
   ;	
   ;	            if (cur_sub->on_pos(all_teleports[var_4][0]))
   ;	
	mov	bx,word ptr [bp-2]
	shl	bx,2
	push	word ptr DGROUP:_all_teleports[bx]
	push	word ptr DGROUP:_cur_sub+2
	push	word ptr DGROUP:_cur_sub
	call	far ptr @m_actor@on_pos$qui
	add	sp,6
	or	al,al
	je	short @24@21
   ;	
   ;	            {
   ;	                teleport_to(all_teleports[var_4][1]);
   ;	
	mov	bx,word ptr [bp-2]
	shl	bx,2
	push	word ptr DGROUP:_all_teleports[bx+2]
	call	far ptr @teleport_to$qui
	pop	cx
   ;	
   ;	                break;
   ;	
	jmp	short @24@23
@24@21:
	inc	word ptr [bp-2]
@24@22:
	mov	al,byte ptr DGROUP:_teleport_count
	mov	ah,0
	cmp	ax,word ptr [bp-2]
	jg	short @24@19
@24@23:
   ;	
   ;	            }
   ;	        if (jason_present == 1 && var_4 == teleport_count)
   ;	
	cmp	byte ptr DGROUP:_jason_present,1
	jne	short @24@26
	mov	al,byte ptr DGROUP:_teleport_count
	mov	ah,0
	cmp	ax,word ptr [bp-2]
	jne	short @24@26
   ;	
   ;	        {
   ;	            toggle_sub_control();
   ;	
	push	cs
	call	near ptr @toggle_sub_control$qv
   ;	
   ;	            display->pause(0xA);
   ;	
	push	10
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@pause$qui
	add	sp,6
@24@26:
   ;	
   ;	        }
   ;	    }
   ;	
   ;	    var_1 = 0;
   ;	
	mov	byte ptr [bp-3],0
   ;	
   ;	    if (the_game->field_2A != 0)
   ;	
	les	bx,dword ptr DGROUP:_the_game
	cmp	byte ptr es:[bx+42],0
	je	short @24@31
   ;	
   ;	    {
   ;	        if (cur_sub->direction != 0)
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	cmp	byte ptr es:[bx+52],0
	je	short @24@29
   ;	
   ;	            turn_ego();
   ;	
	call	far ptr @turn_ego$qv
@24@29:
   ;	
   ;	        if (cur_sub->state != 1)
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	cmp	byte ptr es:[bx+61],1
	je	short @24@36
   ;	
   ;	            cur_sub->x_speed = ego_x_speed;
   ;	
	mov	al,byte ptr DGROUP:_ego_x_speed
	mov	ah,0
	les	bx,dword ptr DGROUP:_cur_sub
	mov	word ptr es:[bx+20],ax
	jmp	short @24@36
@24@31:
   ;	
   ;	        var_1 = 1;
   ;	    }
   ;	    else if (the_game->field_29 != 0)
   ;	
	les	bx,dword ptr DGROUP:_the_game
	cmp	byte ptr es:[bx+41],0
	je	short @24@37
   ;	
   ;	    {
   ;	        if (cur_sub->direction != 1)
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	cmp	byte ptr es:[bx+52],1
	je	short @24@34
   ;	
   ;	            turn_ego();
   ;	
	call	far ptr @turn_ego$qv
@24@34:
   ;	
   ;	        if (cur_sub->state != 1)
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	cmp	byte ptr es:[bx+61],1
	je	short @24@36
   ;	
   ;	            cur_sub->x_speed = -ego_x_speed;
   ;	
	mov	al,byte ptr DGROUP:_ego_x_speed
	mov	ah,0
	neg	ax
	les	bx,dword ptr DGROUP:_cur_sub
	mov	word ptr es:[bx+20],ax
@24@36:
   ;	
   ;	        var_1 = 1;
   ;	
	mov	byte ptr [bp-3],1
   ;	
   ;	    }
   ;	
	jmp	short @24@41
@24@37:
   ;	
   ;	    else
   ;	    {
   ;	        if (cur_sub->x_speed != 0)
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	cmp	word ptr es:[bx+20],0
	je	short @24@41
   ;	
   ;	        {
   ;	            if (cur_sub->x_speed > 0)
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	cmp	word ptr es:[bx+20],0
	jle	short @24@40
   ;	
   ;	                cur_sub->x_speed--;
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	dec	word ptr es:[bx+20]
	jmp	short @24@41
@24@40:
   ;	
   ;	            else
   ;	                cur_sub->x_speed++;
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	inc	word ptr es:[bx+20]
@24@41:
   ;	
   ;	        }
   ;	    }
   ;	
   ;	    if (the_game->field_28 != 0)
   ;	
	les	bx,dword ptr DGROUP:_the_game
	cmp	byte ptr es:[bx+40],0
	je	short @24@46
   ;	
   ;	    {
   ;	        if (ego_y_speed > cur_sub->y_speed)
   ;	
	mov	al,byte ptr DGROUP:_ego_y_speed
	mov	ah,0
	les	bx,dword ptr DGROUP:_cur_sub
	cmp	ax,word ptr es:[bx+22]
	jle	short @24@44
   ;	
   ;	            cur_sub->y_speed++;
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	inc	word ptr es:[bx+22]
	jmp	short @24@51
@24@44:
   ;	
   ;	        else if (ego_y_speed < cur_sub->y_speed)
   ;	
	mov	al,byte ptr DGROUP:_ego_y_speed
	mov	ah,0
	les	bx,dword ptr DGROUP:_cur_sub
	cmp	ax,word ptr es:[bx+22]
	jge	short @24@51
   ;	
   ;	            cur_sub->y_speed = ego_y_speed;
   ;	
	mov	al,byte ptr DGROUP:_ego_y_speed
	mov	ah,0
	les	bx,dword ptr DGROUP:_cur_sub
	mov	word ptr es:[bx+22],ax
	jmp	short @24@51
@24@46:
   ;	
   ;	        var_1 = 1;
   ;	    }
   ;	    else if (the_game->field_27 != 0)
   ;	
	les	bx,dword ptr DGROUP:_the_game
	cmp	byte ptr es:[bx+39],0
	je	short @24@52
   ;	
   ;	    {
   ;	        if (-ego_y_speed < cur_sub->y_speed)
   ;	
	mov	al,byte ptr DGROUP:_ego_y_speed
	mov	ah,0
	neg	ax
	les	bx,dword ptr DGROUP:_cur_sub
	cmp	ax,word ptr es:[bx+22]
	jge	short @24@49
   ;	
   ;	            cur_sub->y_speed--;
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	dec	word ptr es:[bx+22]
	jmp	short @24@51
@24@49:
   ;	
   ;	        else if (-ego_y_speed > cur_sub->y_speed)
   ;	
	mov	al,byte ptr DGROUP:_ego_y_speed
	mov	ah,0
	neg	ax
	les	bx,dword ptr DGROUP:_cur_sub
	cmp	ax,word ptr es:[bx+22]
	jle	short @24@51
   ;	
   ;	            cur_sub->y_speed = -ego_y_speed;
   ;	
	mov	al,byte ptr DGROUP:_ego_y_speed
	mov	ah,0
	neg	ax
	les	bx,dword ptr DGROUP:_cur_sub
	mov	word ptr es:[bx+22],ax
@24@51:
   ;	
   ;	        var_1 = 1;
   ;	
	mov	byte ptr [bp-3],1
   ;	
   ;	    }
   ;	
	jmp	short @24@56
@24@52:
   ;	
   ;	    else
   ;	    {
   ;	        if (abs(cur_sub->y_speed) > 1)
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	push	word ptr es:[bx+22]
	call	far ptr @abs$qi
	pop	cx
	cmp	ax,1
	jle	short @24@56
   ;	
   ;	        {
   ;	            if (cur_sub->y_speed > 0)
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	cmp	word ptr es:[bx+22],0
	jle	short @24@55
   ;	
   ;	                cur_sub->y_speed--;
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	dec	word ptr es:[bx+22]
	jmp	short @24@56
@24@55:
   ;	
   ;	            else
   ;	                cur_sub->y_speed++;
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	inc	word ptr es:[bx+22]
@24@56:
   ;	
   ;	        }
   ;	    }
   ;	
   ;	    if (ego->state != 1)
   ;	
	les	bx,dword ptr DGROUP:_ego
	cmp	byte ptr es:[bx+61],1
	je	short @24@64
   ;	
   ;	    {
   ;	        if (var_1 != 0)
   ;	
	cmp	byte ptr [bp-3],0
	je	short @24@61
   ;	
   ;	        {
   ;	            if (cur_sub->cycle_speed != 0 || cur_sub->frame == 0)
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	cmp	byte ptr es:[bx+58],0
	jne	short @24@60
	les	bx,dword ptr DGROUP:_cur_sub
	cmp	byte ptr es:[bx+56],0
	jne	short @24@64
@24@60:
   ;	
   ;	                cur_sub->set_cycle(0, 1);
   ;	
	push	1
	push	0
	jmp	short @24@63
@24@61:
   ;	
   ;	        }
   ;	        else
   ;	        {
   ;	            if (cur_sub->cycle_speed != 0xC)
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	cmp	byte ptr es:[bx+58],12
	je	short @24@64
   ;	
   ;	                cur_sub->set_cycle(0xC, 1);
   ;	
	push	1
	push	12
@24@63:
	push	word ptr DGROUP:_cur_sub+2
	push	word ptr DGROUP:_cur_sub
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
@24@64:
   ;	
   ;	        }
   ;	    }
   ;	
   ;	    if (cheat_mode == 1)
   ;	
	cmp	byte ptr DGROUP:_cheat_mode,1
	jne	@24@88
   ;	
   ;	    {
   ;	        if (gr_keys[0x1E])
   ;	
	cmp	byte ptr DGROUP:_gr_keys+30,0
	je	short @24@67
   ;	
   ;	            update_air_guage(2, 0x68, 0xA7);
   ;	
	push	167
	push	104
	push	2
	call	far ptr @update_air_guage$qiii
	add	sp,6
@24@67:
   ;	
   ;	        if (gr_keys[0x1F])
   ;	
	cmp	byte ptr DGROUP:_gr_keys+31,0
	je	short @24@69
   ;	
   ;	            update_shld_guage(2, 0x68, 0xB3);
   ;	
	push	179
	push	104
	push	2
	call	far ptr @update_shld_guage$qiii
	add	sp,6
@24@69:
   ;	
   ;	        if (gr_keys[0x21] && shot_size != 3)
   ;	
	cmp	byte ptr DGROUP:_gr_keys+33,0
	je	short @24@72
	cmp	byte ptr DGROUP:_shot_size,3
	je	short @24@72
   ;	
   ;	        {
   ;	            shot_size = 3;
   ;	
	mov	byte ptr DGROUP:_shot_size,3
   ;	
   ;	            the_game->play_sound_file((uchar far *)"drillhi");
   ;	
	push	ds
	push	offset DGROUP:s@+2725
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_sound_file$qnuc
	add	sp,8
@24@72:
   ;	
   ;	        }
   ;	        if (gr_keys[0x13] && auto_fire != 1)
   ;	
	cmp	byte ptr DGROUP:_gr_keys+19,0
	je	short @24@75
	cmp	byte ptr DGROUP:_auto_fire,1
	je	short @24@75
   ;	
   ;	        {
   ;	            auto_fire = 1;
   ;	
	mov	byte ptr DGROUP:_auto_fire,1
   ;	
   ;	            the_game->play_sound_file((uchar far *)"drillhi");
   ;	
	push	ds
	push	offset DGROUP:s@+2733
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_sound_file$qnuc
	add	sp,8
@24@75:
   ;	
   ;	        }
   ;	        if (gr_keys[0x24] && jason_present == 0)
   ;	
	cmp	byte ptr DGROUP:_gr_keys+36,0
	je	short @24@78
	cmp	byte ptr DGROUP:_jason_present,0
	jne	short @24@78
   ;	
   ;	        {
   ;	            add_jason();
   ;	
	push	cs
	call	near ptr @add_jason$qv
   ;	
   ;	            the_game->play_sound_file((uchar far *)"drillhi");
   ;	
	push	ds
	push	offset DGROUP:s@+2741
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_sound_file$qnuc
	add	sp,8
@24@78:
   ;	
   ;	        }
   ;	        if (gr_keys[0x23] && jason_present == 1 && jason_fire != 1)
   ;	
	cmp	byte ptr DGROUP:_gr_keys+35,0
	je	short @24@82
	cmp	byte ptr DGROUP:_jason_present,1
	jne	short @24@82
	cmp	byte ptr DGROUP:_jason_fire,1
	je	short @24@82
   ;	
   ;	        {
   ;	            jason_fire = 1;
   ;	
	mov	byte ptr DGROUP:_jason_fire,1
   ;	
   ;	            the_game->play_sound_file((uchar far *)"drillhi");
   ;	
	push	ds
	push	offset DGROUP:s@+2749
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_sound_file$qnuc
	add	sp,8
@24@82:
   ;	
   ;	        }
   ;	        if (gr_keys[0x16] && top_fire != 1)
   ;	
	cmp	byte ptr DGROUP:_gr_keys+22,0
	je	short @24@85
	cmp	byte ptr DGROUP:_top_fire,1
	je	short @24@85
   ;	
   ;	        {
   ;	            top_fire = 1;
   ;	
	mov	byte ptr DGROUP:_top_fire,1
   ;	
   ;	            the_game->play_sound_file((uchar far *)"drillhi");
   ;	
	push	ds
	push	offset DGROUP:s@+2757
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_sound_file$qnuc
	add	sp,8
@24@85:
   ;	
   ;	        }
   ;	        if (gr_keys[0x22] && god_mode != 1)
   ;	
	cmp	byte ptr DGROUP:_gr_keys+34,0
	je	short @24@88
	cmp	byte ptr DGROUP:_god_mode,1
	je	short @24@88
   ;	
   ;	        {
   ;	            god_mode = 1;
   ;	
	mov	byte ptr DGROUP:_god_mode,1
   ;	
   ;	            the_game->play_sound_file((uchar far *)"drillhi");
   ;	
	push	ds
	push	offset DGROUP:s@+2765
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_sound_file$qnuc
	add	sp,8
@24@88:
   ;	
   ;	        }
   ;	    }
   ;	
   ;	no_input:
   ;	    if (debug_mode == 1)
   ;	
	cmp	byte ptr DGROUP:_debug_mode,1
	jne	@24@108
   ;	
   ;	    {
   ;	        if (gr_keys[0x20])
   ;	
	cmp	byte ptr DGROUP:_gr_keys+32,0
	je	short @24@91
   ;	
   ;	            debug++;
   ;	
	inc	byte ptr DGROUP:_debug
@24@91:
   ;	
   ;	        if (gr_keys[0x19] && displayed_page == 0)
   ;	
	cmp	byte ptr DGROUP:_gr_keys+25,0
	je	short @24@94
	cmp	byte ptr DGROUP:_displayed_page,0
	jne	short @24@94
   ;	
   ;	        {
   ;	            display->dump_pcx();
   ;	
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@dump_pcx$qve
	add	sp,4
   ;	
   ;	            i_inform((uchar far *)"Riptide.pcx has been written", 0, 0, 0);
   ;	
	push	0
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+2773
	call	far ptr @i_inform$qnucuce
	add	sp,10
@24@94:
   ;	
   ;	        }
   ;	        if (gr_keys[0x2C])
   ;	
	cmp	byte ptr DGROUP:_gr_keys+44,0
	je	short @24@96
   ;	
   ;	            stop_room = 1;
   ;	
	mov	byte ptr DGROUP:_stop_room,1
@24@96:
   ;	
   ;	        if (gr_keys[0x02])
   ;	
	cmp	byte ptr DGROUP:_gr_keys+2,0
	je	short @24@98
   ;	
   ;	            display->pause(0xA);
   ;	
	push	10
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@pause$qui
	add	sp,6
@24@98:
   ;	
   ;	        if (gr_keys[0x03])
   ;	
	cmp	byte ptr DGROUP:_gr_keys+3,0
	je	short @24@100
   ;	
   ;	            display->pause(0x1E);
   ;	
	push	30
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@pause$qui
	add	sp,6
@24@100:
   ;	
   ;	        if (gr_keys[0x3B])
   ;	
	cmp	byte ptr DGROUP:_gr_keys+59,0
	je	short @24@102
   ;	
   ;	            display->show_offset(0);
   ;	
	push	0
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@show_offset$qui
	add	sp,6
@24@102:
   ;	
   ;	        if (gr_keys[0x3C])
   ;	
	cmp	byte ptr DGROUP:_gr_keys+60,0
	je	short @24@104
   ;	
   ;	            display->show_offset(0x3E80);
   ;	
	push	16000
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@show_offset$qui
	add	sp,6
@24@104:
   ;	
   ;	        if (gr_keys[0x3D])
   ;	
	cmp	byte ptr DGROUP:_gr_keys+61,0
	je	short @24@106
   ;	
   ;	            display->show_offset(0x7D00);
   ;	
	push	32000
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@show_offset$qui
	add	sp,6
@24@106:
   ;	
   ;	        if (gr_keys[0x3E])
   ;	
	cmp	byte ptr DGROUP:_gr_keys+62,0
	je	short @24@108
   ;	
   ;	            display->show_offset(0xBB80);
   ;	
	push	-17536
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@show_offset$qui
	add	sp,6
@24@108:
   ;	
   ;	    }
   ;	}
   ;	
	leave	
	ret	
@check_user$qv	endp
	assume	cs:GAME_TEXT,ds:DGROUP
@teleport_to$qui	proc	far
   ;	
   ;	void teleport_to(uint arg_0)
   ;	
	enter	6,0
   ;	
   ;	{
   ;	    int var_2, var_4, var_6;
   ;	
   ;	    control = 0;
   ;	
	mov	byte ptr DGROUP:_control,0
   ;	
   ;	    cur_sub->state = 6;
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	mov	byte ptr es:[bx+61],6
   ;	
   ;	    if (jason_on == 0)
   ;	
	cmp	byte ptr DGROUP:_jason_on,0
	jne	short @25@3
   ;	
   ;	    {
   ;	        ego->new_loop((uchar far *)"backsub.l");
   ;	
	push	ds
	push	offset DGROUP:s@+2802
	push	word ptr DGROUP:_ego+2
	push	word ptr DGROUP:_ego
	call	far ptr @m_actor@new_loop$qnuc
	add	sp,8
   ;	
   ;	        ego->set_cycle(0, 1);
   ;	
	push	1
	push	0
	push	word ptr DGROUP:_ego+2
	push	word ptr DGROUP:_ego
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
@25@3:
   ;	
   ;	    }
   ;	    cur_sub->x_speed = 0;
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	mov	word ptr es:[bx+20],0
   ;	
   ;	    cur_sub->y_speed = 0;
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	mov	word ptr es:[bx+22],0
   ;	
   ;	    var_6 = 10;
   ;	
	mov	word ptr [bp-6],10
   ;	
   ;	    the_game->play_sound((uchar far *)"tport", 0xF);
   ;	
	push	15
	push	ds
	push	offset DGROUP:s@+2812
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_sound$qnucuc
	add	sp,10
	jmp	short @25@5
@25@4:
   ;	
   ;	    while (var_6--) de_doit();
   ;	
	push	cs
	call	near ptr @de_doit$qv
@25@5:
	mov	ax,word ptr [bp-6]
	dec	word ptr [bp-6]
	or	ax,ax
	jne	short @25@4
   ;	
   ;	    get_map_coords(arg_0, &var_2, &var_4);
   ;	
	push	ss
	lea	ax,word ptr [bp-4]
	push	ax
	push	ss
	lea	ax,word ptr [bp-2]
	push	ax
	push	word ptr [bp+6]
	call	far ptr @get_map_coords$quinit2
	add	sp,10
   ;	
   ;	    var_2 -= cur_sub->width / 2;
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	mov	ax,word ptr es:[bx+16]
	cwd	
	sub	ax,dx
	sar	ax,1
	sub	word ptr [bp-2],ax
   ;	
   ;	    var_4 -= cur_sub->height / 2;
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	mov	ax,word ptr es:[bx+18]
	cwd	
	sub	ax,dx
	sar	ax,1
	sub	word ptr [bp-4],ax
   ;	
   ;	    if (jason_on == 0)
   ;	
	cmp	byte ptr DGROUP:_jason_on,0
	jne	short @25@11
   ;	
   ;	    {
   ;	        if (jason_present != 0 && touching(ego, jason))
   ;	
	cmp	byte ptr DGROUP:_jason_present,0
	je	short @25@10
	push	word ptr DGROUP:_jason+2
	push	word ptr DGROUP:_jason
	push	word ptr DGROUP:_ego+2
	push	word ptr DGROUP:_ego
	call	far ptr @touching$qn7m_actort1
	add	sp,8
	or	al,al
	je	short @25@10
   ;	
   ;	            jason->set_xy(var_2, var_4);
   ;	
	push	word ptr [bp-4]
	push	word ptr [bp-2]
	push	word ptr DGROUP:_jason+2
	push	word ptr DGROUP:_jason
	call	far ptr @m_actor@set_xy$qii
	add	sp,8
@25@10:
   ;	
   ;	        cur_sub->new_loop((uchar far *)"turn.l");
   ;	
	push	ds
	push	offset DGROUP:s@+2818
	push	word ptr DGROUP:_cur_sub+2
	push	word ptr DGROUP:_cur_sub
	call	far ptr @m_actor@new_loop$qnuc
	add	sp,8
@25@11:
   ;	
   ;	    }
   ;	    cur_sub->set_xy(var_2, var_4);
   ;	
	push	word ptr [bp-4]
	push	word ptr [bp-2]
	push	word ptr DGROUP:_cur_sub+2
	push	word ptr DGROUP:_cur_sub
	call	far ptr @m_actor@set_xy$qii
	add	sp,8
   ;	
   ;	    var_6 = 5;
   ;	
	mov	word ptr [bp-6],5
	jmp	short @25@13
@25@12:
   ;	
   ;	    while (var_6--) de_doit();
   ;	
	push	cs
	call	near ptr @de_doit$qv
@25@13:
	mov	ax,word ptr [bp-6]
	dec	word ptr [bp-6]
	or	ax,ax
	jne	short @25@12
   ;	
   ;	    if (jason_on == 0)
   ;	
	cmp	byte ptr DGROUP:_jason_on,0
	jne	short @25@19
   ;	
   ;	    {
   ;	        if (ego->direction == 0)
   ;	
	les	bx,dword ptr DGROUP:_ego
	cmp	byte ptr es:[bx+52],0
	jne	short @25@17
   ;	
   ;	            ego->new_loop((uchar far *)"subr.l");
   ;	
	push	ds
	push	offset DGROUP:s@+2825
	jmp	short @25@18
@25@17:
   ;	
   ;	        else
   ;	            ego->new_loop((uchar far *)"subl.l");
   ;	
	push	ds
	push	offset DGROUP:s@+2832
@25@18:
	push	word ptr DGROUP:_ego+2
	push	word ptr DGROUP:_ego
	call	far ptr @m_actor@new_loop$qnuc
	add	sp,8
@25@19:
   ;	
   ;	    }
   ;	    cur_sub->state = 0;
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	mov	byte ptr es:[bx+61],0
   ;	
   ;	    control = 1;
   ;	
	mov	byte ptr DGROUP:_control,1
   ;	
   ;	}
   ;	
	leave	
	ret	
@teleport_to$qui	endp
	assume	cs:GAME_TEXT,ds:DGROUP
@update_boss_guage$qv	proc	far
   ;	
   ;	void update_boss_guage(void)
   ;	
	enter	6,0
   ;	
   ;	{
   ;	    int var_2, var_4, var_6;
   ;	
   ;	    if (boss->state == 2)
   ;	
	les	bx,dword ptr DGROUP:_boss
	cmp	byte ptr es:[bx+61],2
	je	@26@21
   ;	
   ;	        return;
   ;	    switch (cur_map)
   ;	
	mov	al,byte ptr DGROUP:_cur_map
	mov	ah,0
	cmp	ax,6
	je	short @26@7
	cmp	ax,12
	je	short @26@11
	cmp	ax,21
	je	short @26@14
	jmp	@26@17
@26@7:
   ;	
   ;	    {
   ;	        case 6:
   ;	            if (boss->x_speed != 0 && boss != 0)
   ;	
	les	bx,dword ptr DGROUP:_boss
	cmp	word ptr es:[bx+20],0
	je	short @26@10
	cmp	dword ptr DGROUP:_boss,large 0
	je	short @26@10
   ;	
   ;	            {
   ;	                var_2 = 0x5A - boss->health;
   ;	
	les	bx,dword ptr DGROUP:_boss
	mov	ax,90
	sub	ax,word ptr es:[bx+38]
	mov	word ptr [bp-2],ax
   ;	
   ;	                var_4 = 0x5A;
   ;	
	mov	word ptr [bp-4],90
   ;	
   ;	                var_6 = 1;
   ;	
	mov	word ptr [bp-6],1
   ;	
   ;	            }
   ;	
	jmp	short @26@17
@26@10:
   ;	
   ;	            else
   ;	                var_6 = 0;
   ;	
	mov	word ptr [bp-6],0
	jmp	short @26@17
@26@11:
   ;	
   ;	            break;
   ;	        case 0xC:
   ;	            var_6 = 1;
   ;	
	mov	word ptr [bp-6],1
   ;	
   ;	            var_4 = 0x3C;
   ;	
	mov	word ptr [bp-4],60
   ;	
   ;	            if (boss->counter_26 == 4)
   ;	
	les	bx,dword ptr DGROUP:_boss
	cmp	word ptr es:[bx+36],4
	jne	short @26@13
   ;	
   ;	                var_2 = 0x3C - boss->field_28;
   ;	
	les	bx,dword ptr DGROUP:_boss
	mov	ax,60
	sub	ax,word ptr es:[bx+40]
	mov	word ptr [bp-2],ax
	jmp	short @26@17
@26@13:
   ;	
   ;	            else
   ;	                var_2 = var_4;
   ;	
	mov	ax,word ptr [bp-4]
	mov	word ptr [bp-2],ax
	jmp	short @26@17
@26@14:
   ;	
   ;	            break;
   ;	        case 0x15:
   ;	            var_6 = 1;
   ;	
	mov	word ptr [bp-6],1
   ;	
   ;	            if (boss->target != 0)
   ;	
	les	bx,dword ptr DGROUP:_boss
	cmp	dword ptr es:[bx+44],large 0
	je	short @26@16
   ;	
   ;	            {
   ;	                var_2 = 0x28 - boss->target->field_28;
   ;	
	les	bx,dword ptr DGROUP:_boss
	les	bx,dword ptr es:[bx+44]
	mov	ax,40
	sub	ax,word ptr es:[bx+40]
	mov	word ptr [bp-2],ax
   ;	
   ;	                var_4 = 0x28;
   ;	
	mov	word ptr [bp-4],40
   ;	
   ;	            }
   ;	
	jmp	short @26@17
@26@16:
   ;	
   ;	            else
   ;	            {
   ;	                var_2 = 0x5A - boss->field_28;
   ;	
	les	bx,dword ptr DGROUP:_boss
	mov	ax,90
	sub	ax,word ptr es:[bx+40]
	mov	word ptr [bp-2],ax
   ;	
   ;	                var_4 = 0x5A;
   ;	
	mov	word ptr [bp-4],90
@26@17:
   ;	
   ;	            }
   ;	            break;
   ;	        default:
   ;	            break;
   ;	    }
   ;	    if (var_6 == 0)
   ;	
	cmp	word ptr [bp-6],0
	je	@26@21
   ;	
   ;	        return;
   ;	    if (var_2 < 0)
   ;	
	cmp	word ptr [bp-2],0
	jge	short @26@20
   ;	
   ;	        var_2 = 0;
   ;	
	mov	word ptr [bp-2],0
@26@20:
   ;	
   ;	    display->fill_rect(0xC3, 0x87, var_4 + 0xC3, 0x8C, 0x1C, -1, non_displayed_page);
   ;	
	mov	al,byte ptr DGROUP:_non_displayed_page
	push	ax
	push	-1
	push	28
	push	140
	mov	ax,word ptr [bp-4]
	add	ax,195
	push	ax
	push	135
	push	195
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@fill_rect$qiiiiiiuc
	add	sp,18
   ;	
   ;	    display->draw_span(0xC3, 0x87, 0x26, var_2, page_offsets[non_displayed_page]);
   ;	
	mov	al,byte ptr DGROUP:_non_displayed_page
	mov	ah,0
	add	ax,ax
	mov	bx,ax
	push	word ptr DGROUP:_page_offsets[bx]
	push	word ptr [bp-2]
	push	38
	push	135
	push	195
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@draw_span$qiiuciui
	add	sp,14
   ;	
   ;	    display->draw_span(0xC3, 0x88, 0x23, var_2, page_offsets[non_displayed_page]);
   ;	
	mov	al,byte ptr DGROUP:_non_displayed_page
	mov	ah,0
	add	ax,ax
	mov	bx,ax
	push	word ptr DGROUP:_page_offsets[bx]
	push	word ptr [bp-2]
	push	35
	push	136
	push	195
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@draw_span$qiiuciui
	add	sp,14
   ;	
   ;	    display->draw_span(0xC3, 0x89, 0x20, var_2, page_offsets[non_displayed_page]);
   ;	
	mov	al,byte ptr DGROUP:_non_displayed_page
	mov	ah,0
	add	ax,ax
	mov	bx,ax
	push	word ptr DGROUP:_page_offsets[bx]
	push	word ptr [bp-2]
	push	32
	push	137
	push	195
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@draw_span$qiiuciui
	add	sp,14
   ;	
   ;	    display->draw_span(0xC3, 0x8A, 0x23, var_2, page_offsets[non_displayed_page]);
   ;	
	mov	al,byte ptr DGROUP:_non_displayed_page
	mov	ah,0
	add	ax,ax
	mov	bx,ax
	push	word ptr DGROUP:_page_offsets[bx]
	push	word ptr [bp-2]
	push	35
	push	138
	push	195
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@draw_span$qiiuciui
	add	sp,14
   ;	
   ;	    display->draw_span(0xC3, 0x8B, 0x26, var_2, page_offsets[non_displayed_page]);
   ;	
	mov	al,byte ptr DGROUP:_non_displayed_page
	mov	ah,0
	add	ax,ax
	mov	bx,ax
	push	word ptr DGROUP:_page_offsets[bx]
	push	word ptr [bp-2]
	push	38
	push	139
	push	195
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@draw_span$qiiuciui
	add	sp,14
@26@21:
   ;	
   ;	}
   ;	
	leave	
	ret	
@update_boss_guage$qv	endp
	assume	cs:GAME_TEXT,ds:DGROUP
@update_air_guage$qiii	proc	far
   ;	
   ;	void update_air_guage(int arg_0, int arg_2, int arg_4)
   ;	
	enter	2,0
   ;	
   ;	{
   ;	    byte var_1, var_2;
   ;	
   ;	    display->fill_rect(arg_2, arg_4, arg_2, arg_4 + 5, 0, -1, 0);
   ;	
	push	0
	push	-1
	push	0
	mov	ax,word ptr [bp+10]
	add	ax,5
	push	ax
	push	word ptr [bp+8]
	push	word ptr [bp+10]
	push	word ptr [bp+8]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@fill_rect$qiiiiiiuc
	add	sp,18
   ;	
   ;	    if (air_supply + arg_0 < 0)
   ;	
	mov	ax,word ptr DGROUP:_air_supply
	add	ax,word ptr [bp+6]
	jge	short @27@5
   ;	
   ;	    {
   ;	        if (air_supply + arg_0 >= 0)
   ;	
	mov	ax,word ptr DGROUP:_air_supply
	add	ax,word ptr [bp+6]
	jl	short @27@4
   ;	
   ;	            air_supply += arg_0;
   ;	
	mov	ax,word ptr [bp+6]
	add	word ptr DGROUP:_air_supply,ax
	jmp	short @27@5
@27@4:
   ;	
   ;	        else
   ;	            air_supply = 0;
   ;	
	mov	word ptr DGROUP:_air_supply,0
@27@5:
   ;	
   ;	    }
   ;	    var_1 = air_supply < 0x32 ? 0x20 : 0x60;
   ;	
	cmp	word ptr DGROUP:_air_supply,50
	jge	short @27@7
	mov	al,32
	jmp	short @27@8
@27@7:
	mov	al,96
@27@8:
	mov	byte ptr [bp-1],al
   ;	
   ;	    if (air_supply >= 2)
   ;	
	cmp	word ptr DGROUP:_air_supply,2
	jl	@27@10
   ;	
   ;	    {
   ;	        var_2 = var_1 + 8;
   ;	
	mov	al,byte ptr [bp-1]
	add	al,8
	mov	byte ptr [bp-2],al
   ;	
   ;	        display->draw_span(arg_2 + 1, arg_4,     var_2, air_supply - 2, 0);
   ;	
	push	0
	mov	ax,word ptr DGROUP:_air_supply
	add	ax,-2
	push	ax
	mov	al,byte ptr [bp-2]
	push	ax
	push	word ptr [bp+10]
	mov	ax,word ptr [bp+8]
	inc	ax
	push	ax
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@draw_span$qiiuciui
	add	sp,14
   ;	
   ;	        display->draw_span(arg_2 + 1, arg_4 + 4, var_2, air_supply - 2, 0);
   ;	
	push	0
	mov	ax,word ptr DGROUP:_air_supply
	add	ax,-2
	push	ax
	mov	al,byte ptr [bp-2]
	push	ax
	mov	ax,word ptr [bp+10]
	add	ax,4
	push	ax
	mov	ax,word ptr [bp+8]
	inc	ax
	push	ax
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@draw_span$qiiuciui
	add	sp,14
   ;	
   ;	        var_2 = var_1 + 4;
   ;	
	mov	al,byte ptr [bp-1]
	add	al,4
	mov	byte ptr [bp-2],al
   ;	
   ;	        display->draw_span(arg_2, arg_4 + 1, var_2, air_supply, 0);
   ;	
	push	0
	push	word ptr DGROUP:_air_supply
	mov	al,byte ptr [bp-2]
	push	ax
	mov	ax,word ptr [bp+10]
	inc	ax
	push	ax
	push	word ptr [bp+8]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@draw_span$qiiuciui
	add	sp,14
   ;	
   ;	        display->draw_span(arg_2, arg_4 + 3, var_2, air_supply, 0);
   ;	
	push	0
	push	word ptr DGROUP:_air_supply
	mov	al,byte ptr [bp-2]
	push	ax
	mov	ax,word ptr [bp+10]
	add	ax,3
	push	ax
	push	word ptr [bp+8]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@draw_span$qiiuciui
	add	sp,14
   ;	
   ;	        display->draw_span(arg_2, arg_4 + 2, var_1, air_supply, 0);
   ;	
	push	0
	push	word ptr DGROUP:_air_supply
	mov	al,byte ptr [bp-1]
	push	ax
	mov	ax,word ptr [bp+10]
	add	ax,2
	push	ax
	push	word ptr [bp+8]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@draw_span$qiiuciui
	add	sp,14
@27@10:
   ;	
   ;	    }
   ;	    display->set_pix(arg_2 + 3, arg_4 + 1, 0xF);
   ;	
	push	15
	mov	ax,word ptr [bp+10]
	inc	ax
	push	ax
	mov	ax,word ptr [bp+8]
	add	ax,3
	push	ax
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@set_pix$qiiuc
	add	sp,10
   ;	
   ;	    display->copy_bits(0x68, 0xA7, 0xFE, 0xAC, 0x68, 0xA7,
   ;	
   ;	
   ;	                       page_offsets[0], page_offsets[1], 0x140, 0x140);
   ;	
	push	320
	push	320
	push	word ptr DGROUP:_page_offsets+2
	push	word ptr DGROUP:_page_offsets
	push	167
	push	104
	push	172
	push	254
	push	167
	push	104
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@copy_bits$qiiiiiiuiuiuiui
	add	sp,24
   ;	
   ;	}
   ;	
	leave	
	ret	
@update_air_guage$qiii	endp
	assume	cs:GAME_TEXT,ds:DGROUP
@update_shld_guage$qiii	proc	far
   ;	
   ;	void update_shld_guage(int arg_0, int arg_2, int arg_4)
   ;	
	enter	2,0
   ;	
   ;	{
   ;	    byte var_1, var_2;
   ;	
   ;	    display->fill_rect(arg_2, arg_4, arg_2, arg_4 + 5, 0, -1, 0);
   ;	
	push	0
	push	-1
	push	0
	mov	ax,word ptr [bp+10]
	add	ax,5
	push	ax
	push	word ptr [bp+8]
	push	word ptr [bp+10]
	push	word ptr [bp+8]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@fill_rect$qiiiiiiuc
	add	sp,18
   ;	
   ;	    if (shld_supply + arg_0 < 0)
   ;	
	mov	ax,word ptr DGROUP:_shld_supply
	add	ax,word ptr [bp+6]
	jge	short @28@5
   ;	
   ;	    {
   ;	        if (shld_supply + arg_0 >= 0)
   ;	
	mov	ax,word ptr DGROUP:_shld_supply
	add	ax,word ptr [bp+6]
	jl	short @28@4
   ;	
   ;	            shld_supply += arg_0;
   ;	
	mov	ax,word ptr [bp+6]
	add	word ptr DGROUP:_shld_supply,ax
	jmp	short @28@5
@28@4:
   ;	
   ;	        else
   ;	            shld_supply = 0;
   ;	
	mov	word ptr DGROUP:_shld_supply,0
@28@5:
   ;	
   ;	    }
   ;	    var_1 = shld_supply < 0x32 ? 0x20 : 0x91;
   ;	
	cmp	word ptr DGROUP:_shld_supply,50
	jge	short @28@7
	mov	al,32
	jmp	short @28@8
@28@7:
	mov	al,145
@28@8:
	mov	byte ptr [bp-1],al
   ;	
   ;	    if (shld_supply >= 2)
   ;	
	cmp	word ptr DGROUP:_shld_supply,2
	jl	@28@10
   ;	
   ;	    {
   ;	        var_2 = var_1 + 8;
   ;	
	mov	al,byte ptr [bp-1]
	add	al,8
	mov	byte ptr [bp-2],al
   ;	
   ;	        display->draw_span(arg_2 + 1, arg_4,     var_2, shld_supply - 2, 0);
   ;	
	push	0
	mov	ax,word ptr DGROUP:_shld_supply
	add	ax,-2
	push	ax
	mov	al,byte ptr [bp-2]
	push	ax
	push	word ptr [bp+10]
	mov	ax,word ptr [bp+8]
	inc	ax
	push	ax
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@draw_span$qiiuciui
	add	sp,14
   ;	
   ;	        display->draw_span(arg_2 + 1, arg_4 + 4, var_2, shld_supply - 2, 0);
   ;	
	push	0
	mov	ax,word ptr DGROUP:_shld_supply
	add	ax,-2
	push	ax
	mov	al,byte ptr [bp-2]
	push	ax
	mov	ax,word ptr [bp+10]
	add	ax,4
	push	ax
	mov	ax,word ptr [bp+8]
	inc	ax
	push	ax
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@draw_span$qiiuciui
	add	sp,14
   ;	
   ;	        var_2 = var_1 + 4;
   ;	
	mov	al,byte ptr [bp-1]
	add	al,4
	mov	byte ptr [bp-2],al
   ;	
   ;	        display->draw_span(arg_2, arg_4 + 1, var_2, shld_supply, 0);
   ;	
	push	0
	push	word ptr DGROUP:_shld_supply
	mov	al,byte ptr [bp-2]
	push	ax
	mov	ax,word ptr [bp+10]
	inc	ax
	push	ax
	push	word ptr [bp+8]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@draw_span$qiiuciui
	add	sp,14
   ;	
   ;	        display->draw_span(arg_2, arg_4 + 3, var_2, shld_supply, 0);
   ;	
	push	0
	push	word ptr DGROUP:_shld_supply
	mov	al,byte ptr [bp-2]
	push	ax
	mov	ax,word ptr [bp+10]
	add	ax,3
	push	ax
	push	word ptr [bp+8]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@draw_span$qiiuciui
	add	sp,14
   ;	
   ;	        display->draw_span(arg_2, arg_4 + 2, var_1, shld_supply, 0);
   ;	
	push	0
	push	word ptr DGROUP:_shld_supply
	mov	al,byte ptr [bp-1]
	push	ax
	mov	ax,word ptr [bp+10]
	add	ax,2
	push	ax
	push	word ptr [bp+8]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@draw_span$qiiuciui
	add	sp,14
@28@10:
   ;	
   ;	    }
   ;	    display->set_pix(arg_2 + 3, arg_4 + 1, 0xF);
   ;	
	push	15
	mov	ax,word ptr [bp+10]
	inc	ax
	push	ax
	mov	ax,word ptr [bp+8]
	add	ax,3
	push	ax
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@set_pix$qiiuc
	add	sp,10
   ;	
   ;	    display->copy_bits(0x68, 0xB3, 0xFE, 0xB8, 0x68, 0xB3,
   ;	
   ;	
   ;	                       page_offsets[0], page_offsets[1], 0x140, 0x140);
   ;	
	push	320
	push	320
	push	word ptr DGROUP:_page_offsets+2
	push	word ptr DGROUP:_page_offsets
	push	179
	push	104
	push	184
	push	254
	push	179
	push	104
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@copy_bits$qiiiiiiuiuiuiui
	add	sp,24
   ;	
   ;	}
   ;	
	leave	
	ret	
@update_shld_guage$qiii	endp
	assume	cs:GAME_TEXT,ds:DGROUP
@update_jason_guage$qv	proc	far
   ;	
   ;	void update_jason_guage(void)
   ;	
	enter	10,0
   ;	
   ;	{
   ;	    int var_2, var_4, var_6, var_8, var_A;
   ;	
   ;	    display->put_bits(0x0C, 0xA7, 0x2C, 0xAD, (uchar far *)jguage_underbits, 0, 0);
   ;	
	push	0
	push	0
	push	word ptr DGROUP:_jguage_underbits+2
	push	word ptr DGROUP:_jguage_underbits
	push	173
	push	44
	push	167
	push	12
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@put_bits$qiiiinucuiui
	add	sp,20
   ;	
   ;	    var_2 = jason_power / 3 - 1;
   ;	
	mov	al,byte ptr DGROUP:_jason_power
	mov	ah,0
	mov	bx,3
	cwd	
	idiv	bx
	dec	ax
	mov	word ptr [bp-2],ax
   ;	
   ;	    if (jason_present != 0)
   ;	
	cmp	byte ptr DGROUP:_jason_present,0
	je	@29@10
   ;	
   ;	    {
   ;	        if (var_2 > 1)
   ;	
	cmp	word ptr [bp-2],1
	jle	@29@10
   ;	
   ;	        {
   ;	            var_2 = jason_power / 3 - 1;
   ;	
	mov	al,byte ptr DGROUP:_jason_power
	mov	ah,0
	mov	bx,3
	cwd	
	idiv	bx
	dec	ax
	mov	word ptr [bp-2],ax
   ;	
   ;	            if (var_2 > 8) var_4 = 0x64; else var_4 = 0x23;
   ;	
	cmp	word ptr [bp-2],8
	jle	short @29@5
	mov	word ptr [bp-4],100
	jmp	short @29@6
@29@5:
	mov	word ptr [bp-4],35
@29@6:
   ;	
   ;	            var_6 = var_4 - 3;
   ;	
	mov	ax,word ptr [bp-4]
	add	ax,-3
	mov	word ptr [bp-6],ax
   ;	
   ;	            var_8 = var_4 + 3;
   ;	
	mov	ax,word ptr [bp-4]
	add	ax,3
	mov	word ptr [bp-8],ax
   ;	
   ;	            display->fill_rect(0x0C, 0xA7, var_2 + 0xC, 0xAC, var_4, -1, 0);
   ;	
	push	0
	push	-1
	push	word ptr [bp-4]
	push	172
	mov	ax,word ptr [bp-2]
	add	ax,12
	push	ax
	push	167
	push	12
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@fill_rect$qiiiiiiuc
	add	sp,18
   ;	
   ;	            display->draw_span(0x0C, 0xA7, (uchar)var_6, var_2, 0);
   ;	
	push	0
	push	word ptr [bp-2]
	mov	al,byte ptr [bp-6]
	push	ax
	push	167
	push	12
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@draw_span$qiiuciui
	add	sp,14
   ;	
   ;	            display->draw_span(0x0C, 0xAC, (uchar)var_8, var_2, 0);
   ;	
	push	0
	push	word ptr [bp-2]
	mov	al,byte ptr [bp-8]
	push	ax
	push	172
	push	12
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@draw_span$qiiuciui
	add	sp,14
   ;	
   ;	            for (var_A = 0; var_A < 6; var_A++)
   ;	
	mov	word ptr [bp-10],0
	jmp	short @29@9
@29@7:
   ;	
   ;	            {
   ;	                display->set_pix(0x0C, var_A + 0xA7, (uchar)var_6);
   ;	
	mov	al,byte ptr [bp-6]
	push	ax
	mov	ax,word ptr [bp-10]
	add	ax,167
	push	ax
	push	12
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@set_pix$qiiuc
	add	sp,10
   ;	
   ;	                display->set_pix(var_2 + 0xB, var_A + 0xA7, (uchar)var_8);
   ;	
	mov	al,byte ptr [bp-8]
	push	ax
	mov	ax,word ptr [bp-10]
	add	ax,167
	push	ax
	mov	ax,word ptr [bp-2]
	add	ax,11
	push	ax
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@set_pix$qiiuc
	add	sp,10
   ;	
   ;	                display->set_pix(var_2 + 0xC, var_A + 0xA7, 0x1D);
   ;	
	push	29
	mov	ax,word ptr [bp-10]
	add	ax,167
	push	ax
	mov	ax,word ptr [bp-2]
	add	ax,12
	push	ax
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@set_pix$qiiuc
	add	sp,10
	inc	word ptr [bp-10]
@29@9:
	cmp	word ptr [bp-10],6
	jl	short @29@7
@29@10:
   ;	
   ;	            }
   ;	        }
   ;	    }
   ;	    display->copy_bits(0x0C, 0xA7, 0x2C, 0xAD, 0x0C, 0xA7,
   ;	
   ;	
   ;	                       page_offsets[0], page_offsets[1], 0x140, 0x140);
   ;	
	push	320
	push	320
	push	word ptr DGROUP:_page_offsets+2
	push	word ptr DGROUP:_page_offsets
	push	167
	push	12
	push	173
	push	44
	push	167
	push	12
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@copy_bits$qiiiiiiuiuiuiui
	add	sp,24
   ;	
   ;	}
   ;	
	leave	
	ret	
@update_jason_guage$qv	endp
	assume	cs:GAME_TEXT,ds:DGROUP
@update_key_guage$qv	proc	far
   ;	
   ;	void update_key_guage(void)
   ;	
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    display->fill_rect(0xEA, 0x95, 0xF4, 0xA1, 0, -1, 0);
   ;	
	push	0
	push	-1
	push	0
	push	161
	push	244
	push	149
	push	234
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@fill_rect$qiiiiiiuc
	add	sp,18
   ;	
   ;	    if (got_key != 0)
   ;	
	cmp	byte ptr DGROUP:_got_key,0
	je	short @30@3
   ;	
   ;	        show_loop((uchar far *)"key.l", 0xEA, 0x95, 0, 0);
   ;	
	push	0
	push	0
	push	149
	push	234
	push	ds
	push	offset DGROUP:s@+2839
	call	far ptr @show_loop$qnuciiucui
	add	sp,12
@30@3:
   ;	
   ;	    display->copy_bits(0xEA, 0x95, 0xF4, 0xA1, 0xEA, 0x95,
   ;	
   ;	
   ;	                       page_offsets[0], page_offsets[1], 0x140, 0x140);
   ;	
	push	320
	push	320
	push	word ptr DGROUP:_page_offsets+2
	push	word ptr DGROUP:_page_offsets
	push	149
	push	234
	push	161
	push	244
	push	149
	push	234
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@copy_bits$qiiiiiiuiuiuiui
	add	sp,24
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@update_key_guage$qv	endp
	assume	cs:GAME_TEXT,ds:DGROUP
@update_gun$qv	proc	far
   ;	
   ;	void update_gun(void)
   ;	
	enter	14,0
   ;	
   ;	{
   ;	    uchar far *s2;
   ;	    loop_ent far *var_E;
   ;	    int var_6, var_4, var_2;
   ;	
   ;	    display->field_07 = 1;
   ;	
	les	bx,dword ptr DGROUP:_display
	mov	byte ptr es:[bx+7],1
   ;	
   ;	    for (var_6 = 0; var_6 < gun_count; var_6++)
   ;	
	mov	word ptr [bp-10],0
	jmp	@31@13
@31@2:
   ;	
   ;	    {
   ;	        var_2 = gun_pieces_xy[var_6 * 2];
   ;	
	mov	bx,word ptr [bp-10]
	add	bx,bx
	mov	al,byte ptr DGROUP:_gun_pieces_xy[bx]
	mov	ah,0
	mov	word ptr [bp-14],ax
   ;	
   ;	        var_4 = gun_pieces_xy[var_6 * 2 + 1];
   ;	
	mov	bx,word ptr [bp-10]
	add	bx,bx
	mov	al,byte ptr DGROUP:_gun_pieces_xy[bx+1]
	mov	ah,0
	mov	word ptr [bp-12],ax
   ;	
   ;	        switch (var_6)
   ;	
	mov	bx,word ptr [bp-10]
	cmp	bx,3
	ja	short @31@10
	add	bx,bx
	jmp	word ptr cs:@31@C40[bx]
@31@6:
   ;	
   ;	        {
   ;	            case 0: s2 = (uchar far *)"gun_1.l"; break;
   ;	
	mov	word ptr [bp-2],ds
	mov	word ptr [bp-4],offset DGROUP:s@+2845
	jmp	short @31@11
@31@7:
   ;	
   ;	            case 1: s2 = (uchar far *)"gun_2.l"; break;
   ;	
	mov	word ptr [bp-2],ds
	mov	word ptr [bp-4],offset DGROUP:s@+2853
	jmp	short @31@11
@31@8:
   ;	
   ;	            case 2: s2 = (uchar far *)"gun_3.l"; break;
   ;	
	mov	word ptr [bp-2],ds
	mov	word ptr [bp-4],offset DGROUP:s@+2861
	jmp	short @31@11
@31@9:
   ;	
   ;	            case 3: s2 = (uchar far *)"gun_4.l"; break;
   ;	
	mov	word ptr [bp-2],ds
	mov	word ptr [bp-4],offset DGROUP:s@+2869
	jmp	short @31@11
@31@10:
   ;	
   ;	            default: terminate((uchar far *)"Error updating gun.", 0); break;
   ;	
	push	large 0
	push	ds
	push	offset DGROUP:s@+2877
	call	far ptr @terminate$qnuct1
	add	sp,8
@31@11:
   ;	
   ;	        }
   ;	        var_E = (loop_ent far *)the_game->get_loop(s2);
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@get_loop$qnuc
	add	sp,8
	mov	word ptr [bp-6],dx
	mov	word ptr [bp-8],ax
   ;	
   ;	        display->put_bits_masked(var_2, var_4,
   ;	
   ;	
   ;	                                 var_2 + var_E->img->field_6,
   ;	                                 var_4 + var_E->img->field_4,
   ;	                                 var_E->img->bitmap, 0, 0, 0);
   ;	
	push	0
	push	0
	push	0
	les	bx,dword ptr [bp-8]
	les	bx,dword ptr es:[bx+6]
	push	word ptr es:[bx+2]
	push	word ptr es:[bx]
	les	bx,dword ptr [bp-8]
	les	bx,dword ptr es:[bx+6]
	mov	ax,word ptr es:[bx+4]
	add	ax,word ptr [bp-12]
	push	ax
	les	bx,dword ptr [bp-8]
	les	bx,dword ptr es:[bx+6]
	mov	ax,word ptr es:[bx+6]
	add	ax,word ptr [bp-14]
	push	ax
	push	word ptr [bp-12]
	push	word ptr [bp-14]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@put_bits_masked$qve
	add	sp,22
   ;	
   ;	        display->copy_bits(var_2, var_4,
   ;	
   ;	
   ;	                           var_2 + var_E->img->field_6,
   ;	                           var_4 + var_E->img->field_4,
   ;	                           var_2, var_4,
   ;	                           page_offsets[0], page_offsets[1], 0x140, 0x140);
   ;	
	push	320
	push	320
	push	word ptr DGROUP:_page_offsets+2
	push	word ptr DGROUP:_page_offsets
	push	word ptr [bp-12]
	push	word ptr [bp-14]
	les	bx,dword ptr [bp-8]
	les	bx,dword ptr es:[bx+6]
	mov	ax,word ptr es:[bx+4]
	add	ax,word ptr [bp-12]
	push	ax
	les	bx,dword ptr [bp-8]
	les	bx,dword ptr es:[bx+6]
	mov	ax,word ptr es:[bx+6]
	add	ax,word ptr [bp-14]
	push	ax
	push	word ptr [bp-12]
	push	word ptr [bp-14]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@copy_bits$qiiiiiiuiuiuiui
	add	sp,24
	inc	word ptr [bp-10]
@31@13:
	mov	al,byte ptr DGROUP:_gun_count
	mov	ah,0
	cmp	ax,word ptr [bp-10]
	jg	@31@2
   ;	
   ;	    }
   ;	    display->field_07 = 0;
   ;	
	les	bx,dword ptr DGROUP:_display
	mov	byte ptr es:[bx+7],0
   ;	
   ;	}
   ;	
	leave	
	ret	
@update_gun$qv	endp
@31@C40	label	word
	dw	@31@6
	dw	@31@7
	dw	@31@8
	dw	@31@9
	assume	cs:GAME_TEXT,ds:DGROUP
@check_guages$qv	proc	far
   ;	
   ;	void check_guages(void)
   ;	
	enter	4,0
   ;	
   ;	{
   ;	    uint var_2, var_4;
   ;	
   ;	    if (air_count++ == air_speed)
   ;	
	mov	al,byte ptr DGROUP:_air_count
	inc	byte ptr DGROUP:_air_count
	cmp	al,byte ptr DGROUP:_air_speed
	jne	@32@14
   ;	
   ;	    {
   ;	        update_air_guage(-3, 0x68, 0xA7);
   ;	
	push	167
	push	104
	push	-3
	push	cs
	call	near ptr @update_air_guage$qiii
	add	sp,6
   ;	
   ;	        air_count = 0;
   ;	
	mov	byte ptr DGROUP:_air_count,0
   ;	
   ;	        if (air_supply < 40)
   ;	
	cmp	word ptr DGROUP:_air_supply,40
	jge	short @32@5
   ;	
   ;	        {
   ;	            if (!the_game->field_0A)
   ;	
	les	bx,dword ptr DGROUP:_the_game
	cmp	byte ptr es:[bx+10],0
	jne	short @32@8
   ;	
   ;	            {
   ;	                the_game->field_0A++;
   ;	
	les	bx,dword ptr DGROUP:_the_game
	inc	byte ptr es:[bx+10]
   ;	
   ;	                the_game->play_sound((uchar far *)"ping", 0xF);
   ;	
	push	15
	push	ds
	push	offset DGROUP:s@+2897
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_sound$qnucuc
	add	sp,10
   ;	
   ;	                post_message(5);
   ;	
	push	5
	push	cs
	call	near ptr @post_message$quc
	pop	cx
	jmp	short @32@8
@32@5:
   ;	
   ;	            }
   ;	        }
   ;	        else if (the_game->field_0A != 0 && air_supply > 40)
   ;	
	les	bx,dword ptr DGROUP:_the_game
	cmp	byte ptr es:[bx+10],0
	je	short @32@8
	cmp	word ptr DGROUP:_air_supply,40
	jle	short @32@8
   ;	
   ;	            the_game->field_0A = 0;
   ;	
	les	bx,dword ptr DGROUP:_the_game
	mov	byte ptr es:[bx+10],0
@32@8:
   ;	
   ;	
   ;	        if (shld_supply < 40)
   ;	
	cmp	word ptr DGROUP:_shld_supply,40
	jge	short @32@11
   ;	
   ;	        {
   ;	            if (!the_game->field_0B)
   ;	
	les	bx,dword ptr DGROUP:_the_game
	cmp	byte ptr es:[bx+11],0
	jne	short @32@14
   ;	
   ;	            {
   ;	                the_game->field_0B++;
   ;	
	les	bx,dword ptr DGROUP:_the_game
	inc	byte ptr es:[bx+11]
   ;	
   ;	                the_game->play_sound((uchar far *)"ping", 0xF);
   ;	
	push	15
	push	ds
	push	offset DGROUP:s@+2902
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_sound$qnucuc
	add	sp,10
   ;	
   ;	                post_message(9);
   ;	
	push	9
	push	cs
	call	near ptr @post_message$quc
	pop	cx
	jmp	short @32@14
@32@11:
   ;	
   ;	            }
   ;	        }
   ;	        else if (the_game->field_0B != 0 && shld_supply > 40)
   ;	
	les	bx,dword ptr DGROUP:_the_game
	cmp	byte ptr es:[bx+11],0
	je	short @32@14
	cmp	word ptr DGROUP:_shld_supply,40
	jle	short @32@14
   ;	
   ;	            the_game->field_0B = 0;
   ;	
	les	bx,dword ptr DGROUP:_the_game
	mov	byte ptr es:[bx+11],0
@32@14:
   ;	
   ;	    }
   ;	
   ;	    if (ego->state == 2)
   ;	
	les	bx,dword ptr DGROUP:_ego
	cmp	byte ptr es:[bx+61],2
	je	short @32@18
   ;	
   ;	        kill_ego(0, 0);
   ;	    else if (air_supply == 0 || shld_supply == 0)
   ;	
	cmp	word ptr DGROUP:_air_supply,0
	je	short @32@17
	cmp	word ptr DGROUP:_shld_supply,0
	jne	short @32@19
@32@17:
   ;	
   ;	    {
   ;	        death_type = 0;
   ;	
	mov	byte ptr DGROUP:_death_type,0
   ;	
   ;	        kill_ego(0, 0);
   ;	
@32@18:
	push	0
	push	0
	push	cs
	call	near ptr @kill_ego$qii
	add	sp,4
@32@19:
   ;	
   ;	    }
   ;	
   ;	    if (jason_present == 0)
   ;	
	cmp	byte ptr DGROUP:_jason_present,0
	je	@32@34
   ;	
   ;	        return;
   ;	
   ;	    if (jason_count++ == 0x14)
   ;	
	mov	al,byte ptr DGROUP:_jason_count
	inc	byte ptr DGROUP:_jason_count
	cmp	al,20
	jne	@32@34
   ;	
   ;	    {
   ;	        jason_count = 0;
   ;	
	mov	byte ptr DGROUP:_jason_count,0
   ;	
   ;	        update_jason_guage();
   ;	
	push	cs
	call	near ptr @update_jason_guage$qv
   ;	
   ;	        var_2 = abs(ego->center_x - jason->center_x);
   ;	
	les	bx,dword ptr DGROUP:_ego
	mov	ax,word ptr es:[bx+8]
	les	bx,dword ptr DGROUP:_jason
	sub	ax,word ptr es:[bx+8]
	push	ax
	call	far ptr @abs$qi
	pop	cx
	mov	word ptr [bp-2],ax
   ;	
   ;	        var_4 = abs(ego->center_y - jason->center_y);
   ;	
	les	bx,dword ptr DGROUP:_ego
	mov	ax,word ptr es:[bx+10]
	les	bx,dword ptr DGROUP:_jason
	sub	ax,word ptr es:[bx+10]
	push	ax
	call	far ptr @abs$qi
	pop	cx
	mov	word ptr [bp-4],ax
   ;	
   ;	        if (var_2 > 0x1E) goto drain;
   ;	
	cmp	word ptr [bp-2],30
	ja	short @32@23
   ;	
   ;	        if (var_4 <= 0x0A) goto recharge;
   ;	
	cmp	word ptr [bp-4],10
	jbe	short @32@31
@32@23:
   ;	
   ;	drain:
   ;	        if (jason_power < 40)
   ;	
	cmp	byte ptr DGROUP:_jason_power,40
	jae	short @32@26
   ;	
   ;	        {
   ;	            if (!the_game->field_0C)
   ;	
	les	bx,dword ptr DGROUP:_the_game
	cmp	byte ptr es:[bx+12],0
	jne	short @32@28
   ;	
   ;	            {
   ;	                the_game->field_0C++;
   ;	
	les	bx,dword ptr DGROUP:_the_game
	inc	byte ptr es:[bx+12]
   ;	
   ;	                the_game->play_sound((uchar far *)"ping", 0xF);
   ;	
	push	15
	push	ds
	push	offset DGROUP:s@+2907
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_sound$qnucuc
	add	sp,10
   ;	
   ;	                post_message(8);
   ;	
	push	8
	push	cs
	call	near ptr @post_message$quc
	pop	cx
	jmp	short @32@28
@32@26:
   ;	
   ;	            }
   ;	        }
   ;	        else if (the_game->field_0C != 0)
   ;	
	les	bx,dword ptr DGROUP:_the_game
	cmp	byte ptr es:[bx+12],0
	je	short @32@28
   ;	
   ;	            the_game->field_0C = 0;
   ;	
	les	bx,dword ptr DGROUP:_the_game
	mov	byte ptr es:[bx+12],0
@32@28:
   ;	
   ;	        if (jason_power != 0)
   ;	
	cmp	byte ptr DGROUP:_jason_power,0
	je	short @32@30
   ;	
   ;	            jason_power -= 2;
   ;	
	mov	al,byte ptr DGROUP:_jason_power
	add	al,254
	mov	byte ptr DGROUP:_jason_power,al
	leave	
	ret	
@32@30:
   ;	
   ;	        else
   ;	            kill_jason();
   ;	
	push	cs
	call	near ptr @kill_jason$qv
	leave	
	ret	
@32@31:
   ;	
   ;	        goto end;
   ;	recharge:
   ;	        if (var_2 <= 0x1E && var_4 <= 0x0A)
   ;	
	cmp	word ptr [bp-2],30
	ja	short @32@34
	cmp	word ptr [bp-4],10
	ja	short @32@34
   ;	
   ;	            jason_power = maximum_jason_power;
   ;	
	mov	al,byte ptr DGROUP:_maximum_jason_power
	mov	byte ptr DGROUP:_jason_power,al
@32@34:
   ;	
   ;	end:
   ;	        ;
   ;	    }
   ;	}
   ;	
	leave	
	ret	
@check_guages$qv	endp
	assume	cs:GAME_TEXT,ds:DGROUP
@update_men$qv	proc	far
   ;	
   ;	void update_men(void)
   ;	
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    display->fill_rect(0x127, 0xA6, 0x138, 0xAF, 0, -1, 0);
   ;	
	push	0
	push	-1
	push	0
	push	175
	push	312
	push	166
	push	295
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@fill_rect$qiiiiiiuc
	add	sp,18
   ;	
   ;	    vga_text(0x128, 0xA8, (uchar far *)ltoa(men, (char far *)_tmp, 0xA), 0x68, 3);
   ;	
	push	3
	push	104
	push	10
	push	ds
	push	offset DGROUP:__tmp
	movzx	eax,byte ptr DGROUP:_men
	push	eax
	call	far ptr _ltoa
	add	sp,10
	push	dx
	push	ax
	push	168
	push	296
	call	far ptr @vga_text$qiinucucuc
	add	sp,12
   ;	
   ;	    display->copy_bits(0x128, 0xA7, 0x138, 0xAF, 0x128, 0xA7,
   ;	
   ;	
   ;	                       page_offsets[0], page_offsets[1], 0x140, 0x140);
   ;	
	push	320
	push	320
	push	word ptr DGROUP:_page_offsets+2
	push	word ptr DGROUP:_page_offsets
	push	167
	push	296
	push	175
	push	312
	push	167
	push	296
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@copy_bits$qiiiiiiuiuiuiui
	add	sp,24
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@update_men$qv	endp
	assume	cs:GAME_TEXT,ds:DGROUP
@update_score$qii	proc	far
   ;	
   ;	void update_score(int arg_0, int arg_2)
   ;	
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    display->fill_rect(arg_0 - 1, arg_2 - 1, arg_0 + 0x30, arg_2 + 8, 0, -1, 0);
   ;	
	push	0
	push	-1
	push	0
	mov	ax,word ptr [bp+8]
	add	ax,8
	push	ax
	mov	ax,word ptr [bp+6]
	add	ax,48
	push	ax
	mov	ax,word ptr [bp+8]
	dec	ax
	push	ax
	mov	ax,word ptr [bp+6]
	dec	ax
	push	ax
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@fill_rect$qiiiiiiuc
	add	sp,18
   ;	
   ;	    strcpy((char *)_tmp, ltoa(score, _tmp2, 0xA));
   ;	
	push	10
	push	ds
	push	offset DGROUP:__tmp2
	push	dword ptr DGROUP:_score
	call	far ptr _ltoa
	add	sp,10
	push	dx
	push	ax
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _strcpy
	add	sp,8
   ;	
   ;	    vga_text(arg_0 + (0x30 - strlen((char *)_tmp) * 8), arg_2, _tmp, 0x68, 3);
   ;	
	push	3
	push	104
	push	ds
	push	offset DGROUP:__tmp
	push	word ptr [bp+8]
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _strlen
	add	sp,4
	shl	ax,3
	mov	dx,48
	sub	dx,ax
	add	dx,word ptr [bp+6]
	push	dx
	call	far ptr @vga_text$qiinucucuc
	add	sp,12
   ;	
   ;	    display->copy_bits(arg_0, arg_2, arg_0 + 0x31, arg_2 + 8, arg_0, arg_2,
   ;	
   ;	
   ;	                       page_offsets[0], page_offsets[non_displayed_page != displayed_page], 0x140, 0x140);
   ;	
	push	320
	push	320
	mov	al,byte ptr DGROUP:_non_displayed_page
	cmp	al,byte ptr DGROUP:_displayed_page
	je	short @34@3
	mov	ax,1
	jmp	short @34@4
@34@3:
	xor	ax,ax
@34@4:
	add	ax,ax
	mov	bx,ax
	push	word ptr DGROUP:_page_offsets[bx]
	push	word ptr DGROUP:_page_offsets
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	mov	ax,word ptr [bp+8]
	add	ax,8
	push	ax
	mov	ax,word ptr [bp+6]
	add	ax,49
	push	ax
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@copy_bits$qiiiiiiuiuiuiui
	add	sp,24
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@update_score$qii	endp
	assume	cs:GAME_TEXT,ds:DGROUP
@get_map_coords$quinit2	proc	far
   ;	
   ;	void get_map_coords(uint arg_0, int far *arg_2, int far *arg_6)
   ;	
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    *arg_2 = (arg_0 % the_map->map_width) << 3;
   ;	
	les	bx,dword ptr DGROUP:_the_map
	mov	ax,word ptr [bp+6]
	xor	dx,dx
	div	word ptr es:[bx+142]
	shl	dx,3
	les	bx,dword ptr [bp+8]
	mov	word ptr es:[bx],dx
   ;	
   ;	    *arg_6 = (arg_0 / the_map->map_width) << 3;
   ;	
	les	bx,dword ptr DGROUP:_the_map
	mov	ax,word ptr [bp+6]
	xor	dx,dx
	div	word ptr es:[bx+142]
	shl	ax,3
	les	bx,dword ptr [bp+12]
	mov	word ptr es:[bx],ax
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@get_map_coords$quinit2	endp
	assume	cs:GAME_TEXT,ds:DGROUP
@load_resources$qv	proc	far
   ;	
   ;	void load_resources(void)
   ;	
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    the_game->load_loop((uchar far *)"bubsm.l");
   ;	
	push	ds
	push	offset DGROUP:s@+2912
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"bubmd.l");
   ;	
	push	ds
	push	offset DGROUP:s@+2920
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"subr.l");
   ;	
	push	ds
	push	offset DGROUP:s@+2928
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"subl.l");
   ;	
	push	ds
	push	offset DGROUP:s@+2935
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"turn.l");
   ;	
	push	ds
	push	offset DGROUP:s@+2942
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"msl_str.l");
   ;	
	push	ds
	push	offset DGROUP:s@+2949
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"msl_sm.l");
   ;	
	push	ds
	push	offset DGROUP:s@+2959
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"msl_tpl.l");
   ;	
	push	ds
	push	offset DGROUP:s@+2968
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"msl_tpr.l");
   ;	
	push	ds
	push	offset DGROUP:s@+2978
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"msl_rkr.l");
   ;	
	push	ds
	push	offset DGROUP:s@+2988
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"msl_rkl.l");
   ;	
	push	ds
	push	offset DGROUP:s@+2998
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"msl_top.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3008
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"msl_pea.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3018
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"msl_spt.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3028
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"msl_red.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3038
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"msl_arwl.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3048
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"msl_arwr.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3059
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"msl_bg2l.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3070
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"msl_bg2r.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3081
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"shpbmb.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3092
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"fireball.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3101
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"explg.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3112
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"expmd.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3120
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"expsm.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3128
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"splat.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3136
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"prober.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3144
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"probel.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3153
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"fish1l.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3162
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"fish1r.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3171
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"fish2l.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3180
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"fish2r.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3189
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"scr_100.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3198
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"scr_500.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3208
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"scr_1000.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3218
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"scr_2000.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3229
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"scr_3000.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3240
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"scr_4000.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3251
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"coin.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3262
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"bonus1.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3269
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"bonus2.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3278
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"tulipl.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3287
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"tulipr.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3296
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"tulip.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3305
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"serp_r.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3313
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"serp_l.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3322
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"msl_bigl.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3331
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"msl_bigr.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3342
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"msl_hbl.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3353
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"msl_hbr.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3363
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"firbalup.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3373
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"firbaldn.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3384
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"pu_air.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3395
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"pu_fire.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3404
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"pu_shld.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3414
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"pu_jwl1.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3424
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"pu_1up.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3434
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"pu_auto.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3443
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"pu_key.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3453
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"pu_top.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3462
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"pu_jason.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3471
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"pu_jf.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3482
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"gem.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3490
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"spikes_u.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3496
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"spikes_d.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3507
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"shutl_l.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3518
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"shutl_r.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3528
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"mreal.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3538
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"freemine.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3546
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"tent_out.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3557
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"tent_in.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3568
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"mine.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3578
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"barrel1.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3585
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"barrel2.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3595
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"barrel3.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3605
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"pod1.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3615
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"pod2.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3622
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"piranar.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3629
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"piranal.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3639
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"jelly.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3649
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"backsub.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3657
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"end_dr.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3667
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"door_ud.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3676
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"duct_l.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3686
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"duct_r.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3695
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"duct_u.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3704
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"duct_d.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3713
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"block.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3722
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"block2.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3730
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"switch.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3739
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"zap_ud.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3748
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"weed1.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3757
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"chest.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3765
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"face_r.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3773
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"face_l.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3782
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"crab.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3791
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"crabdie.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3798
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"serpdie.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3808
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"probspin.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3818
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"piece_1.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3829
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"piece_2.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3839
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"piece_3.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3849
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"piece_4.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3859
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"gun_1.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3869
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"gun_2.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3877
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"gun_3.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3885
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"gun_4.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3893
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"statue.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3901
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"fire_pit.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3910
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"clam.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3921
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"cannonr.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3928
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"cannonl.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3938
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"shipr.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3948
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"shipl.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3956
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"mouse.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3964
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"key.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3972
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"pat1.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3978
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->define_sound((uchar far *)"fire1", 0);
   ;	
	push	0
	push	ds
	push	offset DGROUP:s@+3985
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@define_sound$qnucuc
	add	sp,10
   ;	
   ;	    the_game->define_sound((uchar far *)"fire2", 0);
   ;	
	push	0
	push	ds
	push	offset DGROUP:s@+3991
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@define_sound$qnucuc
	add	sp,10
   ;	
   ;	    the_game->define_sound((uchar far *)"exp1", 0);
   ;	
	push	0
	push	ds
	push	offset DGROUP:s@+3997
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@define_sound$qnucuc
	add	sp,10
   ;	
   ;	    the_game->define_sound((uchar far *)"exp2", 0);
   ;	
	push	0
	push	ds
	push	offset DGROUP:s@+4002
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@define_sound$qnucuc
	add	sp,10
   ;	
   ;	    the_game->define_sound((uchar far *)"dirhit", 0);
   ;	
	push	0
	push	ds
	push	offset DGROUP:s@+4007
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@define_sound$qnucuc
	add	sp,10
   ;	
   ;	    the_game->define_sound((uchar far *)"bubbles2", 0);
   ;	
	push	0
	push	ds
	push	offset DGROUP:s@+4014
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@define_sound$qnucuc
	add	sp,10
   ;	
   ;	    the_game->define_sound((uchar far *)"pirana", 0);
   ;	
	push	0
	push	ds
	push	offset DGROUP:s@+4023
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@define_sound$qnucuc
	add	sp,10
   ;	
   ;	    the_game->define_sound((uchar far *)"door", 0);
   ;	
	push	0
	push	ds
	push	offset DGROUP:s@+4030
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@define_sound$qnucuc
	add	sp,10
   ;	
   ;	    the_game->define_sound((uchar far *)"drillhi", 0);
   ;	
	push	0
	push	ds
	push	offset DGROUP:s@+4035
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@define_sound$qnucuc
	add	sp,10
   ;	
   ;	    the_game->define_sound((uchar far *)"zap", 0);
   ;	
	push	0
	push	ds
	push	offset DGROUP:s@+4043
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@define_sound$qnucuc
	add	sp,10
   ;	
   ;	    the_game->define_sound((uchar far *)"pup", 0);
   ;	
	push	0
	push	ds
	push	offset DGROUP:s@+4047
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@define_sound$qnucuc
	add	sp,10
   ;	
   ;	    the_game->define_sound((uchar far *)"pup2", 0);
   ;	
	push	0
	push	ds
	push	offset DGROUP:s@+4051
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@define_sound$qnucuc
	add	sp,10
   ;	
   ;	    the_game->define_sound((uchar far *)"faze", 0);
   ;	
	push	0
	push	ds
	push	offset DGROUP:s@+4056
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@define_sound$qnucuc
	add	sp,10
   ;	
   ;	    the_game->define_sound((uchar far *)"tulip", 1);
   ;	
	push	1
	push	ds
	push	offset DGROUP:s@+4061
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@define_sound$qnucuc
	add	sp,10
   ;	
   ;	    the_game->define_sound((uchar far *)"ping", 0);
   ;	
	push	0
	push	ds
	push	offset DGROUP:s@+4067
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@define_sound$qnucuc
	add	sp,10
   ;	
   ;	    the_game->define_sound((uchar far *)"tport", 0);
   ;	
	push	0
	push	ds
	push	offset DGROUP:s@+4072
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@define_sound$qnucuc
	add	sp,10
   ;	
   ;	    the_game->define_sound((uchar far *)"swish", 0);
   ;	
	push	0
	push	ds
	push	offset DGROUP:s@+4078
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@define_sound$qnucuc
	add	sp,10
   ;	
   ;	    the_game->define_sound((uchar far *)"smash", 0);
   ;	
	push	0
	push	ds
	push	offset DGROUP:s@+4084
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@define_sound$qnucuc
	add	sp,10
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@load_resources$qv	endp
	assume	cs:GAME_TEXT,ds:DGROUP
@de_button$qv	proc	far
   ;	
   ;	uchar de_button(void)
   ;	
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    the_game->doit();
   ;	
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@doit$qv
	add	sp,4
   ;	
   ;	    return gr_keys[0x39] | gr_keys[0x1C] | the_game->field_2B;
   ;	
	les	bx,dword ptr DGROUP:_the_game
	mov	al,byte ptr es:[bx+43]
	mov	dl,byte ptr DGROUP:_gr_keys+57
	or	dl,byte ptr DGROUP:_gr_keys+28
	or	al,dl
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@de_button$qv	endp
	assume	cs:GAME_TEXT,ds:DGROUP
@wait_for_user$qv	proc	far
   ;	
   ;	void wait_for_user(void)
   ;	
	push	bp
	mov	bp,sp
	jmp	short @38@3
@38@2:
   ;	
   ;	{
   ;	    while (the_game->field_2B || mouse->field_00 ||
   ;	           gr_keys[0x39] || gr_keys[0x1C])
   ;	        the_game->doit();
   ;	
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@doit$qv
	add	sp,4
@38@3:
	les	bx,dword ptr DGROUP:_the_game
	cmp	byte ptr es:[bx+43],0
	jne	short @38@2
	les	bx,dword ptr DGROUP:_mouse
	cmp	byte ptr es:[bx],0
	jne	short @38@2
	cmp	byte ptr DGROUP:_gr_keys+57,0
	jne	short @38@2
	cmp	byte ptr DGROUP:_gr_keys+28,0
	jne	short @38@2
	jmp	short @38@9
@38@8:
   ;	
   ;	    while (!the_game->field_2B && !mouse->field_00 &&
   ;	           !gr_keys[0x39] && !gr_keys[0x1C])
   ;	        the_game->doit();
   ;	
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@doit$qv
	add	sp,4
@38@9:
	les	bx,dword ptr DGROUP:_the_game
	cmp	byte ptr es:[bx+43],0
	jne	short @38@15
	les	bx,dword ptr DGROUP:_mouse
	cmp	byte ptr es:[bx],0
	jne	short @38@15
	cmp	byte ptr DGROUP:_gr_keys+57,0
	jne	short @38@15
	cmp	byte ptr DGROUP:_gr_keys+28,0
	je	short @38@8
	jmp	short @38@15
@38@14:
   ;	
   ;	    while (the_game->field_2B || mouse->field_00 ||
   ;	           gr_keys[0x39] || gr_keys[0x1C])
   ;	        the_game->doit();
   ;	
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@doit$qv
	add	sp,4
@38@15:
	les	bx,dword ptr DGROUP:_the_game
	cmp	byte ptr es:[bx+43],0
	jne	short @38@14
	les	bx,dword ptr DGROUP:_mouse
	cmp	byte ptr es:[bx],0
	jne	short @38@14
	cmp	byte ptr DGROUP:_gr_keys+57,0
	jne	short @38@14
	cmp	byte ptr DGROUP:_gr_keys+28,0
	jne	short @38@14
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@wait_for_user$qv	endp
	assume	cs:GAME_TEXT,ds:DGROUP
@parse_options$qinnuc	proc	far
   ;	
   ;	void parse_options(int argc, uchar *argv[])
   ;	
	enter	2,0
   ;	
   ;	{
   ;	    int i;
   ;	    debug_mode = 0;
   ;	
	mov	byte ptr DGROUP:_debug_mode,0
   ;	
   ;	    force_pc_sound = 0;
   ;	
	mov	byte ptr DGROUP:_force_pc_sound,0
   ;	
   ;	    zoom_to_map = 0;
   ;	
	mov	byte ptr DGROUP:_zoom_to_map,0
   ;	
   ;	    for (i = 0; i < argc; i++) {
   ;	
	mov	word ptr [bp-2],0
	jmp	@39@9
@39@2:
   ;	
   ;	        if (strcmp((char *)argv[i], "-mandich") == 0)
   ;	
	push	ds
	push	offset DGROUP:s@+4090
	mov	ax,word ptr [bp-2]
	shl	ax,2
	les	bx,dword ptr [bp+8]
	add	bx,ax
	push	word ptr es:[bx+2]
	push	word ptr es:[bx]
	call	far ptr _strcmp
	add	sp,8
	or	ax,ax
	jne	short @39@4
   ;	
   ;	            debug_mode = 1;
   ;	
	mov	byte ptr DGROUP:_debug_mode,1
@39@4:
   ;	
   ;	        if (strcmp((char *)argv[i], "-pcsound") == 0)
   ;	
	push	ds
	push	offset DGROUP:s@+4099
	mov	ax,word ptr [bp-2]
	shl	ax,2
	les	bx,dword ptr [bp+8]
	add	bx,ax
	push	word ptr es:[bx+2]
	push	word ptr es:[bx]
	call	far ptr _strcmp
	add	sp,8
	or	ax,ax
	jne	short @39@6
   ;	
   ;	            force_pc_sound = 1;
   ;	
	mov	byte ptr DGROUP:_force_pc_sound,1
@39@6:
   ;	
   ;	        if (strcmp((char *)argv[i], "-start") == 0)
   ;	
	push	ds
	push	offset DGROUP:s@+4108
	mov	ax,word ptr [bp-2]
	shl	ax,2
	les	bx,dword ptr [bp+8]
	add	bx,ax
	push	word ptr es:[bx+2]
	push	word ptr es:[bx]
	call	far ptr _strcmp
	add	sp,8
	or	ax,ax
	jne	short @39@8
   ;	
   ;	            zoom_to_map = atoi(argv[i + 1]) - 1;
   ;	
	mov	ax,word ptr [bp-2]
	inc	ax
	shl	ax,2
	les	bx,dword ptr [bp+8]
	add	bx,ax
	push	word ptr es:[bx+2]
	push	word ptr es:[bx]
	call	far ptr @atoi$qnxuc
	add	sp,4
	add	al,255
	mov	byte ptr DGROUP:_zoom_to_map,al
@39@8:
	inc	word ptr [bp-2]
@39@9:
	mov	ax,word ptr [bp-2]
	cmp	ax,word ptr [bp+6]
	jl	@39@2
   ;	
   ;	    }
   ;	}
   ;	
	leave	
	ret	
@parse_options$qinnuc	endp
	assume	cs:GAME_TEXT,ds:DGROUP
@random$qi	proc	far
   ;	
   ;	int random(int range)
   ;	
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    return (int)(((long)rand() * range) / 32768);
   ;	
	call	far ptr _rand
	cwde	
	movsx	edx,word ptr [bp+6]
	imul	eax,edx
	mov	ebx,large 08000h
	cdq	
	idiv	ebx
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@random$qi	endp
	assume	cs:GAME_TEXT,ds:DGROUP
@abs$qi	proc	far
   ;	
   ;	int abs(int a)
   ;	
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    return a < 0 ? -a : a;
   ;	
	cmp	word ptr [bp+6],0
	jge	short @41@3
	mov	ax,word ptr [bp+6]
	neg	ax
	jmp	short @41@4
@41@3:
	mov	ax,word ptr [bp+6]
@41@4:
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@abs$qi	endp
	assume	cs:GAME_TEXT,ds:DGROUP
@atoi$qnxuc	proc	far
   ;	
   ;	int atoi(const uchar *s)
   ;	
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    return (int)atol((const char far *)s);
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr _atol
	add	sp,4
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@atoi$qnxuc	endp
GAME_TEXT	ends
GAME_TEXT	segment byte public use16 'CODE'
@$xt$n7tilemap	segment	virtual
@@$xt$n7tilemap	label	dword
	db	4
	db	0
	db	16
	db	32
	db	10
	db	0
	dd	@@$xt$7tilemap
	db	116
	db	105
	db	108
	db	101
	db	109
	db	97
	db	112
	db	32
	db	42
	db	0
@$xt$n7tilemap	ends
GAME_TEXT	ends
GAME_TEXT	segment byte public use16 'CODE'
@$xt$n9game_cast	segment	virtual
@@$xt$n9game_cast	label	dword
	db	4
	db	0
	db	16
	db	32
	db	10
	db	0
	dd	@@$xt$9game_cast
	db	103
	db	97
	db	109
	db	101
	db	95
	db	99
	db	97
	db	115
	db	116
	db	32
	db	42
	db	0
@$xt$n9game_cast	ends
GAME_TEXT	ends
GAME_TEXT	segment byte public use16 'CODE'
@$xt$n12game_manager	segment	virtual
@@$xt$n12game_manager	label	dword
	db	4
	db	0
	db	16
	db	32
	db	10
	db	0
	dd	@@$xt$12game_manager
	db	103
	db	97
	db	109
	db	101
	db	95
	db	109
	db	97
	db	110
	db	97
	db	103
	db	101
	db	114
	db	32
	db	42
	db	0
@$xt$n12game_manager	ends
GAME_TEXT	ends
GAME_TEXT	segment byte public use16 'CODE'
@$xt$12game_manager	segment	virtual
@@$xt$12game_manager	label	word
	db	50
	db	3
	db	3
	db	0
	db	38
	db	0
	db	255
	db	255
	db	3
	db	0
	db	52
	db	0
	db	56
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	1
	db	0
	db	1
	db	0
	dd	@game_manager@$bdtr$qv
	db	5
	db	0
	db	60
	db	0
	db	103
	db	97
	db	109
	db	101
	db	95
	db	109
	db	97
	db	110
	db	97
	db	103
	db	101
	db	114
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
@$xt$12game_manager	ends
GAME_TEXT	ends
GAME_TEXT	segment byte public use16 'CODE'
@$xt$9game_cast	segment	virtual
@@$xt$9game_cast	label	word
	db	34
	db	3
	db	3
	db	0
	db	38
	db	0
	db	255
	db	255
	db	3
	db	0
	db	48
	db	0
	db	52
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	1
	db	0
	db	1
	db	0
	dd	@game_cast@$bdtr$qv
	db	5
	db	0
	db	56
	db	0
	db	103
	db	97
	db	109
	db	101
	db	95
	db	99
	db	97
	db	115
	db	116
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
@$xt$9game_cast	ends
GAME_TEXT	ends
GAME_TEXT	segment byte public use16 'CODE'
@$xt$7tilemap	segment	virtual
@@$xt$7tilemap	label	word
	db	162
	db	3
	db	3
	db	0
	db	38
	db	0
	db	255
	db	255
	db	3
	db	0
	db	46
	db	0
	db	50
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	1
	db	0
	db	1
	db	0
	dd	@tilemap@$bdtr$qv
	db	5
	db	0
	db	54
	db	0
	db	116
	db	105
	db	108
	db	101
	db	109
	db	97
	db	112
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	?debug	C E9
	?debug	C FA00000000
@$xt$7tilemap	ends
GAME_TEXT	ends
_DATA	segment word public use16 'DATA'
s@	label	byte
	db	'%s'
	db	10
	db	0
	db	'Riptide (Registered) 1.0'
	db	9
	db	'(C) 1994 MindStorm Software'
	db	0
	db	'>> DEBUG'
	db	9
	db	'MODE ENABLED <<'
	db	10
	db	0
	db	'>>  FORCING PC SOUND  <<'
	db	10
	db	0
	db	'riptide.dat'
	db	0
	db	'Riptide requires 600k with digital sound.'
	db	0
	db	'Riptide requires 500k running pc sound.'
	db	0
	db	'logos.pcx'
	db	0
	db	'Bytes free %lu'
	db	10
	db	0
	db	'mouse.l'
	db	0
	db	'config.rip'
	db	0
	db	'rb'
	db	0
	db	'1-1.m'
	db	0
	db	'1.cmf'
	db	0
	db	'1'
	db	0
	db	'Shallow Sea'
	db	0
	db	'1-2.m'
	db	0
	db	'2.cmf'
	db	0
	db	'UR2GD'
	db	0
	db	'Micro Menace'
	db	0
	db	'1-3.m'
	db	0
	db	'3.cmf'
	db	0
	db	'URGR8'
	db	0
	db	'Tulip Tango'
	db	0
	db	'1-4.m'
	db	0
	db	'1.cmf'
	db	0
	db	'4GOOD'
	db	0
	db	'Red Tide'
	db	0
	db	'1-5.m'
	db	0
	db	'2.cmf'
	db	0
	db	'2MUCH4U'
	db	0
	db	'Fathoms of Teeth'
	db	0
	db	'1-6.m'
	db	0
	db	'3.cmf'
	db	0
	db	'ACE'
	db	0
	db	'Think Tank'
	db	0
	db	'bs1.m'
	db	0
	db	'5.cmf'
	db	0
	db	'BS1'
	db	0
	db	'Oscar'
	db	39
	db	's Lair'
	db	0
	db	'2-1.m'
	db	0
	db	'oxygen.cmf'
	db	0
	db	'DNUNDR'
	db	0
	db	'Atlantis'
	db	0
	db	'2-2.m'
	db	0
	db	'4.cmf'
	db	0
	db	'OUT2GTU'
	db	0
	db	'Aqua Tremendom'
	db	0
	db	'2-3.m'
	db	0
	db	'bossa.cmf'
	db	0
	db	'AIC'
	db	0
	db	'Spawning Waters'
	db	0
	db	'2-4.m'
	db	0
	db	'1.cmf'
	db	0
	db	'HANG10'
	db	0
	db	'JASON Quest'
	db	0
	db	'2-5.m'
	db	0
	db	'weerd.cmf'
	db	0
	db	'RUN4IT'
	db	0
	db	'Frantic Attack'
	db	0
	db	'bs2.m'
	db	0
	db	'chaos.cmf'
	db	0
	db	'BS2'
	db	0
	db	'Enter Otis'
	db	0
	db	'3-1.m'
	db	0
	db	'1.cmf'
	db	0
	db	'GETIT'
	db	0
	db	'Sea Escape'
	db	0
	db	'3-2.m'
	db	0
	db	'oxygen.cmf'
	db	0
	db	'URINDE'
	db	0
	db	'Deep Enigma'
	db	0
	db	'3-3.m'
	db	0
	db	'4.cmf'
	db	0
	db	'SOS'
	db	0
	db	'Sink or Swim'
	db	0
	db	'3-4.m'
	db	0
	db	'3.cmf'
	db	0
	db	'RUN2ME'
	db	0
	db	'Marathon'
	db	0
	db	'3-5.m'
	db	0
	db	'chaos.cmf'
	db	0
	db	'512TR'
	db	0
	db	'Lab Rynth'
	db	0
	db	'3-6.m'
	db	0
	db	'turn.cmf'
	db	0
	db	'2B4UDY'
	db	0
	db	'Abyss of Peril'
	db	0
	db	'3-7.m'
	db	0
	db	'2.cmf'
	db	0
	db	'HOH'
	db	0
	db	'Halls of Hell'
	db	0
	db	'3-8.m'
	db	0
	db	'oxygen.cmf'
	db	0
	db	'RIP'
	db	0
	db	'Mysterious Maze'
	db	0
	db	'bs3.m'
	db	0
	db	'5.cmf'
	db	0
	db	'BS3'
	db	0
	db	'Confrontation'
	db	0
	db	'sec1.m'
	db	0
	db	'4.cmf'
	db	0
	db	'SEC1'
	db	0
	db	'Outpost Enigma'
	db	0
	db	'sec2.m'
	db	0
	db	'weerd.cmf'
	db	0
	db	'SEC2'
	db	0
	db	'??????'
	db	0
	db	'p_frame.pcx'
	db	0
	db	'bs1_bdl.l'
	db	0
	db	'bs1_bdr.l'
	db	0
	db	'bs1dr.l'
	db	0
	db	'bosshit.l'
	db	0
	db	'badgrunt'
	db	0
	db	'bs2_bod.l'
	db	0
	db	'bs2_tnr1.l'
	db	0
	db	'bs2_tnl1.l'
	db	0
	db	'bs2_tnr2.l'
	db	0
	db	'bs2_tnl2.l'
	db	0
	db	'msl_inkl.l'
	db	0
	db	'msl_inkr.l'
	db	0
	db	'otiseyes.l'
	db	0
	db	'bs3_bdr.l'
	db	0
	db	'bs3_arr.l'
	db	0
	db	'bs3_bdl.l'
	db	0
	db	'bs3_arl.l'
	db	0
	db	'bs3_dthr.l'
	db	0
	db	'bs3_prpl.l'
	db	0
	db	'bs3_prpr.l'
	db	0
	db	'bs3_facl.l'
	db	0
	db	'bs3_facr.l'
	db	0
	db	'chain.l'
	db	0
	db	'exp3.l'
	db	0
	db	'plunk2'
	db	0
	db	'sharkr.l'
	db	0
	db	'sharkl.l'
	db	0
	db	'sharkdie.l'
	db	0
	db	'bs1_bdl.l'
	db	0
	db	'bs1_bdr.l'
	db	0
	db	'bs1dr.l'
	db	0
	db	'bosshit.l'
	db	0
	db	'badgrunt'
	db	0
	db	'bs2_bod.l'
	db	0
	db	'bs2_tnr1.l'
	db	0
	db	'bs2_tnl1.l'
	db	0
	db	'bs2_tnr2.l'
	db	0
	db	'bs2_tnl2.l'
	db	0
	db	'msl_inkl.l'
	db	0
	db	'msl_inkr.l'
	db	0
	db	'otiseyes.l'
	db	0
	db	'bs3_bdr.l'
	db	0
	db	'bs3_arr.l'
	db	0
	db	'bs3_bdl.l'
	db	0
	db	'bs3_arl.l'
	db	0
	db	'bs3_prpl.l'
	db	0
	db	'bs3_prpr.l'
	db	0
	db	'bs3_facl.l'
	db	0
	db	'bs3_facr.l'
	db	0
	db	'bs3_dthr.l'
	db	0
	db	'chain.l'
	db	0
	db	'exp3.l'
	db	0
	db	'plunk2'
	db	0
	db	'sharkr.l'
	db	0
	db	'sharkl.l'
	db	0
	db	'sharkdie.l'
	db	0
	db	'New password : '
	db	0
	db	'Invalid secret level exit.'
	db	0
	db	'Invalid secret level re-entrance.'
	db	0
	db	'subl.l'
	db	0
	db	'subr.l'
	db	0
	db	'Too many barriers for list.'
	db	0
	db	'Too many shootables.'
	db	0
	db	'End door switch without door.'
	db	0
	db	'bubbles2'
	db	0
	db	'subr.l'
	db	0
	db	'chain.l'
	db	0
	db	'plunk2'
	db	0
	db	'the.l'
	db	0
	db	'end.l'
	db	0
	db	'p_death1.pcx'
	db	0
	db	'p_death2.pcx'
	db	0
	db	'bubbles2'
	db	0
	db	'dead'
	db	0
	db	'You made the top 10!  Unfortunately'
	db	10
	db	'you are a big cheater, so no cigar.'
	db	0
	db	'Enter Name'
	db	0
	db	'You'
	db	39
	db	're in the top 10!'
	db	0
	db	0
	db	'egodie2.l'
	db	0
	db	'swish'
	db	0
	db	'gotcha.l'
	db	0
	db	'gotcha.l'
	db	0
	db	'smash'
	db	0
	db	'exp2'
	db	0
	db	'egodie2.l'
	db	0
	db	'gotcha.l'
	db	0
	db	'cry'
	db	0
	db	'villans'
	db	0
	db	'scr_100.l'
	db	0
	db	'scr_500.l'
	db	0
	db	'scr_1000.l'
	db	0
	db	'scr_2000.l'
	db	0
	db	'scr_3000.l'
	db	0
	db	'scr_4000.l'
	db	0
	db	'Undefined score animation.'
	db	0
	db	'msg_bar.l'
	db	0
	db	'msg_gun.l'
	db	0
	db	'msg_cave.l'
	db	0
	db	'msg_jasn.l'
	db	0
	db	'gem.l'
	db	0
	db	'bonus1.l'
	db	0
	db	'bonus2.l'
	db	0
	db	'coin.l'
	db	0
	db	'pod1.l'
	db	0
	db	'pod2.l'
	db	0
	db	'mine.l'
	db	0
	db	'zap_ud.l'
	db	0
	db	'fish1r.l'
	db	0
	db	'fish2r.l'
	db	0
	db	'weed1.l'
	db	0
	db	'tulip.l'
	db	0
	db	'chest.l'
	db	0
	db	'duct_r.l'
	db	0
	db	'duct_l.l'
	db	0
	db	'duct_u.l'
	db	0
	db	'duct_d.l'
	db	0
	db	'piranar.l'
	db	0
	db	'piranal.l'
	db	0
	db	'block2.l'
	db	0
	db	'block.l'
	db	0
	db	'face_r.l'
	db	0
	db	'face_l.l'
	db	0
	db	'serp_r.l'
	db	0
	db	'serp_l.l'
	db	0
	db	'crab.l'
	db	0
	db	'piece_1.l'
	db	0
	db	'piece_2.l'
	db	0
	db	'piece_3.l'
	db	0
	db	'piece_4.l'
	db	0
	db	'jelly.l'
	db	0
	db	'sharkr.l'
	db	0
	db	'sharkl.l'
	db	0
	db	'tent_out.l'
	db	0
	db	'spikes_d.l'
	db	0
	db	'spikes_u.l'
	db	0
	db	'statue.l'
	db	0
	db	'fire_pit.l'
	db	0
	db	'shutl_l.l'
	db	0
	db	'clam.l'
	db	0
	db	'cannonr.l'
	db	0
	db	'shipl.l'
	db	0
	db	'shipr.l'
	db	0
	db	'barrel2.l'
	db	0
	db	'barrel1.l'
	db	0
	db	'barrel3.l'
	db	0
	db	'pu_air.l'
	db	0
	db	'pu_shld.l'
	db	0
	db	'pu_fire.l'
	db	0
	db	'pu_top.l'
	db	0
	db	'pu_1up.l'
	db	0
	db	'pu_key.l'
	db	0
	db	'pu_auto.l'
	db	0
	db	'pu_jason.l'
	db	0
	db	'pu_jf.l'
	db	0
	db	'Pup not defined!'
	db	0
	db	'switch.l'
	db	0
	db	'end_dr.l'
	db	0
	db	'door_ud.l'
	db	0
	db	'bubmd.l'
	db	0
	db	'bubsm.l'
	db	0
	db	'prober.l'
	db	0
	db	'squeek'
	db	0
	db	'drillhi'
	db	0
	db	'drillhi'
	db	0
	db	'drillhi'
	db	0
	db	'drillhi'
	db	0
	db	'drillhi'
	db	0
	db	'drillhi'
	db	0
	db	'Riptide.pcx has been written'
	db	0
	db	'backsub.l'
	db	0
	db	'tport'
	db	0
	db	'turn.l'
	db	0
	db	'subr.l'
	db	0
	db	'subl.l'
	db	0
	db	'key.l'
	db	0
	db	'gun_1.l'
	db	0
	db	'gun_2.l'
	db	0
	db	'gun_3.l'
	db	0
	db	'gun_4.l'
	db	0
	db	'Error updating gun.'
	db	0
	db	'ping'
	db	0
	db	'ping'
	db	0
	db	'ping'
	db	0
	db	'bubsm.l'
	db	0
	db	'bubmd.l'
	db	0
	db	'subr.l'
	db	0
	db	'subl.l'
	db	0
	db	'turn.l'
	db	0
	db	'msl_str.l'
	db	0
	db	'msl_sm.l'
	db	0
	db	'msl_tpl.l'
	db	0
	db	'msl_tpr.l'
	db	0
	db	'msl_rkr.l'
	db	0
	db	'msl_rkl.l'
	db	0
	db	'msl_top.l'
	db	0
	db	'msl_pea.l'
	db	0
	db	'msl_spt.l'
	db	0
	db	'msl_red.l'
	db	0
	db	'msl_arwl.l'
	db	0
	db	'msl_arwr.l'
	db	0
	db	'msl_bg2l.l'
	db	0
	db	'msl_bg2r.l'
	db	0
	db	'shpbmb.l'
	db	0
	db	'fireball.l'
	db	0
	db	'explg.l'
	db	0
	db	'expmd.l'
	db	0
	db	'expsm.l'
	db	0
	db	'splat.l'
	db	0
	db	'prober.l'
	db	0
	db	'probel.l'
	db	0
	db	'fish1l.l'
	db	0
	db	'fish1r.l'
	db	0
	db	'fish2l.l'
	db	0
	db	'fish2r.l'
	db	0
	db	'scr_100.l'
	db	0
	db	'scr_500.l'
	db	0
	db	'scr_1000.l'
	db	0
	db	'scr_2000.l'
	db	0
	db	'scr_3000.l'
	db	0
	db	'scr_4000.l'
	db	0
	db	'coin.l'
	db	0
	db	'bonus1.l'
	db	0
	db	'bonus2.l'
	db	0
	db	'tulipl.l'
	db	0
	db	'tulipr.l'
	db	0
	db	'tulip.l'
	db	0
	db	'serp_r.l'
	db	0
	db	'serp_l.l'
	db	0
	db	'msl_bigl.l'
	db	0
	db	'msl_bigr.l'
	db	0
	db	'msl_hbl.l'
	db	0
	db	'msl_hbr.l'
	db	0
	db	'firbalup.l'
	db	0
	db	'firbaldn.l'
	db	0
	db	'pu_air.l'
	db	0
	db	'pu_fire.l'
	db	0
	db	'pu_shld.l'
	db	0
	db	'pu_jwl1.l'
	db	0
	db	'pu_1up.l'
	db	0
	db	'pu_auto.l'
	db	0
	db	'pu_key.l'
	db	0
	db	'pu_top.l'
	db	0
	db	'pu_jason.l'
	db	0
	db	'pu_jf.l'
	db	0
	db	'gem.l'
	db	0
	db	'spikes_u.l'
	db	0
	db	'spikes_d.l'
	db	0
	db	'shutl_l.l'
	db	0
	db	'shutl_r.l'
	db	0
	db	'mreal.l'
	db	0
	db	'freemine.l'
	db	0
	db	'tent_out.l'
	db	0
	db	'tent_in.l'
	db	0
	db	'mine.l'
	db	0
	db	'barrel1.l'
	db	0
	db	'barrel2.l'
	db	0
	db	'barrel3.l'
	db	0
	db	'pod1.l'
	db	0
	db	'pod2.l'
	db	0
	db	'piranar.l'
	db	0
	db	'piranal.l'
	db	0
	db	'jelly.l'
	db	0
	db	'backsub.l'
	db	0
	db	'end_dr.l'
	db	0
	db	'door_ud.l'
	db	0
	db	'duct_l.l'
	db	0
	db	'duct_r.l'
	db	0
	db	'duct_u.l'
	db	0
	db	'duct_d.l'
	db	0
	db	'block.l'
	db	0
	db	'block2.l'
	db	0
	db	'switch.l'
	db	0
	db	'zap_ud.l'
	db	0
	db	'weed1.l'
	db	0
	db	'chest.l'
	db	0
	db	'face_r.l'
	db	0
	db	'face_l.l'
	db	0
	db	'crab.l'
	db	0
	db	'crabdie.l'
	db	0
	db	'serpdie.l'
	db	0
	db	'probspin.l'
	db	0
	db	'piece_1.l'
	db	0
	db	'piece_2.l'
	db	0
	db	'piece_3.l'
	db	0
	db	'piece_4.l'
	db	0
	db	'gun_1.l'
	db	0
	db	'gun_2.l'
	db	0
	db	'gun_3.l'
	db	0
	db	'gun_4.l'
	db	0
	db	'statue.l'
	db	0
	db	'fire_pit.l'
	db	0
	db	'clam.l'
	db	0
	db	'cannonr.l'
	db	0
	db	'cannonl.l'
	db	0
	db	'shipr.l'
	db	0
	db	'shipl.l'
	db	0
	db	'mouse.l'
	db	0
	db	'key.l'
	db	0
	db	'pat1.l'
	db	0
	db	'fire1'
	db	0
	db	'fire2'
	db	0
	db	'exp1'
	db	0
	db	'exp2'
	db	0
	db	'dirhit'
	db	0
	db	'bubbles2'
	db	0
	db	'pirana'
	db	0
	db	'door'
	db	0
	db	'drillhi'
	db	0
	db	'zap'
	db	0
	db	'pup'
	db	0
	db	'pup2'
	db	0
	db	'faze'
	db	0
	db	'tulip'
	db	0
	db	'ping'
	db	0
	db	'tport'
	db	0
	db	'swish'
	db	0
	db	'smash'
	db	0
	db	'-mandich'
	db	0
	db	'-pcsound'
	db	0
	db	'-start'
	db	0
_DATA	ends
GAME_TEXT	segment byte public use16 'CODE'
GAME_TEXT	ends
	extrn	@$bnew$qui:far
	extrn	@$bdele$qnv:far
	extrn	___InitExceptBlock:far
	extrn	_fclose:far
	extrn	_fgetc:far
	extrn	_fopen:far
	extrn	_printf:far
	extrn	_strcat:far
	extrn	_strcmp:far
	extrn	_strcpy:far
	extrn	_strlen:far
	extrn	_clrscr:far
	extrn	_coreleft:far
	extrn	_clock:far
	extrn	_ltoa:far
	extrn	_rand:far
	extrn	_atol:far
	extrn	@m_actor@set_xy$qii:far
	extrn	@m_actor@set_cycle$qucuc:far
	extrn	@m_actor@new_loop$qnuc:far
	extrn	@m_actor@erase$qv:far
	extrn	@m_actor@on_pos$qui:far
	extrn	@game_cast@$bctr$qv:far
	extrn	@game_cast@$bdtr$qv:far
	extrn	@game_cast@add$qnucnvt2:far
	extrn	@game_cast@update$quc:far
	extrn	@game_cast@kill_all$qv:far
	extrn	@game_manager@$bctr$qnuc:far
	extrn	@game_manager@$bdtr$qv:far
	extrn	@game_manager@doit$qv:far
	extrn	@game_manager@clear_flags$qv:far
	extrn	@game_manager@joy_update$qv:far
	extrn	@game_manager@reset_player$quc:far
	extrn	@game_manager@remove_sound$qve:far
	extrn	@game_manager@play_sound_file$qnuc:far
	extrn	@game_manager@play_sound$qnucuc:far
	extrn	@game_manager@reset_sound$qv:far
	extrn	@game_manager@play_song$qnuc:far
	extrn	@game_manager@load_loop$qnuc:far
	extrn	@game_manager@get_loop$qnuc:far
	extrn	@game_manager@remove_loop$qnuc:far
	extrn	@game_manager@define_sound$qnucuc:far
	extrn	@tilemap@$bctr$qnucii:far
	extrn	@tilemap@$bdtr$qv:far
	extrn	@tilemap@set_viewport$qiiii:far
	extrn	@tilemap@new_map$qve:far
	extrn	@tilemap@update$qui:far
	extrn	@tilemap@center_on$quiui:far
	extrn	@tilemap@purge_tiles$qv:far
	extrn	@vga_display@doit$qv:far
	extrn	@vga_display@copy_page$qucuc:far
	extrn	@vga_display@set_pix$qiiuc:far
	extrn	@vga_display@draw_span$qiiuciui:far
	extrn	@vga_display@pause$qui:far
	extrn	@vga_display@blank_palette$qv:far
	extrn	@vga_display@fade_up$qv:far
	extrn	@vga_display@fade_down$qv:far
	extrn	@vga_display@set_palette$qv:far
	extrn	@vga_display@fill_rect$qiiiiiiuc:far
	extrn	@vga_display@show_offset$qui:far
	extrn	@vga_display@cls$qucuc:far
	extrn	@vga_display@get_bits$qiiii:far
	extrn	@vga_display@copy_bits$qiiiiiiuiuiuiui:far
	extrn	@vga_display@put_bits$qiiiinucuiui:far
	extrn	@vga_display@put_bits_masked$qve:far
	extrn	@vga_display@show_pcx$qnucucuii:far
	extrn	@vga_display@dump_pcx$qve:far
	extrn	@ms_mouse@set_cursor$qnucii:far
	extrn	_the_game:dword
	extrn	_the_cast:dword
	extrn	_display:dword
	extrn	_mouse:dword
	extrn	_the_map:dword
	extrn	_ego:dword
	extrn	_jason:dword
	extrn	_cur_sub:dword
	extrn	_boss:dword
	extrn	_act:dword
	extrn	_end_door_ptr:dword
	extrn	_debug_mode:byte
	extrn	_debug:byte
	extrn	_force_pc_sound:byte
	extrn	_zoom_to_map:byte
	extrn	_game_in_progress:byte
	extrn	_god_mode:byte
	extrn	_cheat_mode:byte
	extrn	_score:dword
	extrn	_score_count:byte
	extrn	_men:byte
	extrn	_gun_count:byte
	extrn	_gun_pieces_xy:byte
	extrn	_auto_fire_count:byte
	extrn	_jason_fire:byte
	extrn	_auto_fire:byte
	extrn	_top_fire:byte
	extrn	_shot_size:byte
	extrn	_jason_on:byte
	extrn	_jason_present:byte
	extrn	_maximum_jason_power:byte
	extrn	_jason_power:byte
	extrn	_shld_supply:word
	extrn	_air_supply:word
	extrn	_air_count:byte
	extrn	_air_speed:byte
	extrn	_cur_map:byte
	extrn	_stop_room:byte
	extrn	_system_bench:byte
	extrn	_displayed_page:byte
	extrn	_non_displayed_page:byte
	extrn	_page_offsets:word
	extrn	_control:byte
	extrn	_heavy_timer:word
	extrn	_enemies_killed:byte
	extrn	_goodies_found:byte
	extrn	_enemy_count:byte
	extrn	_goody_count:byte
	extrn	_got_key:byte
	extrn	_start_x:word
	extrn	_start_y:word
	extrn	_ego_x_speed:byte
	extrn	_ego_y_speed:byte
	extrn	_ego_map_w:word
	extrn	_ego_map_h:word
	extrn	_message_count:byte
	extrn	_message_posted:byte
	extrn	_cur_message:word
	extrn	_map_messages:word
	extrn	_gr_keys:byte
	extrn	_all_messages:dword
	extrn	_teleport_count:byte
	extrn	_all_teleports:word
	extrn	_shootable_count:byte
	extrn	_shootable_list:dword
	extrn	_barrier_count:byte
	extrn	_barrier_list:dword
	extrn	_pd_redraws:byte
	extrn	_smart_missiles:byte
	extrn	_death_type:byte
	extrn	_src:byte
	extrn	_finish_tile:word
	extrn	_end_door_tile:word
	extrn	_secret_tile:word
	extrn	_top_shot_count:byte
	extrn	_shot_count:byte
	extrn	_jason_count:byte
	extrn	_jason_msg:byte
	extrn	_barrel_msg:byte
	extrn	_gun_msg:byte
	extrn	_cave_msg:byte
	extrn	_space_bar_been_up:word
	extrn	_zapper_count:byte
	extrn	_palette:byte
	extrn	_gun_underbits:dword
	extrn	_jguage_underbits:dword
	extrn	__tmp:byte
	extrn	__tmp2:byte
	extrn	_new_map_name:dword
	public	_main
	public	@init_game$qv
	public	@play_game$quc
	public	@setup_secret_level$qv
	public	@exit_secret_level$qv
	extrn	@start_title_loop$qv:far
	public	@start_room$qnuc
	extrn	@show_prelude$qv:far
	public	@de_doit$qv
	public	@end_room$qv
	public	@end_game$qv
	public	@parse_options$qinnuc
	extrn	@de_left$qv:far
	extrn	@de_right$qv:far
	extrn	@de_up$qv:far
	extrn	@de_down$qv:far
	public	@de_button$qv
	public	@clear_message$qv
	public	@update_shld_guage$qiii
	public	@update_air_guage$qiii
	public	@update_score$qii
	public	@update_men$qv
	public	@update_gun$qv
	public	@update_key_guage$qv
	public	@update_jason_guage$qv
	public	@update_boss_guage$qv
	public	@kill_ego$qii
	public	@kill_jason$qv
	public	@add_bubble$qiii
	public	@post_message$quc
	extrn	@show_loop$qnuciiucui:far
	extrn	@vga_text$qiinucucuc:far
	public	@add_switch$quiui
	public	@add_door$quiui
	public	@add_barrel$quiui
	public	@add_map_item$quiui
	public	@add_map_pup$quiui
	public	@get_map_coords$quinit2
	public	@hook_up_switches$qv
	public	@add_jason$qv
	public	@check_user$qv
	public	@check_guages$qv
	extrn	@add_explosion$qiiucnuc:far
	extrn	@activate_menu_bar$qv:far
	extrn	@ego_fire$qv:far
	extrn	@turn_ego$qv:far
	public	@teleport_to$qui
	extrn	@show_stats$qv:far
	public	@wait_for_user$qv
	public	@random$qi
	public	@abs$qi
	public	@atoi$qnxuc
	extrn	@do_ego$qn7m_actor:far
	extrn	@mv_ego$qn7m_actornit2:far
	extrn	@do_score$qn7m_actor:far
	extrn	@do_coin$qn7m_actor:far
	extrn	@do_pod$qn7m_actor:far
	extrn	@mv_std$qn7m_actornit2:far
	extrn	@do_mine1$qn7m_actor:far
	extrn	@do_zapper$qn7m_actor:far
	extrn	@do_fish$qn7m_actor:far
	extrn	@do_tulip$qn7m_actor:far
	extrn	@do_chest$qn7m_actor:far
	extrn	@do_duct_lr$qn7m_actor:far
	extrn	@do_duct_ud$qn7m_actor:far
	extrn	@do_pirana$qn7m_actor:far
	extrn	@mv_pirana$qn7m_actornit2:far
	extrn	@do_block$qn7m_actor:far
	extrn	@do_face$qn7m_actor:far
	extrn	@do_serpent$qn7m_actor:far
	extrn	@mv_pace$qn7m_actornit2:far
	extrn	@do_crab$qn7m_actor:far
	extrn	@do_gun_piece$qn7m_actor:far
	extrn	@do_jelly$qn7m_actor:far
	extrn	@do_shark$qn7m_actor:far
	extrn	@mv_shark$qn7m_actornit2:far
	extrn	@do_tentacle$qn7m_actor:far
	extrn	@do_spikes$qn7m_actor:far
	extrn	@do_fire_pit$qn7m_actor:far
	extrn	@do_shuttle$qn7m_actor:far
	extrn	@do_clam$qn7m_actor:far
	extrn	@do_cannon$qn7m_actor:far
	extrn	@do_ship$qn7m_actor:far
	extrn	@mv_ship$qn7m_actornit2:far
	extrn	@do_pup$qn7m_actor:far
	extrn	@mv_barrel$qn7m_actornit2:far
	extrn	@do_barrel$qn7m_actor:far
	extrn	@do_switch$qn7m_actor:far
	extrn	@do_door$qn7m_actor:far
	extrn	@do_bubble$qn7m_actor:far
	extrn	@do_probe$qn7m_actor:far
	extrn	@scroll_to$qn7m_actor:far
	extrn	@touching$qn7m_actort1:far
	extrn	@_gr_start_kbd_grab$qv:far
	extrn	@_set_exit_routine$qnqv$v:far
	extrn	@terminate$qnuct1:far
	extrn	@pause$qui:far
	extrn	_forcepal:far
	extrn	@init_display$quc:far
	public	@load_resources$qv
	extrn	@setup_options$qv:far
	extrn	@init_scores_array$qv:far
	extrn	@load_scores_in$qv:far
	extrn	@i_init_interface$qnvt1t1t1t1:far
	extrn	@i_set_text$qucucucuc:far
	extrn	@i_inform$qnucuce:far
	extrn	@i_get_string$qnuct1:far
	extrn	@is_record$qul:far
	extrn	@save_new_score$qulnucuc:far
	extrn	@show_high_scores$quc:far
	extrn	@cb_quit$qv:far
	extrn	__setargv__:far
	extrn	__setenvp__:far
	public	_all_secrets
	extrn	@bs1_start_up$qv:far
	extrn	@bs2_start_up$qv:far
	extrn	@bs3_start_up$qv:far
	public	_all_maps
	public	@score_at$qiii
	public	@toggle_sub_control$qv
	end
