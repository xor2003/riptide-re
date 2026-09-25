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
	?debug	S "creature.cpp"
	?debug	C E92F3C395D0C63726561747572652E637070
	?debug	C E92F3C395D09726970746964652E68
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
CREATURE_TEXT	segment byte public use16 'CODE'
CREATURE_TEXT	ends
DGROUP	group	_DATA,_BSS
	assume	cs:CREATURE_TEXT,ds:DGROUP
_DATA	segment word public use16 'DATA'
d@	label	byte
d@w	label	word
_DATA	ends
_BSS	segment word public use16 'BSS'
b@	label	byte
b@w	label	word
_BSS	ends
CREATURE_TEXT	segment byte public use16 'CODE'
   ;	
   ;	uchar gui_item::poll()
   ;	
	assume	cs:CREATURE_TEXT
@gui_item@poll$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    return 0;
   ;	
	mov	al,0
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@gui_item@poll$qv	endp
   ;	
   ;	void far hit_cur_sub(int a, int b)
   ;	
	assume	cs:CREATURE_TEXT
@hit_cur_sub$qii	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    cur_sub->flag_3   = 1;      /* bit3 — "took a hit this frame" */
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	or	byte ptr es:[bx+82],8
   ;	
   ;	    cur_sub->field_28 += a;
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	mov	ax,word ptr [bp+6]
	add	word ptr es:[bx+40],ax
   ;	
   ;	    cur_sub->field_1E  = b;
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	mov	ax,word ptr [bp+8]
	mov	word ptr es:[bx+30],ax
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@hit_cur_sub$qii	endp
   ;	
   ;	void far set_flying_death(m_actor far *a, uchar far *s2, int arg8, int argA, uchar argC)
   ;	
	assume	cs:CREATURE_TEXT
@set_flying_death$qn7m_actornuciiuc	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    a->new_loop(s2);
   ;	
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@new_loop$qnuc
	add	sp,8
   ;	
   ;	    a->set_cycle(arg8, argC);
   ;	
	mov	al,byte ptr [bp+18]
	push	ax
	mov	al,byte ptr [bp+14]
	push	ax
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
   ;	
   ;	    a->state    = 2;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+61],2
   ;	
   ;	    a->y_speed  = argA;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp+16]
	mov	word ptr es:[bx+22],ax
   ;	
   ;	    a->x_speed  = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+20],0
   ;	
   ;	    a->type     = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+53],0
   ;	
   ;	    a->flag_0   = 0;
   ;	
	les	bx,dword ptr [bp+6]
	and	byte ptr es:[bx+82],254
   ;	
   ;	    enemies_killed++;
   ;	
	inc	byte ptr DGROUP:_enemies_killed
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@set_flying_death$qn7m_actornuciiuc	endp
   ;	
   ;	void far check_flying_death(m_actor far *a)
   ;	
	assume	cs:CREATURE_TEXT
@check_flying_death$qn7m_actor	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (a->state == 2) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+61],2
	jne	short @4@114
   ;	
   ;	        a->y_speed++;
   ;	
	les	bx,dword ptr [bp+6]
	inc	word ptr es:[bx+22]
   ;	
   ;	        if (!a->in_window)
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,1
	and	ax,1
	or	ax,ax
	jne	short @4@114
   ;	
   ;	            a->flag_0 = 1;
   ;	
	les	bx,dword ptr [bp+6]
	or	byte ptr es:[bx+82],1
@4@114:
   ;	
   ;	    }
   ;	}
   ;	
	pop	bp
	ret	
@check_flying_death$qn7m_actor	endp
   ;	
   ;	byte far check_for_hit(m_actor far *a, uchar arg4)
   ;	
	assume	cs:CREATURE_TEXT
@check_for_hit$qn7m_actoruc	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (!a->flag_3)
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,3
	and	ax,1
	or	ax,ax
	jne	short @5@86
   ;	
   ;	        return 0;
   ;	
	mov	al,0
	jmp	short @5@170
@5@86:
   ;	
   ;	    a->flag_3   = 0;
   ;	
	les	bx,dword ptr [bp+6]
	and	byte ptr es:[bx+82],247
   ;	
   ;	    a->field_36 = 0x0F;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+54],15
   ;	
   ;	    if (arg4 > a->field_28)
   ;	
	mov	al,byte ptr [bp+10]
	mov	ah,0
	les	bx,dword ptr [bp+6]
	cmp	ax,word ptr es:[bx+40]
	jle	short @5@142
   ;	
   ;	        return 1;
   ;	
	mov	al,1
	jmp	short @5@170
@5@142:
   ;	
   ;	    a->flag_0 = 1;
   ;	
	les	bx,dword ptr [bp+6]
	or	byte ptr es:[bx+82],1
   ;	
   ;	    return 2;
   ;	
	mov	al,2
@5@170:
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@check_for_hit$qn7m_actoruc	endp
   ;	
   ;	byte far check_vertical_ray(m_actor far *a, uint arg4)
   ;	
	assume	cs:CREATURE_TEXT
@check_vertical_ray$qn7m_actorui	proc	far
	enter	6,0
   ;	
   ;	{
   ;	    int var_2, var_4, var_6;
   ;	    var_2 = a->map_pos;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+24]
	mov	word ptr [bp-2],ax
   ;	
   ;	    if (a->center_y < cur_sub->center_y) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+10]
	les	bx,dword ptr DGROUP:_cur_sub
	cmp	ax,word ptr es:[bx+10]
	jge	short @6@86
   ;	
   ;	        var_2 += tbl_mul_tw[a->field_1C];       /* row just below the actor */
   ;	
	les	bx,dword ptr [bp+6]
	mov	bx,word ptr es:[bx+28]
	shl	bx,1
	mov	ax,word ptr [bp-2]
	add	ax,word ptr DGROUP:_tbl_mul_tw[bx]
	mov	word ptr [bp-2],ax
   ;	
   ;	        var_4  = the_map->map_width;            /* scan downward */
   ;	
	les	bx,dword ptr DGROUP:_the_map
	mov	ax,word ptr es:[bx+142]
	jmp	short @6@114
@6@86:
   ;	
   ;	    } else {
   ;	        var_4  = -the_map->map_width;           /* scan upward */
   ;	
	les	bx,dword ptr DGROUP:_the_map
	mov	ax,word ptr es:[bx+142]
	neg	ax
@6@114:
	mov	word ptr [bp-4],ax
   ;	
   ;	    }
   ;	    if (arg4 < 1) arg4 = 1;
   ;	
	cmp	word ptr [bp+10],1
	jae	short @6@394
	mov	word ptr [bp+10],1
	jmp	short @6@394
	jmp	short @6@394
@6@226:
   ;	
   ;	    while (arg4--) {
   ;	        var_6 = 0;
   ;	
	mov	word ptr [bp-6],0
	jmp	short @6@338
@6@254:
   ;	
   ;	        while (a->field_1A > var_6) {
   ;	            if (the_map->tile_attr[var_2 + var_6].attr < 0x100)
   ;	
	les	bx,dword ptr DGROUP:_the_map
	les	bx,dword ptr es:[bx+926]
	mov	ax,word ptr [bp-2]
	add	ax,word ptr [bp-6]
	shl	ax,2
	add	bx,ax
	cmp	word ptr es:[bx],256
	jae	short @6@310
   ;	
   ;	                return 0;
   ;	
	mov	al,0
	jmp	short @6@450
@6@310:
   ;	
   ;	            var_6++;
   ;	
	inc	word ptr [bp-6]
@6@338:
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+26]
	cmp	ax,word ptr [bp-6]
	jg	short @6@254
   ;	
   ;	        }
   ;	        var_2 += var_4;
   ;	
	mov	ax,word ptr [bp-4]
	add	word ptr [bp-2],ax
@6@394:
	mov	ax,word ptr [bp+10]
	dec	word ptr [bp+10]
	or	ax,ax
	jne	short @6@226
   ;	
   ;	    }
   ;	    return 1;
   ;	
	mov	al,1
@6@450:
   ;	
   ;	}
   ;	
	leave	
	ret	
@check_vertical_ray$qn7m_actorui	endp
   ;	
   ;	byte far check_horizontal_ray(m_actor far *a, uint arg4)
   ;	
	assume	cs:CREATURE_TEXT
@check_horizontal_ray$qn7m_actorui	proc	far
	enter	4,0
   ;	
   ;	{
   ;	    int var_2, var_4;
   ;	    var_2 = a->map_pos + tbl_mul_tw[a->field_1C >> 1];
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+24]
	les	bx,dword ptr [bp+6]
	mov	bx,word ptr es:[bx+28]
	sar	bx,1
	shl	bx,1
	add	ax,word ptr DGROUP:_tbl_mul_tw[bx]
	mov	word ptr [bp-2],ax
   ;	
   ;	    if (a->direction == 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+52],0
	jne	short @7@86
   ;	
   ;	        var_4  = 1;
   ;	
	mov	word ptr [bp-4],1
   ;	
   ;	        var_2 += a->field_1A;                   /* start just past the right edge */
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+26]
	add	word ptr [bp-2],ax
   ;	
   ;	    } else {
   ;	
	jmp	short @7@114
@7@86:
   ;	
   ;	        var_4  = -1;                            /* scan leftward */
   ;	
	mov	word ptr [bp-4],-1
@7@114:
   ;	
   ;	    }
   ;	    if (arg4 < 1) arg4 = 1;
   ;	
	cmp	word ptr [bp+10],1
	jae	short @7@282
	mov	word ptr [bp+10],1
	jmp	short @7@282
	jmp	short @7@282
@7@198:
   ;	
   ;	    while (arg4--) {
   ;	        if (the_map->tile_attr[var_2].attr < 0x100)
   ;	
	les	bx,dword ptr DGROUP:_the_map
	les	bx,dword ptr es:[bx+926]
	mov	ax,word ptr [bp-2]
	shl	ax,2
	add	bx,ax
	cmp	word ptr es:[bx],256
	jae	short @7@254
   ;	
   ;	            return 0;
   ;	
	mov	al,0
	jmp	short @7@338
@7@254:
   ;	
   ;	        var_2 += var_4;
   ;	
	mov	ax,word ptr [bp-4]
	add	word ptr [bp-2],ax
@7@282:
	mov	ax,word ptr [bp+10]
	dec	word ptr [bp+10]
	or	ax,ax
	jne	short @7@198
   ;	
   ;	    }
   ;	    return 1;
   ;	
	mov	al,1
@7@338:
   ;	
   ;	}
   ;	
	leave	
	ret	
@check_horizontal_ray$qn7m_actorui	endp
   ;	
   ;	int far check_new_pos(m_actor far *a, int arg4, int arg6,
   ;	
	assume	cs:CREATURE_TEXT
@check_new_pos$qn7m_actoriinit4iii	proc	far
	enter	14,0
   ;	
   ;	                      int far *arg8, int far *argC, int arg10, int arg12, int arg14)
   ;	{
   ;	    int var_2, var_4, var_6, var_8, var_A, var_E;
   ;	    uchar var_B;
   ;	    var_2 = a->x;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx]
	mov	word ptr [bp-2],ax
   ;	
   ;	    var_4 = a->y;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	mov	word ptr [bp-4],ax
   ;	
   ;	    var_6 = a->map_pos;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+24]
	mov	word ptr [bp-6],ax
   ;	
   ;	    var_8 = a->x_speed;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+20]
	mov	word ptr [bp-8],ax
   ;	
   ;	    var_A = a->y_speed;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+22]
	mov	word ptr [bp-10],ax
   ;	
   ;	    a->x = arg4;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp+10]
	mov	word ptr es:[bx],ax
   ;	
   ;	    a->y = arg6;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp+12]
	mov	word ptr es:[bx+2],ax
   ;	
   ;	    a->map_pos = tbl_mul_tw[a->y >> 3] + (a->x >> 3);
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx]
	sar	ax,3
	les	bx,dword ptr [bp+6]
	mov	bx,word ptr es:[bx+2]
	sar	bx,3
	shl	bx,1
	mov	dx,word ptr DGROUP:_tbl_mul_tw[bx]
	add	dx,ax
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+24],dx
   ;	
   ;	    var_E = a->tile_collision(arg10, arg12, arg14);
   ;	
	push	word ptr [bp+26]
	push	word ptr [bp+24]
	push	word ptr [bp+22]
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@tile_collision$qiii
	add	sp,10
	mov	ah,0
	mov	word ptr [bp-12],ax
   ;	
   ;	    if (var_E != 0)
   ;	
	cmp	word ptr [bp-12],0
	je	short @8@86
   ;	
   ;	        var_E |= 0x8000;
   ;	
	or	word ptr [bp-12],-32768
	jmp	short @8@338
@8@86:
   ;	
   ;	    else {
   ;	        var_B = 0;
   ;	
	mov	byte ptr [bp-13],0
	jmp	short @8@310
@8@114:
   ;	
   ;	        while (var_B < barrier_count) {
   ;	            act = barrier_list[var_B];
   ;	
	mov	al,byte ptr [bp-13]
	mov	ah,0
	shl	ax,2
	mov	bx,ax
	mov	ax,word ptr DGROUP:_barrier_list[bx+2]
	mov	dx,word ptr DGROUP:_barrier_list[bx]
	mov	word ptr DGROUP:_act+2,ax
	mov	word ptr DGROUP:_act,dx
   ;	
   ;	            if (act != a && touching(a, act)) {
   ;	
	mov	eax,dword ptr DGROUP:_act
	cmp	eax,dword ptr [bp+6]
	je	short @8@282
	push	word ptr DGROUP:_act+2
	push	word ptr DGROUP:_act
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @touching$qn7m_actort1
	add	sp,8
	or	al,al
	je	short @8@282
   ;	
   ;	                if (a->x >= act->x)
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx]
	les	bx,dword ptr DGROUP:_act
	cmp	ax,word ptr es:[bx]
	jl	short @8@226
   ;	
   ;	                    var_E = 0x20;
   ;	
	mov	word ptr [bp-12],32
	jmp	short @8@338
@8@226:
   ;	
   ;	                else
   ;	                    var_E = 0x80;
   ;	
	mov	word ptr [bp-12],128
	jmp	short @8@338
   ;	
   ;	                break;
   ;	
	jmp	short @8@338
@8@282:
   ;	
   ;	            }
   ;	            var_B++;
   ;	
	inc	byte ptr [bp-13]
@8@310:
	mov	al,byte ptr [bp-13]
	cmp	al,byte ptr DGROUP:_barrier_count
	jb	short @8@114
@8@338:
   ;	
   ;	        }
   ;	    }
   ;	    if (var_E & 5)    var_A = 1;
   ;	
	test	word ptr [bp-12],5
	je	short @8@394
	mov	word ptr [bp-10],1
@8@394:
   ;	
   ;	    if (var_E & 0x0A) var_8 = 1;
   ;	
	test	word ptr [bp-12],10
	je	short @8@450
	mov	word ptr [bp-8],1
@8@450:
   ;	
   ;	    a->x = var_2;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp-2]
	mov	word ptr es:[bx],ax
   ;	
   ;	    a->y = var_4;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp-4]
	mov	word ptr es:[bx+2],ax
   ;	
   ;	    a->map_pos = var_6;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp-6]
	mov	word ptr es:[bx+24],ax
   ;	
   ;	    *arg8 = var_8;
   ;	
	les	bx,dword ptr [bp+14]
	mov	ax,word ptr [bp-8]
	mov	word ptr es:[bx],ax
   ;	
   ;	    *argC = var_A;
   ;	
	les	bx,dword ptr [bp+18]
	mov	ax,word ptr [bp-10]
	mov	word ptr es:[bx],ax
   ;	
   ;	    return var_E;
   ;	
	mov	ax,word ptr [bp-12]
   ;	
   ;	}
   ;	
	leave	
	ret	
@check_new_pos$qn7m_actoriinit4iii	endp
   ;	
   ;	void far mv_ego(m_actor far *a, int far *x_out, int far *y_out)
   ;	
	assume	cs:CREATURE_TEXT
@mv_ego$qn7m_actornit2	proc	far
	enter	8,0
	push	si
   ;	
   ;	{
   ;	    int var_2, var_4, var_6, var_8;
   ;	    if (*y_out < 0)
   ;	
	les	bx,dword ptr [bp+14]
	cmp	word ptr es:[bx],0
	jge	short @9@86
   ;	
   ;	        *y_out = 0;
   ;	
	les	bx,dword ptr [bp+14]
	mov	word ptr es:[bx],0
@9@86:
   ;	
   ;	    if (a->door_open) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,6
	and	ax,1
	or	ax,ax
	je	short @9@198
   ;	
   ;	        var_2 = (((*y_out - a->y_speed) >> 3) + 1 << 3) - 1;
   ;	
	les	bx,dword ptr [bp+6]
	push	es
	les	si,dword ptr [bp+14]
	mov	ax,word ptr es:[si]
	pop	es
	sub	ax,word ptr es:[bx+22]
	sar	ax,3
	inc	ax
	shl	ax,3
	dec	ax
	mov	word ptr [bp-2],ax
   ;	
   ;	        if (*y_out < var_2 && a->y_speed <= 0)
   ;	
	les	bx,dword ptr [bp+14]
	mov	ax,word ptr es:[bx]
	cmp	ax,word ptr [bp-2]
	jge	short @9@198
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+22],0
	jg	short @9@198
   ;	
   ;	            *y_out = var_2;
   ;	
	les	bx,dword ptr [bp+14]
	mov	ax,word ptr [bp-2]
	mov	word ptr es:[bx],ax
@9@198:
   ;	
   ;	    }
   ;	    if (a == jason)
   ;	
	mov	eax,dword ptr [bp+6]
	cmp	eax,dword ptr DGROUP:_jason
	jne	short @9@254
   ;	
   ;	        var_8 = check_new_pos(a, *x_out, *y_out, &var_4, &var_6, 4, 2, 0);
   ;	
	push	0
	push	2
	push	4
	jmp	short @9@282
@9@254:
   ;	
   ;	    else
   ;	        var_8 = check_new_pos(a, *x_out, *y_out, &var_4, &var_6, ego_map_w, ego_map_h, 1);
   ;	
	push	1
	push	word ptr DGROUP:_ego_map_h
	push	word ptr DGROUP:_ego_map_w
@9@282:
	push	ss
	lea	ax,word ptr [bp-6]
	push	ax
	push	ss
	lea	ax,word ptr [bp-4]
	push	ax
	les	bx,dword ptr [bp+14]
	push	word ptr es:[bx]
	les	bx,dword ptr [bp+10]
	push	word ptr es:[bx]
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @check_new_pos$qn7m_actoriinit4iii
	add	sp,22
	mov	word ptr [bp-8],ax
   ;	
   ;	    if (var_8 != 0) {
   ;	
	cmp	word ptr [bp-8],0
	je	short @9@450
   ;	
   ;	        if (var_4 != 0) {
   ;	
	cmp	word ptr [bp-4],0
	je	short @9@394
   ;	
   ;	            *x_out = a->x;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx]
	les	bx,dword ptr [bp+10]
	mov	word ptr es:[bx],ax
   ;	
   ;	            a->x_speed = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+20],0
@9@394:
   ;	
   ;	        }
   ;	        if (var_6 != 0) {
   ;	
	cmp	word ptr [bp-6],0
	je	short @9@450
   ;	
   ;	            *y_out = a->y;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	les	bx,dword ptr [bp+14]
	mov	word ptr es:[bx],ax
   ;	
   ;	            a->y_speed = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+22],0
@9@450:
   ;	
   ;	        }
   ;	    }
   ;	}
   ;	
	pop	si
	leave	
	ret	
@mv_ego$qn7m_actornit2	endp
   ;	
   ;	void far mv_pirana(m_actor far *a, int far *x_out, int far *y_out)
   ;	
	assume	cs:CREATURE_TEXT
@mv_pirana$qn7m_actornit2	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (!a->flag_7) {           /* bit7 — move-enable */
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,7
	and	ax,1
	or	ax,ax
	jne	short @10@86
   ;	
   ;	        *x_out = a->x;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx]
	les	bx,dword ptr [bp+10]
	mov	word ptr es:[bx],ax
   ;	
   ;	        *y_out = a->y;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	les	bx,dword ptr [bp+14]
	mov	word ptr es:[bx],ax
@10@86:
   ;	
   ;	    }
   ;	    mv_std(a, x_out, y_out);
   ;	
	push	word ptr [bp+16]
	push	word ptr [bp+14]
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @mv_std$qn7m_actornit2
	add	sp,12
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@mv_pirana$qn7m_actornit2	endp
   ;	
   ;	void far mv_barrel(m_actor far *a, int far *x_out, int far *y_out)
   ;	
	assume	cs:CREATURE_TEXT
@mv_barrel$qn7m_actornit2	proc	far
	enter	6,0
   ;	
   ;	{
   ;	    int var_2, var_4, var_6;
   ;	    var_6 = check_new_pos(a, *x_out, *y_out, &var_2, &var_4, 0, 0, 0);
   ;	
	push	0
	push	0
	push	0
	push	ss
	lea	ax,word ptr [bp-4]
	push	ax
	push	ss
	lea	ax,word ptr [bp-2]
	push	ax
	les	bx,dword ptr [bp+14]
	push	word ptr es:[bx]
	les	bx,dword ptr [bp+10]
	push	word ptr es:[bx]
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @check_new_pos$qn7m_actoriinit4iii
	add	sp,22
	mov	word ptr [bp-6],ax
   ;	
   ;	    if (var_6 != 0) {
   ;	
	cmp	word ptr [bp-6],0
	je	short @11@142
   ;	
   ;	        if (var_6 < 0)                          /* sign bit — hit the floor */
   ;	
	cmp	word ptr [bp-6],0
	jge	short @11@114
   ;	
   ;	            a->move_func = 0;                   /* [42h] — stop bouncing */
   ;	
	les	bx,dword ptr [bp+6]
	mov	dword ptr es:[bx+66],large 0
@11@114:
   ;	
   ;	        a->y_speed = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+22],0
   ;	
   ;	        *y_out = a->y;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	les	bx,dword ptr [bp+14]
	mov	word ptr es:[bx],ax
   ;	
   ;	    } else {
   ;	
	jmp	short @11@198
@11@142:
   ;	
   ;	        if (a->y_speed == 2)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+22],2
	je	short @11@198
   ;	
   ;	            return;
   ;	        a->y_speed++;                           /* gravity */
   ;	
	les	bx,dword ptr [bp+6]
	inc	word ptr es:[bx+22]
@11@198:
   ;	
   ;	    }
   ;	}
   ;	
	leave	
	ret	
@mv_barrel$qn7m_actornit2	endp
   ;	
   ;	void far mv_std(m_actor far *a, int far *x_out, int far *y_out)
   ;	
	assume	cs:CREATURE_TEXT
@mv_std$qn7m_actornit2	proc	far
	enter	6,0
   ;	
   ;	{
   ;	    int var_2, var_4, var_6;
   ;	    var_6 = check_new_pos(a, *x_out, *y_out, &var_2, &var_4, 0, 0, 0);
   ;	
	push	0
	push	0
	push	0
	push	ss
	lea	ax,word ptr [bp-4]
	push	ax
	push	ss
	lea	ax,word ptr [bp-2]
	push	ax
	les	bx,dword ptr [bp+14]
	push	word ptr es:[bx]
	les	bx,dword ptr [bp+10]
	push	word ptr es:[bx]
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @check_new_pos$qn7m_actoriinit4iii
	add	sp,22
	mov	word ptr [bp-6],ax
   ;	
   ;	    if (var_6 != 0) {
   ;	
	cmp	word ptr [bp-6],0
	je	short @12@170
   ;	
   ;	        if (var_2 != 0) {
   ;	
	cmp	word ptr [bp-2],0
	je	short @12@114
   ;	
   ;	            a->door_open = 1;
   ;	
	les	bx,dword ptr [bp+6]
	or	byte ptr es:[bx+82],64
   ;	
   ;	            *x_out = a->x;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx]
	les	bx,dword ptr [bp+10]
	mov	word ptr es:[bx],ax
@12@114:
   ;	
   ;	        }
   ;	        if (var_4 != 0) {
   ;	
	cmp	word ptr [bp-4],0
	je	short @12@170
   ;	
   ;	            a->y_speed = -a->y_speed;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+22]
	neg	ax
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+22],ax
   ;	
   ;	            *y_out = a->y;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	les	bx,dword ptr [bp+14]
	mov	word ptr es:[bx],ax
@12@170:
   ;	
   ;	        }
   ;	    }
   ;	}
   ;	
	leave	
	ret	
@mv_std$qn7m_actornit2	endp
   ;	
   ;	void far mv_shark(m_actor far *a, int far *x_out, int far *y_out)
   ;	
	assume	cs:CREATURE_TEXT
@mv_shark$qn7m_actornit2	proc	far
	push	bp
	mov	bp,sp
	push	si
   ;	
   ;	{
   ;	    if (a->door_open) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,6
	and	ax,1
	or	ax,ax
	je	short @13@254
   ;	
   ;	        if (the_map->tile_attr[a->map_pos - 2].attr < 0x100 && a->direction == 1)
   ;	
	les	bx,dword ptr DGROUP:_the_map
	les	bx,dword ptr es:[bx+926]
	push	es
	les	si,dword ptr [bp+6]
	mov	ax,word ptr es:[si+24]
	add	ax,-2
	shl	ax,2
	add	bx,ax
	pop	es
	cmp	word ptr es:[bx],256
	jae	short @13@114
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+52],1
	je	short @13@226
@13@114:
   ;	
   ;	            goto latch;
   ;	        if (the_map->tile_attr[a->map_pos + a->field_1A + 2].attr < 0x100 && a->direction == 0)
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+24]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+26]
	add	ax,2
	shl	ax,2
	les	bx,dword ptr DGROUP:_the_map
	les	bx,dword ptr es:[bx+926]
	add	bx,ax
	cmp	word ptr es:[bx],256
	jae	short @13@254
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+52],0
	jne	short @13@254
   ;	
   ;	            goto latch;
   ;	
	jmp	short @13@226
   ;	
   ;	        return;
   ;	
	jmp	short @13@254
@13@226:
   ;	
   ;	latch:
   ;	        a->flag_7 = 1;
   ;	
	les	bx,dword ptr [bp+6]
	or	byte ptr es:[bx+82],128
   ;	
   ;	        *x_out = a->x;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx]
	les	bx,dword ptr [bp+10]
	mov	word ptr es:[bx],ax
@13@254:
   ;	
   ;	    }
   ;	}
   ;	
	pop	si
	pop	bp
	ret	
@mv_shark$qn7m_actornit2	endp
   ;	
   ;	void far mv_ship(m_actor far *a, int far *x_out, int far *y_out)
   ;	
	assume	cs:CREATURE_TEXT
@mv_ship$qn7m_actornit2	proc	far
	enter	2,0
	push	si
   ;	
   ;	{
   ;	    int var_2;
   ;	    var_2 = a->map_pos + word_2BA84[a->field_1C];
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+24]
	les	bx,dword ptr [bp+6]
	mov	bx,word ptr es:[bx+28]
	shl	bx,1
	add	ax,word ptr DGROUP:_word_2BA84[bx]
	mov	word ptr [bp-2],ax
   ;	
   ;	    if (the_map->tile_attr[var_2 - 1].attr < 0x100 && a->direction == 1)
   ;	
	les	bx,dword ptr DGROUP:_the_map
	les	bx,dword ptr es:[bx+926]
	mov	ax,word ptr [bp-2]
	dec	ax
	shl	ax,2
	add	bx,ax
	cmp	word ptr es:[bx],256
	jae	short @14@86
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+52],1
	je	short @14@198
@14@86:
   ;	
   ;	        goto latch;
   ;	    if (the_map->tile_attr[var_2 + a->field_1A + 1].attr < 0x100 && a->direction == 0)
   ;	
	les	bx,dword ptr DGROUP:_the_map
	les	bx,dword ptr es:[bx+926]
	push	es
	les	si,dword ptr [bp+6]
	mov	ax,word ptr [bp-2]
	add	ax,word ptr es:[si+26]
	inc	ax
	shl	ax,2
	add	bx,ax
	pop	es
	cmp	word ptr es:[bx],256
	jae	short @14@226
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+52],0
	jne	short @14@226
   ;	
   ;	        goto latch;
   ;	
	jmp	short @14@198
   ;	
   ;	    return;
   ;	
	jmp	short @14@226
@14@198:
   ;	
   ;	latch:
   ;	    a->door_open = 1;
   ;	
	les	bx,dword ptr [bp+6]
	or	byte ptr es:[bx+82],64
   ;	
   ;	    *x_out = a->x;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx]
	les	bx,dword ptr [bp+10]
	mov	word ptr es:[bx],ax
@14@226:
   ;	
   ;	}
   ;	
	pop	si
	leave	
	ret	
@mv_ship$qn7m_actornit2	endp
   ;	
   ;	void far mv_bs2tn(m_actor far *a, int far *x_out, int far *y_out)
   ;	
	assume	cs:CREATURE_TEXT
@mv_bs2tn$qn7m_actornit2	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (a->direction == 1)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+52],1
	jne	short @15@86
   ;	
   ;	        *x_out = a->target->x + a->counter_24;
   ;	
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+44]
	mov	ax,word ptr es:[bx]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+34]
	jmp	short @15@114
@15@86:
   ;	
   ;	    else
   ;	        *x_out = a->target->x + a->health;
   ;	
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+44]
	mov	ax,word ptr es:[bx]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+38]
@15@114:
	les	bx,dword ptr [bp+10]
	mov	word ptr es:[bx],ax
   ;	
   ;	    *y_out = a->target->y + a->counter_26;
   ;	
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+44]
	mov	ax,word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+36]
	les	bx,dword ptr [bp+14]
	mov	word ptr es:[bx],ax
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@mv_bs2tn$qn7m_actornit2	endp
   ;	
   ;	void far mv_pace(m_actor far *a, int far *x_out, int far *y_out)
   ;	
	assume	cs:CREATURE_TEXT
@mv_pace$qn7m_actornit2	proc	far
	enter	8,0
	push	si
   ;	
   ;	{
   ;	    int var_2, var_4, var_6, var_8;
   ;	
   ;	    if (a->state == 2)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+61],2
	jne short	@@0
	jmp	@16@450
@@0:
   ;	
   ;	        return;
   ;	    if (a->in_window) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,1
	and	ax,1
	or	ax,ax
	jne short	@@1
	jmp	@16@394
@@1:
   ;	
   ;	        var_2 = a->map_pos + tbl_mul_tw[a->field_1C];
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+24]
	les	bx,dword ptr [bp+6]
	mov	bx,word ptr es:[bx+28]
	shl	bx,1
	add	ax,word ptr DGROUP:_tbl_mul_tw[bx]
	mov	word ptr [bp-2],ax
   ;	
   ;	        var_4 = var_2 - the_map->map_width;
   ;	
	les	bx,dword ptr DGROUP:_the_map
	mov	ax,word ptr [bp-2]
	sub	ax,word ptr es:[bx+142]
	mov	word ptr [bp-4],ax
   ;	
   ;	        if (a->x_speed > 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+20],0
	jle	short @16@142
   ;	
   ;	            var_4 += a->field_1A;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+26]
	add	word ptr [bp-4],ax
   ;	
   ;	            var_2 += a->field_1A;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+26]
	add	word ptr [bp-2],ax
