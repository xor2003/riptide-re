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
	?debug	S "game.cpp"
	?debug	C E94E8A375D0867616D652E637070
	?debug	C E94E8A375D09726970746964652E68
	?debug	C E9253FD45C12443A5C494E434C5544455C737464696F2E68
	?debug	C E9263FD45C12443A5C494E434C5544455C5F646566732E68
	?debug	C E9263FD45C13443A5C494E434C5544455C5F6E66696C652E68
	?debug	C E9263FD45C12443A5C494E434C5544455C5F6E756C6C2E68
	?debug	C E9263FD45C13443A5C494E434C5544455C737472696E672E68
	?debug	C E9253FD45C10443A5C494E434C5544455C646F732E68
	?debug	C E9253FD45C12443A5C494E434C5544455C636F6E696F2E68
	?debug	C E9253FD45C12443A5C494E434C5544455C616C6C6F632E68
	?debug	C E9263FD45C11443A5C494E434C5544455C74696D652E68
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
   ;	
   ;	int main(int argc, char *argv[], char *envp[])
   ;	
	assume	cs:GAME_TEXT
_main	proc	far
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
@1@58:
   ;	
   ;	    while (1) {
   ;	        if (debug_mode == 0)
   ;	
	cmp	byte ptr DGROUP:_debug_mode,0
	jne	short @1@114
   ;	
   ;	            start_title_loop();
   ;	
	call	far ptr @start_title_loop$qv
@1@114:
   ;	
   ;	        play_game(zoom_to_map);
   ;	
	mov	al,byte ptr DGROUP:_zoom_to_map
	push	ax
	call	far ptr @play_game$quc
	pop	cx
	jmp	short @1@58
   ;	
   ;	    }
   ;	}
   ;	
	pop	bp
	ret	
_main	endp
   ;	
   ;	void init_game(void)
   ;	
	assume	cs:GAME_TEXT
@init_game$qv	proc	far
	enter	28,0
   ;	
   ;	{
   ;	    FILE *stream;
   ;	    unsigned long need, free_mem;
   ;	    loop_res far *loopdat;
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
	jne	short @2@86
   ;	
   ;	        printf(">> DEBUG\tMODE ENABLED <<\n");
   ;	
	push	ds
	push	offset DGROUP:s@+57
	call	far ptr _printf
	add	sp,4
@2@86:
   ;	
   ;	    if (force_pc_sound == 1)
   ;	
	cmp	byte ptr DGROUP:_force_pc_sound,1
	jne	short @2@142
   ;	
   ;	        printf(">>  FORCING PC SOUND  <<\n");
   ;	
	push	ds
	push	offset DGROUP:s@+83
	call	far ptr _printf
	add	sp,4
@2@142:
   ;	
   ;	
   ;	    the_game = new game_manager((uchar *)"riptide.dat");
   ;	
	push	ds
	push	offset DGROUP:s@+109
	push	0
	push	0
	call	far ptr @game_manager@$bctr$qnuc
	add	sp,8
	mov	word ptr DGROUP:_the_game+2,dx
	mov	word ptr DGROUP:_the_game,ax
   ;	
   ;	    the_cast = new game_cast();
   ;	
	push	0
	push	0
	call	far ptr @game_cast@$bctr$qv
	add	sp,4
	mov	word ptr DGROUP:_the_cast+2,dx
	mov	word ptr DGROUP:_the_cast,ax
   ;	
   ;	    free_mem = coreleft();
   ;	
	call	far ptr _coreleft
	push	dx
	push	ax
	pop	eax
	mov	dword ptr [bp-12],eax
   ;	
   ;	
   ;	    if (debug_mode == 0) {
   ;	
	cmp	byte ptr DGROUP:_debug_mode,0
	je short	@@14
	jmp	@2@422
@@14:
   ;	
   ;	        if (the_game->sb_present)
   ;	
	les	bx,dword ptr DGROUP:_the_game
	cmp	byte ptr es:[bx+6],0
	je	short @2@226
   ;	
   ;	            need = 0x65518;                 /* 415000 */
   ;	
	mov	dword ptr [bp-8],large 000065518h
	jmp	short @2@254
@2@226:
   ;	
   ;	        else
   ;	            need = 0x4CE78;                 /* 315000 */
   ;	
	mov	dword ptr [bp-8],large 00004CE78h
@2@254:
   ;	
   ;	        if (free_mem < need) {
   ;	
	mov	eax,dword ptr [bp-12]
	cmp	eax,dword ptr [bp-8]
	jae	short @2@394
   ;	
   ;	            delete the_game;
   ;	
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
	je	short @2@338
   ;	
   ;	                terminate((uchar *)"Riptide requires 600k with digital sound.", 0);
   ;	
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+121
	jmp	short @2@366
@2@338:
   ;	
   ;	            else
   ;	                terminate((uchar *)"Riptide requires 500k running pc sound.", 0);
   ;	
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+163
@2@366:
	call	far ptr @terminate$qnuct1
	add	sp,8
@2@394:
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
	jmp	short @2@450
@2@422:
   ;	
   ;	        printf("Bytes free %lu\n", free_mem);
   ;	
	push	dword ptr [bp-12]
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
@2@450:
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
   ;	    loopdat = (loop_res far *)the_game->get_loop((uchar far *)"mouse.l");
   ;	
	push	ds
	push	offset DGROUP:s@+229
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@get_loop$qnuc
	add	sp,8
	mov	word ptr [bp-14],dx
	mov	word ptr [bp-16],ax
   ;	
   ;	    mouse->set_cursor(loopdat->frames[0]->bitmap,
   ;	
   ;	
   ;	                      loopdat->frames[0]->w, loopdat->frames[0]->h);
   ;	
	les	bx,dword ptr [bp-16]
	les	bx,dword ptr es:[bx+6]
	push	word ptr es:[bx+4]
	les	bx,dword ptr [bp-16]
	les	bx,dword ptr es:[bx+6]
	push	word ptr es:[bx+6]
	les	bx,dword ptr [bp-16]
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
	push	dx
	push	ax
	pop	eax
	mov	dword ptr [bp-24],eax
   ;	
   ;	    for (i = 40; i--;)
   ;	
	mov	dword ptr [bp-28],large 40
	jmp	short @2@506
@2@478:
   ;	
   ;	        display->put_bits(i, i, i + 0x32, i + 0x1e, (uchar *)_tmp, 0, 0);
   ;	
	push	0
	push	0
	push	ds
	push	offset DGROUP:__tmp
	mov	ax,word ptr [bp-28]
	add	ax,30
	push	ax
	mov	ax,word ptr [bp-28]
	add	ax,50
	push	ax
	push	word ptr [bp-28]
	push	word ptr [bp-28]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@put_bits$qiiiinucuiui
	add	sp,20
@2@506:
	mov	eax,dword ptr [bp-28]
	dec	dword ptr [bp-28]
	cmp	eax,large 0
	jne	short @2@478
   ;	
   ;	    for (i = 5; i--;)
   ;	
	mov	dword ptr [bp-28],large 5
	jmp	short @2@590
@2@562:
   ;	
   ;	        display->copy_page(1, 0);
   ;	
	push	0
	push	1
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@copy_page$qucuc
	add	sp,8
@2@590:
	mov	eax,dword ptr [bp-28]
	dec	dword ptr [bp-28]
	cmp	eax,large 0
	jne	short @2@562
   ;	
   ;	    t2 = clock();
   ;	
	call	far ptr _clock
	push	dx
	push	ax
	pop	eax
	mov	dword ptr [bp-20],eax
   ;	
   ;	    system_bench = (byte)(t2 - t1);
   ;	
	mov	al,byte ptr [bp-20]
	sub	al,byte ptr [bp-24]
	mov	byte ptr DGROUP:_system_bench,al
   ;	
   ;	
   ;	    if (system_bench <= 4)
   ;	
	cmp	byte ptr DGROUP:_system_bench,4
	ja	short @2@674
   ;	
   ;	        the_game->game_speed = 2;
   ;	
	les	bx,dword ptr DGROUP:_the_game
	mov	byte ptr es:[bx+34],2
	jmp	short @2@702
@2@674:
   ;	
   ;	    else
   ;	        the_game->game_speed = 1;
   ;	
	les	bx,dword ptr DGROUP:_the_game
	mov	byte ptr es:[bx+34],1
@2@702:
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
	mov	word ptr [bp-2],dx
	mov	word ptr [bp-4],ax
   ;	
   ;	    if (stream) {
   ;	
	cmp	dword ptr [bp-4],large 0
	je	short @2@814
   ;	
   ;	        the_game->field_1C = fgetc(stream);
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr _fgetc
	add	sp,4
	les	bx,dword ptr DGROUP:_the_game
	mov	byte ptr es:[bx+28],al
   ;	
   ;	        the_game->game_speed = fgetc(stream);
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr _fgetc
	add	sp,4
	les	bx,dword ptr DGROUP:_the_game
	mov	byte ptr es:[bx+34],al
   ;	
   ;	        if (fgetc(stream) != 0) {
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr _fgetc
	add	sp,4
	or	ax,ax
	je	short @2@786
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
@2@786:
   ;	
   ;	        }
   ;	        fclose(stream);
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr _fclose
	add	sp,4
@2@814:
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
   ;	
   ;	void play_game(uchar map_id)
   ;	
	assume	cs:GAME_TEXT
@play_game$quc	proc	far
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
@3@58:
   ;	
   ;	
   ;	restart_map:                                        /* loc_6596 */
   ;	    cur_map = map_id;
   ;	
	mov	al,byte ptr [bp+6]
	mov	byte ptr DGROUP:_cur_map,al
@3@86:
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
@3@114:
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
@3@142:
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
	jbe short	@@15
	jmp	@3@562
@@15:
	shl	bx,1
	jmp	word ptr cs:@3@C1890[bx]
@3@254:
   ;	
   ;	        case 2:                                     /* cur_map=6 bs1.m */
   ;	            if (jason_present == 1)
   ;	
	cmp	byte ptr DGROUP:_jason_present,1
	jne	short @3@310
   ;	
   ;	                jason_present = 0;
   ;	
	mov	byte ptr DGROUP:_jason_present,0
@3@310:
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
@3@338:
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@define_sound$qnucuc
	add	sp,10
   ;	
   ;	            break;
   ;	
	jmp	@3@562
@3@366:
   ;	
   ;	        case 8:                                     /* cur_map=12 bs2.m */
   ;	            if (jason_present == 1)
   ;	
	cmp	byte ptr DGROUP:_jason_present,1
	jne	short @3@422
   ;	
   ;	                jason_present = 0;
   ;	
	mov	byte ptr DGROUP:_jason_present,0
@3@422:
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
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	            break;
   ;	
	jmp	@3@562
@3@450:
   ;	
   ;	        case 17:                                    /* cur_map=21 bs3.m */
   ;	            if (jason_present == 1)
   ;	
	cmp	byte ptr DGROUP:_jason_present,1
	jne	short @3@506
   ;	
   ;	                jason_present = 0;
   ;	
	mov	byte ptr DGROUP:_jason_present,0
@3@506:
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
	jmp	@3@338
@3@534:
   ;	
   ;	            break;
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
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	            break;
   ;	
	jmp	short @3@562
@3@562:
   ;	
   ;	        default:
   ;	            break;
   ;	
   ;	
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
	je	short @3@618
   ;	
   ;	            all_maps[cur_map].start_up();
   ;	
	mov	al,byte ptr DGROUP:_cur_map
	mov	ah,0
	imul	ax,ax,20
	mov	bx,ax
	call	dword ptr DGROUP:_all_maps[bx+16]
@3@618:
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
	je	short @3@618
   ;	
   ;	
   ;	        switch (cur_map - 4) {                      /* jumptable off_6C92 */
   ;	
	mov	al,byte ptr DGROUP:_cur_map
	mov	ah,0
	add	ax,-4
	mov	bx,ax
	cmp	bx,19
	jbe short	@@16
	jmp	@3@870
@@16:
	shl	bx,1
	jmp	word ptr cs:@3@C1794[bx]
@3@758:
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
@3@786:
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
@3@814:
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
@3@842:
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
	jmp	short @3@870
@3@870:
   ;	
   ;	        default:
   ;	            break;
   ;	
   ;	
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
	jbe short	@@17
	jmp	@3@1430
@@17:
	shl	bx,1
	jmp	word ptr cs:@3@C1346[bx]
@3@982:
   ;	
   ;	        case 0:                                     /* level completed */
   ;	            end_room();
   ;	
	call	far ptr @end_room$qv
   ;	
   ;	            if (cur_map < 0x15)
   ;	
	cmp	byte ptr DGROUP:_cur_map,21
	jae	short @3@1038
   ;	
   ;	                ++cur_map;
   ;	
	mov	al,byte ptr DGROUP:_cur_map
	inc	al
	mov	byte ptr DGROUP:_cur_map,al
	jmp	short @3@1122
@3@1038:
   ;	
   ;	            else if (cur_map >= 0x16)
   ;	
	cmp	byte ptr DGROUP:_cur_map,22
	jb	short @3@1094
   ;	
   ;	                exit_secret_level();
   ;	
	call	far ptr @exit_secret_level$qv
	jmp	short @3@1122
@3@1094:
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
@3@1122:
   ;	
   ;	            }
   ;	            switch (cur_map - 1) {                  /* jumptable off_6C58 */
   ;	
	mov	al,byte ptr DGROUP:_cur_map
	mov	ah,0
	dec	ax
	mov	bx,ax
	cmp	bx,22
	jbe short	@@18
	jmp	@3@1430
@@18:
	shl	bx,1
	jmp	word ptr cs:@3@C1634[bx]
@3@1206:
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
	jmp	short @3@1430
   ;	
   ;	            default:                                /* 5,6,11,20: no pw */
   ;	                break;
   ;	
	jmp	short @3@1430
   ;	
   ;	            }
   ;	            break;
   ;	
	jmp	short @3@1430
@3@1290:
   ;	
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
	jmp	@3@86
   ;	
   ;	        case 2:                                     /* replay map, keep state */
   ;	            goto replay;
   ;	
	jmp	@3@142
@3@1346:
   ;	
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
	jmp	@3@58
@3@1374:
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
	jmp	short @3@1430
@3@1402:
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
	jmp	short @3@1430
@3@1430:
   ;	
   ;	        default:
   ;	            break;
   ;	
   ;	
   ;	        }
   ;	    } while (!done);
   ;	
	mov	al,byte ptr [bp-1]
	mov	ah,0
	or	ax,ax
	jne short	@@19
	jmp	@3@114
@@19:
   ;	
   ;	}
   ;	
	leave	
	ret	
@play_game$quc	endp
@3@C1634	label	word
	dw	@3@1206
	dw	@3@1206
	dw	@3@1206
	dw	@3@1206
	dw	@3@1206
	dw	@3@1430
	dw	@3@1430
	dw	@3@1206
	dw	@3@1206
	dw	@3@1206
	dw	@3@1206
	dw	@3@1430
	dw	@3@1206
	dw	@3@1206
	dw	@3@1206
	dw	@3@1206
	dw	@3@1206
	dw	@3@1206
	dw	@3@1206
	dw	@3@1206
	dw	@3@1430
	dw	@3@1206
	dw	@3@1206
@3@C1346	label	word
	dw	@3@982
	dw	@3@1290
	dw	@3@142
	dw	@3@1346
	dw	@3@1374
	dw	@3@1402
@3@C1794	label	word
	dw	@3@842
	dw	@3@870
	dw	@3@758
	dw	@3@842
	dw	@3@870
	dw	@3@870
	dw	@3@842
	dw	@3@870
	dw	@3@786
	dw	@3@870
	dw	@3@842
	dw	@3@842
	dw	@3@870
	dw	@3@870
	dw	@3@842
	dw	@3@870
	dw	@3@842
	dw	@3@814
	dw	@3@842
	dw	@3@842
@3@C1890	label	word
	dw	@3@534
	dw	@3@562
	dw	@3@254
	dw	@3@534
	dw	@3@562
	dw	@3@562
	dw	@3@534
	dw	@3@562
	dw	@3@366
	dw	@3@562
	dw	@3@534
	dw	@3@534
	dw	@3@562
	dw	@3@562
	dw	@3@534
	dw	@3@562
	dw	@3@534
	dw	@3@450
	dw	@3@534
	dw	@3@534
   ;	
   ;	void setup_secret_level(void)
   ;	
	assume	cs:GAME_TEXT
@setup_secret_level$qv	proc	far
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
	jmp	short @4@114
@4@58:
   ;	
   ;	        if (all_secrets[i * 2 + 1] == cur_map)
   ;	
	mov	al,byte ptr [bp-1]
	mov	ah,0
	shl	ax,1
	mov	bx,ax
	mov	al,byte ptr DGROUP:_all_secrets[bx+1]
	cmp	al,byte ptr DGROUP:_cur_map
	je	short @4@142
	mov	al,byte ptr [bp-1]
	inc	al
	mov	byte ptr [bp-1],al
@4@114:
	cmp	byte ptr [bp-1],2
	jb	short @4@58
@4@142:
   ;	
   ;	            break;
   ;	    if (i == 2)
   ;	
	cmp	byte ptr [bp-1],2
	jne	short @4@198
   ;	
   ;	        terminate((uchar far *)"Invalid secret level exit.", 0);
   ;	
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+1600
	call	far ptr @terminate$qnuct1
	add	sp,8
@4@198:
   ;	
   ;	    cur_map = all_secrets[i * 2];
   ;	
	mov	al,byte ptr [bp-1]
	mov	ah,0
	shl	ax,1
	mov	bx,ax
	mov	al,byte ptr DGROUP:_all_secrets[bx]
	mov	byte ptr DGROUP:_cur_map,al
   ;	
   ;	}
   ;	
	leave	
	ret	
@setup_secret_level$qv	endp
   ;	
   ;	void exit_secret_level(void)
   ;	
	assume	cs:GAME_TEXT
