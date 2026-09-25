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
	?debug	S "menu.cpp"
	?debug	C E95A4B395D086D656E752E637070
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
MENU_TEXT	segment byte public use16 'CODE'
MENU_TEXT	ends
DGROUP	group	_DATA,_BSS
	assume	cs:MENU_TEXT,ds:DGROUP
_DATA	segment word public use16 'DATA'
d@	label	byte
d@w	label	word
_DATA	ends
_BSS	segment word public use16 'BSS'
b@	label	byte
b@w	label	word
_BSS	ends
MENU_TEXT	segment byte public use16 'CODE'
   ;	
   ;	void far prepare_new_screen(void)
   ;	
	assume	cs:MENU_TEXT
@prepare_new_screen$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    the_menu_bar->erase();
   ;	
	push	word ptr DGROUP:_the_menu_bar+2
	push	word ptr DGROUP:_the_menu_bar
	les	bx,dword ptr DGROUP:_the_menu_bar
	mov	bx,word ptr es:[bx]
	call	dword ptr [bx+4]
	add	sp,4
   ;	
   ;	    mouse->hide();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	call	far ptr @ms_mouse@hide$qv
	add	sp,4
   ;	
   ;	    display->copy_page(1, 0);
   ;	
	push	0
	push	1
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@copy_page$qucuc
	add	sp,8
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@prepare_new_screen$qv	endp
   ;	
   ;	void far restore_old_screen(void)
   ;	
	assume	cs:MENU_TEXT
@restore_old_screen$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    display->copy_page(0, 1);
   ;	
	push	1
	push	0
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@copy_page$qucuc
	add	sp,8
   ;	
   ;	    the_menu_bar->draw();
   ;	
	push	word ptr DGROUP:_the_menu_bar+2
	push	word ptr DGROUP:_the_menu_bar
	les	bx,dword ptr DGROUP:_the_menu_bar
	mov	bx,word ptr es:[bx]
	call	dword ptr [bx]
	add	sp,4
   ;	
   ;	    mouse->show();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	call	far ptr @ms_mouse@show$qv
	add	sp,4
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@restore_old_screen$qv	endp
   ;	
   ;	void far cb_catalogue(void)
   ;	
	assume	cs:MENU_TEXT
@cb_catalogue$qv	proc	far
	enter	4,0
   ;	
   ;	{
   ;	    text_pager far *tp;
   ;	
   ;	    prepare_new_screen();
   ;	
	push	cs
	call	near ptr @prepare_new_screen$qv
   ;	
   ;	    tp = new text_pager((uchar far *)"t_cat.txt", 0, catalogue_call_up);
   ;	
	push	seg @catalogue_call_up$quc
	push	offset @catalogue_call_up$quc
	push	0
	push	ds
	push	offset DGROUP:s@
	push	0
	push	0
	call	far ptr @text_pager@$bctr$qnucucnquc$v
	add	sp,14
	mov	word ptr [bp-2],dx
	mov	word ptr [bp-4],ax
   ;	
   ;	    delete tp;
   ;	
	push	3
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @text_pager@$bdtr$qv
	add	sp,6
   ;	
   ;	    restore_old_screen();
   ;	
	push	cs
	call	near ptr @restore_old_screen$qv
   ;	
   ;	}
   ;	
	leave	
	ret	
@cb_catalogue$qv	endp
   ;	
   ;	void far cb_start(void)
   ;	
	assume	cs:MENU_TEXT
@cb_start$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (game_in_progress != 0) {
   ;	
	cmp	byte ptr DGROUP:_game_in_progress,0
	je	short @4@114
   ;	
   ;	        if ((int)i_yes_cancel((uchar far *)"Start game from begining?", 0) == 0)
   ;	
	push	0
	push	ds
	push	offset DGROUP:s@+10
	call	far ptr @i_yes_cancel$qnucuc
	add	sp,6
	or	al,al
	jne	short @4@114
   ;	
   ;	            stop_room = 2;
   ;	
	mov	byte ptr DGROUP:_stop_room,2
@4@114:
   ;	
   ;	    }
   ;	    zoom_to_map = 0;
   ;	
	mov	byte ptr DGROUP:_zoom_to_map,0
   ;	
   ;	    _resume = 1;
   ;	
	mov	byte ptr DGROUP:__resume,1
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@cb_start$qv	endp
   ;	
   ;	void far cb_start_act_2(void)
   ;	
	assume	cs:MENU_TEXT
@cb_start_act_2$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (game_in_progress != 0) {
   ;	
	cmp	byte ptr DGROUP:_game_in_progress,0
	je	short @5@114
   ;	
   ;	        if ((int)i_yes_cancel((uchar far *)"End current game?", 0) == 0)
   ;	
	push	0
	push	ds
	push	offset DGROUP:s@+36
	call	far ptr @i_yes_cancel$qnucuc
	add	sp,6
	or	al,al
	jne	short @5@114
   ;	
   ;	            stop_room = 2;
   ;	
	mov	byte ptr DGROUP:_stop_room,2
@5@114:
   ;	
   ;	    }
   ;	    zoom_to_map = 7;
   ;	
	mov	byte ptr DGROUP:_zoom_to_map,7
   ;	
   ;	    _resume = 1;
   ;	
	mov	byte ptr DGROUP:__resume,1
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@cb_start_act_2$qv	endp
   ;	
   ;	void far cb_story(void)
   ;	
	assume	cs:MENU_TEXT
@cb_story$qv	proc	far
	enter	4,0
   ;	
   ;	{
   ;	    text_pager far *tp;
   ;	
   ;	    prepare_new_screen();
   ;	
	push	cs
	call	near ptr @prepare_new_screen$qv
   ;	
   ;	    tp = new text_pager((uchar far *)"t_story.txt", 0, story_call_up);
   ;	
	push	seg @story_call_up$quc
	push	offset @story_call_up$quc
	push	0
	push	ds
	push	offset DGROUP:s@+54
	push	0
	push	0
	call	far ptr @text_pager@$bctr$qnucucnquc$v
	add	sp,14
	mov	word ptr [bp-2],dx
	mov	word ptr [bp-4],ax
   ;	
   ;	    delete tp;
   ;	
	push	3
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @text_pager@$bdtr$qv
	add	sp,6
   ;	
   ;	    restore_old_screen();
   ;	
	push	cs
	call	near ptr @restore_old_screen$qv
   ;	
   ;	    if (game_in_progress)
   ;	
	cmp	byte ptr DGROUP:_game_in_progress,0
	je	short @6@86
   ;	
   ;	        _resume = 1;
   ;	
	mov	byte ptr DGROUP:__resume,1
@6@86:
   ;	
   ;	}
   ;	
	leave	
	ret	
@cb_story$qv	endp
   ;	
   ;	void far cb_instructions(void)
   ;	
	assume	cs:MENU_TEXT
@cb_instructions$qv	proc	far
	enter	4,0
   ;	
   ;	{
   ;	    text_pager far *tp;
   ;	
   ;	    prepare_new_screen();
   ;	
	push	cs
	call	near ptr @prepare_new_screen$qv
   ;	
   ;	    tp = new text_pager((uchar far *)"t_inst.txt", 0, instructions_call_up);
   ;	
	push	seg @instructions_call_up$quc
	push	offset @instructions_call_up$quc
	push	0
	push	ds
	push	offset DGROUP:s@+66
	push	0
	push	0
	call	far ptr @text_pager@$bctr$qnucucnquc$v
	add	sp,14
	mov	word ptr [bp-2],dx
	mov	word ptr [bp-4],ax
   ;	
   ;	    delete tp;
   ;	
	push	3
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @text_pager@$bdtr$qv
	add	sp,6
   ;	
   ;	    restore_old_screen();
   ;	
	push	cs
	call	near ptr @restore_old_screen$qv
   ;	
   ;	    if (game_in_progress)
   ;	
	cmp	byte ptr DGROUP:_game_in_progress,0
	je	short @7@86
   ;	
   ;	        _resume = 1;
   ;	
	mov	byte ptr DGROUP:__resume,1
@7@86:
   ;	
   ;	}
   ;	
	leave	
	ret	
@cb_instructions$qv	endp
   ;	
   ;	void far cb_help(void)
   ;	
	assume	cs:MENU_TEXT
@cb_help$qv	proc	far
	enter	4,0
   ;	
   ;	{
   ;	    text_pager far *tp;
   ;	
   ;	    prepare_new_screen();
   ;	
	push	cs
	call	near ptr @prepare_new_screen$qv
   ;	
   ;	    tp = new text_pager((uchar far *)"t_help.txt", 0, help_call_up);
   ;	
	push	seg @help_call_up$quc
	push	offset @help_call_up$quc
	push	0
	push	ds
	push	offset DGROUP:s@+77
	push	0
	push	0
	call	far ptr @text_pager@$bctr$qnucucnquc$v
	add	sp,14
	mov	word ptr [bp-2],dx
	mov	word ptr [bp-4],ax
   ;	
   ;	    delete tp;
   ;	
	push	3
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @text_pager@$bdtr$qv
	add	sp,6
   ;	
   ;	    restore_old_screen();
   ;	
	push	cs
	call	near ptr @restore_old_screen$qv
   ;	
   ;	    if (game_in_progress)
   ;	
	cmp	byte ptr DGROUP:_game_in_progress,0
	je	short @8@86
   ;	
   ;	        _resume = 1;
   ;	
	mov	byte ptr DGROUP:__resume,1
@8@86:
   ;	
   ;	}
   ;	
	leave	
	ret	
@cb_help$qv	endp
   ;	
   ;	void far cb_high_scores(void)
   ;	
	assume	cs:MENU_TEXT
@cb_high_scores$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    prepare_new_screen();
   ;	
	push	cs
	call	near ptr @prepare_new_screen$qv
   ;	
   ;	    show_high_scores(0);
   ;	
	push	0
	call	far ptr @show_high_scores$quc
	pop	cx
   ;	
   ;	    restore_old_screen();
   ;	
	push	cs
	call	near ptr @restore_old_screen$qv
   ;	
   ;	    if (game_in_progress)
   ;	
	cmp	byte ptr DGROUP:_game_in_progress,0
	je	short @9@86
   ;	
   ;	        _resume = 1;
   ;	
	mov	byte ptr DGROUP:__resume,1
@9@86:
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@cb_high_scores$qv	endp
   ;	
   ;	void far cb_resume(void)
   ;	
	assume	cs:MENU_TEXT
@cb_resume$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    _resume = 1;
   ;	
	mov	byte ptr DGROUP:__resume,1
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@cb_resume$qv	endp
   ;	
   ;	void far catalogue_call_up(uchar arg)
   ;	
	assume	cs:MENU_TEXT