@16@142:
   ;	
   ;	        }
   ;	        if (the_map->tile_attr[var_2].attr > 0x100 ||
   ;	
   ;	
   ;	            the_map->tile_attr[var_4].attr < 0x100) {
   ;	
	les	bx,dword ptr DGROUP:_the_map
	les	bx,dword ptr es:[bx+926]
	mov	ax,word ptr [bp-2]
	shl	ax,2
	add	bx,ax
	cmp	word ptr es:[bx],256
	ja	short @16@198
	les	bx,dword ptr DGROUP:_the_map
	les	bx,dword ptr es:[bx+926]
	mov	ax,word ptr [bp-4]
	shl	ax,2
	add	bx,ax
	cmp	word ptr es:[bx],256
	jae	short @16@226
@16@198:
   ;	
   ;	            a->door_open = 1;
   ;	
	les	bx,dword ptr [bp+6]
	or	byte ptr es:[bx+82],64
   ;	
   ;	        } else {
   ;	
	jmp	short @16@394
@16@226:
   ;	
   ;	            var_8 = a->x;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx]
	mov	word ptr [bp-8],ax
   ;	
   ;	            a->x = *x_out + a->x_speed;
   ;	
	les	bx,dword ptr [bp+6]
	push	es
	les	si,dword ptr [bp+10]
	mov	ax,word ptr es:[si]
	pop	es
	add	ax,word ptr es:[bx+20]
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx],ax
   ;	
   ;	            for (var_6 = 0; var_6 < barrier_count; var_6++) {
   ;	
	mov	word ptr [bp-6],0
	jmp	short @16@338
@16@254:
   ;	
   ;	                if (touching(a, barrier_list[var_6])) {
   ;	
	mov	bx,word ptr [bp-6]
	shl	bx,2
	push	word ptr DGROUP:_barrier_list[bx+2]
	push	word ptr DGROUP:_barrier_list[bx]
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @touching$qn7m_actort1
	add	sp,8
	or	al,al
	je	short @16@310
   ;	
   ;	                    a->x = var_8;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp-8]
	mov	word ptr es:[bx],ax
	jmp	short @16@198
@16@310:
	inc	word ptr [bp-6]
@16@338:
	mov	al,byte ptr DGROUP:_barrier_count
	mov	ah,0
	cmp	ax,word ptr [bp-6]
	jg	short @16@254
   ;	
   ;	                    a->door_open = 1;
   ;	                    goto done;
   ;	                }
   ;	            }
   ;	            *x_out = var_8;
   ;	
	les	bx,dword ptr [bp+10]
	mov	ax,word ptr [bp-8]
	jmp	short @16@422
@16@394:
   ;	
   ;	            return;
   ;	        }
   ;	    }
   ;	done:
   ;	    *x_out = a->x;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx]
	les	bx,dword ptr [bp+10]
@16@422:
	mov	word ptr es:[bx],ax
@16@450:
   ;	
   ;	}
   ;	
	pop	si
	leave	
	ret	
@mv_pace$qn7m_actornit2	endp
   ;	
   ;	void far do_ego(m_actor far *a)
   ;	
	assume	cs:CREATURE_TEXT
@do_ego$qn7m_actor	proc	far
	enter	4,0
   ;	
   ;	{
   ;	    int var_2, var_4;
   ;	    if (a->state == 2 || a->state == 6)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+61],2
	jne short	@@2
	jmp	@17@702
@@2:
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+61],6
	jne short	@@3
	jmp	@17@702
@@3:
   ;	
   ;	        return;
   ;	    if (a->flag_3) {                        /* bit3 — took a hit */
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,3
	and	ax,1
	or	ax,ax
	je	short @17@254
   ;	
   ;	        update_shld_guage(-a->field_28, 0x68, 0xB3);
   ;	
	push	179
	push	104
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+40]
	neg	ax
	push	ax
	call	far ptr @update_shld_guage$qiii
	add	sp,6
   ;	
   ;	        a->field_36 = 0x20;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+54],32
   ;	
   ;	        a->flag_3 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	and	byte ptr es:[bx+82],247
   ;	
   ;	        a->field_28 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+40],0
   ;	
   ;	        if (jason_present && !jason_on)
   ;	
	cmp	byte ptr DGROUP:_jason_present,0
	je	short @17@198
	mov	al,byte ptr DGROUP:_jason_on
	mov	ah,0
	or	ax,ax
	jne	short @17@198
   ;	
   ;	            jason->flag_7 = 1;
   ;	
	les	bx,dword ptr DGROUP:_jason
	or	byte ptr es:[bx+82],128
@17@198:
   ;	
   ;	        if (a->field_1E != 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+30],0
	je	short @17@254
   ;	
   ;	            a->x_speed += a->field_1E;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+30]
	les	bx,dword ptr [bp+6]
	add	word ptr es:[bx+20],ax
   ;	
   ;	            a->field_1E = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+30],0
@17@254:
   ;	
   ;	        }
   ;	    }
   ;	    if (jason_on == 1)
   ;	
	cmp	byte ptr DGROUP:_jason_on,1
	jne short	@@4
	jmp	@17@702
@@4:
   ;	
   ;	        return;
   ;	    if (a->state == 1 && --a->counter_24 == 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+61],1
	jne	short @17@450
	les	bx,dword ptr [bp+6]
	dec	word ptr es:[bx+34]
	jne	short @17@450
   ;	
   ;	        a->new_loop(a->direction == 1 ? (uchar *)"subl.l" : (uchar *)"subr.l");
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+52],1
	jne	short @17@394
	mov	dx,ds
	mov	ax,offset DGROUP:s@
	jmp	short @17@422
@17@394:
	mov	dx,ds
	mov	ax,offset DGROUP:s@+7
@17@422:
	push	dx
	push	ax
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@new_loop$qnuc
	add	sp,8
   ;	
   ;	        a->state = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+61],0
@17@450:
   ;	
   ;	    }
   ;	    if (a->cycle_speed == 0 && random(2) == 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+58],0
	jne	short @17@618
	push	2
	call	far ptr @random$qi
	pop	cx
	or	ax,ax
	jne	short @17@618
   ;	
   ;	        var_2 = a->x;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx]
	mov	word ptr [bp-2],ax
   ;	
   ;	        var_4 = a->center_y + random(0x0A);
   ;	
	push	10
	call	far ptr @random$qi
	pop	cx
	les	bx,dword ptr [bp+6]
	mov	dx,word ptr es:[bx+10]
	add	dx,ax
	mov	word ptr [bp-4],dx
   ;	
   ;	        if (a->direction == 0)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+52],0
	jne	short @17@562
   ;	
   ;	            add_bubble(var_2, var_4, -6);
   ;	
	push	-6
	push	word ptr [bp-4]
	push	word ptr [bp-2]
	jmp	short @17@590
@17@562:
   ;	
   ;	        else
   ;	            add_bubble(var_2 + a->width, var_4, 6);
   ;	
	push	6
	push	word ptr [bp-4]
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp-2]
	add	ax,word ptr es:[bx+16]
	push	ax
@17@590:
	call	far ptr @add_bubble$qiii
	add	sp,6
@17@618:
   ;	
   ;	    }
   ;	    if (a->on_tile(0x100) == 3) {
   ;	
	push	256
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@on_tile$qi
	add	sp,6
	cmp	al,3
	jne	short @17@702
   ;	
   ;	        update_air_guage(5, 0x68, 0xA7);
   ;	
	push	167
	push	104
	push	5
	call	far ptr @update_air_guage$qiii
	add	sp,6
   ;	
   ;	        if (a->y_speed < 0)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+22],0
	jge	short @17@702
   ;	
   ;	            a->y_speed = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+22],0
@17@702:
   ;	
   ;	    }
   ;	}
   ;	
	leave	
	ret	
@do_ego$qn7m_actor	endp
   ;	
   ;	void far do_block(m_actor far *a)
   ;	
	assume	cs:CREATURE_TEXT
@do_block$qn7m_actor	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    check_for_hit(a, 3);
   ;	
	push	3
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @check_for_hit$qn7m_actoruc
	add	sp,6
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@do_block$qn7m_actor	endp
   ;	
   ;	void far do_score(m_actor far *a)
   ;	
	assume	cs:CREATURE_TEXT
@do_score$qn7m_actor	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (a->counter_24++ == 0x0F)
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+34]
	inc	word ptr es:[bx+34]
	cmp	ax,15
	jne	short @19@86
   ;	
   ;	        a->flag_0 = 1;
   ;	
	les	bx,dword ptr [bp+6]
	or	byte ptr es:[bx+82],1
@19@86:
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@do_score$qn7m_actor	endp
   ;	
   ;	void far do_chest(m_actor far *a)
   ;	
	assume	cs:CREATURE_TEXT
@do_chest$qn7m_actor	proc	far
	enter	8,0
   ;	
   ;	{
   ;	    int var_2, var_4, var_6, var_8;
   ;	    if (!a->in_window)
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,1
	and	ax,1
	or	ax,ax
	jne short	@@5
	jmp	@20@702
@@5:
   ;	
   ;	        return;
   ;	    if (a->flag_3) {                            /* bit3 — got hit */
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,3
	and	ax,1
	or	ax,ax
	je	short @20@198
   ;	
   ;	        if (!a->door_open && a->field_28 >= 4) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,6
	and	ax,1
	or	ax,ax
	jne	short @20@170
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+40],4
	jl	short @20@170
   ;	
   ;	            a->door_open = 1;
   ;	
	les	bx,dword ptr [bp+6]
	or	byte ptr es:[bx+82],64
   ;	
   ;	            a->set_cycle(3, 4);                 /* open animation */
   ;	
	push	4
	push	3
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
@20@170:
   ;	
   ;	        }
   ;	        a->flag_3 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	and	byte ptr es:[bx+82],247
   ;	
   ;	        a->field_36 = 0x0F;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+54],15
@20@198:
   ;	
   ;	    }
   ;	    if (a->door_open) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,6
	and	ax,1
	or	ax,ax
	jne short	@@6
	jmp	@20@702
@@6:
   ;	
   ;	        if (a->counter_24++ == 0x0A) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+34]
	inc	word ptr es:[bx+34]
	cmp	ax,10
	jne	short @20@338
   ;	
   ;	            a->flag_0 = 1;
   ;	
	les	bx,dword ptr [bp+6]
	or	byte ptr es:[bx+82],1
   ;	
   ;	            return;
   ;	
	jmp	@20@702
   ;	
   ;	        }
   ;	    } else
   ;	
	jmp	short @20@338
   ;	
   ;	        return;
   ;	
	jmp	@20@702
@20@338:
   ;	
   ;	    var_2 = a->x + random(a->width);
   ;	
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+16]
	call	far ptr @random$qi
	pop	cx
	les	bx,dword ptr [bp+6]
	mov	dx,word ptr es:[bx]
	add	dx,ax
	mov	word ptr [bp-2],dx
   ;	
   ;	    var_4 = a->y - random(5);
   ;	
	push	5
	call	far ptr @random$qi
	pop	cx
	les	bx,dword ptr [bp+6]
	mov	dx,word ptr es:[bx+2]
	sub	dx,ax
	mov	word ptr [bp-4],dx
   ;	
   ;	    var_6 = random(0x0C);
   ;	
	push	12
	call	far ptr @random$qi
	pop	cx
	mov	word ptr [bp-6],ax
   ;	
   ;	    var_8 = random(8) + 6;
   ;	
	push	8
	call	far ptr @random$qi
	pop	cx
	add	ax,6
	mov	word ptr [bp-8],ax
   ;	
   ;	    if (random(0x0F) == 0) {
   ;	
	push	15
	call	far ptr @random$qi
	pop	cx
	or	ax,ax
	jne	short @20@394
   ;	
   ;	        act = the_cast->add((uchar *)"gem.l", 0, (void far *)do_coin);
   ;	
	push	seg @do_coin$qn7m_actor
	push	offset @do_coin$qn7m_actor
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+14
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_act+2,dx
	mov	word ptr DGROUP:_act,ax
   ;	
   ;	        act->flag_7 = 1;
   ;	
	les	bx,dword ptr DGROUP:_act
	or	byte ptr es:[bx+82],128
   ;	
   ;	    } else
   ;	
	jmp	short @20@422
@20@394:
   ;	
   ;	        act = the_cast->add((uchar *)"coin.l", 0, (void far *)do_coin);
   ;	
	push	seg @do_coin$qn7m_actor
	push	offset @do_coin$qn7m_actor
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+20
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_act+2,dx
	mov	word ptr DGROUP:_act,ax
@20@422:
   ;	
   ;	    act->y_speed = -var_8;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	ax,word ptr [bp-8]
	neg	ax
	mov	word ptr es:[bx+22],ax
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
   ;	    act->set_cycle(1, 1);
   ;	
	push	1
	push	1
	push	word ptr DGROUP:_act+2
	push	word ptr DGROUP:_act
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
   ;	
   ;	    switch (random(3)) {
   ;	
	push	3
	call	far ptr @random$qi
	pop	cx
	or	ax,ax
	je	short @20@590
	cmp	ax,1
	je	short @20@618
	cmp	ax,2
	je	short @20@646
	jmp	short @20@702
@20@590:
   ;	
   ;	        case 0: act->x_speed = -var_6; break;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	ax,word ptr [bp-6]
	neg	ax
	jmp	short @20@674
@20@618:
   ;	
   ;	        case 1: act->x_speed = 0;     break;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	word ptr es:[bx+20],0
	jmp	short @20@702
@20@646:
   ;	
   ;	        case 2: act->x_speed =  var_6; break;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	ax,word ptr [bp-6]
@20@674:
	mov	word ptr es:[bx+20],ax
@20@702:
   ;	
   ;	    }
   ;	}
   ;	
	leave	
	ret	
@do_chest$qn7m_actor	endp
   ;	
   ;	void far do_coin(m_actor far *a)
   ;	
	assume	cs:CREATURE_TEXT
@do_coin$qn7m_actor	proc	far
	enter	2,0
	push	si
   ;	
   ;	{
   ;	    int var_2;
   ;	    if (the_map->tile_attr[a->map_pos - 1].attr < 0x100 ||
   ;	
   ;	
   ;	        the_map->tile_attr[a->map_pos + 2].attr < 0x100) {
   ;	
	les	bx,dword ptr DGROUP:_the_map
	les	bx,dword ptr es:[bx+926]
	push	es
	les	si,dword ptr [bp+6]
	mov	ax,word ptr es:[si+24]
	dec	ax
	shl	ax,2
	add	bx,ax
	pop	es
	cmp	word ptr es:[bx],256
	jb	short @21@86
	les	bx,dword ptr DGROUP:_the_map
	les	bx,dword ptr es:[bx+926]
	push	es
	les	si,dword ptr [bp+6]
	mov	ax,word ptr es:[si+24]
	add	ax,2
	shl	ax,2
	add	bx,ax
	pop	es
	cmp	word ptr es:[bx],256
	jae	short @21@198
@21@86:
   ;	
   ;	        if (a->x_speed != 0)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+20],0
	je	short @21@142
   ;	
   ;	            a->x_speed = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+20],0
	jmp	short @21@198
@21@142:
   ;	
   ;	        else if (a->y_speed != 1)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+22],1
	je	short @21@198
   ;	
   ;	            a->y_speed = 1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+22],1
@21@198:
   ;	
   ;	    }
   ;	    var_2 = a->map_pos + word_2BA88[a->flag_7 ? 0 : 1];
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+24]
	push	ax
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,7
	and	ax,1
	or	ax,ax
	je	short @21@254
	xor	ax,ax
	jmp	short @21@282
@21@254:
	mov	ax,1
@21@282:
	shl	ax,1
	mov	bx,ax
	pop	ax
	add	ax,word ptr DGROUP:_word_2BA88[bx]
	mov	word ptr [bp-2],ax
   ;	
   ;	    if (the_map->tile_attr[var_2].attr < 0x100)
   ;	
	les	bx,dword ptr DGROUP:_the_map
	les	bx,dword ptr es:[bx+926]
	mov	ax,word ptr [bp-2]
	shl	ax,2
	add	bx,ax
	cmp	word ptr es:[bx],256
	jae	short @21@338
   ;	
   ;	        a->y_speed = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+22],0
@21@338:
   ;	
   ;	    if (!a->in_window)
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,1
	and	ax,1
	or	ax,ax
	jne short	@@7
	jmp	@21@954
@@7:
   ;	
   ;	        return;
   ;	    if (a->y_speed == 0 && !a->door_open) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+22],0
	jne	short @21@450
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,6
	and	ax,1
	or	ax,ax
	jne	short @21@450
   ;	
   ;	        a->door_open = 1;
   ;	
	les	bx,dword ptr [bp+6]
	or	byte ptr es:[bx+82],64
   ;	
   ;	        a->y_speed = 1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+22],1
@21@450:
   ;	
   ;	    }
   ;	    if (a->y_speed != 0 && a->y_speed != 1)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+22],0
	je	short @21@534
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+22],1
	je	short @21@534
   ;	
   ;	        a->y_speed++;
   ;	
	les	bx,dword ptr [bp+6]
	inc	word ptr es:[bx+22]
@21@534:
   ;	
   ;	    if (a->x_speed != 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+20],0
	je	short @21@646
   ;	
   ;	        if (a->x_speed > 0)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+20],0
	jle	short @21@618
   ;	
   ;	            a->x_speed--;
   ;	
	les	bx,dword ptr [bp+6]
	dec	word ptr es:[bx+20]
	jmp	short @21@646
@21@618:
   ;	
   ;	        else
   ;	            a->x_speed++;
   ;	
	les	bx,dword ptr [bp+6]
	inc	word ptr es:[bx+20]
@21@646:
   ;	
   ;	    }
   ;	    if (touching(a, cur_sub)) {
   ;	
	push	word ptr DGROUP:_cur_sub+2
	push	word ptr DGROUP:_cur_sub
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @touching$qn7m_actort1
	add	sp,8
	or	al,al
	jne short	@@8
	jmp	@21@954
@@8:
   ;	
   ;	        a->flag_0 = 1;
   ;	
	les	bx,dword ptr [bp+6]
	or	byte ptr es:[bx+82],1
   ;	
   ;	        the_game->play_sound((uchar *)"pup", 9);
   ;	
	push	9
	push	ds
	push	offset DGROUP:s@+27
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_sound$qnucuc
	add	sp,10
   ;	
   ;	        if (a->flag_7)                          /* gem — worth far more */
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,7
	and	ax,1
	or	ax,ax
	je	short @21@814
   ;	
   ;	            var_2 = 0x7D0 << (a->y_speed != 0);
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+22],0
	je	short @21@758
	mov	ax,1
	jmp	short @21@786
@21@758:
	xor	ax,ax
@21@786:
	mov	dx,2000
	mov	cl,al
	shl	dx,cl
	mov	word ptr [bp-2],dx
	jmp	short @21@926
@21@814:
   ;	
   ;	        else
   ;	            var_2 = a->y_speed != 0 ? 0x1F4 : 0x64;
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+22],0
	je	short @21@870
	mov	ax,500
	jmp	short @21@898
@21@870:
	mov	ax,100
@21@898:
	mov	word ptr [bp-2],ax
@21@926:
   ;	
   ;	        score_at(a->center_x, a->center_y, var_2);
   ;	
	push	word ptr [bp-2]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+10]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+8]
	call	far ptr @score_at$qiii
	add	sp,6
   ;	
   ;	        goodies_found++;
   ;	
	inc	byte ptr DGROUP:_goodies_found
@21@954:
   ;	
   ;	    }
   ;	}
   ;	
	pop	si
	leave	
	ret	
@do_coin$qn7m_actor	endp
   ;	
   ;	void far do_fish(m_actor far *a)
   ;	
	assume	cs:CREATURE_TEXT
@do_fish$qn7m_actor	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (a->tile_collision(0, 0, 0) == 0) {
   ;	
	push	0
	push	0
	push	0
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@tile_collision$qiii
	add	sp,10
	or	al,al
	jne	short @22@142
   ;	
   ;	        if (a->counter_24++ == a->counter_26)
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+34]
	inc	word ptr es:[bx+34]
	les	bx,dword ptr [bp+6]
	cmp	ax,word ptr es:[bx+36]
	jne	short @22@450
   ;	
   ;	            a->counter_24 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+34],0
	jmp	short @22@142
   ;	
   ;	        else
   ;	            return;
   ;	
	jmp	short @22@450
@22@142:
   ;	
   ;	    }
   ;	    if (a->direction == 1)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+52],1
	jne	short @22@310
   ;	
   ;	        a->new_loop(a->health == 1 ? (uchar *)"fish1r.l" : (uchar *)"fish2r.l");
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+38],1
	jne	short @22@254
	mov	dx,ds
	mov	ax,offset DGROUP:s@+31
@22@226:
	jmp	short @22@394
@22@254:
	mov	dx,ds
	mov	ax,offset DGROUP:s@+40
	jmp	short @22@394
	jmp	short @22@394
@22@310:
   ;	
   ;	    else
   ;	        a->new_loop(a->health == 1 ? (uchar *)"fish1l.l" : (uchar *)"fish2l.l");
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+38],1
	jne	short @22@366
	mov	dx,ds
	mov	ax,offset DGROUP:s@+49
	jmp	short @22@226
@22@366:
	mov	dx,ds
	mov	ax,offset DGROUP:s@+58
@22@394:
	push	dx
	push	ax
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@new_loop$qnuc
	add	sp,8
   ;	
   ;	    a->direction ^= 1;
   ;	
	les	bx,dword ptr [bp+6]
	xor	byte ptr es:[bx+52],1
   ;	
   ;	    a->x_speed = -a->x_speed;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+20]
	neg	ax
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+20],ax
@22@450:
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@do_fish$qn7m_actor	endp
   ;	
   ;	void far do_switch(m_actor far *a)
   ;	
	assume	cs:CREATURE_TEXT
@do_switch$qn7m_actor	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (a->inactive)                                /* bit5 — already thrown */
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,5
	and	ax,1
	or	ax,ax
	jne	short @23@142
   ;	
   ;	        return;
   ;	    if (!a->flag_3)                                 /* bit3 — not hit yet */
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,3
	and	ax,1
	or	ax,ax
	je	short @23@142
   ;	
   ;	        return;
   ;	    a->current_loop = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+60],0
   ;	
   ;	    a->target->door_open = 1;
   ;	
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+44]
	or	byte ptr es:[bx+82],64
   ;	
   ;	    a->flag_3 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	and	byte ptr es:[bx+82],247
   ;	
   ;	    a->inactive = 1;
   ;	
	les	bx,dword ptr [bp+6]
	or	byte ptr es:[bx+82],32
   ;	
   ;	    if (a->linked)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	dword ptr es:[bx+48],large 0
	je	short @23@142
   ;	
   ;	        a->linked->door_open = 1;
   ;	
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+48]
	or	byte ptr es:[bx+82],64
@23@142:
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@do_switch$qn7m_actor	endp
   ;	
   ;	void far do_door(m_actor far *a)
   ;	
	assume	cs:CREATURE_TEXT
@do_door$qn7m_actor	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (a->door_open == 1 && a->frame == 0) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,6
	and	ax,1
	cmp	ax,1
	jne	short @24@114
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+56],0
	jne	short @24@114
   ;	
   ;	        the_game->play_sound((uchar *)"door", 6);
   ;	
	push	6
	push	ds
	push	offset DGROUP:s@+67
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_sound$qnucuc
	add	sp,10
   ;	
   ;	        a->set_cycle(4, 2);
   ;	
	push	2
	push	4
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
@24@114:
   ;	
   ;	    }
   ;	}
   ;	
	pop	bp
	ret	
@do_door$qn7m_actor	endp
   ;	
   ;	void far do_duct_lr(m_actor far *a)
   ;	
	assume	cs:CREATURE_TEXT
@do_duct_lr$qn7m_actor	proc	far
	enter	2,0
	push	si
   ;	
   ;	{
   ;	    int var_2;
   ;	    if (!a->in_window)
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,1
	and	ax,1
	or	ax,ax
	jne short	@@9
	jmp	@25@478
@@9:
   ;	
   ;	        return;
   ;	    if (cur_sub->state == 6)
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	cmp	byte ptr es:[bx+61],6
	jne short	@@10
	jmp	@25@478
@@10:
   ;	
   ;	        return;
   ;	    if (cur_sub->old_y > a->y + 0x2B || cur_sub->y < a->y)
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	push	es
	les	si,dword ptr [bp+6]
	mov	ax,word ptr es:[si+2]
	add	ax,43
	pop	es
	cmp	word ptr es:[bx+6],ax
	jle short	@@11
	jmp	@25@478
@@11:
	les	bx,dword ptr DGROUP:_cur_sub
	mov	ax,word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	cmp	ax,word ptr es:[bx+2]
	jge short	@@12
	jmp	@25@478
@@12:
   ;	
   ;	        return;
   ;	    diff_x = abs(a->center_x - cur_sub->center_x);
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+8]
	les	bx,dword ptr DGROUP:_cur_sub
	sub	ax,word ptr es:[bx+8]
	push	ax
	call	far ptr @abs$qi
	pop	cx
	mov	word ptr DGROUP:_diff_x,ax
   ;	
   ;	    if (diff_x >= 0x46)
   ;	
	cmp	word ptr DGROUP:_diff_x,70
	jge	short @25@478
   ;	
   ;	        return;
   ;	    if (diff_x > 0x32)
   ;	
	cmp	word ptr DGROUP:_diff_x,50
	jle	short @25@226
   ;	
   ;	        var_2 = 2;
   ;	
	mov	word ptr [bp-2],2
	jmp	short @25@310
@25@226:
   ;	
   ;	    else if (diff_x > 0x14)
   ;	
	cmp	word ptr DGROUP:_diff_x,20
	jle	short @25@282
   ;	
   ;	        var_2 = 3;
   ;	
	mov	word ptr [bp-2],3
	jmp	short @25@310
@25@282:
   ;	
   ;	    else
   ;	        var_2 = 5;
   ;	
	mov	word ptr [bp-2],5
@25@310:
   ;	
   ;	    if (a->direction == 1) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+52],1
	jne	short @25@422
   ;	
   ;	        cur_sub->x_speed -= var_2;
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	mov	ax,word ptr [bp-2]
	sub	word ptr es:[bx+20],ax
   ;	
   ;	        if (cur_sub->x_speed < -8)
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	cmp	word ptr es:[bx+20],-8
	jge	short @25@478
   ;	
   ;	            cur_sub->x_speed = -8;
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	mov	word ptr es:[bx+20],-8
	jmp	short @25@478
   ;	
   ;	    } else {
   ;	
	jmp	short @25@478
@25@422:
   ;	
   ;	        cur_sub->x_speed += var_2;
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	mov	ax,word ptr [bp-2]
	add	word ptr es:[bx+20],ax
   ;	
   ;	        if (cur_sub->x_speed > 8)
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	cmp	word ptr es:[bx+20],8
	jle	short @25@478
   ;	
   ;	            cur_sub->x_speed = 8;
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	mov	word ptr es:[bx+20],8
@25@478:
   ;	
   ;	    }
   ;	}
   ;	
	pop	si
	leave	
	ret	
@do_duct_lr$qn7m_actor	endp
   ;	
   ;	void far do_duct_ud(m_actor far *a)
   ;	
	assume	cs:CREATURE_TEXT
@do_duct_ud$qn7m_actor	proc	far
	enter	2,0
	push	si
   ;	
   ;	{
   ;	    int var_2;
   ;	    if (!a->in_window)
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,1
	and	ax,1
	or	ax,ax
	jne short	@@13
	jmp	@26@394
@@13:
   ;	
   ;	        return;
   ;	    if (cur_sub->state == 6)
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	cmp	byte ptr es:[bx+61],6
	jne short	@@14
	jmp	@26@394
@@14:
   ;	
   ;	        return;
   ;	    diff_y = abs(a->center_y - cur_sub->center_y);
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+10]
	les	bx,dword ptr DGROUP:_cur_sub
	sub	ax,word ptr es:[bx+10]
	push	ax
	call	far ptr @abs$qi
	pop	cx
	mov	word ptr DGROUP:_diff_y,ax
   ;	
   ;	    if (cur_sub->center_x < a->x || cur_sub->center_x > a->x + 0x38)
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	mov	ax,word ptr es:[bx+8]
	les	bx,dword ptr [bp+6]
	cmp	ax,word ptr es:[bx]
	jge short	@@15
	jmp	@26@394
@@15:
	les	bx,dword ptr DGROUP:_cur_sub
	push	es
	les	si,dword ptr [bp+6]
	mov	ax,word ptr es:[si]
	add	ax,56
	pop	es
	cmp	word ptr es:[bx+8],ax
	jg	short @26@394
   ;	
   ;	        return;
   ;	    if (diff_y >= 0x2D)
   ;	
	cmp	word ptr DGROUP:_diff_y,45
	jge	short @26@394
   ;	
   ;	        return;
   ;	    if (diff_y > 0x0F && abs(cur_sub->x_speed) >= 4)
   ;	
	cmp	word ptr DGROUP:_diff_y,15
	jle	short @26@226
	les	bx,dword ptr DGROUP:_cur_sub
	push	word ptr es:[bx+20]
	call	far ptr @abs$qi
	pop	cx
	cmp	ax,4
	jge	short @26@394
@26@226:
   ;	
   ;	        return;
   ;	    var_2 = 3;
   ;	
	mov	word ptr [bp-2],3
   ;	
   ;	    if (a->direction == 2) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+52],2
	jne	short @26@338
   ;	
   ;	        cur_sub->y_speed -= var_2;
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	mov	ax,word ptr [bp-2]
	sub	word ptr es:[bx+22],ax
   ;	
   ;	        if (cur_sub->y_speed < -6)
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	cmp	word ptr es:[bx+22],-6
	jge	short @26@394
   ;	
   ;	            cur_sub->y_speed = -6;
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	mov	word ptr es:[bx+22],-6
	jmp	short @26@394
   ;	
   ;	    } else {
   ;	
	jmp	short @26@394
@26@338:
   ;	
   ;	        cur_sub->y_speed += var_2;
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	mov	ax,word ptr [bp-2]
	add	word ptr es:[bx+22],ax
   ;	
   ;	        if (cur_sub->y_speed > 6)
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	cmp	word ptr es:[bx+22],6
	jle	short @26@394
   ;	
   ;	            cur_sub->y_speed = 6;
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	mov	word ptr es:[bx+22],6
@26@394:
   ;	
   ;	    }
   ;	}
   ;	
	pop	si
	leave	
	ret	
@do_duct_ud$qn7m_actor	endp
   ;	
   ;	void far do_barrel(m_actor far *a)
   ;	
	assume	cs:CREATURE_TEXT
@do_barrel$qn7m_actor	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (check_for_hit(a, 2) == 2) {
   ;	
	push	2
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @check_for_hit$qn7m_actoruc
	add	sp,6
	cmp	al,2
	jne	short @27@86
   ;	
   ;	        add_explosion(a->x, a->y, 2, (uchar *)0);
   ;	
	push	0
	push	0
	push	2
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx]
	call	far ptr @add_explosion$qiiucnuc
	add	sp,10
   ;	
   ;	        add_map_item(a->map_pos, a->counter_24);
   ;	
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+34]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+24]
	call	far ptr @add_map_item$quiui
	add	sp,4
@27@86:
   ;	
   ;	    }
   ;	}
   ;	
	pop	bp
	ret	
@do_barrel$qn7m_actor	endp
   ;	
   ;	void far do_pup(m_actor far *a)
   ;	
	assume	cs:CREATURE_TEXT