@exit_secret_level$qv	proc	far
	enter	2,0
   ;	
   ;	{
   ;	    uchar i;
   ;	
   ;	    for (i = 0; i < 2; ++i)
   ;	
	mov	byte ptr [bp-1],0
	jmp	short @5@114
@5@58:
   ;	
   ;	        if (all_secrets[i * 2] == cur_map)
   ;	
	mov	al,byte ptr [bp-1]
	mov	ah,0
	shl	ax,1
	mov	bx,ax
	mov	al,byte ptr DGROUP:_all_secrets[bx]
	cmp	al,byte ptr DGROUP:_cur_map
	je	short @5@142
	mov	al,byte ptr [bp-1]
	inc	al
	mov	byte ptr [bp-1],al
@5@114:
	cmp	byte ptr [bp-1],2
	jb	short @5@58
@5@142:
   ;	
   ;	            break;
   ;	    if (i == 2)
   ;	
	cmp	byte ptr [bp-1],2
	jne	short @5@198
   ;	
   ;	        terminate((uchar far *)"Invalid secret level re-entrance.", 0);
   ;	
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+1627
	call	far ptr @terminate$qnuct1
	add	sp,8
@5@198:
   ;	
   ;	    cur_map = all_secrets[i * 2 + 1] + 1;
   ;	
	mov	al,byte ptr [bp-1]
	mov	ah,0
	shl	ax,1
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
   ;	
   ;	void start_room(uchar far *path)
   ;	
	assume	cs:GAME_TEXT
@start_room$qnuc	proc	far
	enter	6,0
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
	jge	short @6@86
   ;	
   ;	        shld_supply = 0x3C;
   ;	
	mov	word ptr DGROUP:_shld_supply,60
@6@86:
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
	jne	short @6@142
   ;	
   ;	        the_map = new tilemap(path, 0, 0);
   ;	
	push	0
	push	0
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	0
	push	0
	call	far ptr @tilemap@$bctr$qnucii
	add	sp,12
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
	jmp	short @6@170
@6@142:
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
@6@170:
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
	mov	word ptr [bp-2],0
	jmp	short @6@422
@6@226:
   ;	
   ;	        attr = the_map->tile_attr[pos].type;     /* 4-byte recs, word at +2 */
   ;	
	les	bx,dword ptr DGROUP:_the_map
	les	bx,dword ptr es:[bx+926]
	mov	ax,word ptr [bp-2]
	shl	ax,2
	add	bx,ax
	mov	ax,word ptr es:[bx+2]
	mov	word ptr [bp-4],ax
   ;	
   ;	        bits = attr & 0xC0;
   ;	
	mov	ax,word ptr [bp-4]
	and	ax,192
	mov	word ptr [bp-6],ax
   ;	
   ;	        if (bits) add_switch(pos, bits);
   ;	
	cmp	word ptr [bp-6],0
	je	short @6@282
	push	word ptr [bp-6]
	push	word ptr [bp-2]
	call	far ptr @add_switch$quiui
	add	sp,4
@6@282:
   ;	
   ;	        bits = attr & 0x300;
   ;	
	mov	ax,word ptr [bp-4]
	and	ax,768
	mov	word ptr [bp-6],ax
   ;	
   ;	        if (bits) add_door(pos, bits);
   ;	
	cmp	word ptr [bp-6],0
	je	short @6@338
	push	word ptr [bp-6]
	push	word ptr [bp-2]
	call	far ptr @add_door$quiui
	add	sp,4
@6@338:
   ;	
   ;	        bits = attr & 0x3F;
   ;	
	mov	ax,word ptr [bp-4]
	and	ax,63
	mov	word ptr [bp-6],ax
   ;	
   ;	        if (bits) add_barrel(pos, bits);
   ;	
	cmp	word ptr [bp-6],0
	je	short @6@394
	push	word ptr [bp-6]
	push	word ptr [bp-2]
	call	far ptr @add_barrel$quiui
	add	sp,4
@6@394:
	inc	word ptr [bp-2]
@6@422:
	les	bx,dword ptr DGROUP:_the_map
	mov	ax,word ptr es:[bx+148]
	cmp	ax,word ptr [bp-2]
	ja	short @6@226
   ;	
   ;	    }
   ;	    for (pos = 0; pos < (uint)the_map->map_size; ++pos) {
   ;	
	mov	word ptr [bp-2],0
	jmp	short @6@562
@6@478:
   ;	
   ;	        attr = the_map->tile_attr[pos].type;
   ;	
	les	bx,dword ptr DGROUP:_the_map
	les	bx,dword ptr es:[bx+926]
	mov	ax,word ptr [bp-2]
	shl	ax,2
	add	bx,ax
	mov	ax,word ptr es:[bx+2]
	mov	word ptr [bp-4],ax
   ;	
   ;	        bits = attr & 0xFC00;
   ;	
	mov	ax,word ptr [bp-4]
	and	ax,00000FC00h
	mov	word ptr [bp-6],ax
   ;	
   ;	        if (bits) add_map_item(pos, bits);
   ;	
	cmp	word ptr [bp-6],0
	je	short @6@534
	push	word ptr [bp-6]
	push	word ptr [bp-2]
	call	far ptr @add_map_item$quiui
	add	sp,4
@6@534:
	inc	word ptr [bp-2]
@6@562:
	les	bx,dword ptr DGROUP:_the_map
	mov	ax,word ptr es:[bx+148]
	cmp	ax,word ptr [bp-2]
	ja	short @6@478
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
	je	short @6@646
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
	jmp	short @6@674
@6@646:
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
@6@674:
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
	je	short @6@730
   ;	
   ;	        add_jason();
   ;	
	call	far ptr @add_jason$qv
@6@730:
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
	mov	word ptr [bp-2],10
	jmp	short @6@842
@6@758:
   ;	
   ;	        if (the_map->map_hdr[pos] != 0) {
   ;	
	mov	ax,word ptr [bp-2]
	shl	ax,1
	les	bx,dword ptr DGROUP:_the_map
	add	bx,ax
	cmp	word ptr es:[bx+36],0
	je	short @6@814
   ;	
   ;	            all_teleports[teleport_count][0] = the_map->map_hdr[pos];
   ;	
	mov	al,byte ptr DGROUP:_teleport_count
	mov	ah,0
	shl	ax,2
	mov	dx,word ptr [bp-2]
	shl	dx,1
	les	bx,dword ptr DGROUP:_the_map
	add	bx,dx
	mov	dx,word ptr es:[bx+36]
	mov	bx,ax
	mov	word ptr DGROUP:_all_teleports[bx],dx
   ;	
   ;	            all_teleports[teleport_count][1] = the_map->map_hdr[pos + 1];
   ;	
	mov	ax,word ptr [bp-2]
	inc	ax
	shl	ax,1
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
@6@814:
	add	word ptr [bp-2],2
@6@842:
	cmp	word ptr [bp-2],30
	jb	short @6@758
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
	mov	word ptr [bp-2],30
	jmp	short @6@982
@6@898:
   ;	
   ;	        if (the_map->map_hdr[pos] == 0)
   ;	
	mov	ax,word ptr [bp-2]
	shl	ax,1
	les	bx,dword ptr DGROUP:_the_map
	add	bx,ax
	cmp	word ptr es:[bx+36],0
	je	short @6@1010
   ;	
   ;	            break;
   ;	        map_messages[message_count]     = the_map->map_hdr[pos];
   ;	
	mov	al,byte ptr DGROUP:_message_count
	mov	ah,0
	shl	ax,1
	mov	dx,word ptr [bp-2]
	shl	dx,1
	les	bx,dword ptr DGROUP:_the_map
	add	bx,dx
	mov	dx,word ptr es:[bx+36]
	mov	bx,ax
	mov	word ptr DGROUP:_map_messages[bx],dx
   ;	
   ;	        map_messages[message_count + 1] = the_map->map_hdr[pos + 1];
   ;	
	mov	ax,word ptr [bp-2]
	inc	ax
	shl	ax,1
	les	bx,dword ptr DGROUP:_the_map
	add	bx,ax
	mov	ax,word ptr es:[bx+36]
	mov	dl,byte ptr DGROUP:_message_count
	mov	dh,0
	shl	dx,1
	mov	bx,dx
	mov	word ptr DGROUP:_map_messages[bx+2],ax
   ;	
   ;	        message_count += 2;
   ;	
	mov	al,byte ptr DGROUP:_message_count
	add	al,2
	mov	byte ptr DGROUP:_message_count,al
	add	word ptr [bp-2],2
@6@982:
	cmp	word ptr [bp-2],40
	jb	short @6@898
@6@1010:
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
	jg	short @6@1094
	cmp	word ptr DGROUP:_heavy_timer,0
	je	short @6@1094
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
@6@1094:
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
	leave	
	ret	
@start_room$qnuc	endp
   ;	
   ;	void de_doit(void)
   ;	
	assume	cs:GAME_TEXT
@de_doit$qv	proc	far
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
	jmp	@7@422
@7@58:
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
	je	short @7@198
   ;	
   ;	            if (barrier_count == 0x22)
   ;	
	cmp	byte ptr DGROUP:_barrier_count,34
	jne	short @7@142
   ;	
   ;	                terminate((uchar far *)"Too many barriers for list.", 0);
   ;	
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+1675
	call	far ptr @terminate$qnuct1
	add	sp,8
@7@142:
   ;	
   ;	            if (!act->inactive)
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	al,byte ptr es:[bx+82]
	shr	ax,5
	and	ax,1
	or	ax,ax
	jne	short @7@198
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
@7@198:
   ;	
   ;	        }
   ;	        if (act->in_window == 1 && (act->type & 1) && !(act->type & 0x10)) {
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	al,byte ptr es:[bx+82]
	shr	ax,1
	and	ax,1
	cmp	ax,1
	jne	short @7@394
	les	bx,dword ptr DGROUP:_act
	test	byte ptr es:[bx+53],1
	je	short @7@394
	les	bx,dword ptr DGROUP:_act
	mov	al,byte ptr es:[bx+53]
	mov	ah,0
	test	ax,16
	jne	short @7@394
   ;	
   ;	            if (shootable_count == 0x1D)
   ;	
	cmp	byte ptr DGROUP:_shootable_count,29
	jne	short @7@338
   ;	
   ;	                terminate((uchar far *)"Too many shootables.", 0);
   ;	
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+1703
	call	far ptr @terminate$qnuct1
	add	sp,8
@7@338:
   ;	
   ;	            if (!act->inactive)
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	al,byte ptr es:[bx+82]
	shr	ax,5
	and	ax,1
	or	ax,ax
	jne	short @7@394
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
@7@394:
	inc	word ptr [bp-2]
@7@422:
	les	bx,dword ptr DGROUP:_the_cast
	mov	al,byte ptr es:[bx]
	mov	ah,0
	cmp	ax,word ptr [bp-2]
	jbe short	@@20
	jmp	@7@58
@@20:
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
	je	short @7@506
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
	jmp	short @7@534
@7@506:
   ;	
   ;	    else
   ;	        centered = 0;
   ;	
	mov	byte ptr [bp-7],0
@7@534:
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
	shl	ax,1
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
	je	short @7@618
	cmp	byte ptr DGROUP:_cur_map,12
	je	short @7@618
	cmp	byte ptr DGROUP:_cur_map,21
	jne	short @7@646
@7@618:
   ;	
   ;	        update_boss_guage();
   ;	
	call	far ptr @update_boss_guage$qv
@7@646:
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
	shl	ax,1
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
	je	short @7@730
	les	bx,dword ptr DGROUP:_display
	mov	al,byte ptr es:[bx+6]
	mov	ah,0
	or	ax,ax
	jne	short @7@730
   ;	
   ;	        forcepal(palette, 1);
   ;	
	push	1
	push	ds
	push	offset DGROUP:_palette
	call	far ptr _forcepal
	add	sp,6
@7@730:
   ;	
   ;	    if (the_map->exploded == 2)
   ;	
	les	bx,dword ptr DGROUP:_the_map
	cmp	byte ptr es:[bx+924],2
	jne	short @7@786
   ;	
   ;	        display->pause(1);
   ;	
	push	1
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@pause$qui
	add	sp,6
@7@786:
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
	je short	@@21
	jmp	@7@1178
@@21:
   ;	
   ;	        if (ego->on_pos(finish_tile))
   ;	
	push	word ptr DGROUP:_finish_tile
	push	word ptr DGROUP:_ego+2
	push	word ptr DGROUP:_ego
	call	far ptr @m_actor@on_pos$qui
	add	sp,6
	or	al,al
	je	short @7@870
   ;	
   ;	            stop_room = 1;
   ;	
	mov	byte ptr DGROUP:_stop_room,1
@7@870:
   ;	
   ;	        if (secret_tile && ego->on_pos(secret_tile))
   ;	
	cmp	word ptr DGROUP:_secret_tile,0
	je	short @7@954
	push	word ptr DGROUP:_secret_tile
	push	word ptr DGROUP:_ego+2
	push	word ptr DGROUP:_ego
	call	far ptr @m_actor@on_pos$qui
	add	sp,6
	or	al,al
	je	short @7@954
   ;	
   ;	            stop_room = 6;
   ;	
	mov	byte ptr DGROUP:_stop_room,6
@7@954:
   ;	
   ;	        if (ego->on_pos(end_door_tile)) {
   ;	
	push	word ptr DGROUP:_end_door_tile
	push	word ptr DGROUP:_ego+2
	push	word ptr DGROUP:_ego
	call	far ptr @m_actor@on_pos$qui
	add	sp,6
	or	al,al
	je	short @7@1178
   ;	
   ;	            if (!end_door_ptr)
   ;	
	cmp	dword ptr DGROUP:_end_door_ptr,large 0
	jne	short @7@1038
   ;	
   ;	                terminate((uchar far *)"End door switch without door.", 0);
   ;	
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+1724
	call	far ptr @terminate$qnuct1
	add	sp,8
@7@1038:
   ;	
   ;	            if (!end_door_ptr->door_open && got_key)
   ;	
	les	bx,dword ptr DGROUP:_end_door_ptr
	mov	al,byte ptr es:[bx+82]
	shr	ax,6
	and	ax,1
	or	ax,ax
	jne	short @7@1122
	cmp	byte ptr DGROUP:_got_key,0
	je	short @7@1122
   ;	
   ;	                end_door_ptr->door_open = 1;
   ;	
	les	bx,dword ptr DGROUP:_end_door_ptr
	or	byte ptr es:[bx+82],64
@7@1122:
   ;	
   ;	            if (!got_key)
   ;	
	mov	al,byte ptr DGROUP:_got_key
	mov	ah,0
	or	ax,ax
	jne	short @7@1178
   ;	
   ;	                post_message(0);
   ;	
	push	0
	call	far ptr @post_message$quc
	pop	cx
@7@1178:
   ;	
   ;	        }
   ;	    }
   ;	
   ;	    if (heavy_timer) {
   ;	
	cmp	word ptr DGROUP:_heavy_timer,0
	je	short @7@1318
   ;	
   ;	        if (heavy_timer == 5)
   ;	
	cmp	word ptr DGROUP:_heavy_timer,5
	jne	short @7@1262
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
@7@1262:
   ;	
   ;	        if (heavy_timer == 1) {
   ;	
	cmp	word ptr DGROUP:_heavy_timer,1
	jne	short @7@1318
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
@7@1318:
   ;	
   ;	        }
   ;	    }
   ;	
   ;	    if (score_count++ == 0x28) {
   ;	
	mov	al,byte ptr DGROUP:_score_count
	inc	byte ptr DGROUP:_score_count
	cmp	al,40
	jne	short @7@1402
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
	jne	short @7@1402
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
@7@1402:
   ;	
   ;	    }
   ;	
   ;	    if (displayed_page == 0) {
   ;	
	cmp	byte ptr DGROUP:_displayed_page,0
	je short	@@22
	jmp	@7@2046
@@22:
   ;	
   ;	        if (cur_map == 0) {
   ;	
	cmp	byte ptr DGROUP:_cur_map,0
	je short	@@23
	jmp	@7@1794
@@23:
   ;	
   ;	            if (!jason_msg && cur_sub->on_pos(0x823)) {
   ;	
	mov	al,byte ptr DGROUP:_jason_msg
	mov	ah,0
	or	ax,ax
	jne	short @7@1542
	push	2083
	push	word ptr DGROUP:_cur_sub+2
	push	word ptr DGROUP:_cur_sub
	call	far ptr @m_actor@on_pos$qui
	add	sp,6
	or	al,al
	je	short @7@1542
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
@7@1542:
   ;	
   ;	            }
   ;	            if (!barrel_msg && cur_sub->on_pos(0x403)) {
   ;	
	mov	al,byte ptr DGROUP:_barrel_msg
	mov	ah,0
	or	ax,ax
	jne	short @7@1626
	push	1027
	push	word ptr DGROUP:_cur_sub+2
	push	word ptr DGROUP:_cur_sub
	call	far ptr @m_actor@on_pos$qui
	add	sp,6
	or	al,al
	je	short @7@1626
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
@7@1626:
   ;	
   ;	            }
   ;	            if (!gun_msg && cur_sub->on_pos(0xC23)) {
   ;	
	mov	al,byte ptr DGROUP:_gun_msg
	mov	ah,0
	or	ax,ax
	jne	short @7@1710
	push	3107
	push	word ptr DGROUP:_cur_sub+2
	push	word ptr DGROUP:_cur_sub
	call	far ptr @m_actor@on_pos$qui
	add	sp,6
	or	al,al
	je	short @7@1710
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
@7@1710:
   ;	
   ;	            }
   ;	            if (!cave_msg && cur_sub->on_pos(0x687)) {
   ;	
	mov	al,byte ptr DGROUP:_cave_msg
	mov	ah,0
	or	ax,ax
	jne	short @7@1794
	push	1671
	push	word ptr DGROUP:_cur_sub+2
	push	word ptr DGROUP:_cur_sub
	call	far ptr @m_actor@on_pos$qui
	add	sp,6
	or	al,al
	je	short @7@1794
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
@7@1794:
   ;	
   ;	            }
   ;	        }
   ;	        for (i = 0; i < message_count; i += 2) {
   ;	
	mov	word ptr [bp-2],0
	jmp	short @7@1934
@7@1822:
   ;	
   ;	            if (map_messages[i] && cur_sub->on_pos(map_messages[i])) {
   ;	
	mov	bx,word ptr [bp-2]
	shl	bx,1
	cmp	word ptr DGROUP:_map_messages[bx],0
	je	short @7@1906
	mov	bx,word ptr [bp-2]
	shl	bx,1
	push	word ptr DGROUP:_map_messages[bx]
	push	word ptr DGROUP:_cur_sub+2
	push	word ptr DGROUP:_cur_sub
	call	far ptr @m_actor@on_pos$qui
	add	sp,6
	or	al,al
	je	short @7@1906
   ;	
   ;	                post_message(map_messages[i + 1]);
   ;	
	mov	bx,word ptr [bp-2]
	inc	bx
	shl	bx,1
	mov	al,byte ptr DGROUP:_map_messages[bx]
	push	ax
	call	far ptr @post_message$quc
	pop	cx
   ;	
   ;	                map_messages[i] = 0;
   ;	
	mov	bx,word ptr [bp-2]
	shl	bx,1
	mov	word ptr DGROUP:_map_messages[bx],0
@7@1906:
	add	word ptr [bp-2],2
@7@1934:
	mov	al,byte ptr DGROUP:_message_count
	mov	ah,0
	cmp	ax,word ptr [bp-2]
	ja	short @7@1822
   ;	
   ;	            }
   ;	        }
   ;	        if (message_posted && --message_posted == 0)
   ;	
	cmp	byte ptr DGROUP:_message_posted,0
	je	short @7@2046
	mov	al,byte ptr DGROUP:_message_posted
	add	al,255
	mov	byte ptr DGROUP:_message_posted,al
	or	al,al
	jne	short @7@2046
   ;	
   ;	            clear_message();
   ;	
	call	far ptr @clear_message$qv
@7@2046:
   ;	
   ;	    }
   ;	
   ;	    if (cur_map == 0x15 && the_game->field_0F == 1) {
   ;	
	cmp	byte ptr DGROUP:_cur_map,21
	je short	@@24
	jmp	@7@2914
@@24:
	les	bx,dword ptr DGROUP:_the_game
	cmp	byte ptr es:[bx+15],1
	je short	@@25
	jmp	@7@2914
@@25:
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
	je short	@@26
	jmp	@7@2578
@@26:
   ;	
   ;	            if (control)
   ;	
	cmp	byte ptr DGROUP:_control,0
	je	short @7@2186
   ;	
   ;	                control = 0;
   ;	
	mov	byte ptr DGROUP:_control,0
@7@2186:
   ;	
   ;	            if (cur_sub->old_y != boss->center_y) {
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	mov	ax,word ptr es:[bx+6]
	les	bx,dword ptr DGROUP:_boss
	cmp	ax,word ptr es:[bx+10]
	je	short @7@2326
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
	jge	short @7@2270
   ;	
   ;	                    ego->y_speed = 1;
   ;	
	les	bx,dword ptr DGROUP:_ego
	mov	word ptr es:[bx+22],1
	jmp	@7@2914
@7@2270:
   ;	
   ;	                else
   ;	                    ego->y_speed = -1;
   ;	
	les	bx,dword ptr DGROUP:_ego
	mov	word ptr es:[bx+22],-1
	jmp	@7@2914
   ;	
   ;	            } else if (dist > 4) {
   ;	
	jmp	@7@2914
@7@2326:
	cmp	word ptr [bp-10],4
	jbe	short @7@2466
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
	jle	short @7@2410
   ;	
   ;	                    ego->x_speed = 4;
   ;	
	les	bx,dword ptr DGROUP:_ego
	mov	word ptr es:[bx+20],4
	jmp	@7@2914
@7@2410:
   ;	
   ;	                else
   ;	                    ego->x_speed = -4;
   ;	
	les	bx,dword ptr DGROUP:_ego
	mov	word ptr es:[bx+20],-4
	jmp	@7@2914
   ;	
   ;	            } else {
   ;	
	jmp	@7@2914
@7@2466:
   ;	
   ;	                the_game->field_10 = 1;
   ;	
	les	bx,dword ptr DGROUP:_the_game
	mov	byte ptr es:[bx+16],1
   ;	
   ;	                if (ego->direction) {
   ;	
	les	bx,dword ptr DGROUP:_ego
	cmp	byte ptr es:[bx+52],0
	je	short @7@2522
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
@7@2522:
   ;	
   ;	                }
   ;	                act = the_cast->add((uchar far *)"chain.l", 0, 0);
   ;	
	push	0
	push	0
	push	0
	push	0
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
	jmp	@7@2914
   ;	
   ;	            }
   ;	        } else {
   ;	
	jmp	@7@2914
@7@2578:
   ;	
   ;	            if (ego->target->current_loop == 2)
   ;	
	les	bx,dword ptr DGROUP:_ego
	les	bx,dword ptr es:[bx+44]
	cmp	byte ptr es:[bx+60],2
	jne	short @7@2634
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
@7@2634:
   ;	
   ;	            if (boss->x_speed == 0 && !ego->target->frame)
   ;	
	les	bx,dword ptr DGROUP:_boss
	cmp	word ptr es:[bx+20],0
	jne	short @7@2718
	les	bx,dword ptr DGROUP:_ego
	les	bx,dword ptr es:[bx+44]
	mov	al,byte ptr es:[bx+56]
	mov	ah,0
	or	ax,ax
	jne	short @7@2718
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
@7@2718:
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
	jg short	@@27
	jmp	@7@2914
@@27:
	mov	al,byte ptr DGROUP:_displayed_page
	mov	ah,0
	or	ax,ax
	je short	@@28
	jmp	@7@2914
@@28:
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
	jmp	short @7@2858
@7@2802:
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
@7@2858:
	cmp	dword ptr [bp-14],large 00001F400h
	jb	short @7@2802
   ;	
   ;	                }
   ;	                stop_room = 1;
   ;	
	mov	byte ptr DGROUP:_stop_room,1
@7@2914:
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
   ;	
   ;	void end_room(void)
   ;	
	assume	cs:GAME_TEXT
@end_room$qv	proc	far
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
   ;	
   ;	void end_game(void)
   ;	
	assume	cs:GAME_TEXT
@end_game$qv	proc	far
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
	je short	@@29
	jmp	@9@310
@@29:
   ;	
   ;	        if (random(2) == 0)
   ;	
	push	2
	call	far ptr @random$qi
	pop	cx
	or	ax,ax
	jne	short @9@114
   ;	
   ;	            display->show_pcx((uchar far *)"p_death1.pcx", 0, 0, -1);
   ;	
	push	-1
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+1797
	jmp	short @9@142
@9@114:
   ;	
   ;	        else
   ;	            display->show_pcx((uchar far *)"p_death2.pcx", 0, 0, -1);
   ;	
	push	-1
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+1810
@9@142:
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
	je	short @9@226
   ;	
   ;	            the_game->play_sound_file((uchar far *)"bubbles2");
   ;	
	push	ds
	push	offset DGROUP:s@+1823
	jmp	short @9@254
@9@226:
   ;	
   ;	        else
   ;	            the_game->play_sound_file((uchar far *)"dead");
   ;	
	push	ds
	push	offset DGROUP:s@+1832
@9@254:
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
@9@310:
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
	je	short @9@478
   ;	
   ;	        if (cheat_mode == 1) {
   ;	
	cmp	byte ptr DGROUP:_cheat_mode,1
	jne	short @9@394
   ;	
   ;	            i_inform((uchar far *)"You made the top 10!  Unfortunately\nyou are a big cheater, so no cigar.", 0, (uchar far *)0)
   ;	
	push	0
	push	0
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
	jmp	short @9@478
@9@394:
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
	jne	short @9@450
   ;	
   ;	                name = (uchar far *)"";
   ;	
	mov	word ptr [bp-4],ds
	mov	word ptr [bp-6],offset DGROUP:s@+1942
@9@450:
   ;	
   ;	            save_new_score(score, name, 0);
   ;	
	push	0
	push	word ptr [bp-4]
	push	word ptr [bp-6]
	push	dword ptr DGROUP:_score
	call	far ptr @save_new_score$qulnucuc
	add	sp,10
@9@478:
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
   ;	
   ;	void kill_ego(int arg0, int arg2)
   ;	
	assume	cs:GAME_TEXT
@kill_ego$qii	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (god_mode == 1)
   ;	
	cmp	byte ptr DGROUP:_god_mode,1
	jne short	@@30
	jmp	@10@954
@@30:
   ;	
   ;	        return;
   ;	    if (cur_sub->state == 6)
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	cmp	byte ptr es:[bx+61],6
	jne short	@@31
	jmp	@10@954
@@31:
   ;	
   ;	        return;
   ;	    if (ego->state == 2) {
   ;	
	les	bx,dword ptr DGROUP:_ego
	cmp	byte ptr es:[bx+61],2
	je short	@@32
	jmp	@10@198
@@32:
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
	je short	@@33
	jmp	@10@282
@@33:
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
	jmp	@10@282
   ;	
   ;	        }
   ;	    } else {
   ;	
	jmp	@10@282
@10@198:
   ;	
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
	jne	short @10@254
   ;	
   ;	            kill_jason();
   ;	
	call	far ptr @kill_jason$qv
@10@254:
   ;	
   ;	        control = 0;
   ;	
	mov	byte ptr DGROUP:_control,0
@10@282:
   ;	
   ;	    }
   ;	    if (death_type == 0 && ego->current_loop == 4)
   ;	
	cmp	byte ptr DGROUP:_death_type,0
	jne	short @10@366
	les	bx,dword ptr DGROUP:_ego
	cmp	byte ptr es:[bx+60],4
	jne	short @10@366
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
@10@366:
   ;	
   ;	    if (ego->current_loop > 4 && !ego->door_open)
   ;	
	les	bx,dword ptr DGROUP:_ego
	cmp	byte ptr es:[bx+60],4
	jbe	short @10@450
	les	bx,dword ptr DGROUP:_ego
	mov	al,byte ptr es:[bx+82]
	shr	ax,6
	and	ax,1
	or	ax,ax
	jne	short @10@450
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
	mov	dx,word ptr es:[bx+2]
	add	dx,ax
	push	dx
	les	bx,dword ptr DGROUP:_ego
	push	word ptr es:[bx+16]
	call	far ptr @random$qi
	pop	cx
	les	bx,dword ptr DGROUP:_ego
	mov	dx,word ptr es:[bx]
	add	dx,ax
	push	dx
	call	far ptr @add_bubble$qiii
	add	sp,6
@10@450:
   ;	
   ;	    if (ego->frame)
   ;	
	les	bx,dword ptr DGROUP:_ego
	cmp	byte ptr es:[bx+56],0
	je short	@@34
	jmp	@10@954
@@34:
   ;	
   ;	        return;
   ;	    if (death_type == 0)
   ;	
	cmp	byte ptr DGROUP:_death_type,0
	jne	short @10@534
   ;	
   ;	        the_game->remove_loop((uchar far *)"egodie2.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1988
	jmp	short @10@562
@10@534:
   ;	
   ;	    else
   ;	        the_game->remove_loop((uchar far *)"gotcha.l");
   ;	
	push	ds
	push	offset DGROUP:s@+1998
@10@562:
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
	je	short @10@730
	cmp	dx,1
	je	short @10@758
	jmp	short @10@814
@10@730:
   ;	
   ;	        case 0: the_game->play_sound_file((uchar far *)"cry");     break;
   ;	
	push	ds
	push	offset DGROUP:s@+2007
	jmp	short @10@786
@10@758:
   ;	
   ;	        case 1: the_game->play_sound_file((uchar far *)"villans"); break;
   ;	
	push	ds
	push	offset DGROUP:s@+2011
@10@786:
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_sound_file$qnuc
	add	sp,8
@10@814:
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
	jne	short @10@870
   ;	
   ;	        stop_room = 5;
   ;	
	mov	byte ptr DGROUP:_stop_room,5
   ;	
   ;	        return;
   ;	
	jmp	short @10@954
@10@870:
   ;	
   ;	    }
   ;	    stop_room = 3;
   ;	
	mov	byte ptr DGROUP:_stop_room,3
   ;	
   ;	    if (heavy_timer == 0)
   ;	
	cmp	word ptr DGROUP:_heavy_timer,0
	jne	short @10@926
   ;	
   ;	        shot_size = 0;
   ;	
	mov	byte ptr DGROUP:_shot_size,0
@10@926:
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
@10@954:
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@kill_ego$qii	endp
   ;	
   ;	void score_at(int x, int y, int val)
   ;	
	assume	cs:GAME_TEXT
@score_at$qiii	proc	far
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
	mov	bx,offset @11@C50
@11@86:
	mov	ax,word ptr cs:[bx]
	cmp	ax,word ptr [bp-6]
	je	short @11@170
	add	bx,2
	loop	short @11@86
	jmp	short @11@366
@11@170:
	jmp	word ptr cs:[bx+12]
@11@198:
   ;	
   ;	    {
   ;	    case 100:  s2 = (uchar far *)"scr_100.l";  break;
   ;	
	mov	word ptr [bp-2],ds
	mov	word ptr [bp-4],offset DGROUP:s@+2019
	jmp	short @11@394
@11@226:
   ;	
   ;	    case 500:  s2 = (uchar far *)"scr_500.l";  break;
   ;	
	mov	word ptr [bp-2],ds
	mov	word ptr [bp-4],offset DGROUP:s@+2029
	jmp	short @11@394
@11@254:
   ;	
   ;	    case 1000: s2 = (uchar far *)"scr_1000.l"; break;
   ;	
	mov	word ptr [bp-2],ds
	mov	word ptr [bp-4],offset DGROUP:s@+2039
	jmp	short @11@394
@11@282:
   ;	
   ;	    case 2000: s2 = (uchar far *)"scr_2000.l"; break;
   ;	
	mov	word ptr [bp-2],ds
	mov	word ptr [bp-4],offset DGROUP:s@+2050
	jmp	short @11@394
@11@310:
   ;	
   ;	    case 3000: s2 = (uchar far *)"scr_3000.l"; break;
   ;	
	mov	word ptr [bp-2],ds
	mov	word ptr [bp-4],offset DGROUP:s@+2061
	jmp	short @11@394
@11@338:
   ;	
   ;	    case 4000: s2 = (uchar far *)"scr_4000.l"; break;
   ;	
	mov	word ptr [bp-2],ds
	mov	word ptr [bp-4],offset DGROUP:s@+2072
	jmp	short @11@394
@11@366:
   ;	
   ;	    default:
   ;	        terminate((uchar far *)"Undefined score animation.", 0);
   ;	
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+2083
	call	far ptr @terminate$qnuct1
	add	sp,8
   ;	
   ;	        break;
   ;	
@11@394:
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
	push	0
	push	0
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
@11@C50	label	word
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
	dw	@11@198
	dw	@11@226
	dw	@11@254
	dw	@11@282
	dw	@11@310
	dw	@11@338
   ;	
   ;	void post_message(uchar msg)
   ;	
	assume	cs:GAME_TEXT
@post_message$quc	proc	far
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
	jne short	@@35
	jmp	@12@674
@@35:
   ;	
   ;	        return;
   ;	
   ;	    if (msg >= 10)
   ;	
	cmp	byte ptr [bp+6],10
	jae short	@@36
	jmp	@12@646
@@36:
   ;	
   ;	    {
   ;	        switch (msg - 10)
   ;	
	mov	al,byte ptr [bp+6]
	mov	ah,0
	add	ax,-10
	mov	bx,ax
	cmp	bx,4
	ja	short @12@282
	shl	bx,1
	jmp	word ptr cs:@12@C578[bx]
@12@170:
   ;	
   ;	        {
   ;	        case 0: s2 = (uchar far *)"msg_bar.l";  break;
   ;	
	mov	word ptr [bp-2],ds
	mov	word ptr [bp-4],offset DGROUP:s@+2110
	jmp	short @12@282
@12@198:
   ;	
   ;	        case 2: s2 = (uchar far *)"msg_gun.l";  break;
   ;	
	mov	word ptr [bp-2],ds
	mov	word ptr [bp-4],offset DGROUP:s@+2120
	jmp	short @12@282
@12@226:
   ;	
   ;	        case 3: s2 = (uchar far *)"msg_cave.l"; break;
   ;	
	mov	word ptr [bp-2],ds
	mov	word ptr [bp-4],offset DGROUP:s@+2130
	jmp	short @12@282
@12@254:
   ;	
   ;	        case 4: s2 = (uchar far *)"msg_jasn.l"; break;
   ;	
	mov	word ptr [bp-2],ds
	mov	word ptr [bp-4],offset DGROUP:s@+2141
@12@282:
   ;	
   ;	        }
   ;	        show_loop(s2, 0x69, 0x37, 0, page_offsets[displayed_page]);
   ;	
	mov	al,byte ptr DGROUP:_displayed_page
	mov	ah,0
	shl	ax,1
	mov	bx,ax
	push	word ptr DGROUP:_page_offsets[bx]
	push	0
	push	55
	push	105
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @show_loop$qnuciiucui
	add	sp,12
	jmp	short @12@338
@12@310:
   ;	
   ;	        while (gr_keys[0x1C] || the_game->field_2C)
   ;	            the_game->doit();
   ;	
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@doit$qv
	add	sp,4
@12@338:
	cmp	byte ptr DGROUP:_gr_keys+28,0
	jne	short @12@310
	les	bx,dword ptr DGROUP:_the_game
	cmp	byte ptr es:[bx+44],0
	jne	short @12@310
	jmp	short @12@450
@12@422:
   ;	
   ;	        while (!gr_keys[0x1C] && !the_game->field_2C)
   ;	            the_game->doit();
   ;	
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@doit$qv
	add	sp,4
@12@450:
	mov	al,byte ptr DGROUP:_gr_keys+28
	mov	ah,0
	or	ax,ax
	jne	short @12@562
	les	bx,dword ptr DGROUP:_the_game
	mov	al,byte ptr es:[bx+44]
	mov	ah,0
	or	ax,ax
	je	short @12@422
	jmp	short @12@562
@12@534:
   ;	
   ;	        while (gr_keys[0x1C] || the_game->field_2C)
   ;	            the_game->doit();
   ;	
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@doit$qv
	add	sp,4
@12@562:
	cmp	byte ptr DGROUP:_gr_keys+28,0
	jne	short @12@534
	les	bx,dword ptr DGROUP:_the_game
	cmp	byte ptr es:[bx+44],0
	jne	short @12@534
   ;	
   ;	        return;
   ;	
	jmp	@12@674
@12@646:
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
@12@674:
   ;	
   ;	}
   ;	
	leave	
	ret	
@post_message$quc	endp
@12@C578	label	word
	dw	@12@170
	dw	@12@282
	dw	@12@198
	dw	@12@226
	dw	@12@254
   ;	
   ;	void clear_message(void)
   ;	
	assume	cs:GAME_TEXT
@clear_message$qv	proc	far
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
   ;	
   ;	void add_map_item(uint arg_0, uint arg_2)
   ;	
	assume	cs:GAME_TEXT
@add_map_item$quiui	proc	far
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
	je	short @14@114
   ;	
   ;	    {
   ;	        add_map_pup(arg_0, arg_2 & 0xF);
   ;	
	mov	ax,word ptr [bp+8]
	and	ax,15
	push	ax
	push	word ptr [bp+6]
	call	far ptr @add_map_pup$quiui
@14@86:
	add	sp,4
   ;	
   ;	        return;
   ;	
	jmp	@14@3250
@14@114:
   ;	
   ;	    }
   ;	    var_5 = !(arg_0 & 1);
   ;	
	mov	ax,word ptr [bp+6]
	and	ax,1
	neg	ax
	sbb	ax,ax
	inc	ax
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
	mov	bx,offset @14@C114
@14@198:
	mov	ax,word ptr cs:[bx]
	cmp	ax,word ptr [bp-12]
	je	short @14@282
	add	bx,2
	loop	short @14@198
	jmp	@14@3222
@14@282:
	jmp	word ptr cs:[bx+62]
@14@310:
   ;	
   ;	    {
   ;	    case 0x10:                  /* coin / gem / bonus group */
   ;	    case 0x400:
   ;	    case 0x2800:
   ;	    case 0x5000:
   ;	        if (arg_2 == 0x2800)
   ;	
	cmp	word ptr [bp+8],10240
	jne	short @14@366
   ;	
   ;	            s2 = (uchar far *)"gem.l";
   ;	
	mov	word ptr [bp-2],ds
	mov	word ptr [bp-4],offset DGROUP:s@+2152
	jmp	short @14@618
@14@366:
   ;	
   ;	        else if (arg_2 == 0x5000)
   ;	
	cmp	word ptr [bp+8],20480
	jne	short @14@590
   ;	
   ;	        {
   ;	            switch (var_5)
   ;	
	mov	al,byte ptr [bp-5]
	mov	ah,0
	or	ax,ax
	je	short @14@506
	cmp	ax,1
	je	short @14@534
	jmp	short @14@618
@14@506:
   ;	
   ;	            {
   ;	            case 0: s2 = (uchar far *)"bonus1.l"; break;
   ;	
	mov	word ptr [bp-2],ds
	mov	word ptr [bp-4],offset DGROUP:s@+2158
	jmp	short @14@618
@14@534:
   ;	
   ;	            case 1: s2 = (uchar far *)"bonus2.l"; break;
   ;	
	mov	word ptr [bp-2],ds
	mov	word ptr [bp-4],offset DGROUP:s@+2167
	jmp	short @14@618
   ;	
   ;	            }
   ;	        }
   ;	
	jmp	short @14@618
@14@590:
   ;	
   ;	        else
   ;	            s2 = (uchar far *)"coin.l";
   ;	
	mov	word ptr [bp-2],ds
	mov	word ptr [bp-4],offset DGROUP:s@+2176
@14@618:
   ;	
   ;	        act = the_cast->add(s2, 0, do_coin);
   ;	
	push	seg @do_coin$qn7m_actor
	push	offset @do_coin$qn7m_actor
	push	0
	push	0
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
	jne	short @14@674
	les	bx,dword ptr DGROUP:_act
	or	byte ptr es:[bx+82],128
@14@674:
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
	jne short	@@37
	jmp	@14@3222
@@37:
@14@702:
	mov	al,byte ptr DGROUP:_goody_count
	inc	al
@14@730:
	mov	byte ptr DGROUP:_goody_count,al
	jmp	@14@3222
   ;	
   ;	        break;
   ;	
	jmp	@14@3222
@14@786:
   ;	
   ;	
   ;	    case 0x20:                  /* pod */
   ;	    case 0x1000:
   ;	        if (var_5)
   ;	
	cmp	byte ptr [bp-5],0
	je	short @14@842
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
	jmp	short @14@870
@14@842:
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
@14@870:
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
	jne	short @14@926
	jmp	@14@2634
@14@926:
	jmp	@14@2690
   ;	
   ;	        else var_4 += act->height;
   ;	        break;
   ;	
	jmp	@14@3222
@14@982:
   ;	
   ;	
   ;	    case 0x800:                 /* mine */
   ;	        act = the_cast->add((uchar far *)"mine.l", 0, do_mine1);
   ;	
	push	seg @do_mine1$qn7m_actor
	push	offset @do_mine1$qn7m_actor
	push	0
	push	0
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
@14@1010:
	push	ax
	jmp	@14@1514
@14@1038:
   ;	
   ;	        break;
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
	push	0
	push	0
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
	jmp	@14@3222
@14@1066:
   ;	
   ;	
   ;	    case 0x1400:                /* fish */
   ;	        if (var_5)
   ;	
	cmp	byte ptr [bp-5],0
	je	short @14@1122
   ;	
   ;	        {
   ;	            act = the_cast->add((uchar far *)"fish1r.l", 0, do_fish);
   ;	
	push	seg @do_fish$qn7m_actor
	push	offset @do_fish$qn7m_actor
	push	0
	push	0
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
	jmp	short @14@1150
@14@1122:
   ;	
   ;	        else
   ;	        {
   ;	            act = the_cast->add((uchar far *)"fish2r.l", 0, do_fish);
   ;	
	push	seg @do_fish$qn7m_actor
	push	offset @do_fish$qn7m_actor
	push	0
	push	0
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
@14@1150:
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
	jmp	@14@1514
@14@1178:
   ;	
   ;	        break;
   ;	
   ;	    case 0x1800:                /* weed */
   ;	        act = the_cast->add((uchar far *)"weed1.l", 0, 0);
   ;	
	push	0
	push	0
	push	0
	push	0
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
	jmp	@14@1010
@14@1206:
   ;	
   ;	        break;
   ;	
   ;	    case 0x1C00:                /* tulip */
   ;	        act = the_cast->add((uchar far *)"tulip.l", 0, do_tulip);
   ;	
	push	seg @do_tulip$qn7m_actor
	push	offset @do_tulip$qn7m_actor
	push	0
	push	0
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
   ;	        var_4 -= act->loop_data->frames[1]->h + 3;
   ;	
	les	bx,dword ptr DGROUP:_act
	les	bx,dword ptr es:[bx+70]
	les	bx,dword ptr es:[bx+10]
	mov	ax,word ptr es:[bx+4]
	add	ax,3
	jmp	@14@3054
@14@1234:
   ;	
   ;	        break;
   ;	
   ;	    case 0x2000:                /* chest */
   ;	        act = the_cast->add((uchar far *)"chest.l", 0, do_chest);
   ;	
	push	seg @do_chest$qn7m_actor
	push	offset @do_chest$qn7m_actor
	push	0
	push	0
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
	jmp	@14@730
@14@1262:
   ;	
   ;	        break;
   ;	
   ;	    case 0x2C00:                /* duct left/right */
   ;	        if (var_5)
   ;	
	cmp	byte ptr [bp-5],0
	je	short @14@1318
   ;	
   ;	        {
   ;	            act = the_cast->add((uchar far *)"duct_r.l", 0, do_duct_lr);
   ;	
	push	seg @do_duct_lr$qn7m_actor
	push	offset @do_duct_lr$qn7m_actor
	push	0
	push	0
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
	jmp	short @14@1346
@14@1318:
   ;	
   ;	        else
   ;	        {
   ;	            act = the_cast->add((uchar far *)"duct_l.l", 0, do_duct_lr);
   ;	
	push	seg @do_duct_lr$qn7m_actor
	push	offset @do_duct_lr$qn7m_actor
	push	0
	push	0
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
@14@1346:
   ;	
   ;	        }
   ;	        var_4 += 8;
   ;	
	add	word ptr [bp-10],8
	jmp	short @14@1486
@14@1374:
   ;	
   ;	        act->set_cycle(1, 1);
   ;	        break;
   ;	
   ;	    case 0x3000:                /* duct up/down */
   ;	        if (var_5)
   ;	
	cmp	byte ptr [bp-5],0
	je	short @14@1430
   ;	
   ;	        {
   ;	            act = the_cast->add((uchar far *)"duct_u.l", 0, do_duct_ud);
   ;	
	push	seg @do_duct_ud$qn7m_actor
	push	offset @do_duct_ud$qn7m_actor
	push	0
	push	0
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
	jmp	short @14@1458
@14@1430:
   ;	
   ;	        else
   ;	        {
   ;	            act = the_cast->add((uchar far *)"duct_d.l", 0, do_duct_ud);
   ;	
	push	seg @do_duct_ud$qn7m_actor
	push	offset @do_duct_ud$qn7m_actor
	push	0
	push	0
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
@14@1458:
   ;	
   ;	        }
   ;	        var_2 += 8;
   ;	
	add	word ptr [bp-8],8
@14@1486:
   ;	
   ;	        act->set_cycle(1, 1);
   ;	
	push	1
	push	1
@14@1514:
	push	word ptr DGROUP:_act+2
	push	word ptr DGROUP:_act
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
   ;	
   ;	        break;
   ;	
	jmp	@14@3222
@14@1542:
   ;	
   ;	
   ;	    case 0x2400:                /* pirana */
   ;	        if (var_5)
   ;	
	cmp	byte ptr [bp-5],0
	je	short @14@1598
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
	jmp	short @14@1626
@14@1598:
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
@14@1626:
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
@14@1654:
	push	word ptr DGROUP:_act+2
	push	word ptr DGROUP:_act
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
	jmp	@14@2634
@14@1682:
   ;	
   ;	        ++enemy_count;
   ;	        break;
   ;	
   ;	    case 0x3400:                /* block */
   ;	        if (var_5) act = the_cast->add((uchar far *)"block2.l", 0, do_block);
   ;	
	cmp	byte ptr [bp-5],0
	je	short @14@1738
	push	seg @do_block$qn7m_actor
	push	offset @do_block$qn7m_actor
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+2311
	jmp	short @14@1766
@14@1738:
   ;	
   ;	        else       act = the_cast->add((uchar far *)"block.l", 0, do_block);
   ;	
	push	seg @do_block$qn7m_actor
	push	offset @do_block$qn7m_actor
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+2320
@14@1766:
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
	jmp	@14@3222
@14@1822:
   ;	
   ;	
   ;	    case 0x3800:                /* face left/right */
   ;	    case 0x7000:
   ;	        if (arg_2 == 0x3800)
   ;	
	cmp	word ptr [bp+8],14336
	jne	short @14@1878
   ;	
   ;	        {
   ;	            act = the_cast->add((uchar far *)"face_r.l", 0, do_face);
   ;	
	push	seg @do_face$qn7m_actor
	push	offset @do_face$qn7m_actor
	push	0
	push	0
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
	jmp	short @14@1906
@14@1878:
   ;	
   ;	        else
   ;	        {
   ;	            act = the_cast->add((uchar far *)"face_l.l", 0, do_face);
   ;	
	push	seg @do_face$qn7m_actor
	push	offset @do_face$qn7m_actor
	push	0
	push	0
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
@14@1906:
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
	jmp	@14@2634
@14@1934:
   ;	
   ;	        ++enemy_count;
   ;	        break;
   ;	
   ;	    case 0x3C00:                /* serpent */
   ;	        if (var_5)
   ;	
	cmp	byte ptr [bp-5],0
	je	short @14@1990
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
	jmp	short @14@2018
@14@1990:
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
@14@2018:
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
	jmp	@14@1654
@14@2046:
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
	je	short @14@2102
	les	bx,dword ptr DGROUP:_act
	mov	byte ptr es:[bx+52],0
	les	bx,dword ptr DGROUP:_act
	mov	word ptr es:[bx+20],2
	jmp	short @14@2130
@14@2102:
   ;	
   ;	        else       { act->direction = 1; act->x_speed = -2; }
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	byte ptr es:[bx+52],1
	les	bx,dword ptr DGROUP:_act
	mov	word ptr es:[bx+20],-2
@14@2130:
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
	jmp	@14@2634
@14@2158:
   ;	
   ;	        ++enemy_count;
   ;	        break;
   ;	
   ;	    case 0x4400:                /* gun piece */
   ;	        if (the_game->field_09 == 1 || gun_count == 4)
   ;	
	les	bx,dword ptr DGROUP:_the_game
	cmp	byte ptr es:[bx+9],1
	je	short @14@2214
	cmp	byte ptr DGROUP:_gun_count,4
	jne	short @14@2242
@14@2214:
   ;	
   ;	        {
   ;	            add_barrel(arg_0, 0x10);
   ;	
	push	16
	push	word ptr [bp+6]
	call	far ptr @add_barrel$quiui
	jmp	@14@86
@14@2242:
   ;	
   ;	            return;
   ;	        }
   ;	        switch (gun_count)
   ;	
	mov	al,byte ptr DGROUP:_gun_count
	mov	ah,0
	mov	bx,ax
	cmp	bx,3
	ja	short @14@2438
	shl	bx,1
	jmp	word ptr cs:@14@C2370[bx]
@14@2326:
   ;	
   ;	        {
   ;	        case 0: s2 = (uchar far *)"piece_1.l"; break;
   ;	
	mov	word ptr [bp-2],ds
	mov	word ptr [bp-4],offset DGROUP:s@+2371
	jmp	short @14@2438
@14@2354:
   ;	
   ;	        case 1: s2 = (uchar far *)"piece_2.l"; break;
   ;	
	mov	word ptr [bp-2],ds
	mov	word ptr [bp-4],offset DGROUP:s@+2381
	jmp	short @14@2438
@14@2382:
   ;	
   ;	        case 2: s2 = (uchar far *)"piece_3.l"; break;
   ;	
	mov	word ptr [bp-2],ds
	mov	word ptr [bp-4],offset DGROUP:s@+2391
	jmp	short @14@2438
@14@2410:
   ;	
   ;	        case 3: s2 = (uchar far *)"piece_4.l"; break;
   ;	
	mov	word ptr [bp-2],ds
	mov	word ptr [bp-4],offset DGROUP:s@+2401
@14@2438:
   ;	
   ;	        }
   ;	        act = the_cast->add(s2, 0, do_gun_piece);
   ;	
	push	seg @do_gun_piece$qn7m_actor
	push	offset @do_gun_piece$qn7m_actor
	push	0
	push	0
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
	jmp	@14@702
@14@2466:
   ;	
   ;	        ++goody_count;
   ;	        break;
   ;	
   ;	    case 0x4800:                /* jelly */
   ;	        act = the_cast->add((uchar far *)"jelly.l", 0, do_jelly);
   ;	
	push	seg @do_jelly$qn7m_actor
	push	offset @do_jelly$qn7m_actor
	push	0
	push	0
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
	jmp	@14@2606
@14@2494:
   ;	
   ;	        var_2 -= act->width / 2;
   ;	        ++enemy_count;
   ;	        break;
   ;	
   ;	    case 0x4C00:                /* shark */
   ;	        if (var_5)
   ;	
	cmp	byte ptr [bp-5],0
	je	short @14@2550
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
	jmp	short @14@2578
@14@2550:
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
@14@2578:
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
@14@2606:
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
@14@2634:
   ;	
   ;	        ++enemy_count;
   ;	
	mov	al,byte ptr DGROUP:_enemy_count
	inc	al
	mov	byte ptr DGROUP:_enemy_count,al
   ;	
   ;	        break;
   ;	
	jmp	@14@3222
@14@2662:
   ;	
   ;	
   ;	    case 0x5400:                /* tentacle */
   ;	        act = the_cast->add((uchar far *)"tent_out.l", 0, do_tentacle);
   ;	
	push	seg @do_tentacle$qn7m_actor
	push	offset @do_tentacle$qn7m_actor
	push	0
	push	0
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
@14@2690:
	les	bx,dword ptr DGROUP:_act
	mov	ax,word ptr es:[bx+18]
	add	word ptr [bp-10],ax
   ;	
   ;	        break;
   ;	
	jmp	@14@3222
@14@2718:
   ;	
   ;	
   ;	    case 0x5800:                /* spikes */
   ;	        if (var_5)
   ;	
	cmp	byte ptr [bp-5],0
	je	short @14@2774
   ;	
   ;	        {
   ;	            act = the_cast->add((uchar far *)"spikes_d.l", 0, do_spikes);
   ;	
	push	seg @do_spikes$qn7m_actor
	push	offset @do_spikes$qn7m_actor
	push	0
	push	0
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
	jmp	short @14@2802
@14@2774:
   ;	
   ;	        else
   ;	        {
   ;	            act = the_cast->add((uchar far *)"spikes_u.l", 0, do_spikes);
   ;	
	push	seg @do_spikes$qn7m_actor
	push	offset @do_spikes$qn7m_actor
	push	0
	push	0
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
@14@2802:
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
	jmp	@14@2998
@14@2830:
   ;	
   ;	        var_2 += act->width;
   ;	        break;
   ;	
   ;	    case 0x5C00:                /* statue */
   ;	        act = the_cast->add((uchar far *)"statue.l", 0, 0);
   ;	
	push	0
	push	0
	push	0
	push	0
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
	jmp	@14@3054
@14@2858:
   ;	
   ;	        break;
   ;	
   ;	    case 0x6000:                /* fire pit */
   ;	        act = the_cast->add((uchar far *)"fire_pit.l", 0, do_fire_pit);
   ;	
	push	seg @do_fire_pit$qn7m_actor
	push	offset @do_fire_pit$qn7m_actor
	push	0
	push	0
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
	je	short @14@2914
	les	bx,dword ptr DGROUP:_act
	mov	word ptr es:[bx+36],80
	jmp	short @14@2942
@14@2914:
   ;	
   ;	        else       act->counter_26 = 0x28;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	word ptr es:[bx+36],40
@14@2942:
   ;	
   ;	        var_4 -= 5;
   ;	
	sub	word ptr [bp-10],5
   ;	
   ;	        break;
   ;	
	jmp	@14@3222
@14@2970:
   ;	
   ;	
   ;	    case 0x6400:                /* shuttle */
   ;	        act = the_cast->add((uchar far *)"shutl_l.l", 0, do_shuttle);
   ;	
	push	seg @do_shuttle$qn7m_actor
	push	offset @do_shuttle$qn7m_actor
	push	0
	push	0
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
@14@2998:
   ;	
   ;	        var_2 += act->width;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	ax,word ptr es:[bx+16]
	add	word ptr [bp-8],ax
   ;	
   ;	        break;
   ;	
	jmp	@14@3222
@14@3026:
   ;	
   ;	
   ;	    case 0x6800:                /* clam */
   ;	        act = the_cast->add((uchar far *)"clam.l", 0, do_clam);
   ;	
	push	seg @do_clam$qn7m_actor
	push	offset @do_clam$qn7m_actor
	push	0
	push	0
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
@14@3054:
	sub	word ptr [bp-10],ax
   ;	
   ;	        break;
   ;	
	jmp	@14@3222
@14@3082:
   ;	
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
   ;	        var_2 -= act->loop_data->frames[2]->w / 2;
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
	jmp	@14@3222
@14@3110:
   ;	
   ;	
   ;	    case 0x7400:                /* ship */
   ;	        if (var_5)
   ;	
	cmp	byte ptr [bp-5],0
	je	short @14@3166
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
	jmp	short @14@3194
@14@3166:
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
@14@3194:
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
@14@3222:
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
@14@3250:
   ;	
   ;	}
   ;	
	leave	
	ret	
@add_map_item$quiui	endp
@14@C2370	label	word
	dw	@14@2326
	dw	@14@2354
	dw	@14@2382
	dw	@14@2410
@14@C114	label	word
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
	dw	@14@310
	dw	@14@786
	dw	@14@310
	dw	@14@982
	dw	@14@1038
	dw	@14@786
	dw	@14@1066
	dw	@14@1178
	dw	@14@1206
	dw	@14@1234
	dw	@14@1542
	dw	@14@310
	dw	@14@1262
	dw	@14@1374
	dw	@14@1682
	dw	@14@1822
	dw	@14@1934
	dw	@14@2046
	dw	@14@2158
	dw	@14@2466
	dw	@14@2494
	dw	@14@310
	dw	@14@2662
	dw	@14@2718
	dw	@14@2830
	dw	@14@2858
	dw	@14@2970
	dw	@14@3026
	dw	@14@3082
	dw	@14@1822
	dw	@14@3110
   ;	
   ;	void add_barrel(uint arg_0, uint arg_2)
   ;	
	assume	cs:GAME_TEXT
@add_barrel$quiui	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (arg_2 & 0xF)
   ;	
	test	word ptr [bp+8],15
	je	short @15@86
   ;	
   ;	        strcpy((char *)_tmp, "barrel2.l");
   ;	
	push	ds
	push	offset DGROUP:s@+2533
	jmp	short @15@254
@15@86:
   ;	
   ;	    else
   ;	        switch ((arg_2 + goody_count + enemy_count) & 1)
   ;	
	mov	al,byte ptr DGROUP:_goody_count
	mov	ah,0
	mov	dx,word ptr [bp+8]
	add	dx,ax
	mov	al,byte ptr DGROUP:_enemy_count
	mov	ah,0
	add	dx,ax
	and	dx,1
	or	dx,dx
	je	short @15@198
	cmp	dx,1
	je	short @15@226
	jmp	short @15@282
@15@198:
   ;	
   ;	        {
   ;	        case 0: strcpy((char *)_tmp, "barrel1.l"); break;
   ;	
	push	ds
	push	offset DGROUP:s@+2543
	jmp	short @15@254
@15@226:
   ;	
   ;	        case 1: strcpy((char *)_tmp, "barrel3.l"); break;
   ;	
	push	ds
	push	offset DGROUP:s@+2553
@15@254:
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _strcpy
	add	sp,8
@15@282:
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
	je	short @15@338
	mov	al,byte ptr DGROUP:_goody_count
	inc	al
	mov	byte ptr DGROUP:_goody_count,al
@15@338:
   ;	
   ;	    if (arg_2 & 0x10) ++goody_count;
   ;	
	test	word ptr [bp+8],16
	je	short @15@394
	mov	al,byte ptr DGROUP:_goody_count
	inc	al
	mov	byte ptr DGROUP:_goody_count,al
@15@394:
   ;	
   ;	    if (arg_2 & 0x20) ++enemy_count;
   ;	
	test	word ptr [bp+8],32
	je	short @15@450
	mov	al,byte ptr DGROUP:_enemy_count
	inc	al
	mov	byte ptr DGROUP:_enemy_count,al
@15@450:
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@add_barrel$quiui	endp
   ;	
   ;	void add_map_pup(uint arg_0, uint arg_2)
   ;	
	assume	cs:GAME_TEXT
@add_map_pup$quiui	proc	far
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
	jbe short	@@38
	jmp	@16@730
@@38:
	shl	bx,1
	jmp	word ptr cs:@16@C658[bx]
@16@114:
   ;	
   ;	    {
   ;	    case 1:
   ;	        strcpy((char *)_tmp, "pu_air.l");
   ;	
	push	ds
	push	offset DGROUP:s@+2563
@16@142:
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _strcpy
	jmp	@16@758
@16@170:
   ;	
   ;	        break;
   ;	    case 2:
   ;	        strcpy((char *)_tmp, "pu_shld.l");
   ;	
	push	ds
	push	offset DGROUP:s@+2572
	jmp	short @16@142
@16@198:
   ;	
   ;	        break;
   ;	    case 3:
   ;	        if (heavy_timer) goto skip;
   ;	
	cmp	word ptr DGROUP:_heavy_timer,0
	je short	@@39
	jmp	@16@814
@@39:
   ;	
   ;	        strcpy((char *)_tmp, "pu_fire.l");
   ;	
	push	ds
	push	offset DGROUP:s@+2582
	jmp	short @16@142
@16@254:
   ;	
   ;	        break;
   ;	    case 4:
   ;	        if (top_fire) goto skip;
   ;	
	cmp	byte ptr DGROUP:_top_fire,0
	je short	@@40
	jmp	@16@814
@@40:
   ;	
   ;	        strcpy((char *)_tmp, "pu_top.l");
   ;	
	push	ds
	push	offset DGROUP:s@+2592
	jmp	short @16@142
@16@310:
   ;	
   ;	        break;
   ;	    case 5:
   ;	        if (the_game->field_08 != 1)
   ;	
	les	bx,dword ptr DGROUP:_the_game
	cmp	byte ptr es:[bx+8],1
	jne short	@@41
	jmp	@16@814
@@41:
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
	jmp	short @16@786
   ;	
   ;	        else
   ;	            goto skip;
   ;	
	jmp	@16@814
   ;	
   ;	        break;
   ;	
	jmp	short @16@786
@16@422:
   ;	
   ;	    case 6:
   ;	        strcpy((char *)_tmp, "pu_key.l");
   ;	
	push	ds
	push	offset DGROUP:s@+2610
	jmp	short @16@142
@16@450:
   ;	
   ;	        break;
   ;	    case 7:
   ;	        if (auto_fire != 1)
   ;	
	cmp	byte ptr DGROUP:_auto_fire,1
	jne short	@@42
	jmp	@16@814
@@42:
   ;	
   ;	            strcpy((char *)_tmp, "pu_auto.l");
   ;	
	push	ds
	push	offset DGROUP:s@+2619
	jmp	@16@142
   ;	
   ;	        else
   ;	            goto skip;
   ;	
	jmp	@16@814
   ;	
   ;	        break;
   ;	
	jmp	short @16@786
@16@562:
   ;	
   ;	    case 8:
   ;	        if (jason_present) goto skip;
   ;	
	cmp	byte ptr DGROUP:_jason_present,0
	je short	@@43
	jmp	@16@814
@@43:
   ;	
   ;	        strcpy((char *)_tmp, "pu_jason.l");
   ;	
	push	ds
	push	offset DGROUP:s@+2629
	jmp	@16@142
@16@618:
   ;	
   ;	        break;
   ;	    case 9:
   ;	        if (jason_present != 0)
   ;	
	cmp	byte ptr DGROUP:_jason_present,0
	jne short	@@44
	jmp	@16@814
@@44:
   ;	
   ;	        {
   ;	            if (jason_fire != 1)
   ;	
	cmp	byte ptr DGROUP:_jason_fire,1
	jne short	@@45
	jmp	@16@814
@@45:
   ;	
   ;	            {
   ;	                strcpy((char *)_tmp, "pu_jf.l");
   ;	
	push	ds
	push	offset DGROUP:s@+2640
	jmp	@16@142
   ;	
   ;	                break;
   ;	            }
   ;	        }
   ;	        goto skip;
   ;	
	jmp	@16@814
@16@730:
   ;	
   ;	    default:
   ;	        terminate((uchar far *)"Pup not defined!", 0);
   ;	
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+2648
	call	far ptr @terminate$qnuct1
@16@758:
	add	sp,8
@16@786:
   ;	
   ;	    }
   ;	    act = the_cast->add(_tmp, 0, do_pup);
   ;	
	push	seg @do_pup$qn7m_actor
	push	offset @do_pup$qn7m_actor
	push	0
	push	0
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
   ;	
   ;	    return;
   ;	
	jmp	short @16@842
@16@814:
   ;	
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
@16@842:
   ;	
   ;	}
   ;	
	leave	
	ret	
@add_map_pup$quiui	endp
@16@C658	label	word
	dw	@16@114
	dw	@16@170
	dw	@16@198
	dw	@16@254
	dw	@16@310
	dw	@16@422
	dw	@16@450
	dw	@16@562
	dw	@16@618
   ;	
   ;	void hook_up_switches(void)
   ;	
	assume	cs:GAME_TEXT
@hook_up_switches$qv	proc	far
	enter	4,0
   ;	
   ;	{
   ;	    int i, j;
   ;	
   ;	    for (i = 0; i < the_cast->count; ++i)
   ;	
	mov	word ptr [bp-2],0
	jmp	@17@338
@17@58:
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
	jne short	@@46
	jmp	@17@310
@@46:
   ;	
   ;	            for (j = 0; j < the_cast->count; ++j)
   ;	
	mov	word ptr [bp-4],0
	jmp	@17@282
@17@114:
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
	je	short @17@254
	mov	ax,word ptr [bp-4]
	shl	ax,2
	les	bx,dword ptr DGROUP:_the_cast
	add	bx,ax
	les	bx,dword ptr es:[bx+2]
	mov	ax,word ptr es:[bx+34]
	les	bx,dword ptr DGROUP:_act
	cmp	ax,word ptr es:[bx+34]
	jne	short @17@254
   ;	
   ;	                {
   ;	                    if (act->target == 0)
   ;	
	les	bx,dword ptr DGROUP:_act
	cmp	dword ptr es:[bx+44],large 0
	jne	short @17@226
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
	jmp	short @17@254
@17@226:
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
@17@254:
	inc	word ptr [bp-4]
@17@282:
	les	bx,dword ptr DGROUP:_the_cast
	mov	al,byte ptr es:[bx]
	mov	ah,0
	cmp	ax,word ptr [bp-4]
	jle short	@@47
	jmp	@17@114
@@47:
@17@310:
	inc	word ptr [bp-2]
@17@338:
	les	bx,dword ptr DGROUP:_the_cast
	mov	al,byte ptr es:[bx]
	mov	ah,0
	cmp	ax,word ptr [bp-2]
	jle short	@@48
	jmp	@17@58
@@48:
   ;	
   ;	                }
   ;	            }
   ;	    }
   ;	}
   ;	
	leave	
	ret	
@hook_up_switches$qv	endp
   ;	
   ;	void add_switch(uint arg_0, uint arg_2)
   ;	
	assume	cs:GAME_TEXT
@add_switch$quiui	proc	far
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
	push	0
	push	0
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
   ;	
   ;	void add_door(uint arg_0, uint arg_2)
   ;	
	assume	cs:GAME_TEXT
@add_door$quiui	proc	far
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
	jne	short @19@86
   ;	
   ;	    {
   ;	        act = the_cast->add((uchar far *)"end_dr.l", 0, do_door);
   ;	
	push	seg @do_door$qn7m_actor
	push	offset @do_door$qn7m_actor
	push	0
	push	0
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
	jmp	short @19@114
@19@86:
   ;	
   ;	    else
   ;	        act = the_cast->add((uchar far *)"door_ud.l", 0, do_door);
   ;	
	push	seg @do_door$qn7m_actor
	push	offset @do_door$qn7m_actor
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+2683
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_act+2,dx
	mov	word ptr DGROUP:_act,ax
@19@114:
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
   ;	
   ;	void add_bubble(int arg_0, int arg_2, int arg_4)
   ;	
	assume	cs:GAME_TEXT
@add_bubble$qiii	proc	far
	enter	2,0
   ;	
   ;	{
   ;	    byte var_1;
   ;	
   ;	    if (the_cast->count > 0x7D) return;
   ;	
	les	bx,dword ptr DGROUP:_the_cast
	cmp	byte ptr es:[bx],125
	jbe short	@@49
	jmp	@20@198
@@49:
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
	jne	short @20@114
   ;	
   ;	        act = the_cast->add((uchar far *)"bubmd.l", 0, do_bubble);
   ;	
	push	seg @do_bubble$qn7m_actor
	push	offset @do_bubble$qn7m_actor
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+2693
	jmp	short @20@142
@20@114:
   ;	
   ;	    else
   ;	        act = the_cast->add((uchar far *)"bubsm.l", 0, do_bubble);
   ;	
	push	seg @do_bubble$qn7m_actor
	push	offset @do_bubble$qn7m_actor
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+2701
@20@142:
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
@20@198:
   ;	
   ;	}
   ;	
	leave	
	ret	
@add_bubble$qiii	endp
   ;	
   ;	void add_explosion(int arg_0, int arg_2, uchar arg_4, uchar far *arg_6)
   ;	
	assume	cs:GAME_TEXT
@add_explosion$qiiucnuc	proc	far
	enter	2,0
   ;	
   ;	{
   ;	    uchar var_1, var_2;
   ;	
   ;	    switch (arg_4)
   ;	
	mov	al,byte ptr [bp+10]
	mov	ah,0
	mov	bx,ax
	cmp	bx,5
	ja	short @21@254
	shl	bx,1
	jmp	word ptr cs:@21@C50[bx]
@21@114:
   ;	
   ;	    {
   ;	        case 0: var_1 = 3; var_2 = 0; break;
   ;	
	mov	byte ptr [bp-1],3
@21@142:
	mov	byte ptr [bp-2],0
	jmp	short @21@310
@21@170:
   ;	
   ;	        case 1: var_1 = 3; var_2 = 1; break;
   ;	
	mov	byte ptr [bp-1],3
	jmp	short @21@282
@21@198:
   ;	
   ;	        case 2: var_1 = 5; var_2 = 1; break;
   ;	
	mov	byte ptr [bp-1],5
	jmp	short @21@282
@21@226:
   ;	
   ;	        case 5: var_1 = 5; var_2 = 0; break;
   ;	
	mov	byte ptr [bp-1],5
	jmp	short @21@142
@21@254:
   ;	
   ;	        case 3:
   ;	        case 4:
   ;	        default: var_1 = 2; var_2 = 1; break;
   ;	
	mov	byte ptr [bp-1],2
@21@282:
	mov	byte ptr [bp-2],1
@21@310:
   ;	
   ;	    }
   ;	    if (arg_6 != 0)
   ;	
	cmp	dword ptr [bp+12],large 0
	je	short @21@366
   ;	
   ;	        the_game->play_sound(arg_6, 5);
   ;	
	push	5
	push	word ptr [bp+14]
	push	word ptr [bp+12]
	jmp	short @21@394
@21@366:
   ;	
   ;	    else
   ;	        the_game->play_sound(_all_explosions[arg_4][1], var_1);
   ;	
	mov	al,byte ptr [bp-1]
	push	ax
	mov	al,byte ptr [bp+10]
	mov	ah,0
	shl	ax,3
	mov	bx,ax
	push	word ptr DGROUP:__all_explosions[bx+6]
	push	word ptr DGROUP:__all_explosions[bx+4]
@21@394:
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_sound$qnucuc
	add	sp,10
   ;	
   ;	    act = the_cast->add(_all_explosions[arg_4][0], 0, do_exp);
   ;	
	push	seg @do_exp$qn7m_actor
	push	offset @do_exp$qn7m_actor
	push	0
	push	0
	mov	al,byte ptr [bp+10]
	mov	ah,0
	shl	ax,3
	mov	bx,ax
	push	word ptr DGROUP:__all_explosions[bx+2]
	push	word ptr DGROUP:__all_explosions[bx]
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_act+2,dx
	mov	word ptr DGROUP:_act,ax
   ;	
   ;	    act->set_cycle(var_2, 2);
   ;	
	push	2
	mov	al,byte ptr [bp-2]
	push	ax
	push	word ptr DGROUP:_act+2
	push	word ptr DGROUP:_act
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
   ;	
   ;	    act->set_xy(arg_0 - act->width / 2, arg_2 - act->height / 2);
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	ax,word ptr es:[bx+18]
	cwd	
	sub	ax,dx
	sar	ax,1
	mov	dx,word ptr [bp+8]
	sub	dx,ax
	push	dx
	les	bx,dword ptr DGROUP:_act
	mov	ax,word ptr es:[bx+16]
	cwd	
	sub	ax,dx
	sar	ax,1
	mov	dx,word ptr [bp+6]
	sub	dx,ax
	push	dx
	push	word ptr DGROUP:_act+2
	push	word ptr DGROUP:_act
	call	far ptr @m_actor@set_xy$qii
	add	sp,8
   ;	
   ;	    if (arg_0 & 1)
   ;	
	test	word ptr [bp+6],1
	je	short @21@478
   ;	
   ;	        add_bubble(arg_0, arg_2 - 3, 0);
   ;	
	push	0
	mov	ax,word ptr [bp+8]
	add	ax,-3
	push	ax
	push	word ptr [bp+6]
	push	cs
	call	near ptr @add_bubble$qiii
	add	sp,6
@21@478:
   ;	
   ;	}
   ;	
	leave	
	ret	
@add_explosion$qiiucnuc	endp
@21@C50	label	word
	dw	@21@114
	dw	@21@170
	dw	@21@198
	dw	@21@254
	dw	@21@254
	dw	@21@226
   ;	
   ;	void add_missile(m_actor far *arg_0, uchar arg_4, int arg_6)
   ;	
	assume	cs:GAME_TEXT
@add_missile$qn7m_actoruci	proc	far
	enter	4,0
	push	si
   ;	
   ;	{
   ;	    int var_2, var_4;
   ;	
   ;	    if (arg_0->in_window == 0)
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,1
	and	ax,1
	or	ax,ax
	jne short	@@50
	jmp	@22@702
@@50:
   ;	
   ;	        return;
   ;	    if (arg_4 == 0x63)
   ;	
	cmp	byte ptr [bp+10],99
	jne	short @22@170
   ;	
   ;	    {
   ;	        if (ego->on_tile(0x100) != 0)
   ;	
	push	256
	push	word ptr DGROUP:_ego+2
	push	word ptr DGROUP:_ego
	call	far ptr @m_actor@on_tile$qi
	add	sp,6
	or	al,al
	jne short	@@51
	jmp	@22@562
@@51:
   ;	
   ;	            return;
   ;	
	jmp	@22@702
   ;	
   ;	    }
   ;	
	jmp	@22@562
@22@170:
   ;	
   ;	    else
   ;	    {
   ;	        if (arg_0->direction == 1)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+52],1
	jne	short @22@226
   ;	
   ;	        {
   ;	            act = the_cast->add(_all_projectiles[arg_4].spr_l, 0, do_missle);
   ;	
	push	seg @do_missle$qn7m_actor
	push	offset @do_missle$qn7m_actor
	push	0
	push	0
	mov	al,byte ptr [bp+10]
	mov	ah,0
	imul	ax,ax,22
	mov	bx,ax
	push	word ptr DGROUP:__all_projectiles[bx+6]
	push	word ptr DGROUP:__all_projectiles[bx+4]
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_act+2,dx
	mov	word ptr DGROUP:_act,ax
   ;	
   ;	            var_2 = arg_0->x;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx]
	mov	word ptr [bp-2],ax
   ;	
   ;	            var_2 -= act->width;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	ax,word ptr es:[bx+16]
	sub	word ptr [bp-2],ax
   ;	
   ;	            act->x_speed = -1;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	word ptr es:[bx+20],-1
   ;	
   ;	        }
   ;	
	jmp	short @22@254
@22@226:
   ;	
   ;	        else
   ;	        {
   ;	            act = the_cast->add(_all_projectiles[arg_4].spr_r, 0, do_missle);
   ;	
	push	seg @do_missle$qn7m_actor
	push	offset @do_missle$qn7m_actor
	push	0
	push	0
	mov	al,byte ptr [bp+10]
	mov	ah,0
	imul	ax,ax,22
	mov	bx,ax
	push	word ptr DGROUP:__all_projectiles[bx+10]
	push	word ptr DGROUP:__all_projectiles[bx+8]
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_act+2,dx
	mov	word ptr DGROUP:_act,ax
   ;	
   ;	            var_2 = arg_0->old_x - 3;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+4]
	add	ax,-3
	mov	word ptr [bp-2],ax
   ;	
   ;	            act->x_speed = 1;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	word ptr es:[bx+20],1
@22@254:
   ;	
   ;	        }
   ;	        act->direction = arg_0->direction;
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+52]
	les	bx,dword ptr DGROUP:_act
	mov	byte ptr es:[bx+52],al
   ;	
   ;	        if (arg_6 == 0)
   ;	
	cmp	word ptr [bp+12],0
	jne	short @22@310
   ;	
   ;	            var_4 = arg_0->center_y + 3;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+10]
	add	ax,3
	jmp	short @22@338
@22@310:
   ;	
   ;	        else
   ;	            var_4 = arg_0->y + arg_6;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	add	ax,word ptr [bp+12]
@22@338:
	mov	word ptr [bp-4],ax
   ;	
   ;	        act->counter_24 = _all_projectiles[arg_4].v2;
   ;	
	mov	al,byte ptr [bp+10]
	mov	ah,0
	imul	ax,ax,22
	mov	bx,ax
	mov	al,byte ptr DGROUP:__all_projectiles[bx+14]
	mov	ah,0
	les	bx,dword ptr DGROUP:_act
	mov	word ptr es:[bx+34],ax
   ;	
   ;	        act->counter_26 = _all_projectiles[arg_4].v1;
   ;	
	mov	al,byte ptr [bp+10]
	mov	ah,0
	imul	ax,ax,22
	mov	bx,ax
	mov	al,byte ptr DGROUP:__all_projectiles[bx+13]
	mov	ah,0
	les	bx,dword ptr DGROUP:_act
	mov	word ptr es:[bx+36],ax
   ;	
   ;	        act->health = _all_projectiles[arg_4].v0;
   ;	
	mov	al,byte ptr [bp+10]
	mov	ah,0
	imul	ax,ax,22
	mov	bx,ax
	mov	al,byte ptr DGROUP:__all_projectiles[bx+12]
	mov	ah,0
	les	bx,dword ptr DGROUP:_act
	mov	word ptr es:[bx+38],ax
   ;	
   ;	        act->flag_7 = _all_projectiles[arg_4].flag;
   ;	
	mov	al,byte ptr [bp+10]
	mov	ah,0
	imul	ax,ax,22
	mov	bx,ax
	mov	al,byte ptr DGROUP:__all_projectiles[bx+20]
	mov	ah,0
	and	ax,1
	les	bx,dword ptr DGROUP:_act
	and	byte ptr es:[bx+82],127
	shl	al,7
	or	byte ptr es:[bx+82],al
   ;	
   ;	        if (arg_4 == 9)
   ;	
	cmp	byte ptr [bp+10],9
	jne	short @22@422
   ;	
   ;	        {
   ;	            act->state = 3;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	byte ptr es:[bx+61],3
   ;	
   ;	            act->y_speed = -7;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	word ptr es:[bx+22],-7
@22@422:
   ;	
   ;	        }
   ;	        act->target = arg_0;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	eax,dword ptr [bp+6]
	mov	dword ptr es:[bx+44],eax
   ;	
   ;	        act->field_4E = _all_projectiles[arg_4].link;
   ;	
	mov	al,byte ptr [bp+10]
	mov	ah,0
	imul	ax,ax,22
	mov	bx,ax
	mov	ax,word ptr DGROUP:__all_projectiles[bx+18]
	mov	dx,word ptr DGROUP:__all_projectiles[bx+16]
	les	bx,dword ptr DGROUP:_act
	mov	word ptr es:[bx+80],ax
	mov	word ptr es:[bx+78],dx
   ;	
   ;	        act->set_cycle(0, 1);
   ;	
	push	1
	push	0
	push	word ptr DGROUP:_act+2
	push	word ptr DGROUP:_act
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
   ;	
   ;	        act->set_xy(var_2, var_4);
   ;	
	push	word ptr [bp-4]
	push	word ptr [bp-2]
	push	word ptr DGROUP:_act+2
	push	word ptr DGROUP:_act
	call	far ptr @m_actor@set_xy$qii
	add	sp,8
   ;	
   ;	        if (arg_4 == 0x0A)
   ;	
	cmp	byte ptr [bp+10],10
	jne	short @22@478
   ;	
   ;	            the_game->play_sound(_all_projectiles[arg_4].snd, 0x0A);
   ;	
	push	10
	jmp	short @22@506
@22@478:
   ;	
   ;	        else
   ;	            the_game->play_sound(_all_projectiles[arg_4].snd, 3);
   ;	
	push	3
@22@506:
	mov	al,byte ptr [bp+10]
	mov	ah,0
	imul	ax,ax,22
	mov	bx,ax
	push	word ptr DGROUP:__all_projectiles[bx+2]
	push	word ptr DGROUP:__all_projectiles[bx]
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_sound$qnucuc
	add	sp,10
	jmp	@22@702
   ;	
   ;	        return;
   ;	
	jmp	@22@702
@22@562:
   ;	
   ;	    }
   ;	    act = the_cast->add((uchar far *)"msl_top.l", 0, do_missle);
   ;	
	push	seg @do_missle$qn7m_actor
	push	offset @do_missle$qn7m_actor
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+2709
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_act+2,dx
	mov	word ptr DGROUP:_act,ax
   ;	
   ;	    act->target = arg_0;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	eax,dword ptr [bp+6]
	mov	dword ptr es:[bx+44],eax
   ;	
   ;	    act->direction = 0x63;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	byte ptr es:[bx+52],99
   ;	
   ;	    act->flag_7 = 1;
   ;	
	les	bx,dword ptr DGROUP:_act
	or	byte ptr es:[bx+82],128
   ;	
   ;	    act->counter_26 = 8;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	word ptr es:[bx+36],8
   ;	
   ;	    act->health = 2;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	word ptr es:[bx+38],2
   ;	
   ;	    if (ego->direction == 0)
   ;	
	les	bx,dword ptr DGROUP:_ego
	cmp	byte ptr es:[bx+52],0
	jne	short @22@618
   ;	
   ;	        act->set_xy(ego->x + 0x0B, ego->center_y - act->height - 8);
   ;	
	les	bx,dword ptr DGROUP:_ego
	mov	ax,word ptr es:[bx+10]
	les	bx,dword ptr DGROUP:_act
	sub	ax,word ptr es:[bx+18]
	add	ax,-8
	push	ax
	les	bx,dword ptr DGROUP:_ego
	mov	ax,word ptr es:[bx]
	add	ax,11
	jmp	short @22@646
@22@618:
   ;	
   ;	    else
   ;	        act->set_xy(ego->x + ego->width - 0x0D, ego->center_y - act->height - 8);
   ;	
	les	bx,dword ptr DGROUP:_ego
	mov	ax,word ptr es:[bx+10]
	les	bx,dword ptr DGROUP:_act
	sub	ax,word ptr es:[bx+18]
	add	ax,-8
	push	ax
	les	bx,dword ptr DGROUP:_ego
	push	es
	les	si,dword ptr DGROUP:_ego
	mov	ax,word ptr es:[si]
	pop	es
	add	ax,word ptr es:[bx+16]
	add	ax,-13
@22@646:
	push	ax
	push	word ptr DGROUP:_act+2
	push	word ptr DGROUP:_act
	call	far ptr @m_actor@set_xy$qii
	add	sp,8
   ;	
   ;	    top_shot_count++;
   ;	
	inc	byte ptr DGROUP:_top_shot_count
@22@702:
   ;	
   ;	}
   ;	
	pop	si
	leave	
	ret	
@add_missile$qn7m_actoruci	endp
   ;	
   ;	void add_jason(void)
   ;	
	assume	cs:GAME_TEXT
@add_jason$qv	proc	far
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
	push	offset DGROUP:s@+2719
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
	jne	short @23@86
   ;	
   ;	        jason->set_xy(ego->x - 2, ego->y);
   ;	
	les	bx,dword ptr DGROUP:_ego
	push	word ptr es:[bx+2]
	les	bx,dword ptr DGROUP:_ego
	mov	ax,word ptr es:[bx]
	add	ax,-2
	push	ax
	jmp	short @23@114
@23@86:
   ;	
   ;	    else
   ;	        jason->set_xy(ego->old_x, ego->y);
   ;	
	les	bx,dword ptr DGROUP:_ego
	push	word ptr es:[bx+2]
	les	bx,dword ptr DGROUP:_ego
	push	word ptr es:[bx+4]
@23@114:
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
   ;	
   ;	void kill_jason(void)
   ;	
	assume	cs:GAME_TEXT
@kill_jason$qv	proc	far
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
	push	0
	push	0
	push	2
	les	bx,dword ptr DGROUP:_jason
	push	word ptr es:[bx+10]
	les	bx,dword ptr DGROUP:_jason
	push	word ptr es:[bx+8]
	push	cs
	call	near ptr @add_explosion$qiiucnuc
	add	sp,10
   ;	
   ;	    if (jason_on == 1 && ego->state != 2)
   ;	
	cmp	byte ptr DGROUP:_jason_on,1
	jne	short @24@114
	les	bx,dword ptr DGROUP:_ego
	cmp	byte ptr es:[bx+61],2
	je	short @24@114
   ;	
   ;	        scroll_to(ego);
   ;	
	push	word ptr DGROUP:_ego+2
	push	word ptr DGROUP:_ego
	call	far ptr @scroll_to$qn7m_actor
	add	sp,4
@24@114:
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
   ;	
   ;	void toggle_sub_control(void)
   ;	
	assume	cs:GAME_TEXT
@toggle_sub_control$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (jason_present != 0)
   ;	
	cmp	byte ptr DGROUP:_jason_present,0
	je	short @25@170
   ;	
   ;	    {
   ;	        the_game->play_sound_file((uchar far *)"squeek");
   ;	
	push	ds
	push	offset DGROUP:s@+2728
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
	jne	short @25@114
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
	jmp	short @25@142
@25@114:
   ;	
   ;	        }
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
@25@142:
	mov	dword ptr DGROUP:_cur_sub,eax
@25@170:
   ;	
   ;	        }
   ;	    }
   ;	}
   ;	
	pop	bp
	ret	
@toggle_sub_control$qv	endp
   ;	
   ;	void scroll_to(m_actor far *arg_0)
   ;	
	assume	cs:GAME_TEXT
@scroll_to$qn7m_actor	proc	far
	enter	10,0
   ;	
   ;	{
   ;	    uint  var_4, var_6, var_8, var_A;
   ;	    uchar var_1;
   ;	
   ;	    var_4 = the_map->map_x + (the_map->viewport_w >> 1);
   ;	
	les	bx,dword ptr DGROUP:_the_map
	mov	ax,word ptr es:[bx+8]
	les	bx,dword ptr DGROUP:_the_map
	mov	dx,word ptr es:[bx+4]
	sar	dx,1
	add	ax,dx
	mov	word ptr [bp-2],ax
   ;	
   ;	    var_6 = the_map->map_y + (the_map->viewport_h >> 1);
   ;	
	les	bx,dword ptr DGROUP:_the_map
	mov	ax,word ptr es:[bx+10]
	les	bx,dword ptr DGROUP:_the_map
	mov	dx,word ptr es:[bx+6]
	sar	dx,1
	add	ax,dx
	mov	word ptr [bp-4],ax
   ;	
   ;	    var_4 = (var_4 >> 3) << 3;
   ;	
	mov	ax,word ptr [bp-2]
	shr	ax,3
	shl	ax,3
	mov	word ptr [bp-2],ax
   ;	
   ;	    var_6 = (var_6 >> 3) << 3;
   ;	
	mov	ax,word ptr [bp-4]
	shr	ax,3
	shl	ax,3
	mov	word ptr [bp-4],ax
   ;	
   ;	    var_8 = var_A = 0;
   ;	
	xor	ax,ax
	mov	word ptr [bp-8],ax
	mov	word ptr [bp-6],ax
	jmp	@26@310
@26@58:
   ;	
   ;	    while (var_4 != var_8 || var_6 != var_A)
   ;	    {
   ;	        var_8 = (arg_0->center_x >> 3) << 3;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+8]
	sar	ax,3
	shl	ax,3
	mov	word ptr [bp-6],ax
   ;	
   ;	        var_A = (arg_0->center_y >> 3) << 3;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+10]
	sar	ax,3
	shl	ax,3
	mov	word ptr [bp-8],ax
   ;	
   ;	        if (var_4 < var_8)
   ;	
	mov	ax,word ptr [bp-2]
	cmp	ax,word ptr [bp-6]
	jae	short @26@114
   ;	
   ;	            var_4 += 8;
   ;	
	add	word ptr [bp-2],8
	jmp	short @26@170
@26@114:
   ;	
   ;	        else if (var_4 > var_8)
   ;	
	mov	ax,word ptr [bp-2]
	cmp	ax,word ptr [bp-6]
	jbe	short @26@170
   ;	
   ;	            var_4 -= 8;
   ;	
	sub	word ptr [bp-2],8
@26@170:
   ;	
   ;	        if (var_6 < var_A)
   ;	
	mov	ax,word ptr [bp-4]
	cmp	ax,word ptr [bp-8]
	jae	short @26@226
   ;	
   ;	            var_6 += 8;
   ;	
	add	word ptr [bp-4],8
	jmp	short @26@282
@26@226:
   ;	
   ;	        else if (var_6 > var_A)
   ;	
	mov	ax,word ptr [bp-4]
	cmp	ax,word ptr [bp-8]
	jbe	short @26@282
   ;	
   ;	            var_6 -= 8;
   ;	
	sub	word ptr [bp-4],8
@26@282:
   ;	
   ;	        var_1 = the_map->center_on(var_4, var_6);
   ;	
	push	word ptr [bp-4]
	push	word ptr [bp-2]
	push	word ptr DGROUP:_the_map+2
	push	word ptr DGROUP:_the_map
	call	far ptr @tilemap@center_on$quiui
	add	sp,8
	mov	byte ptr [bp-9],al
   ;	
   ;	        the_cast->update(var_1);
   ;	
	mov	al,byte ptr [bp-9]
	push	ax
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@update$quc
	add	sp,6
   ;	
   ;	        the_map->update(page_offsets[non_displayed_page]);
   ;	
	mov	al,byte ptr DGROUP:_non_displayed_page
	mov	ah,0
	shl	ax,1
	mov	bx,ax
	push	word ptr DGROUP:_page_offsets[bx]
	push	word ptr DGROUP:_the_map+2
	push	word ptr DGROUP:_the_map
	call	far ptr @tilemap@update$qui
	add	sp,6
   ;	
   ;	        display->show_offset(page_offsets[non_displayed_page]);
   ;	
	mov	al,byte ptr DGROUP:_non_displayed_page
	mov	ah,0
	shl	ax,1
	mov	bx,ax
	push	word ptr DGROUP:_page_offsets[bx]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@show_offset$qui
	add	sp,6
   ;	
   ;	        displayed_page = non_displayed_page;
   ;	
	mov	al,byte ptr DGROUP:_non_displayed_page
	mov	byte ptr DGROUP:_displayed_page,al
   ;	
   ;	        non_displayed_page ^= 1;
   ;	
	xor	byte ptr DGROUP:_non_displayed_page,1
@26@310:
	mov	ax,word ptr [bp-2]
	cmp	ax,word ptr [bp-6]
	je short	@@52
	jmp	@26@58
@@52:
	mov	ax,word ptr [bp-4]
	cmp	ax,word ptr [bp-8]
	je short	@@53
	jmp	@26@58
@@53:
	jmp	@26@646
@26@394:
   ;	
   ;	    }
   ;	    while (var_4 != var_8 || var_6 != var_A)
   ;	    {
   ;	        var_8 = (arg_0->center_x >> 2) << 2;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+8]
	sar	ax,2
	shl	ax,2
	mov	word ptr [bp-6],ax
   ;	
   ;	        var_A = arg_0->center_y;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+10]
	mov	word ptr [bp-8],ax
   ;	
   ;	        if (var_4 < var_8)
   ;	
	mov	ax,word ptr [bp-2]
	cmp	ax,word ptr [bp-6]
	jae	short @26@450
   ;	
   ;	            var_4 += 4;
   ;	
	add	word ptr [bp-2],4
	jmp	short @26@506