@catalogue_call_up$quc	proc	far
	enter	6,0
   ;	
   ;	{
   ;	    int var_2, var_4, var_6;
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
   ;	    var_2 = 0;
   ;	
	mov	word ptr [bp-2],0
	jmp	short @11@86
@11@58:
   ;	
   ;	    while (var_2 < 5000) {
   ;	        var_4 = random(0x13E);
   ;	
	push	318
	call	far ptr @random$qi
	pop	cx
	mov	word ptr [bp-4],ax
   ;	
   ;	        var_6 = random(0xC6);
   ;	
	push	198
	call	far ptr @random$qi
	pop	cx
	mov	word ptr [bp-6],ax
   ;	
   ;	        display->set_pix(var_4, var_6, 0x1B);
   ;	
	push	27
	push	word ptr [bp-6]
	push	word ptr [bp-4]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@set_pix$qiiuc
	add	sp,10
   ;	
   ;	        display->set_pix(var_4 + 1, var_6 + 1, 0x1D);
   ;	
	push	29
	mov	ax,word ptr [bp-6]
	inc	ax
	push	ax
	mov	ax,word ptr [bp-4]
	inc	ax
	push	ax
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@set_pix$qiiuc
	add	sp,10
   ;	
   ;	        display->set_pix(var_4, var_6 + 2, 0x1F);
   ;	
	push	31
	mov	ax,word ptr [bp-6]
	add	ax,2
	push	ax
	push	word ptr [bp-4]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@set_pix$qiiuc
	add	sp,10
   ;	
   ;	        var_2++;
   ;	
	inc	word ptr [bp-2]
@11@86:
	cmp	word ptr [bp-2],5000
	jl	short @11@58
   ;	
   ;	    }
   ;	}
   ;	
	leave	
	ret	
@catalogue_call_up$quc	endp
   ;	
   ;	void far instructions_call_up(uchar arg)
   ;	
	assume	cs:MENU_TEXT
@instructions_call_up$quc	proc	far
	enter	10,0
   ;	
   ;	{
   ;	    int var_2, var_4, var_6, var_8, var_A;
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
   ;	    display->field_07 = 1;
   ;	
	les	bx,dword ptr DGROUP:_display
	mov	byte ptr es:[bx+7],1
   ;	
   ;	    for (var_A = 0; var_A < 200; var_A++) {
   ;	
	mov	word ptr [bp-10],0
	jmp	short @12@114
@12@58:
   ;	
   ;	        var_6 = (var_A % 0x14) << 4;
   ;	
	mov	ax,word ptr [bp-10]
	mov	bx,20
	cwd	
	idiv	bx
	shl	dx,4
	mov	word ptr [bp-6],dx
   ;	
   ;	        var_8 = (var_A / 0x14) * 0x14;
   ;	
	mov	ax,word ptr [bp-10]
	mov	bx,20
	cwd	
	idiv	bx
	imul	ax,ax,20
	mov	word ptr [bp-8],ax
   ;	
   ;	        show_loop((uchar *)"pat1.l", var_6, var_8, 0, 0);
   ;	
	push	0
	push	0
	push	word ptr [bp-8]
	push	word ptr [bp-6]
	push	ds
	push	offset DGROUP:s@+88
	call	far ptr @show_loop$qnuciiucui
	add	sp,12
	inc	word ptr [bp-10]
@12@114:
	cmp	word ptr [bp-10],200
	jl	short @12@58
   ;	
   ;	    }
   ;	    display->field_07 = 0;
   ;	
	les	bx,dword ptr DGROUP:_display
	mov	byte ptr es:[bx+7],0
   ;	
   ;	    if (arg != 1)
   ;	
	cmp	byte ptr [bp+6],1
	jne	short @12@198
   ;	
   ;	        return;
   ;	    var_2 = 0x33;
   ;	
	mov	word ptr [bp-2],51
   ;	
   ;	    var_4 = 0x36;
   ;	
	mov	word ptr [bp-4],54
   ;	
   ;	    show_loop((uchar *)"pu_shld.l", var_2, var_4, 0, 0);
   ;	
	push	0
	push	0
	push	word ptr [bp-4]
	push	word ptr [bp-2]
	push	ds
	push	offset DGROUP:s@+95
	call	far ptr @show_loop$qnuciiucui
	add	sp,12
   ;	
   ;	    var_4 += 0x1E;
   ;	
	add	word ptr [bp-4],30
   ;	
   ;	    show_loop((uchar *)"pu_auto.l", var_2, var_4, 0, 0);
   ;	
	push	0
	push	0
	push	word ptr [bp-4]
	push	word ptr [bp-2]
	push	ds
	push	offset DGROUP:s@+105
	call	far ptr @show_loop$qnuciiucui
	add	sp,12
   ;	
   ;	    var_4 += 0x1E;
   ;	
	add	word ptr [bp-4],30
   ;	
   ;	    show_loop((uchar *)"pu_fire.l", var_2, var_4, 0, 0);
   ;	
	push	0
	push	0
	push	word ptr [bp-4]
	push	word ptr [bp-2]
	push	ds
	push	offset DGROUP:s@+115
	call	far ptr @show_loop$qnuciiucui
	add	sp,12
   ;	
   ;	    var_4 += 0x1E;
   ;	
	add	word ptr [bp-4],30
   ;	
   ;	    show_loop((uchar *)"pu_jason.l", var_2, var_4, 0, 0);
   ;	
	push	0
	push	0
	push	word ptr [bp-4]
	push	word ptr [bp-2]
	push	ds
	push	offset DGROUP:s@+125
	call	far ptr @show_loop$qnuciiucui
	add	sp,12
@12@198:
   ;	
   ;	}
   ;	
	leave	
	ret	
@instructions_call_up$quc	endp
   ;	
   ;	void far story_call_up(uchar arg)
   ;	
	assume	cs:MENU_TEXT