@do_pup$qn7m_actor	proc	far
	enter	2,0
   ;	
   ;	{
   ;	    int var_2;
   ;	    if (a->in_window == 1 && a->inactive == 1) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,1
	and	ax,1
	cmp	ax,1
	jne	short @28@114
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,5
	and	ax,1
	cmp	ax,1
	jne	short @28@114
   ;	
   ;	        a->inactive = 0;
   ;	
	les	bx,dword ptr [bp+6]
	and	byte ptr es:[bx+82],223
   ;	
   ;	        a->y_speed = -1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+22],-1
@28@114:
   ;	
   ;	    }
   ;	    if (a->inactive == 1)
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,5
	and	ax,1
	cmp	ax,1
	jne short	@@16
	jmp	@28@982
@@16:
   ;	
   ;	        return;
   ;	    if (a->y_speed != 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+22],0
	je	short @28@282
   ;	
   ;	        if (a->on_tile(0x100) != 0)
   ;	
	push	256
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@on_tile$qi
	add	sp,6
	or	al,al
	je	short @28@226
	jmp	short @28@254
@28@226:
   ;	
   ;	            a->y_speed = 0;
   ;	        else if (a->tile_collision(0, 0, 0) != 0)
   ;	
	push	0
	push	0
	push	0
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@tile_collision$qiii
	add	sp,10
	or	al,al
	je	short @28@282
@28@254:
   ;	
   ;	            a->y_speed = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+22],0
@28@282:
   ;	
   ;	    }
   ;	    if (!touching(a, ego))
   ;	
	push	word ptr DGROUP:_ego+2
	push	word ptr DGROUP:_ego
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @touching$qn7m_actort1
	add	sp,8
	mov	ah,0
	or	ax,ax
	jne short	@@17
	jmp	@28@982
@@17:
   ;	
   ;	        return;
   ;	    switch (a->counter_24 - 1) {                    /* pup kind 1..9 */
   ;	
	les	bx,dword ptr [bp+6]
	mov	bx,word ptr es:[bx+34]
	dec	bx
	cmp	bx,8
	jbe short	@@18
	jmp	@28@786
@@18:
	shl	bx,1
	jmp	word ptr cs:@28@C786[bx]
@28@394:
   ;	
   ;	        case 0: update_air_guage(0x50, 0x68, 0xA7); break;
   ;	
	push	167
	push	104
	push	80
	call	far ptr @update_air_guage$qiii
	add	sp,6
	jmp	@28@786
@28@422:
   ;	
   ;	        case 1: if (shot_size < 3) shot_size++; post_message(3); break;
   ;	
	cmp	byte ptr DGROUP:_shot_size,3
	jae	short @28@478
	inc	byte ptr DGROUP:_shot_size
@28@478:
	push	3
	call	far ptr @post_message$quc
	pop	cx
	jmp	short @28@786
@28@506:
   ;	
   ;	        case 2: update_shld_guage(0x28, 0x68, 0xB3);
   ;	
	push	179
	push	104
	push	40
	call	far ptr @update_shld_guage$qiii
	add	sp,6
   ;	
   ;	                if (shot_size != 0 && heavy_timer == 0) shot_size--; break;
   ;	
	cmp	byte ptr DGROUP:_shot_size,0
	je	short @28@786
	cmp	word ptr DGROUP:_heavy_timer,0
	jne	short @28@786
	dec	byte ptr DGROUP:_shot_size
	jmp	short @28@786
	jmp	short @28@786
@28@618:
   ;	
   ;	        case 3: top_fire = 1; break;
   ;	
	mov	byte ptr DGROUP:_top_fire,1
	jmp	short @28@786
@28@646:
   ;	
   ;	        case 4: men++; auto_fire = 0; jason_fire = 0;
   ;	
	inc	byte ptr DGROUP:_men
	mov	byte ptr DGROUP:_auto_fire,0
	mov	byte ptr DGROUP:_jason_fire,0
   ;	
   ;	                the_game->field_08 = 1; update_men(); break;
   ;	
	les	bx,dword ptr DGROUP:_the_game
	mov	byte ptr es:[bx+8],1
	call	far ptr @update_men$qv
	jmp	short @28@786
@28@674:
   ;	
   ;	        case 5: got_key++; break;
   ;	
	inc	byte ptr DGROUP:_got_key
	jmp	short @28@786
@28@702:
   ;	
   ;	        case 6: post_message(4); auto_fire = 1; break;
   ;	
	push	4
	call	far ptr @post_message$quc
	pop	cx
	mov	byte ptr DGROUP:_auto_fire,1
	jmp	short @28@786
@28@730:
   ;	
   ;	        case 7: add_jason(); break;
   ;	
	call	far ptr @add_jason$qv
	jmp	short @28@786
@28@758:
   ;	
   ;	        case 8: jason_fire = 1; break;
   ;	
	mov	byte ptr DGROUP:_jason_fire,1
@28@786:
   ;	
   ;	    }
   ;	    if (a->counter_24 == 6) {                       /* the key */
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+34],6
	jne	short @28@842
   ;	
   ;	        var_2 = 0x3E8;
   ;	
	mov	word ptr [bp-2],1000
   ;	
   ;	        the_game->play_sound((uchar *)"pup2", 0x0E);
   ;	
	push	14
	push	ds
	push	offset DGROUP:s@+72
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_sound$qnucuc
	add	sp,10
   ;	
   ;	        update_key_guage();
   ;	
	call	far ptr @update_key_guage$qv
   ;	
   ;	        post_message(1);
   ;	
	push	1
	call	far ptr @post_message$quc
	pop	cx
   ;	
   ;	    } else {
   ;	
	jmp	short @28@870
@28@842:
   ;	
   ;	        var_2 = 0x1F4;
   ;	
	mov	word ptr [bp-2],500
@28@870:
   ;	
   ;	    }
   ;	    if (a->y_speed != 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+22],0
	je	short @28@926
   ;	
   ;	        the_game->play_sound((uchar *)"pup2", 0x0A);
   ;	
	push	10
	push	ds
	push	offset DGROUP:s@+77
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_sound$qnucuc
	add	sp,10
   ;	
   ;	        var_2 *= 2;                                 /* caught mid-air — double */
   ;	
	mov	dx,2
	mov	ax,word ptr [bp-2]
	imul	dx
	mov	word ptr [bp-2],ax
   ;	
   ;	    } else {
   ;	
	jmp	short @28@954
@28@926:
   ;	
   ;	        the_game->play_sound((uchar *)"pup", 9);
   ;	
	push	9
	push	ds
	push	offset DGROUP:s@+82
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_sound$qnucuc
	add	sp,10
@28@954:
   ;	
   ;	    }
   ;	    score_at(a->center_x, a->center_y, var_2);
   ;	
	push	word ptr [bp-2]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+10]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+8]
	call	far ptr @score_at$qiii
	add	sp,6
   ;	
   ;	    a->flag_0 = 1;
   ;	
	les	bx,dword ptr [bp+6]
	or	byte ptr es:[bx+82],1
   ;	
   ;	    goodies_found++;
   ;	
	inc	byte ptr DGROUP:_goodies_found
@28@982:
   ;	
   ;	}
   ;	
	leave	
	ret	
@do_pup$qn7m_actor	endp
@28@C786	label	word
	dw	@28@394
	dw	@28@422
	dw	@28@506
	dw	@28@618
	dw	@28@646
	dw	@28@674
	dw	@28@702
	dw	@28@730
	dw	@28@758
   ;	
   ;	void far do_exp(m_actor far *a)
   ;	
	assume	cs:CREATURE_TEXT
@do_exp$qn7m_actor	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (!a->in_window)
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,1
	and	ax,1
	or	ax,ax
	jne	short @29@86
   ;	
   ;	        a->flag_0 = 1;
   ;	
	les	bx,dword ptr [bp+6]
	or	byte ptr es:[bx+82],1
@29@86:
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@do_exp$qn7m_actor	endp
   ;	
   ;	void far do_bubble(m_actor far *a)
   ;	
	assume	cs:CREATURE_TEXT
@do_bubble$qn7m_actor	proc	far
	push	bp
	mov	bp,sp
	push	si
   ;	
   ;	{
   ;	    if (a->counter_24++ == 0x14) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+34]
	inc	word ptr es:[bx+34]
	cmp	ax,20
	jne	short @30@86
	jmp	short @30@282
@30@86:
   ;	
   ;	        a->flag_0 = 1;
   ;	        return;
   ;	    }
   ;	    if (a->x_speed != 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+20],0
	je	short @30@198
   ;	
   ;	        if (a->x_speed > 0)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+20],0
	jle	short @30@170
   ;	
   ;	            a->x_speed--;
   ;	
	les	bx,dword ptr [bp+6]
	dec	word ptr es:[bx+20]
	jmp	short @30@198
@30@170:
   ;	
   ;	        else
   ;	            a->x_speed++;
   ;	
	les	bx,dword ptr [bp+6]
	inc	word ptr es:[bx+20]
@30@198:
   ;	
   ;	    }
   ;	    if (!a->in_window) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,1
	and	ax,1
	or	ax,ax
	jne	short @30@254
   ;	
   ;	        a->flag_0 = 1;
   ;	
	jmp	short @30@282
@30@254:
   ;	
   ;	        return;
   ;	    }
   ;	    if (the_map->tile_attr[a->map_pos].attr == 0x100)
   ;	
	les	bx,dword ptr DGROUP:_the_map
	les	bx,dword ptr es:[bx+926]
	push	es
	les	si,dword ptr [bp+6]
	mov	ax,word ptr es:[si+24]
	shl	ax,2
	add	bx,ax
	pop	es
	cmp	word ptr es:[bx],256
	jne	short @30@310
@30@282:
   ;	
   ;	        a->flag_0 = 1;
   ;	
	les	bx,dword ptr [bp+6]
	or	byte ptr es:[bx+82],1
@30@310:
   ;	
   ;	}
   ;	
	pop	si
	pop	bp
	ret	
@do_bubble$qn7m_actor	endp
   ;	
   ;	void far do_probe(m_actor far *a)
   ;	
	assume	cs:CREATURE_TEXT
@do_probe$qn7m_actor	proc	far
	enter	4,0
	push	si
   ;	
   ;	{
   ;	    int var_2, var_4;
   ;	
   ;	    if (a->y_speed < 0 && a->on_tile(0x100))
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+22],0
	jge	short @31@114
	push	256
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@on_tile$qi
	add	sp,6
	or	al,al
	je	short @31@114
   ;	
   ;	        a->y_speed = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+22],0
@31@114:
   ;	
   ;	
   ;	    if (jason_on == 1) {
   ;	
	cmp	byte ptr DGROUP:_jason_on,1
	je short	@@19
	jmp	@31@1178
@@19:
   ;	
   ;	        if (a->state == 4) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+61],4
	jne	short @31@310
   ;	
   ;	            /* spinning drill attack — jitter about until the timer dies */
   ;	            if (--a->counter_24 == 0)
   ;	
	les	bx,dword ptr [bp+6]
	dec	word ptr es:[bx+34]
	jne short	@@20
	jmp	@31@1458
@@20:
   ;	
   ;	                goto turn;
   ;	            a->x_speed = random(5) - 2;
   ;	
	push	5
	call	far ptr @random$qi
	pop	cx
	add	ax,-2
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+20],ax
   ;	
   ;	            a->y_speed = random(3) - 1;
   ;	
	push	3
	call	far ptr @random$qi
	pop	cx
	dec	ax
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+22],ax
   ;	
   ;	            if ((a->x & 2) == 2)
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx]
	and	ax,2
	cmp	ax,2
	je short	@@21
	jmp	@31@1570
@@21:
   ;	
   ;	                add_bubble(a->center_x, a->center_y, 0);
   ;	
	push	0
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+10]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+8]
@31@254:
	call	far ptr @add_bubble$qiii
	add	sp,6
	jmp	@31@1570
   ;	
   ;	            return;
   ;	
	jmp	@31@1570
@31@310:
   ;	
   ;	        }
   ;	        if (a->flag_7 && a->in_window) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,7
	and	ax,1
	or	ax,ax
	jne short	@@22
	jmp	@31@478
@@22:
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,1
	and	ax,1
	or	ax,ax
	jne short	@@23
	jmp	@31@478
@@23:
   ;	
   ;	            if (a->state == 0 && random(7) == 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+61],0
	jne	short @31@450
	push	7
	call	far ptr @random$qi
	pop	cx
	or	ax,ax
	jne	short @31@450
   ;	
   ;	                a->new_loop((uchar *)"probspin.l");
   ;	
	push	ds
	push	offset DGROUP:s@+86
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@new_loop$qnuc
	add	sp,8
   ;	
   ;	                a->set_cycle(1, 1);
   ;	
	push	1
	push	1
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
   ;	
   ;	                a->state = 4;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+61],4
   ;	
   ;	                a->counter_24 = random(0x14) + 0x14;
   ;	
	push	20
	call	far ptr @random$qi
	pop	cx
	add	ax,20
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+34],ax
   ;	
   ;	                the_game->play_sound((uchar *)"drillhi", 0x0B);
   ;	
	push	11
	push	ds
	push	offset DGROUP:s@+97
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_sound$qnucuc
	add	sp,10
   ;	
   ;	                return;
   ;	
	jmp	@31@1570
@31@450:
   ;	
   ;	            }
   ;	            a->flag_7 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	and	byte ptr es:[bx+82],127
@31@478:
   ;	
   ;	        }
   ;	        /* home in on the sub */
   ;	        diff_x = abs(ego->center_x - a->center_x);
   ;	
	les	bx,dword ptr DGROUP:_ego
	mov	ax,word ptr es:[bx+8]
	les	bx,dword ptr [bp+6]
	sub	ax,word ptr es:[bx+8]
	push	ax
	call	far ptr @abs$qi
	pop	cx
	mov	word ptr DGROUP:_diff_x,ax
   ;	
   ;	        diff_y = abs(ego->center_y - a->center_y);
   ;	
	les	bx,dword ptr DGROUP:_ego
	mov	ax,word ptr es:[bx+10]
	les	bx,dword ptr [bp+6]
	sub	ax,word ptr es:[bx+10]
	push	ax
	call	far ptr @abs$qi
	pop	cx
	mov	word ptr DGROUP:_diff_y,ax
   ;	
   ;	        if (diff_y > 0x0A) {
   ;	
	cmp	word ptr DGROUP:_diff_y,10
	jle	short @31@618
   ;	
   ;	            var_4 = 0x0A;
   ;	
	mov	word ptr [bp-4],10
   ;	
   ;	            a->y_speed = (a->center_y < ego->center_y) ? 3 : -3;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+10]
	les	bx,dword ptr DGROUP:_ego
	cmp	ax,word ptr es:[bx+10]
	jge	short @31@562
	mov	ax,3
	jmp	short @31@590
@31@562:
	mov	ax,-3
@31@590:
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+22],ax
   ;	
   ;	        } else {
   ;	
	jmp	short @31@646
@31@618:
   ;	
   ;	            var_4 = 0x19;
   ;	
	mov	word ptr [bp-4],25
   ;	
   ;	            a->y_speed = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+22],0
@31@646:
   ;	
   ;	        }
   ;	        if (diff_x > var_4)
   ;	
	mov	ax,word ptr DGROUP:_diff_x
	cmp	ax,word ptr [bp-4]
	jle	short @31@786
   ;	
   ;	            a->x_speed = (a->center_x < ego->center_x) ? 4 : -4;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+8]
	les	bx,dword ptr DGROUP:_ego
	cmp	ax,word ptr es:[bx+8]
	jge	short @31@730
	mov	ax,4
	jmp	short @31@758
@31@730:
	mov	ax,-4
@31@758:
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+20],ax
	jmp	short @31@814
@31@786:
   ;	
   ;	        else
   ;	            a->x_speed = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+20],0
@31@814:
   ;	
   ;	        /* face the same way it's travelling relative to the sub */
   ;	        if (a->direction != ego->direction) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+52]
	les	bx,dword ptr DGROUP:_ego
	cmp	al,byte ptr es:[bx+52]
	je	short @31@1010
   ;	
   ;	            if ((ego->direction == 0 && a->center_x >= ego->center_x) ||
   ;	
   ;	
   ;	                (ego->direction == 1 && a->center_x <= ego->center_x))
   ;	
	les	bx,dword ptr DGROUP:_ego
	cmp	byte ptr es:[bx+52],0
	jne	short @31@898
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+8]
	les	bx,dword ptr DGROUP:_ego
	cmp	ax,word ptr es:[bx+8]
	jl short	@@24
	jmp	@31@1458
@@24:
@31@898:
	les	bx,dword ptr DGROUP:_ego
	cmp	byte ptr es:[bx+52],1
	je short	@@25
	jmp	@31@1570
@@25:
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+8]
	les	bx,dword ptr DGROUP:_ego
	cmp	ax,word ptr es:[bx+8]
	jle short	@@26
	jmp	@31@1570
@@26:
   ;	
   ;	                goto turn;
   ;	
	jmp	@31@1458
   ;	
   ;	        } else {
   ;	
	jmp	@31@1570
@31@1010:
   ;	
   ;	            if ((ego->direction == 0 && a->center_x <= ego->center_x) ||
   ;	
   ;	
   ;	                (ego->direction == 1 && a->center_x >= ego->center_x))
   ;	
	les	bx,dword ptr DGROUP:_ego
	cmp	byte ptr es:[bx+52],0
	jne	short @31@1066
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+8]
	les	bx,dword ptr DGROUP:_ego
	cmp	ax,word ptr es:[bx+8]
	jg short	@@27
	jmp	@31@1458
@@27:
@31@1066:
	les	bx,dword ptr DGROUP:_ego
	cmp	byte ptr es:[bx+52],1
	je short	@@28
	jmp	@31@1570
@@28:
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+8]
	les	bx,dword ptr DGROUP:_ego
	cmp	ax,word ptr es:[bx+8]
	jge short	@@29
	jmp	@31@1570
@@29:
   ;	
   ;	                goto turn;
   ;	
	jmp	@31@1458
   ;	
   ;	        }
   ;	        return;
   ;	
	jmp	@31@1570
@31@1178:
   ;	
   ;	    }
   ;	
   ;	    /* jason_on != 1 — passive drift */
   ;	    if (a->state != 0)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+61],0
	je short	@@30
	jmp	@31@1458
@@30:
   ;	
   ;	        goto turn;
   ;	    if (a->flag_3) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,3
	and	ax,1
	or	ax,ax
	je	short @31@1290
   ;	
   ;	        ego->flag_3 = 1;
   ;	
	les	bx,dword ptr DGROUP:_ego
	or	byte ptr es:[bx+82],8
   ;	
   ;	        ego->field_1E = 0;
   ;	
	les	bx,dword ptr DGROUP:_ego
	mov	word ptr es:[bx+30],0
   ;	
   ;	        ego->field_28 = a->field_28;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+40]
	les	bx,dword ptr DGROUP:_ego
	mov	word ptr es:[bx+40],ax
   ;	
   ;	        a->flag_3 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	and	byte ptr es:[bx+82],247
   ;	
   ;	        a->field_28 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+40],0
   ;	
   ;	        a->field_36 = 0x20;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+54],32
   ;	
   ;	        if (a->field_1E != 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+30],0
	je	short @31@1290
   ;	
   ;	            a->x_speed += a->field_1E;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+30]
	les	bx,dword ptr [bp+6]
	add	word ptr es:[bx+20],ax
   ;	
   ;	            a->field_1E = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+30],0
@31@1290:
   ;	
   ;	        }
   ;	    }
   ;	    if (a->cycle_speed == 0 && random(4) == 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+58],0
	je short	@@31
	jmp	@31@1570
@@31:
	push	4
	call	far ptr @random$qi
	pop	cx
	or	ax,ax
	je short	@@32
	jmp	@31@1570
@@32:
   ;	
   ;	        var_2 = a->y + random(3) + 4;
   ;	
	push	3
	call	far ptr @random$qi
	pop	cx
	les	bx,dword ptr [bp+6]
	mov	dx,word ptr es:[bx+2]
	add	dx,ax
	add	dx,4
	mov	word ptr [bp-2],dx
   ;	
   ;	        if (a->direction == 0)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+52],0
	jne	short @31@1402
   ;	
   ;	            add_bubble(a->x, var_2, -4);
   ;	
	push	-4
	push	word ptr [bp-2]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx]
	jmp	@31@254
@31@1402:
   ;	
   ;	        else
   ;	            add_bubble(a->x + a->width, var_2, 4);
   ;	
	push	4
	push	word ptr [bp-2]
	les	bx,dword ptr [bp+6]
	push	es
	les	si,dword ptr [bp+6]
	mov	ax,word ptr es:[si]
	pop	es
	add	ax,word ptr es:[bx+16]
	push	ax
	jmp	@31@254
   ;	
   ;	    }
   ;	    return;
   ;	
	jmp	short @31@1570
@31@1458:
   ;	
   ;	
   ;	turn:
   ;	    a->state = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+61],0
   ;	
   ;	    a->new_loop(a->direction ? (uchar *)"prober.l" : (uchar *)"probel.l");
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+52],0
	je	short @31@1514
	mov	dx,ds
	mov	ax,offset DGROUP:s@+105
	jmp	short @31@1542
@31@1514:
	mov	dx,ds
	mov	ax,offset DGROUP:s@+114
@31@1542:
	push	dx
	push	ax
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@new_loop$qnuc
	add	sp,8
   ;	
   ;	    a->direction ^= 1;
   ;	
	les	bx,dword ptr [bp+6]
	xor	byte ptr es:[bx+52],1
@31@1570:
   ;	
   ;	}
   ;	
	pop	si
	leave	
	ret	
@do_probe$qn7m_actor	endp
   ;	
   ;	void far do_gun_piece(m_actor far *a)
   ;	
	assume	cs:CREATURE_TEXT
@do_gun_piece$qn7m_actor	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (!a->in_window)
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,1
	and	ax,1
	or	ax,ax
	je	short @32@142
   ;	
   ;	        return;
   ;	    if (touching(a, ego)) {
   ;	
	push	word ptr DGROUP:_ego+2
	push	word ptr DGROUP:_ego
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @touching$qn7m_actort1
	add	sp,8
	or	al,al
	je	short @32@142
   ;	
   ;	        a->flag_0 = 1;
   ;	
	les	bx,dword ptr [bp+6]
	or	byte ptr es:[bx+82],1
   ;	
   ;	        score_at(a->x, a->y, 0x7D0);
   ;	
	push	2000
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx]
	call	far ptr @score_at$qiii
	add	sp,6
   ;	
   ;	        gun_count++;
   ;	
	inc	byte ptr DGROUP:_gun_count
   ;	
   ;	        goodies_found++;
   ;	
	inc	byte ptr DGROUP:_goodies_found
   ;	
   ;	        update_gun();
   ;	
	call	far ptr @update_gun$qv
   ;	
   ;	        the_game->field_09 = 1;
   ;	
	les	bx,dword ptr DGROUP:_the_game
	mov	byte ptr es:[bx+9],1
   ;	
   ;	        the_game->play_sound((uchar *)"pup2", 9);
   ;	
	push	9
	push	ds
	push	offset DGROUP:s@+123
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_sound$qnucuc
	add	sp,10
   ;	
   ;	        if (gun_count == 4) {
   ;	
	cmp	byte ptr DGROUP:_gun_count,4
	jne	short @32@142
   ;	
   ;	            shot_size = 4;
   ;	
	mov	byte ptr DGROUP:_shot_size,4
   ;	
   ;	            heavy_timer = 0x32;
   ;	
	mov	word ptr DGROUP:_heavy_timer,50
@32@142:
   ;	
   ;	        }
   ;	    }
   ;	}
   ;	
	pop	bp
	ret	
@do_gun_piece$qn7m_actor	endp
   ;	
   ;	byte far do_follow(m_actor far *a, int arg_4, int arg_6)
   ;	
	assume	cs:CREATURE_TEXT
@do_follow$qn7m_actorii	proc	far
	enter	2,0
   ;	
   ;	{
   ;	    byte var_1, var_2;
   ;	
   ;	    diff_x = abs(cur_sub->center_x - a->center_x);
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	mov	ax,word ptr es:[bx+8]
	les	bx,dword ptr [bp+6]
	sub	ax,word ptr es:[bx+8]
	push	ax
	call	far ptr @abs$qi
	pop	cx
	mov	word ptr DGROUP:_diff_x,ax
   ;	
   ;	    diff_y = abs(cur_sub->center_y - a->center_y);
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	mov	ax,word ptr es:[bx+10]
	les	bx,dword ptr [bp+6]
	sub	ax,word ptr es:[bx+10]
	push	ax
	call	far ptr @abs$qi
	pop	cx
	mov	word ptr DGROUP:_diff_y,ax
   ;	
   ;	    var_1 = check_horizontal_ray(a, diff_x >> 3);
   ;	
	mov	ax,word ptr DGROUP:_diff_x
	sar	ax,3
	push	ax
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @check_horizontal_ray$qn7m_actorui
	add	sp,6
	mov	byte ptr [bp-1],al
   ;	
   ;	    var_2 = check_vertical_ray(a, diff_y >> 3);
   ;	
	mov	ax,word ptr DGROUP:_diff_y
	sar	ax,3
	push	ax
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @check_vertical_ray$qn7m_actorui
	add	sp,6
	mov	byte ptr [bp-2],al
   ;	
   ;	    if (var_2 != 0) {
   ;	
	cmp	byte ptr [bp-2],0
	je	short @33@226
   ;	
   ;	        a->x_speed = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+20],0
   ;	
   ;	        if (diff_y <= 0x0A)
   ;	
	cmp	word ptr DGROUP:_diff_y,10
	jle	short @33@450
   ;	
   ;	            goto chase_x;
   ;	        a->y_speed = (cur_sub->center_y < a->center_y) ? -arg_4 : arg_4;
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	mov	ax,word ptr es:[bx+10]
	les	bx,dword ptr [bp+6]
	cmp	ax,word ptr es:[bx+10]
	jge	short @33@142
	mov	ax,word ptr [bp+10]
	neg	ax
	jmp	short @33@170
@33@142:
	mov	ax,word ptr [bp+10]
@33@170:
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+22],ax
@33@198:
   ;	
   ;	        return 0;
   ;	
	mov	al,0
	jmp	@33@562
@33@226:
   ;	
   ;	    }
   ;	    if (var_1 != 0)
   ;	
	cmp	byte ptr [bp-1],0
	jne	short @33@450
   ;	
   ;	        goto chase_x;
   ;	    if (var_2 != 0 || var_1 == 0) {
   ;	
	cmp	byte ptr [bp-2],0
	jne	short @33@310
	cmp	byte ptr [bp-1],0
	jne	short @33@338
@33@310:
   ;	
   ;	        a->y_speed = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+22],0
   ;	
   ;	        a->x_speed = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+20],0
	jmp	short @33@198
@33@338:
   ;	
   ;	        return 0;
   ;	    }
   ;	    a->y_speed = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+22],0
   ;	
   ;	    a->x_speed = (cur_sub->center_x < a->center_x) ? -arg_6 : arg_6;
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	mov	ax,word ptr es:[bx+8]
	les	bx,dword ptr [bp+6]
	cmp	ax,word ptr es:[bx+8]
	jge	short @33@394
	mov	ax,word ptr [bp+12]
	neg	ax
	jmp	short @33@422
@33@394:
	mov	ax,word ptr [bp+12]
@33@422:
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+20],ax
	jmp	short @33@198
@33@450:
   ;	
   ;	    return 0;
   ;	chase_x:
   ;	    a->y_speed = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+22],0
   ;	
   ;	    a->x_speed = (cur_sub->center_x < a->center_x) ? -(arg_6 - 1) : (arg_6 - 1);
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	mov	ax,word ptr es:[bx+8]
	les	bx,dword ptr [bp+6]
	cmp	ax,word ptr es:[bx+8]
	jge	short @33@506
	mov	ax,word ptr [bp+12]
	dec	ax
	neg	ax
	jmp	short @33@534
@33@506:
	mov	ax,word ptr [bp+12]
	dec	ax
@33@534:
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+20],ax
   ;	
   ;	    return 1;
   ;	
	mov	al,1
@33@562:
   ;	
   ;	}
   ;	
	leave	
	ret	
@do_follow$qn7m_actorii	endp
   ;	
   ;	void far do_ship(m_actor far *a)
   ;	
	assume	cs:CREATURE_TEXT
@do_ship$qn7m_actor	proc	far
	enter	2,0
   ;	
   ;	{
   ;	    byte hit;
   ;	
   ;	    if (a->counter_24 == 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+34],0
	jne	short @34@86
   ;	
   ;	        a->counter_24 = 0x2D;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+34],45
	jmp	@34@590
@34@86:
   ;	
   ;	        goto bomb;
   ;	    }
   ;	    a->counter_24--;
   ;	
	les	bx,dword ptr [bp+6]
	dec	word ptr es:[bx+34]
   ;	
   ;	    if (a->door_open == 1)          /* turn-back requested — spin around */
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,6
	and	ax,1
	cmp	ax,1
	jne short	@@33
	jmp	@34@478
@@33:
   ;	
   ;	        goto turn;
   ;	    if (random(0x1E) == 0)
   ;	
	push	30
	call	far ptr @random$qi
	pop	cx
	or	ax,ax
	jne short	@@34
	jmp	@34@478
@@34:
   ;	
   ;	        goto turn;
   ;	    diff_y = abs(cur_sub->center_y - a->old_y);
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	mov	ax,word ptr es:[bx+10]
	les	bx,dword ptr [bp+6]
	sub	ax,word ptr es:[bx+6]
	push	ax
	call	far ptr @abs$qi
	pop	cx
	mov	word ptr DGROUP:_diff_y,ax
   ;	
   ;	    if (diff_y < 0x0A) {
   ;	
	cmp	word ptr DGROUP:_diff_y,10
	jge	short @34@310
   ;	
   ;	        if (a->facing_actor(cur_sub)) {
   ;	
	push	word ptr DGROUP:_cur_sub+2
	push	word ptr DGROUP:_cur_sub
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@facing_actor$qn7m_actor
	add	sp,8
	or	al,al
	je	short @34@282
   ;	
   ;	            if (random(0x0A) == 0)
   ;	
	push	10
	call	far ptr @random$qi
	pop	cx
	or	ax,ax
	jne	short @34@310
   ;	
   ;	                add_missile(a, 2, 0);
   ;	
	push	0
	push	2
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @add_missile$qn7m_actoruci
	add	sp,8
	jmp	short @34@310
   ;	
   ;	        } else if (random(0x0A) == 0) {
   ;	
	jmp	short @34@310
@34@282:
	push	10
	call	far ptr @random$qi
	pop	cx
	or	ax,ax
	jne short	@@35
	jmp	@34@478
@@35:
@34@310:
   ;	
   ;	            goto turn;
   ;	        }
   ;	    }
   ;	    if (a->in_window) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,1
	and	ax,1
	or	ax,ax
	jne short	@@36
	jmp	@34@618
@@36:
   ;	
   ;	        hit = check_for_hit(a, 0x14);
   ;	
	push	20
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @check_for_hit$qn7m_actoruc
	add	sp,6
	mov	byte ptr [bp-1],al
   ;	
   ;	        if (hit == 1 && random(6) == 0)
   ;	
	cmp	byte ptr [bp-1],1
	jne	short @34@394
	push	6
	call	far ptr @random$qi
	pop	cx
	or	ax,ax
	jne short	@@37
	jmp	@34@590