@26@450:
   ;	
   ;	        else if (var_4 > var_8)
   ;	
	mov	ax,word ptr [bp-2]
	cmp	ax,word ptr [bp-6]
	jbe	short @26@506
   ;	
   ;	            var_4 -= 4;
   ;	
	sub	word ptr [bp-2],4
@26@506:
   ;	
   ;	        if (var_6 < var_A)
   ;	
	mov	ax,word ptr [bp-4]
	cmp	ax,word ptr [bp-8]
	jae	short @26@562
   ;	
   ;	            var_6++;
   ;	
	inc	word ptr [bp-4]
	jmp	short @26@618
@26@562:
   ;	
   ;	        else if (var_6 > var_A)
   ;	
	mov	ax,word ptr [bp-4]
	cmp	ax,word ptr [bp-8]
	jbe	short @26@618
   ;	
   ;	            var_6--;
   ;	
	dec	word ptr [bp-4]
@26@618:
   ;	
   ;	        var_1 = the_map->center_on(var_4, var_6);
   ;	
	push	word ptr [bp-4]
	push	word ptr [bp-2]
	push	word ptr DGROUP:_the_map+2
	push	word ptr DGROUP:_the_map
	call	far ptr @tilemap@center_on$quiui
	add	sp,8
	mov	byte ptr [bp-9],al
   ;	
   ;	        the_cast->update(var_1);
   ;	
	mov	al,byte ptr [bp-9]
	push	ax
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@update$quc
	add	sp,6
   ;	
   ;	        the_map->update(page_offsets[non_displayed_page]);
   ;	
	mov	al,byte ptr DGROUP:_non_displayed_page
	mov	ah,0
	shl	ax,1
	mov	bx,ax
	push	word ptr DGROUP:_page_offsets[bx]
	push	word ptr DGROUP:_the_map+2
	push	word ptr DGROUP:_the_map
	call	far ptr @tilemap@update$qui
	add	sp,6
   ;	
   ;	        display->show_offset(page_offsets[non_displayed_page]);
   ;	
	mov	al,byte ptr DGROUP:_non_displayed_page
	mov	ah,0
	shl	ax,1
	mov	bx,ax
	push	word ptr DGROUP:_page_offsets[bx]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@show_offset$qui
	add	sp,6
   ;	
   ;	        displayed_page = non_displayed_page;
   ;	
	mov	al,byte ptr DGROUP:_non_displayed_page
	mov	byte ptr DGROUP:_displayed_page,al
   ;	
   ;	        non_displayed_page ^= 1;
   ;	
	xor	byte ptr DGROUP:_non_displayed_page,1