@story_call_up$quc	proc	far
	enter	6,0
   ;	
   ;	{
   ;	    int var_2, var_4, var_6;
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
   ;	    var_4 = var_2 = 0;
   ;	
	xor	ax,ax
	mov	word ptr [bp-2],ax
	mov	word ptr [bp-4],ax
   ;	
   ;	    display->field_07 = 1;
   ;	
	les	bx,dword ptr DGROUP:_display
	mov	byte ptr es:[bx+7],1
   ;	
   ;	    for (var_6 = 0; var_6 < 200; var_6++) {
   ;	
	mov	word ptr [bp-6],0
	jmp	short @13@114
@13@58:
   ;	
   ;	        var_2 = (var_6 % 0x14) << 4;
   ;	
	mov	ax,word ptr [bp-6]
	mov	bx,20
	cwd	
	idiv	bx
	shl	dx,4
	mov	word ptr [bp-2],dx
   ;	
   ;	        var_4 = (var_6 / 0x14) * 0x14;
   ;	
	mov	ax,word ptr [bp-6]
	mov	bx,20
	cwd	
	idiv	bx
	imul	ax,ax,20
	mov	word ptr [bp-4],ax
   ;	
   ;	        show_loop((uchar *)"pat1.l", var_2, var_4, 0, 0);
   ;	
	push	0
	push	0
	push	word ptr [bp-4]
	push	word ptr [bp-2]
	push	ds
	push	offset DGROUP:s@+136
	call	far ptr @show_loop$qnuciiucui
	add	sp,12
	inc	word ptr [bp-6]
@13@114:
	cmp	word ptr [bp-6],200
	jl	short @13@58
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
@story_call_up$quc	endp
   ;	
   ;	void far help_call_up(uchar arg)
   ;	
	assume	cs:MENU_TEXT
@help_call_up$quc	proc	far
	enter	6,0
   ;	
   ;	{
   ;	    int var_2, var_4, var_6;
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
   ;	    var_2 = 0;
   ;	
	mov	word ptr [bp-2],0
	jmp	short @14@86
@14@58:
   ;	
   ;	    while (var_2 < 0x7D0) {
   ;	        var_4 = random(0x13E);
   ;	
	push	318
	call	far ptr @random$qi
	pop	cx
	mov	word ptr [bp-4],ax
   ;	
   ;	        var_6 = random(0xC6);
   ;	
	push	198
	call	far ptr @random$qi
	pop	cx
	mov	word ptr [bp-6],ax
   ;	
   ;	        display->set_pix(var_4, var_6, 0x97);
   ;	
	push	151
	push	word ptr [bp-6]
	push	word ptr [bp-4]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@set_pix$qiiuc
	add	sp,10
   ;	
   ;	        display->set_pix(var_4 + 1, var_6 + 1, 0x99);
   ;	
	push	153
	mov	ax,word ptr [bp-6]
	inc	ax
	push	ax
	mov	ax,word ptr [bp-4]
	inc	ax
	push	ax
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@set_pix$qiiuc
	add	sp,10
   ;	
   ;	        var_2++;
   ;	
	inc	word ptr [bp-2]
@14@86:
	cmp	word ptr [bp-2],2000
	jl	short @14@58
   ;	
   ;	    }
   ;	}
   ;	
	leave	
	ret	
@help_call_up$quc	endp
   ;	
   ;	void far cb_password(void)
   ;	
	assume	cs:MENU_TEXT
@cb_password$qv	proc	far
	enter	6,0
   ;	
   ;	{
   ;	    uchar far *pw;
   ;	    byte var_5;
   ;	
   ;	    mouse->hide();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	call	far ptr @ms_mouse@hide$qv
	add	sp,4
   ;	
   ;	    pw = i_get_string((uchar *)"Password", (uchar *)"Enter password below:");
   ;	
	push	ds
	push	offset DGROUP:s@+152
	push	ds
	push	offset DGROUP:s@+143
	call	far ptr @i_get_string$qnuct1
	add	sp,8
	mov	word ptr [bp-2],dx
	mov	word ptr [bp-4],ax
   ;	
   ;	    mouse->show();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	call	far ptr @ms_mouse@show$qv
	add	sp,4
   ;	
   ;	    strupr(pw);
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr _strupr
	add	sp,4
   ;	
   ;	    var_5 = 0;
   ;	
	mov	byte ptr [bp-5],0
	jmp	short @15@142
@15@58:
   ;	
   ;	    while (var_5 < 0x18) {
   ;	        if (strcmp(pw, all_maps[var_5].password) == 0) {
   ;	
	mov	al,byte ptr [bp-5]
	mov	ah,0
	imul	ax,ax,20
	mov	bx,ax
	push	word ptr DGROUP:_all_maps[bx+10]
	push	word ptr DGROUP:_all_maps[bx+8]
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr _strcmp
	add	sp,8
	or	ax,ax
	jne	short @15@114
   ;	
   ;	            the_game->play_sound_file((uchar *)"charge");
   ;	
	push	ds
	push	offset DGROUP:s@+174
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_sound_file$qnuc
	add	sp,8
   ;	
   ;	            stop_room = 2;
   ;	
	mov	byte ptr DGROUP:_stop_room,2
   ;	
   ;	            zoom_to_map = var_5;
   ;	
	mov	al,byte ptr [bp-5]
	mov	byte ptr DGROUP:_zoom_to_map,al
   ;	
   ;	            _resume = 1;
   ;	
	mov	byte ptr DGROUP:__resume,1
	jmp	short @15@282
@15@114:
   ;	
   ;	            goto done;
   ;	        }
   ;	        var_5++;
   ;	
	inc	byte ptr [bp-5]
@15@142:
	cmp	byte ptr [bp-5],24
	jb	short @15@58
   ;	
   ;	    }
   ;	    if (strcmp(pw, "LETSRIP!") == 0) {
   ;	
	push	ds
	push	offset DGROUP:s@+181
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr _strcmp
	add	sp,8
	or	ax,ax
	jne	short @15@226
   ;	
   ;	        the_game->play_sound((uchar *)"drillhi", 0x0F);
   ;	
	push	15
	push	ds
	push	offset DGROUP:s@+190
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_sound$qnucuc
	add	sp,10
   ;	
   ;	        i_inform((uchar *)"Cheat mode ON!\nLet's Rip!", 0, 0);
   ;	
	push	0
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+198
	call	far ptr @i_inform$qnucuct1
	add	sp,10
   ;	
   ;	        cheat_mode = 1;
   ;	
	mov	byte ptr DGROUP:_cheat_mode,1
	jmp	short @15@282
@15@226:
   ;	
   ;	        goto done;
   ;	    }
   ;	    if (var_5 == 0x18)
   ;	
	cmp	byte ptr [bp-5],24
	jne	short @15@282
   ;	
   ;	        i_inform((uchar *)"That is not a valid\npassword.", 0, 0);
   ;	
	push	0
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+224
	call	far ptr @i_inform$qnucuct1
	add	sp,10
@15@282:
   ;	
   ;	done:
   ;	    delete pw;
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @$bdele$qnv
	add	sp,4
   ;	
   ;	    if (game_in_progress != 0)
   ;	
	cmp	byte ptr DGROUP:_game_in_progress,0
	je	short @15@338
   ;	
   ;	        _resume = 1;
   ;	
	mov	byte ptr DGROUP:__resume,1
@15@338:
   ;	
   ;	}
   ;	
	leave	
	ret	
@cb_password$qv	endp
   ;	
   ;	void far cb_quit(void)
   ;	
	assume	cs:MENU_TEXT
@cb_quit$qv	proc	far
	enter	4,0
   ;	
   ;	{
   ;	    FILE *f;
   ;	
   ;	    if (gr_keys[0x44] == 0) {
   ;	
	cmp	byte ptr DGROUP:_gr_keys+68,0
	jne	short @16@86
   ;	
   ;	        if (i_yes_cancel((uchar far *)"Are you sure you want to\nleave?", 0) != 0)
   ;	
	push	0
	push	ds
	push	offset DGROUP:s@+254
	call	far ptr @i_yes_cancel$qnucuc
	add	sp,6
	or	al,al
	je short	@@263
	jmp	@16@282
@@263:
@16@86:
   ;	
   ;	            return;
   ;	    }
   ;	    the_game->reset_sound();
   ;	
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@reset_sound$qv
	add	sp,4
   ;	
   ;	    delete mouse;
   ;	
	push	3
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	call	far ptr @ms_mouse@$bdtr$qv
	add	sp,6
   ;	
   ;	    delete display;
   ;	
	push	3
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@$bdtr$qv
	add	sp,6
   ;	
   ;	    gr_end_kbd_grab();
   ;	
	call	far ptr _gr_end_kbd_grab
   ;	
   ;	    f = fopen("config.rip", "wb+");
   ;	
	push	ds
	push	offset DGROUP:s@+297
	push	ds
	push	offset DGROUP:s@+286
	call	far ptr _fopen
	add	sp,8
	mov	word ptr [bp-2],dx
	mov	word ptr [bp-4],ax
   ;	
   ;	    if (f) {
   ;	
	cmp	dword ptr [bp-4],large 0
	je	short @16@254
   ;	
   ;	        fputc(the_game->field_1C, f);
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	les	bx,dword ptr DGROUP:_the_game
	mov	al,byte ptr es:[bx+28]
	mov	ah,0
	push	ax
	call	far ptr _fputc
	add	sp,6
   ;	
   ;	        fputc(the_game->game_speed, f);
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	les	bx,dword ptr DGROUP:_the_game
	mov	al,byte ptr es:[bx+34]
	mov	ah,0
	push	ax
	call	far ptr _fputc
	add	sp,6
   ;	
   ;	        if (the_game->input_mode == 1)
   ;	
	les	bx,dword ptr DGROUP:_the_game
	cmp	byte ptr es:[bx+36],1
	jne	short @16@170
   ;	
   ;	            fputc(1, f);
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	push	1
	jmp	short @16@198
@16@170:
   ;	
   ;	        else
   ;	            fputc(0, f);
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	push	0
@16@198:
	call	far ptr _fputc
	add	sp,6
   ;	
   ;	        fclose(f);
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr _fclose
	add	sp,4
@16@254:
   ;	
   ;	    }
   ;	    print_form((uchar *)"t_exit.txt", 0);
   ;	
	push	0
	push	ds
	push	offset DGROUP:s@+301
	call	far ptr @print_form$qnucuc
	add	sp,6
   ;	
   ;	    delete the_game;
   ;	
	push	3
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@$bdtr$qv
	add	sp,6
   ;	
   ;	    exit(0);
   ;	
	push	0
	call	far ptr _exit
	pop	cx
@16@282:
   ;	
   ;	}
   ;	
	leave	
	ret	
@cb_quit$qv	endp
   ;	
   ;	void far print_form(uchar far *path, uchar arg_4)
   ;	
	assume	cs:MENU_TEXT
@print_form$qnucuc	proc	far
	enter	20,0
   ;	
   ;	{
   ;	    byte buf;
   ;	    int  col;
   ;	    union REGS regs;
   ;	
   ;	    g_close_element();
   ;	
	call	far ptr @g_close_element$qv
   ;	
   ;	    memset(_tmp, 0, 0x190);
   ;	
	push	400
	push	0
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _memset
	add	sp,8
   ;	
   ;	    if ((long)g_open_element(path) == -1L)
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @g_open_element$qnuc
	push	dx
	push	ax
	pop	eax
	add	sp,4
	cmp	eax,large -1
	jne	short @17@86
   ;	
   ;	        read_error(path);
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @read_error$qnuc
	add	sp,4
@17@86:
   ;	
   ;	    if (arg_4 == 0) {
   ;	
	cmp	byte ptr [bp+10],0
	jne	short @17@142
   ;	
   ;	        textbackground(4);
   ;	
	push	4
	call	far ptr _textbackground
	pop	cx
   ;	
   ;	        textcolor(0x0F);
   ;	
	push	15
	call	far ptr _textcolor
	pop	cx
   ;	
   ;	    } else {
   ;	
	jmp	short @17@198
@17@142:
   ;	
   ;	        regs.h.ah = 2;
   ;	
	mov	byte ptr [bp-19],2
   ;	
   ;	        regs.x.dx = 0;
   ;	
	mov	word ptr [bp-14],0
   ;	
   ;	        int86(0x17, &regs, &regs);
   ;	
	push	ss
	lea	ax,word ptr [bp-20]
	push	ax
	push	ss
	lea	ax,word ptr [bp-20]
	push	ax
	push	23
	call	far ptr _int86
	add	sp,10
   ;	
   ;	        if (regs.h.ah != 0) {
   ;	
	cmp	byte ptr [bp-19],0
	je	short @17@198
   ;	
   ;	            if (i_yes_cancel((uchar *)"Printer error.  Continue?", 0))
   ;	
	push	0
	push	ds
	push	offset DGROUP:s@+312
	call	far ptr @i_yes_cancel$qnucuc
	add	sp,6
	or	al,al
	je short	@@264
	jmp	@17@674
@@264:
@17@198:
   ;	
   ;	                goto end;
   ;	        }
   ;	    }
   ;	    buf = 1;
   ;	
	mov	byte ptr [bp-1],1
	jmp	@17@590
@17@226:
   ;	
   ;	    while (buf != 0) {
   ;	        strnset((char far *)_tmp, 0, 0x50);
   ;	
	push	80
	push	0
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _strnset
	add	sp,8
   ;	
   ;	        col = 0;
   ;	
	mov	word ptr [bp-4],0
@17@254:
   ;	
   ;	        do {
   ;	            if (g_element_read(&buf, 1) != 1)
   ;	
	push	1
	push	ss
	lea	ax,word ptr [bp-1]
	push	ax
	call	far ptr @g_element_read$qnvui
	push	dx
	push	ax
	pop	eax
	add	sp,6
	cmp	eax,large 1
	je short	@@265
	jmp	@17@618
@@265:
   ;	
   ;	                goto eof;
   ;	            if (buf == 9) {
   ;	
	cmp	byte ptr [bp-1],9
	jne	short @17@338
   ;	
   ;	                strcat((char far *)_tmp + col, (char far *)"        ");
   ;	
	push	ds
	push	offset DGROUP:s@+338
	mov	ax,word ptr [bp-4]
	add	ax,offset DGROUP:__tmp
	push	ds
	push	ax
	call	far ptr _strcat
	add	sp,8
   ;	
   ;	                col += 6;
   ;	
	add	word ptr [bp-4],6
   ;	
   ;	            } else {
   ;	
	jmp	short @17@366
@17@338:
   ;	
   ;	                _tmp[col] = buf;
   ;	
	mov	bx,word ptr [bp-4]
	mov	al,byte ptr [bp-1]
	mov	byte ptr DGROUP:__tmp[bx],al
   ;	
   ;	                col++;
   ;	
	inc	word ptr [bp-4]
@17@366:
   ;	
   ;	            }
   ;	        } while (buf != 0x0A);
   ;	
	cmp	byte ptr [bp-1],10
	jne	short @17@254
   ;	
   ;	        if (arg_4 == 0) {
   ;	
	cmp	byte ptr [bp+10],0
	jne	short @17@562
   ;	
   ;	            for (buf = col - 2; buf < 0x50; buf++)
   ;	
	mov	al,byte ptr [bp-4]
	add	al,254
	mov	byte ptr [bp-1],al
	jmp	short @17@506
@17@450:
   ;	
   ;	                _tmp[buf] = ' ';
   ;	
	mov	al,byte ptr [bp-1]
	mov	ah,0
	mov	bx,ax
	mov	byte ptr DGROUP:__tmp[bx],32
	inc	byte ptr [bp-1]
@17@506:
	cmp	byte ptr [bp-1],80
	jb	short @17@450
   ;	
   ;	            _tmp[0x50] = 0x0D;
   ;	
	mov	byte ptr DGROUP:__tmp+80,13
   ;	
   ;	            cputs((char far *)_tmp);
   ;	
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _cputs
	add	sp,4
   ;	
   ;	        } else {
   ;	
	jmp	short @17@590
@17@562:
   ;	
   ;	            vfprintf(&_stream, (char far *)_tmp, 0);
   ;	
	push	0
	push	0
	push	ds
	push	offset DGROUP:__tmp
	push	ds
	push	offset DGROUP:__stream
	call	far ptr _vfprintf
	add	sp,12
@17@590:
	cmp	byte ptr [bp-1],0
	je short	@@266
	jmp	@17@226
@@266:
@17@618:
   ;	
   ;	        }
   ;	    }
   ;	eof:
   ;	    if (arg_4 == 1) {
   ;	
	cmp	byte ptr [bp+10],1
	jne	short @17@674
   ;	
   ;	        _tmp[0] = 0x0C;
   ;	
	mov	byte ptr DGROUP:__tmp,12
   ;	
   ;	        _tmp[1] = 0;
   ;	
	mov	byte ptr DGROUP:__tmp+1,0
   ;	
   ;	        vfprintf(&_stream, (char far *)_tmp, 0);
   ;	
	push	0
	push	0
	push	ds
	push	offset DGROUP:__tmp
	push	ds
	push	offset DGROUP:__stream
	call	far ptr _vfprintf
	add	sp,12
@17@674:
   ;	
   ;	    }
   ;	end:
   ;	    g_close_element();
   ;	
	call	far ptr @g_close_element$qv
   ;	
   ;	}
   ;	
	leave	
	ret	
@print_form$qnucuc	endp
   ;	
   ;	void far cb_sound(void)
   ;	
	assume	cs:MENU_TEXT
@cb_sound$qv	proc	far
	enter	4,0
   ;	
   ;	{
   ;	    text_box far *tb;
   ;	
   ;	    tb = new text_box((uchar far *)"Game Sound");
   ;	
	push	ds
	push	offset DGROUP:s@+347
	push	0
	push	0
	call	far ptr @text_box@$bctr$qnuc
	add	sp,8
	mov	word ptr [bp-2],dx
	mov	word ptr [bp-4],ax
   ;	
   ;	    strcpy((char far *)_tmp, (char far *)"Game sounds are currently ");
   ;	
	push	ds
	push	offset DGROUP:s@+358
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _strcpy
	add	sp,8
   ;	
   ;	    if (the_game->field_1C != 0)
   ;	
	les	bx,dword ptr DGROUP:_the_game
	cmp	byte ptr es:[bx+28],0
	je	short @18@86
   ;	
   ;	        strcat((char far *)_tmp, (char far *)"ON.");
   ;	
	push	ds
	push	offset DGROUP:s@+385
	jmp	short @18@114
@18@86:
   ;	
   ;	    else
   ;	        strcat((char far *)_tmp, (char far *)"OFF.");
   ;	
	push	ds
	push	offset DGROUP:s@+389
@18@114:
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _strcat
	add	sp,8
   ;	
   ;	    tb->add_string((uchar far *)_tmp);
   ;	
	push	ds
	push	offset DGROUP:__tmp
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @text_box@add_string$qnuc
	add	sp,8
   ;	
   ;	    tb->add_string((uchar far *)"New\tsetting?");
   ;	
	push	ds
	push	offset DGROUP:s@+394
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @text_box@add_string$qnuc
	add	sp,8
   ;	
   ;	    tb->add_button((uchar far *)"Off", (void far *)0);
   ;	
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+407
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @text_box@add_button$qnucnv
	add	sp,12
   ;	
   ;	    tb->add_button((uchar far *)"On", (void far *)0);
   ;	
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+411
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
@18@170:
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
	je	short @18@170
   ;	
   ;	        ;
   ;	    if (tb->buttons[0]->field_20 != 0)
   ;	
	les	bx,dword ptr [bp-4]
	les	bx,dword ptr es:[bx+122]
	cmp	word ptr es:[bx+32],0
	je	short @18@254
   ;	
   ;	        the_game->turn_sound(0);
   ;	
	push	0
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@turn_sound$quc
	add	sp,6
@18@254:
   ;	
   ;	    if (tb->buttons[1]->field_20 != 0)
   ;	
	les	bx,dword ptr [bp-4]
	les	bx,dword ptr es:[bx+126]
	cmp	word ptr es:[bx+32],0
	je	short @18@310
   ;	
   ;	        the_game->turn_sound(1);
   ;	
	push	1
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@turn_sound$quc
	add	sp,6
@18@310:
   ;	
   ;	    delete tb;
   ;	
	push	3
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @text_box@$bdtr$qv
	add	sp,6
   ;	
   ;	    if (game_in_progress != 0)
   ;	
	cmp	byte ptr DGROUP:_game_in_progress,0
	je	short @18@366
   ;	
   ;	        _resume = 1;
   ;	
	mov	byte ptr DGROUP:__resume,1
@18@366:
   ;	
   ;	}
   ;	
	leave	
	ret	
@cb_sound$qv	endp
   ;	
   ;	void far cb_control(void)
   ;	
	assume	cs:MENU_TEXT
@cb_control$qv	proc	far
	enter	4,0
   ;	
   ;	{
   ;	    text_box far *tb;
   ;	
   ;	    tb = new text_box((uchar far *)"Game Control");
   ;	
	push	ds
	push	offset DGROUP:s@+414
	push	0
	push	0
	call	far ptr @text_box@$bctr$qnuc
	add	sp,8
	mov	word ptr [bp-2],dx
	mov	word ptr [bp-4],ax
   ;	
   ;	    tb->add_string((uchar far *)"Game control is currently set to:");
   ;	
	push	ds
	push	offset DGROUP:s@+427
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @text_box@add_string$qnuc
	add	sp,8
   ;	
   ;	    switch (the_game->input_mode) {
   ;	
	les	bx,dword ptr DGROUP:_the_game
	mov	al,byte ptr es:[bx+36]
	mov	ah,0
	or	ax,ax
	je	short @19@170
	cmp	ax,1
	je	short @19@198
	jmp	short @19@254
@19@170:
   ;	
   ;	    case 0: tb->add_string((uchar far *)"KEYBOARD"); break;
   ;	
	push	ds
	push	offset DGROUP:s@+461
	jmp	short @19@226
@19@198:
   ;	
   ;	    case 1: tb->add_string((uchar far *)"JOYSTICK"); break;
   ;	
	push	ds
	push	offset DGROUP:s@+470
@19@226:
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @text_box@add_string$qnuc
	add	sp,8
@19@254:
   ;	
   ;	    }
   ;	    tb->add_button((uchar far *)"Joy", (void far *)0);
   ;	
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+479
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @text_box@add_button$qnucnv
	add	sp,12
   ;	
   ;	    tb->add_button((uchar far *)"Key", (void far *)0);
   ;	
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+483
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
@19@282:
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
	je	short @19@282
   ;	
   ;	        ;
   ;	    delete tb;
   ;	
	push	3
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @text_box@$bdtr$qv
	add	sp,6
   ;	
   ;	    if (tb->buttons[0]->field_20 != 0) {          /* Joy selected */
   ;	
	les	bx,dword ptr [bp-4]
	les	bx,dword ptr es:[bx+122]
	cmp	word ptr es:[bx+32],0
	jne short	@@267
	jmp	@19@534
@@267:
   ;	
   ;	        the_game->joy_update();
   ;	
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@joy_update$qv
	add	sp,4
   ;	
   ;	        i_show_box((uchar far *)"Center joystick and press\nfire button.",
   ;	
   ;	
   ;	                   0, 0, (uchar far *)0, (uchar far *)0);
   ;	
	push	0
	push	0
	push	0
	push	0
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+487
	call	far ptr @i_show_box$qnuciit1t1
	add	sp,16
	jmp	short @19@394
@19@366:
   ;	
   ;	        while (joystickbutton(0) == 0 && gr_keys[1] == 0)
   ;	            the_game->joy_update();
   ;	
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@joy_update$qv
	add	sp,4
@19@394:
	push	0
	call	far ptr _joystickbutton
	pop	cx
	or	ax,ax
	jne	short @19@450
	cmp	byte ptr DGROUP:_gr_keys+1,0
	je	short @19@366
@19@450:
   ;	
   ;	        i_hide_box(0);
   ;	
	push	0
	call	far ptr @i_hide_box$quc
	pop	cx
   ;	
   ;	        if (gr_keys[1] != 0)
   ;	
	cmp	byte ptr DGROUP:_gr_keys+1,0
	je	short @19@506
   ;	
   ;	            i_inform((uchar far *)"Joystick\tcalibration aborted.", 0,
   ;	
   ;	
   ;	                     (uchar far *)0);
   ;	
	push	0
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+526
	call	far ptr @i_inform$qnucuct1
	add	sp,10
	jmp	short @19@534
@19@506:
   ;	
   ;	        else
   ;	            the_game->input_mode = 1;
   ;	
	les	bx,dword ptr DGROUP:_the_game
	mov	byte ptr es:[bx+36],1
@19@534:
   ;	
   ;	    }
   ;	    if (tb->buttons[1]->field_20 != 0)            /* Key selected */
   ;	
	les	bx,dword ptr [bp-4]
	les	bx,dword ptr es:[bx+126]
	cmp	word ptr es:[bx+32],0
	je	short @19@590
   ;	
   ;	        the_game->input_mode = 0;
   ;	
	les	bx,dword ptr DGROUP:_the_game
	mov	byte ptr es:[bx+36],0
@19@590:
   ;	
   ;	    if (game_in_progress != 0)
   ;	
	cmp	byte ptr DGROUP:_game_in_progress,0
	je	short @19@646
   ;	
   ;	        _resume = 1;
   ;	
	mov	byte ptr DGROUP:__resume,1
@19@646:
   ;	
   ;	}
   ;	
	leave	
	ret	
@cb_control$qv	endp
   ;	
   ;	void far cb_game_speed(void)
   ;	
	assume	cs:MENU_TEXT
@cb_game_speed$qv	proc	far
	enter	4,0
   ;	
   ;	{
   ;	    text_box far *tb;
   ;	
   ;	    tb = new text_box((uchar far *)"Game Speed");
   ;	
	push	ds
	push	offset DGROUP:s@+556
	push	0
	push	0
	call	far ptr @text_box@$bctr$qnuc
	add	sp,8
	mov	word ptr [bp-2],dx
	mov	word ptr [bp-4],ax
   ;	
   ;	    tb->add_string((uchar far *)"Game speed is currently set to:");
   ;	
	push	ds
	push	offset DGROUP:s@+567
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @text_box@add_string$qnuc
	add	sp,8
   ;	
   ;	    switch (the_game->game_speed) {
   ;	
	les	bx,dword ptr DGROUP:_the_game
	mov	al,byte ptr es:[bx+34]
	mov	ah,0
	cmp	ax,1
	je	short @20@170
	cmp	ax,2
	je	short @20@198
	jmp	short @20@254
@20@170:
   ;	
   ;	    case 1: tb->add_string((uchar far *)"FAST"); break;
   ;	
	push	ds
	push	offset DGROUP:s@+599
	jmp	short @20@226
@20@198:
   ;	
   ;	    case 2: tb->add_string((uchar far *)"SLOW"); break;
   ;	
	push	ds
	push	offset DGROUP:s@+604
@20@226:
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @text_box@add_string$qnuc
	add	sp,8
@20@254:
   ;	
   ;	    }
   ;	    tb->add_button((uchar far *)"Slow", (void far *)0);
   ;	
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+609
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @text_box@add_button$qnucnv
	add	sp,12
   ;	
   ;	    tb->add_button((uchar far *)"Fast", (void far *)0);
   ;	
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+614
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
@20@282:
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
	je	short @20@282
   ;	
   ;	        ;
   ;	    if (tb->buttons[0]->field_20 != 0)            /* Slow */
   ;	
	les	bx,dword ptr [bp-4]
	les	bx,dword ptr es:[bx+122]
	cmp	word ptr es:[bx+32],0
	je	short @20@366
   ;	
   ;	        the_game->game_speed = 2;
   ;	
	les	bx,dword ptr DGROUP:_the_game
	mov	byte ptr es:[bx+34],2
@20@366:
   ;	
   ;	    if (tb->buttons[1]->field_20 != 0)            /* Fast */
   ;	
	les	bx,dword ptr [bp-4]
	les	bx,dword ptr es:[bx+126]
	cmp	word ptr es:[bx+32],0
	je	short @20@422
   ;	
   ;	        the_game->game_speed = 1;
   ;	
	les	bx,dword ptr DGROUP:_the_game
	mov	byte ptr es:[bx+34],1
@20@422:
   ;	
   ;	    if (the_map != 0)
   ;	
	cmp	dword ptr DGROUP:_the_map,large 0
	je	short @20@478
   ;	
   ;	        the_map->exploded = the_game->game_speed;
   ;	
	les	bx,dword ptr DGROUP:_the_game
	mov	al,byte ptr es:[bx+34]
	les	bx,dword ptr DGROUP:_the_map
	mov	byte ptr es:[bx+924],al
@20@478:
   ;	
   ;	    delete tb;
   ;	
	push	3
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @text_box@$bdtr$qv
	add	sp,6
   ;	
   ;	    if (game_in_progress != 0)
   ;	
	cmp	byte ptr DGROUP:_game_in_progress,0
	je	short @20@534
   ;	
   ;	        _resume = 1;
   ;	
	mov	byte ptr DGROUP:__resume,1
@20@534:
   ;	
   ;	}
   ;	
	leave	
	ret	
@cb_game_speed$qv	endp
   ;	
   ;	void far cb_about_de(void)
   ;	
	assume	cs:MENU_TEXT
@cb_about_de$qv	proc	far
	enter	6,0
   ;	
   ;	{
   ;	    int i, x, y;
   ;	
   ;	    display->blank_palette();
   ;	
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@blank_palette$qv
	add	sp,4
   ;	
   ;	    prepare_new_screen();
   ;	
	push	cs
	call	near ptr @prepare_new_screen$qv
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
   ;	    for (i = 0; i < 5000; i++) {
   ;	
	mov	word ptr [bp-2],0
	jmp	short @21@114
@21@58:
   ;	
   ;	        x = random(0x13E);
   ;	
	push	318
	call	far ptr @random$qi
	pop	cx
	mov	word ptr [bp-4],ax
   ;	
   ;	        y = random(0xC6);
   ;	
	push	198
	call	far ptr @random$qi
	pop	cx
	mov	word ptr [bp-6],ax
   ;	
   ;	        display->fill_rect(x, y, x + 2, y + 2, random(6) + 0x2A, -1, 0);
   ;	
	push	0
	push	-1
	push	6
	call	far ptr @random$qi
	pop	cx
	add	ax,42
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
	inc	word ptr [bp-2]
@21@114:
	cmp	word ptr [bp-2],5000
	jl	short @21@58
   ;	
   ;	    }
   ;	    show_loop((uchar far *)"turn.l", 0x14, 0x3C, 0, 0);
   ;	
	push	0
	push	0
	push	60
	push	20
	push	ds
	push	offset DGROUP:s@+619
	call	far ptr @show_loop$qnuciiucui
	add	sp,12
   ;	
   ;	    show_loop((uchar far *)"fish1r.l", 0x46, 0x78, 0, 0);
   ;	
	push	0
	push	0
	push	120
	push	70
	push	ds
	push	offset DGROUP:s@+626
	call	far ptr @show_loop$qnuciiucui
	add	sp,12
   ;	
   ;	    show_loop((uchar far *)"bs1_bdl.l", 0xE6, 0x5F, 1, 0);
   ;	
	push	0
	push	1
	push	95
	push	230
	push	ds
	push	offset DGROUP:s@+635
	call	far ptr @show_loop$qnuciiucui
	add	sp,12
   ;	
   ;	    i_set_text(0x10, 2, 0x1C, 0x9F);
   ;	
	push	159
	push	28
	push	2
	push	16
	call	far ptr @i_set_text$qucucucuc
	add	sp,8
   ;	
   ;	    display->print_at_xy(0x14, 0x0A, (uchar far *)"In Search of Dr.\tRiptide", 1);
   ;	
	push	1
	push	ds
	push	offset DGROUP:s@+645
	push	10
	push	20
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@print_at_xy$qiinucuc
	add	sp,14
   ;	
   ;	    display->print_at_xy(0x14, 0x14, (uchar far *)"R E G I S T E R E D", 1);
   ;	
	push	1
	push	ds
	push	offset DGROUP:s@+670
	push	20
	push	20
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@print_at_xy$qiinucuc
	add	sp,14
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
   ;	    display->print_at_xy(0x14, 0x32, (uchar far *)"Design and Programming:", 1);
   ;	
	push	1
	push	ds
	push	offset DGROUP:s@+690
	push	50
	push	20
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
   ;	    display->print_at_xy(0x14, 0x3C, (uchar far *)"Raoul\tSaid", 1);
   ;	
	push	1
	push	ds
	push	offset DGROUP:s@+714
	push	60
	push	20
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@print_at_xy$qiinucuc
	add	sp,14
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
   ;	    display->print_at_xy(0x14, 0x5A, (uchar far *)"Producer:", 1);
   ;	
	push	1
	push	ds
	push	offset DGROUP:s@+725
	push	90
	push	20
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
   ;	    display->print_at_xy(0x14, 0x64, (uchar far *)"Avery\tPack", 1);
   ;	
	push	1
	push	ds
	push	offset DGROUP:s@+735
	push	100
	push	20
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@print_at_xy$qiinucuc
	add	sp,14
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
   ;	    display->print_at_xy(0x14, 0x78, (uchar far *)"Artwork:", 1);
   ;	
	push	1
	push	ds
	push	offset DGROUP:s@+746
	push	120
	push	20
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
   ;	    display->print_at_xy(0x14, 0x82, (uchar far *)"Mel Guymon", 1);
   ;	
	push	1
	push	ds
	push	offset DGROUP:s@+755
	push	130
	push	20
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@print_at_xy$qiinucuc
	add	sp,14
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
   ;	    display->print_at_xy(0x14, 0x96, (uchar far *)"Composer/Sound Effects:", 1);
   ;	
	push	1
	push	ds
	push	offset DGROUP:s@+766
	push	150
	push	20
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
   ;	    display->print_at_xy(0x14, 0xA0, (uchar far *)"Dan\tFroelich", 1);
   ;	
	push	1
	push	ds
	push	offset DGROUP:s@+790
	push	160
	push	20
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@print_at_xy$qiinucuc
	add	sp,14
   ;	
   ;	    i_set_text(0x68, 3, 0x1C, 0x9B);
   ;	
	push	155
	push	28
	push	3
	push	104
	call	far ptr @i_set_text$qucucucuc
	add	sp,8
   ;	
   ;	    display->print_at_xy(0x14, 0xB4, (uchar far *)"Copyright (C) 1994 MindStorm Software", 1);
   ;	
	push	1
	push	ds
	push	offset DGROUP:s@+803
	push	180
	push	20
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@print_at_xy$qiinucuc
	add	sp,14
   ;	
   ;	    display->print_at_xy(0x14, 0xBE, (uchar far *)"and Pack\tMedia Company, Inc.", 1);
   ;	
	push	1
	push	ds
	push	offset DGROUP:s@+841
	push	190
	push	20
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
   ;	    the_game->play_sound_file((uchar far *)"scream");
   ;	
	push	ds
	push	offset DGROUP:s@+870
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_sound_file$qnuc
	add	sp,8
	jmp	short @21@198
@21@170:
   ;	
   ;	    while (the_game->field_2B != 0 || mouse->field_00 != 0)
   ;	        the_game->doit();
   ;	
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@doit$qv
	add	sp,4
@21@198:
	les	bx,dword ptr DGROUP:_the_game
	cmp	byte ptr es:[bx+43],0
	jne	short @21@170
	les	bx,dword ptr DGROUP:_mouse
	cmp	byte ptr es:[bx],0
	jne	short @21@170
	jmp	short @21@310
@21@282:
   ;	
   ;	    while (the_game->field_2B == 0 && mouse->field_00 == 0)
   ;	        the_game->doit();
   ;	
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@doit$qv
	add	sp,4
@21@310:
	les	bx,dword ptr DGROUP:_the_game
	cmp	byte ptr es:[bx+43],0
	jne	short @21@422
	les	bx,dword ptr DGROUP:_mouse
	cmp	byte ptr es:[bx],0
	je	short @21@282
	jmp	short @21@422
@21@394:
   ;	
   ;	    while (the_game->field_2B != 0 || mouse->field_00 != 0)
   ;	        the_game->doit();
   ;	
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@doit$qv
	add	sp,4
@21@422:
	les	bx,dword ptr DGROUP:_the_game
	cmp	byte ptr es:[bx+43],0
	jne	short @21@394
	les	bx,dword ptr DGROUP:_mouse
	cmp	byte ptr es:[bx],0
	jne	short @21@394
   ;	
   ;	    display->blank_palette();
   ;	
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@blank_palette$qv
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
   ;	    restore_old_screen();
   ;	
	push	cs
	call	near ptr @restore_old_screen$qv
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
@cb_about_de$qv	endp
   ;	
   ;	void far cb_debug_info(void)
   ;	
	assume	cs:MENU_TEXT
@cb_debug_info$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    strset((char far *)_tmp, 0);
   ;	
	push	0
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _strset
	add	sp,6
   ;	
   ;	    strcpy((char far *)_tmp, (char far *)"Bytes\tfree  :\t");
   ;	
	push	ds
	push	offset DGROUP:s@+877
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _strcpy
	add	sp,8
   ;	
   ;	    strcat((char far *)_tmp, ltoa(farcoreleft(), (char far *)_tmp2, 0x0A));
   ;	
	push	10
	push	ds
	push	offset DGROUP:__tmp2
	call	far ptr _farcoreleft
	push	dx
	push	ax
	call	far ptr _ltoa
	add	sp,10
	push	dx
	push	ax
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _strcat
	add	sp,8
   ;	
   ;	    strcat((char far *)_tmp, (char far *)"\n");
   ;	
	push	ds
	push	offset DGROUP:s@+892
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _strcat
	add	sp,8
   ;	
   ;	    strcat((char far *)_tmp, (char far *)"\nMap width   : ");
   ;	
	push	ds
	push	offset DGROUP:s@+894
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _strcat
	add	sp,8
   ;	
   ;	    strcat((char far *)_tmp, itoa(the_map->map_width, (char far *)_tmp2, 0x0A));
   ;	
	push	10
	push	ds
	push	offset DGROUP:__tmp2
	les	bx,dword ptr DGROUP:_the_map
	push	word ptr es:[bx+142]
	call	far ptr _itoa
	add	sp,8
	push	dx
	push	ax
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _strcat
	add	sp,8
   ;	
   ;	    strcat((char far *)_tmp, (char far *)"\nMap height  : ");
   ;	
	push	ds
	push	offset DGROUP:s@+910
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _strcat
	add	sp,8
   ;	
   ;	    strcat((char far *)_tmp, itoa(the_map->map_height, (char far *)_tmp2, 0x0A));
   ;	
	push	10
	push	ds
	push	offset DGROUP:__tmp2
	les	bx,dword ptr DGROUP:_the_map
	push	word ptr es:[bx+144]
	call	far ptr _itoa
	add	sp,8
	push	dx
	push	ax
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _strcat
	add	sp,8
   ;	
   ;	    strcat((char far *)_tmp, (char far *)"\nCast size   : ");
   ;	
	push	ds
	push	offset DGROUP:s@+926
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _strcat
	add	sp,8
   ;	
   ;	    strcat((char far *)_tmp, itoa(the_cast->count, (char far *)_tmp2, 0x0A));
   ;	
	push	10
	push	ds
	push	offset DGROUP:__tmp2
	les	bx,dword ptr DGROUP:_the_cast
	mov	al,byte ptr es:[bx]
	mov	ah,0
	push	ax
	call	far ptr _itoa
	add	sp,8
	push	dx
	push	ax
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _strcat
	add	sp,8
   ;	
   ;	    strcat((char far *)_tmp, (char far *)"\nSprt storage: ");
   ;	
	push	ds
	push	offset DGROUP:s@+942
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _strcat
	add	sp,8
   ;	
   ;	    strcat((char far *)_tmp, ultoa(the_game->field_04, (char far *)_tmp2, 0x0A));
   ;	
	push	10
	push	ds
	push	offset DGROUP:__tmp2
	les	bx,dword ptr DGROUP:_the_game
	movzx	eax,word ptr es:[bx+4]
	push	eax
	call	far ptr _ultoa
	add	sp,10
	push	dx
	push	ax
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _strcat
	add	sp,8
   ;	
   ;	    strcat((char far *)_tmp, (char far *)"\nEgo X,Y     :\t");
   ;	
	push	ds
	push	offset DGROUP:s@+958
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _strcat
	add	sp,8
   ;	
   ;	    strcat((char far *)_tmp, itoa(ego->x, (char far *)_tmp2, 0x0A));
   ;	
	push	10
	push	ds
	push	offset DGROUP:__tmp2
	les	bx,dword ptr DGROUP:_ego
	push	word ptr es:[bx]
	call	far ptr _itoa
	add	sp,8
	push	dx
	push	ax
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _strcat
	add	sp,8
   ;	
   ;	    strcat((char far *)_tmp, (char far *)" ");
   ;	
	push	ds
	push	offset DGROUP:s@+974
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _strcat
	add	sp,8
   ;	
   ;	    strcat((char far *)_tmp, itoa(ego->y, (char far *)_tmp2, 0x0A));
   ;	
	push	10
	push	ds
	push	offset DGROUP:__tmp2
	les	bx,dword ptr DGROUP:_ego
	push	word ptr es:[bx+2]
	call	far ptr _itoa
	add	sp,8
	push	dx
	push	ax
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _strcat
	add	sp,8
   ;	
   ;	    strcat((char far *)_tmp, (char far *)"\nSystem Bench: ");
   ;	
	push	ds
	push	offset DGROUP:s@+976
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _strcat
	add	sp,8
   ;	
   ;	    strcat((char far *)_tmp, itoa(system_bench, (char far *)_tmp2, 0x0A));
   ;	
	push	10
	push	ds
	push	offset DGROUP:__tmp2
	mov	al,byte ptr DGROUP:_system_bench
	mov	ah,0
	push	ax
	call	far ptr _itoa
	add	sp,8
	push	dx
	push	ax
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _strcat
	add	sp,8
   ;	
   ;	    i_inform((uchar far *)_tmp, 1, (uchar far *)0);
   ;	
	push	0
	push	0
	push	1
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr @i_inform$qnucuct1
	add	sp,10
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@cb_debug_info$qv	endp
   ;	
   ;	void far cb_run_benchmark(void)
   ;	
	assume	cs:MENU_TEXT
@cb_run_benchmark$qv	proc	far
	enter	22,0
   ;	
   ;	{
   ;	    long start, end, elapsed;
   ;	    int old_speed, frames, i;
   ;	
   ;	    the_menu_bar->erase();
   ;	
	push	word ptr DGROUP:_the_menu_bar+2
	push	word ptr DGROUP:_the_menu_bar
	les	bx,dword ptr DGROUP:_the_menu_bar
	mov	bx,word ptr es:[bx]
	call	dword ptr [bx+4]
	add	sp,4
   ;	
   ;	    mouse->hide();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	call	far ptr @ms_mouse@hide$qv
	add	sp,4
   ;	
   ;	    old_speed = the_map->exploded;
   ;	
	les	bx,dword ptr DGROUP:_the_map
	mov	al,byte ptr es:[bx+924]
	mov	ah,0
	mov	word ptr [bp-14],ax
   ;	
   ;	    the_map->exploded = 1;
   ;	
	les	bx,dword ptr DGROUP:_the_map
	mov	byte ptr es:[bx+924],1
   ;	
   ;	    i = 600;
   ;	
	mov	word ptr [bp-18],600
   ;	
   ;	    start = clock();
   ;	
	call	far ptr _clock
	push	dx
	push	ax
	pop	eax
	mov	dword ptr [bp-4],eax
	jmp	short @23@86
@23@58:
   ;	
   ;	    while (i-- != 0)
   ;	        de_doit();
   ;	
	call	far ptr @de_doit$qv
@23@86:
	mov	ax,word ptr [bp-18]
	dec	word ptr [bp-18]
	or	ax,ax
	jne	short @23@58
   ;	
   ;	    end = clock();
   ;	
	call	far ptr _clock
	push	dx
	push	ax
	pop	eax
	mov	dword ptr [bp-8],eax
   ;	
   ;	    elapsed = end - start;
   ;	
	mov	eax,dword ptr [bp-8]
	sub	eax,dword ptr [bp-4]
	mov	dword ptr [bp-12],eax
   ;	
   ;	    frames = (int)(600.0 / (elapsed / 18.2));
   ;	
	mov	eax,dword ptr [bp-12]
	mov	dword ptr [bp-22],eax
	fild	dword ptr [bp-22]
	fdiv	qword ptr DGROUP:s@+992
	fdivr	dword ptr DGROUP:s@+1000
	call	far ptr F_FTOL@
	mov	word ptr [bp-16],ax
   ;	
   ;	    the_map->exploded = old_speed;
   ;	
	les	bx,dword ptr DGROUP:_the_map
	mov	al,byte ptr [bp-14]
	mov	byte ptr es:[bx+924],al
   ;	
   ;	    strcpy((char far *)_tmp, (char far *)"Frames per second: ");
   ;	
	push	ds
	push	offset DGROUP:s@+1004
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _strcpy
	add	sp,8
   ;	
   ;	    strcat((char far *)_tmp, itoa(frames, (char far *)_tmp2, 0x0A));
   ;	
	push	10
	push	ds
	push	offset DGROUP:__tmp2
	push	word ptr [bp-16]
	call	far ptr _itoa
	add	sp,8
	push	dx
	push	ax
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr _strcat
	add	sp,8
   ;	
   ;	    the_menu_bar->draw();
   ;	
	push	word ptr DGROUP:_the_menu_bar+2
	push	word ptr DGROUP:_the_menu_bar
	les	bx,dword ptr DGROUP:_the_menu_bar
	mov	bx,word ptr es:[bx]
	call	dword ptr [bx]
	add	sp,4
   ;	
   ;	    mouse->show();
   ;	
	push	word ptr DGROUP:_mouse+2
	push	word ptr DGROUP:_mouse
	call	far ptr @ms_mouse@show$qv
	add	sp,4
   ;	
   ;	    i_inform((uchar far *)_tmp, 0, (uchar far *)0);
   ;	
	push	0
	push	0
	push	0
	push	ds
	push	offset DGROUP:__tmp
	call	far ptr @i_inform$qnucuct1
	add	sp,10
   ;	
   ;	}
   ;	
	leave	
	ret	
@cb_run_benchmark$qv	endp
   ;	
   ;	void far cb_play_song(void)
   ;	
	assume	cs:MENU_TEXT
@cb_play_song$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (the_game->adlib_present == 0) {
   ;	
	les	bx,dword ptr DGROUP:_the_game
	cmp	byte ptr es:[bx+7],0
	jne	short @24@86
   ;	
   ;	        i_inform((uchar far *)"Adlib card not present.", 0, 0);
   ;	
	push	0
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+1024
	call	far ptr @i_inform$qnucuct1
	add	sp,10
   ;	
   ;	    } else {
   ;	
	jmp	short @24@142
@24@86:
   ;	
   ;	        i_load_file((uchar far *)"*.cmf", (uchar far *)_tmp);
   ;	
	push	ds
	push	offset DGROUP:__tmp
	push	ds
	push	offset DGROUP:s@+1048
	call	far ptr @i_load_file$qnuct1
	add	sp,8
   ;	
   ;	        if ((uchar far *)_tmp != 0)
   ;	
	mov	ax,ds
	mov	dx,offset DGROUP:__tmp
	or	dx,ax
	je	short @24@142
   ;	
   ;	            the_game->play_song((uchar far *)_tmp);
   ;	
	push	ds
	push	offset DGROUP:__tmp
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_song$qnuc
	add	sp,8
@24@142:
   ;	
   ;	    }
   ;	}
   ;	
	pop	bp
	ret	
@cb_play_song$qv	endp
   ;	
   ;	void far cb_stop_song(void)
   ;	
	assume	cs:MENU_TEXT
@cb_stop_song$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (the_game->adlib_present == 0) {
   ;	
	les	bx,dword ptr DGROUP:_the_game
	cmp	byte ptr es:[bx+7],0
	jne	short @25@86
   ;	
   ;	        i_inform((uchar far *)"Adlib card not present.", 0, 0);
   ;	
	push	0
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+1054
	call	far ptr @i_inform$qnucuct1
	add	sp,10
   ;	
   ;	    } else {
   ;	
	jmp	short @25@114
@25@86:
   ;	
   ;	        the_game->stop_song();
   ;	
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@stop_song$qv
	add	sp,4
@25@114:
   ;	
   ;	    }
   ;	}
   ;	
	pop	bp
	ret	
@cb_stop_song$qv	endp
   ;	
   ;	void far cb_god_mode(void)
   ;	
	assume	cs:MENU_TEXT
@cb_god_mode$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    i_inform((uchar far *)"God mode now on!", 0, 0);
   ;	
	push	0
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+1078
	call	far ptr @i_inform$qnucuct1
	add	sp,10
   ;	
   ;	    god_mode = 1;
   ;	
	mov	byte ptr DGROUP:_god_mode,1
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@cb_god_mode$qv	endp
   ;	
   ;	void far setup_options(void)
   ;	
	assume	cs:MENU_TEXT
@setup_options$qv	proc	far
	enter	4,0
   ;	
   ;	{
   ;	    pull_down far *pd;
   ;	
   ;	    the_menu_bar->field_13 = 1;
   ;	
	les	bx,dword ptr DGROUP:_the_menu_bar
	mov	byte ptr es:[bx+19],1
   ;	
   ;	    pd = new pull_down((uchar far *)"?");
   ;	
	push	ds
	push	offset DGROUP:s@+1095
	push	0
	push	0
	call	far ptr @pull_down@$bctr$qnuc
	add	sp,8
	mov	word ptr [bp-2],dx
	mov	word ptr [bp-4],ax
   ;	
   ;	    pd->add_item((uchar far *)"About Riptide...", (void far *)cb_about_de);
   ;	
	push	seg @cb_about_de$qv
	push	offset @cb_about_de$qv
	push	ds
	push	offset DGROUP:s@+1097
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @pull_down@add_item$qnucnv
	add	sp,12
   ;	
   ;	    pd->add_item((uchar far *)"Catalog...",       (void far *)cb_catalogue);
   ;	
	push	seg @cb_catalogue$qv
	push	offset @cb_catalogue$qv
	push	ds
	push	offset DGROUP:s@+1114
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @pull_down@add_item$qnucnv
	add	sp,12
   ;	
   ;	    pd->add_item((uchar far *)"Help",             (void far *)cb_help);
   ;	
	push	seg @cb_help$qv
	push	offset @cb_help$qv
	push	ds
	push	offset DGROUP:s@+1125
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @pull_down@add_item$qnucnv
	add	sp,12
   ;	
   ;	    the_menu_bar->add_item(pd);
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	push	word ptr DGROUP:_the_menu_bar+2
	push	word ptr DGROUP:_the_menu_bar
	call	far ptr @menu_bar@add_item$qn9pull_down
	add	sp,8
   ;	
   ;	
   ;	    pd = new pull_down((uchar far *)"Game");
   ;	
	push	ds
	push	offset DGROUP:s@+1130
	push	0
	push	0
	call	far ptr @pull_down@$bctr$qnuc
	add	sp,8
	mov	word ptr [bp-2],dx
	mov	word ptr [bp-4],ax
   ;	
   ;	    pd->add_item((uchar far *)"Start",            (void far *)cb_start);
   ;	
	push	seg @cb_start$qv
	push	offset @cb_start$qv
	push	ds
	push	offset DGROUP:s@+1135
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @pull_down@add_item$qnucnv
	add	sp,12
   ;	
   ;	    pd->add_item((uchar far *)"Start Act II",     (void far *)cb_start_act_2);
   ;	
	push	seg @cb_start_act_2$qv
	push	offset @cb_start_act_2$qv
	push	ds
	push	offset DGROUP:s@+1141
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @pull_down@add_item$qnucnv
	add	sp,12
   ;	
   ;	    pd->add_item((uchar far *)"Resume",           (void far *)cb_resume);
   ;	
	push	seg @cb_resume$qv
	push	offset @cb_resume$qv
	push	ds
	push	offset DGROUP:s@+1154
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @pull_down@add_item$qnucnv
	add	sp,12
   ;	
   ;	    pd->add_item((uchar far *)"Password",         (void far *)cb_password);
   ;	
	push	seg @cb_password$qv
	push	offset @cb_password$qv
	push	ds
	push	offset DGROUP:s@+1161
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @pull_down@add_item$qnucnv
	add	sp,12
   ;	
   ;	    pd->add_item((uchar far *)"Story...",         (void far *)cb_story);
   ;	
	push	seg @cb_story$qv
	push	offset @cb_story$qv
	push	ds
	push	offset DGROUP:s@+1170
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @pull_down@add_item$qnucnv
	add	sp,12
   ;	
   ;	    pd->add_item((uchar far *)"Instructions...",  (void far *)cb_instructions);
   ;	
	push	seg @cb_instructions$qv
	push	offset @cb_instructions$qv
	push	ds
	push	offset DGROUP:s@+1179
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @pull_down@add_item$qnucnv
	add	sp,12
   ;	
   ;	    pd->add_item((uchar far *)"High scores...",   (void far *)cb_high_scores);
   ;	
	push	seg @cb_high_scores$qv
	push	offset @cb_high_scores$qv
	push	ds
	push	offset DGROUP:s@+1195
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @pull_down@add_item$qnucnv
	add	sp,12
   ;	
   ;	    pd->add_item((uchar far *)"Quit",             (void far *)cb_quit);
   ;	
	push	seg @cb_quit$qv
	push	offset @cb_quit$qv
	push	ds
	push	offset DGROUP:s@+1210
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @pull_down@add_item$qnucnv
	add	sp,12
   ;	
   ;	    the_menu_bar->add_item(pd);
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	push	word ptr DGROUP:_the_menu_bar+2
	push	word ptr DGROUP:_the_menu_bar
	call	far ptr @menu_bar@add_item$qn9pull_down
	add	sp,8
   ;	
   ;	
   ;	    pd = new pull_down((uchar far *)"Setup");
   ;	
	push	ds
	push	offset DGROUP:s@+1215
	push	0
	push	0
	call	far ptr @pull_down@$bctr$qnuc
	add	sp,8
	mov	word ptr [bp-2],dx
	mov	word ptr [bp-4],ax
   ;	
   ;	    pd->add_item((uchar far *)"Sound",            (void far *)cb_sound);
   ;	
	push	seg @cb_sound$qv
	push	offset @cb_sound$qv
	push	ds
	push	offset DGROUP:s@+1221
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @pull_down@add_item$qnucnv
	add	sp,12
   ;	
   ;	    pd->add_item((uchar far *)"Control",          (void far *)cb_control);
   ;	
	push	seg @cb_control$qv
	push	offset @cb_control$qv
	push	ds
	push	offset DGROUP:s@+1227
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @pull_down@add_item$qnucnv
	add	sp,12
   ;	
   ;	    pd->add_item((uchar far *)"Game speed",       (void far *)cb_game_speed);
   ;	
	push	seg @cb_game_speed$qv
	push	offset @cb_game_speed$qv
	push	ds
	push	offset DGROUP:s@+1235
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @pull_down@add_item$qnucnv
	add	sp,12
   ;	
   ;	    the_menu_bar->add_item(pd);
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	push	word ptr DGROUP:_the_menu_bar+2
	push	word ptr DGROUP:_the_menu_bar
	call	far ptr @menu_bar@add_item$qn9pull_down
	add	sp,8
   ;	
   ;	
   ;	    if (debug_mode == 1) {
   ;	
	cmp	byte ptr DGROUP:_debug_mode,1
	je short	@@268
	jmp	@27@86
@@268:
   ;	
   ;	        pd = new pull_down((uchar far *)"Debug");
   ;	
	push	ds
	push	offset DGROUP:s@+1246
	push	0
	push	0
	call	far ptr @pull_down@$bctr$qnuc
	add	sp,8
	mov	word ptr [bp-2],dx
	mov	word ptr [bp-4],ax
   ;	
   ;	        pd->add_item((uchar far *)"Info",         (void far *)cb_debug_info);
   ;	
	push	seg @cb_debug_info$qv
	push	offset @cb_debug_info$qv
	push	ds
	push	offset DGROUP:s@+1252
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @pull_down@add_item$qnucnv
	add	sp,12
   ;	
   ;	        pd->add_item((uchar far *)"Run benchmark",(void far *)cb_run_benchmark);
   ;	
	push	seg @cb_run_benchmark$qv
	push	offset @cb_run_benchmark$qv
	push	ds
	push	offset DGROUP:s@+1257
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @pull_down@add_item$qnucnv
	add	sp,12
   ;	
   ;	        pd->add_item((uchar far *)"Shot size...", (void far *)cb_debug_shot_size);
   ;	
	push	seg @cb_debug_shot_size$qv
	push	offset @cb_debug_shot_size$qv
	push	ds
	push	offset DGROUP:s@+1271
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @pull_down@add_item$qnucnv
	add	sp,12
   ;	
   ;	        pd->add_item((uchar far *)"Play song...", (void far *)cb_play_song);
   ;	
	push	seg @cb_play_song$qv
	push	offset @cb_play_song$qv
	push	ds
	push	offset DGROUP:s@+1284
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @pull_down@add_item$qnucnv
	add	sp,12
   ;	
   ;	        pd->add_item((uchar far *)"Stop song",    (void far *)cb_stop_song);
   ;	
	push	seg @cb_stop_song$qv
	push	offset @cb_stop_song$qv
	push	ds
	push	offset DGROUP:s@+1297
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @pull_down@add_item$qnucnv
	add	sp,12
   ;	
   ;	        pd->add_item((uchar far *)"God mode",     (void far *)cb_god_mode);
   ;	
	push	seg @cb_god_mode$qv
	push	offset @cb_god_mode$qv
	push	ds
	push	offset DGROUP:s@+1307
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @pull_down@add_item$qnucnv
	add	sp,12
   ;	
   ;	        the_menu_bar->add_item(pd);
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	push	word ptr DGROUP:_the_menu_bar+2
	push	word ptr DGROUP:_the_menu_bar
	call	far ptr @menu_bar@add_item$qn9pull_down
	add	sp,8
@27@86:
   ;	
   ;	    }
   ;	}
   ;	
	leave	
	ret	
@setup_options$qv	endp
   ;	
   ;	void far cb_debug_shot_size(void)
   ;	
	assume	cs:MENU_TEXT
@cb_debug_shot_size$qv	proc	far
	enter	6,0
   ;	
   ;	{
   ;	    text_box far *tb;
   ;	    uchar var_5;
   ;	
   ;	    tb = new text_box((uchar far *)"Shot size");
   ;	
	push	ds
	push	offset DGROUP:s@+1316
	push	0
	push	0
	call	far ptr @text_box@$bctr$qnuc
	add	sp,8
	mov	word ptr [bp-2],dx
	mov	word ptr [bp-4],ax
   ;	
   ;	    tb->add_string((uchar far *)"\t Enter new shot\tsize:  ");
   ;	
	push	ds
	push	offset DGROUP:s@+1326
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @text_box@add_string$qnuc
	add	sp,8
   ;	
   ;	    tb->add_button((uchar far *)"Small", (void far *)0);
   ;	
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+1351
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @text_box@add_button$qnucnv
	add	sp,12
   ;	
   ;	    tb->add_button((uchar far *)"Medium", (void far *)0);
   ;	
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+1357
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @text_box@add_button$qnucnv
	add	sp,12
   ;	
   ;	    tb->add_button((uchar far *)"Huge", (void far *)0);
   ;	
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+1364
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
@28@58:
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
	je	short @28@58
   ;	
   ;	        ;
   ;	    var_5 = 0;
   ;	
	mov	byte ptr [bp-5],0
	jmp	short @28@198
@28@114:
   ;	
   ;	    while (var_5 < 3) {
   ;	        if (tb->buttons[var_5]->field_20 != 0) {
   ;	
	mov	al,byte ptr [bp-5]
	mov	ah,0
	shl	ax,2
	les	bx,dword ptr [bp-4]
	add	bx,ax
	les	bx,dword ptr es:[bx+122]
	cmp	word ptr es:[bx+32],0
	je	short @28@170
   ;	
   ;	            shot_size = var_5;
   ;	
	mov	al,byte ptr [bp-5]
	mov	byte ptr DGROUP:_shot_size,al
   ;	
   ;	            break;
   ;	
	jmp	short @28@226
@28@170:
   ;	
   ;	        }
   ;	        var_5++;
   ;	
	inc	byte ptr [bp-5]
@28@198:
	cmp	byte ptr [bp-5],3
	jb	short @28@114
@28@226:
   ;	
   ;	    }
   ;	    delete tb;
   ;	
	push	3
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr @text_box@$bdtr$qv
	add	sp,6
   ;	
   ;	}
   ;	
	leave	
	ret	
@cb_debug_shot_size$qv	endp
	?debug	C E9
	?debug	C FA00000000
MENU_TEXT	ends
_DATA	segment word public use16 'DATA'
s@	label	byte
	db	't_cat.txt'
	db	0
	db	'Start game from begining?'
	db	0
	db	'End current game?'
	db	0
	db	't_story.txt'
	db	0
	db	't_inst.txt'
	db	0
	db	't_help.txt'
	db	0
	db	'pat1.l'
	db	0
	db	'pu_shld.l'
	db	0
	db	'pu_auto.l'
	db	0
	db	'pu_fire.l'
	db	0
	db	'pu_jason.l'
	db	0
	db	'pat1.l'
	db	0
	db	'Password'
	db	0
	db	'Enter password below:'
	db	0
	db	'charge'
	db	0
	db	'LETSRIP!'
	db	0
	db	'drillhi'
	db	0
	db	'Cheat mode ON!'
	db	10
	db	'Let'
	db	39
	db	's Rip!'
	db	0
	db	'That is not a valid'
	db	10
	db	'password.'
	db	0
	db	'Are you sure you want to'
	db	10
	db	'leave?'
	db	0
	db	'config.rip'
	db	0
	db	'wb+'
	db	0
	db	't_exit.txt'
	db	0
	db	'Printer error.  Continue?'
	db	0
	db	'        '
	db	0
	db	'Game Sound'
	db	0
	db	'Game sounds are currently '
	db	0
	db	'ON.'
	db	0
	db	'OFF.'
	db	0
	db	'New'
	db	9
	db	'setting?'
	db	0
	db	'Off'
	db	0
	db	'On'
	db	0
	db	'Game Control'
	db	0
	db	'Game control is currently set to:'
	db	0
	db	'KEYBOARD'
	db	0
	db	'JOYSTICK'
	db	0
	db	'Joy'
	db	0
	db	'Key'
	db	0
	db	'Center joystick and press'
	db	10
	db	'fire button.'
	db	0
	db	'Joystick'
	db	9
	db	'calibration aborted.'
	db	0
	db	'Game Speed'
	db	0
	db	'Game speed is currently set to:'
	db	0
	db	'FAST'
	db	0
	db	'SLOW'
	db	0
	db	'Slow'
	db	0
	db	'Fast'
	db	0
	db	'turn.l'
	db	0
	db	'fish1r.l'
	db	0
	db	'bs1_bdl.l'
	db	0
	db	'In Search of Dr.'
	db	9
	db	'Riptide'
	db	0
	db	'R E G I S T E R E D'
	db	0
	db	'Design and Programming:'
	db	0
	db	'Raoul'
	db	9
	db	'Said'
	db	0
	db	'Producer:'
	db	0
	db	'Avery'
	db	9
	db	'Pack'
	db	0
	db	'Artwork:'
	db	0
	db	'Mel Guymon'
	db	0
	db	'Composer/Sound Effects:'
	db	0
	db	'Dan'
	db	9
	db	'Froelich'
	db	0
	db	'Copyright (C) 1994 MindStorm Software'
	db	0
	db	'and Pack'
	db	9
	db	'Media Company, Inc.'
	db	0
	db	'scream'
	db	0
	db	'Bytes'
	db	9
	db	'free  :'
	db	9
	db	0
	db	10
	db	0
	db	10
	db	'Map width   : '
	db	0
	db	10
	db	'Map height  : '
	db	0
	db	10
	db	'Cast size   : '
	db	0
	db	10
	db	'Sprt storage: '
	db	0
	db	10
	db	'Ego X,Y     :'
	db	9
	db	0
	db	' '
	db	0
	db	10
	db	'System Bench: '
	db	0
	db	'3333332@'
	db	0
	db	0
	db	22
	db	'DFrames per second: '
	db	0
	db	'Adlib card not present.'
	db	0
	db	'*.cmf'
	db	0
	db	'Adlib card not present.'
	db	0
	db	'God mode now on!'
	db	0
	db	'?'
	db	0
	db	'About Riptide...'
	db	0
	db	'Catalog...'
	db	0
	db	'Help'
	db	0
	db	'Game'
	db	0
	db	'Start'
	db	0
	db	'Start Act II'
	db	0
	db	'Resume'
	db	0
	db	'Password'
	db	0
	db	'Story...'
	db	0
	db	'Instructions...'
	db	0
	db	'High scores...'
	db	0
	db	'Quit'
	db	0
	db	'Setup'
	db	0
	db	'Sound'
	db	0
	db	'Control'
	db	0
	db	'Game speed'
	db	0
	db	'Debug'
	db	0
	db	'Info'
	db	0
	db	'Run benchmark'
	db	0
	db	'Shot size...'
	db	0
	db	'Play song...'
	db	0
	db	'Stop song'
	db	0
	db	'God mode'
	db	0
	db	'Shot size'
	db	0
	db	9
	db	' Enter new shot'
	db	9
	db	'size:  '
	db	0
	db	'Small'
	db	0
	db	'Medium'
	db	0
	db	'Huge'
	db	0
_DATA	ends
MENU_TEXT	segment byte public use16 'CODE'
MENU_TEXT	ends
	public	@cb_debug_shot_size$qv
	public	@cb_god_mode$qv
	public	@cb_stop_song$qv
	public	@cb_play_song$qv
	extrn	F_FTOL@:far
	public	@cb_run_benchmark$qv
	public	@cb_debug_info$qv
	public	@cb_about_de$qv
	public	@cb_game_speed$qv
	public	@cb_control$qv
	public	@cb_sound$qv
	public	@cb_password$qv
	public	@cb_resume$qv
	public	@cb_high_scores$qv
	public	@cb_help$qv
	public	@cb_instructions$qv
	public	@cb_story$qv
	public	@cb_start_act_2$qv
	public	@cb_start$qv
	public	@cb_catalogue$qv
	public	@restore_old_screen$qv
	public	@prepare_new_screen$qv
	public	@help_call_up$quc
	public	@story_call_up$quc
	public	@instructions_call_up$quc
	public	@catalogue_call_up$quc
	public	@cb_quit$qv
	extrn	@show_high_scores$quc:far
	extrn	@i_load_file$qnuct1:far
	extrn	@i_get_string$qnuct1:far
	extrn	_joystickbutton:far
	extrn	@i_hide_box$quc:far
	extrn	@i_show_box$qnuciit1t1:far
	extrn	@i_inform$qnucuct1:far
	extrn	@i_set_text$qucucucuc:far
	extrn	_ultoa:far
	extrn	_itoa:far
	extrn	__stream:word
	public	@print_form$qnucuc
	extrn	@g_close_element$qv:far
	extrn	@g_element_read$qnvui:far
	extrn	@g_open_element$qnuc:far
	extrn	@read_error$qnuc:far
	extrn	@i_yes_cancel$qnucuc:far
	public	@setup_options$qv
	extrn	_gr_end_kbd_grab:far
	extrn	@random$qi:far
	extrn	@show_loop$qnuciiucui:far
	extrn	@de_doit$qv:far
	extrn	__resume:byte
	extrn	__tmp2:byte
	extrn	__tmp:byte
	extrn	_gr_keys:byte
	extrn	_system_bench:byte
	extrn	_stop_room:byte
	extrn	_shot_size:byte
	extrn	_cheat_mode:byte
	extrn	_god_mode:byte
	extrn	_game_in_progress:byte
	extrn	_zoom_to_map:byte
	extrn	_debug_mode:byte
	extrn	_ego:dword
	extrn	_the_map:dword
	extrn	_the_menu_bar:dword
	extrn	_mouse:dword
	extrn	_display:dword
	extrn	_all_maps:word
	extrn	_the_cast:dword
	extrn	_the_game:dword
	extrn	@text_pager@$bdtr$qv:far
	extrn	@text_pager@$bctr$qnucucnquc$v:far
	extrn	@text_box@add_button$qnucnv:far
	extrn	@text_box@add_string$qnuc:far
	extrn	@text_box@$bdtr$qv:far
	extrn	@text_box@$bctr$qnuc:far
	extrn	@menu_bar@add_item$qn9pull_down:far
	extrn	@pull_down@add_item$qnucnv:far
	extrn	@pull_down@$bctr$qnuc:far
	extrn	@ms_mouse@hide$qv:far
	extrn	@ms_mouse@show$qv:far
	extrn	@ms_mouse@$bdtr$qv:far
	extrn	@vga_display@cls$qucuc:far
	extrn	@vga_display@fill_rect$qiiiiiiuc:far
	extrn	@vga_display@print_at_xy$qiinucuc:far
	extrn	@vga_display@set_palette$qv:far
	extrn	@vga_display@blank_palette$qv:far
	extrn	@vga_display@set_pix$qiiuc:far
	extrn	@vga_display@copy_page$qucuc:far
	extrn	@vga_display@$bdtr$qv:far
	extrn	@game_manager@stop_song$qv:far
	extrn	@game_manager@play_song$qnuc:far
	extrn	@game_manager@reset_sound$qv:far
	extrn	@game_manager@play_sound$qnucuc:far
	extrn	@game_manager@play_sound_file$qnuc:far
	extrn	@game_manager@turn_sound$quc:far
	extrn	@game_manager@joy_update$qv:far
	extrn	@game_manager@doit$qv:far
	extrn	@game_manager@$bdtr$qv:far
	extrn	_exit:far
	extrn	_ltoa:far
	extrn	_clock:far
	extrn	_farcoreleft:far
	extrn	_cputs:far
	extrn	_textcolor:far
	extrn	_textbackground:far
_pokeb	equ	pokeb
_poke	equ	poke
_peekb	equ	peekb
_peek	equ	peek
	extrn	_int86:far
	extrn	_strupr:far
	extrn	_strset:far
	extrn	_strnset:far
	extrn	_strcpy:far
	extrn	_strcmp:far
	extrn	_strcat:far
	extrn	_memset:far
	extrn	_vfprintf:far
	extrn	_fputc:far
	extrn	_fopen:far
	extrn	_fclose:far
	extrn	@$bdele$qnv:far
_s@	equ	s@
	end