@@37:
@34@394:
   ;	
   ;	            goto bomb;
   ;	        if (hit == 2) {
   ;	
	cmp	byte ptr [bp-1],2
	je short	@@38
	jmp	@34@618
@@38:
   ;	
   ;	            add_explosion(a->center_x, a->center_y, 2, (uchar far *)NULL);
   ;	
	push	0
	push	0
	push	2
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+10]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+8]
	call	far ptr @add_explosion$qiiucnuc
	add	sp,10
   ;	
   ;	            score_at(a->center_x, a->center_y, 0xBB8);
   ;	
	push	3000
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+10]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+8]
	call	far ptr @score_at$qiii
	add	sp,6
	jmp	@34@618
   ;	
   ;	        }
   ;	    }
   ;	    return;
   ;	
	jmp	@34@618
@34@478:
   ;	
   ;	
   ;	turn:
   ;	    a->new_loop(a->direction == 1 ? (uchar *)"shipr.l" : (uchar *)"shipl.l");
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+52],1
	jne	short @34@534
	mov	dx,ds
	mov	ax,offset DGROUP:s@+128
	jmp	short @34@562
@34@534:
	mov	dx,ds
	mov	ax,offset DGROUP:s@+136
@34@562:
	push	dx
	push	ax
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@new_loop$qnuc
	add	sp,8
   ;	
   ;	    a->x_speed = -a->x_speed;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+20]
	neg	ax
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+20],ax
   ;	
   ;	    a->direction ^= 1;
   ;	
	les	bx,dword ptr [bp+6]
	xor	byte ptr es:[bx+52],1
   ;	
   ;	    a->door_open = 0;
   ;	
	les	bx,dword ptr [bp+6]
	and	byte ptr es:[bx+82],191
   ;	
   ;	    return;
   ;	
	jmp	short @34@618
@34@590:
   ;	
   ;	
   ;	bomb:
   ;	    act = the_cast->add((uchar *)"shpbmb.l", (void far *)0, (void far *)do_ship_bomb);
   ;	
	push	seg @do_ship_bomb$qn7m_actor
	push	offset @do_ship_bomb$qn7m_actor
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+144
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_act+2,dx
	mov	word ptr DGROUP:_act,ax
   ;	
   ;	    act->y_speed = 3;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	word ptr es:[bx+22],3
   ;	
   ;	    act->set_xy(a->center_x, a->old_y);
   ;	
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+6]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+8]
	push	word ptr DGROUP:_act+2
	push	word ptr DGROUP:_act
	call	far ptr @m_actor@set_xy$qii
	add	sp,8
@34@618:
   ;	
   ;	}
   ;	
	leave	
	ret	
@do_ship$qn7m_actor	endp
   ;	
   ;	void far do_ship_bomb(m_actor far *a)
   ;	
	assume	cs:CREATURE_TEXT
@do_ship_bomb$qn7m_actor	proc	far
	push	bp
	mov	bp,sp
	push	si
   ;	
   ;	{
   ;	    if (the_map->tile_attr[a->map_pos].attr >= 0x100) {
   ;	
	les	bx,dword ptr DGROUP:_the_map
	les	bx,dword ptr es:[bx+926]
	push	es
	les	si,dword ptr [bp+6]
	mov	ax,word ptr es:[si+24]
	shl	ax,2
	add	bx,ax
	pop	es
	cmp	word ptr es:[bx],256
	jb	short @35@226
   ;	
   ;	        if (a->in_window) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,1
	and	ax,1
	or	ax,ax
	jne short	@@39
	jmp	@35@310
@@39:
   ;	
   ;	            if (touching(a, cur_sub)) {
   ;	
	push	word ptr DGROUP:_cur_sub+2
	push	word ptr DGROUP:_cur_sub
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @touching$qn7m_actort1
	add	sp,8
	or	al,al
	je	short @35@142
   ;	
   ;	                hit_cur_sub(6, 0);
   ;	
	push	0
	push	6
	push	cs
	call	near ptr @hit_cur_sub$qii
	add	sp,4
	jmp	short @35@226
@35@142:
   ;	
   ;	                goto boom;
   ;	            }
   ;	            if (random(6) == 0)
   ;	
	push	6
	call	far ptr @random$qi
	pop	cx
	or	ax,ax
	jne	short @35@310
   ;	
   ;	                add_bubble(a->center_x, a->y, 0);
   ;	
	push	0
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+8]
	call	far ptr @add_bubble$qiii
	add	sp,6
	jmp	short @35@310
   ;	
   ;	        }
   ;	        return;
   ;	
	jmp	short @35@310
@35@226:
   ;	
   ;	    }
   ;	boom:
   ;	    if (a->in_window)
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,1
	and	ax,1
	or	ax,ax
	je	short @35@282
   ;	
   ;	        add_explosion(a->x, a->y, 1, (uchar far *)NULL);
   ;	
	push	0
	push	0
	push	1
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx]
	call	far ptr @add_explosion$qiiucnuc
	add	sp,10
@35@282:
   ;	
   ;	    a->flag_0 = 1;
   ;	
	les	bx,dword ptr [bp+6]
	or	byte ptr es:[bx+82],1
@35@310:
   ;	
   ;	}
   ;	
	pop	si
	pop	bp
	ret	
@do_ship_bomb$qn7m_actor	endp
   ;	
   ;	void far do_cannon(m_actor far *a)
   ;	
	assume	cs:CREATURE_TEXT
@do_cannon$qn7m_actor	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (!a->in_window)
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,1
	and	ax,1
	or	ax,ax
	jne short	@@40
	jmp	@36@422
@@40:
   ;	
   ;	        return;
   ;	    if (!a->facing_actor(cur_sub)) {
   ;	
	push	word ptr DGROUP:_cur_sub+2
	push	word ptr DGROUP:_cur_sub
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@facing_actor$qn7m_actor
	add	sp,8
	mov	ah,0
	or	ax,ax
	jne	short @36@198
   ;	
   ;	        a->new_loop(a->direction == 1 ? (uchar *)"cannonr.l" : (uchar *)"cannonl.l");
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+52],1
	jne	short @36@142
	mov	dx,ds
	mov	ax,offset DGROUP:s@+153
	jmp	short @36@170
@36@142:
	mov	dx,ds
	mov	ax,offset DGROUP:s@+163
@36@170:
	push	dx
	push	ax
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@new_loop$qnuc
	add	sp,8
   ;	
   ;	        a->direction ^= 1;
   ;	
	les	bx,dword ptr [bp+6]
	xor	byte ptr es:[bx+52],1
@36@198:
   ;	
   ;	    }
   ;	    if (a->counter_24 != 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+34],0
	je	short @36@310
   ;	
   ;	        if (a->counter_24-- == 8)
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+34]
	dec	word ptr es:[bx+34]
	cmp	ax,8
	jne	short @36@366
   ;	
   ;	            add_missile(a, 0x0A, 5);
   ;	
	push	5
	push	10
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @add_missile$qn7m_actoruci
	add	sp,8
	jmp	short @36@366
   ;	
   ;	    } else {
   ;	
	jmp	short @36@366
@36@310:
   ;	
   ;	        diff_y = abs(cur_sub->center_y - a->center_y);
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	mov	ax,word ptr es:[bx+10]
	les	bx,dword ptr [bp+6]
	sub	ax,word ptr es:[bx+10]
	push	ax
	call	far ptr @abs$qi
	pop	cx
	mov	word ptr DGROUP:_diff_y,ax
   ;	
   ;	        if (diff_y < 0x0A) {
   ;	
	cmp	word ptr DGROUP:_diff_y,10
	jge	short @36@366
   ;	
   ;	            a->set_cycle(2, 3);
   ;	
	push	3
	push	2
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
   ;	
   ;	            a->counter_24 = random(5) + 0x0A;
   ;	
	push	5
	call	far ptr @random$qi
	pop	cx
	add	ax,10
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+34],ax
@36@366:
   ;	
   ;	        }
   ;	    }
   ;	    if (check_for_hit(a, 0x0A) == 2) {
   ;	
	push	10
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @check_for_hit$qn7m_actoruc
	add	sp,6
	cmp	al,2
	jne	short @36@422
   ;	
   ;	        add_explosion(a->center_x, a->y, 2, (uchar far *)NULL);
   ;	
	push	0
	push	0
	push	2
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+8]
	call	far ptr @add_explosion$qiiucnuc
	add	sp,10
   ;	
   ;	        score_at(a->center_x, a->y, 0x3E8);
   ;	
	push	1000
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+8]
	call	far ptr @score_at$qiii
	add	sp,6
@36@422:
   ;	
   ;	    }
   ;	}
   ;	
	pop	bp
	ret	
@do_cannon$qn7m_actor	endp
   ;	
   ;	void far do_clam(m_actor far *a)
   ;	
	assume	cs:CREATURE_TEXT
@do_clam$qn7m_actor	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (!a->in_window)
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,1
	and	ax,1
	or	ax,ax
	jne short	@@41
	jmp	@37@618
@@41:
   ;	
   ;	        return;
   ;	    if (a->counter_26 != 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+36],0
	je	short @37@114
   ;	
   ;	        a->counter_26--;
   ;	
	les	bx,dword ptr [bp+6]
	dec	word ptr es:[bx+36]
   ;	
   ;	        return;
   ;	
	jmp	@37@618
@37@114:
   ;	
   ;	    }
   ;	    if (check_for_hit(a, 6) == 2) {
   ;	
	push	6
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @check_for_hit$qn7m_actoruc
	add	sp,6
	cmp	al,2
	je short	@@42
	jmp	@37@170
@@42:
   ;	
   ;	        /* destroyed — pop open and release the gem */
   ;	        a->flag_0 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	and	byte ptr es:[bx+82],254
   ;	
   ;	        a->type = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+53],0
   ;	
   ;	        a->update_func = (actfn_t)0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	dword ptr es:[bx+62],large 0
   ;	
   ;	        a->set_cycle(0, 4);
   ;	
	push	4
	push	0
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
   ;	
   ;	        add_explosion(a->center_x, a->y, 1, (uchar far *)NULL);
   ;	
	push	0
	push	0
	push	1
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+8]
	call	far ptr @add_explosion$qiiucnuc
	add	sp,10
   ;	
   ;	        add_bubble(a->center_x, a->y, 0);
   ;	
	push	0
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+8]
	call	far ptr @add_bubble$qiii
	add	sp,6
   ;	
   ;	        act = the_cast->add((uchar *)"gem.l", (void far *)0, (void far *)do_coin);
   ;	
	push	seg @do_coin$qn7m_actor
	push	offset @do_coin$qn7m_actor
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+173
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_act+2,dx
	mov	word ptr DGROUP:_act,ax
   ;	
   ;	        act->flag_7 = 1;
   ;	
	les	bx,dword ptr DGROUP:_act
	or	byte ptr es:[bx+82],128
   ;	
   ;	        act->y_speed = -8;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	word ptr es:[bx+22],-8
   ;	
   ;	        act->set_xy(a->center_x, a->y);
   ;	
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+8]
	push	word ptr DGROUP:_act+2
	push	word ptr DGROUP:_act
	call	far ptr @m_actor@set_xy$qii
	add	sp,8
   ;	
   ;	        act->set_cycle(1, 1);
   ;	
	push	1
	push	1
	push	word ptr DGROUP:_act+2
	push	word ptr DGROUP:_act
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
@37@170:
   ;	
   ;	    }
   ;	    /* idle / grab logic */
   ;	    diff_x = abs(cur_sub->center_x - a->center_x);
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	mov	ax,word ptr es:[bx+8]
	les	bx,dword ptr [bp+6]
	sub	ax,word ptr es:[bx+8]
	push	ax
	call	far ptr @abs$qi
	pop	cx
	mov	word ptr DGROUP:_diff_x,ax
   ;	
   ;	    diff_y = abs(cur_sub->center_y - a->center_y);
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	mov	ax,word ptr es:[bx+10]
	les	bx,dword ptr [bp+6]
	sub	ax,word ptr es:[bx+10]
	push	ax
	call	far ptr @abs$qi
	pop	cx
	mov	word ptr DGROUP:_diff_y,ax
   ;	
   ;	    if (a->door_open == 1) {                /* sub is inside — holding it */
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,6
	and	ax,1
	cmp	ax,1
	je short	@@43
	jmp	@37@450
@@43:
   ;	
   ;	        if (a->flag_7 == 1) {               /* counting down to release */
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,7
	and	ax,1
	cmp	ax,1
	jne	short @37@338
   ;	
   ;	            if (--a->counter_24 == 0) {
   ;	
	les	bx,dword ptr [bp+6]
	dec	word ptr es:[bx+34]
	jne	short @37@282
   ;	
   ;	                a->set_cycle(1, 3);            /* open */
   ;	
	push	3
	push	1
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
   ;	
   ;	                a->flag_7 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	and	byte ptr es:[bx+82],127
   ;	
   ;	                a->door_open = 0;
   ;	
	les	bx,dword ptr [bp+6]
	and	byte ptr es:[bx+82],191
   ;	
   ;	                a->counter_26 = 0x28;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+36],40
   ;	
   ;	                the_game->field_0E = 0;
   ;	
	les	bx,dword ptr DGROUP:_the_game
	mov	byte ptr es:[bx+14],0
   ;	
   ;	                cur_sub->y_speed = -4;
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	mov	word ptr es:[bx+22],-4
   ;	
   ;	            } else {
   ;	
	jmp	@37@618
@37@282:
   ;	
   ;	                cur_sub->y_speed = 0;          /* held fast */
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	mov	word ptr es:[bx+22],0
   ;	
   ;	                cur_sub->x_speed = 0;
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	mov	word ptr es:[bx+20],0
	jmp	@37@618
   ;	
   ;	            }
   ;	        } else {
   ;	
	jmp	@37@618
@37@338:
   ;	
   ;	            /* closed — keep it latched while the sub struggles */
   ;	            if (abs(cur_sub->center_y - a->y) < 8) {
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	mov	ax,word ptr es:[bx+10]
	les	bx,dword ptr [bp+6]
	sub	ax,word ptr es:[bx+2]
	push	ax
	call	far ptr @abs$qi
	pop	cx
	cmp	ax,8
	jge	short @37@394
   ;	
   ;	                the_game->play_sound((uchar *)"dirhit", 6);
   ;	
	push	6
	push	ds
	push	offset DGROUP:s@+179
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_sound$qnucuc
	add	sp,10
   ;	
   ;	                the_game->field_0E = 1;
   ;	
	les	bx,dword ptr DGROUP:_the_game
	mov	byte ptr es:[bx+14],1
   ;	
   ;	                hit_cur_sub(4, 0);
   ;	
	push	0
	push	4
	push	cs
	call	near ptr @hit_cur_sub$qii
	add	sp,4
   ;	
   ;	                a->flag_7 = 1;
   ;	
	les	bx,dword ptr [bp+6]
	or	byte ptr es:[bx+82],128
   ;	
   ;	                a->counter_24 = 0x3C;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+34],60
   ;	
   ;	                a->set_cycle(1, 5);
   ;	
	push	5
	push	1
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
   ;	
   ;	            } else {
   ;	
	jmp	@37@618
@37@394:
   ;	
   ;	                cur_sub->y_speed += 4;
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	add	word ptr es:[bx+22],4
	jmp	short @37@618
   ;	
   ;	            }
   ;	        }
   ;	        return;
   ;	
	jmp	short @37@618
@37@450:
   ;	
   ;	    }
   ;	    /* mouth open — snap when the sub is above and inside the mouth span */
   ;	    if (cur_sub->center_y < a->center_y &&
   ;	
   ;	
   ;	        jason_on == 0 &&
   ;	        diff_y < 0x32 &&
   ;	        cur_sub->center_x >= a->x &&
   ;	        cur_sub->center_x < a->old_x) {
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	mov	ax,word ptr es:[bx+10]
	les	bx,dword ptr [bp+6]
	cmp	ax,word ptr es:[bx+10]
	jge	short @37@618
	cmp	byte ptr DGROUP:_jason_on,0
	jne	short @37@618
	cmp	word ptr DGROUP:_diff_y,50
	jge	short @37@618
	les	bx,dword ptr DGROUP:_cur_sub
	mov	ax,word ptr es:[bx+8]
	les	bx,dword ptr [bp+6]
	cmp	ax,word ptr es:[bx]
	jl	short @37@618
	les	bx,dword ptr DGROUP:_cur_sub
	mov	ax,word ptr es:[bx+8]
	les	bx,dword ptr [bp+6]
	cmp	ax,word ptr es:[bx+4]
	jge	short @37@618
   ;	
   ;	        the_game->play_sound((uchar *)"swish", 6);
   ;	
	push	6
	push	ds
	push	offset DGROUP:s@+186
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_sound$qnucuc
	add	sp,10
   ;	
   ;	        a->set_cycle(1, 4);
   ;	
	push	4
	push	1
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
   ;	
   ;	        a->door_open = 1;
   ;	
	les	bx,dword ptr [bp+6]
	or	byte ptr es:[bx+82],64
@37@618:
   ;	
   ;	    }
   ;	}
   ;	
	pop	bp
	ret	
@do_clam$qn7m_actor	endp
   ;	
   ;	void far do_shuttle(m_actor far *a)
   ;	
	assume	cs:CREATURE_TEXT
@do_shuttle$qn7m_actor	proc	far
	enter	2,0
   ;	
   ;	{
   ;	    byte hit;
   ;	
   ;	    if (!a->in_window && !a->flag_7)
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,1
	and	ax,1
	or	ax,ax
	jne	short @38@86
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,7
	and	ax,1
	or	ax,ax
	jne short	@@44
	jmp	@38@506
@@44:
@38@86:
   ;	
   ;	        return;
   ;	    a->flag_7 = 1;                          /* once woken, stays awake */
   ;	
	les	bx,dword ptr [bp+6]
	or	byte ptr es:[bx+82],128
   ;	
   ;	    if (a->counter_24 != 0)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+34],0
	je	short @38@142
   ;	
   ;	        a->counter_24--;
   ;	
	les	bx,dword ptr [bp+6]
	dec	word ptr es:[bx+34]
@38@142:
   ;	
   ;	    if (a->door_open != 0) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,6
	and	ax,1
	or	ax,ax
	je	short @38@282
   ;	
   ;	        /* sub slipped behind — flip and pause */
   ;	        a->new_loop(a->direction == 1 ? (uchar *)"shutl_r.l" : (uchar *)"shutl_l.l");
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+52],1
	jne	short @38@226
	mov	dx,ds
	mov	ax,offset DGROUP:s@+192
	jmp	short @38@254
@38@226:
	mov	dx,ds
	mov	ax,offset DGROUP:s@+202
@38@254:
	push	dx
	push	ax
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@new_loop$qnuc
	add	sp,8
   ;	
   ;	        a->direction ^= 1;
   ;	
	les	bx,dword ptr [bp+6]
	xor	byte ptr es:[bx+52],1
   ;	
   ;	        a->door_open = 0;
   ;	
	les	bx,dword ptr [bp+6]
	and	byte ptr es:[bx+82],191
   ;	
   ;	        a->counter_24 = 0x0A;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+34],10
   ;	
   ;	        return;
   ;	
	jmp	@38@506
@38@282:
   ;	
   ;	    }
   ;	    if (!a->facing_actor(cur_sub))
   ;	
	push	word ptr DGROUP:_cur_sub+2
	push	word ptr DGROUP:_cur_sub
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@facing_actor$qn7m_actor
	add	sp,8
	mov	ah,0
	or	ax,ax
	jne	short @38@338
   ;	
   ;	        a->door_open = 1;
   ;	
	les	bx,dword ptr [bp+6]
	or	byte ptr es:[bx+82],64
@38@338:
   ;	
   ;	    hit = check_for_hit(a, 0x19);
   ;	
	push	25
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @check_for_hit$qn7m_actoruc
	add	sp,6
	mov	byte ptr [bp-1],al
   ;	
   ;	    if (hit == 2) {
   ;	
	cmp	byte ptr [bp-1],2
	jne	short @38@394
   ;	
   ;	        add_explosion(a->center_x, a->center_y, 2, (uchar far *)NULL);
   ;	
	push	0
	push	0
	push	2
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+10]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+8]
	call	far ptr @add_explosion$qiiucnuc
	add	sp,10
   ;	
   ;	        score_at(a->x, a->y, 0x7D0);
   ;	
	push	2000
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx]
	call	far ptr @score_at$qiii
	add	sp,6
@38@394:
   ;	
   ;	    }
   ;	    if (do_follow(a, 2, 4)) {
   ;	
	push	4
	push	2
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @do_follow$qn7m_actorii
	add	sp,8
	or	al,al
	je	short @38@506
   ;	
   ;	        if (diff_y < 0x0F && random(0x0C) == 0)
   ;	
	cmp	word ptr DGROUP:_diff_y,15
	jge	short @38@506
	push	12
	call	far ptr @random$qi
	pop	cx
	or	ax,ax
	jne	short @38@506
   ;	
   ;	            add_missile(a, 1, 0);
   ;	
	push	0
	push	1
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @add_missile$qn7m_actoruci
	add	sp,8
@38@506:
   ;	
   ;	    }
   ;	}
   ;	
	leave	
	ret	
@do_shuttle$qn7m_actor	endp
   ;	
   ;	void far do_fire_ball(m_actor far *a)
   ;	
	assume	cs:CREATURE_TEXT
@do_fire_ball$qn7m_actor	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (a->y_speed++ == a->counter_24)
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+22]
	inc	word ptr es:[bx+22]
	les	bx,dword ptr [bp+6]
	cmp	ax,word ptr es:[bx+34]
	jne	short @39@86
   ;	
   ;	        a->flag_0 = 1;
   ;	
	les	bx,dword ptr [bp+6]
	or	byte ptr es:[bx+82],1
@39@86:
   ;	
   ;	    if (a->y_speed == 1)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+22],1
	jne	short @39@142
   ;	
   ;	        a->new_loop((uchar *)"firbaldn.l");
   ;	
	push	ds
	push	offset DGROUP:s@+212
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@new_loop$qnuc
	add	sp,8
@39@142:
   ;	
   ;	    if (a->in_window) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,1
	and	ax,1
	or	ax,ax
	je	short @39@282
   ;	
   ;	        if (random(0x0A) == 0)
   ;	
	push	10
	call	far ptr @random$qi
	pop	cx
	or	ax,ax
	jne	short @39@226
   ;	
   ;	            add_bubble(a->center_x, a->center_y, 0);
   ;	
	push	0
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+10]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+8]
	call	far ptr @add_bubble$qiii
	add	sp,6
@39@226:
   ;	
   ;	        if (touching(a, cur_sub)) {
   ;	
	push	word ptr DGROUP:_cur_sub+2
	push	word ptr DGROUP:_cur_sub
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @touching$qn7m_actort1
	add	sp,8
	or	al,al
	je	short @39@282
   ;	
   ;	            a->flag_0 = 1;
   ;	
	les	bx,dword ptr [bp+6]
	or	byte ptr es:[bx+82],1
   ;	
   ;	            hit_cur_sub(0x0F, 2);
   ;	
	push	2
	push	15
	push	cs
	call	near ptr @hit_cur_sub$qii
	add	sp,4
   ;	
   ;	            add_explosion(a->x, a->y, 1, (uchar far *)NULL);
   ;	
	push	0
	push	0
	push	1
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx]
	call	far ptr @add_explosion$qiiucnuc
	add	sp,10
@39@282:
   ;	
   ;	        }
   ;	    }
   ;	}
   ;	
	pop	bp
	ret	
@do_fire_ball$qn7m_actor	endp
   ;	
   ;	void far do_fire_pit(m_actor far *a)
   ;	
	assume	cs:CREATURE_TEXT
@do_fire_pit$qn7m_actor	proc	far
	enter	2,0
   ;	
   ;	{
   ;	    int var_2;
   ;	
   ;	    if (a->counter_24++ != a->counter_26)
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+34]
	inc	word ptr es:[bx+34]
	les	bx,dword ptr [bp+6]
	cmp	ax,word ptr es:[bx+36]
	je short	@@45
	jmp	@40@142
@@45:
   ;	
   ;	        return;
   ;	    a->counter_24 = random(5);
   ;	
	push	5
	call	far ptr @random$qi
	pop	cx
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+34],ax
   ;	
   ;	    if (a->in_window)
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,1
	and	ax,1
	or	ax,ax
	je	short @40@114
   ;	
   ;	        the_game->play_sound((uchar *)"fire1", 5);
   ;	
	push	5
	push	ds
	push	offset DGROUP:s@+223
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_sound$qnucuc
	add	sp,10
@40@114:
   ;	
   ;	    act = the_cast->add((uchar *)"firbalup.l", (void far *)0, (void far *)do_fire_ball);
   ;	
	push	seg @do_fire_ball$qn7m_actor
	push	offset @do_fire_ball$qn7m_actor
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+229
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_act+2,dx
	mov	word ptr DGROUP:_act,ax
   ;	
   ;	    act->set_xy(a->x + 0x0F, a->y);
   ;	
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx]
	add	ax,15
	push	ax
	push	word ptr DGROUP:_act+2
	push	word ptr DGROUP:_act
	call	far ptr @m_actor@set_xy$qii
	add	sp,8
   ;	
   ;	    act->set_cycle(1, 1);
   ;	
	push	1
	push	1
	push	word ptr DGROUP:_act+2
	push	word ptr DGROUP:_act
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
   ;	
   ;	    var_2 = random(5) + 0x0C;
   ;	
	push	5
	call	far ptr @random$qi
	pop	cx
	add	ax,12
	mov	word ptr [bp-2],ax
   ;	
   ;	    act->y_speed = -var_2;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	ax,word ptr [bp-2]
	neg	ax
	mov	word ptr es:[bx+22],ax
   ;	
   ;	    act->counter_24 = var_2 - 2;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	ax,word ptr [bp-2]
	add	ax,-2
	mov	word ptr es:[bx+34],ax
@40@142:
   ;	
   ;	}
   ;	
	leave	
	ret	
@do_fire_pit$qn7m_actor	endp
   ;	
   ;	void far do_spikes(m_actor far *a)
   ;	
	assume	cs:CREATURE_TEXT
@do_spikes$qn7m_actor	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (!a->in_window)
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,1
	and	ax,1
	or	ax,ax
	jne short	@@46
	jmp	@41@422
@@46:
   ;	
   ;	        return;
   ;	    if (a->frame != 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+56],0
	je	short @41@198
   ;	
   ;	        /* extended — deadly to touch */
   ;	        if (a->door_open == 0 && touching(a, cur_sub)) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,6
	and	ax,1
	or	ax,ax
	je short	@@47
	jmp	@41@422
@@47:
	push	word ptr DGROUP:_cur_sub+2
	push	word ptr DGROUP:_cur_sub
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @touching$qn7m_actort1
	add	sp,8
	or	al,al
	jne short	@@48
	jmp	@41@422
@@48:
   ;	
   ;	            a->door_open = 1;
   ;	
	les	bx,dword ptr [bp+6]
	or	byte ptr es:[bx+82],64
   ;	
   ;	            hit_cur_sub(0x0A, 0);
   ;	
	push	0
	push	10
	push	cs
	call	near ptr @hit_cur_sub$qii
	add	sp,4
	jmp	short @41@422
   ;	
   ;	        }
   ;	        return;
   ;	
	jmp	short @41@422
@41@198:
   ;	
   ;	    }
   ;	    /* cycling — extend, hold, retract */
   ;	    if (a->current_loop == a->num_frames - 1) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+60]
	mov	ah,0
	les	bx,dword ptr [bp+6]
	mov	dl,byte ptr es:[bx+59]
	mov	dh,0
	dec	dx
	cmp	ax,dx
	jne	short @41@338
   ;	
   ;	        if (a->counter_24 != 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+34],0
	je	short @41@282
   ;	
   ;	            a->counter_24--;
   ;	
	les	bx,dword ptr [bp+6]
	dec	word ptr es:[bx+34]
   ;	
   ;	        } else {
   ;	
	jmp	short @41@422
@41@282:
   ;	
   ;	            a->door_open = 0;
   ;	
	les	bx,dword ptr [bp+6]
	and	byte ptr es:[bx+82],191
   ;	
   ;	            a->set_cycle(2, 5);
   ;	
	push	5
	jmp	short @41@394
   ;	
   ;	        }
   ;	    } else if (a->current_loop == 0) {
   ;	
	jmp	short @41@422
@41@338:
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+60],0
	jne	short @41@422
   ;	
   ;	        a->counter_24 = a->counter_26;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+36]
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+34],ax
   ;	
   ;	        a->set_cycle(2, 4);
   ;	
	push	4
@41@394:
	push	2
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
@41@422:
   ;	
   ;	    }
   ;	}
   ;	
	pop	bp
	ret	
@do_spikes$qn7m_actor	endp
   ;	
   ;	void far do_tentacle(m_actor far *a)
   ;	
	assume	cs:CREATURE_TEXT
@do_tentacle$qn7m_actor	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (!a->in_window)
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,1
	and	ax,1
	or	ax,ax
	jne short	@@49
	jmp	@42@282
@@49:
   ;	
   ;	        return;
   ;	    if (a->state == 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+61],0
	jne	short @42@170
   ;	
   ;	        if (--a->counter_24 == 0) {
   ;	
	les	bx,dword ptr [bp+6]
	dec	word ptr es:[bx+34]
	je short	@@50
	jmp	@42@282
@@50:
   ;	
   ;	            a->state = 5;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+61],5
   ;	
   ;	            a->flag_3 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	and	byte ptr es:[bx+82],247
   ;	
   ;	            a->new_loop((uchar *)"tent_out.l");
   ;	
	push	ds
	push	offset DGROUP:s@+240
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@new_loop$qnuc
	add	sp,8
   ;	
   ;	            a->set_cycle(4, 4);
   ;	
	push	4
	push	4
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
	jmp	@42@282
   ;	
   ;	        }
   ;	        return;
   ;	
	jmp	@42@282
@42@170:
   ;	
   ;	    }
   ;	    if (touching(a, ego)) {
   ;	
	push	word ptr DGROUP:_ego+2
	push	word ptr DGROUP:_ego
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @touching$qn7m_actort1
	add	sp,8
	or	al,al
	je	short @42@226
   ;	
   ;	        a->flag_0 = 1;
   ;	
	les	bx,dword ptr [bp+6]
	or	byte ptr es:[bx+82],1
   ;	
   ;	        death_type = 1;
   ;	
	mov	byte ptr DGROUP:_death_type,1
   ;	
   ;	        kill_ego(a->x, a->y);
   ;	
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx]
	call	far ptr @kill_ego$qii
	add	sp,4
@42@226:
   ;	
   ;	    }
   ;	    if (a->flag_3) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,3
	and	ax,1
	or	ax,ax
	je	short @42@282
   ;	
   ;	        a->new_loop((uchar *)"tent_in.l");
   ;	
	push	ds
	push	offset DGROUP:s@+251
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@new_loop$qnuc
	add	sp,8
   ;	
   ;	        a->set_cycle(1, 4);
   ;	
	push	4
	push	1
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
   ;	
   ;	        a->flag_3 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	and	byte ptr es:[bx+82],247
   ;	
   ;	        a->field_36 = 0x0F;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+54],15
   ;	
   ;	        a->state = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+61],0
   ;	
   ;	        a->counter_24 = 0x64;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+34],100
@42@282:
   ;	
   ;	    }
   ;	}
   ;	
	pop	bp
	ret	
@do_tentacle$qn7m_actor	endp
   ;	
   ;	void far do_shark(m_actor far *a)
   ;	
	assume	cs:CREATURE_TEXT
@do_shark$qn7m_actor	proc	far
	enter	2,0
   ;	
   ;	{
   ;	    byte hit;
   ;	
   ;	    if (a->state == 2) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+61],2
	jne	short @43@86
   ;	
   ;	        check_flying_death(a);
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @check_flying_death$qn7m_actor
	add	sp,4
   ;	
   ;	        return;
   ;	
	jmp	@43@1122