@26@646:
	mov	ax,word ptr [bp-2]
	cmp	ax,word ptr [bp-6]
	je short	@@54
	jmp	@26@394
@@54:
	mov	ax,word ptr [bp-4]
	cmp	ax,word ptr [bp-8]
	je short	@@55
	jmp	@26@394
@@55:
   ;	
   ;	    }
   ;	}
   ;	
	leave	
	ret	
@scroll_to$qn7m_actor	endp
   ;	
   ;	void ego_fire(void)
   ;	
	assume	cs:GAME_TEXT
@ego_fire$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (shot_count == 5)
   ;	
	cmp	byte ptr DGROUP:_shot_count,5
	jne short	@@56
	jmp	@27@730
@@56:
   ;	
   ;	        return;
   ;	    if (jason_on != 0)
   ;	
	cmp	byte ptr DGROUP:_jason_on,0
	je	short @27@226
   ;	
   ;	    {
   ;	        shot_count++;
   ;	
	inc	byte ptr DGROUP:_shot_count
   ;	
   ;	        if (shot_size == 0)
   ;	
	cmp	byte ptr DGROUP:_shot_size,0
	jne	short @27@170
   ;	
   ;	            add_missile(jason, 0, 4);
   ;	
	push	4
	push	0
@27@142:
	push	word ptr DGROUP:_jason+2
	push	word ptr DGROUP:_jason
	push	cs
	call	near ptr @add_missile$qn7m_actoruci
	add	sp,8
	jmp	@27@730
@27@170:
   ;	
   ;	        else
   ;	            add_missile(jason, 1, 4);
   ;	
	push	4
	push	1
	jmp	short @27@142
   ;	
   ;	        return;
   ;	
	jmp	@27@730
@27@226:
   ;	
   ;	    }
   ;	    if (ego->state == 1)
   ;	
	les	bx,dword ptr DGROUP:_ego
	cmp	byte ptr es:[bx+61],1
	jne short	@@57
	jmp	@27@730
@@57:
   ;	
   ;	        return;
   ;	    shot_count++;
   ;	
	inc	byte ptr DGROUP:_shot_count
   ;	
   ;	    add_missile(ego, shot_size, 0);
   ;	
	push	0
	mov	al,byte ptr DGROUP:_shot_size
	push	ax
	push	word ptr DGROUP:_ego+2
	push	word ptr DGROUP:_ego
	push	cs
	call	near ptr @add_missile$qn7m_actoruci
	add	sp,8
   ;	
   ;	    if (heavy_timer != 0)
   ;	
	cmp	word ptr DGROUP:_heavy_timer,0
	je	short @27@310
   ;	
   ;	        heavy_timer--;
   ;	
	dec	word ptr DGROUP:_heavy_timer
@27@310:
   ;	
   ;	    if (jason_fire != 0 && jason_present != 0 && jason->state == 0)
   ;	
	cmp	byte ptr DGROUP:_jason_fire,0
	je	short @27@506
	cmp	byte ptr DGROUP:_jason_present,0
	je	short @27@506
	les	bx,dword ptr DGROUP:_jason
	cmp	byte ptr es:[bx+61],0
	jne	short @27@506
   ;	
   ;	        add_missile(jason, 1 - (shot_size == 0), 0);
   ;	
	push	0
	cmp	byte ptr DGROUP:_shot_size,0
	jne	short @27@450
	mov	ax,1
	jmp	short @27@478
@27@450:
	xor	ax,ax
@27@478:
	mov	dl,1
	sub	dl,al
	push	dx
	push	word ptr DGROUP:_jason+2
	push	word ptr DGROUP:_jason
	push	cs
	call	near ptr @add_missile$qn7m_actoruci
	add	sp,8
@27@506:
   ;	
   ;	    if (top_fire == 1 && top_shot_count != 2)
   ;	
	cmp	byte ptr DGROUP:_top_fire,1
	jne	short @27@590
	cmp	byte ptr DGROUP:_top_shot_count,2
	je	short @27@590
   ;	
   ;	        add_missile(ego, 0x63, 0);
   ;	
	push	0
	push	99
	push	word ptr DGROUP:_ego+2
	push	word ptr DGROUP:_ego
	push	cs
	call	near ptr @add_missile$qn7m_actoruci
	add	sp,8
@27@590:
   ;	
   ;	    if (shot_size != 0 && abs(ego->x_speed) <= 6)
   ;	
	cmp	byte ptr DGROUP:_shot_size,0
	je	short @27@730
	les	bx,dword ptr DGROUP:_ego
	push	word ptr es:[bx+20]
	call	far ptr @abs$qi
	pop	cx
	cmp	ax,6
	jg	short @27@730
   ;	
   ;	    {
   ;	        if (ego->direction == 0)
   ;	
	les	bx,dword ptr DGROUP:_ego
	cmp	byte ptr es:[bx+52],0
	jne	short @27@702
   ;	
   ;	            ego->x_speed -= shot_size + 2;
   ;	
	mov	al,byte ptr DGROUP:_shot_size
	mov	ah,0
	add	ax,2
	les	bx,dword ptr DGROUP:_ego
	sub	word ptr es:[bx+20],ax
	jmp	short @27@730
@27@702:
   ;	
   ;	        else
   ;	            ego->x_speed += shot_size + 2;
   ;	
	mov	al,byte ptr DGROUP:_shot_size
	mov	ah,0
	add	ax,2
	les	bx,dword ptr DGROUP:_ego
	add	word ptr es:[bx+20],ax
@27@730:
   ;	
   ;	    }
   ;	}
   ;	
	pop	bp
	ret	
@ego_fire$qv	endp
   ;	
   ;	void turn_ego(void)
   ;	
	assume	cs:GAME_TEXT
@turn_ego$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (jason_on != 0)
   ;	
	cmp	byte ptr DGROUP:_jason_on,0
	je	short @28@170
   ;	
   ;	        jason->new_loop(jason->direction == 1 ? (uchar far *)"prober.l"
   ;	
   ;	
   ;	                                            : (uchar far *)"probel.l");
   ;	
	les	bx,dword ptr DGROUP:_jason
	cmp	byte ptr es:[bx+52],1
	jne	short @28@114
	mov	dx,ds
	mov	ax,offset DGROUP:s@+2735
	jmp	short @28@142
@28@114:
	mov	dx,ds
	mov	ax,offset DGROUP:s@+2744
@28@142:
	push	dx
	push	ax
	push	word ptr DGROUP:_jason+2
	push	word ptr DGROUP:_jason
	jmp	short @28@198
@28@170:
   ;	
   ;	    else
   ;	    {
   ;	        ego->state = 1;
   ;	
	les	bx,dword ptr DGROUP:_ego
	mov	byte ptr es:[bx+61],1
   ;	
   ;	        ego->counter_24 = 3;
   ;	
	les	bx,dword ptr DGROUP:_ego
	mov	word ptr es:[bx+34],3
   ;	
   ;	        ego->new_loop((uchar far *)"turn.l");
   ;	
	push	ds
	push	offset DGROUP:s@+2753
	push	word ptr DGROUP:_ego+2
	push	word ptr DGROUP:_ego
@28@198:
	call	far ptr @m_actor@new_loop$qnuc
	add	sp,8
   ;	
   ;	    }
   ;	    cur_sub->direction ^= 1;
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	xor	byte ptr es:[bx+52],1
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@turn_ego$qv	endp
   ;	
   ;	void check_user(void)
   ;	
	assume	cs:GAME_TEXT