@43@86:
   ;	
   ;	    }
   ;	    if (!a->in_window && !a->door_open)
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,1
	and	ax,1
	or	ax,ax
	jne	short @43@142
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,6
	and	ax,1
	or	ax,ax
	jne short	@@51
	jmp	@43@1122
@@51:
@43@142:
   ;	
   ;	        return;
   ;	    if (!a->door_open) {                    /* first sight — wake & swim */
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,6
	and	ax,1
	or	ax,ax
	jne	short @43@282
   ;	
   ;	        a->door_open = 1;
   ;	
	les	bx,dword ptr [bp+6]
	or	byte ptr es:[bx+82],64
   ;	
   ;	        a->set_cycle(8, 1);
   ;	
	push	1
	push	8
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
   ;	
   ;	        a->x_speed = (a->direction == 1) ? -1 : 1;
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+52],1
	jne	short @43@226
	mov	ax,-1
	jmp	short @43@254
@43@226:
	mov	ax,1
@43@254:
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+20],ax
@43@282:
   ;	
   ;	    }
   ;	    if (a->flag_7 == 1) {                    /* in a lunge */
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,7
	and	ax,1
	cmp	ax,1
	je short	@@52
	jmp	@43@786
@@52:
   ;	
   ;	        if (a->counter_24 != 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+34],0
	jne short	@@53
	jmp	@43@534
@@53:
   ;	
   ;	            if (a->counter_26 != 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+36],0
	je	short @43@394
   ;	
   ;	                a->counter_26--;
   ;	
	les	bx,dword ptr [bp+6]
	dec	word ptr es:[bx+36]
   ;	
   ;	            } else if (touching(a, cur_sub)) {
   ;	
	jmp	short @43@450
@43@394:
	push	word ptr DGROUP:_cur_sub+2
	push	word ptr DGROUP:_cur_sub
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @touching$qn7m_actort1
	add	sp,8
	or	al,al
	je	short @43@450
   ;	
   ;	                the_game->play_sound((uchar *)"pirana", 8);
   ;	
	push	8
	push	ds
	push	offset DGROUP:s@+261
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_sound$qnucuc
	add	sp,10
   ;	
   ;	                hit_cur_sub(0x0F, a->x_speed / 2);
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+20]
	cwd	
	sub	ax,dx
	sar	ax,1
	push	ax
	push	15
	push	cs
	call	near ptr @hit_cur_sub$qii
	add	sp,4
   ;	
   ;	                a->counter_26 = 3;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+36],3
@43@450:
   ;	
   ;	            }
   ;	            if (--a->counter_24 == 1)
   ;	
	les	bx,dword ptr [bp+6]
	dec	word ptr es:[bx+34]
	mov	ax,word ptr es:[bx+34]
	cmp	ax,1
	je short	@@54
	jmp	@43@898
@@54:
   ;	
   ;	                goto end_lunge;
   ;	
	jmp	short @43@730
   ;	
   ;	            goto check_hit;
   ;	
	jmp	@43@898
@43@534:
   ;	
   ;	        }
   ;	        /* cruising — lunge when lined up with the sub */
   ;	        if (a->facing_actor(cur_sub) &&
   ;	
   ;	
   ;	            (diff_y = abs(a->center_y - cur_sub->center_y)) < 0x1E)
   ;	
	push	word ptr DGROUP:_cur_sub+2
	push	word ptr DGROUP:_cur_sub
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@facing_actor$qn7m_actor
	add	sp,8
	or	al,al
	je	short @43@590
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+10]
	les	bx,dword ptr DGROUP:_cur_sub
	sub	ax,word ptr es:[bx+10]
	push	ax
	call	far ptr @abs$qi
	pop	cx
	mov	word ptr DGROUP:_diff_y,ax
	cmp	ax,30
	jl	short @43@702
@43@590:
   ;	
   ;	            goto lunge;
   ;	        if (random(0x64) == 0)
   ;	
	push	100
	call	far ptr @random$qi
	pop	cx
	or	ax,ax
	je short	@@55
	jmp	@43@898
@@55:
   ;	
   ;	            goto turn;
   ;	
	jmp	short @43@786
   ;	
   ;	        goto check_hit;
   ;	
	jmp	@43@898
   ;	
   ;	    }
   ;	    goto turn;
   ;	
	jmp	short @43@786
@43@702:
   ;	
   ;	lunge:
   ;	    a->x_speed *= 0x0A;
   ;	
	les	bx,dword ptr [bp+6]
	mov	dx,10
	mov	ax,word ptr es:[bx+20]
	imul	dx
	mov	word ptr es:[bx+20],ax
   ;	
   ;	    a->counter_24 = 0x19;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+34],25
   ;	
   ;	    a->set_cycle(1, 1);
   ;	
	push	1
	push	1
	jmp	short @43@758
@43@730:
   ;	
   ;	    return;
   ;	end_lunge:
   ;	    a->x_speed /= 0x0A;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+20]
	mov	bx,10
	cwd	
	idiv	bx
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+20],ax
   ;	
   ;	    a->set_cycle(0x0A, 1);
   ;	
	push	1
	push	10
@43@758:
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
   ;	
   ;	    return;
   ;	
	jmp	@43@1122
@43@786:
   ;	
   ;	turn:
   ;	    a->new_loop(a->direction == 1 ? (uchar *)"sharkr.l" : (uchar *)"sharkl.l");
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+52],1
	jne	short @43@842
	mov	dx,ds
	mov	ax,offset DGROUP:s@+268
	jmp	short @43@870
@43@842:
	mov	dx,ds
	mov	ax,offset DGROUP:s@+277
@43@870:
	push	dx
	push	ax
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@new_loop$qnuc
	add	sp,8
   ;	
   ;	    a->direction ^= 1;
   ;	
	les	bx,dword ptr [bp+6]
	xor	byte ptr es:[bx+52],1
   ;	
   ;	    a->x_speed = -a->x_speed;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+20]
	neg	ax
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+20],ax
   ;	
   ;	    a->flag_7 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	and	byte ptr es:[bx+82],127
   ;	
   ;	    return;
   ;	
	jmp	@43@1122
@43@898:
   ;	
   ;	check_hit:
   ;	    hit = check_for_hit(a, 0x16);
   ;	
	push	22
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @check_for_hit$qn7m_actoruc
	add	sp,6
	mov	byte ptr [bp-1],al
   ;	
   ;	    if (hit == 0)
   ;	
	cmp	byte ptr [bp-1],0
	jne short	@@56
	jmp	@43@1122
@@56:
   ;	
   ;	        return;
   ;	    if (hit == 1) {
   ;	
	cmp	byte ptr [bp-1],1
	jne	short @43@1066
   ;	
   ;	        if (a->facing_actor(cur_sub) && random(4 - shot_size) == 0)
   ;	
	push	word ptr DGROUP:_cur_sub+2
	push	word ptr DGROUP:_cur_sub
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@facing_actor$qn7m_actor
	add	sp,8
	or	al,al
	je	short @43@1122
	mov	al,byte ptr DGROUP:_shot_size
	mov	ah,0
	mov	dx,4
	sub	dx,ax
	push	dx
	call	far ptr @random$qi
	pop	cx
	or	ax,ax
	jne	short @43@1122
   ;	
   ;	            goto turn;
   ;	
	jmp	@43@786
   ;	
   ;	        return;
   ;	
	jmp	short @43@1122
@43@1066:
   ;	
   ;	    }
   ;	    if (hit == 2) {
   ;	
	cmp	byte ptr [bp-1],2
	jne	short @43@1122
   ;	
   ;	        score_at(a->center_x, a->center_y, 0xBB8);
   ;	
	push	3000
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+10]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+8]
	call	far ptr @score_at$qiii
	add	sp,6
   ;	
   ;	        set_flying_death(a, (uchar far *)"sharkdie.l", 2, -9, 4);
   ;	
	push	4
	push	-9
	push	2
	push	ds
	push	offset DGROUP:s@+286
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @set_flying_death$qn7m_actornuciiuc
	add	sp,14
   ;	
   ;	        the_game->play_sound((uchar *)"pirana", 8);
   ;	
	push	8
	push	ds
	push	offset DGROUP:s@+297
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_sound$qnucuc
	add	sp,10
@43@1122:
   ;	
   ;	    }
   ;	}
   ;	
	leave	
	ret	
@do_shark$qn7m_actor	endp
   ;	
   ;	void far do_jelly(m_actor far *a)
   ;	
	assume	cs:CREATURE_TEXT
@do_jelly$qn7m_actor	proc	far
	enter	4,0
   ;	
   ;	{
   ;	    byte hit;
   ;	    int var_2;
   ;	
   ;	    if (a->state == 0) {                    /* rising */
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+61],0
	jne	short @44@282
   ;	
   ;	        if (a->y_speed != 0)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+22],0
	je	short @44@114
   ;	
   ;	            a->y_speed++;
   ;	
	les	bx,dword ptr [bp+6]
	inc	word ptr es:[bx+22]
@44@114:
   ;	
   ;	        if (a->current_loop == 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+60],0
	jne	short @44@170
   ;	
   ;	            a->y_speed = -2;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+22],-2
   ;	
   ;	            a->counter_26++;
   ;	
	les	bx,dword ptr [bp+6]
	inc	word ptr es:[bx+36]
@44@170:
   ;	
   ;	        }
   ;	        if (random(0x12C) == 0)
   ;	
	push	300
	call	far ptr @random$qi
	pop	cx
	or	ax,ax
	jne short	@@57
	jmp	@44@702
@@57:
   ;	
   ;	            goto sink;
   ;	        var_2 = a->map_pos + 1 - word_2BA88[0];
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+24]
	inc	ax
	sub	ax,word ptr DGROUP:_word_2BA88
	mov	word ptr [bp-4],ax
   ;	
   ;	        if (the_map->tile_attr[var_2].attr > 0x100)
   ;	
	les	bx,dword ptr DGROUP:_the_map
	les	bx,dword ptr es:[bx+926]
	mov	ax,word ptr [bp-4]
	shl	ax,2
	add	bx,ax
	cmp	word ptr es:[bx],256
	ja short	@@58
	jmp	@44@702
@@58:
   ;	
   ;	            goto common;
   ;	
	jmp	short @44@394
   ;	
   ;	        goto sink;
   ;	
	jmp	@44@702
@44@282:
   ;	
   ;	    }
   ;	    /* state 3 — sinking */
   ;	    if (a->current_loop == 1)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+60],1
	jne	short @44@338
   ;	
   ;	        a->set_cycle(0, 0);
   ;	
	push	0
	push	0
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
@44@338:
   ;	
   ;	    var_2 = a->map_pos + tbl_mul_tw[a->field_1C] + 1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+24]
	les	bx,dword ptr [bp+6]
	mov	bx,word ptr es:[bx+28]
	shl	bx,1
	add	ax,word ptr DGROUP:_tbl_mul_tw[bx]
	inc	ax
	mov	word ptr [bp-4],ax
   ;	
   ;	    if (the_map->tile_attr[var_2].attr < 0x100)
   ;	
	les	bx,dword ptr DGROUP:_the_map
	les	bx,dword ptr es:[bx+926]
	mov	ax,word ptr [bp-4]
	shl	ax,2
	add	bx,ax
	cmp	word ptr es:[bx],256
	jae short	@@59
	jmp	@44@730
@@59:
   ;	
   ;	        goto floor;
   ;	    if (random(0x12C) == 0)
   ;	
	push	300
	call	far ptr @random$qi
	pop	cx
	or	ax,ax
	jne short	@@60
	jmp	@44@730
@@60:
@44@394:
   ;	
   ;	        goto floor;
   ;	common:
   ;	    if (a->in_window) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,1
	and	ax,1
	or	ax,ax
	jne short	@@61
	jmp	@44@758
@@61:
   ;	
   ;	        if (a->counter_24 != 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+34],0
	je	short @44@478
   ;	
   ;	            a->counter_24--;
   ;	
	les	bx,dword ptr [bp+6]
	dec	word ptr es:[bx+34]
   ;	
   ;	        } else if (touching(a, cur_sub)) {
   ;	
	jmp	short @44@534
@44@478:
	push	word ptr DGROUP:_cur_sub+2
	push	word ptr DGROUP:_cur_sub
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @touching$qn7m_actort1
	add	sp,8
	or	al,al
	je	short @44@534
   ;	
   ;	            a->counter_24 = 0x0A;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+34],10
   ;	
   ;	            hit_cur_sub(0x0A, 0);
   ;	
	push	0
	push	10
	push	cs
	call	near ptr @hit_cur_sub$qii
	add	sp,4
@44@534:
   ;	
   ;	        }
   ;	        hit = check_for_hit(a, 2);
   ;	
	push	2
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @check_for_hit$qn7m_actoruc
	add	sp,6
	mov	byte ptr [bp-1],al
   ;	
   ;	        if (hit != 0) {
   ;	
	cmp	byte ptr [bp-1],0
	je	short @44@758
   ;	
   ;	            if (hit == 2) {
   ;	
	cmp	byte ptr [bp-1],2
	jne	short @44@618
   ;	
   ;	                score_at(a->center_x, a->center_y, 0x1F4);
   ;	
	push	500
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+10]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+8]
	call	far ptr @score_at$qiii
	add	sp,6
   ;	
   ;	                enemies_killed++;
   ;	
	inc	byte ptr DGROUP:_enemies_killed
   ;	
   ;	            } else if (a->state == 3) {
   ;	
	jmp	short @44@758
@44@618:
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+61],3
	jne	short @44@758
   ;	
   ;	                goto floor;
   ;	
	jmp	short @44@730
   ;	
   ;	            }
   ;	        }
   ;	    }
   ;	    return;
   ;	
	jmp	short @44@758
@44@702:
   ;	
   ;	sink:
   ;	    a->state = 3;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+61],3
   ;	
   ;	    a->y_speed = 1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+22],1
   ;	
   ;	    return;
   ;	
	jmp	short @44@758
@44@730:
   ;	
   ;	floor:
   ;	    a->state = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+61],0
   ;	
   ;	    a->y_speed = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+22],0
   ;	
   ;	    a->set_cycle(random(2) + 4, 1);
   ;	
	push	1
	push	2
	call	far ptr @random$qi
	pop	cx
	add	al,4
	push	ax
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
@44@758:
   ;	
   ;	}
   ;	
	leave	
	ret	
@do_jelly$qn7m_actor	endp
   ;	
   ;	void far do_crab(m_actor far *a)
   ;	
	assume	cs:CREATURE_TEXT
@do_crab$qn7m_actor	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (a->state == 2) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+61],2
	jne	short @45@86
   ;	
   ;	        check_flying_death(a);
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @check_flying_death$qn7m_actor
	add	sp,4
   ;	
   ;	        return;
   ;	
	jmp	@45@478
@45@86:
   ;	
   ;	    }
   ;	    if (!a->in_window)
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,1
	and	ax,1
	or	ax,ax
	jne short	@@62
	jmp	@45@478
@@62:
   ;	
   ;	        return;
   ;	    if (a->door_open) {                     /* bumped an edge — reverse */
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,6
	and	ax,1
	or	ax,ax
	je	short @45@170
   ;	
   ;	        a->x_speed = -a->x_speed;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+20]
	neg	ax
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+20],ax
   ;	
   ;	        a->door_open = 0;
   ;	
	les	bx,dword ptr [bp+6]
	and	byte ptr es:[bx+82],191
@45@170:
   ;	
   ;	    }
   ;	    if (random(0x3C) == 0)
   ;	
	push	60
	call	far ptr @random$qi
	pop	cx
	or	ax,ax
	jne	short @45@226
   ;	
   ;	        a->x_speed = -a->x_speed;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+20]
	neg	ax
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+20],ax
@45@226:
   ;	
   ;	    if (a->counter_24 != 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+34],0
	je	short @45@282
   ;	
   ;	        a->counter_24--;
   ;	
	les	bx,dword ptr [bp+6]
	dec	word ptr es:[bx+34]
   ;	
   ;	    } else {
   ;	
	jmp	short @45@422
@45@282:
   ;	
   ;	        diff_y = abs(a->center_y - cur_sub->center_y);
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+10]
	les	bx,dword ptr DGROUP:_cur_sub
	sub	ax,word ptr es:[bx+10]
	push	ax
	call	far ptr @abs$qi
	pop	cx
	mov	word ptr DGROUP:_diff_y,ax
   ;	
   ;	        if (diff_y < 0x41) {
   ;	
	cmp	word ptr DGROUP:_diff_y,65
	jge	short @45@422
   ;	
   ;	            a->direction = (a->x < cur_sub->x) ? 0 : 1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx]
	les	bx,dword ptr DGROUP:_cur_sub
	cmp	ax,word ptr es:[bx]
	jge	short @45@366
	mov	al,0
	jmp	short @45@394
@45@366:
	mov	al,1
@45@394:
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+52],al
   ;	
   ;	            add_missile(a, 9, 1);
   ;	
	push	1
	push	9
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @add_missile$qn7m_actoruci
	add	sp,8
   ;	
   ;	            a->counter_24 = 0x19;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+34],25
   ;	
   ;	            return;
   ;	
	jmp	short @45@478
@45@422:
   ;	
   ;	        }
   ;	    }
   ;	    if (check_for_hit(a, 4) == 2) {
   ;	
	push	4
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @check_for_hit$qn7m_actoruc
	add	sp,6
	cmp	al,2
	jne	short @45@478
   ;	
   ;	        score_at(a->center_x, a->center_y, 0x3E8);
   ;	
	push	1000
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+10]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+8]
	call	far ptr @score_at$qiii
	add	sp,6
   ;	
   ;	        set_flying_death(a, (uchar far *)"crabdie.l", 6, -6, 4);
   ;	
	push	4
	push	-6
	push	6
	push	ds
	push	offset DGROUP:s@+304
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @set_flying_death$qn7m_actornuciiuc
	add	sp,14
   ;	
   ;	        the_game->play_sound((uchar *)"pirana", 8);
   ;	
	push	8
	push	ds
	push	offset DGROUP:s@+314
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_sound$qnucuc
	add	sp,10
@45@478:
   ;	
   ;	    }
   ;	}
   ;	
	pop	bp
	ret	
@do_crab$qn7m_actor	endp
   ;	
   ;	void far do_serpent(m_actor far *a)
   ;	
	assume	cs:CREATURE_TEXT
@do_serpent$qn7m_actor	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (a->state == 2) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+61],2
	jne	short @46@86
   ;	
   ;	        check_flying_death(a);
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @check_flying_death$qn7m_actor
	add	sp,4
   ;	
   ;	        return;
   ;	
	jmp	@46@450
@46@86:
   ;	
   ;	    }
   ;	    if (!a->in_window)
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,1
	and	ax,1
	or	ax,ax
	jne short	@@63
	jmp	@46@450
@@63:
   ;	
   ;	        return;
   ;	    if (a->door_open) {                     /* reached an edge — turn around */
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,6
	and	ax,1
	or	ax,ax
	je	short @46@254
   ;	
   ;	        a->new_loop(a->direction == 0 ? (uchar *)"serp_l.l" : (uchar *)"serp_r.l");
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+52],0
	jne	short @46@198
	mov	dx,ds
	mov	ax,offset DGROUP:s@+321
	jmp	short @46@226
@46@198:
	mov	dx,ds
	mov	ax,offset DGROUP:s@+330
@46@226:
	push	dx
	push	ax
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@new_loop$qnuc
	add	sp,8
   ;	
   ;	        a->door_open = 0;
   ;	
	les	bx,dword ptr [bp+6]
	and	byte ptr es:[bx+82],191
   ;	
   ;	        a->direction ^= 1;
   ;	
	les	bx,dword ptr [bp+6]
	xor	byte ptr es:[bx+52],1
   ;	
   ;	        a->x_speed = -a->x_speed;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+20]
	neg	ax
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+20],ax
   ;	
   ;	        return;
   ;	
	jmp	@46@450
@46@254:
   ;	
   ;	    }
   ;	    if (a->counter_24 != 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+34],0
	je	short @46@310
   ;	
   ;	        a->counter_24--;
   ;	
	les	bx,dword ptr [bp+6]
	dec	word ptr es:[bx+34]
   ;	
   ;	    } else {
   ;	
	jmp	short @46@394
@46@310:
   ;	
   ;	        diff_y = abs(a->center_y - cur_sub->center_y);
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+10]
	les	bx,dword ptr DGROUP:_cur_sub
	sub	ax,word ptr es:[bx+10]
	push	ax
	call	far ptr @abs$qi
	pop	cx
	mov	word ptr DGROUP:_diff_y,ax
   ;	
   ;	        if (diff_y < 0x1E && a->facing_actor(cur_sub)) {
   ;	
	cmp	word ptr DGROUP:_diff_y,30
	jge	short @46@394
	push	word ptr DGROUP:_cur_sub+2
	push	word ptr DGROUP:_cur_sub
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@facing_actor$qn7m_actor
	add	sp,8
	or	al,al
	je	short @46@394
   ;	
   ;	            add_missile(a, 7, 4);
   ;	
	push	4
	push	7
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @add_missile$qn7m_actoruci
	add	sp,8
   ;	
   ;	            a->counter_24 = 0x0F;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+34],15
   ;	
   ;	            return;
   ;	
	jmp	short @46@450
@46@394:
   ;	
   ;	        }
   ;	    }
   ;	    if (check_for_hit(a, 3) == 2) {
   ;	
	push	3
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @check_for_hit$qn7m_actoruc
	add	sp,6
	cmp	al,2
	jne	short @46@450
   ;	
   ;	        score_at(a->center_x, a->center_y, 0x1F4);
   ;	
	push	500
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+10]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+8]
	call	far ptr @score_at$qiii
	add	sp,6
   ;	
   ;	        set_flying_death(a, (uchar far *)"serpdie.l", 2, -8, 1);
   ;	
	push	1
	push	-8
	push	2
	push	ds
	push	offset DGROUP:s@+339
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @set_flying_death$qn7m_actornuciiuc
	add	sp,14
@46@450:
   ;	
   ;	    }
   ;	}
   ;	
	pop	bp
	ret	
@do_serpent$qn7m_actor	endp
   ;	
   ;	void far do_face(m_actor far *a)
   ;	
	assume	cs:CREATURE_TEXT
@do_face$qn7m_actor	proc	far
	enter	2,0
   ;	
   ;	{
   ;	    int var_2;
   ;	
   ;	    if (!a->in_window)
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,1
	and	ax,1
	or	ax,ax
	jne short	@@64
	jmp	@47@394
@@64:
   ;	
   ;	        return;
   ;	    if (a->flag_3) {                        /* took a hit */
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,3
	and	ax,1
	or	ax,ax
	je	short @47@170
   ;	
   ;	        if (a->field_28 >= 0x0A) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+40],10
	jl	short @47@142
   ;	
   ;	            score_at(a->center_x, a->center_y, 0x3E8);
   ;	
	push	1000
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+10]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+8]
	call	far ptr @score_at$qiii
	add	sp,6
   ;	
   ;	            add_explosion(a->center_x, a->center_y, 2, (uchar far *)NULL);
   ;	
	push	0
	push	0
	push	2
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+10]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+8]
	call	far ptr @add_explosion$qiiucnuc
	add	sp,10
   ;	
   ;	            a->flag_0 = 1;
   ;	
	les	bx,dword ptr [bp+6]
	or	byte ptr es:[bx+82],1
   ;	
   ;	            enemies_killed++;
   ;	
	inc	byte ptr DGROUP:_enemies_killed
@47@142:
   ;	
   ;	        }
   ;	        a->flag_3 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	and	byte ptr es:[bx+82],247
   ;	
   ;	        a->field_36 = 0x0F;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+54],15
@47@170:
   ;	
   ;	    }
   ;	    if (a->counter_24 != 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+34],0
	je	short @47@310
   ;	
   ;	        a->counter_24--;
   ;	
	les	bx,dword ptr [bp+6]
	dec	word ptr es:[bx+34]
   ;	
   ;	        if (!a->door_open && a->current_loop == 1) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,6
	and	ax,1
	or	ax,ax
	je short	@@65
	jmp	@47@394
@@65:
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+60],1
	je short	@@66
	jmp	@47@394
@@66:
   ;	
   ;	            add_missile(a, 8, 0x0C);
   ;	
	push	12
	push	8
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @add_missile$qn7m_actoruci
	add	sp,8
   ;	
   ;	            a->door_open = 1;
   ;	
	les	bx,dword ptr [bp+6]
	or	byte ptr es:[bx+82],64
	jmp	short @47@394
   ;	
   ;	        }
   ;	        return;
   ;	
	jmp	short @47@394
@47@310:
   ;	
   ;	    }
   ;	    var_2 = abs(a->center_y - cur_sub->center_y);
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+10]
	les	bx,dword ptr DGROUP:_cur_sub
	sub	ax,word ptr es:[bx+10]
	push	ax
	call	far ptr @abs$qi
	pop	cx
	mov	word ptr [bp-2],ax
   ;	
   ;	    if (var_2 < 0x23 && a->facing_actor(cur_sub)) {
   ;	
	cmp	word ptr [bp-2],35
	jge	short @47@394
	push	word ptr DGROUP:_cur_sub+2
	push	word ptr DGROUP:_cur_sub
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@facing_actor$qn7m_actor
	add	sp,8
	or	al,al
	je	short @47@394
   ;	
   ;	        a->door_open = 0;
   ;	
	les	bx,dword ptr [bp+6]
	and	byte ptr es:[bx+82],191
   ;	
   ;	        a->counter_24 = 0x19;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+34],25
   ;	
   ;	        a->set_cycle(4, 3);
   ;	
	push	3
	push	4
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
@47@394:
   ;	
   ;	    }
   ;	}
   ;	
	leave	
	ret	
@do_face$qn7m_actor	endp
   ;	
   ;	void far do_pirana(m_actor far *a)
   ;	
	assume	cs:CREATURE_TEXT
@do_pirana$qn7m_actor	proc	far
	enter	2,0
   ;	
   ;	{
   ;	    byte hit;
   ;	
   ;	    if (!a->in_window) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,1
	and	ax,1
	or	ax,ax
	jne	short @48@114
   ;	
   ;	        if (a->counter_24 != 0)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+34],0
	je short	@@67
	jmp	@48@982
@@67:
   ;	
   ;	            goto reset;                     /* darted off-screen — reset */
   ;	        if (a->flag_7 != 1)
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,7
	and	ax,1
	cmp	ax,1
	je short	@@68
	jmp	@48@1122
@@68:
@48@114:
   ;	
   ;	            return;                          /* hidden & not yet woken */
   ;	    }
   ;	    a->flag_7 = 1;                           /* awake */
   ;	
	les	bx,dword ptr [bp+6]
	or	byte ptr es:[bx+82],128
   ;	
   ;	    if (a->door_open == 1) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,6
	and	ax,1
	cmp	ax,1
	jne	short @48@254
   ;	
   ;	        a->door_open = 0;
   ;	
	les	bx,dword ptr [bp+6]
	and	byte ptr es:[bx+82],191
   ;	
   ;	        a->new_loop(a->direction == 1 ? (uchar *)"piranar.l" : (uchar *)"piranal.l");
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+52],1
	jne	short @48@198
	mov	dx,ds
	mov	ax,offset DGROUP:s@+349
	jmp	short @48@226
@48@198:
	mov	dx,ds
	mov	ax,offset DGROUP:s@+359
@48@226:
	push	dx
	push	ax
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@new_loop$qnuc
	add	sp,8
   ;	
   ;	        a->x_speed = -a->x_speed;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+20]
	neg	ax
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+20],ax
   ;	
   ;	        a->direction ^= 1;
   ;	
	les	bx,dword ptr [bp+6]
	xor	byte ptr es:[bx+52],1
@48@254:
   ;	
   ;	    }
   ;	    hit = check_for_hit(a, 7);
   ;	
	push	7
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @check_for_hit$qn7m_actoruc
	add	sp,6
	mov	byte ptr [bp-1],al
   ;	
   ;	    if (hit != 0) {
   ;	
	cmp	byte ptr [bp-1],0
	je	short @48@422
   ;	
   ;	        if (hit == 1 && a->counter_26 == 0)
   ;	
	cmp	byte ptr [bp-1],1
	jne	short @48@338
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+36],0
	je	short @48@562
@48@338:
   ;	
   ;	            goto dart;
   ;	        if (hit == 2)
   ;	
	cmp	byte ptr [bp-1],2
	jne	short @48@394
   ;	
   ;	            enemies_killed++;
   ;	
	inc	byte ptr DGROUP:_enemies_killed
@48@394:
   ;	
   ;	        score_at(a->center_x, a->center_y, 0x64);
   ;	
	push	100
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+10]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+8]
	call	far ptr @score_at$qiii
	add	sp,6
@48@422:
   ;	
   ;	    }
   ;	    if (a->counter_26 != 0)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+36],0
	jne	short @48@590
   ;	
   ;	        goto track;
   ;	    /* idle — pounce when the sub swims close */
   ;	    diff_x = abs(a->center_x - ego->center_x);
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+8]
	les	bx,dword ptr DGROUP:_ego
	sub	ax,word ptr es:[bx+8]
	push	ax
	call	far ptr @abs$qi
	pop	cx
	mov	word ptr DGROUP:_diff_x,ax
   ;	
   ;	    diff_y = abs(a->center_y - ego->center_y);
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+10]
	les	bx,dword ptr DGROUP:_ego
	sub	ax,word ptr es:[bx+10]
	push	ax
	call	far ptr @abs$qi
	pop	cx
	mov	word ptr DGROUP:_diff_y,ax
   ;	
   ;	    if (diff_x < 0x32 && diff_y < 0x1E)
   ;	
	cmp	word ptr DGROUP:_diff_x,50
	jl short	@@69
	jmp	@48@1122
@@69:
	cmp	word ptr DGROUP:_diff_y,30
	jl short	@@70
	jmp	@48@1122
@@70:
   ;	
   ;	        goto dart;
   ;	
	jmp	short @48@562
   ;	
   ;	    return;
   ;	
	jmp	@48@1122
@48@562:
   ;	
   ;	dart:
   ;	    a->counter_26 = 0x1E;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+36],30
   ;	
   ;	    a->x_speed *= 2;
   ;	
	les	bx,dword ptr [bp+6]
	mov	dx,2
	mov	ax,word ptr es:[bx+20]
	imul	dx
	mov	word ptr es:[bx+20],ax
@48@590:
   ;	
   ;	track:
   ;	    if (a->counter_26-- == 1)
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+36]
	dec	word ptr es:[bx+36]
	cmp	ax,1
	jne short	@@71
	jmp	@48@982
@@71:
   ;	
   ;	        goto reset;
   ;	    if (!a->facing_actor(cur_sub))
   ;	
	push	word ptr DGROUP:_cur_sub+2
	push	word ptr DGROUP:_cur_sub
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@facing_actor$qn7m_actor
	add	sp,8
	mov	ah,0
	or	ax,ax
	jne	short @48@674
   ;	
   ;	        a->door_open = 1;
   ;	
	les	bx,dword ptr [bp+6]
	or	byte ptr es:[bx+82],64
@48@674:
   ;	
   ;	    if (a->y < cur_sub->center_y) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	les	bx,dword ptr DGROUP:_cur_sub
	cmp	ax,word ptr es:[bx+10]
	jge	short @48@786
   ;	
   ;	        if (a->y_speed != 2)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+22],2
	je	short @48@870
   ;	
   ;	            a->y_speed = 2;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+22],2
	jmp	short @48@870
   ;	
   ;	    } else if (a->y > cur_sub->center_y) {
   ;	
	jmp	short @48@870
@48@786:
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	les	bx,dword ptr DGROUP:_cur_sub
	cmp	ax,word ptr es:[bx+10]
	jle	short @48@870
   ;	
   ;	        if (a->y_speed != -2)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+22],-2
	je	short @48@870
   ;	
   ;	            a->y_speed = -2;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+22],-2
@48@870:
   ;	
   ;	    }
   ;	    if ((a->counter_26 & 3) == 0 && touching(a, cur_sub))
   ;	
	les	bx,dword ptr [bp+6]
	test	word ptr es:[bx+36],3
	jne	short @48@1122
	push	word ptr DGROUP:_cur_sub+2
	push	word ptr DGROUP:_cur_sub
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @touching$qn7m_actort1
	add	sp,8
	or	al,al
	je	short @48@1122
   ;	
   ;	        goto bite;
   ;	
	jmp	short @48@1094
   ;	
   ;	    return;
   ;	
	jmp	short @48@1122
@48@982:
   ;	
   ;	reset:
   ;	    a->counter_26 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+36],0
   ;	
   ;	    a->y_speed = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+22],0
   ;	
   ;	    a->x_speed = (a->direction == 0) ? 1 : -1;
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+52],0
	jne	short @48@1038
	mov	ax,1
	jmp	short @48@1066
@48@1038:
	mov	ax,-1
@48@1066:
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+20],ax
   ;	
   ;	    return;
   ;	
	jmp	short @48@1122
@48@1094:
   ;	
   ;	bite:
   ;	    the_game->play_sound((uchar *)"pirana", 8);
   ;	
	push	8
	push	ds
	push	offset DGROUP:s@+369
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_sound$qnucuc
	add	sp,10
   ;	
   ;	    hit_cur_sub(2, 0);
   ;	
	push	0
	push	2
	push	cs
	call	near ptr @hit_cur_sub$qii
	add	sp,4
@48@1122:
   ;	
   ;	}
   ;	
	leave	
	ret	
@do_pirana$qn7m_actor	endp
   ;	
   ;	void far do_tulip(m_actor far *a)
   ;	
	assume	cs:CREATURE_TEXT
@do_tulip$qn7m_actor	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (!a->in_window)
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,1
	and	ax,1
	or	ax,ax
	jne short	@@72
	jmp	@49@814
@@72:
   ;	
   ;	        return;
   ;	    if (a->door_open == 0) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,6
	and	ax,1
	or	ax,ax
	jne	short @49@226
   ;	
   ;	        if (a->health != 0) {               /* closed — count down to reopen */
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+38],0
	je	short @49@198
   ;	
   ;	            if (a->frame == 0)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+56],0
	je short	@@73
	jmp	@49@814
@@73:
   ;	
   ;	                a->health--;
   ;	
	les	bx,dword ptr [bp+6]
	dec	word ptr es:[bx+38]
	jmp	@49@814
   ;	
   ;	            return;
   ;	
	jmp	@49@814
@49@198:
   ;	
   ;	        }
   ;	        a->door_open = 1;                    /* begin opening */
   ;	
	les	bx,dword ptr [bp+6]
	or	byte ptr es:[bx+82],64
   ;	
   ;	        a->set_cycle(3, 4);
   ;	
	push	4
	push	3
	jmp	@49@646
@49@226:
   ;	
   ;	        return;
   ;	    }
   ;	    if (a->flag_7 == 0) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,7
	and	ax,1
	or	ax,ax
	jne	short @49@338
   ;	
   ;	        /* opening anim — armed once it reaches the last frame */
   ;	        if (a->current_loop == a->num_frames - 1) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+60]
	mov	ah,0
	les	bx,dword ptr [bp+6]
	mov	dl,byte ptr es:[bx+59]
	mov	dh,0
	dec	dx
	cmp	ax,dx
	je short	@@74
	jmp	@49@674
@@74:
   ;	
   ;	            a->flag_7 = 1;
   ;	
	les	bx,dword ptr [bp+6]
	or	byte ptr es:[bx+82],128
   ;	
   ;	            a->direction = 0x63;             /* "not yet facing" sentinel */
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+52],99
	jmp	@49@674
   ;	
   ;	        }
   ;	        goto hits;
   ;	
	jmp	@49@674
@49@338:
   ;	
   ;	    }
   ;	    /* open & tracking — face the sub */
   ;	    if (cur_sub->x < a->x && a->direction != 1) {
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	mov	ax,word ptr es:[bx]
	les	bx,dword ptr [bp+6]
	cmp	ax,word ptr es:[bx]
	jge	short @49@450
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+52],1
	je	short @49@450
   ;	
   ;	        a->type = 1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+53],1
   ;	
   ;	        a->direction = 1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+52],1
   ;	
   ;	        a->new_loop((uchar *)"tulipl.l");
   ;	
	push	ds
	push	offset DGROUP:s@+376
@49@422:
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@new_loop$qnuc
	add	sp,8
	jmp	short @49@618
@49@450:
   ;	
   ;	        goto fire;
   ;	    }
   ;	    if (cur_sub->x > a->x && a->direction != 0) {
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	mov	ax,word ptr es:[bx]
	les	bx,dword ptr [bp+6]
	cmp	ax,word ptr es:[bx]
	jle	short @49@534
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+52],0
	je	short @49@534
   ;	
   ;	        a->type = 1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+53],1
   ;	
   ;	        a->direction = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+52],0
   ;	
   ;	        a->new_loop((uchar *)"tulipr.l");
   ;	
	push	ds
	push	offset DGROUP:s@+385
	jmp	short @49@422
@49@534:
   ;	
   ;	        goto fire;
   ;	    }
   ;	    if (a->counter_24++ == a->counter_26)
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+34]
	inc	word ptr es:[bx+34]
	les	bx,dword ptr [bp+6]
	cmp	ax,word ptr es:[bx+36]
	jne	short @49@674
   ;	
   ;	        goto fire;
   ;	
	jmp	short @49@618
   ;	
   ;	    goto hits;
   ;	
	jmp	short @49@674
@49@618:
   ;	
   ;	fire:
   ;	    a->counter_24 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+34],0
   ;	
   ;	    add_missile(a, 6, 6);
   ;	
	push	6
	push	6
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @add_missile$qn7m_actoruci
	add	sp,8
   ;	
   ;	    a->set_cycle(0, 3);
   ;	
	push	3
	push	0
@49@646:
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
   ;	
   ;	    return;
   ;	
	jmp	@49@814
@49@674:
   ;	
   ;	hits:
   ;	    if (a->flag_3) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,3
	and	ax,1
	or	ax,ax
	jne short	@@75
	jmp	@49@814
@@75:
   ;	
   ;	        a->flag_3 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	and	byte ptr es:[bx+82],247
   ;	
   ;	        a->field_36 = 0x0F;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+54],15
   ;	
   ;	        if (a->field_28 >= 3) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+40],3
	jge short	@@76
	jmp	@49@814
@@76:
   ;	
   ;	            score_at(a->center_x, a->center_y, 0x1F4);
   ;	
	push	500
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+10]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+8]
	call	far ptr @score_at$qiii
	add	sp,6
   ;	
   ;	            if (a->field_28 >= 5) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+40],5
	jl	short @49@786
   ;	
   ;	                a->flag_0 = 1;
   ;	
	les	bx,dword ptr [bp+6]
	or	byte ptr es:[bx+82],1
   ;	
   ;	                enemies_killed++;
   ;	
	inc	byte ptr DGROUP:_enemies_killed
   ;	
   ;	            } else {
   ;	
	jmp	short @49@814
@49@786:
   ;	
   ;	                a->field_28 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+40],0
   ;	
   ;	                a->new_loop((uchar *)"tulip.l");
   ;	
	push	ds
	push	offset DGROUP:s@+394
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@new_loop$qnuc
	add	sp,8
   ;	
   ;	                a->set_cycle(1, 5);
   ;	
	push	5
	push	1
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
   ;	
   ;	                a->type = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+53],0
   ;	
   ;	                a->health = 0x64;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+38],100
   ;	
   ;	                a->flag_7 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	and	byte ptr es:[bx+82],127
   ;	
   ;	                a->door_open = 0;
   ;	
	les	bx,dword ptr [bp+6]
	and	byte ptr es:[bx+82],191
@49@814:
   ;	
   ;	            }
   ;	        }
   ;	    }
   ;	}
   ;	
	pop	bp
	ret	
@do_tulip$qn7m_actor	endp
   ;	
   ;	void far do_pod(m_actor far *a)
   ;	
	assume	cs:CREATURE_TEXT
@do_pod$qn7m_actor	proc	far
	enter	2,0
   ;	
   ;	{
   ;	    byte var_1;
   ;	
   ;	    if (a->flag_7 != 1) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,7
	and	ax,1
	cmp	ax,1
	jne short	@@77
	jmp	@50@310
@@77:
   ;	
   ;	        /* falling — settle once it grounds */
   ;	        if (a->on_tile(0x100))
   ;	
	push	256
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@on_tile$qi
	add	sp,6
	or	al,al
	je	short @50@114
   ;	
   ;	            a->y_speed -= a->y_speed;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+22]
	les	bx,dword ptr [bp+6]
	sub	word ptr es:[bx+22],ax
@50@114:
   ;	
   ;	        if (a->counter_26++ < 0x0A) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+36]
	inc	word ptr es:[bx+36]
	cmp	ax,10
	jge	short @50@282
   ;	
   ;	            if (a->door_open == 1) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,6
	and	ax,1
	cmp	ax,1
	je short	@@78
	jmp	@50@814
@@78:
   ;	
   ;	                a->x_speed = -a->x_speed;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+20]
	neg	ax
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+20],ax
   ;	
   ;	                if (random(2) == 0)
   ;	
	push	2
	call	far ptr @random$qi
	pop	cx
	or	ax,ax
	jne	short @50@226
   ;	
   ;	                    a->y_speed = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+22],0
@50@226:
   ;	
   ;	                a->door_open = 0;
   ;	
	les	bx,dword ptr [bp+6]
	and	byte ptr es:[bx+82],191
   ;	
   ;	                a->counter_26 = random(5);
   ;	
	push	5
	call	far ptr @random$qi
	pop	cx
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+36],ax
	jmp	@50@814
   ;	
   ;	            }
   ;	            goto hitblock;
   ;	
	jmp	@50@814
@50@282:
   ;	
   ;	        }
   ;	        a->flag_7 = 1;                        /* settled — start homing */
   ;	
	les	bx,dword ptr [bp+6]
	or	byte ptr es:[bx+82],128
@50@310:
   ;	
   ;	    }
   ;	    if (!a->in_window)
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,1
	and	ax,1
	or	ax,ax
	jne short	@@79
	jmp	@50@1094
@@79:
   ;	
   ;	        return;
   ;	    a->flag_7 = 1;
   ;	
	les	bx,dword ptr [bp+6]
	or	byte ptr es:[bx+82],128
   ;	
   ;	    /* steer toward the sub */
   ;	    diff_x = abs(a->center_x - cur_sub->center_x);
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+8]
	les	bx,dword ptr DGROUP:_cur_sub
	sub	ax,word ptr es:[bx+8]
	push	ax
	call	far ptr @abs$qi
	pop	cx
	mov	word ptr DGROUP:_diff_x,ax
   ;	
   ;	    diff_y = abs(a->center_y - cur_sub->center_y);
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+10]
	les	bx,dword ptr DGROUP:_cur_sub
	sub	ax,word ptr es:[bx+10]
	push	ax
	call	far ptr @abs$qi
	pop	cx
	mov	word ptr DGROUP:_diff_y,ax
   ;	
   ;	    a->counter_26 = random(5);
   ;	
	push	5
	call	far ptr @random$qi
	pop	cx
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+36],ax
   ;	
   ;	    if (diff_y < 0x0F && diff_x < 0x5A && a->x_speed != 0) {
   ;	
	cmp	word ptr DGROUP:_diff_y,15
	jge	short @50@450
	cmp	word ptr DGROUP:_diff_x,90
	jge	short @50@450
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+20],0
	je	short @50@450
   ;	
   ;	        a->y_speed = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+22],0
   ;	
   ;	    } else {
   ;	
	jmp	short @50@562
@50@450:
   ;	
   ;	        a->y_speed = (cur_sub->center_y < a->center_y)
   ;	
   ;	
   ;	                        ? -(a->health + 1) : (a->health + 1);
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	mov	ax,word ptr es:[bx+10]
	les	bx,dword ptr [bp+6]
	cmp	ax,word ptr es:[bx+10]
	jge	short @50@506
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+38]
	inc	ax
	neg	ax
	jmp	short @50@534
@50@506:
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+38]
	inc	ax
@50@534:
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+22],ax
@50@562:
   ;	
   ;	    }
   ;	    if (diff_x < 0x1E && diff_y < 0x3C && a->y_speed != 0) {
   ;	
	cmp	word ptr DGROUP:_diff_x,30
	jge	short @50@674
	cmp	word ptr DGROUP:_diff_y,60
	jge	short @50@674
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+22],0
	je	short @50@674
   ;	
   ;	        a->x_speed = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+20],0
   ;	
   ;	    } else {
   ;	
	jmp	@50@1094
@50@674:
   ;	
   ;	        a->x_speed = (cur_sub->center_x < a->center_x)
   ;	
   ;	
   ;	                        ? -(a->health + 1) : (a->health + 1);
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	mov	ax,word ptr es:[bx+8]
	les	bx,dword ptr [bp+6]
	cmp	ax,word ptr es:[bx+8]
	jge	short @50@730
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+38]
	inc	ax
	neg	ax
	jmp	short @50@758
@50@730:
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+38]
	inc	ax
@50@758:
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+20],ax
	jmp	@50@1094
   ;	
   ;	    }
   ;	    return;
   ;	
	jmp	@50@1094
@50@814:
   ;	
   ;	hitblock:
   ;	    if (a->in_window) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,1
	and	ax,1
	or	ax,ax
	jne short	@@80
	jmp	@50@1094
@@80:
   ;	
   ;	        var_1 = (a->health != 0) ? 4 : 2;
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+38],0
	je	short @50@898
	mov	al,4
	jmp	short @50@926
@50@898:
	mov	al,2
@50@926:
	mov	byte ptr [bp-1],al
   ;	
   ;	        if (check_for_hit(a, var_1) == 2) {
   ;	
	mov	al,byte ptr [bp-1]
	push	ax
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @check_for_hit$qn7m_actoruc
	add	sp,6
	cmp	al,2
	jne	short @50@982
   ;	
   ;	            score_at(a->center_x, a->center_y, 0x1F4);
   ;	
	push	500
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+10]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+8]
	call	far ptr @score_at$qiii
	add	sp,6
	jmp	short @50@1066
@50@982:
   ;	
   ;	            goto die;
   ;	        }
   ;	        if (touching(a, cur_sub)) {
   ;	
	push	word ptr DGROUP:_cur_sub+2
	push	word ptr DGROUP:_cur_sub
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @touching$qn7m_actort1
	add	sp,8
	or	al,al
	je	short @50@1094
   ;	
   ;	            hit_cur_sub(0x19, a->x_speed);
   ;	
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+20]
	push	25
	push	cs
	call	near ptr @hit_cur_sub$qii
	add	sp,4
	jmp	short @50@1066
   ;	
   ;	            goto die;
   ;	        }
   ;	    }
   ;	    return;
   ;	
	jmp	short @50@1094
@50@1066:
   ;	
   ;	die:
   ;	    a->flag_0 = 1;
   ;	
	les	bx,dword ptr [bp+6]
	or	byte ptr es:[bx+82],1
   ;	
   ;	    add_explosion(a->x, a->y, 1, (uchar far *)NULL);
   ;	
	push	0
	push	0
	push	1
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx]
	call	far ptr @add_explosion$qiiucnuc
	add	sp,10
   ;	
   ;	    enemies_killed++;
   ;	
	inc	byte ptr DGROUP:_enemies_killed
@50@1094:
   ;	
   ;	}
   ;	
	leave	
	ret	
@do_pod$qn7m_actor	endp
   ;	
   ;	void far do_zapper(m_actor far *a)
   ;	
	assume	cs:CREATURE_TEXT
@do_zapper$qn7m_actor	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (a->counter_24++ == a->counter_26) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+34]
	inc	word ptr es:[bx+34]
	les	bx,dword ptr [bp+6]
	cmp	ax,word ptr es:[bx+36]
	jne	short @51@86
   ;	
   ;	        a->counter_24 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+34],0
   ;	
   ;	        a->set_cycle(0, 3);
   ;	
	push	3
	push	0
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
@51@86:
   ;	
   ;	    }
   ;	    if (a->in_window && a->frame != 0) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,1
	and	ax,1
	or	ax,ax
	je	short @51@254
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+56],0
	je	short @51@254
   ;	
   ;	        if (a->counter_24 == 2)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+34],2
	jne	short @51@198
   ;	
   ;	            the_game->play_sound((uchar *)"zap", 8);
   ;	
	push	8
	push	ds
	push	offset DGROUP:s@+402
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_sound$qnucuc
	add	sp,10
@51@198:
   ;	
   ;	        if (touching(a, cur_sub))
   ;	
	push	word ptr DGROUP:_cur_sub+2
	push	word ptr DGROUP:_cur_sub
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @touching$qn7m_actort1
	add	sp,8
	or	al,al
	je	short @51@254
   ;	
   ;	            hit_cur_sub(8, 0);
   ;	
	push	0
	push	8
	push	cs
	call	near ptr @hit_cur_sub$qii
	add	sp,4
@51@254:
   ;	
   ;	    }
   ;	}
   ;	
	pop	bp
	ret	
@do_zapper$qn7m_actor	endp
   ;	
   ;	void far do_mine1(m_actor far *a)
   ;	
	assume	cs:CREATURE_TEXT
@do_mine1$qn7m_actor	proc	far
	enter	4,0
   ;	
   ;	{
   ;	    byte var_1;
   ;	    int var_4;
   ;	
   ;	    if (!a->in_window)
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,1
	and	ax,1
	or	ax,ax
	jne short	@@81
	jmp	@52@338
@@81:
   ;	
   ;	        return;
   ;	    if (a->flag_3 == 0) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,3
	and	ax,1
	or	ax,ax
	je short	@@82
	jmp	@52@254
@@82:
   ;	
   ;	        if (a->current_loop != 2) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+60],2
	je	short @52@170
   ;	
   ;	            var_4 = abs(a->center_x - cur_sub->center_x);
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+8]
	les	bx,dword ptr DGROUP:_cur_sub
	sub	ax,word ptr es:[bx+8]
	push	ax
	call	far ptr @abs$qi
	pop	cx
	mov	word ptr [bp-4],ax
   ;	
   ;	            if (var_4 < 0x23 && ego->y < a->y)
   ;	
	cmp	word ptr [bp-4],35
	jge	short @52@170
	les	bx,dword ptr DGROUP:_ego
	mov	ax,word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	cmp	ax,word ptr es:[bx+2]
	jl	short @52@254
@52@170:
   ;	
   ;	                goto release;
   ;	        }
   ;	        if (touching(a, cur_sub)) {
   ;	
	push	word ptr DGROUP:_cur_sub+2
	push	word ptr DGROUP:_cur_sub
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @touching$qn7m_actort1
	add	sp,8
	or	al,al
	jne short	@@83
	jmp	@52@338
@@83:
   ;	
   ;	            hit_cur_sub(2, 0);
   ;	
	push	0
	push	2
	push	cs
	call	near ptr @hit_cur_sub$qii
	add	sp,4
   ;	
   ;	            add_bubble(a->x, a->y, 0);
   ;	
	push	0
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx]
	call	far ptr @add_bubble$qiii
	add	sp,6
	jmp	short @52@254
   ;	
   ;	            goto release;
   ;	        }
   ;	        return;
   ;	
	jmp	@52@338
@52@254:
   ;	
   ;	    }
   ;	release:
   ;	    act = the_cast->add((uchar *)"freemine.l", (void far *)0, (void far *)do_mine2);
   ;	
	push	seg @do_mine2$qn7m_actor
	push	offset @do_mine2$qn7m_actor
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+406
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_act+2,dx
	mov	word ptr DGROUP:_act,ax
   ;	
   ;	    act->type = 1;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	byte ptr es:[bx+53],1
   ;	
   ;	    act->set_xy(a->center_x, a->y);
   ;	
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+8]
	push	word ptr DGROUP:_act+2
	push	word ptr DGROUP:_act
	call	far ptr @m_actor@set_xy$qii
	add	sp,8
   ;	
   ;	    var_1 = act->height;
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	al,byte ptr es:[bx+18]
	mov	byte ptr [bp-1],al
   ;	
   ;	    if (a->door_open == 1)
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,6
	and	ax,1
	cmp	ax,1
	jne	short @52@310
   ;	
   ;	        act->flag_3 = 1;
   ;	
	les	bx,dword ptr DGROUP:_act
	or	byte ptr es:[bx+82],8
@52@310:
   ;	
   ;	    act = the_cast->add((uchar *)"mreal.l", (void far *)0, (void far *)0);
   ;	
	push	0
	push	0
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+417
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_act+2,dx
	mov	word ptr DGROUP:_act,ax
   ;	
   ;	    act->set_xy(a->center_x - act->width / 2, a->y + var_1);
   ;	
	mov	al,byte ptr [bp-1]
	mov	ah,0
	les	bx,dword ptr [bp+6]
	mov	dx,word ptr es:[bx+2]
	add	dx,ax
	push	dx
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+8]
	les	bx,dword ptr DGROUP:_act
	push	ax
	mov	ax,word ptr es:[bx+16]
	cwd	
	sub	ax,dx
	sar	ax,1
	pop	dx
	sub	dx,ax
	push	dx
	push	word ptr DGROUP:_act+2
	push	word ptr DGROUP:_act
	call	far ptr @m_actor@set_xy$qii
	add	sp,8
   ;	
   ;	    act->set_cycle(5, 2);
   ;	
	push	2
	push	5
	push	word ptr DGROUP:_act+2
	push	word ptr DGROUP:_act
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
   ;	
   ;	    a->flag_0 = 1;
   ;	
	les	bx,dword ptr [bp+6]
	or	byte ptr es:[bx+82],1
@52@338:
   ;	
   ;	}
   ;	
	leave	
	ret	
@do_mine1$qn7m_actor	endp
   ;	
   ;	void far do_mine2(m_actor far *a)
   ;	
	assume	cs:CREATURE_TEXT
@do_mine2$qn7m_actor	proc	far
	enter	2,0
   ;	
   ;	{
   ;	    byte var_1 = 0;
   ;	
	mov	byte ptr [bp-1],0
   ;	
   ;	
   ;	    if (!a->in_window)
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,1
	and	ax,1
	or	ax,ax
	jne short	@@84
	jmp	@53@422
@@84:
   ;	
   ;	        goto die;
   ;	    if (a->flag_3 == 1) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,3
	and	ax,1
	cmp	ax,1
	jne	short @53@114
   ;	
   ;	        score_at(a->center_x, a->center_y, 0x1F4);
   ;	
	push	500
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+10]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+8]
	call	far ptr @score_at$qiii
	add	sp,6
	jmp	short @53@310
@53@114:
   ;	
   ;	        goto boom;
   ;	    }
   ;	    if (a->tile_collision(0, 0, 0))
   ;	
	push	0
	push	0
	push	0
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@tile_collision$qiii
	add	sp,10
	or	al,al
	jne	short @53@310
   ;	
   ;	        goto boom;
   ;	    if (touching(a, cur_sub)) {
   ;	
	push	word ptr DGROUP:_cur_sub+2
	push	word ptr DGROUP:_cur_sub
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @touching$qn7m_actort1
	add	sp,8
	or	al,al
	je	short @53@198
   ;	
   ;	        hit_cur_sub(0x19, 0);
   ;	
	push	0
	push	25
	push	cs
	call	near ptr @hit_cur_sub$qii
	add	sp,4
   ;	
   ;	        var_1 = 1;
   ;	
	mov	byte ptr [bp-1],1
	jmp	short @53@310
@53@198:
   ;	
   ;	        goto boom;
   ;	    }
   ;	    if (a->on_tile(0x100))
   ;	
	push	256
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@on_tile$qi
	add	sp,6
	or	al,al
	jne	short @53@310
   ;	
   ;	        goto boom;
   ;	    if (a->y_speed != -5)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+22],-5
	je	short @53@450
   ;	
   ;	        a->y_speed--;
   ;	
	les	bx,dword ptr [bp+6]
	dec	word ptr es:[bx+22]
	jmp	short @53@450
   ;	
   ;	    return;
   ;	
	jmp	short @53@450
@53@310:
   ;	
   ;	boom:
   ;	    add_explosion(a->x, a->y, 1,
   ;	
   ;	
   ;	                  var_1 ? (uchar far *)"dirhit" : (uchar far *)NULL);
   ;	
	cmp	byte ptr [bp-1],0
	je	short @53@366
	mov	dx,ds
	mov	ax,offset DGROUP:s@+425
	jmp	short @53@394
@53@366:
	xor	dx,dx
	xor	ax,ax
@53@394:
	push	dx
	push	ax
	push	1
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx]
	call	far ptr @add_explosion$qiiucnuc
	add	sp,10
@53@422:
   ;	
   ;	die:
   ;	    a->flag_0 = 1;
   ;	
	les	bx,dword ptr [bp+6]
	or	byte ptr es:[bx+82],1
@53@450:
   ;	
   ;	}
   ;	
	leave	
	ret	
@do_mine2$qn7m_actor	endp
   ;	
   ;	void far do_missle(m_actor far *a)
   ;	
	assume	cs:CREATURE_TEXT
@do_missle$qn7m_actor	proc	far
	enter	2,0
	push	si
   ;	
   ;	{
   ;	    byte var_1, var_2;
   ;	
   ;	    if (a->in_window == 1) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,1
	and	ax,1
	cmp	ax,1
	je short	@@85
	jmp	@54@1486
@@85:
   ;	
   ;	        /* accelerate toward terminal speed */
   ;	        if (a->direction == 1) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+52],1
	jne	short @54@170
   ;	
   ;	            if (a->x_speed > -a->counter_26)
   ;	
	les	bx,dword ptr [bp+6]
	push	es
	les	si,dword ptr [bp+6]
	mov	ax,word ptr es:[si+36]
	neg	ax
	pop	es
	cmp	word ptr es:[bx+20],ax
	jle	short @54@254
   ;	
   ;	                a->x_speed -= 2;
   ;	
	les	bx,dword ptr [bp+6]
	sub	word ptr es:[bx+20],2
	jmp	short @54@254
   ;	
   ;	        } else if (a->direction == 0) {
   ;	
	jmp	short @54@254
@54@170:
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+52],0
	jne	short @54@254
   ;	
   ;	            if (a->x_speed < a->counter_26)
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+20]
	les	bx,dword ptr [bp+6]
	cmp	ax,word ptr es:[bx+36]
	jge	short @54@254
   ;	
   ;	                a->x_speed += 2;
   ;	
	les	bx,dword ptr [bp+6]
	add	word ptr es:[bx+20],2
@54@254:
   ;	
   ;	        }
   ;	        if (a->state == 3 && a->y_speed != 0x0A)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+61],3
	jne	short @54@338
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+22],10
	je	short @54@338
   ;	
   ;	            a->y_speed++;
   ;	
	les	bx,dword ptr [bp+6]
	inc	word ptr es:[bx+22]
@54@338:
   ;	
   ;	        if (a->flag_7 && random(0x0A) == 0)
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,7
	and	ax,1
	or	ax,ax
	je	short @54@422
	push	10
	call	far ptr @random$qi
	pop	cx
	or	ax,ax
	jne	short @54@422
   ;	
   ;	            add_bubble(a->center_x, a->y, 0);
   ;	
	push	0
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+8]
	call	far ptr @add_bubble$qiii
	add	sp,6
@54@422:
   ;	
   ;	        var_2 = 0;
   ;	
	mov	byte ptr [bp-2],0
   ;	
   ;	        if (a->target->type & 0x10) {           /* smart — strike shootables */
   ;	
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+44]
	test	byte ptr es:[bx+53],16
	jne short	@@86
	jmp	@54@926
@@86:
   ;	
   ;	            for (var_1 = 0; var_1 < shootable_count; var_1++) {
   ;	
	mov	byte ptr [bp-1],0
	jmp	@54@758
@54@478:
   ;	
   ;	                act = shootable_list[var_1];
   ;	
	mov	al,byte ptr [bp-1]
	mov	ah,0
	shl	ax,2
	mov	bx,ax
	mov	ax,word ptr DGROUP:_shootable_list[bx+2]
	mov	dx,word ptr DGROUP:_shootable_list[bx]
	mov	word ptr DGROUP:_act+2,ax
	mov	word ptr DGROUP:_act,dx
   ;	
   ;	                if (act->inactive)
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	al,byte ptr es:[bx+82]
	shr	ax,5
	and	ax,1
	or	ax,ax
	je short	@@87
	jmp	@54@730
@@87:
   ;	
   ;	                    continue;
   ;	                if (!touching(a, act))
   ;	
	push	word ptr DGROUP:_act+2
	push	word ptr DGROUP:_act
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @touching$qn7m_actort1
	add	sp,8
	mov	ah,0
	or	ax,ax
	jne short	@@88
	jmp	@54@730
@@88:
   ;	
   ;	                    continue;
   ;	                act->flag_3 = 1;
   ;	
	les	bx,dword ptr DGROUP:_act
	or	byte ptr es:[bx+82],8
   ;	
   ;	                act->field_28 += a->health;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+38]
	les	bx,dword ptr DGROUP:_act
	add	word ptr es:[bx+40],ax
   ;	
   ;	                act->field_1E = (a->x_speed > 0) ? 5 : -5;
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+20],0
	jle	short @54@590
	mov	ax,5
	jmp	short @54@618
@54@590:
	mov	ax,-5
@54@618:
	les	bx,dword ptr DGROUP:_act
	mov	word ptr es:[bx+30],ax
   ;	
   ;	                if (act->type & 0x20) {
   ;	
	les	bx,dword ptr DGROUP:_act
	test	byte ptr es:[bx+53],32
	je	short @54@702
   ;	
   ;	                    diff_y = abs(a->y - act->y);
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	les	bx,dword ptr DGROUP:_act
	sub	ax,word ptr es:[bx+2]
	push	ax
	call	far ptr @abs$qi
	pop	cx
	mov	word ptr DGROUP:_diff_y,ax
   ;	
   ;	                    if (act->height / 2 > diff_y)
   ;	
	les	bx,dword ptr DGROUP:_act
	mov	ax,word ptr es:[bx+18]
	cwd	
	sub	ax,dx
	sar	ax,1
	cmp	ax,word ptr DGROUP:_diff_y
	jle	short @54@702
   ;	
   ;	                        act->door_open = 1;
   ;	
	les	bx,dword ptr DGROUP:_act
	or	byte ptr es:[bx+82],64
@54@702:
   ;	
   ;	                }
   ;	                if (a->health < 0x0A)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+38],10
	jge short	@@89
	jmp	@54@1486
@@89:
@54@730:
	inc	byte ptr [bp-1]
@54@758:
	mov	al,byte ptr [bp-1]
	cmp	al,byte ptr DGROUP:_shootable_count
	jae short	@@90
	jmp	@54@478
@@90:
   ;	
   ;	                    goto die;
   ;	            }
   ;	            if (a->direction == 0x63) {           /* top torpedo — sinks */
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+52],99
	je short	@@91
	jmp	@54@1374