@check_user$qv	proc	far
	enter	4,0
   ;	
   ;	{
   ;	    int   var_4;
   ;	    uchar var_1;
   ;	
   ;	    if (control == 0) goto no_input;
   ;	
	cmp	byte ptr DGROUP:_control,0
	jne short	@@58
	jmp	@29@2606
@@58:
   ;	
   ;	
   ;	    if (gr_keys[1] || gr_keys[0x3B])
   ;	
	cmp	byte ptr DGROUP:_gr_keys+1,0
	jne	short @29@114
	cmp	byte ptr DGROUP:_gr_keys+59,0
	je	short @29@170
@29@114:
   ;	
   ;	        if (!displayed_page)
   ;	
	mov	al,byte ptr DGROUP:_displayed_page
	mov	ah,0
	or	ax,ax
	jne	short @29@170
   ;	
   ;	            activate_menu_bar();
   ;	
	call	far ptr @activate_menu_bar$qv
@29@170:
   ;	
   ;	
   ;	    if (the_game->field_2B == 1)
   ;	
	les	bx,dword ptr DGROUP:_the_game
	cmp	byte ptr es:[bx+43],1
	jne	short @29@450
   ;	
   ;	    {
   ;	        if (auto_fire == 1 && jason_on == 0)
   ;	
	cmp	byte ptr DGROUP:_auto_fire,1
	jne	short @29@338
	cmp	byte ptr DGROUP:_jason_on,0
	jne	short @29@338
   ;	
   ;	        {
   ;	            if (auto_fire_count++ == 2)
   ;	
	mov	al,byte ptr DGROUP:_auto_fire_count
	inc	byte ptr DGROUP:_auto_fire_count
	cmp	al,2
	jne	short @29@506
   ;	
   ;	            {
   ;	                auto_fire_count = 0;
   ;	
	mov	byte ptr DGROUP:_auto_fire_count,0
   ;	
   ;	                ego_fire();
   ;	
	push	cs
	call	near ptr @ego_fire$qv
	jmp	short @29@506
   ;	
   ;	            }
   ;	        }
   ;	
	jmp	short @29@506
@29@338:
   ;	
   ;	        else
   ;	        {
   ;	            if (space_bar_been_up != 0)
   ;	
	cmp	word ptr DGROUP:_space_bar_been_up,0
	je	short @29@394
   ;	
   ;	                ego_fire();
   ;	
	push	cs
	call	near ptr @ego_fire$qv
@29@394:
   ;	
   ;	            space_bar_been_up = 0;
   ;	
	mov	word ptr DGROUP:_space_bar_been_up,0
	jmp	short @29@506
   ;	
   ;	        }
   ;	    }
   ;	
	jmp	short @29@506
@29@450:
   ;	
   ;	    else
   ;	    {
   ;	        if (space_bar_been_up == 0)
   ;	
	cmp	word ptr DGROUP:_space_bar_been_up,0
	jne	short @29@506
   ;	
   ;	            space_bar_been_up++;
   ;	
	inc	word ptr DGROUP:_space_bar_been_up
@29@506:
   ;	
   ;	    }
   ;	
   ;	    if (the_game->field_2C == 1 && ego->state == 0)
   ;	
	les	bx,dword ptr DGROUP:_the_game
	cmp	byte ptr es:[bx+44],1
	je short	@@59
	jmp	@29@786
@@59:
	les	bx,dword ptr DGROUP:_ego
	cmp	byte ptr es:[bx+61],0
	jne	short @29@786
   ;	
   ;	    {
   ;	        for (var_4 = 0; var_4 < teleport_count; var_4++)
   ;	
	mov	word ptr [bp-2],0
	jmp	short @29@674
@29@590:
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
	je	short @29@646
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
	jmp	short @29@702
@29@646:
	inc	word ptr [bp-2]
@29@674:
	mov	al,byte ptr DGROUP:_teleport_count
	mov	ah,0
	cmp	ax,word ptr [bp-2]
	jg	short @29@590
@29@702:
   ;	
   ;	            }
   ;	        if (jason_present == 1 && var_4 == teleport_count)
   ;	
	cmp	byte ptr DGROUP:_jason_present,1
	jne	short @29@786
	mov	al,byte ptr DGROUP:_teleport_count
	mov	ah,0
	cmp	ax,word ptr [bp-2]
	jne	short @29@786
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
@29@786:
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
	je	short @29@954
   ;	
   ;	    {
   ;	        if (cur_sub->direction != 0)
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	cmp	byte ptr es:[bx+52],0
	je	short @29@870
   ;	
   ;	            turn_ego();
   ;	
	push	cs
	call	near ptr @turn_ego$qv
@29@870:
   ;	
   ;	        if (cur_sub->state != 1)
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	cmp	byte ptr es:[bx+61],1
	je	short @29@926
   ;	
   ;	            cur_sub->x_speed = ego_x_speed;
   ;	
	mov	al,byte ptr DGROUP:_ego_x_speed
	mov	ah,0
	les	bx,dword ptr DGROUP:_cur_sub
	mov	word ptr es:[bx+20],ax
@29@926:
   ;	
   ;	        var_1 = 1;
   ;	
	mov	byte ptr [bp-3],1
   ;	
   ;	    }
   ;	
	jmp	short @29@1234
@29@954:
   ;	
   ;	    else if (the_game->field_29 != 0)
   ;	
	les	bx,dword ptr DGROUP:_the_game
	cmp	byte ptr es:[bx+41],0
	je	short @29@1122
   ;	
   ;	    {
   ;	        if (cur_sub->direction != 1)
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	cmp	byte ptr es:[bx+52],1
	je	short @29@1038
   ;	
   ;	            turn_ego();
   ;	
	push	cs
	call	near ptr @turn_ego$qv
@29@1038:
   ;	
   ;	        if (cur_sub->state != 1)
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	cmp	byte ptr es:[bx+61],1
	je	short @29@1094
   ;	
   ;	            cur_sub->x_speed = -ego_x_speed;
   ;	
	mov	al,byte ptr DGROUP:_ego_x_speed
	mov	ah,0
	neg	ax
	les	bx,dword ptr DGROUP:_cur_sub
	mov	word ptr es:[bx+20],ax
	jmp	short @29@926
@29@1094:
	jmp	short @29@926
@29@1122:
   ;	
   ;	        var_1 = 1;
   ;	    }
   ;	    else
   ;	    {
   ;	        if (cur_sub->x_speed != 0)
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	cmp	word ptr es:[bx+20],0
	je	short @29@1234
   ;	
   ;	        {
   ;	            if (cur_sub->x_speed > 0)
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	cmp	word ptr es:[bx+20],0
	jle	short @29@1206
   ;	
   ;	                cur_sub->x_speed--;
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	dec	word ptr es:[bx+20]
	jmp	short @29@1234
@29@1206:
   ;	
   ;	            else
   ;	                cur_sub->x_speed++;
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	inc	word ptr es:[bx+20]
@29@1234:
   ;	
   ;	        }
   ;	    }
   ;	
   ;	    if (the_game->field_28 != 0)
   ;	
	les	bx,dword ptr DGROUP:_the_game
	cmp	byte ptr es:[bx+40],0
	je	short @29@1402
   ;	
   ;	    {
   ;	        if (ego_y_speed > cur_sub->y_speed)
   ;	
	mov	al,byte ptr DGROUP:_ego_y_speed
	mov	ah,0
	les	bx,dword ptr DGROUP:_cur_sub
	cmp	ax,word ptr es:[bx+22]
	jle	short @29@1318
   ;	
   ;	            cur_sub->y_speed++;
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	inc	word ptr es:[bx+22]
	jmp	short @29@1374
@29@1318:
   ;	
   ;	        else if (ego_y_speed < cur_sub->y_speed)
   ;	
	mov	al,byte ptr DGROUP:_ego_y_speed
	mov	ah,0
	les	bx,dword ptr DGROUP:_cur_sub
	cmp	ax,word ptr es:[bx+22]
	jge	short @29@1374
   ;	
   ;	            cur_sub->y_speed = ego_y_speed;
   ;	
	mov	al,byte ptr DGROUP:_ego_y_speed
	mov	ah,0
	les	bx,dword ptr DGROUP:_cur_sub
	mov	word ptr es:[bx+22],ax
@29@1374:
   ;	
   ;	        var_1 = 1;
   ;	
	mov	byte ptr [bp-3],1
   ;	
   ;	    }
   ;	
	jmp	@29@1682
@29@1402:
   ;	
   ;	    else if (the_game->field_27 != 0)
   ;	
	les	bx,dword ptr DGROUP:_the_game
	cmp	byte ptr es:[bx+39],0
	je	short @29@1570
   ;	
   ;	    {
   ;	        if (-ego_y_speed < cur_sub->y_speed)
   ;	
	mov	al,byte ptr DGROUP:_ego_y_speed
	mov	ah,0
	neg	ax
	les	bx,dword ptr DGROUP:_cur_sub
	cmp	ax,word ptr es:[bx+22]
	jge	short @29@1486
   ;	
   ;	            cur_sub->y_speed--;
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	dec	word ptr es:[bx+22]
	jmp	short @29@1374
@29@1486:
   ;	
   ;	        else if (-ego_y_speed > cur_sub->y_speed)
   ;	
	mov	al,byte ptr DGROUP:_ego_y_speed
	mov	ah,0
	neg	ax
	les	bx,dword ptr DGROUP:_cur_sub
	cmp	ax,word ptr es:[bx+22]
	jle	short @29@1542
   ;	
   ;	            cur_sub->y_speed = -ego_y_speed;
   ;	
	mov	al,byte ptr DGROUP:_ego_y_speed
	mov	ah,0
	neg	ax
	les	bx,dword ptr DGROUP:_cur_sub
	mov	word ptr es:[bx+22],ax
	jmp	short @29@1374
@29@1542:
	jmp	short @29@1374
@29@1570:
   ;	
   ;	        var_1 = 1;
   ;	    }
   ;	    else
   ;	    {
   ;	        if (abs(cur_sub->y_speed) > 1)
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	push	word ptr es:[bx+22]
	call	far ptr @abs$qi
	pop	cx
	cmp	ax,1
	jle	short @29@1682
   ;	
   ;	        {
   ;	            if (cur_sub->y_speed > 0)
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	cmp	word ptr es:[bx+22],0
	jle	short @29@1654
   ;	
   ;	                cur_sub->y_speed--;
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	dec	word ptr es:[bx+22]
	jmp	short @29@1682
@29@1654:
   ;	
   ;	            else
   ;	                cur_sub->y_speed++;
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	inc	word ptr es:[bx+22]
@29@1682:
   ;	
   ;	        }
   ;	    }
   ;	
   ;	    if (ego->state != 1)
   ;	
	les	bx,dword ptr DGROUP:_ego
	cmp	byte ptr es:[bx+61],1
	je	short @29@1934
   ;	
   ;	    {
   ;	        if (var_1 != 0)
   ;	
	cmp	byte ptr [bp-3],0
	je	short @29@1850
   ;	
   ;	        {
   ;	            if (cur_sub->cycle_speed != 0 || cur_sub->frame == 0)
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	cmp	byte ptr es:[bx+58],0
	jne	short @29@1794
	les	bx,dword ptr DGROUP:_cur_sub
	cmp	byte ptr es:[bx+56],0
	jne	short @29@1934
@29@1794:
   ;	
   ;	                cur_sub->set_cycle(0, 1);
   ;	
	push	1
	push	0
	jmp	short @29@1906
   ;	
   ;	        }
   ;	
	jmp	short @29@1934
@29@1850:
   ;	
   ;	        else
   ;	        {
   ;	            if (cur_sub->cycle_speed != 0xC)
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	cmp	byte ptr es:[bx+58],12
	je	short @29@1934
   ;	
   ;	                cur_sub->set_cycle(0xC, 1);
   ;	
	push	1
	push	12
@29@1906:
	push	word ptr DGROUP:_cur_sub+2
	push	word ptr DGROUP:_cur_sub
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
@29@1934:
   ;	
   ;	        }
   ;	    }
   ;	
   ;	    if (cheat_mode == 1)
   ;	
	cmp	byte ptr DGROUP:_cheat_mode,1
	je short	@@60
	jmp	@29@2606
@@60:
   ;	
   ;	    {
   ;	        if (gr_keys[0x1E])
   ;	
	cmp	byte ptr DGROUP:_gr_keys+30,0
	je	short @29@2018
   ;	
   ;	            update_air_guage(2, 0x68, 0xA7);
   ;	
	push	167
	push	104
	push	2
	call	far ptr @update_air_guage$qiii
	add	sp,6
@29@2018:
   ;	
   ;	        if (gr_keys[0x1F])
   ;	
	cmp	byte ptr DGROUP:_gr_keys+31,0
	je	short @29@2074
   ;	
   ;	            update_shld_guage(2, 0x68, 0xB3);
   ;	
	push	179
	push	104
	push	2
	call	far ptr @update_shld_guage$qiii
	add	sp,6
@29@2074:
   ;	
   ;	        if (gr_keys[0x21] && shot_size != 3)
   ;	
	cmp	byte ptr DGROUP:_gr_keys+33,0
	je	short @29@2158
	cmp	byte ptr DGROUP:_shot_size,3
	je	short @29@2158
   ;	
   ;	        {
   ;	            shot_size = 3;
   ;	
	mov	byte ptr DGROUP:_shot_size,3
   ;	
   ;	            the_game->play_sound_file((uchar far *)"drillhi");
   ;	
	push	ds
	push	offset DGROUP:s@+2760
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_sound_file$qnuc
	add	sp,8
@29@2158:
   ;	
   ;	        }
   ;	        if (gr_keys[0x13] && auto_fire != 1)
   ;	
	cmp	byte ptr DGROUP:_gr_keys+19,0
	je	short @29@2242
	cmp	byte ptr DGROUP:_auto_fire,1
	je	short @29@2242
   ;	
   ;	        {
   ;	            auto_fire = 1;
   ;	
	mov	byte ptr DGROUP:_auto_fire,1
   ;	
   ;	            the_game->play_sound_file((uchar far *)"drillhi");
   ;	
	push	ds
	push	offset DGROUP:s@+2768
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_sound_file$qnuc
	add	sp,8
@29@2242:
   ;	
   ;	        }
   ;	        if (gr_keys[0x24] && jason_present == 0)
   ;	
	cmp	byte ptr DGROUP:_gr_keys+36,0
	je	short @29@2326
	cmp	byte ptr DGROUP:_jason_present,0
	jne	short @29@2326
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
	push	offset DGROUP:s@+2776
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_sound_file$qnuc
	add	sp,8
@29@2326:
   ;	
   ;	        }
   ;	        if (gr_keys[0x23] && jason_present == 1 && jason_fire != 1)
   ;	
	cmp	byte ptr DGROUP:_gr_keys+35,0
	je	short @29@2438
	cmp	byte ptr DGROUP:_jason_present,1
	jne	short @29@2438
	cmp	byte ptr DGROUP:_jason_fire,1
	je	short @29@2438
   ;	
   ;	        {
   ;	            jason_fire = 1;
   ;	
	mov	byte ptr DGROUP:_jason_fire,1
   ;	
   ;	            the_game->play_sound_file((uchar far *)"drillhi");
   ;	
	push	ds
	push	offset DGROUP:s@+2784
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_sound_file$qnuc
	add	sp,8
@29@2438:
   ;	
   ;	        }
   ;	        if (gr_keys[0x16] && top_fire != 1)
   ;	
	cmp	byte ptr DGROUP:_gr_keys+22,0
	je	short @29@2522
	cmp	byte ptr DGROUP:_top_fire,1
	je	short @29@2522
   ;	
   ;	        {
   ;	            top_fire = 1;
   ;	
	mov	byte ptr DGROUP:_top_fire,1
   ;	
   ;	            the_game->play_sound_file((uchar far *)"drillhi");
   ;	
	push	ds
	push	offset DGROUP:s@+2792
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_sound_file$qnuc
	add	sp,8
@29@2522:
   ;	
   ;	        }
   ;	        if (gr_keys[0x22] && god_mode != 1)
   ;	
	cmp	byte ptr DGROUP:_gr_keys+34,0
	je	short @29@2606
	cmp	byte ptr DGROUP:_god_mode,1
	je	short @29@2606
   ;	
   ;	        {
   ;	            god_mode = 1;
   ;	
	mov	byte ptr DGROUP:_god_mode,1
   ;	
   ;	            the_game->play_sound_file((uchar far *)"drillhi");
   ;	
	push	ds
	push	offset DGROUP:s@+2800
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_sound_file$qnuc
	add	sp,8
@29@2606:
   ;	
   ;	        }
   ;	    }
   ;	
   ;	no_input:
   ;	    if (debug_mode == 1)
   ;	
	cmp	byte ptr DGROUP:_debug_mode,1
	je short	@@61
	jmp	@29@3166
@@61:
   ;	
   ;	    {
   ;	        if (gr_keys[0x20])
   ;	
	cmp	byte ptr DGROUP:_gr_keys+32,0
	je	short @29@2690
   ;	
   ;	            debug++;
   ;	
	inc	byte ptr DGROUP:_debug
@29@2690:
   ;	
   ;	        if (gr_keys[0x19] && displayed_page == 0)
   ;	
	cmp	byte ptr DGROUP:_gr_keys+25,0
	je	short @29@2774
	cmp	byte ptr DGROUP:_displayed_page,0
	jne	short @29@2774
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
	push	offset DGROUP:s@+2808
	call	far ptr @i_inform$qnucuce
	add	sp,10
@29@2774:
   ;	
   ;	        }
   ;	        if (gr_keys[0x2C])
   ;	
	cmp	byte ptr DGROUP:_gr_keys+44,0
	je	short @29@2830
   ;	
   ;	            stop_room = 1;
   ;	
	mov	byte ptr DGROUP:_stop_room,1
@29@2830:
   ;	
   ;	        if (gr_keys[0x02])
   ;	
	cmp	byte ptr DGROUP:_gr_keys+2,0
	je	short @29@2886
   ;	
   ;	            display->pause(0xA);
   ;	
	push	10
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@pause$qui
	add	sp,6
@29@2886:
   ;	
   ;	        if (gr_keys[0x03])
   ;	
	cmp	byte ptr DGROUP:_gr_keys+3,0
	je	short @29@2942
   ;	
   ;	            display->pause(0x1E);
   ;	
	push	30
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@pause$qui
	add	sp,6
@29@2942:
   ;	
   ;	        if (gr_keys[0x3B])
   ;	
	cmp	byte ptr DGROUP:_gr_keys+59,0
	je	short @29@2998
   ;	
   ;	            display->show_offset(0);
   ;	
	push	0
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@show_offset$qui
	add	sp,6
@29@2998:
   ;	
   ;	        if (gr_keys[0x3C])
   ;	
	cmp	byte ptr DGROUP:_gr_keys+60,0
	je	short @29@3054
   ;	
   ;	            display->show_offset(0x3E80);
   ;	
	push	16000
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@show_offset$qui
	add	sp,6
@29@3054:
   ;	
   ;	        if (gr_keys[0x3D])
   ;	
	cmp	byte ptr DGROUP:_gr_keys+61,0
	je	short @29@3110
   ;	
   ;	            display->show_offset(0x7D00);
   ;	
	push	32000
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@show_offset$qui
	add	sp,6
@29@3110:
   ;	
   ;	        if (gr_keys[0x3E])
   ;	
	cmp	byte ptr DGROUP:_gr_keys+62,0
	je	short @29@3166
   ;	
   ;	            display->show_offset(0xBB80);
   ;	
	push	00000BB80h
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@show_offset$qui
	add	sp,6
@29@3166:
   ;	
   ;	    }
   ;	}
   ;	
	leave	
	ret	
@check_user$qv	endp
   ;	
   ;	void teleport_to(uint arg_0)
   ;	
	assume	cs:GAME_TEXT
@teleport_to$qui	proc	far
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
	jne	short @30@86
   ;	
   ;	    {
   ;	        ego->new_loop((uchar far *)"backsub.l");
   ;	
	push	ds
	push	offset DGROUP:s@+2837
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
@30@86:
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
	push	offset DGROUP:s@+2847
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_sound$qnucuc
	add	sp,10
	jmp	short @30@142
@30@114:
   ;	
   ;	    while (var_6--) de_doit();
   ;	
	push	cs
	call	near ptr @de_doit$qv
@30@142:
	mov	ax,word ptr [bp-6]
	dec	word ptr [bp-6]
	or	ax,ax
	jne	short @30@114
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
	jne	short @30@310
   ;	
   ;	    {
   ;	        if (jason_present != 0 && touching(ego, jason))
   ;	
	cmp	byte ptr DGROUP:_jason_present,0
	je	short @30@282
	push	word ptr DGROUP:_jason+2
	push	word ptr DGROUP:_jason
	push	word ptr DGROUP:_ego+2
	push	word ptr DGROUP:_ego
	call	far ptr @touching$qn7m_actort1
	add	sp,8
	or	al,al
	je	short @30@282
   ;	
   ;	            jason->set_xy(var_2, var_4);
   ;	
	push	word ptr [bp-4]
	push	word ptr [bp-2]
	push	word ptr DGROUP:_jason+2
	push	word ptr DGROUP:_jason
	call	far ptr @m_actor@set_xy$qii
	add	sp,8
@30@282:
   ;	
   ;	        cur_sub->new_loop((uchar far *)"turn.l");
   ;	
	push	ds
	push	offset DGROUP:s@+2853
	push	word ptr DGROUP:_cur_sub+2
	push	word ptr DGROUP:_cur_sub
	call	far ptr @m_actor@new_loop$qnuc
	add	sp,8
@30@310:
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
	jmp	short @30@366
@30@338:
   ;	
   ;	    while (var_6--) de_doit();
   ;	
	push	cs
	call	near ptr @de_doit$qv
@30@366:
	mov	ax,word ptr [bp-6]
	dec	word ptr [bp-6]
	or	ax,ax
	jne	short @30@338
   ;	
   ;	    if (jason_on == 0)
   ;	
	cmp	byte ptr DGROUP:_jason_on,0
	jne	short @30@534
   ;	
   ;	    {
   ;	        if (ego->direction == 0)
   ;	
	les	bx,dword ptr DGROUP:_ego
	cmp	byte ptr es:[bx+52],0
	jne	short @30@478
   ;	
   ;	            ego->new_loop((uchar far *)"subr.l");
   ;	
	push	ds
	push	offset DGROUP:s@+2860
	jmp	short @30@506
@30@478:
   ;	
   ;	        else
   ;	            ego->new_loop((uchar far *)"subl.l");
   ;	
	push	ds
	push	offset DGROUP:s@+2867
@30@506:
	push	word ptr DGROUP:_ego+2
	push	word ptr DGROUP:_ego
	call	far ptr @m_actor@new_loop$qnuc
	add	sp,8
@30@534:
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
   ;	
   ;	void update_boss_guage(void)
   ;	
	assume	cs:GAME_TEXT
@update_boss_guage$qv	proc	far
	enter	6,0
   ;	
   ;	{
   ;	    int var_2, var_4, var_6;
   ;	
   ;	    if (boss->state == 2)
   ;	
	les	bx,dword ptr DGROUP:_boss
	cmp	byte ptr es:[bx+61],2
	jne short	@@62
	jmp	@31@702
@@62:
   ;	
   ;	        return;
   ;	    switch (cur_map)
   ;	
	mov	al,byte ptr DGROUP:_cur_map
	mov	ah,0
	cmp	ax,6
	je	short @31@198
	cmp	ax,12
	je	short @31@338
	cmp	ax,21
	je	short @31@478
	jmp	@31@590
@31@198:
   ;	
   ;	    {
   ;	        case 6:
   ;	            if (boss->x_speed != 0 && boss != 0)
   ;	
	les	bx,dword ptr DGROUP:_boss
	cmp	word ptr es:[bx+20],0
	je	short @31@282
	cmp	dword ptr DGROUP:_boss,large 0
	je	short @31@282
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
	jmp	short @31@590
@31@282:
   ;	
   ;	            else
   ;	                var_6 = 0;
   ;	
	mov	word ptr [bp-6],0
	jmp	short @31@590
   ;	
   ;	            break;
   ;	
	jmp	short @31@590
@31@338:
   ;	
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
	jne	short @31@394
   ;	
   ;	                var_2 = 0x3C - boss->field_28;
   ;	
	les	bx,dword ptr DGROUP:_boss
	mov	ax,60
	sub	ax,word ptr es:[bx+40]
	jmp	short @31@422
@31@394:
   ;	
   ;	            else
   ;	                var_2 = var_4;
   ;	
	mov	ax,word ptr [bp-4]
@31@422:
	mov	word ptr [bp-2],ax
	jmp	short @31@590
   ;	
   ;	            break;
   ;	
	jmp	short @31@590
@31@478:
   ;	
   ;	        case 0x15:
   ;	            var_6 = 1;
   ;	
	mov	word ptr [bp-6],1
   ;	
   ;	            if (boss->target != 0)
   ;	
	les	bx,dword ptr DGROUP:_boss
	cmp	dword ptr es:[bx+44],large 0
	je	short @31@534
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
	jmp	short @31@590
@31@534:
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
	jmp	short @31@590
   ;	
   ;	            }
   ;	            break;
   ;	
	jmp	short @31@590
@31@590:
   ;	
   ;	        default:
   ;	            break;
   ;	
   ;	
   ;	    }
   ;	    if (var_6 == 0)
   ;	
	cmp	word ptr [bp-6],0
	jne short	@@63
	jmp	@31@702
@@63:
   ;	
   ;	        return;
   ;	    if (var_2 < 0)
   ;	
	cmp	word ptr [bp-2],0
	jge	short @31@674
   ;	
   ;	        var_2 = 0;
   ;	
	mov	word ptr [bp-2],0
@31@674:
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
	shl	ax,1
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
	shl	ax,1
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
	shl	ax,1
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
	shl	ax,1
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
	shl	ax,1
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
@31@702:
   ;	
   ;	}
   ;	
	leave	
	ret	
@update_boss_guage$qv	endp
   ;	
   ;	void update_air_guage(int arg_0, int arg_2, int arg_4)
   ;	
	assume	cs:GAME_TEXT
@update_air_guage$qiii	proc	far
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
	jge	short @32@142
   ;	
   ;	    {
   ;	        if (air_supply + arg_0 >= 0)
   ;	
	mov	ax,word ptr DGROUP:_air_supply
	add	ax,word ptr [bp+6]
	jl	short @32@114
   ;	
   ;	            air_supply += arg_0;
   ;	
	mov	ax,word ptr [bp+6]
	add	word ptr DGROUP:_air_supply,ax
	jmp	short @32@142
@32@114:
   ;	
   ;	        else
   ;	            air_supply = 0;
   ;	
	mov	word ptr DGROUP:_air_supply,0
@32@142:
   ;	
   ;	    }
   ;	    var_1 = air_supply < 0x32 ? 0x20 : 0x60;
   ;	
	cmp	word ptr DGROUP:_air_supply,50
	jge	short @32@198
	mov	al,32
	jmp	short @32@226
@32@198:
	mov	al,96
@32@226:
	mov	byte ptr [bp-1],al
   ;	
   ;	    if (air_supply >= 2)
   ;	
	cmp	word ptr DGROUP:_air_supply,2
	jge short	@@64
	jmp	@32@282
@@64:
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
@32@282:
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
   ;	
   ;	void update_shld_guage(int arg_0, int arg_2, int arg_4)
   ;	
	assume	cs:GAME_TEXT
@update_shld_guage$qiii	proc	far
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
	jge	short @33@142
   ;	
   ;	    {
   ;	        if (shld_supply + arg_0 >= 0)
   ;	
	mov	ax,word ptr DGROUP:_shld_supply
	add	ax,word ptr [bp+6]
	jl	short @33@114
   ;	
   ;	            shld_supply += arg_0;
   ;	
	mov	ax,word ptr [bp+6]
	add	word ptr DGROUP:_shld_supply,ax
	jmp	short @33@142
@33@114:
   ;	
   ;	        else
   ;	            shld_supply = 0;
   ;	
	mov	word ptr DGROUP:_shld_supply,0
@33@142:
   ;	
   ;	    }
   ;	    var_1 = shld_supply < 0x32 ? 0x20 : 0x91;
   ;	
	cmp	word ptr DGROUP:_shld_supply,50
	jge	short @33@198
	mov	al,32
	jmp	short @33@226
@33@198:
	mov	al,145
@33@226:
	mov	byte ptr [bp-1],al
   ;	
   ;	    if (shld_supply >= 2)
   ;	
	cmp	word ptr DGROUP:_shld_supply,2
	jge short	@@65
	jmp	@33@282
@@65:
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
@33@282:
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
   ;	
   ;	void update_jason_guage(void)
   ;	
	assume	cs:GAME_TEXT
@update_jason_guage$qv	proc	far
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
	jne short	@@66
	jmp	@34@282
@@66:
   ;	
   ;	    {
   ;	        if (var_2 > 1)
   ;	
	cmp	word ptr [bp-2],1
	jg short	@@67
	jmp	@34@282
@@67:
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
	jle	short @34@142
	mov	word ptr [bp-4],100
	jmp	short @34@170
@34@142:
	mov	word ptr [bp-4],35
@34@170:
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
	jmp	short @34@254
@34@198:
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
@34@254:
	cmp	word ptr [bp-10],6
	jl	short @34@198
@34@282:
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
   ;	
   ;	void update_key_guage(void)
   ;	
	assume	cs:GAME_TEXT
@update_key_guage$qv	proc	far
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
	je	short @35@86
   ;	
   ;	        show_loop((uchar far *)"key.l", 0xEA, 0x95, 0, 0);
   ;	
	push	0
	push	0
	push	149
	push	234
	push	ds
	push	offset DGROUP:s@+2874
	call	far ptr @show_loop$qnuciiucui
	add	sp,12
@35@86:
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
   ;	
   ;	void update_gun(void)
   ;	
	assume	cs:GAME_TEXT
@update_gun$qv	proc	far
	enter	14,0
   ;	
   ;	{
   ;	    uchar far *s2;
   ;	    loop_res far *var_E;
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
	jmp	@36@366
@36@58:
   ;	
   ;	    {
   ;	        var_2 = gun_pieces_xy[var_6 * 2];
   ;	
	mov	bx,word ptr [bp-10]
	shl	bx,1
	mov	al,byte ptr DGROUP:_gun_pieces_xy[bx]
	mov	ah,0
	mov	word ptr [bp-14],ax
   ;	
   ;	        var_4 = gun_pieces_xy[var_6 * 2 + 1];
   ;	
	mov	bx,word ptr [bp-10]
	shl	bx,1
	mov	al,byte ptr DGROUP:_gun_pieces_xy[bx+1]
	mov	ah,0
	mov	word ptr [bp-12],ax
   ;	
   ;	        switch (var_6)
   ;	
	mov	bx,word ptr [bp-10]
	cmp	bx,3
	ja	short @36@282
	shl	bx,1
	jmp	word ptr cs:@36@C178[bx]
@36@170:
   ;	
   ;	        {
   ;	            case 0: s2 = (uchar far *)"gun_1.l"; break;
   ;	
	mov	word ptr [bp-2],ds
	mov	word ptr [bp-4],offset DGROUP:s@+2880
	jmp	short @36@310
@36@198:
   ;	
   ;	            case 1: s2 = (uchar far *)"gun_2.l"; break;
   ;	
	mov	word ptr [bp-2],ds
	mov	word ptr [bp-4],offset DGROUP:s@+2888
	jmp	short @36@310
@36@226:
   ;	
   ;	            case 2: s2 = (uchar far *)"gun_3.l"; break;
   ;	
	mov	word ptr [bp-2],ds
	mov	word ptr [bp-4],offset DGROUP:s@+2896
	jmp	short @36@310
@36@254:
   ;	
   ;	            case 3: s2 = (uchar far *)"gun_4.l"; break;
   ;	
	mov	word ptr [bp-2],ds
	mov	word ptr [bp-4],offset DGROUP:s@+2904
	jmp	short @36@310
@36@282:
   ;	
   ;	            default: terminate((uchar far *)"Error updating gun.", 0); break;
   ;	
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+2912
	call	far ptr @terminate$qnuct1
	add	sp,8
@36@310:
   ;	
   ;	        }
   ;	        var_E = (loop_res far *)the_game->get_loop(s2);
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
   ;	                                 var_2 + var_E->frames[0]->w,
   ;	                                 var_4 + var_E->frames[0]->h,
   ;	                                 var_E->frames[0]->bitmap, 0, 0, 0);
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
	mov	ax,word ptr [bp-12]
	add	ax,word ptr es:[bx+4]
	push	ax
	les	bx,dword ptr [bp-8]
	les	bx,dword ptr es:[bx+6]
	mov	ax,word ptr [bp-14]
	add	ax,word ptr es:[bx+6]
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
   ;	                           var_2 + var_E->frames[0]->w,
   ;	                           var_4 + var_E->frames[0]->h,
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
	mov	ax,word ptr [bp-12]
	add	ax,word ptr es:[bx+4]
	push	ax
	les	bx,dword ptr [bp-8]
	les	bx,dword ptr es:[bx+6]
	mov	ax,word ptr [bp-14]
	add	ax,word ptr es:[bx+6]
	push	ax
	push	word ptr [bp-12]
	push	word ptr [bp-14]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@copy_bits$qiiiiiiuiuiuiui
	add	sp,24
	inc	word ptr [bp-10]
@36@366:
	mov	al,byte ptr DGROUP:_gun_count
	mov	ah,0
	cmp	ax,word ptr [bp-10]
	jle short	@@68
	jmp	@36@58
@@68:
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
@36@C178	label	word
	dw	@36@170
	dw	@36@198
	dw	@36@226
	dw	@36@254
   ;	
   ;	void activate_menu_bar(void)
   ;	
	assume	cs:GAME_TEXT
@activate_menu_bar$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    i_set_text(0x30, 2, 0x18, 0x1D);
   ;	
	push	29
	push	24
	push	2
	push	48
	call	far ptr @i_set_text$qucucucuc
	add	sp,8
   ;	
   ;	    if (game_in_progress != 0)
   ;	
	cmp	byte ptr DGROUP:_game_in_progress,0
	je	short @37@86
   ;	
   ;	    {
   ;	        the_menu_bar->toggle_item((uchar far *)s1, (uchar far *)"Run Benchmark", 1);
   ;	
	push	1
	push	ds
	push	offset DGROUP:s@+2932
	push	ds
	push	offset DGROUP:_s1
	push	word ptr DGROUP:_the_menu_bar+2
	push	word ptr DGROUP:_the_menu_bar
	call	far ptr @menu_bar@toggle_item$qnuct1uc
	add	sp,14
   ;	
   ;	        the_menu_bar->toggle_item((uchar far *)"Game", (uchar far *)"Resume", 1);
   ;	
	push	1
	push	ds
	push	offset DGROUP:s@+2951
	push	ds
	push	offset DGROUP:s@+2946
	push	word ptr DGROUP:_the_menu_bar+2
	push	word ptr DGROUP:_the_menu_bar
	call	far ptr @menu_bar@toggle_item$qnuct1uc
	add	sp,14
   ;	
   ;	        the_game->pause_song();
   ;	
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@pause_song$qv
	add	sp,4
   ;	
   ;	    }
   ;	
	jmp	short @37@114
@37@86:
   ;	
   ;	    else
   ;	    {
   ;	        the_menu_bar->toggle_item((uchar far *)"Debug", (uchar far *)"Run Benchmark", 0);
   ;	
	push	0
	push	ds
	push	offset DGROUP:s@+2964
	push	ds
	push	offset DGROUP:s@+2958
	push	word ptr DGROUP:_the_menu_bar+2
	push	word ptr DGROUP:_the_menu_bar
	call	far ptr @menu_bar@toggle_item$qnuct1uc
	add	sp,14
   ;	
   ;	        the_menu_bar->toggle_item((uchar far *)"Game", (uchar far *)"Resume", 0);
   ;	
	push	0
	push	ds
	push	offset DGROUP:s@+2983
	push	ds
	push	offset DGROUP:s@+2978
	push	word ptr DGROUP:_the_menu_bar+2
	push	word ptr DGROUP:_the_menu_bar
	call	far ptr @menu_bar@toggle_item$qnuct1uc
	add	sp,14
@37@114:
   ;	
   ;	    }
   ;	    the_menu_bar->draw();
   ;	
	push	word ptr DGROUP:_the_menu_bar+2
	push	word ptr DGROUP:_the_menu_bar
	les	bx,dword ptr DGROUP:_the_menu_bar
	mov	bx,word ptr es:[bx]
	call	dword ptr [bx]
	add	sp,4
   ;	
   ;	    if (debug_mode == 1)
   ;	
	cmp	byte ptr DGROUP:_debug_mode,1
	jne	short @37@170
   ;	
   ;	    {
   ;	        ltoa((long)farcoreleft(), _tmp2, 0x0A);
   ;	
	push	10
	push	ds
	push	offset DGROUP:__tmp2
	call	far ptr _farcoreleft
	push	dx
	push	ax
	call	far ptr _ltoa
	add	sp,10
   ;	
   ;	        strcpy(_tmp, _tmp2);
   ;	
	push	ds
	push	offset DGROUP:__tmp2
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _strcpy
	add	sp,8
   ;	
   ;	        display->print_at_xy(0x104, 1, (uchar far *)_tmp, 0);
   ;	
	push	0
	push	ds
	push	offset DGROUP:__tmp
	push	1
	push	260
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@print_at_xy$qiinucuc
	add	sp,14
@37@170:
   ;	
   ;	    }
   ;	    mouse->show();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	call	far ptr @ms_mouse@show$qv
	add	sp,4
@37@198:
   ;	
   ;	    while (gr_keys[1] != 0)
   ;	
	cmp	byte ptr DGROUP:_gr_keys+1,0
	jne	short @37@198
   ;	
   ;	        ;
   ;	    _resume = 0;
   ;	
	mov	byte ptr DGROUP:__resume,0
   ;	
   ;	    the_menu_bar->field_16 = 1;
   ;	
	les	bx,dword ptr DGROUP:_the_menu_bar
	mov	word ptr es:[bx+22],1
	jmp	short @37@282
@37@254:
   ;	
   ;	    while (!gr_keys[1] && !_resume)
   ;	        i_poll_interface();
   ;	
	call	far ptr @i_poll_interface$qv
@37@282:
	mov	al,byte ptr DGROUP:_gr_keys+1
	mov	ah,0
	or	ax,ax
	jne	short @37@338
	mov	al,byte ptr DGROUP:__resume
	mov	ah,0
	or	ax,ax
	je	short @37@254
@37@338:
   ;	
   ;	    mouse->hide();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	call	far ptr @ms_mouse@hide$qv
	add	sp,4
   ;	
   ;	    the_menu_bar->erase();
   ;	
	push	word ptr DGROUP:_the_menu_bar+2
	push	word ptr DGROUP:_the_menu_bar
	les	bx,dword ptr DGROUP:_the_menu_bar
	mov	bx,word ptr es:[bx]
	call	dword ptr [bx+4]
	add	sp,4
@37@366:
   ;	
   ;	    while (gr_keys[1] != 0)
   ;	
	cmp	byte ptr DGROUP:_gr_keys+1,0
	jne	short @37@366
   ;	
   ;	        ;
   ;	    if (game_in_progress != 0 && the_game->field_1C == 1)
   ;	
	cmp	byte ptr DGROUP:_game_in_progress,0
	je	short @37@478
	les	bx,dword ptr DGROUP:_the_game
	cmp	byte ptr es:[bx+28],1
	jne	short @37@478
   ;	
   ;	        the_game->continue_song();
   ;	
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@continue_song$qv
	add	sp,4
@37@478:
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@activate_menu_bar$qv	endp
   ;	
   ;	void check_guages(void)
   ;	
	assume	cs:GAME_TEXT
@check_guages$qv	proc	far
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
	je short	@@69
	jmp	@38@450
@@69:
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
	jge	short @38@170
   ;	
   ;	        {
   ;	            if (!the_game->field_0A)
   ;	
	les	bx,dword ptr DGROUP:_the_game
	mov	al,byte ptr es:[bx+10]
	mov	ah,0
	or	ax,ax
	jne	short @38@254
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
	push	offset DGROUP:s@+2990
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
	jmp	short @38@254
   ;	
   ;	            }
   ;	        }
   ;	
	jmp	short @38@254
@38@170:
   ;	
   ;	        else if (the_game->field_0A != 0 && air_supply > 40)
   ;	
	les	bx,dword ptr DGROUP:_the_game
	cmp	byte ptr es:[bx+10],0
	je	short @38@254
	cmp	word ptr DGROUP:_air_supply,40
	jle	short @38@254
   ;	
   ;	            the_game->field_0A = 0;
   ;	
	les	bx,dword ptr DGROUP:_the_game
	mov	byte ptr es:[bx+10],0
@38@254:
   ;	
   ;	
   ;	        if (shld_supply < 40)
   ;	
	cmp	word ptr DGROUP:_shld_supply,40
	jge	short @38@366
   ;	
   ;	        {
   ;	            if (!the_game->field_0B)
   ;	
	les	bx,dword ptr DGROUP:_the_game
	mov	al,byte ptr es:[bx+11]
	mov	ah,0
	or	ax,ax
	jne	short @38@450
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
	push	offset DGROUP:s@+2995
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
	jmp	short @38@450
   ;	
   ;	            }
   ;	        }
   ;	
	jmp	short @38@450
@38@366:
   ;	
   ;	        else if (the_game->field_0B != 0 && shld_supply > 40)
   ;	
	les	bx,dword ptr DGROUP:_the_game
	cmp	byte ptr es:[bx+11],0
	je	short @38@450
	cmp	word ptr DGROUP:_shld_supply,40
	jle	short @38@450
   ;	
   ;	            the_game->field_0B = 0;
   ;	
	les	bx,dword ptr DGROUP:_the_game
	mov	byte ptr es:[bx+11],0
@38@450:
   ;	
   ;	    }
   ;	
   ;	    if (ego->state == 2)
   ;	
	les	bx,dword ptr DGROUP:_ego
	cmp	byte ptr es:[bx+61],2
	jne	short @38@506
	jmp	short @38@590
@38@506:
   ;	
   ;	        kill_ego(0, 0);
   ;	    else if (air_supply == 0 || shld_supply == 0)
   ;	
	cmp	word ptr DGROUP:_air_supply,0
	je	short @38@562
	cmp	word ptr DGROUP:_shld_supply,0
	jne	short @38@618
@38@562:
   ;	
   ;	    {
   ;	        death_type = 0;
   ;	
	mov	byte ptr DGROUP:_death_type,0
   ;	
   ;	        kill_ego(0, 0);
   ;	
@38@590:
	push	0
	push	0
	push	cs
	call	near ptr @kill_ego$qii
	add	sp,4
@38@618:
   ;	
   ;	    }
   ;	
   ;	    if (jason_present == 0)
   ;	
	cmp	byte ptr DGROUP:_jason_present,0
	jne short	@@70
	jmp	@38@1122
@@70:
   ;	
   ;	        return;
   ;	
   ;	    if (jason_count++ == 0x14)
   ;	
	mov	al,byte ptr DGROUP:_jason_count
	inc	byte ptr DGROUP:_jason_count
	cmp	al,20
	je short	@@71
	jmp	@38@1122
@@71:
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
	ja	short @38@730
   ;	
   ;	        if (var_4 <= 0x0A) goto recharge;
   ;	
	cmp	word ptr [bp-4],10
	jbe	short @38@1010
@38@730:
   ;	
   ;	drain:
   ;	        if (jason_power < 40)
   ;	
	cmp	byte ptr DGROUP:_jason_power,40
	jae	short @38@842
   ;	
   ;	        {
   ;	            if (!the_game->field_0C)
   ;	
	les	bx,dword ptr DGROUP:_the_game
	mov	al,byte ptr es:[bx+12]
	mov	ah,0
	or	ax,ax
	jne	short @38@898
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
	push	offset DGROUP:s@+3000
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
	jmp	short @38@898
   ;	
   ;	            }
   ;	        }
   ;	
	jmp	short @38@898