@@91:
   ;	
   ;	                if (the_map->tile_attr[a->map_pos].attr == 0x100)
   ;	
	les	bx,dword ptr DGROUP:_the_map
	les	bx,dword ptr es:[bx+926]
	push	es
	les	si,dword ptr [bp+6]
	mov	ax,word ptr es:[si+24]
	shl	ax,2
	add	bx,ax
	pop	es
	cmp	word ptr es:[bx],256
	jne short	@@92
	jmp	@54@1486
@@92:
   ;	
   ;	                    goto die;
   ;	                if (a->y_speed != -a->counter_26)
   ;	
	les	bx,dword ptr [bp+6]
	push	es
	les	si,dword ptr [bp+6]
	mov	ax,word ptr es:[si+36]
	neg	ax
	pop	es
	cmp	word ptr es:[bx+22],ax
	jne short	@@93
	jmp	@54@1374
@@93:
   ;	
   ;	                    a->y_speed--;
   ;	
	les	bx,dword ptr [bp+6]
	dec	word ptr es:[bx+22]
	jmp	@54@1374
   ;	
   ;	            }
   ;	            goto wallcheck;
   ;	
	jmp	@54@1374
@54@926:
   ;	
   ;	        }
   ;	        /* dumb shot — steer toward the sub */
   ;	        if (smart_missiles == 1 && a->direction != 0x63) {
   ;	
	cmp	byte ptr DGROUP:_smart_missiles,1
	jne	short @54@1122
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+52],99
	je	short @54@1122
   ;	
   ;	            if (a->center_y > cur_sub->center_y)
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+10]
	les	bx,dword ptr DGROUP:_cur_sub
	cmp	ax,word ptr es:[bx+10]
	jle	short @54@1038
   ;	
   ;	                a->y_speed = -1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+22],-1
	jmp	short @54@1122
@54@1038:
   ;	
   ;	            else if (a->center_y < cur_sub->center_y)
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+10]
	les	bx,dword ptr DGROUP:_cur_sub
	cmp	ax,word ptr es:[bx+10]
	jge	short @54@1094
   ;	
   ;	                a->y_speed = 1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+22],1
	jmp	short @54@1122
@54@1094:
   ;	
   ;	            else
   ;	                a->y_speed = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+22],0
@54@1122:
   ;	
   ;	        }
   ;	        for (var_1 = 0; var_1 < barrier_count; var_1++) {
   ;	
	mov	byte ptr [bp-1],0
	jmp	short @54@1206
@54@1150:
   ;	
   ;	            act = barrier_list[var_1];
   ;	
	mov	al,byte ptr [bp-1]
	mov	ah,0
	shl	ax,2
	mov	bx,ax
	mov	ax,word ptr DGROUP:_barrier_list[bx+2]
	mov	dx,word ptr DGROUP:_barrier_list[bx]
	mov	word ptr DGROUP:_act+2,ax
	mov	word ptr DGROUP:_act,dx
   ;	
   ;	            if (touching(a, act))
   ;	
	push	word ptr DGROUP:_act+2
	push	word ptr DGROUP:_act
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @touching$qn7m_actort1
	add	sp,8
	or	al,al
	jne	short @54@1486
	inc	byte ptr [bp-1]
@54@1206:
	mov	al,byte ptr [bp-1]
	cmp	al,byte ptr DGROUP:_barrier_count
	jb	short @54@1150
   ;	
   ;	                goto die;
   ;	        }
   ;	        if (touching(a, cur_sub)) {
   ;	
	push	word ptr DGROUP:_cur_sub+2
	push	word ptr DGROUP:_cur_sub
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @touching$qn7m_actort1
	add	sp,8
	or	al,al
	je	short @54@1374
   ;	
   ;	            hit_cur_sub(a->health, (a->x_speed > 0) ? 5 : -5);
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+20],0
	jle	short @54@1318
	mov	ax,5
	jmp	short @54@1346
@54@1318:
	mov	ax,-5
@54@1346:
	push	ax
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+38]
	push	cs
	call	near ptr @hit_cur_sub$qii
	add	sp,4
   ;	
   ;	            var_2++;
   ;	
	inc	byte ptr [bp-2]
	jmp	short @54@1486
@54@1374:
   ;	
   ;	            goto die;
   ;	        }
   ;	wallcheck:
   ;	        if (a->health < 0x0A && a->tile_collision(0, 0, 0))
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+38],10
	jl short	@@94
	jmp	@54@1738
@@94:
	push	0
	push	0
	push	0
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@tile_collision$qiii
	add	sp,10
	or	al,al
	je	short @54@1738
   ;	
   ;	            goto die;
   ;	
	jmp	short @54@1486
   ;	
   ;	        return;
   ;	
	jmp	short @54@1738
@54@1486:
   ;	
   ;	    }
   ;	die:
   ;	    a->flag_0 = 1;
   ;	
	les	bx,dword ptr [bp+6]
	or	byte ptr es:[bx+82],1
   ;	
   ;	    if (a->direction == 0x63)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+52],99
	jne	short @54@1542
   ;	
   ;	        top_shot_count--;
   ;	
	dec	byte ptr DGROUP:_top_shot_count
	jmp	short @54@1598
@54@1542:
   ;	
   ;	    else if (a->target->type & 0x10)
   ;	
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+44]
	test	byte ptr es:[bx+53],16
	je	short @54@1598
   ;	
   ;	        shot_count--;
   ;	
	dec	byte ptr DGROUP:_shot_count
@54@1598:
   ;	
   ;	    if (a->in_window != 1)
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,1
	and	ax,1
	cmp	ax,1
	jne	short @54@1738
   ;	
   ;	        return;
   ;	    if (var_2)
   ;	
	cmp	byte ptr [bp-2],0
	je	short @54@1682
   ;	
   ;	        add_explosion(a->center_x, a->center_y, a->counter_24,
   ;	
   ;	
   ;	                      (uchar far *)a->field_4E);
   ;	
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+80]
	push	word ptr es:[bx+78]
	jmp	short @54@1710
@54@1682:
   ;	
   ;	    else
   ;	        add_explosion(a->center_x, a->center_y, a->counter_24,
   ;	
   ;	
   ;	                      (uchar far *)NULL);
   ;	
	push	0
	push	0
@54@1710:
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+34]
	push	ax
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+10]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+8]
	call	far ptr @add_explosion$qiiucnuc
	add	sp,10
@54@1738:
   ;	
   ;	}
   ;	
	pop	si
	leave	
	ret	
@do_missle$qn7m_actor	endp
   ;	
   ;	void far do_bs2tn(m_actor far *a)
   ;	
	assume	cs:CREATURE_TEXT
@do_bs2tn$qn7m_actor	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (check_for_hit(a, 0x14) == 2) {
   ;	
	push	20
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @check_for_hit$qn7m_actoruc
	add	sp,6
	cmp	al,2
	jne	short @55@114
   ;	
   ;	        score_at(0xFA0, a->x, a->y);
   ;	
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx]
	push	4000
	call	far ptr @score_at$qiii
	add	sp,6
   ;	
   ;	        a->target->counter_26++;
   ;	
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+44]
	inc	word ptr es:[bx+36]
   ;	
   ;	        if (a->target->counter_26 == 4)
   ;	
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+44]
	cmp	word ptr es:[bx+36],4
	jne	short @55@114
   ;	
   ;	            a->target->field_28 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+44]
	mov	word ptr es:[bx+40],0
@55@114:
   ;	
   ;	    }
   ;	    if (cur_sub->field_36 == 0 && touching(a, cur_sub))
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	cmp	byte ptr es:[bx+54],0
	jne	short @55@198
	push	word ptr DGROUP:_cur_sub+2
	push	word ptr DGROUP:_cur_sub
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @touching$qn7m_actort1
	add	sp,8
	or	al,al
	je	short @55@198
   ;	
   ;	        hit_cur_sub(a->target->x_speed, 1);
   ;	
	push	1
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+44]
	push	word ptr es:[bx+20]
	push	cs
	call	near ptr @hit_cur_sub$qii
	add	sp,4
@55@198:
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@do_bs2tn$qn7m_actor	endp
   ;	
   ;	void far do_bs2_eyes(m_actor far *a)
   ;	
	assume	cs:CREATURE_TEXT
@do_bs2_eyes$qn7m_actor	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    a->field_36 = a->target->field_36;
   ;	
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+44]
	mov	al,byte ptr es:[bx+54]
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+54],al
   ;	
   ;	    if (a->target->state == 2) {
   ;	
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+44]
	cmp	byte ptr es:[bx+61],2
	jne	short @56@86
   ;	
   ;	        a->current_loop = 3;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+60],3
   ;	
   ;	    } else if (a->health == 0) {
   ;	
	jmp	short @56@170
@56@86:
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+38],0
	jne	short @56@142
   ;	
   ;	        a->current_loop = random(3);
   ;	
	push	3
	call	far ptr @random$qi
	pop	cx
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+60],al
   ;	
   ;	        a->health = 0x14;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+38],20
   ;	
   ;	    } else {
   ;	
	jmp	short @56@170
@56@142:
   ;	
   ;	        a->health--;
   ;	
	les	bx,dword ptr [bp+6]
	dec	word ptr es:[bx+38]
@56@170:
   ;	
   ;	    }
   ;	}
   ;	
	pop	bp
	ret	
@do_bs2_eyes$qn7m_actor	endp
   ;	
   ;	void far do_bs3_prop(m_actor far *a)
   ;	
	assume	cs:CREATURE_TEXT
@do_bs3_prop$qn7m_actor	proc	far
	enter	4,0
   ;	
   ;	{
   ;	    int var_2, var_4;
   ;	
   ;	    if (a->target->state == 2)
   ;	
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+44]
	cmp	byte ptr es:[bx+61],2
	jne	short @57@86
   ;	
   ;	        a->flag_0 = 1;
   ;	
	les	bx,dword ptr [bp+6]
	or	byte ptr es:[bx+82],1
@57@86:
   ;	
   ;	    if (a->target->direction != a->direction) {
   ;	
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+44]
	mov	al,byte ptr es:[bx+52]
	les	bx,dword ptr [bp+6]
	cmp	al,byte ptr es:[bx+52]
	je	short @57@254
   ;	
   ;	        if (a->direction == 0)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+52],0
	jne	short @57@170
   ;	
   ;	            a->new_loop((uchar *)"bs3_prpl.l");
   ;	
	push	ds
	push	offset DGROUP:s@+432
	jmp	short @57@198
@57@170:
   ;	
   ;	        else
   ;	            a->new_loop((uchar *)"bs3_prpr.l");
   ;	
	push	ds
	push	offset DGROUP:s@+443
@57@198:
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@new_loop$qnuc
	add	sp,8
   ;	
   ;	        a->direction ^= 1;
   ;	
	les	bx,dword ptr [bp+6]
	xor	byte ptr es:[bx+52],1
@57@254:
   ;	
   ;	    }
   ;	    if (random(2) == 0) {
   ;	
	push	2
	call	far ptr @random$qi
	pop	cx
	or	ax,ax
	jne	short @57@394
   ;	
   ;	        var_2 = a->x;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx]
	mov	word ptr [bp-2],ax
   ;	
   ;	        var_4 = a->y + random(0x0F);
   ;	
	push	15
	call	far ptr @random$qi
	pop	cx
	les	bx,dword ptr [bp+6]
	mov	dx,word ptr es:[bx+2]
	add	dx,ax
	mov	word ptr [bp-4],dx
   ;	
   ;	        if (a->direction == 0)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+52],0
	jne	short @57@338
   ;	
   ;	            add_bubble(var_2, var_4, -8);
   ;	
	push	-8
	push	word ptr [bp-4]
	push	word ptr [bp-2]
	jmp	short @57@366
@57@338:
   ;	
   ;	        else
   ;	            add_bubble(var_2 + a->width, var_4, 8);
   ;	
	push	8
	push	word ptr [bp-4]
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp-2]
	add	ax,word ptr es:[bx+16]
	push	ax
@57@366:
	call	far ptr @add_bubble$qiii
	add	sp,6
@57@394:
   ;	
   ;	    }
   ;	}
   ;	
	leave	
	ret	
@do_bs3_prop$qn7m_actor	endp
   ;	
   ;	void far do_bs2(m_actor far *a)
   ;	
	assume	cs:CREATURE_TEXT
@do_bs2$qn7m_actor	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (a->state == 2) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+61],2
	je short	@@95
	jmp	@58@310
@@95:
   ;	
   ;	        if (a->y_speed != 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+22],0
	jne short	@@96
	jmp	@58@226
@@96:
   ;	
   ;	            if (a->tile_collision(0, 0, 0) != 0) {
   ;	
	push	0
	push	0
	push	0
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@tile_collision$qiii
	add	sp,10
	or	al,al
	je	short @58@142
   ;	
   ;	                a->y_speed = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+22],0
   ;	
   ;	                a->inactive = 1;
   ;	
	les	bx,dword ptr [bp+6]
	or	byte ptr es:[bx+82],32
   ;	
   ;	                enemies_killed++;
   ;	
	inc	byte ptr DGROUP:_enemies_killed
@58@142:
   ;	
   ;	            }
   ;	            if (random(3) == 0)
   ;	
	push	3
	call	far ptr @random$qi
	pop	cx
	or	ax,ax
	je short	@@97
	jmp	@58@1010
@@97:
   ;	
   ;	                add_explosion(a->x + random(a->width), a->y + random(a->height), 1, (uchar far *)0);
   ;	
	push	0
	push	0
	push	1
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+18]
	call	far ptr @random$qi
	pop	cx
	les	bx,dword ptr [bp+6]
	mov	dx,word ptr es:[bx+2]
	add	dx,ax
	push	dx
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+16]
	call	far ptr @random$qi
	pop	cx
	les	bx,dword ptr [bp+6]
	mov	dx,word ptr es:[bx]
	add	dx,ax
	push	dx
	call	far ptr @add_explosion$qiiucnuc
	add	sp,10
	jmp	@58@1010
   ;	
   ;	        } else {
   ;	
	jmp	@58@1010
@58@226:
   ;	
   ;	            if (random(6) == 0)
   ;	
	push	6
	call	far ptr @random$qi
	pop	cx
	or	ax,ax
	je short	@@98
	jmp	@58@1010
@@98:
   ;	
   ;	                add_bubble(a->x + random(a->width), a->y + random(a->height), 0x14);
   ;	
	push	20
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+18]
	call	far ptr @random$qi
	pop	cx
	les	bx,dword ptr [bp+6]
	mov	dx,word ptr es:[bx+2]
	add	dx,ax
	push	dx
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+16]
	call	far ptr @random$qi
	pop	cx
	les	bx,dword ptr [bp+6]
	mov	dx,word ptr es:[bx]
	add	dx,ax
	push	dx
	call	far ptr @add_bubble$qiii
	add	sp,6
	jmp	@58@1010
   ;	
   ;	        }
   ;	        return;
   ;	
	jmp	@58@1010
@58@310:
   ;	
   ;	    }
   ;	    if (a->counter_24 != 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+34],0
	je	short @58@366
   ;	
   ;	        a->counter_24--;
   ;	
	les	bx,dword ptr [bp+6]
	dec	word ptr es:[bx+34]
   ;	
   ;	    } else if (a->door_open) {
   ;	
	jmp	short @58@422
@58@366:
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,6
	and	ax,1
	or	ax,ax
	je	short @58@422
   ;	
   ;	        a->counter_24 = random(0x14) + 0x0A;
   ;	
	push	20
	call	far ptr @random$qi
	pop	cx
	add	ax,10
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+34],ax
   ;	
   ;	        a->door_open = 0;
   ;	
	les	bx,dword ptr [bp+6]
	and	byte ptr es:[bx+82],191
   ;	
   ;	        a->x_speed = -a->x_speed;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+20]
	neg	ax
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+20],ax
   ;	
   ;	        a->direction ^= 1;
   ;	
	les	bx,dword ptr [bp+6]
	xor	byte ptr es:[bx+52],1
@58@422:
   ;	
   ;	    }
   ;	    if (a->counter_26 == 4 && a->y_speed != 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+36],4
	jne	short @58@506
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+22],0
	je	short @58@506
   ;	
   ;	        a->y_speed = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+22],0
   ;	
   ;	        a->flag_3 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	and	byte ptr es:[bx+82],247
   ;	
   ;	        a->field_28 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+40],0
@58@506:
   ;	
   ;	    }
   ;	    if (a->facing_actor(cur_sub) == 0)
   ;	
	push	word ptr DGROUP:_cur_sub+2
	push	word ptr DGROUP:_cur_sub
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@facing_actor$qn7m_actor
	add	sp,8
	or	al,al
	jne	short @58@562
   ;	
   ;	        a->door_open = 1;
   ;	
	les	bx,dword ptr [bp+6]
	or	byte ptr es:[bx+82],64
@58@562:
   ;	
   ;	    if (a->counter_26 == 4) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+36],4
	je short	@@99
	jmp	@58@730
@@99:
   ;	
   ;	        if (check_for_hit(a, 0x3C) == 2) {
   ;	
	push	60
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @check_for_hit$qn7m_actoruc
	add	sp,6
	cmp	al,2
	jne	short @58@646
   ;	
   ;	            a->target->door_open = 1;
   ;	
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+44]
	or	byte ptr es:[bx+82],64
   ;	
   ;	            a->flag_0 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	and	byte ptr es:[bx+82],254
   ;	
   ;	            a->x_speed = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+20],0
   ;	
   ;	            a->y_speed = 1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+22],1
   ;	
   ;	            a->move_func = (movefn_t)0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	dword ptr es:[bx+66],large 0
   ;	
   ;	            a->state = 2;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+61],2
   ;	
   ;	            score += 75000;
   ;	
	add	dword ptr DGROUP:_score,large 0000124F8h
@58@646:
   ;	
   ;	        }
   ;	        if (random(0x1E) == 0)
   ;	
	push	30
	call	far ptr @random$qi
	pop	cx
	or	ax,ax
	jne	short @58@926
   ;	
   ;	            add_missile(a, 0x0B, 0x23);
   ;	
	push	35
	push	11
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @add_missile$qn7m_actoruci
	add	sp,8
	jmp	short @58@926
   ;	
   ;	    } else {
   ;	
	jmp	short @58@926
@58@730:
   ;	
   ;	        diff_y = abs(a->center_y - cur_sub->center_y);
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+10]
	les	bx,dword ptr DGROUP:_cur_sub
	sub	ax,word ptr es:[bx+10]
	push	ax
	call	far ptr @abs$qi
	pop	cx
	mov	word ptr DGROUP:_diff_y,ax
   ;	
   ;	        if (diff_y < 0x28 && random(0x14) == 0)
   ;	
	cmp	word ptr DGROUP:_diff_y,40
	jge	short @58@814
	push	20
	call	far ptr @random$qi
	pop	cx
	or	ax,ax
	jne	short @58@814
   ;	
   ;	            add_missile(a, 0x0B, 0x23);
   ;	
	push	35
	push	11
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @add_missile$qn7m_actoruci
	add	sp,8
@58@814:
   ;	
   ;	        a->y_speed = (cur_sub->center_y < a->old_y) ? -1 : 1;
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	mov	ax,word ptr es:[bx+10]
	les	bx,dword ptr [bp+6]
	cmp	ax,word ptr es:[bx+6]
	jge	short @58@870
	mov	ax,-1
	jmp	short @58@898
@58@870:
	mov	ax,1
@58@898:
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+22],ax
@58@926:
   ;	
   ;	    }
   ;	    if (cur_sub->field_36 == 0 && touching(a, cur_sub))
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	cmp	byte ptr es:[bx+54],0
	jne	short @58@1010
	push	word ptr DGROUP:_cur_sub+2
	push	word ptr DGROUP:_cur_sub
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @touching$qn7m_actort1
	add	sp,8
	or	al,al
	je	short @58@1010
   ;	
   ;	        hit_cur_sub(a->x_speed, 1);
   ;	
	push	1
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+20]
	push	cs
	call	near ptr @hit_cur_sub$qii
	add	sp,4
@58@1010:
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@do_bs2$qn7m_actor	endp
   ;	
   ;	void far do_bs3a(m_actor far *a)
   ;	
	assume	cs:CREATURE_TEXT
@do_bs3a$qn7m_actor	proc	far
	enter	2,0
   ;	
   ;	{
   ;	    byte var_1;
   ;	
   ;	    var_1 = check_for_hit(a, 0x28);
   ;	
	push	40
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @check_for_hit$qn7m_actoruc
	add	sp,6
	mov	byte ptr [bp-1],al
   ;	
   ;	    if (var_1 == 2) {
   ;	
	cmp	byte ptr [bp-1],2
	je short	@@100
	jmp	@59@86
@@100:
   ;	
   ;	        a->target->target = (m_actor far *)0;
   ;	
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+44]
	mov	word ptr es:[bx+46],0
	mov	word ptr es:[bx+44],0
   ;	
   ;	        a->target->flag_3 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+44]
	and	byte ptr es:[bx+82],247
   ;	
   ;	        a->target->field_28 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+44]
	mov	word ptr es:[bx+40],0
   ;	
   ;	        add_explosion(a->x, a->y, 1, (uchar far *)0);
   ;	
	push	0
	push	0
	push	1
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx]
	call	far ptr @add_explosion$qiiucnuc
	add	sp,10
   ;	
   ;	        add_explosion(a->old_x, a->y, 1, (uchar far *)0);
   ;	
	push	0
	push	0
	push	1
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+4]
	call	far ptr @add_explosion$qiiucnuc
	add	sp,10
   ;	
   ;	        add_explosion(a->center_x, a->center_y, 2, (uchar far *)0);
   ;	
	push	0
	push	0
	push	2
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+10]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+8]
	call	far ptr @add_explosion$qiiucnuc
	add	sp,10
   ;	
   ;	    } else if (var_1 == 1 && a->facing_actor(cur_sub) == 0 && random(4) == 0) {
   ;	
	jmp	short @59@198
@59@86:
	cmp	byte ptr [bp-1],1
	jne	short @59@198
	push	word ptr DGROUP:_cur_sub+2
	push	word ptr DGROUP:_cur_sub
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@facing_actor$qn7m_actor
	add	sp,8
	or	al,al
	jne	short @59@198
	push	4
	call	far ptr @random$qi
	pop	cx
	or	ax,ax
	jne	short @59@198
   ;	
   ;	        a->target->door_open = 1;
   ;	
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+44]
	or	byte ptr es:[bx+82],64
@59@198:
   ;	
   ;	    }
   ;	    if (a->flag_7) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,7
	and	ax,1
	or	ax,ax
	je	short @59@310
   ;	
   ;	        if (a->frame == 0)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+56],0
	jne	short @59@394
   ;	
   ;	            a->flag_7 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	and	byte ptr es:[bx+82],127
	jmp	short @59@394
   ;	
   ;	    } else if (random(0x0A) == 0 && a->facing_actor(cur_sub) != 0) {
   ;	
	jmp	short @59@394
@59@310:
	push	10
	call	far ptr @random$qi
	pop	cx
	or	ax,ax
	jne	short @59@394
	push	word ptr DGROUP:_cur_sub+2
	push	word ptr DGROUP:_cur_sub
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@facing_actor$qn7m_actor
	add	sp,8
	or	al,al
	je	short @59@394
   ;	
   ;	        a->flag_7 = 1;
   ;	
	les	bx,dword ptr [bp+6]
	or	byte ptr es:[bx+82],128
   ;	
   ;	        a->set_cycle(2, 3);
   ;	
	push	3
	push	2
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
   ;	
   ;	        add_missile(a, 0x0A, 0x12);
   ;	
	push	18
	push	10
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @add_missile$qn7m_actoruci
	add	sp,8
@59@394:
   ;	
   ;	    }
   ;	}
   ;	
	leave	
	ret	
@do_bs3a$qn7m_actor	endp
   ;	
   ;	void far do_bs3_face(m_actor far *a)
   ;	
	assume	cs:CREATURE_TEXT
@do_bs3_face$qn7m_actor	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (a->target->state == 2)
   ;	
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+44]
	cmp	byte ptr es:[bx+61],2
	jne	short @60@86
   ;	
   ;	        a->flag_0 = 1;
   ;	
	les	bx,dword ptr [bp+6]
	or	byte ptr es:[bx+82],1
@60@86:
   ;	
   ;	    if (a->target->direction != a->direction) {
   ;	
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+44]
	mov	al,byte ptr es:[bx+52]
	les	bx,dword ptr [bp+6]
	cmp	al,byte ptr es:[bx+52]
	je	short @60@254
   ;	
   ;	        if (a->direction == 0)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+52],0
	jne	short @60@170
   ;	
   ;	            a->new_loop((uchar *)"bs3_facl.l");
   ;	
	push	ds
	push	offset DGROUP:s@+454
	jmp	short @60@198
@60@170:
   ;	
   ;	        else
   ;	            a->new_loop((uchar *)"bs3_facr.l");
   ;	
	push	ds
	push	offset DGROUP:s@+465
@60@198:
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@new_loop$qnuc
	add	sp,8
   ;	
   ;	        a->direction ^= 1;
   ;	
	les	bx,dword ptr [bp+6]
	xor	byte ptr es:[bx+52],1
@60@254:
   ;	
   ;	    }
   ;	}
   ;	
	pop	bp
	ret	
@do_bs3_face$qn7m_actor	endp
   ;	
   ;	void far do_bs1(m_actor far *a)
   ;	
	assume	cs:CREATURE_TEXT
@do_bs1$qn7m_actor	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (a->state == 2) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+61],2
	je short	@@101
	jmp	@61@394
@@101:
   ;	
   ;	        if (!a->inactive) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,5
	and	ax,1
	or	ax,ax
	je short	@@102
	jmp	@61@310
@@102:
   ;	
   ;	            if (random(2) == 0)
   ;	
	push	2
	call	far ptr @random$qi
	pop	cx
	or	ax,ax
	jne	short @61@226
   ;	
   ;	                add_explosion(a->x + random(a->width), a->y + random(a->height),
   ;	
   ;	
   ;	                              random(2) == 0 ? 5 : 1, (uchar far *)0);
   ;	
	push	0
	push	0
	push	2
	call	far ptr @random$qi
	pop	cx
	or	ax,ax
	jne	short @61@170
	mov	al,5
	jmp	short @61@198
@61@170:
	mov	al,1
@61@198:
	push	ax
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+18]
	call	far ptr @random$qi
	pop	cx
	les	bx,dword ptr [bp+6]
	mov	dx,word ptr es:[bx+2]
	add	dx,ax
	push	dx
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+16]
	call	far ptr @random$qi
	pop	cx
	les	bx,dword ptr [bp+6]
	mov	dx,word ptr es:[bx]
	add	dx,ax
	push	dx
	call	far ptr @add_explosion$qiiucnuc
	add	sp,10
@61@226:
   ;	
   ;	            if (a->tile_collision(0, 0, 0) != 0) {
   ;	
	push	0
	push	0
	push	0
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@tile_collision$qiii
	add	sp,10
	or	al,al
	jne short	@@103
	jmp	@61@1738
@@103:
   ;	
   ;	                a->target->door_open = 1;
   ;	
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+44]
	or	byte ptr es:[bx+82],64
   ;	
   ;	                a->inactive = 1;
   ;	
	les	bx,dword ptr [bp+6]
	or	byte ptr es:[bx+82],32
   ;	
   ;	                a->y_speed = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+22],0
	jmp	@61@1738
   ;	
   ;	            }
   ;	        } else if (random(3) == 0) {
   ;	
	jmp	@61@1738
@61@310:
	push	3
	call	far ptr @random$qi
	pop	cx
	or	ax,ax
	je short	@@104
	jmp	@61@1738
@@104:
   ;	
   ;	            add_bubble(a->x + random(a->width), a->y + random(a->height), 0x14);
   ;	
	push	20
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+18]
	call	far ptr @random$qi
	pop	cx
	les	bx,dword ptr [bp+6]
	mov	dx,word ptr es:[bx+2]
	add	dx,ax
	push	dx
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+16]
	call	far ptr @random$qi
	pop	cx
	les	bx,dword ptr [bp+6]
	mov	dx,word ptr es:[bx]
	add	dx,ax
	push	dx
	call	far ptr @add_bubble$qiii
	add	sp,6
	jmp	@61@1738
   ;	
   ;	        }
   ;	        return;
   ;	
	jmp	@61@1738
@61@394:
   ;	
   ;	    }
   ;	    if (a->x_speed == 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+20],0
	jne	short @61@478
   ;	
   ;	        if (a->in_window != 1)
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,1
	and	ax,1
	cmp	ax,1
	je short	@@105
	jmp	@61@1738
@@105:
   ;	
   ;	            return;
   ;	        a->x_speed = -1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+20],-1
   ;	
   ;	        a->set_cycle(8, 9);
   ;	
	push	9
	push	8
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
   ;	
   ;	        the_game->play_sound((uchar *)"badgrunt", 0x0F);
   ;	
	push	15
	push	ds
	push	offset DGROUP:s@+476
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_sound$qnucuc
	add	sp,10
@61@478:
   ;	
   ;	    }
   ;	    if (a->flag_3) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,3
	and	ax,1
	or	ax,ax
	jne short	@@106
	jmp	@61@702
@@106:
   ;	
   ;	        a->flag_3 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	and	byte ptr es:[bx+82],247
   ;	
   ;	        if (a->facing_actor(cur_sub) == 0) {
   ;	
	push	word ptr DGROUP:_cur_sub+2
	push	word ptr DGROUP:_cur_sub
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@facing_actor$qn7m_actor
	add	sp,8
	or	al,al
	je short	@@107
	jmp	@61@674
@@107:
   ;	
   ;	            a->field_36 = 0x0F;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+54],15
   ;	
   ;	            if (random(4 - shot_size) == 0)
   ;	
	mov	al,byte ptr DGROUP:_shot_size
	mov	ah,0
	mov	dx,4
	sub	dx,ax
	push	dx
	call	far ptr @random$qi
	pop	cx
	or	ax,ax
	jne	short @61@590
   ;	
   ;	                a->door_open = 1;
   ;	
	les	bx,dword ptr [bp+6]
	or	byte ptr es:[bx+82],64
@61@590:
   ;	
   ;	            a->health = a->field_28;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+40]
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+38],ax
   ;	
   ;	            if (a->field_28 > 0x5A) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+40],90
	jg short	@@108
	jmp	@61@702
@@108:
   ;	
   ;	                a->new_loop((uchar *)"bs1dr.l");
   ;	
	push	ds
	push	offset DGROUP:s@+485
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@new_loop$qnuc
	add	sp,8
   ;	
   ;	                a->set_cycle(0, 0);
   ;	
	push	0
	push	0
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
   ;	
   ;	                a->state = 2;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+61],2
   ;	
   ;	                a->x_speed = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+20],0
   ;	
   ;	                a->y_speed = 1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+22],1
   ;	
   ;	                a->move_func = (movefn_t)0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	dword ptr es:[bx+66],large 0
   ;	
   ;	                a->type = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+53],0
   ;	
   ;	                score += 50000;
   ;	
	add	dword ptr DGROUP:_score,large 00000C350h
   ;	
   ;	                enemies_killed++;
   ;	
	inc	byte ptr DGROUP:_enemies_killed
   ;	
   ;	                return;
   ;	
	jmp	@61@1738
   ;	
   ;	            }
   ;	        } else {
   ;	
	jmp	short @61@702
@61@674:
   ;	
   ;	            a->field_28 = a->health;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+38]
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+40],ax
   ;	
   ;	            the_game->play_sound((uchar *)"dirhit", 8);
   ;	
	push	8
	push	ds
	push	offset DGROUP:s@+493
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_sound$qnucuc
	add	sp,10