@38@842:
   ;	
   ;	        else if (the_game->field_0C != 0)
   ;	
	les	bx,dword ptr DGROUP:_the_game
	cmp	byte ptr es:[bx+12],0
	je	short @38@898
   ;	
   ;	            the_game->field_0C = 0;
   ;	
	les	bx,dword ptr DGROUP:_the_game
	mov	byte ptr es:[bx+12],0
@38@898:
   ;	
   ;	        if (jason_power != 0)
   ;	
	cmp	byte ptr DGROUP:_jason_power,0
	je	short @38@954
   ;	
   ;	            jason_power -= 2;
   ;	
	mov	al,byte ptr DGROUP:_jason_power
	add	al,254
	jmp	short @38@1094
@38@954:
   ;	
   ;	        else
   ;	            kill_jason();
   ;	
	push	cs
	call	near ptr @kill_jason$qv
	jmp	short @38@1122
   ;	
   ;	        goto end;
   ;	
	jmp	short @38@1122
@38@1010:
   ;	
   ;	recharge:
   ;	        if (var_2 <= 0x1E && var_4 <= 0x0A)
   ;	
	cmp	word ptr [bp-2],30
	ja	short @38@1122
	cmp	word ptr [bp-4],10
	ja	short @38@1122
   ;	
   ;	            jason_power = maximum_jason_power;
   ;	
	mov	al,byte ptr DGROUP:_maximum_jason_power
@38@1094:
	mov	byte ptr DGROUP:_jason_power,al
@38@1122:
   ;	
   ;	end:
   ;	        ;
   ;	    }
   ;	}
   ;	
	leave	
	ret	
@check_guages$qv	endp
   ;	
   ;	void update_men(void)
   ;	
	assume	cs:GAME_TEXT
@update_men$qv	proc	far
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
	mov	al,byte ptr DGROUP:_men
	mov	ah,0
	movsx	eax,ax
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
   ;	
   ;	void update_score(int arg_0, int arg_2)
   ;	
	assume	cs:GAME_TEXT
@update_score$qii	proc	far
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
	mov	ax,word ptr [bp+6]
	add	ax,dx
	push	ax
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
	je	short @40@86
	mov	ax,1
	jmp	short @40@114
@40@86:
	xor	ax,ax
@40@114:
	shl	ax,1
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
   ;	
   ;	void get_map_coords(uint arg_0, int far *arg_2, int far *arg_6)
   ;	
	assume	cs:GAME_TEXT
@get_map_coords$quinit2	proc	far
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
   ;	
   ;	void load_resources(void)
   ;	
	assume	cs:GAME_TEXT
@load_resources$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    the_game->load_loop((uchar far *)"bubsm.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3005
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"bubmd.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3013
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"subr.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3021
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"subl.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3028
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"turn.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3035
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"msl_str.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3042
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"msl_sm.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3052
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"msl_tpl.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3061
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"msl_tpr.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3071
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"msl_rkr.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3081
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"msl_rkl.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3091
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"msl_top.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3101
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"msl_pea.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3111
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"msl_spt.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3121
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"msl_red.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3131
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"msl_arwl.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3141
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"msl_arwr.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3152
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"msl_bg2l.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3163
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"msl_bg2r.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3174
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"shpbmb.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3185
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"fireball.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3194
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"explg.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3205
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"expmd.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3213
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"expsm.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3221
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"splat.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3229
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"prober.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3237
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"probel.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3246
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"fish1l.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3255
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"fish1r.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3264
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"fish2l.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3273
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"fish2r.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3282
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"scr_100.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3291
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"scr_500.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3301
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"scr_1000.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3311
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"scr_2000.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3322
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"scr_3000.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3333
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"scr_4000.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3344
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"coin.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3355
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"bonus1.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3362
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"bonus2.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3371
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"tulipl.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3380
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"tulipr.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3389
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"tulip.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3398
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"serp_r.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3406
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"serp_l.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3415
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"msl_bigl.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3424
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"msl_bigr.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3435
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"msl_hbl.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3446
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"msl_hbr.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3456
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"firbalup.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3466
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"firbaldn.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3477
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"pu_air.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3488
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"pu_fire.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3497
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"pu_shld.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3507
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"pu_jwl1.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3517
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"pu_1up.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3527
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"pu_auto.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3536
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"pu_key.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3546
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"pu_top.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3555
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"pu_jason.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3564
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"pu_jf.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3575
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"gem.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3583
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"spikes_u.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3589
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"spikes_d.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3600
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"shutl_l.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3611
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"shutl_r.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3621
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"mreal.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3631
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"freemine.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3639
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"tent_out.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3650
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"tent_in.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3661
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"mine.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3671
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"barrel1.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3678
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"barrel2.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3688
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"barrel3.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3698
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"pod1.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3708
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"pod2.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3715
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"piranar.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3722
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"piranal.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3732
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"jelly.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3742
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"backsub.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3750
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"end_dr.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3760
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"door_ud.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3769
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"duct_l.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3779
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"duct_r.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3788
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"duct_u.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3797
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"duct_d.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3806
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"block.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3815
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"block2.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3823
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"switch.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3832
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"zap_ud.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3841
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"weed1.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3850
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"chest.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3858
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"face_r.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3866
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"face_l.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3875
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"crab.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3884
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"crabdie.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3891
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"serpdie.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3901
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"probspin.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3911
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"piece_1.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3922
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"piece_2.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3932
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"piece_3.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3942
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"piece_4.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3952
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"gun_1.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3962
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"gun_2.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3970
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"gun_3.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3978
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"gun_4.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3986
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"statue.l");
   ;	
	push	ds
	push	offset DGROUP:s@+3994
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"fire_pit.l");
   ;	
	push	ds
	push	offset DGROUP:s@+4003
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"clam.l");
   ;	
	push	ds
	push	offset DGROUP:s@+4014
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"cannonr.l");
   ;	
	push	ds
	push	offset DGROUP:s@+4021
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"cannonl.l");
   ;	
	push	ds
	push	offset DGROUP:s@+4031
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"shipr.l");
   ;	
	push	ds
	push	offset DGROUP:s@+4041
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"shipl.l");
   ;	
	push	ds
	push	offset DGROUP:s@+4049
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"mouse.l");
   ;	
	push	ds
	push	offset DGROUP:s@+4057
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"key.l");
   ;	
	push	ds
	push	offset DGROUP:s@+4065
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->load_loop((uchar far *)"pat1.l");
   ;	
	push	ds
	push	offset DGROUP:s@+4071
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
   ;	
   ;	    the_game->define_sound((uchar far *)"fire1", 0);
   ;	
	push	0
	push	ds
	push	offset DGROUP:s@+4078
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@define_sound$qnucuc
	add	sp,10
   ;	
   ;	    the_game->define_sound((uchar far *)"fire2", 0);
   ;	
	push	0
	push	ds
	push	offset DGROUP:s@+4084
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@define_sound$qnucuc
	add	sp,10
   ;	
   ;	    the_game->define_sound((uchar far *)"exp1", 0);
   ;	
	push	0
	push	ds
	push	offset DGROUP:s@+4090
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@define_sound$qnucuc
	add	sp,10
   ;	
   ;	    the_game->define_sound((uchar far *)"exp2", 0);
   ;	
	push	0
	push	ds
	push	offset DGROUP:s@+4095
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@define_sound$qnucuc
	add	sp,10
   ;	
   ;	    the_game->define_sound((uchar far *)"dirhit", 0);
   ;	
	push	0
	push	ds
	push	offset DGROUP:s@+4100
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@define_sound$qnucuc
	add	sp,10
   ;	
   ;	    the_game->define_sound((uchar far *)"bubbles2", 0);
   ;	
	push	0
	push	ds
	push	offset DGROUP:s@+4107
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@define_sound$qnucuc
	add	sp,10
   ;	
   ;	    the_game->define_sound((uchar far *)"pirana", 0);
   ;	
	push	0
	push	ds
	push	offset DGROUP:s@+4116
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@define_sound$qnucuc
	add	sp,10
   ;	
   ;	    the_game->define_sound((uchar far *)"door", 0);
   ;	
	push	0
	push	ds
	push	offset DGROUP:s@+4123
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@define_sound$qnucuc
	add	sp,10
   ;	
   ;	    the_game->define_sound((uchar far *)"drillhi", 0);
   ;	
	push	0
	push	ds
	push	offset DGROUP:s@+4128
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@define_sound$qnucuc
	add	sp,10
   ;	
   ;	    the_game->define_sound((uchar far *)"zap", 0);
   ;	
	push	0
	push	ds
	push	offset DGROUP:s@+4136
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@define_sound$qnucuc
	add	sp,10
   ;	
   ;	    the_game->define_sound((uchar far *)"pup", 0);
   ;	
	push	0
	push	ds
	push	offset DGROUP:s@+4140
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@define_sound$qnucuc
	add	sp,10
   ;	
   ;	    the_game->define_sound((uchar far *)"pup2", 0);
   ;	
	push	0
	push	ds
	push	offset DGROUP:s@+4144
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@define_sound$qnucuc
	add	sp,10
   ;	
   ;	    the_game->define_sound((uchar far *)"faze", 0);
   ;	
	push	0
	push	ds
	push	offset DGROUP:s@+4149
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@define_sound$qnucuc
	add	sp,10
   ;	
   ;	    the_game->define_sound((uchar far *)"tulip", 1);
   ;	
	push	1
	push	ds
	push	offset DGROUP:s@+4154
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@define_sound$qnucuc
	add	sp,10
   ;	
   ;	    the_game->define_sound((uchar far *)"ping", 0);
   ;	
	push	0
	push	ds
	push	offset DGROUP:s@+4160
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@define_sound$qnucuc
	add	sp,10
   ;	
   ;	    the_game->define_sound((uchar far *)"tport", 0);
   ;	
	push	0
	push	ds
	push	offset DGROUP:s@+4165
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@define_sound$qnucuc
	add	sp,10
   ;	
   ;	    the_game->define_sound((uchar far *)"swish", 0);
   ;	
	push	0
	push	ds
	push	offset DGROUP:s@+4171
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@define_sound$qnucuc
	add	sp,10
   ;	
   ;	    the_game->define_sound((uchar far *)"smash", 0);
   ;	
	push	0
	push	ds
	push	offset DGROUP:s@+4177
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
   ;	
   ;	void show_high_scores(uchar arg_0)
   ;	
	assume	cs:GAME_TEXT
@show_high_scores$quc	proc	far
	enter	16,0
@43@30:
   ;	
   ;	{
   ;	    button far *block, far *var_C;
   ;	    uchar var_7;
   ;	    int  var_2, var_4, var_6;
   ;	
   ;	restart:
   ;	    display->save_palette();
   ;	
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@save_palette$qv
	add	sp,4
   ;	
   ;	    display->blank_palette();
   ;	
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@blank_palette$qv
	add	sp,4
   ;	
   ;	    display->show_pcx((uchar far *)"p_highs.pcx", 0, 0, -1);
   ;	
	push	-1
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+4183
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@show_pcx$qnucucuii
	add	sp,14
   ;	
   ;	    i_set_text(0x40, 2, 0x1C, 0x9E);
   ;	
	push	158
	push	28
	push	2
	push	64
	call	far ptr @i_set_text$qucucucuc
	add	sp,8
   ;	
   ;	    var_4 = 0x46;
   ;	
	mov	word ptr [bp-14],70
   ;	
   ;	    var_6 = 0x1E;
   ;	
	mov	word ptr [bp-16],30
   ;	
   ;	    var_2 = 0;
   ;	
	mov	word ptr [bp-12],0
	jmp	@43@254
@43@58:
   ;	
   ;	    goto row_check;
   ;	row_body:
   ;	    i_set_text(0x80, 2, 0x87, 0x9F);
   ;	
	push	159
	push	135
	push	2
	push	128
	call	far ptr @i_set_text$qucucucuc
	add	sp,8
   ;	
   ;	    if (var_2 == 0)
   ;	
	cmp	word ptr [bp-12],0
	jne	short @43@114
   ;	
   ;	        i_set_text(0x40, 2, 0x1C, 0x9E);
   ;	
	push	158
	push	28
	push	2
	push	64
	jmp	short @43@198
@43@114:
   ;	
   ;	    else if (arg_0 != 0 && arg_0 == var_2 + 1)
   ;	
	cmp	byte ptr [bp+6],0
	je	short @43@226
	mov	al,byte ptr [bp+6]
	mov	ah,0
	mov	dx,word ptr [bp-12]
	inc	dx
	cmp	ax,dx
	jne	short @43@226
   ;	
   ;	        i_set_text(0x30, 2, 0x18, 0x1D);
   ;	
	push	29
	push	24
	push	2
	push	48
@43@198:
	call	far ptr @i_set_text$qucucucuc
	add	sp,8
@43@226:
   ;	
   ;	    itoa(var_2 + 1, _tmp, 0x0A);
   ;	
	push	10
	push	ds
	push	offset DGROUP:__tmp
	mov	ax,word ptr [bp-12]
	inc	ax
	push	ax
	call	far ptr _itoa
	add	sp,8
   ;	
   ;	    strcat(_tmp, _src);
   ;	
	push	ds
	push	offset DGROUP:__src
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _strcat
	add	sp,8
   ;	
   ;	    display->print_at_xy(var_4, var_6 + var_2 * 0x0A, (uchar far *)_tmp, 0);
   ;	
	push	0
	push	ds
	push	offset DGROUP:__tmp
	mov	ax,word ptr [bp-12]
	imul	ax,ax,10
	mov	dx,word ptr [bp-16]
	add	dx,ax
	push	dx
	push	word ptr [bp-14]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@print_at_xy$qiinucuc
	add	sp,14
   ;	
   ;	    strcpy(_tmp, return_element(var_2, 2));
   ;	
	push	2
	mov	al,byte ptr [bp-12]
	push	ax
	call	far ptr @return_element$qucuc
	add	sp,4
	push	dx
	push	ax
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _strcpy
	add	sp,8
   ;	
   ;	    display->print_at_xy(var_4 + 0x28, var_6 + var_2 * 0x0A, (uchar far *)_tmp, 0);
   ;	
	push	0
	push	ds
	push	offset DGROUP:__tmp
	mov	ax,word ptr [bp-12]
	imul	ax,ax,10
	mov	dx,word ptr [bp-16]
	add	dx,ax
	push	dx
	mov	ax,word ptr [bp-14]
	add	ax,40
	push	ax
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@print_at_xy$qiinucuc
	add	sp,14
   ;	
   ;	    strcpy(_tmp, return_element(var_2, 1));
   ;	
	push	1
	mov	al,byte ptr [bp-12]
	push	ax
	call	far ptr @return_element$qucuc
	add	sp,4
	push	dx
	push	ax
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _strcpy
	add	sp,8
   ;	
   ;	    display->print_at_xy(var_4 + 0x8C, var_6 + var_2 * 0x0A, (uchar far *)_tmp, 0);
   ;	
	push	0
	push	ds
	push	offset DGROUP:__tmp
	mov	ax,word ptr [bp-12]
	imul	ax,ax,10
	mov	dx,word ptr [bp-16]
	add	dx,ax
	push	dx
	mov	ax,word ptr [bp-14]
	add	ax,140
	push	ax
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@print_at_xy$qiinucuc
	add	sp,14
   ;	
   ;	    var_2++;
   ;	
	inc	word ptr [bp-12]
@43@254:
   ;	
   ;	row_check:
   ;	    if (var_2 < 0x0A)
   ;	
	cmp	word ptr [bp-12],10
	jge short	@@72
	jmp	@43@58
@@72:
   ;	
   ;	        goto row_body;
   ;	    i_set_text(0x30, 2, 0x18, 0x1D);
   ;	
	push	29
	push	24
	push	2
	push	48
	call	far ptr @i_set_text$qucucucuc
	add	sp,8
   ;	
   ;	    strcpy(_tmp, "Your Score");
   ;	
	push	ds
	push	offset DGROUP:s@+4195
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _strcpy
	add	sp,8
   ;	
   ;	    strcat(_tmp, ltoa(score, _tmp2, 0x0A));
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
	call	far ptr _strcat
	add	sp,8
   ;	
   ;	    display->print_at_xy(var_4 - 0x0A, var_6 + 0x78, (uchar far *)_tmp, 0);
   ;	
	push	0
	push	ds
	push	offset DGROUP:__tmp
	mov	ax,word ptr [bp-16]
	add	ax,120
	push	ax
	mov	ax,word ptr [bp-14]
	add	ax,-10
	push	ax
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@print_at_xy$qiinucuc
	add	sp,14
   ;	
   ;	    i_set_text(0x30, 2, 0x18, 0x1D);
   ;	
	push	29
	push	24
	push	2
	push	48
	call	far ptr @i_set_text$qucucucuc
	add	sp,8
   ;	
   ;	    block = new button((uchar far *)"Reset", (void far *)0, 0);
   ;	
	push	0
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+4206
	push	0
	push	0
	call	far ptr @button@$bctr$qnucnvuc
	add	sp,14
	mov	word ptr [bp-2],dx
	mov	word ptr [bp-4],ax
   ;	
   ;	    var_C = new button((uchar far *)"Ok", (void far *)0, 0);
   ;	
	push	0
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+4212
	push	0
	push	0
	call	far ptr @button@$bctr$qnucnvuc
	add	sp,14
	mov	word ptr [bp-6],dx
	mov	word ptr [bp-8],ax
   ;	
   ;	    block->field_18 = 0xA0;
   ;	
	les	bx,dword ptr [bp-4]
	mov	word ptr es:[bx+24],160
   ;	
   ;	    block->field_1A = 0xB7;
   ;	
	les	bx,dword ptr [bp-4]
	mov	word ptr es:[bx+26],183
   ;	
   ;	    var_C->field_18 = 0xE6;
   ;	
	les	bx,dword ptr [bp-8]
	mov	word ptr es:[bx+24],230
   ;	
   ;	    var_C->field_1A = 0xB7;
   ;	
	les	bx,dword ptr [bp-8]
	mov	word ptr es:[bx+26],183
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
   ;	    var_C->draw();
   ;	
	push	word ptr [bp-6]
	push	word ptr [bp-8]
	les	bx,dword ptr [bp-8]
	mov	bx,word ptr es:[bx]
	call	dword ptr [bx]
	add	sp,4
   ;	
   ;	    var_C->mouse_to_me();
   ;	
	push	word ptr [bp-6]
	push	word ptr [bp-8]
	call	far ptr @button@mouse_to_me$qv
	add	sp,4
   ;	
   ;	    display->set_palette();
   ;	
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@set_palette$qv
	add	sp,4
   ;	
   ;	    mouse->show();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	call	far ptr @ms_mouse@show$qv
	add	sp,4
@43@310:
   ;	
   ;	    while (de_button())
   ;	
	call	far ptr @de_button$qv
	or	al,al
	jne	short @43@310
   ;	
   ;	        ;
   ;	    var_2 = 0x438;
   ;	
	mov	word ptr [bp-12],1080
   ;	
   ;	    var_7 = 1;
   ;	
	mov	byte ptr [bp-9],1
	jmp	@43@646
@43@366:
   ;	
   ;	    while ((int)var_C->poll() == 0)
   ;	    {
   ;	        if ((*i_external_left)() || (*i_external_right)())
   ;	
	call	dword ptr DGROUP:_i_external_left
	or	al,al
	jne	short @43@422
	call	dword ptr DGROUP:_i_external_right
	or	al,al
	je	short @43@506
@43@422:
   ;	
   ;	        {
   ;	            display->pause(0x0A);
   ;	
	push	10
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@pause$qui
	add	sp,6
   ;	
   ;	            var_7 ^= 1;
   ;	
	xor	byte ptr [bp-9],1
   ;	
   ;	            ((button far **)&block)[var_7]->mouse_to_me();
   ;	
	mov	al,byte ptr [bp-9]
	mov	ah,0
	shl	ax,2
	lea	dx,word ptr [bp-4]
	add	ax,dx
	mov	bx,ax
	push	word ptr ss:[bx+2]
	push	word ptr ss:[bx]
	call	far ptr @button@mouse_to_me$qv
	add	sp,4
@43@450:
   ;	
   ;	            while ((*i_external_left)() || (*i_external_right)())
   ;	
	call	dword ptr DGROUP:_i_external_left
	or	al,al
	jne	short @43@450
	call	dword ptr DGROUP:_i_external_right
	or	al,al
	jne	short @43@450
@43@506:
   ;	
   ;	                ;
   ;	        }
   ;	        if (block->poll())
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	les	bx,dword ptr [bp-4]
	mov	bx,word ptr es:[bx]
	call	dword ptr [bx+8]
	add	sp,4
	or	al,al
	je	short @43@618
   ;	
   ;	        {
   ;	            if ((int)i_yes_cancel((uchar far *)"Are you sure you want to\n"
   ;	
   ;	
   ;	                             "reset the high scores?", 0) == 0)
   ;	
	push	0
	push	ds
	push	offset DGROUP:s@+4215
	call	far ptr @i_yes_cancel$qnucuc
	add	sp,6
	or	al,al
	jne	short @43@590
   ;	
   ;	            {
   ;	                init_scores_file();
   ;	
	call	far ptr @init_scores_file$qv
   ;	
   ;	                delete block;
   ;	
	push	3
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @button@$bdtr$qv
	add	sp,6
   ;	
   ;	                delete var_C;
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
	call	far ptr @ms_mouse@hide$qv
	add	sp,4
   ;	
   ;	                goto restart;
   ;	
	jmp	@43@30
@43@590:
   ;	
   ;	            }
   ;	            block->field_20 = 0;
   ;	
	les	bx,dword ptr [bp-4]
	mov	word ptr es:[bx+32],0
@43@618:
   ;	
   ;	        }
   ;	        display->pause(1);
   ;	
	push	1
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@pause$qui
	add	sp,6
   ;	
   ;	        if (var_2-- == 0)
   ;	
	mov	ax,word ptr [bp-12]
	dec	word ptr [bp-12]
	or	ax,ax
	je	short @43@674
@43@646:
	push	word ptr [bp-6]
	push	word ptr [bp-8]
	les	bx,dword ptr [bp-8]
	mov	bx,word ptr es:[bx]
	call	dword ptr [bx+8]
	add	sp,4
	or	al,al
	jne short	@@73
	jmp	@43@366
@@73:
@43@674:
   ;	
   ;	            break;
   ;	    }
   ;	    delete block;
   ;	
	push	3
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @button@$bdtr$qv
	add	sp,6
   ;	
   ;	    delete var_C;
   ;	
	push	3
	push	word ptr [bp-6]
	push	word ptr [bp-8]
	call	far ptr @button@$bdtr$qv
	add	sp,6
   ;	
   ;	    mouse->hide();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	call	far ptr @ms_mouse@hide$qv
	add	sp,4
   ;	
   ;	    display->cls(0, 0);
   ;	
	push	0
	push	0
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@cls$qucuc
	add	sp,8
   ;	
   ;	    display->restore_palette();
   ;	
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@restore_palette$qv
	add	sp,4
   ;	
   ;	    display->set_palette();
   ;	
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@set_palette$qv
	add	sp,4
   ;	
   ;	}
   ;	
	leave	
	ret	
@show_high_scores$quc	endp
   ;	
   ;	void start_title_loop(void)
   ;	
	assume	cs:GAME_TEXT
@start_title_loop$qv	proc	far
	enter	2,0
   ;	
   ;	{
   ;	    int var_2;
   ;	
   ;	    the_game->play_song((uchar far *)"title.cmf");
   ;	
	push	ds
	push	offset DGROUP:s@+4263
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_song$qnuc
	add	sp,8
   ;	
   ;	    display->blank_palette();
   ;	
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@blank_palette$qv
	add	sp,4
   ;	
   ;	    display->show_pcx((uchar far *)"p_title.pcx", 0, 0, -1);
   ;	
	push	-1
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+4273
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@show_pcx$qnucucuii
	add	sp,14
   ;	
   ;	    display->set_palette();
   ;	
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@set_palette$qv
	add	sp,4
   ;	
   ;	    i_set_text(0x30, 2, 0x18, 0x1D);
   ;	
	push	29
	push	24
	push	2
	push	48
	call	far ptr @i_set_text$qucucucuc
	add	sp,8
   ;	
   ;	    if (the_game->sb_present == 0)
   ;	
	les	bx,dword ptr DGROUP:_the_game
	cmp	byte ptr es:[bx+6],0
	jne	short @44@86
   ;	
   ;	        the_game->play_sound_file((uchar far *)"title");
   ;	
	push	ds
	push	offset DGROUP:s@+4285
	jmp	short @44@114
@44@86:
   ;	
   ;	    else
   ;	        the_game->play_sound_file((uchar far *)"pup2");
   ;	
	push	ds
	push	offset DGROUP:s@+4291
@44@114:
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_sound_file$qnuc
	add	sp,8
   ;	
   ;	    if (saw_title_screen != 0)
   ;	
	cmp	byte ptr DGROUP:_saw_title_screen,0
	je short	@@74
	jmp	@44@478
@@74:
   ;	
   ;	        return;
   ;	    saw_title_screen++;
   ;	
	inc	byte ptr DGROUP:_saw_title_screen
	jmp	short @44@226
@44@198:
   ;	
   ;	    while (the_game->field_2B != 0)
   ;	        the_game->doit();
   ;	
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@doit$qv
	add	sp,4
@44@226:
	les	bx,dword ptr DGROUP:_the_game
	cmp	byte ptr es:[bx+43],0
	jne	short @44@198
   ;	
   ;	    var_2 = 0x12C;
   ;	
	mov	word ptr [bp-2],300
	jmp	short @44@422
@44@282:
   ;	
   ;	    while (the_game->field_2B == 0 && var_2-- != 0)
   ;	    {
   ;	        if (!god_mode && gr_keys[0x22] && gr_keys[0x38])
   ;	
	mov	al,byte ptr DGROUP:_god_mode
	mov	ah,0
	or	ax,ax
	jne	short @44@394
	cmp	byte ptr DGROUP:_gr_keys+34,0
	je	short @44@394
	cmp	byte ptr DGROUP:_gr_keys+56,0
	je	short @44@394
   ;	
   ;	        {
   ;	            the_game->play_sound_file((uchar far *)"sum");
   ;	
	push	ds
	push	offset DGROUP:s@+4296
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_sound_file$qnuc
	add	sp,8
   ;	
   ;	            god_mode = 1;
   ;	
	mov	byte ptr DGROUP:_god_mode,1
@44@394:
   ;	
   ;	        }
   ;	        display->pause(1);
   ;	
	push	1
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@pause$qui
	add	sp,6
   ;	
   ;	        the_game->doit();
   ;	
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@doit$qv
	add	sp,4
@44@422:
	les	bx,dword ptr DGROUP:_the_game
	cmp	byte ptr es:[bx+43],0
	jne	short @44@478
	mov	ax,word ptr [bp-2]
	dec	word ptr [bp-2]
	or	ax,ax
	jne	short @44@282
@44@478:
   ;	
   ;	    }
   ;	}
   ;	
	leave	
	ret	
@start_title_loop$qv	endp
   ;	
   ;	void show_stats(void)
   ;	
	assume	cs:GAME_TEXT
@show_stats$qv	proc	far
	enter	40,0
   ;	
   ;	{
   ;	    uchar far *dest;
   ;	    uchar far *block;
   ;	    int var_2, var_4, var_6, var_8, var_A, var_C, var_E;
   ;	    int var_10, var_14, var_16, var_18, var_1A, var_1C, var_1E, value;
   ;	
   ;	    non_displayed_page = displayed_page = 0;
   ;	
	mov	al,0
	mov	byte ptr DGROUP:_displayed_page,al
	mov	byte ptr DGROUP:_non_displayed_page,al
   ;	
   ;	    display->show_offset(0);
   ;	
	push	0
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@show_offset$qui
	add	sp,6
   ;	
   ;	    the_game->reset_sound();
   ;	
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@reset_sound$qv
	add	sp,4
   ;	
   ;	    the_game->reset_player(0);
   ;	
	push	0
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@reset_player$quc
	add	sp,6
   ;	
   ;	    the_game->play_song((uchar far *)"stats.cmf");
   ;	
	push	ds
	push	offset DGROUP:s@+4300
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_song$qnuc
	add	sp,8
   ;	
   ;	    the_game->define_sound((uchar far *)"add", 0);
   ;	
	push	0
	push	ds
	push	offset DGROUP:s@+4310
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@define_sound$qnucuc
	add	sp,10
   ;	
   ;	    the_game->define_sound((uchar far *)"sum", 0);
   ;	
	push	0
	push	ds
	push	offset DGROUP:s@+4314
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@define_sound$qnucuc
	add	sp,10
   ;	
   ;	    i_set_text(0x30, 2, 0x18, 0x1D);
   ;	
	push	29
	push	24
	push	2
	push	48
	call	far ptr @i_set_text$qucucucuc
	add	sp,8
   ;	
   ;	    var_2 = air_supply;
   ;	
	mov	ax,word ptr DGROUP:_air_supply
	mov	word ptr [bp-10],ax
   ;	
   ;	    var_4 = shld_supply;
   ;	
	mov	ax,word ptr DGROUP:_shld_supply
	mov	word ptr [bp-12],ax
   ;	
   ;	    var_1E = 0;
   ;	
	mov	word ptr [bp-36],0
   ;	
   ;	    var_6 = 0x41;
   ;	
	mov	word ptr [bp-14],65
   ;	
   ;	    var_8 = 0x69;
   ;	
	mov	word ptr [bp-16],105
   ;	
   ;	    var_A = var_6;
   ;	
	mov	ax,word ptr [bp-14]
	mov	word ptr [bp-18],ax
   ;	
   ;	    var_C = var_8 + 0x0A;
   ;	
	mov	ax,word ptr [bp-16]
	add	ax,10
	mov	word ptr [bp-20],ax
   ;	
   ;	    var_18 = 0x54;
   ;	
	mov	word ptr [bp-30],84
   ;	
   ;	    var_1A = 0x54;
   ;	
	mov	word ptr [bp-32],84
   ;	
   ;	    var_1C = 0xF9;
   ;	
	mov	word ptr [bp-34],249
   ;	
   ;	    var_E = 0xA0;
   ;	
	mov	word ptr [bp-22],160
   ;	
   ;	    if (!enemy_count || !goody_count)
   ;	
	mov	al,byte ptr DGROUP:_enemy_count
	mov	ah,0
	or	ax,ax
	je	short @45@86
	mov	al,byte ptr DGROUP:_goody_count
	mov	ah,0
	or	ax,ax
	jne	short @45@114
@45@86:
   ;	
   ;	        terminate((uchar far *)"Attempt to divide by zero in show_stats",
   ;	
   ;	
   ;	                  (uchar far *)0);
   ;	
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+4318
	call	far ptr @terminate$qnuct1
	add	sp,8
@45@114:
   ;	
   ;	    var_10 = (int)(goodies_found / (float)goody_count * 100.0);
   ;	
	mov	al,byte ptr DGROUP:_goodies_found
	mov	ah,0
	mov	word ptr [bp-40],ax
	fild	word ptr [bp-40]
	mov	al,byte ptr DGROUP:_goody_count
	mov	ah,0
	mov	word ptr [bp-40],ax
	fild	word ptr [bp-40]
	fdiv	
	fmul	dword ptr DGROUP:s@+4358
	call	far ptr F_FTOL@
	mov	word ptr [bp-24],ax
   ;	
   ;	    value = (int)(enemies_killed / (float)enemy_count * 100.0);
   ;	
	mov	al,byte ptr DGROUP:_enemies_killed
	mov	ah,0
	mov	word ptr [bp-40],ax
	fild	word ptr [bp-40]
	mov	al,byte ptr DGROUP:_enemy_count
	mov	ah,0
	mov	word ptr [bp-40],ax
	fild	word ptr [bp-40]
	fdiv	
	fmul	dword ptr DGROUP:s@+4358
	call	far ptr F_FTOL@
	mov	word ptr [bp-38],ax
   ;	
   ;	    display->blank_palette();
   ;	
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@blank_palette$qv
	add	sp,4
   ;	
   ;	    dest = new uchar[0x300];
   ;	
	push	768
	call	far ptr @$bnew$qui
	pop	cx
	mov	word ptr [bp-2],dx
	mov	word ptr [bp-4],ax
   ;	
   ;	    if (dest == 0)
   ;	
	cmp	dword ptr [bp-4],large 0
	jne	short @45@170
   ;	
   ;	        no_heap((uchar far *)"show stats");
   ;	
	push	ds
	push	offset DGROUP:s@+4362
	call	far ptr @no_heap$qnuc
	add	sp,4
@45@170:
   ;	
   ;	    memcpy(dest, _palette, 0x300);
   ;	
	push	768
	push	ds
	push	offset DGROUP:__palette
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr _memcpy
	add	sp,10
   ;	
   ;	    display->show_pcx((uchar far *)"p_stats.pcx", 0, 0, -1);
   ;	
	push	-1
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+4373
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@show_pcx$qnucucuii
	add	sp,14
   ;	
   ;	    var_14 = 0xD2;
   ;	
	mov	word ptr [bp-26],210
   ;	
   ;	    var_16 = 0x0A;
   ;	
	mov	word ptr [bp-28],10
   ;	
   ;	    show_loop((uchar far *)"otis.l", var_14, var_16, 0, 0);
   ;	
	push	0
	push	0
	push	word ptr [bp-28]
	push	word ptr [bp-26]
	push	ds
	push	offset DGROUP:s@+4385
	call	far ptr @show_loop$qnuciiucui
	add	sp,12
   ;	
   ;	    update_air_guage(0, var_18, 0xA7);
   ;	
	push	167
	push	word ptr [bp-30]
	push	0
	push	cs
	call	near ptr @update_air_guage$qiii
	add	sp,6
   ;	
   ;	    update_shld_guage(0, var_1A, 0xB3);
   ;	
	push	179
	push	word ptr [bp-32]
	push	0
	push	cs
	call	near ptr @update_shld_guage$qiii
	add	sp,6
   ;	
   ;	    update_score(var_1C, 0x9F);
   ;	
	push	159
	push	word ptr [bp-34]
	push	cs
	call	near ptr @update_score$qii
	add	sp,4
   ;	
   ;	    strcpy((char *)_tmp, "Enemies destroyed : ");
   ;	
	push	ds
	push	offset DGROUP:s@+4392
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _strcpy
	add	sp,8
   ;	
   ;	    strcat((char *)_tmp, itoa(value, _tmp2, 0x0A));
   ;	
	push	10
	push	ds
	push	offset DGROUP:__tmp2
	push	word ptr [bp-38]
	call	far ptr _itoa
	add	sp,8
	push	dx
	push	ax
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _strcat
	add	sp,8
   ;	
   ;	    strcat((char *)_tmp, "%");
   ;	
	push	ds
	push	offset DGROUP:s@+4413
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _strcat
	add	sp,8
   ;	
   ;	    display->print_at_xy(var_6, var_8 - 0x1E, (uchar far *)_tmp, 0);
   ;	
	push	0
	push	ds
	push	offset DGROUP:__tmp
	mov	ax,word ptr [bp-16]
	add	ax,-30
	push	ax
	push	word ptr [bp-14]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@print_at_xy$qiinucuc
	add	sp,14
   ;	
   ;	    strcpy((char *)_tmp, "Goodies\t\t  : ");
   ;	
	push	ds
	push	offset DGROUP:s@+4415
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _strcpy
	add	sp,8
   ;	
   ;	    strcat((char *)_tmp, itoa(var_10, _tmp2, 0x0A));
   ;	
	push	10
	push	ds
	push	offset DGROUP:__tmp2
	push	word ptr [bp-24]
	call	far ptr _itoa
	add	sp,8
	push	dx
	push	ax
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _strcat
	add	sp,8
   ;	
   ;	    strcat((char *)_tmp, "%");
   ;	
	push	ds
	push	offset DGROUP:s@+4429
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _strcat
	add	sp,8
   ;	
   ;	    display->print_at_xy(var_6, var_8 - 0x14, (uchar far *)_tmp, 0);
   ;	
	push	0
	push	ds
	push	offset DGROUP:__tmp
	mov	ax,word ptr [bp-16]
	add	ax,-20
	push	ax
	push	word ptr [bp-14]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@print_at_xy$qiinucuc
	add	sp,14
   ;	
   ;	    display->print_at_xy(var_6, var_8, (uchar far *)"Bonus X 50\t  :", 0);
   ;	
	push	0
	push	ds
	push	offset DGROUP:s@+4431
	push	word ptr [bp-16]
	push	word ptr [bp-14]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@print_at_xy$qiinucuc
	add	sp,14
   ;	
   ;	    display->print_at_xy(var_A, var_C, (uchar far *)"Bonus X 100\t  :", 0);
   ;	
	push	0
	push	ds
	push	offset DGROUP:s@+4446
	push	word ptr [bp-20]
	push	word ptr [bp-18]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@print_at_xy$qiinucuc
	add	sp,14
   ;	
   ;	    display->set_palette();
   ;	
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@set_palette$qv
	add	sp,4
   ;	
   ;	    block = (uchar far *)display->get_bits(var_6 + var_E, var_8,
   ;	
   ;	
   ;	                                           var_6 + var_E + 0x28, var_8 + 0x0A);
   ;	
	mov	ax,word ptr [bp-16]
	add	ax,10
	push	ax
	mov	ax,word ptr [bp-14]
	add	ax,word ptr [bp-22]
	add	ax,40
	push	ax
	push	word ptr [bp-16]
	mov	ax,word ptr [bp-14]
	add	ax,word ptr [bp-22]
	push	ax
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@get_bits$qiiii
	add	sp,12
	mov	word ptr [bp-6],dx
	mov	word ptr [bp-8],ax
	jmp	@45@226
@45@198:
   ;	
   ;	    while (air_supply != 0 && !the_game->field_2B)
   ;	    {
   ;	        the_game->doit();
   ;	
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@doit$qv
	add	sp,4
   ;	
   ;	        the_game->play_sound((uchar far *)"add", 0x0F);
   ;	
	push	15
	push	ds
	push	offset DGROUP:s@+4462
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_sound$qnucuc
	add	sp,10
   ;	
   ;	        pause(3);
   ;	
	push	3
	call	far ptr @pause$qui
	pop	cx
   ;	
   ;	        var_1E += 0x96;
   ;	
	add	word ptr [bp-36],150
   ;	
   ;	        update_air_guage(-3, var_18, 0xA7);
   ;	
	push	167
	push	word ptr [bp-30]
	push	-3
	push	cs
	call	near ptr @update_air_guage$qiii
	add	sp,6
   ;	
   ;	        display->put_bits(var_6 + var_E, var_8, var_6 + var_E + 0x28,
   ;	
   ;	
   ;	                          var_8 + 0x0A, block, 0, 0);
   ;	
	push	0
	push	0
	push	word ptr [bp-6]
	push	word ptr [bp-8]
	mov	ax,word ptr [bp-16]
	add	ax,10
	push	ax
	mov	ax,word ptr [bp-14]
	add	ax,word ptr [bp-22]
	add	ax,40
	push	ax
	push	word ptr [bp-16]
	mov	ax,word ptr [bp-14]
	add	ax,word ptr [bp-22]
	push	ax
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@put_bits$qiiiinucuiui
	add	sp,20
   ;	
   ;	        display->print_at_xy(var_6 + var_E, var_8,
   ;	
   ;	
   ;	                             (uchar far *)itoa(var_1E, _tmp, 0x0A), 0);
   ;	
	push	0
	push	10
	push	ds
	push	offset DGROUP:__tmp
	push	word ptr [bp-36]
	call	far ptr _itoa
	add	sp,8
	push	dx
	push	ax
	push	word ptr [bp-16]
	mov	ax,word ptr [bp-14]
	add	ax,word ptr [bp-22]
	push	ax
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@print_at_xy$qiinucuc
	add	sp,14
@45@226:
	cmp	word ptr DGROUP:_air_supply,0
	je	short @45@282
	les	bx,dword ptr DGROUP:_the_game
	mov	al,byte ptr es:[bx+43]
	mov	ah,0
	or	ax,ax
	jne short	@@75
	jmp	@45@198
@@75:
@45@282:
   ;	
   ;	    }
   ;	    air_supply = 0;
   ;	
	mov	word ptr DGROUP:_air_supply,0
   ;	
   ;	    score += var_2 * 0x32;
   ;	
	mov	ax,word ptr [bp-10]
	imul	ax,ax,50
	movsx	eax,ax
	add	dword ptr DGROUP:_score,eax
   ;	
   ;	    var_1E = var_2 * 0x32;
   ;	
	mov	ax,word ptr [bp-10]
	imul	ax,ax,50
	mov	word ptr [bp-36],ax
   ;	
   ;	    display->put_bits(var_6 + var_E, var_8, var_6 + var_E + 0x28,
   ;	
   ;	
   ;	                      var_8 + 0x0A, block, 0, 0);
   ;	
	push	0
	push	0
	push	word ptr [bp-6]
	push	word ptr [bp-8]
	mov	ax,word ptr [bp-16]
	add	ax,10
	push	ax
	mov	ax,word ptr [bp-14]
	add	ax,word ptr [bp-22]
	add	ax,40
	push	ax
	push	word ptr [bp-16]
	mov	ax,word ptr [bp-14]
	add	ax,word ptr [bp-22]
	push	ax
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@put_bits$qiiiinucuiui
	add	sp,20
   ;	
   ;	    display->print_at_xy(var_6 + var_E, var_8,
   ;	
   ;	
   ;	                         (uchar far *)itoa(var_1E, _tmp, 0x0A), 0);
   ;	
	push	0
	push	10
	push	ds
	push	offset DGROUP:__tmp
	push	word ptr [bp-36]
	call	far ptr _itoa
	add	sp,8
	push	dx
	push	ax
	push	word ptr [bp-16]
	mov	ax,word ptr [bp-14]
	add	ax,word ptr [bp-22]
	push	ax
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@print_at_xy$qiinucuc
	add	sp,14
   ;	
   ;	    update_score(var_1C, 0x9F);
   ;	
	push	159
	push	word ptr [bp-34]
	push	cs
	call	near ptr @update_score$qii
	add	sp,4
   ;	
   ;	    i_set_text(0x30, 2, 0x18, 0x1D);
   ;	
	push	29
	push	24
	push	2
	push	48
	call	far ptr @i_set_text$qucucucuc
	add	sp,8
   ;	
   ;	    update_air_guage(0, var_18, 0xA7);
   ;	
	push	167
	push	word ptr [bp-30]
	push	0
	push	cs
	call	near ptr @update_air_guage$qiii
	add	sp,6
   ;	
   ;	    delete block;
   ;	
	push	word ptr [bp-6]
	push	word ptr [bp-8]
	call	far ptr @$bdele$qnv
	add	sp,4
   ;	
   ;	    block = (uchar far *)display->get_bits(var_A + var_E, var_C,
   ;	
   ;	
   ;	                                           var_A + var_E + 0x28, var_C + 0x0A);
   ;	
	mov	ax,word ptr [bp-20]
	add	ax,10
	push	ax
	mov	ax,word ptr [bp-18]
	add	ax,word ptr [bp-22]
	add	ax,40
	push	ax
	push	word ptr [bp-20]
	mov	ax,word ptr [bp-18]
	add	ax,word ptr [bp-22]
	push	ax
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@get_bits$qiiii
	add	sp,12
	mov	word ptr [bp-6],dx
	mov	word ptr [bp-8],ax
   ;	
   ;	    var_1E = 0;
   ;	
	mov	word ptr [bp-36],0
	jmp	@45@338
@45@310:
   ;	
   ;	    while (shld_supply != 0 && !the_game->field_2B)
   ;	    {
   ;	        the_game->doit();
   ;	
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@doit$qv
	add	sp,4
   ;	
   ;	        the_game->play_sound((uchar far *)"add", 0x0F);
   ;	
	push	15
	push	ds
	push	offset DGROUP:s@+4466
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_sound$qnucuc
	add	sp,10
   ;	
   ;	        pause(3);
   ;	
	push	3
	call	far ptr @pause$qui
	pop	cx
   ;	
   ;	        update_shld_guage(-3, var_1A, 0xB3);
   ;	
	push	179
	push	word ptr [bp-32]
	push	-3
	push	cs
	call	near ptr @update_shld_guage$qiii
	add	sp,6
   ;	
   ;	        var_1E += 0x12C;
   ;	
	add	word ptr [bp-36],300
   ;	
   ;	        display->put_bits(var_A + var_E, var_C, var_A + var_E + 0x28,
   ;	
   ;	
   ;	                          var_C + 0x0A, block, 0, 0);
   ;	
	push	0
	push	0
	push	word ptr [bp-6]
	push	word ptr [bp-8]
	mov	ax,word ptr [bp-20]
	add	ax,10
	push	ax
	mov	ax,word ptr [bp-18]
	add	ax,word ptr [bp-22]
	add	ax,40
	push	ax
	push	word ptr [bp-20]
	mov	ax,word ptr [bp-18]
	add	ax,word ptr [bp-22]
	push	ax
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@put_bits$qiiiinucuiui
	add	sp,20
   ;	
   ;	        display->print_at_xy(var_A + var_E, var_C,
   ;	
   ;	
   ;	                             (uchar far *)itoa(var_1E, _tmp, 0x0A), 0);
   ;	
	push	0
	push	10
	push	ds
	push	offset DGROUP:__tmp
	push	word ptr [bp-36]
	call	far ptr _itoa
	add	sp,8
	push	dx
	push	ax
	push	word ptr [bp-20]
	mov	ax,word ptr [bp-18]
	add	ax,word ptr [bp-22]
	push	ax
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@print_at_xy$qiinucuc
	add	sp,14
@45@338:
	cmp	word ptr DGROUP:_shld_supply,0
	je	short @45@394
	les	bx,dword ptr DGROUP:_the_game
	mov	al,byte ptr es:[bx+43]
	mov	ah,0
	or	ax,ax
	jne short	@@76
	jmp	@45@310
@@76:
@45@394:
   ;	
   ;	    }
   ;	    shld_supply = 0;
   ;	
	mov	word ptr DGROUP:_shld_supply,0
   ;	
   ;	    score += var_4 * 0x64;
   ;	
	mov	ax,word ptr [bp-12]
	imul	ax,ax,100
	movsx	eax,ax
	add	dword ptr DGROUP:_score,eax
   ;	
   ;	    var_1E = var_4 * 0x64;
   ;	
	mov	ax,word ptr [bp-12]
	imul	ax,ax,100
	mov	word ptr [bp-36],ax
   ;	
   ;	    update_score(var_1C, 0x9F);
   ;	
	push	159
	push	word ptr [bp-34]
	push	cs
	call	near ptr @update_score$qii
	add	sp,4
   ;	
   ;	    i_set_text(0x30, 2, 0x18, 0x1D);
   ;	
	push	29
	push	24
	push	2
	push	48
	call	far ptr @i_set_text$qucucucuc
	add	sp,8
   ;	
   ;	    display->put_bits(var_A + var_E, var_C, var_A + var_E + 0x28,
   ;	
   ;	
   ;	                      var_C + 0x0A, block, 0, 0);
   ;	
	push	0
	push	0
	push	word ptr [bp-6]
	push	word ptr [bp-8]
	mov	ax,word ptr [bp-20]
	add	ax,10
	push	ax
	mov	ax,word ptr [bp-18]
	add	ax,word ptr [bp-22]
	add	ax,40
	push	ax
	push	word ptr [bp-20]
	mov	ax,word ptr [bp-18]
	add	ax,word ptr [bp-22]
	push	ax
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@put_bits$qiiiinucuiui
	add	sp,20
   ;	
   ;	    display->print_at_xy(var_A + var_E, var_C,
   ;	
   ;	
   ;	                         (uchar far *)itoa(var_1E, _tmp, 0x0A), 0);
   ;	
	push	0
	push	10
	push	ds
	push	offset DGROUP:__tmp
	push	word ptr [bp-36]
	call	far ptr _itoa
	add	sp,8
	push	dx
	push	ax
	push	word ptr [bp-20]
	mov	ax,word ptr [bp-18]
	add	ax,word ptr [bp-22]
	push	ax
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@print_at_xy$qiinucuc
	add	sp,14
   ;	
   ;	    update_shld_guage(0, var_1A, 0xB3);
   ;	
	push	179
	push	word ptr [bp-32]
	push	0
	push	cs
	call	near ptr @update_shld_guage$qiii
	add	sp,6
   ;	
   ;	    the_game->play_sound((uchar far *)"sum", 0x0F);
   ;	
	push	15
	push	ds
	push	offset DGROUP:s@+4470
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_sound$qnucuc
	add	sp,10
@45@422:
   ;	
   ;	    while (the_game->voc_playing())
   ;	
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@voc_playing$qv
	add	sp,4
	or	al,al
	jne	short @45@422
   ;	
   ;	        ;
   ;	    wait_for_user();
   ;	
	call	far ptr @wait_for_user$qv
   ;	
   ;	    air_supply = var_2;
   ;	
	mov	ax,word ptr [bp-10]
	mov	word ptr DGROUP:_air_supply,ax
   ;	
   ;	    shld_supply = var_4;
   ;	
	mov	ax,word ptr [bp-12]
	mov	word ptr DGROUP:_shld_supply,ax
   ;	
   ;	    delete block;
   ;	
	push	word ptr [bp-6]
	push	word ptr [bp-8]
	call	far ptr @$bdele$qnv
	add	sp,4
   ;	
   ;	    the_game->remove_sound((uchar far *)"add");
   ;	
	push	ds
	push	offset DGROUP:s@+4474
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@remove_sound$qve
	add	sp,8
   ;	
   ;	    the_game->remove_sound((uchar far *)"sum");
   ;	
	push	ds
	push	offset DGROUP:s@+4478
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@remove_sound$qve
	add	sp,8
   ;	
   ;	    i_set_text(0x30, 2, 0x18, 0x1D);
   ;	
	push	29
	push	24
	push	2
	push	48
	call	far ptr @i_set_text$qucucucuc
	add	sp,8
   ;	
   ;	    the_game->reset_sound();
   ;	
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@reset_sound$qv
	add	sp,4
   ;	
   ;	    memcpy(_palette, dest, 0x300);
   ;	
	push	768
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	push	ds
	push	offset DGROUP:__palette
	call	far ptr _memcpy
	add	sp,10
   ;	
   ;	    delete dest;
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @$bdele$qnv
	add	sp,4
   ;	
   ;	}
   ;	
	leave	
	ret	
@show_stats$qv	endp
   ;	
   ;	void show_prelude(void)
   ;	
	assume	cs:GAME_TEXT