@61@702:
   ;	
   ;	        }
   ;	    }
   ;	    if (a->counter_24 != 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+34],0
	je	short @61@758
   ;	
   ;	        a->counter_24--;
   ;	
	les	bx,dword ptr [bp+6]
	dec	word ptr es:[bx+34]
   ;	
   ;	    } else if (a->door_open) {
   ;	
	jmp	short @61@926
@61@758:
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,6
	and	ax,1
	or	ax,ax
	je	short @61@926
   ;	
   ;	        a->counter_24 = random(0x14) + 0x0A;
   ;	
	push	20
	call	far ptr @random$qi
	pop	cx
	add	ax,10
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+34],ax
   ;	
   ;	        a->door_open = 0;
   ;	
	les	bx,dword ptr [bp+6]
	and	byte ptr es:[bx+82],191
   ;	
   ;	        a->x_speed = -a->x_speed;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+20]
	neg	ax
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+20],ax
   ;	
   ;	        if (a->direction == 1)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+52],1
	jne	short @61@842
   ;	
   ;	            a->new_loop((uchar *)"bs1_bdr.l");
   ;	
	push	ds
	push	offset DGROUP:s@+500
	jmp	short @61@870
@61@842:
   ;	
   ;	        else
   ;	            a->new_loop((uchar *)"bs1_bdl.l");
   ;	
	push	ds
	push	offset DGROUP:s@+510
@61@870:
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@new_loop$qnuc
	add	sp,8
   ;	
   ;	        a->direction ^= 1;
   ;	
	les	bx,dword ptr [bp+6]
	xor	byte ptr es:[bx+52],1
@61@926:
   ;	
   ;	    }
   ;	    if (a->counter_26 != 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+36],0
	jne short	@@109
	jmp	@61@1262
@@109:
   ;	
   ;	        if (--a->counter_26 != 0) {
   ;	
	les	bx,dword ptr [bp+6]
	dec	word ptr es:[bx+36]
	je	short @61@1150
   ;	
   ;	            if (random(4) == 0)
   ;	
	push	4
	call	far ptr @random$qi
	pop	cx
	or	ax,ax
	jne	short @61@1038
   ;	
   ;	                add_missile(a, 5, 0x28);
   ;	
	push	40
	push	5
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @add_missile$qn7m_actoruci
	add	sp,8
@61@1038:
   ;	
   ;	            if (cur_sub->field_36 == 0 && touching(a, cur_sub))
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	cmp	byte ptr es:[bx+54],0
	je short	@@110
	jmp	@61@1738
@@110:
	push	word ptr DGROUP:_cur_sub+2
	push	word ptr DGROUP:_cur_sub
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @touching$qn7m_actort1
	add	sp,8
	or	al,al
	jne short	@@111
	jmp	@61@1738
@@111:
   ;	
   ;	                hit_cur_sub(-(cur_sub->x_speed), 5);
   ;	
	push	5
	les	bx,dword ptr DGROUP:_cur_sub
	mov	ax,word ptr es:[bx+20]
	neg	ax
	push	ax
	push	cs
	call	near ptr @hit_cur_sub$qii
	add	sp,4
	jmp	@61@1738
   ;	
   ;	        } else {
   ;	
	jmp	@61@1738
@61@1150:
   ;	
   ;	            if (random(2) != 0)
   ;	
	push	2
	call	far ptr @random$qi
	pop	cx
	or	ax,ax
	je	short @61@1206
   ;	
   ;	                a->door_open = 1;
   ;	
	les	bx,dword ptr [bp+6]
	or	byte ptr es:[bx+82],64
@61@1206:
   ;	
   ;	            a->x_speed = a->x_speed / 8;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+20]
	mov	bx,8
	cwd	
	idiv	bx
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+20],ax
   ;	
   ;	            a->y_speed = a->y_speed / 2;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+22]
	cwd	
	sub	ax,dx
	sar	ax,1
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+22],ax
   ;	
   ;	            a->set_cycle(0, 5);
   ;	
	push	5
	push	0
	jmp	@61@1402
   ;	
   ;	        }
   ;	        return;
   ;	
	jmp	@61@1738
@61@1262:
   ;	
   ;	    }
   ;	    diff_x = abs(cur_sub->center_x - a->center_x);
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	mov	ax,word ptr es:[bx+8]
	les	bx,dword ptr [bp+6]
	sub	ax,word ptr es:[bx+8]
	push	ax
	call	far ptr @abs$qi
	pop	cx
	mov	word ptr DGROUP:_diff_x,ax
   ;	
   ;	    diff_y = abs(cur_sub->center_y - a->center_y);
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	mov	ax,word ptr es:[bx+10]
	les	bx,dword ptr [bp+6]
	sub	ax,word ptr es:[bx+10]
	push	ax
	call	far ptr @abs$qi
	pop	cx
	mov	word ptr DGROUP:_diff_y,ax
   ;	
   ;	    if (diff_x < 0x96 && diff_y < 0x28) {
   ;	
	cmp	word ptr DGROUP:_diff_x,150
	jge	short @61@1458
	cmp	word ptr DGROUP:_diff_y,40
	jge	short @61@1458
   ;	
   ;	        if (a->facing_actor(cur_sub) != 0 && random(0x0A) == 0) {
   ;	
	push	word ptr DGROUP:_cur_sub+2
	push	word ptr DGROUP:_cur_sub
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@facing_actor$qn7m_actor
	add	sp,8
	or	al,al
	jne short	@@112
	jmp	@61@1626
@@112:
	push	10
	call	far ptr @random$qi
	pop	cx
	or	ax,ax
	jne	short @61@1626
   ;	
   ;	            a->counter_26 = 0x0A;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+36],10
   ;	
   ;	            a->x_speed *= 8;
   ;	
	les	bx,dword ptr [bp+6]
	mov	dx,8
	mov	ax,word ptr es:[bx+20]
	imul	dx
	mov	word ptr es:[bx+20],ax
   ;	
   ;	            a->y_speed *= 2;
   ;	
	les	bx,dword ptr [bp+6]
	mov	dx,2
	mov	ax,word ptr es:[bx+22]
	imul	dx
	mov	word ptr es:[bx+22],ax
   ;	
   ;	            a->set_cycle(1, 4);
   ;	
	push	4
	push	1
@61@1402:
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
   ;	
   ;	            return;
   ;	
	jmp	short @61@1738
   ;	
   ;	        }
   ;	    } else {
   ;	
	jmp	short @61@1626
@61@1458:
   ;	
   ;	        if (diff_y > 0x0A && a->counter_24 == 0)
   ;	
	cmp	word ptr DGROUP:_diff_y,10
	jle	short @61@1626
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+34],0
	jne	short @61@1626
   ;	
   ;	            a->y_speed = (a->center_y < cur_sub->center_y) ? 1 : -1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+10]
	les	bx,dword ptr DGROUP:_cur_sub
	cmp	ax,word ptr es:[bx+10]
	jge	short @61@1570
	mov	ax,1
	jmp	short @61@1598
@61@1570:
	mov	ax,-1
@61@1598:
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+22],ax
@61@1626:
   ;	
   ;	    }
   ;	    if (a->frame == 0)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+56],0
	jne	short @61@1682
   ;	
   ;	        a->set_cycle(8, 9);
   ;	
	push	9
	push	8
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
@61@1682:
   ;	
   ;	    if (random(0x12C) == 0)
   ;	
	push	300
	call	far ptr @random$qi
	pop	cx
	or	ax,ax
	jne	short @61@1738
   ;	
   ;	        the_game->play_sound((uchar *)"badgrunt", 0x0C);
   ;	
	push	12
	push	ds
	push	offset DGROUP:s@+520
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_sound$qnucuc
	add	sp,10
@61@1738:
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@do_bs1$qn7m_actor	endp
   ;	
   ;	void far do_bs3(m_actor far *a)
   ;	
	assume	cs:CREATURE_TEXT
@do_bs3$qn7m_actor	proc	far
	enter	8,0
   ;	
   ;	{
   ;	    int var_2, var_4, var_6, var_8;
   ;	
   ;	    if (a->state == 2) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+61],2
	je short	@@113
	jmp	@62@618
@@113:
   ;	
   ;	        if (!a->inactive) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,5
	and	ax,1
	or	ax,ax
	je short	@@114
	jmp	@62@226
@@114:
   ;	
   ;	            if (a->tile_collision(0, 0, 0) != 0) {
   ;	
	push	0
	push	0
	push	0
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@tile_collision$qiii
	add	sp,10
	or	al,al
	jne short	@@115
	jmp	@62@282
@@115:
   ;	
   ;	                a->y_speed = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+22],0
   ;	
   ;	                a->linked->door_open = 1;
   ;	
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+48]
	or	byte ptr es:[bx+82],64
   ;	
   ;	                a->inactive = 1;
   ;	
	les	bx,dword ptr [bp+6]
	or	byte ptr es:[bx+82],32
   ;	
   ;	                enemies_killed++;
   ;	
	inc	byte ptr DGROUP:_enemies_killed
   ;	
   ;	                control = 0;
   ;	
	mov	byte ptr DGROUP:_control,0
   ;	
   ;	                ego->y_speed = 0;
   ;	
	les	bx,dword ptr DGROUP:_ego
	mov	word ptr es:[bx+22],0
   ;	
   ;	                ego->x_speed = 0;
   ;	
	les	bx,dword ptr DGROUP:_ego
	mov	word ptr es:[bx+20],0
   ;	
   ;	                ego->move_func = (movefn_t)0;
   ;	
	les	bx,dword ptr DGROUP:_ego
	mov	dword ptr es:[bx+66],large 0
   ;	
   ;	                if (ego->facing_actor(a) == 0)
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	word ptr DGROUP:_ego+2
	push	word ptr DGROUP:_ego
	call	far ptr @m_actor@facing_actor$qn7m_actor
	add	sp,8
	or	al,al
	jne	short @62@170
   ;	
   ;	                    turn_ego();
   ;	
	call	far ptr @turn_ego$qv
@62@170:
   ;	
   ;	                ego->set_cycle(0, 1);
   ;	
	push	1
	push	0
	push	word ptr DGROUP:_ego+2
	push	word ptr DGROUP:_ego
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
   ;	
   ;	                the_game->field_0F = 1;
   ;	
	les	bx,dword ptr DGROUP:_the_game
	mov	byte ptr es:[bx+15],1
	jmp	short @62@282
   ;	
   ;	            }
   ;	        } else if (random(6) == 0) {
   ;	
	jmp	short @62@282
@62@226:
	push	6
	call	far ptr @random$qi
	pop	cx
	or	ax,ax
	jne	short @62@282
   ;	
   ;	            add_bubble(a->x + random(a->width), a->y + random(a->height), 0x14);
   ;	
	push	20
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+18]
	call	far ptr @random$qi
	pop	cx
	les	bx,dword ptr [bp+6]
	mov	dx,word ptr es:[bx+2]
	add	dx,ax
	push	dx
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+16]
	call	far ptr @random$qi
	pop	cx
	les	bx,dword ptr [bp+6]
	mov	dx,word ptr es:[bx]
	add	dx,ax
	push	dx
	call	far ptr @add_bubble$qiii
	add	sp,6
@62@282:
   ;	
   ;	        }
   ;	        if (random(2) == 0) {
   ;	
	push	2
	call	far ptr @random$qi
	pop	cx
	or	ax,ax
	je short	@@116
	jmp	@62@1710
@@116:
   ;	
   ;	            var_6 = a->x + random(a->width);
   ;	
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+16]
	call	far ptr @random$qi
	pop	cx
	les	bx,dword ptr [bp+6]
	mov	dx,word ptr es:[bx]
	add	dx,ax
	mov	word ptr [bp-6],dx
   ;	
   ;	            var_8 = a->y + random(a->height) - 0x0A;
   ;	
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+18]
	call	far ptr @random$qi
	pop	cx
	les	bx,dword ptr [bp+6]
	mov	dx,word ptr es:[bx+2]
	add	dx,ax
	add	dx,-10
	mov	word ptr [bp-8],dx
   ;	
   ;	            switch (random(3)) {
   ;	
	push	3
	call	far ptr @random$qi
	pop	cx
	or	ax,ax
	je	short @62@478
	cmp	ax,1
	je	short @62@534
	cmp	ax,2
	je	short @62@562
	jmp	@62@1710
@62@478:
   ;	
   ;	            case 0:
   ;	                add_explosion(var_6, var_8, 1, (uchar far *)0);
   ;	
	push	0
	push	0
	push	1
@62@506:
	push	word ptr [bp-8]
	push	word ptr [bp-6]
	call	far ptr @add_explosion$qiiucnuc
	add	sp,10
   ;	
   ;	                break;
   ;	
	jmp	@62@1710
@62@534:
   ;	
   ;	            case 1:
   ;	                add_explosion(var_6, var_8, 2, (uchar far *)0);
   ;	
	push	0
	push	0
	push	2
	jmp	short @62@506
@62@562:
   ;	
   ;	                break;
   ;	            case 2:
   ;	                act = the_cast->add((uchar *)"exp3.l", (void far *)0, (void far *)0);
   ;	
	push	0
	push	0
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+529
	push	word ptr DGROUP:_the_cast+2
	push	word ptr DGROUP:_the_cast
	call	far ptr @game_cast@add$qnucnvt2
	add	sp,16
	mov	word ptr DGROUP:_act+2,dx
	mov	word ptr DGROUP:_act,ax
   ;	
   ;	                act->set_xy(var_6, var_8);
   ;	
	push	word ptr [bp-8]
	push	word ptr [bp-6]
	push	word ptr DGROUP:_act+2
	push	word ptr DGROUP:_act
	call	far ptr @m_actor@set_xy$qii
	add	sp,8
   ;	
   ;	                act->set_cycle(0, 2);
   ;	
	push	2
	push	0
	push	word ptr DGROUP:_act+2
	push	word ptr DGROUP:_act
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
   ;	
   ;	                break;
   ;	
	jmp	@62@1710
   ;	
   ;	            }
   ;	        }
   ;	        return;
   ;	
	jmp	@62@1710
@62@618:
   ;	
   ;	    }
   ;	    if (a->target != 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	dword ptr es:[bx+44],large 0
	je	short @62@730
   ;	
   ;	        if (a->flag_3) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,3
	and	ax,1
	or	ax,ax
	jne short	@@117
	jmp	@62@1038
@@117:
   ;	
   ;	            a->flag_3 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	and	byte ptr es:[bx+82],247
   ;	
   ;	            the_game->play_sound((uchar *)"dirhit", 8);
   ;	
	push	8
	push	ds
	push	offset DGROUP:s@+536
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@play_sound$qnucuc
	add	sp,10
	jmp	@62@1038
   ;	
   ;	        }
   ;	    } else {
   ;	
	jmp	@62@1038
@62@730:
   ;	
   ;	        var_4 = check_for_hit(a, 0x5A);
   ;	
	push	90
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @check_for_hit$qn7m_actoruc
	add	sp,6
	mov	ah,0
	mov	word ptr [bp-4],ax
   ;	
   ;	        if (var_4 == 2) {
   ;	
	cmp	word ptr [bp-4],2
	jne	short @62@786
   ;	
   ;	            a->new_loop((uchar *)"bs3_dthr.l");
   ;	
	push	ds
	push	offset DGROUP:s@+543
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@new_loop$qnuc
	add	sp,8
   ;	
   ;	            a->state = 2;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+61],2
   ;	
   ;	            a->x_speed = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+20],0
   ;	
   ;	            a->y_speed = 1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+22],1
   ;	
   ;	            a->move_func = (movefn_t)0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	dword ptr es:[bx+66],large 0
   ;	
   ;	            a->flag_0 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	and	byte ptr es:[bx+82],254
   ;	
   ;	            score += 100000;
   ;	
	add	dword ptr DGROUP:_score,large 0000186A0h
   ;	
   ;	            return;
   ;	
	jmp	@62@1710
@62@786:
   ;	
   ;	        }
   ;	        if (var_4 == 1) {
   ;	
	cmp	word ptr [bp-4],1
	jne	short @62@898
   ;	
   ;	            if (random(3 - shot_size + 1) == 0 && a->facing_actor(cur_sub) == 0)
   ;	
	mov	al,byte ptr DGROUP:_shot_size
	mov	ah,0
	mov	dx,3
	sub	dx,ax
	inc	dx
	push	dx
	call	far ptr @random$qi
	pop	cx
	or	ax,ax
	jne	short @62@898
	push	word ptr DGROUP:_cur_sub+2
	push	word ptr DGROUP:_cur_sub
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@facing_actor$qn7m_actor
	add	sp,8
	or	al,al
	jne	short @62@898
   ;	
   ;	                a->door_open = 1;
   ;	
	les	bx,dword ptr [bp+6]
	or	byte ptr es:[bx+82],64
@62@898:
   ;	
   ;	        }
   ;	        if (a->counter_26 != 0)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+36],0
	je	short @62@954
   ;	
   ;	            a->counter_26--;
   ;	
	les	bx,dword ptr [bp+6]
	dec	word ptr es:[bx+36]
	jmp	short @62@1038
@62@954:
   ;	
   ;	        else if (a->facing_actor(cur_sub) != 0) {
   ;	
	push	word ptr DGROUP:_cur_sub+2
	push	word ptr DGROUP:_cur_sub
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@facing_actor$qn7m_actor
	add	sp,8
	or	al,al
	je	short @62@1038
   ;	
   ;	            diff_y = abs(a->center_y - cur_sub->center_y);
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+10]
	les	bx,dword ptr DGROUP:_cur_sub
	sub	ax,word ptr es:[bx+10]
	push	ax
	call	far ptr @abs$qi
	pop	cx
	mov	word ptr DGROUP:_diff_y,ax
   ;	
   ;	            if (diff_y < 0x28) {
   ;	
	cmp	word ptr DGROUP:_diff_y,40
	jge	short @62@1038
   ;	
   ;	                a->counter_26 = 5;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+36],5
   ;	
   ;	                add_missile(a, 2, 0x20);
   ;	
	push	32
	push	2
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @add_missile$qn7m_actoruci
	add	sp,8
@62@1038:
   ;	
   ;	            }
   ;	        }
   ;	    }
   ;	    if (a->facing_actor(cur_sub) == 0 && random(5) == 0)
   ;	
	push	word ptr DGROUP:_cur_sub+2
	push	word ptr DGROUP:_cur_sub
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@facing_actor$qn7m_actor
	add	sp,8
	or	al,al
	jne	short @62@1122
	push	5
	call	far ptr @random$qi
	pop	cx
	or	ax,ax
	jne	short @62@1122
   ;	
   ;	        a->door_open = 1;
   ;	
	les	bx,dword ptr [bp+6]
	or	byte ptr es:[bx+82],64
@62@1122:
   ;	
   ;	    if (a->counter_24 != 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+34],0
	je	short @62@1178
   ;	
   ;	        a->counter_24--;
   ;	
	les	bx,dword ptr [bp+6]
	dec	word ptr es:[bx+34]
   ;	
   ;	        a->door_open = 0;
   ;	
	les	bx,dword ptr [bp+6]
	and	byte ptr es:[bx+82],191
   ;	
   ;	    } else {
   ;	
	jmp	@62@1626
@62@1178:
   ;	
   ;	        var_2 = (a->target != 0) ? a->old_y + 0x0F : a->old_y;
   ;	
	les	bx,dword ptr [bp+6]
	cmp	dword ptr es:[bx+44],large 0
	je	short @62@1234
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+6]
	add	ax,15
	jmp	short @62@1262
@62@1234:
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+6]
@62@1262:
	mov	word ptr [bp-2],ax
   ;	
   ;	        a->y_speed = (cur_sub->center_y < var_2) ? -a->health : a->health;
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	mov	ax,word ptr es:[bx+10]
	cmp	ax,word ptr [bp-2]
	jge	short @62@1318
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+38]
	neg	ax
	jmp	short @62@1346
@62@1318:
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+38]
@62@1346:
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+22],ax
   ;	
   ;	        a->counter_24 = 0x0A;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+34],10
   ;	
   ;	        if (a->door_open) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,6
	and	ax,1
	or	ax,ax
	jne short	@@118
	jmp	@62@1626
@@118:
   ;	
   ;	            a->door_open = 0;
   ;	
	les	bx,dword ptr [bp+6]
	and	byte ptr es:[bx+82],191
   ;	
   ;	            a->x_speed = -a->x_speed;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+20]
	neg	ax
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+20],ax
   ;	
   ;	            if (a->direction == 1) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+52],1
	jne	short @62@1486
   ;	
   ;	                a->new_loop((uchar *)"bs3_bdr.l");
   ;	
	push	ds
	push	offset DGROUP:s@+554
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@new_loop$qnuc
	add	sp,8
   ;	
   ;	                if (a->target) a->target->new_loop((uchar *)"bs3_arr.l");
   ;	
	les	bx,dword ptr [bp+6]
	cmp	dword ptr es:[bx+44],large 0
	je	short @62@1570
	push	ds
	push	offset DGROUP:s@+564
	jmp	short @62@1542
   ;	
   ;	            } else {
   ;	
	jmp	short @62@1570
@62@1486:
   ;	
   ;	                a->new_loop((uchar *)"bs3_bdl.l");
   ;	
	push	ds
	push	offset DGROUP:s@+574
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@new_loop$qnuc
	add	sp,8
   ;	
   ;	                if (a->target) a->target->new_loop((uchar *)"bs3_arl.l");
   ;	
	les	bx,dword ptr [bp+6]
	cmp	dword ptr es:[bx+44],large 0
	je	short @62@1570
	push	ds
	push	offset DGROUP:s@+584
@62@1542:
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+46]
	push	word ptr es:[bx+44]
	call	far ptr @m_actor@new_loop$qnuc
	add	sp,8
@62@1570:
   ;	
   ;	            }
   ;	            a->direction ^= 1;
   ;	
	les	bx,dword ptr [bp+6]
	xor	byte ptr es:[bx+52],1
   ;	
   ;	            if (a->target) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	dword ptr es:[bx+44],large 0
	je	short @62@1626
   ;	
   ;	                a->target->direction ^= 1;
   ;	
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+44]
	xor	byte ptr es:[bx+52],1
   ;	
   ;	                a->target->set_cycle(0, 0);
   ;	
	push	0
	push	0
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+46]
	push	word ptr es:[bx+44]
	call	far ptr @m_actor@set_cycle$qucuc
	add	sp,8
@62@1626:
   ;	
   ;	            }
   ;	        }
   ;	    }
   ;	    if (cur_sub->field_36 == 0 && touching(a, cur_sub))
   ;	
	les	bx,dword ptr DGROUP:_cur_sub
	cmp	byte ptr es:[bx+54],0
	jne	short @62@1710
	push	word ptr DGROUP:_cur_sub+2
	push	word ptr DGROUP:_cur_sub
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @touching$qn7m_actort1
	add	sp,8
	or	al,al
	je	short @62@1710
   ;	
   ;	        hit_cur_sub(0, 1);
   ;	
	push	1
	push	0
	push	cs
	call	near ptr @hit_cur_sub$qii
	add	sp,4
@62@1710:
   ;	
   ;	}
   ;	
	leave	
	ret	
@do_bs3$qn7m_actor	endp
	?debug	C E9
	?debug	C FA00000000
CREATURE_TEXT	ends
_DATA	segment word public use16 'DATA'
s@	label	byte
	db	'subl.l'
	db	0
	db	'subr.l'
	db	0
	db	'gem.l'
	db	0
	db	'coin.l'
	db	0
	db	'pup'
	db	0
	db	'fish1r.l'
	db	0
	db	'fish2r.l'
	db	0
	db	'fish1l.l'
	db	0
	db	'fish2l.l'
	db	0
	db	'door'
	db	0
	db	'pup2'
	db	0
	db	'pup2'
	db	0
	db	'pup'
	db	0
	db	'probspin.l'
	db	0
	db	'drillhi'
	db	0
	db	'prober.l'
	db	0
	db	'probel.l'
	db	0
	db	'pup2'
	db	0
	db	'shipr.l'
	db	0
	db	'shipl.l'
	db	0
	db	'shpbmb.l'
	db	0
	db	'cannonr.l'
	db	0
	db	'cannonl.l'
	db	0
	db	'gem.l'
	db	0
	db	'dirhit'
	db	0
	db	'swish'
	db	0
	db	'shutl_r.l'
	db	0
	db	'shutl_l.l'
	db	0
	db	'firbaldn.l'
	db	0
	db	'fire1'
	db	0
	db	'firbalup.l'
	db	0
	db	'tent_out.l'
	db	0
	db	'tent_in.l'
	db	0
	db	'pirana'
	db	0
	db	'sharkr.l'
	db	0
	db	'sharkl.l'
	db	0
	db	'sharkdie.l'
	db	0
	db	'pirana'
	db	0
	db	'crabdie.l'
	db	0
	db	'pirana'
	db	0
	db	'serp_l.l'
	db	0
	db	'serp_r.l'
	db	0
	db	'serpdie.l'
	db	0
	db	'piranar.l'
	db	0
	db	'piranal.l'
	db	0
	db	'pirana'
	db	0
	db	'tulipl.l'
	db	0
	db	'tulipr.l'
	db	0
	db	'tulip.l'
	db	0
	db	'zap'
	db	0
	db	'freemine.l'
	db	0
	db	'mreal.l'
	db	0
	db	'dirhit'
	db	0
	db	'bs3_prpl.l'
	db	0
	db	'bs3_prpr.l'
	db	0
	db	'bs3_facl.l'
	db	0
	db	'bs3_facr.l'
	db	0
	db	'badgrunt'
	db	0
	db	'bs1dr.l'
	db	0
	db	'dirhit'
	db	0
	db	'bs1_bdr.l'
	db	0
	db	'bs1_bdl.l'
	db	0
	db	'badgrunt'
	db	0
	db	'exp3.l'
	db	0
	db	'dirhit'
	db	0
	db	'bs3_dthr.l'
	db	0
	db	'bs3_bdr.l'
	db	0
	db	'bs3_arr.l'
	db	0
	db	'bs3_bdl.l'
	db	0
	db	'bs3_arl.l'
	db	0
_DATA	ends
CREATURE_TEXT	segment byte public use16 'CODE'
CREATURE_TEXT	ends
	public	@do_fire_ball$qn7m_actor
	public	@do_mine2$qn7m_actor
	public	@do_follow$qn7m_actorii
	public	@do_ship_bomb$qn7m_actor
	extrn	@touching$qn7m_actort1:far
	public	@check_new_pos$qn7m_actoriinit4iii
	public	@check_horizontal_ray$qn7m_actorui
	public	@check_vertical_ray$qn7m_actorui
	public	@check_for_hit$qn7m_actoruc
	public	@check_flying_death$qn7m_actor
	public	@set_flying_death$qn7m_actornuciiuc
	public	@hit_cur_sub$qii
	public	@do_probe$qn7m_actor
	public	@do_bubble$qn7m_actor
	public	@do_door$qn7m_actor
	public	@do_switch$qn7m_actor
	public	@do_barrel$qn7m_actor
	public	@mv_barrel$qn7m_actornit2
	public	@do_pup$qn7m_actor
	public	@mv_ship$qn7m_actornit2
	public	@do_ship$qn7m_actor
	public	@do_cannon$qn7m_actor
	public	@do_clam$qn7m_actor
	public	@do_shuttle$qn7m_actor
	public	@do_fire_pit$qn7m_actor
	public	@do_spikes$qn7m_actor
	public	@do_tentacle$qn7m_actor
	public	@mv_shark$qn7m_actornit2
	public	@do_shark$qn7m_actor
	public	@do_jelly$qn7m_actor
	public	@do_gun_piece$qn7m_actor
	public	@do_crab$qn7m_actor
	public	@mv_pace$qn7m_actornit2
	public	@do_serpent$qn7m_actor
	public	@do_face$qn7m_actor
	public	@do_block$qn7m_actor
	public	@mv_pirana$qn7m_actornit2
	public	@do_pirana$qn7m_actor
	public	@do_duct_ud$qn7m_actor
	public	@do_duct_lr$qn7m_actor
	public	@do_chest$qn7m_actor
	public	@do_tulip$qn7m_actor
	public	@do_fish$qn7m_actor
	public	@do_zapper$qn7m_actor
	public	@do_mine1$qn7m_actor
	public	@do_bs3_face$qn7m_actor
	public	@do_bs3_prop$qn7m_actor
	public	@do_bs3a$qn7m_actor
	public	@do_bs3$qn7m_actor
	public	@do_bs2_eyes$qn7m_actor
	public	@do_bs2tn$qn7m_actor
	public	@do_bs2$qn7m_actor
	public	@do_bs1$qn7m_actor
	public	@mv_bs2tn$qn7m_actornit2
	public	@mv_std$qn7m_actornit2
	public	@do_pod$qn7m_actor
	public	@do_coin$qn7m_actor
	public	@do_score$qn7m_actor
	public	@mv_ego$qn7m_actornit2
	public	@do_ego$qn7m_actor
	extrn	@abs$qi:far
	extrn	@random$qi:far
	extrn	@turn_ego$qv:far
	extrn	@add_missile$qn7m_actoruci:far
	extrn	@add_explosion$qiiucnuc:far
	extrn	@add_jason$qv:far
	extrn	@add_map_item$quiui:far
	extrn	@post_message$quc:far
	extrn	@add_bubble$qiii:far
	public	@do_exp$qn7m_actor
	public	@do_missle$qn7m_actor
	extrn	@kill_ego$qii:far
	extrn	@update_key_guage$qv:far
	extrn	@update_gun$qv:far
	extrn	@update_men$qv:far
	extrn	@update_air_guage$qiii:far
	extrn	@update_shld_guage$qiii:far
	extrn	_diff_y:word
	extrn	_diff_x:word
	extrn	_shot_count:byte
	extrn	_top_shot_count:byte
	extrn	_death_type:byte
	extrn	_smart_missiles:byte
	extrn	_word_2BA88:word
	extrn	_word_2BA84:word
	extrn	_tbl_mul_tw:word
	extrn	_barrier_list:dword
	extrn	_barrier_count:byte
	extrn	_shootable_list:dword
	extrn	_shootable_count:byte
	extrn	_ego_map_h:word
	extrn	_ego_map_w:word
	extrn	_got_key:byte
	extrn	@score_at$qiii:far
	extrn	_goodies_found:byte
	extrn	_enemies_killed:byte
	extrn	_heavy_timer:word
	extrn	_control:byte
	extrn	_jason_present:byte
	extrn	_jason_on:byte
	extrn	_shot_size:byte
	extrn	_top_fire:byte
	extrn	_auto_fire:byte
	extrn	_jason_fire:byte
	extrn	_gun_count:byte
	extrn	_men:byte
	extrn	_score:word
	extrn	_act:dword
	extrn	_cur_sub:dword
	extrn	_jason:dword
	extrn	_ego:dword
	extrn	_the_map:dword
	extrn	_the_cast:dword
	extrn	_the_game:dword
	public	@gui_item@poll$qv
	extrn	@game_manager@play_sound$qnucuc:far
	extrn	@game_cast@add$qnucnvt2:far
	extrn	@m_actor@on_tile$qi:far
	extrn	@m_actor@tile_collision$qiii:far
	extrn	@m_actor@new_loop$qnuc:far
	extrn	@m_actor@set_cycle$qucuc:far
	extrn	@m_actor@set_xy$qii:far
	extrn	@m_actor@facing_actor$qn7m_actor:far
_pokeb	equ	pokeb
_poke	equ	poke
_peekb	equ	peekb
_peek	equ	peek
_s@	equ	s@
	end