@show_prelude$qv	proc	far
	enter	2,0
   ;	
   ;	{
   ;	    int var_4;
   ;	
   ;	    display->blank_palette();
   ;	
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@blank_palette$qv
	add	sp,4
   ;	
   ;	    the_game->reset_sound();
   ;	
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@reset_sound$qv
	add	sp,4
   ;	
   ;	    display->copy_page(2, 1);
   ;	
	push	1
	push	2
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@copy_page$qucuc
	add	sp,8
   ;	
   ;	    display->cls(0, 0);
   ;	
	push	0
	push	0
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@cls$qucuc
	add	sp,8
   ;	
   ;	    display->cls(0, 1);
   ;	
	push	1
	push	0
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@cls$qucuc
	add	sp,8
   ;	
   ;	    display->show_offset(page_offsets[1]);
   ;	
	push	word ptr DGROUP:_page_offsets+2
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@show_offset$qui
	add	sp,6
   ;	
   ;	    show_loop((uchar far *)"prelude.l", 0x50, 0x32, 0, 0);
   ;	
	push	0
	push	0
	push	50
	push	80
	push	ds
	push	offset DGROUP:s@+4482
	call	far ptr @show_loop$qnuciiucui
	add	sp,12
   ;	
   ;	    i_set_text(0x80, 2, 0x87, 0x9F);
   ;	
	push	159
	push	135
	push	2
	push	128
	call	far ptr @i_set_text$qucucucuc
	add	sp,8
   ;	
   ;	    display->print_at_xy(0, 0x64, all_maps[cur_map].title, 1);
   ;	
	push	1
	mov	al,byte ptr DGROUP:_cur_map
	mov	ah,0
	imul	ax,ax,20
	mov	bx,ax
	push	word ptr DGROUP:_all_maps[bx+14]
	push	word ptr DGROUP:_all_maps[bx+12]
	push	100
	push	0
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@print_at_xy$qiinucuc
	add	sp,14
   ;	
   ;	    i_set_text(0x30, 2, 0x18, 0x1D);
   ;	
	push	29
	push	24
	push	2
	push	48
	call	far ptr @i_set_text$qucucucuc
	add	sp,8
   ;	
   ;	    display->set_palette();
   ;	
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@set_palette$qv
	add	sp,4
   ;	
   ;	    the_game->play_sound((uchar far *)"fire2", 0x0D);
   ;	
	push	13
	push	ds
	push	offset DGROUP:s@+4492
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_sound$qnucuc
	add	sp,10
   ;	
   ;	    the_game->doit();
   ;	
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@doit$qv
	add	sp,4
   ;	
   ;	    var_4 = 0x3E80;
   ;	
	mov	word ptr [bp-2],16000
	jmp	short @46@86
@46@58:
   ;	
   ;	    while (var_4 >= 0)
   ;	    {
   ;	        display->show_offset(var_4);
   ;	
	push	word ptr [bp-2]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@show_offset$qui
	add	sp,6
   ;	
   ;	        var_4 -= 0x280;
   ;	
	sub	word ptr [bp-2],640
@46@86:
	cmp	word ptr [bp-2],0
	jge	short @46@58
   ;	
   ;	    }
   ;	    display->copy_page(1, 0);
   ;	
	push	0
	push	1
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@copy_page$qucuc
	add	sp,8
   ;	
   ;	    display->show_offset(page_offsets[1]);
   ;	
	push	word ptr DGROUP:_page_offsets+2
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@show_offset$qui
	add	sp,6
   ;	
   ;	    display->cls(0, 0);
   ;	
	push	0
	push	0
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@cls$qucuc
	add	sp,8
   ;	
   ;	    the_game->play_sound((uchar far *)"exp2", 0x0E);
   ;	
	push	14
	push	ds
	push	offset DGROUP:s@+4498
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_sound$qnucuc
	add	sp,10
   ;	
   ;	    the_game->doit();
   ;	
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@doit$qv
	add	sp,4
   ;	
   ;	    display->show_offset(0x3D40);
   ;	
	push	15680
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@show_offset$qui
	add	sp,6
   ;	
   ;	    display->pause(2);
   ;	
	push	2
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@pause$qui
	add	sp,6
   ;	
   ;	    display->show_offset(page_offsets[1]);
   ;	
	push	word ptr DGROUP:_page_offsets+2
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@show_offset$qui
	add	sp,6
@46@142:
   ;	
   ;	    while (de_button() == 0)
   ;	
	call	far ptr @de_button$qv
	or	al,al
	je	short @46@142
   ;	
   ;	        ;
   ;	    the_game->play_sound((uchar far *)"fire2", 0x0F);
   ;	
	push	15
	push	ds
	push	offset DGROUP:s@+4503
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_sound$qnucuc
	add	sp,10
   ;	
   ;	    var_4 = 0x3E80;
   ;	
	mov	word ptr [bp-2],16000
	jmp	short @46@226
@46@198:
   ;	
   ;	    while (var_4 >= 0)
   ;	    {
   ;	        display->show_offset(var_4);
   ;	
	push	word ptr [bp-2]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@show_offset$qui
	add	sp,6
   ;	
   ;	        var_4 -= 0x280;
   ;	
	sub	word ptr [bp-2],640
@46@226:
	cmp	word ptr [bp-2],0
	jge	short @46@198
   ;	
   ;	    }
   ;	    display->copy_page(1, 2);
   ;	
	push	2
	push	1
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@copy_page$qucuc
	add	sp,8
@46@282:
   ;	
   ;	    while (the_game->voc_playing())
   ;	
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@voc_playing$qv
	add	sp,4
	or	al,al
	jne	short @46@282
   ;	
   ;	        ;
   ;	    the_game->reset_sound();
   ;	
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@reset_sound$qv
	add	sp,4
   ;	
   ;	}
   ;	
	leave	
	ret	
@show_prelude$qv	endp
   ;	
   ;	void show_loop(uchar far *s2, int arg_4, int arg_6, uchar arg_8, uint arg_A)
   ;	
	assume	cs:GAME_TEXT
@show_loop$qnuciiucui	proc	far
	enter	6,0
   ;	
   ;	{
   ;	    loop_res far *var_6;
   ;	    uchar var_1;
   ;	
   ;	    display->field_07 = 1;
   ;	
	les	bx,dword ptr DGROUP:_display
	mov	byte ptr es:[bx+7],1
   ;	
   ;	    var_1 = 0;
   ;	
	mov	byte ptr [bp-5],0
   ;	
   ;	    var_6 = (loop_res far *)the_game->get_loop(s2);
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@get_loop$qnuc
	add	sp,8
	mov	word ptr [bp-2],dx
	mov	word ptr [bp-4],ax
   ;	
   ;	    if (var_6 == 0)
   ;	
	cmp	dword ptr [bp-4],large 0
	jne	short @47@142
   ;	
   ;	    {
   ;	        var_6 = (loop_res far *)the_game->load_loop(s2);
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@load_loop$qnuc
	add	sp,8
	mov	word ptr [bp-2],dx
	mov	word ptr [bp-4],ax
   ;	
   ;	        if (var_6 == 0)
   ;	
	cmp	dword ptr [bp-4],large 0
	jne	short @47@114
   ;	
   ;	            terminate((uchar far *)"Loop does not exist.", s2);
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	ds
	push	offset DGROUP:s@+4509
	call	far ptr @terminate$qnuct1
	add	sp,8
@47@114:
   ;	
   ;	        var_1 = 1;
   ;	
	mov	byte ptr [bp-5],1
   ;	
   ;	    }
   ;	
	jmp	short @47@170
@47@142:
   ;	
   ;	    else
   ;	        var_1 = 0;
   ;	
	mov	byte ptr [bp-5],0
@47@170:
   ;	
   ;	    display->put_bits_masked(arg_4, arg_6,
   ;	
   ;	
   ;	        arg_4 + var_6->frames[arg_8]->w,
   ;	        arg_6 + var_6->frames[arg_8]->h,
   ;	        var_6->frames[arg_8]->bitmap, arg_A, 0, 0);
   ;	
	push	0
	push	0
	push	word ptr [bp+16]
	mov	al,byte ptr [bp+14]
	mov	ah,0
	shl	ax,2
	les	bx,dword ptr [bp-4]
	add	bx,ax
	les	bx,dword ptr es:[bx+6]
	push	word ptr es:[bx+2]
	push	word ptr es:[bx]
	mov	al,byte ptr [bp+14]
	mov	ah,0
	shl	ax,2
	les	bx,dword ptr [bp-4]
	add	bx,ax
	les	bx,dword ptr es:[bx+6]
	mov	ax,word ptr [bp+12]
	add	ax,word ptr es:[bx+4]
	push	ax
	mov	al,byte ptr [bp+14]
	mov	ah,0
	shl	ax,2
	les	bx,dword ptr [bp-4]
	add	bx,ax
	les	bx,dword ptr es:[bx+6]
	mov	ax,word ptr [bp+10]
	add	ax,word ptr es:[bx+6]
	push	ax
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@put_bits_masked$qve
	add	sp,22
   ;	
   ;	    if (var_1)
   ;	
	cmp	byte ptr [bp-5],0
	je	short @47@226
   ;	
   ;	        the_game->remove_loop(s2);
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@remove_loop$qnuc
	add	sp,8
@47@226:
   ;	
   ;	    display->field_07 = 0;
   ;	
	les	bx,dword ptr DGROUP:_display
	mov	byte ptr es:[bx+7],0
   ;	
   ;	}
   ;	
	leave	
	ret	
@show_loop$qnuciiucui	endp
   ;	
   ;	uchar de_button(void)
   ;	
	assume	cs:GAME_TEXT
@de_button$qv	proc	far
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
	mov	al,byte ptr DGROUP:_gr_keys+57
	or	al,byte ptr DGROUP:_gr_keys+28
	or	al,byte ptr es:[bx+43]
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@de_button$qv	endp
   ;	
   ;	void wait_for_user(void)
   ;	
	assume	cs:GAME_TEXT
@wait_for_user$qv	proc	far
	push	bp
	mov	bp,sp
	jmp	short @49@86
@49@58:
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
@49@86:
	les	bx,dword ptr DGROUP:_the_game
	cmp	byte ptr es:[bx+43],0
	jne	short @49@58
	les	bx,dword ptr DGROUP:_mouse
	cmp	byte ptr es:[bx],0
	jne	short @49@58
	cmp	byte ptr DGROUP:_gr_keys+57,0
	jne	short @49@58
	cmp	byte ptr DGROUP:_gr_keys+28,0
	jne	short @49@58
	jmp	short @49@254
@49@226:
   ;	
   ;	    while (!the_game->field_2B && !mouse->field_00 &&
   ;	           !gr_keys[0x39] && !gr_keys[0x1C])
   ;	        the_game->doit();
   ;	
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@doit$qv
	add	sp,4
@49@254:
	les	bx,dword ptr DGROUP:_the_game
	mov	al,byte ptr es:[bx+43]
	mov	ah,0
	or	ax,ax
	jne	short @49@422
	les	bx,dword ptr DGROUP:_mouse
	mov	al,byte ptr es:[bx]
	mov	ah,0
	or	ax,ax
	jne	short @49@422
	mov	al,byte ptr DGROUP:_gr_keys+57
	mov	ah,0
	or	ax,ax
	jne	short @49@422
	mov	al,byte ptr DGROUP:_gr_keys+28
	mov	ah,0
	or	ax,ax
	je	short @49@226
	jmp	short @49@422
@49@394:
   ;	
   ;	    while (the_game->field_2B || mouse->field_00 ||
   ;	           gr_keys[0x39] || gr_keys[0x1C])
   ;	        the_game->doit();
   ;	
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@doit$qv
	add	sp,4
@49@422:
	les	bx,dword ptr DGROUP:_the_game
	cmp	byte ptr es:[bx+43],0
	jne	short @49@394
	les	bx,dword ptr DGROUP:_mouse
	cmp	byte ptr es:[bx],0
	jne	short @49@394
	cmp	byte ptr DGROUP:_gr_keys+57,0
	jne	short @49@394
	cmp	byte ptr DGROUP:_gr_keys+28,0
	jne	short @49@394
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@wait_for_user$qv	endp
   ;	
   ;	void parse_options(int argc, uchar *argv[])
   ;	
	assume	cs:GAME_TEXT
@parse_options$qinnuc	proc	far
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
	jmp	@50@254
@50@58:
   ;	
   ;	        if (strcmp((char *)argv[i], "-mandich") == 0)
   ;	
	push	ds
	push	offset DGROUP:s@+4530
	mov	ax,word ptr [bp-2]
	shl	ax,2
	les	bx,dword ptr [bp+8]
	add	bx,ax
	push	word ptr es:[bx+2]
	push	word ptr es:[bx]
	call	far ptr _strcmp
	add	sp,8
	or	ax,ax
	jne	short @50@114
   ;	
   ;	            debug_mode = 1;
   ;	
	mov	byte ptr DGROUP:_debug_mode,1
@50@114:
   ;	
   ;	        if (strcmp((char *)argv[i], "-pcsound") == 0)
   ;	
	push	ds
	push	offset DGROUP:s@+4539
	mov	ax,word ptr [bp-2]
	shl	ax,2
	les	bx,dword ptr [bp+8]
	add	bx,ax
	push	word ptr es:[bx+2]
	push	word ptr es:[bx]
	call	far ptr _strcmp
	add	sp,8
	or	ax,ax
	jne	short @50@170
   ;	
   ;	            force_pc_sound = 1;
   ;	
	mov	byte ptr DGROUP:_force_pc_sound,1
@50@170:
   ;	
   ;	        if (strcmp((char *)argv[i], "-start") == 0)
   ;	
	push	ds
	push	offset DGROUP:s@+4548
	mov	ax,word ptr [bp-2]
	shl	ax,2
	les	bx,dword ptr [bp+8]
	add	bx,ax
	push	word ptr es:[bx+2]
	push	word ptr es:[bx]
	call	far ptr _strcmp
	add	sp,8
	or	ax,ax
	jne	short @50@226
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
@50@226:
	inc	word ptr [bp-2]
@50@254:
	mov	ax,word ptr [bp-2]
	cmp	ax,word ptr [bp+6]
	jge short	@@77
	jmp	@50@58
@@77:
   ;	
   ;	    }
   ;	}
   ;	
	leave	
	ret	
@parse_options$qinnuc	endp
   ;	
   ;	int random(int range)
   ;	
	assume	cs:GAME_TEXT
@random$qi	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    return (int)(((long)rand() * range) / 32768);
   ;	
	call	far ptr _rand
	movsx	eax,ax
	movsx	edx,word ptr [bp+6]
	imul	eax,edx
	mov	ebx,large 000008000h
	cdq	
	idiv	ebx
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@random$qi	endp
   ;	
   ;	int abs(int a)
   ;	
	assume	cs:GAME_TEXT
@abs$qi	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    return a < 0 ? -a : a;
   ;	
	cmp	word ptr [bp+6],0
	jge	short @52@86
	mov	ax,word ptr [bp+6]
	neg	ax
	jmp	short @52@114
@52@86:
	mov	ax,word ptr [bp+6]
@52@114:
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@abs$qi	endp
   ;	
   ;	int atoi(const uchar *s)
   ;	
	assume	cs:GAME_TEXT
@atoi$qnxuc	proc	far
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
   ;	
   ;	gui_item::~gui_item() {}
   ;	
	assume	cs:GAME_TEXT
@gui_item@$bdtr$qv	proc	far
	push	bp
	mov	bp,sp
	cmp	dword ptr [bp+6],large 0
	je	short @54@142
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx],offset @@gui_item@
	test	word ptr [bp+10],1
	je	short @54@142
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @$bdele$qnv
	add	sp,4
@54@142:
	pop	bp
	ret	
@gui_item@$bdtr$qv	endp
   ;	
   ;	void gui_item::draw() {}
   ;	
	assume	cs:GAME_TEXT
@gui_item@draw$qv	proc	far
	push	bp
	mov	bp,sp
	pop	bp
	ret	
@gui_item@draw$qv	endp
   ;	
   ;	void gui_item::erase() {}
   ;	
	assume	cs:GAME_TEXT
@gui_item@erase$qv	proc	far
	push	bp
	mov	bp,sp
	pop	bp
	ret	
@gui_item@erase$qv	endp
   ;	
   ;	button::~button() {}
   ;	
	assume	cs:GAME_TEXT
@button@$bdtr$qv	proc	far
	push	bp
	mov	bp,sp
	cmp	dword ptr [bp+6],large 0
	je	short @57@142
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx],offset @@button@
	push	0
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @gui_item@$bdtr$qv
	add	sp,6
	test	word ptr [bp+10],1
	je	short @57@142
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @$bdele$qnv
	add	sp,4
@57@142:
	pop	bp
	ret	
@button@$bdtr$qv	endp
GAME_TEXT	ends
_DATA	segment word public use16 'DATA'
@button@	segment	virtual
@@button@	label	byte
	dd	@button@draw$qv
	dd	@button@erase$qv
	dd	@button@poll$qv
@button@	ends
_DATA	ends
_DATA	segment word public use16 'DATA'
@gui_item@	segment	virtual
@@gui_item@	label	byte
	dd	@gui_item@draw$qv
	dd	@gui_item@erase$qv
	dd	@gui_item@poll$qv
	?debug	C E9
	?debug	C FA00000000
@gui_item@	ends
_DATA	ends
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
	db	'msl_top.l'
	db	0
	db	'prober.l'
	db	0
	db	'squeek'
	db	0
	db	'prober.l'
	db	0
	db	'probel.l'
	db	0
	db	'turn.l'
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
	db	'Run Benchmark'
	db	0
	db	'Game'
	db	0
	db	'Resume'
	db	0
	db	'Debug'
	db	0
	db	'Run Benchmark'
	db	0
	db	'Game'
	db	0
	db	'Resume'
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
	db	'p_highs.pcx'
	db	0
	db	'Your Score'
	db	0
	db	'Reset'
	db	0
	db	'Ok'
	db	0
	db	'Are you sure you want to'
	db	10
	db	'reset the high scores?'
	db	0
	db	'title.cmf'
	db	0
	db	'p_title.pcx'
	db	0
	db	'title'
	db	0
	db	'pup2'
	db	0
	db	'sum'
	db	0
	db	'stats.cmf'
	db	0
	db	'add'
	db	0
	db	'sum'
	db	0
	db	'Attempt to divide by zero in show_stats'
	db	0
	db	0
	db	0
	db	-56
	db	'Bshow stats'
	db	0
	db	'p_stats.pcx'
	db	0
	db	'otis.l'
	db	0
	db	'Enemies destroyed : '
	db	0
	db	'%'
	db	0
	db	'Goodies'
	db	9
	db	9
	db	'  : '
	db	0
	db	'%'
	db	0
	db	'Bonus X 50'
	db	9
	db	'  :'
	db	0
	db	'Bonus X 100'
	db	9
	db	'  :'
	db	0
	db	'add'
	db	0
	db	'add'
	db	0
	db	'sum'
	db	0
	db	'add'
	db	0
	db	'sum'
	db	0
	db	'prelude.l'
	db	0
	db	'fire2'
	db	0
	db	'exp2'
	db	0
	db	'fire2'
	db	0
	db	'Loop does not exist.'
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
	extrn	F_FTOL@:far
	public	@toggle_sub_control$qv
	public	@score_at$qiii
	public	_all_maps
	extrn	@bs3_start_up$qv:far
	extrn	@bs2_start_up$qv:far
	extrn	@bs1_start_up$qv:far
	public	_all_secrets
	extrn	__setenvp__:far
	extrn	__setargv__:far
	extrn	@cb_quit$qv:far
	public	@show_high_scores$quc
	extrn	@save_new_score$qulnucuc:far
	extrn	@is_record$qul:far
	extrn	@i_get_string$qnuct1:far
	extrn	@i_inform$qnucuce:far
	extrn	@i_poll_interface$qv:far
	extrn	@i_set_text$qucucucuc:far
	extrn	@i_init_interface$qnvt1t1t1t1:far
	extrn	@load_scores_in$qv:far
	extrn	@no_heap$qnuc:far
	extrn	__palette:byte
	extrn	__src:byte
	extrn	_itoa:far
	extrn	@i_yes_cancel$qnucuc:far
	extrn	@return_element$qucuc:far
	extrn	@init_scores_file$qv:far
	extrn	@init_scores_array$qv:far
	extrn	@setup_options$qv:far
	public	@load_resources$qv
	extrn	@init_display$quc:far
	extrn	_forcepal:far
	extrn	@pause$qui:far
	extrn	@terminate$qnuct1:far
	extrn	@_set_exit_routine$qnqv$v:far
	extrn	@_gr_start_kbd_grab$qv:far
	extrn	@touching$qn7m_actort1:far
	public	@scroll_to$qn7m_actor
	extrn	@do_probe$qn7m_actor:far
	extrn	@do_bubble$qn7m_actor:far
	extrn	@do_door$qn7m_actor:far
	extrn	@do_switch$qn7m_actor:far
	extrn	@do_barrel$qn7m_actor:far
	extrn	@mv_barrel$qn7m_actornit2:far
	extrn	@do_pup$qn7m_actor:far
	extrn	@mv_ship$qn7m_actornit2:far
	extrn	@do_ship$qn7m_actor:far
	extrn	@do_cannon$qn7m_actor:far
	extrn	@do_clam$qn7m_actor:far
	extrn	@do_shuttle$qn7m_actor:far
	extrn	@do_fire_pit$qn7m_actor:far
	extrn	@do_spikes$qn7m_actor:far
	extrn	@do_tentacle$qn7m_actor:far
	extrn	@mv_shark$qn7m_actornit2:far
	extrn	@do_shark$qn7m_actor:far
	extrn	@do_jelly$qn7m_actor:far
	extrn	@do_gun_piece$qn7m_actor:far
	extrn	@do_crab$qn7m_actor:far
	extrn	@mv_pace$qn7m_actornit2:far
	extrn	@do_serpent$qn7m_actor:far
	extrn	@do_face$qn7m_actor:far
	extrn	@do_block$qn7m_actor:far
	extrn	@mv_pirana$qn7m_actornit2:far
	extrn	@do_pirana$qn7m_actor:far
	extrn	@do_duct_ud$qn7m_actor:far
	extrn	@do_duct_lr$qn7m_actor:far
	extrn	@do_chest$qn7m_actor:far
	extrn	@do_tulip$qn7m_actor:far
	extrn	@do_fish$qn7m_actor:far
	extrn	@do_zapper$qn7m_actor:far
	extrn	@do_mine1$qn7m_actor:far
	extrn	@mv_std$qn7m_actornit2:far
	extrn	@do_pod$qn7m_actor:far
	extrn	@do_coin$qn7m_actor:far
	extrn	@do_score$qn7m_actor:far
	extrn	@mv_ego$qn7m_actornit2:far
	extrn	@do_ego$qn7m_actor:far
	public	@atoi$qnxuc
	public	@abs$qi
	public	@random$qi
	public	@wait_for_user$qv
	public	@show_stats$qv
	public	@teleport_to$qui
	public	@turn_ego$qv
	public	@ego_fire$qv
	public	@activate_menu_bar$qv
	public	@add_missile$qn7m_actoruci
	public	@add_explosion$qiiucnuc
	public	@check_guages$qv
	public	@check_user$qv
	public	@add_jason$qv
	public	@hook_up_switches$qv
	public	@get_map_coords$quinit2
	public	@add_map_pup$quiui
	public	@add_map_item$quiui
	public	@add_barrel$quiui
	public	@add_door$quiui
	public	@add_switch$quiui
	extrn	@vga_text$qiinucucuc:far
	public	@show_loop$qnuciiucui
	public	@post_message$quc
	public	@add_bubble$qiii
	extrn	@do_exp$qn7m_actor:far
	extrn	@do_missle$qn7m_actor:far
	extrn	__all_explosions:dword
	extrn	__all_projectiles:word
	public	@kill_jason$qv
	public	@kill_ego$qii
	public	@update_boss_guage$qv
	public	@update_jason_guage$qv
	public	@update_key_guage$qv
	public	@update_gun$qv
	public	@update_men$qv
	public	@update_score$qii
	public	@update_air_guage$qiii
	public	@update_shld_guage$qiii
	public	@clear_message$qv
	public	@de_button$qv
	extrn	@de_down$qv:far
	extrn	@de_up$qv:far
	extrn	@de_right$qv:far
	extrn	@de_left$qv:far
	public	@parse_options$qinnuc
	public	@end_game$qv
	public	@end_room$qv
	public	@de_doit$qv
	public	@show_prelude$qv
	public	@start_room$qnuc
	public	@start_title_loop$qv
	public	@exit_secret_level$qv
	public	@setup_secret_level$qv
	public	@play_game$quc
	public	@init_game$qv
	public	_main
	extrn	_new_map_name:dword
	extrn	__resume:byte
	extrn	_s1:byte
	extrn	__tmp2:byte
	extrn	__tmp:byte
	extrn	_jguage_underbits:dword
	extrn	_gun_underbits:dword
	extrn	_palette:byte
	extrn	_zapper_count:byte
	extrn	_space_bar_been_up:word
	extrn	_cave_msg:byte
	extrn	_gun_msg:byte
	extrn	_barrel_msg:byte
	extrn	_jason_msg:byte
	extrn	_jason_count:byte
	extrn	_shot_count:byte
	extrn	_top_shot_count:byte
	extrn	_secret_tile:word
	extrn	_end_door_tile:word
	extrn	_finish_tile:word
	extrn	_src:byte
	extrn	_death_type:byte
	extrn	_smart_missiles:byte
	extrn	_saw_title_screen:byte
	extrn	_i_external_right:dword
	extrn	_i_external_left:dword
	extrn	_pd_redraws:byte
	extrn	_barrier_list:dword
	extrn	_barrier_count:byte
	extrn	_shootable_list:dword
	extrn	_shootable_count:byte
	extrn	_all_teleports:word
	extrn	_teleport_count:byte
	extrn	_all_messages:dword
	extrn	_gr_keys:byte
	extrn	_map_messages:word
	extrn	_cur_message:word
	extrn	_message_posted:byte
	extrn	_message_count:byte
	extrn	_ego_map_h:word
	extrn	_ego_map_w:word
	extrn	_ego_y_speed:byte
	extrn	_ego_x_speed:byte
	extrn	_start_y:word
	extrn	_start_x:word
	extrn	_got_key:byte
	extrn	_goody_count:byte
	extrn	_enemy_count:byte
	extrn	_goodies_found:byte
	extrn	_enemies_killed:byte
	extrn	_heavy_timer:word
	extrn	_control:byte
	extrn	_page_offsets:word
	extrn	_non_displayed_page:byte
	extrn	_displayed_page:byte
	extrn	_system_bench:byte
	extrn	_stop_room:byte
	extrn	_cur_map:byte
	extrn	_air_speed:byte
	extrn	_air_count:byte
	extrn	_air_supply:word
	extrn	_shld_supply:word
	extrn	_jason_power:byte
	extrn	_maximum_jason_power:byte
	extrn	_jason_present:byte
	extrn	_jason_on:byte
	extrn	_shot_size:byte
	extrn	_top_fire:byte
	extrn	_auto_fire:byte
	extrn	_jason_fire:byte
	extrn	_auto_fire_count:byte
	extrn	_gun_pieces_xy:byte
	extrn	_gun_count:byte
	extrn	_men:byte
	extrn	_score_count:byte
	extrn	_score:word
	extrn	_cheat_mode:byte
	extrn	_god_mode:byte
	extrn	_game_in_progress:byte
	extrn	_zoom_to_map:byte
	extrn	_force_pc_sound:byte
	extrn	_debug:byte
	extrn	_debug_mode:byte
	extrn	_end_door_ptr:dword
	extrn	_act:dword
	extrn	_boss:dword
	extrn	_cur_sub:dword
	extrn	_jason:dword
	extrn	_ego:dword
	extrn	_the_map:dword
	extrn	_the_menu_bar:dword
	extrn	_mouse:dword
	extrn	_display:dword
	extrn	_the_cast:dword
	extrn	_the_game:dword
	extrn	@button@mouse_to_me$qv:far
	extrn	@button@poll$qv:far
	extrn	@button@erase$qv:far
	extrn	@button@draw$qv:far
	public	@button@$bdtr$qv
	extrn	@button@$bctr$qnucnvuc:far
	extrn	@menu_bar@toggle_item$qnuct1uc:far
	extrn	@gui_item@poll$qv:far
	public	@gui_item@erase$qv
	public	@gui_item@draw$qv
	public	@gui_item@$bdtr$qv
	extrn	@ms_mouse@hide$qv:far
	extrn	@ms_mouse@show$qv:far
	extrn	@ms_mouse@set_cursor$qnucii:far
	extrn	@vga_display@dump_pcx$qve:far
	extrn	@vga_display@show_pcx$qnucucuii:far
	extrn	@vga_display@put_bits_masked$qve:far
	extrn	@vga_display@put_bits$qiiiinucuiui:far
	extrn	@vga_display@copy_bits$qiiiiiiuiuiuiui:far
	extrn	@vga_display@get_bits$qiiii:far
	extrn	@vga_display@cls$qucuc:far
	extrn	@vga_display@show_offset$qui:far
	extrn	@vga_display@fill_rect$qiiiiiiuc:far
	extrn	@vga_display@print_at_xy$qiinucuc:far
	extrn	@vga_display@restore_palette$qv:far
	extrn	@vga_display@save_palette$qv:far
	extrn	@vga_display@set_palette$qv:far
	extrn	@vga_display@fade_down$qv:far
	extrn	@vga_display@fade_up$qv:far
	extrn	@vga_display@blank_palette$qv:far
	extrn	@vga_display@pause$qui:far
	extrn	@vga_display@draw_span$qiiuciui:far
	extrn	@vga_display@set_pix$qiiuc:far
	extrn	@vga_display@copy_page$qucuc:far
	extrn	@vga_display@doit$qv:far
	extrn	@tilemap@purge_tiles$qv:far
	extrn	@tilemap@center_on$quiui:far
	extrn	@tilemap@update$qui:far
	extrn	@tilemap@new_map$qve:far
	extrn	@tilemap@set_viewport$qiiii:far
	extrn	@tilemap@$bctr$qnucii:far
	extrn	@game_manager@define_sound$qnucuc:far
	extrn	@game_manager@remove_loop$qnuc:far
	extrn	@game_manager@get_loop$qnuc:far
	extrn	@game_manager@load_loop$qnuc:far
	extrn	@game_manager@voc_playing$qv:far
	extrn	@game_manager@continue_song$qv:far
	extrn	@game_manager@pause_song$qv:far
	extrn	@game_manager@play_song$qnuc:far
	extrn	@game_manager@reset_sound$qv:far
	extrn	@game_manager@play_sound$qnucuc:far
	extrn	@game_manager@play_sound_file$qnuc:far
	extrn	@game_manager@remove_sound$qve:far
	extrn	@game_manager@reset_player$quc:far
	extrn	@game_manager@joy_update$qv:far
	extrn	@game_manager@clear_flags$qv:far
	extrn	@game_manager@doit$qv:far
	extrn	@game_manager@$bdtr$qv:far
	extrn	@game_manager@$bctr$qnuc:far
	extrn	@game_cast@kill_all$qv:far
	extrn	@game_cast@update$quc:far
	extrn	@game_cast@add$qnucnvt2:far
	extrn	@game_cast@$bctr$qv:far
	extrn	@m_actor@on_pos$qui:far
	extrn	@m_actor@on_tile$qi:far
	extrn	@m_actor@erase$qv:far
	extrn	@m_actor@new_loop$qnuc:far
	extrn	@m_actor@set_cycle$qucuc:far
	extrn	@m_actor@set_xy$qii:far
	extrn	_atol:far
	extrn	_rand:far
	extrn	_ltoa:far
	extrn	_clock:far
	extrn	_farcoreleft:far
	extrn	_coreleft:far
	extrn	_clrscr:far
_pokeb	equ	pokeb
_poke	equ	poke
_peekb	equ	peekb
_peek	equ	peek
	extrn	_strlen:far
	extrn	_strcpy:far
	extrn	_strcmp:far
	extrn	_strcat:far
	extrn	_memcpy:far
	extrn	_printf:far
	extrn	_fopen:far
	extrn	_fgetc:far
	extrn	_fclose:far
	extrn	@$bdele$qnv:far
	extrn	@$bnew$qui:far
_s@	equ	s@
	end
