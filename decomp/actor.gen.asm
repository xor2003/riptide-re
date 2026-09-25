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
	?debug	S "actor.cpp"
	?debug	C E95A4B395D096163746F722E637070
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
ACTOR_TEXT	segment byte public use16 'CODE'
ACTOR_TEXT	ends
DGROUP	group	_DATA,_BSS
	assume	cs:ACTOR_TEXT,ds:DGROUP
_DATA	segment word public use16 'DATA'
d@	label	byte
d@w	label	word
_DATA	ends
_BSS	segment word public use16 'BSS'
b@	label	byte
b@w	label	word
_BSS	ends
ACTOR_TEXT	segment byte public use16 'CODE'
   ;	
   ;	m_actor::m_actor(uchar far *name, void far *mv, void far *upd)
   ;	
	assume	cs:ACTOR_TEXT
@m_actor@$bctr$qnucnvt2	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	
	cmp	dword ptr [bp+6],large 0
	jne	short @1@86
	push	84
	call	far ptr @$bnew$qui
	pop	cx
	mov	word ptr [bp+8],dx
	mov	word ptr [bp+6],ax
	or	ax,dx
	jne short	@@0
	jmp	@1@198
@@0:
@1@86:
   ;	
   ;	    update_func = (actfn_t)upd;
   ;	
	les	bx,dword ptr [bp+6]
	mov	eax,dword ptr [bp+18]
	mov	dword ptr es:[bx+62],eax
   ;	
   ;	    move_func   = (movefn_t)mv;
   ;	
	les	bx,dword ptr [bp+6]
	mov	eax,dword ptr [bp+14]
	mov	dword ptr es:[bx+66],eax
   ;	
   ;	    field_37 = field_28 = counter_24 = counter_26 = health = field_1E = counter_22 = field_2A = 0;
   ;	
	les	bx,dword ptr [bp+6]
	xor	ax,ax
	mov	word ptr es:[bx+42],ax
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+32],ax
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+30],ax
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+38],ax
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+36],ax
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+34],ax
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+40],ax
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+55],al
   ;	
   ;	    x = y = x_speed = y_speed = 0;
   ;	
	les	bx,dword ptr [bp+6]
	xor	ax,ax
	mov	word ptr es:[bx+22],ax
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+20],ax
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+2],ax
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx],ax
   ;	
   ;	    cycle_speed = field_36 = type = state = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,0
	mov	byte ptr es:[bx+61],al
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+53],al
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+54],al
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+58],al
   ;	
   ;	    if (num_frames == 1) frame = 0; else frame = 1;
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+59],1
	jne	short @1@142
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+56],0
	jmp	short @1@170
@1@142:
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+56],1
@1@170:
   ;	
   ;	    flag_0 = in_window = no_erase = flag_3 = new_sprite = inactive = door_open = flag_7 = flag_8 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	and	byte ptr es:[bx+83],254
	mov	al,0
	les	bx,dword ptr [bp+6]
	and	byte ptr es:[bx+82],127
	mov	dx,ax
	shl	al,7
	or	byte ptr es:[bx+82],al
	and	dx,1
	les	bx,dword ptr [bp+6]
	and	byte ptr es:[bx+82],191
	mov	ax,dx
	shl	dl,6
	or	byte ptr es:[bx+82],dl
	and	ax,1
	les	bx,dword ptr [bp+6]
	and	byte ptr es:[bx+82],223
	mov	dx,ax
	shl	al,5
	or	byte ptr es:[bx+82],al
	and	dx,1
	les	bx,dword ptr [bp+6]
	and	byte ptr es:[bx+82],239
	mov	ax,dx
	shl	dl,4
	or	byte ptr es:[bx+82],dl
	and	ax,1
	les	bx,dword ptr [bp+6]
	and	byte ptr es:[bx+82],247
	mov	dx,ax
	shl	al,3
	or	byte ptr es:[bx+82],al
	and	dx,1
	les	bx,dword ptr [bp+6]
	and	byte ptr es:[bx+82],251
	mov	ax,dx
	shl	dl,2
	or	byte ptr es:[bx+82],dl
	and	ax,1
	les	bx,dword ptr [bp+6]
	and	byte ptr es:[bx+82],253
	mov	dx,ax
	shl	al,1
	or	byte ptr es:[bx+82],al
	and	dx,1
	les	bx,dword ptr [bp+6]
	and	byte ptr es:[bx+82],254
	or	byte ptr es:[bx+82],dl
   ;	
   ;	    height = width = 0;
   ;	
	les	bx,dword ptr [bp+6]
	xor	ax,ax
	mov	word ptr es:[bx+16],ax
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+18],ax
   ;	
   ;	    new_loop(name);
   ;	
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @m_actor@new_loop$qnuc
	add	sp,8
   ;	
   ;	    target = linked = 0;
   ;	
	les	bx,dword ptr [bp+6]
	xor	eax,eax
	mov	dword ptr es:[bx+48],eax
	les	bx,dword ptr [bp+6]
	mov	dword ptr es:[bx+44],eax
   ;	
   ;	    field_4E = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	dword ptr es:[bx+78],large 0
@1@198:
   ;	
   ;	}
   ;	
	mov	dx,word ptr [bp+8]
	mov	ax,word ptr [bp+6]
	pop	bp
	ret	
@m_actor@$bctr$qnucnvt2	endp
   ;	
   ;	m_actor::~m_actor()
   ;	
	assume	cs:ACTOR_TEXT
@m_actor@$bdtr$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	
	cmp	dword ptr [bp+6],large 0
	je	short @2@114
	test	word ptr [bp+10],1
	je	short @2@114
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @$bdele$qnv
	add	sp,4
@2@114:
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@m_actor@$bdtr$qv	endp
   ;	
   ;	byte m_actor::facing_actor(m_actor far *other)
   ;	
	assume	cs:ACTOR_TEXT
@m_actor@facing_actor$qn7m_actor	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (center_x < other->center_x && direction == 0)
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+8]
	les	bx,dword ptr [bp+10]
	cmp	ax,word ptr es:[bx+8]
	jge	short @3@114
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+52],0
	jne	short @3@114
@3@86:
   ;	
   ;	        return 1;
   ;	
	mov	al,1
	jmp	short @3@226
@3@114:
   ;	
   ;	    if (center_x > other->center_x && direction == 1)
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+8]
	les	bx,dword ptr [bp+10]
	cmp	ax,word ptr es:[bx+8]
	jle	short @3@198
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+52],1
	jne	short @3@198
	jmp	short @3@86
@3@198:
   ;	
   ;	        return 1;
   ;	    return 0;
   ;	
	mov	al,0
@3@226:
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@m_actor@facing_actor$qn7m_actor	endp
   ;	
   ;	void m_actor::check_in_window()
   ;	
	assume	cs:ACTOR_TEXT
@m_actor@check_in_window$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (old_x >= the_map->field_0C &&
   ;	
   ;	
   ;	        the_map->field_0C + the_map->field_18 >= x &&
   ;	        old_y >= the_map->field_0E &&
   ;	        the_map->field_0E + the_map->field_1A >= y)
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+4]
	les	bx,dword ptr DGROUP:_the_map
	cmp	ax,word ptr es:[bx+12]
	jl	short @4@170
	les	bx,dword ptr DGROUP:_the_map
	mov	ax,word ptr es:[bx+12]
	les	bx,dword ptr DGROUP:_the_map
	add	ax,word ptr es:[bx+24]
	les	bx,dword ptr [bp+6]
	cmp	ax,word ptr es:[bx]
	jl	short @4@170
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+6]
	les	bx,dword ptr DGROUP:_the_map
	cmp	ax,word ptr es:[bx+14]
	jl	short @4@170
	les	bx,dword ptr DGROUP:_the_map
	mov	ax,word ptr es:[bx+14]
	les	bx,dword ptr DGROUP:_the_map
	add	ax,word ptr es:[bx+26]
	les	bx,dword ptr [bp+6]
	cmp	ax,word ptr es:[bx+2]
	jl	short @4@170
   ;	
   ;	        in_window = 1;
   ;	
	les	bx,dword ptr [bp+6]
	or	byte ptr es:[bx+82],2
	jmp	short @4@198
@4@170:
   ;	
   ;	    else
   ;	        in_window = 0;
   ;	
	les	bx,dword ptr [bp+6]
	and	byte ptr es:[bx+82],253
@4@198:
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@m_actor@check_in_window$qv	endp
   ;	
   ;	void m_actor::set_xy(int x, int y)
   ;	
	assume	cs:ACTOR_TEXT
@m_actor@set_xy$qii	proc	far
	push	bp
	mov	bp,sp
	push	si
   ;	
   ;	{
   ;	    this->x = x;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp+10]
	mov	word ptr es:[bx],ax
   ;	
   ;	    this->y = y;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp+12]
	mov	word ptr es:[bx+2],ax
   ;	
   ;	    this->old_x = this->x + width;
   ;	
	les	bx,dword ptr [bp+6]
	push	es
	les	si,dword ptr [bp+6]
	mov	ax,word ptr es:[si]
	pop	es
	add	ax,word ptr es:[bx+16]
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+4],ax
   ;	
   ;	    this->old_y = this->y + height;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+18]
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+6],ax
   ;	
   ;	    this->center_x = this->x + (width >> 1);
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+16]
	sar	ax,1
	les	bx,dword ptr [bp+6]
	mov	dx,word ptr es:[bx]
	add	dx,ax
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+8],dx
   ;	
   ;	    this->center_y = this->y + (height >> 1);
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	mov	dx,word ptr es:[bx+18]
	sar	dx,1
	add	ax,dx
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+10],ax
   ;	
   ;	    check_in_window();
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @m_actor@check_in_window$qv
	add	sp,4
   ;	
   ;	    if (in_window) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,1
	and	ax,1
	or	ax,ax
	je	short @5@142
   ;	
   ;	        if (ed_list_size >= 0x63)
   ;	
	cmp	byte ptr DGROUP:_ed_list_size,99
	jb	short @5@114
   ;	
   ;	            terminate((uchar far *)"Too many actors in ed_list.", (uchar far *)0);
   ;	
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@
	call	far ptr @terminate$qnuct1
	add	sp,8
@5@114:
   ;	
   ;	        ed_list[ed_list_size] = this;
   ;	
	mov	al,byte ptr DGROUP:_ed_list_size
	mov	ah,0
	shl	ax,2
	mov	dx,word ptr [bp+8]
	mov	bx,word ptr [bp+6]
	mov	si,ax
	mov	word ptr DGROUP:_ed_list[si+2],dx
	mov	word ptr DGROUP:_ed_list[si],bx
   ;	
   ;	        ed_list_size++;
   ;	
	inc	byte ptr DGROUP:_ed_list_size
@5@142:
   ;	
   ;	    }
   ;	    map_pos = tbl_mul_tw[this->y >> 3] + (this->x >> 3);
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
   ;	}
   ;	
	pop	si
	pop	bp
	ret	
@m_actor@set_xy$qii	endp
   ;	
   ;	void m_actor::new_loop(uchar far *s2)
   ;	
	assume	cs:ACTOR_TEXT
@m_actor@new_loop$qnuc	proc	far
	push	bp
	mov	bp,sp
	push	si
   ;	
   ;	{
   ;	    sprite_data = s2;
   ;	
	les	bx,dword ptr [bp+6]
	mov	eax,dword ptr [bp+10]
	mov	dword ptr es:[bx+74],eax
   ;	
   ;	    new_sprite = 1;
   ;	
	les	bx,dword ptr [bp+6]
	or	byte ptr es:[bx+82],16
   ;	
   ;	    field_0C = width;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+16]
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+12],ax
   ;	
   ;	    field_0E = height;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+18]
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+14],ax
   ;	
   ;	    loop_data = (loop_res far *)the_game->get_loop(s2);
   ;	
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	push	word ptr DGROUP:_the_game+2
	push	word ptr DGROUP:_the_game
	call	far ptr @game_manager@get_loop$qnuc
	add	sp,8
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+72],dx
	mov	word ptr es:[bx+70],ax
   ;	
   ;	    if (loop_data == 0)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	dword ptr es:[bx+70],large 0
	jne	short @6@86
   ;	
   ;	        terminate((uchar far *)"Error looking for loop : ", s2);
   ;	
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	push	ds
	push	offset DGROUP:s@+28
	call	far ptr @terminate$qnuct1
	add	sp,8
@6@86:
   ;	
   ;	    width  = loop_data->frames[0]->w;
   ;	
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+70]
	les	bx,dword ptr es:[bx+6]
	mov	ax,word ptr es:[bx+6]
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+16],ax
   ;	
   ;	    height = loop_data->frames[0]->h;
   ;	
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+70]
	les	bx,dword ptr es:[bx+6]
	mov	ax,word ptr es:[bx+4]
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+18],ax
   ;	
   ;	    field_1A = (width  >> 3) + 1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+16]
	sar	ax,3
	inc	ax
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+26],ax
   ;	
   ;	    field_1C = (height >> 3) + 1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+18]
	sar	ax,3
	inc	ax
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+28],ax
   ;	
   ;	    old_x = x + width;
   ;	
	les	bx,dword ptr [bp+6]
	push	es
	les	si,dword ptr [bp+6]
	mov	ax,word ptr es:[si]
	pop	es
	add	ax,word ptr es:[bx+16]
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+4],ax
   ;	
   ;	    old_y = y + height;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+18]
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+6],ax
   ;	
   ;	    center_x = x + (width >> 1);
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+16]
	sar	ax,1
	les	bx,dword ptr [bp+6]
	mov	dx,word ptr es:[bx]
	add	dx,ax
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+8],dx
   ;	
   ;	    center_y = y + (height >> 1);
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	mov	dx,word ptr es:[bx+18]
	sar	dx,1
	add	ax,dx
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+10],ax
   ;	
   ;	    current_loop = cycle_timer = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,0
	mov	byte ptr es:[bx+57],al
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+60],al
   ;	
   ;	    num_frames   = loop_data->num_frames;
   ;	
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+70]
	mov	al,byte ptr es:[bx]
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+59],al
   ;	
   ;	}
   ;	
	pop	si
	pop	bp
	ret	
@m_actor@new_loop$qnuc	endp
   ;	
   ;	void m_actor::erase()
   ;	
	assume	cs:ACTOR_TEXT
@m_actor@erase$qv	proc	far
	push	bp
	mov	bp,sp
	push	si
   ;	
   ;	{
   ;	    if (in_window) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,1
	and	ax,1
	or	ax,ax
	jne short	@@1
	jmp	@7@226
@@1:
   ;	
   ;	        if (no_erase) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,2
	and	ax,1
	or	ax,ax
	je	short @7@142
   ;	
   ;	            no_erase = 0;
   ;	
	les	bx,dword ptr [bp+6]
	and	byte ptr es:[bx+82],251
@7@114:
   ;	
   ;	            return;
   ;	
	jmp	@7@226
@7@142:
   ;	
   ;	        }
   ;	        if (new_sprite) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,4
	and	ax,1
	or	ax,ax
	je	short @7@198
   ;	
   ;	            the_map->erase_bits(x, y, x + field_0C, y + field_0E);
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+14]
	push	ax
	les	bx,dword ptr [bp+6]
	push	es
	les	si,dword ptr [bp+6]
	mov	ax,word ptr es:[si]
	pop	es
	add	ax,word ptr es:[bx+12]
	push	ax
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx]
	push	word ptr DGROUP:_the_map+2
	push	word ptr DGROUP:_the_map
	call	far ptr @tilemap@erase_bits$qiiii
	add	sp,12
   ;	
   ;	            new_sprite = 0;
   ;	
	les	bx,dword ptr [bp+6]
	and	byte ptr es:[bx+82],239
	jmp	short @7@114
@7@198:
   ;	
   ;	        }
   ;	        else
   ;	            the_map->erase_bits(x, y, x + width, y + height);
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+18]
	push	ax
	les	bx,dword ptr [bp+6]
	push	es
	les	si,dword ptr [bp+6]
	mov	ax,word ptr es:[si]
	pop	es
	add	ax,word ptr es:[bx+16]
	push	ax
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx]
	push	word ptr DGROUP:_the_map+2
	push	word ptr DGROUP:_the_map
	call	far ptr @tilemap@erase_bits$qiiii
	add	sp,12
@7@226:
   ;	
   ;	    }
   ;	}
   ;	
	pop	si
	pop	bp
	ret	
@m_actor@erase$qv	endp
   ;	
   ;	byte m_actor::on_tile(int attr)
   ;	
	assume	cs:ACTOR_TEXT
@m_actor@on_tile$qi	proc	far
	enter	6,0
   ;	
   ;	{
   ;	    uchar var_6, var_5;
   ;	    word  var_2, var_4;
   ;	
   ;	    var_2 = map_pos;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+24]
	mov	word ptr [bp-4],ax
   ;	
   ;	    var_4 = the_map->map_width - field_1A;
   ;	
	les	bx,dword ptr DGROUP:_the_map
	mov	ax,word ptr es:[bx+142]
	les	bx,dword ptr [bp+6]
	sub	ax,word ptr es:[bx+26]
	mov	word ptr [bp-6],ax
   ;	
   ;	    for (var_6 = 0; var_6 < field_1C; var_6++) {
   ;	
	mov	byte ptr [bp-1],0
	jmp	short @8@254
@8@58:
   ;	
   ;	        for (var_5 = 0; var_5 < field_1A; var_5++) {
   ;	
	mov	byte ptr [bp-2],0
	jmp	short @8@170
@8@86:
   ;	
   ;	            if (the_map->tile_attr[var_2++].attr == attr)
   ;	
	mov	ax,word ptr [bp-4]
	inc	word ptr [bp-4]
	shl	ax,2
	les	bx,dword ptr DGROUP:_the_map
	les	bx,dword ptr es:[bx+926]
	add	bx,ax
	mov	ax,word ptr es:[bx]
	cmp	ax,word ptr [bp+10]
	jne	short @8@142
   ;	
   ;	                return var_6 + 1;
   ;	
	mov	al,byte ptr [bp-1]
	inc	al
	jmp	short @8@310
@8@142:
	inc	byte ptr [bp-2]
@8@170:
	mov	al,byte ptr [bp-2]
	mov	ah,0
	les	bx,dword ptr [bp+6]
	cmp	ax,word ptr es:[bx+26]
	jl	short @8@86
   ;	
   ;	        }
   ;	        var_2 += var_4;
   ;	
	mov	ax,word ptr [bp-6]
	add	word ptr [bp-4],ax
	inc	byte ptr [bp-1]
@8@254:
	mov	al,byte ptr [bp-1]
	mov	ah,0
	les	bx,dword ptr [bp+6]
	cmp	ax,word ptr es:[bx+28]
	jl	short @8@58
   ;	
   ;	    }
   ;	    return 0;
   ;	
	mov	al,0
@8@310:
   ;	
   ;	}
   ;	
	leave	
	ret	
@m_actor@on_tile$qi	endp
   ;	
   ;	uchar m_actor::on_pos(uint pos)
   ;	
	assume	cs:ACTOR_TEXT
@m_actor@on_pos$qui	proc	far
	enter	6,0
   ;	
   ;	{
   ;	    uchar var_6, var_5;
   ;	    word  var_2, var_4;
   ;	
   ;	    var_2 = map_pos;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+24]
	mov	word ptr [bp-4],ax
   ;	
   ;	    var_4 = the_map->map_width - field_1A;
   ;	
	les	bx,dword ptr DGROUP:_the_map
	mov	ax,word ptr es:[bx+142]
	les	bx,dword ptr [bp+6]
	sub	ax,word ptr es:[bx+26]
	mov	word ptr [bp-6],ax
   ;	
   ;	    for (var_6 = 0; var_6 < field_1C; var_6++) {
   ;	
	mov	byte ptr [bp-1],0
	jmp	short @9@254
@9@58:
   ;	
   ;	        for (var_5 = 0; var_5 < field_1A; var_5++) {
   ;	
	mov	byte ptr [bp-2],0
	jmp	short @9@170
@9@86:
   ;	
   ;	            if (var_2++ == pos)
   ;	
	mov	ax,word ptr [bp-4]
	inc	word ptr [bp-4]
	cmp	ax,word ptr [bp+10]
	jne	short @9@142
   ;	
   ;	                return 1;
   ;	
	mov	al,1
	jmp	short @9@310
@9@142:
	inc	byte ptr [bp-2]
@9@170:
	mov	al,byte ptr [bp-2]
	mov	ah,0
	les	bx,dword ptr [bp+6]
	cmp	ax,word ptr es:[bx+26]
	jl	short @9@86
   ;	
   ;	        }
   ;	        var_2 += var_4;
   ;	
	mov	ax,word ptr [bp-6]
	add	word ptr [bp-4],ax
	inc	byte ptr [bp-1]
@9@254:
	mov	al,byte ptr [bp-1]
	mov	ah,0
	les	bx,dword ptr [bp+6]
	cmp	ax,word ptr es:[bx+28]
	jl	short @9@58
   ;	
   ;	    }
   ;	    return 0;
   ;	
	mov	al,0
@9@310:
   ;	
   ;	}
   ;	
	leave	
	ret	
@m_actor@on_pos$qui	endp
   ;	
   ;	void m_actor::set_cycle(uchar speed, uchar frame)
   ;	
	assume	cs:ACTOR_TEXT
@m_actor@set_cycle$qucuc	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    this->frame       = frame;
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr [bp+12]
	mov	byte ptr es:[bx+56],al
   ;	
   ;	    this->cycle_speed = speed;
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr [bp+10]
	mov	byte ptr es:[bx+58],al
   ;	
   ;	    this->cycle_timer = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+57],0
   ;	
   ;	    if (frame == 5 || frame == 8)
   ;	
	cmp	byte ptr [bp+12],5
	je	short @10@86
	cmp	byte ptr [bp+12],8
	je short	@@2
	jmp	@10@114
@@2:
@10@86:
   ;	
   ;	    {
   ;	        current_loop = num_frames - 1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+59]
	add	al,255
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+60],al
   ;	
   ;	        width  = loop_data->frames[current_loop]->w;
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+60]
	mov	ah,0
	shl	ax,2
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+70]
	add	bx,ax
	les	bx,dword ptr es:[bx+6]
	mov	ax,word ptr es:[bx+6]
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+16],ax
   ;	
   ;	        height = loop_data->frames[current_loop]->h;
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+60]
	mov	ah,0
	shl	ax,2
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+70]
	add	bx,ax
	les	bx,dword ptr es:[bx+6]
	mov	ax,word ptr es:[bx+4]
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+18],ax
   ;	
   ;	        field_1A = (width  >> 3) + 1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+16]
	sar	ax,3
	inc	ax
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+26],ax
   ;	
   ;	        field_1C = (height >> 3) + 1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+18]
	sar	ax,3
	inc	ax
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+28],ax
@10@114:
   ;	
   ;	    }
   ;	}
   ;	
	pop	bp
	ret	
@m_actor@set_cycle$qucuc	endp
   ;	
   ;	byte touching(m_actor far *a, m_actor far *b)
   ;	
	assume	cs:ACTOR_TEXT
@touching$qn7m_actort1	proc	far
	enter	48,0
   ;	
   ;	{
   ;	    int var_2, var_4, var_6, var_8, var_A, var_C, var_E, var_10;
   ;	    int var_24, var_22, var_1E, var_26, var_28, var_20;
   ;	    int var_2E, var_30, var_2A, var_2C;
   ;	    uchar far *var_18, *var_1C;
   ;	    m_actor far *var_14;
   ;	
   ;	    if (a->flag_0 || b->flag_0)
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	and	ax,1
	or	ax,ax
	jne	short @11@86
	les	bx,dword ptr [bp+10]
	mov	al,byte ptr es:[bx+82]
	and	ax,1
	or	ax,ax
	je	short @11@114
@11@86:
	jmp	@11@982
@11@114:
   ;	
   ;	        return 0;
   ;	    if (a->inactive || b->inactive)
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,5
	and	ax,1
	or	ax,ax
	jne	short @11@170
	les	bx,dword ptr [bp+10]
	mov	al,byte ptr es:[bx+82]
	shr	ax,5
	and	ax,1
	or	ax,ax
	je	short @11@198
@11@170:
   ;	
   ;	        return 0;
   ;	
	jmp	@11@982
@11@198:
   ;	
   ;	    if (b->y < a->y) { var_14 = a; a = b; b = var_14; }
   ;	
	les	bx,dword ptr [bp+10]
	mov	ax,word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	cmp	ax,word ptr es:[bx+2]
	jge	short @11@254
	mov	eax,dword ptr [bp+6]
	mov	dword ptr [bp-48],eax
	mov	eax,dword ptr [bp+10]
	mov	dword ptr [bp+6],eax
	mov	eax,dword ptr [bp-48]
	mov	dword ptr [bp+10],eax
@11@254:
   ;	
   ;	    var_2 = a->x;      var_4 = a->y;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx]
	mov	word ptr [bp-2],ax
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	mov	word ptr [bp-4],ax
   ;	
   ;	    var_6 = a->width;  var_8 = a->height;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+16]
	mov	word ptr [bp-6],ax
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+18]
	mov	word ptr [bp-8],ax
   ;	
   ;	    var_A = b->x;      var_C = b->y;
   ;	
	les	bx,dword ptr [bp+10]
	mov	ax,word ptr es:[bx]
	mov	word ptr [bp-10],ax
	les	bx,dword ptr [bp+10]
	mov	ax,word ptr es:[bx+2]
	mov	word ptr [bp-12],ax
   ;	
   ;	    var_E = b->width;  var_10 = b->height;
   ;	
	les	bx,dword ptr [bp+10]
	mov	ax,word ptr es:[bx+16]
	mov	word ptr [bp-14],ax
	les	bx,dword ptr [bp+10]
	mov	ax,word ptr es:[bx+18]
	mov	word ptr [bp-16],ax
   ;	
   ;	    if (var_2 + var_6 <= var_A) return 0;
   ;	
	mov	ax,word ptr [bp-2]
	add	ax,word ptr [bp-6]
	cmp	ax,word ptr [bp-10]
	jg	short @11@310
	jmp	@11@982
@11@310:
   ;	
   ;	    if (var_A + var_E <= var_2) return 0;
   ;	
	mov	ax,word ptr [bp-10]
	add	ax,word ptr [bp-14]
	cmp	ax,word ptr [bp-2]
	jg	short @11@366
	jmp	@11@982
@11@366:
   ;	
   ;	    if (var_4 + var_8 <= var_C) return 0;
   ;	
	mov	ax,word ptr [bp-4]
	add	ax,word ptr [bp-8]
	cmp	ax,word ptr [bp-12]
	jg	short @11@422
	jmp	@11@982
@11@422:
   ;	
   ;	    if (var_C + var_10 <= var_4) return 0;
   ;	
	mov	ax,word ptr [bp-12]
	add	ax,word ptr [bp-16]
	cmp	ax,word ptr [bp-4]
	jg	short @11@478
	jmp	@11@982
@11@478:
   ;	
   ;	    var_24 = var_C - var_4;
   ;	
	mov	ax,word ptr [bp-12]
	sub	ax,word ptr [bp-4]
	mov	word ptr [bp-18],ax
   ;	
   ;	    if (var_2 < var_A) {
   ;	
	mov	ax,word ptr [bp-2]
	cmp	ax,word ptr [bp-10]
	jge	short @11@590
   ;	
   ;	        var_22 = var_A - var_2;
   ;	
	mov	ax,word ptr [bp-10]
	sub	ax,word ptr [bp-2]
	mov	word ptr [bp-20],ax
   ;	
   ;	        var_1E = var_6 - var_22;
   ;	
	mov	ax,word ptr [bp-6]
	sub	ax,word ptr [bp-20]
	mov	word ptr [bp-22],ax
   ;	
   ;	        if (var_1E > var_E) var_1E = var_E;
   ;	
	mov	ax,word ptr [bp-22]
	cmp	ax,word ptr [bp-14]
	jle	short @11@562
	mov	ax,word ptr [bp-14]
	mov	word ptr [bp-22],ax
@11@562:
   ;	
   ;	        var_26 = var_6 * var_24 + var_22;
   ;	
	mov	ax,word ptr [bp-6]
	imul	word ptr [bp-18]
	add	ax,word ptr [bp-20]
	mov	word ptr [bp-24],ax
   ;	
   ;	        var_28 = 0;
   ;	
	mov	word ptr [bp-26],0
   ;	
   ;	    } else {
   ;	
	jmp	short @11@674
@11@590:
   ;	
   ;	        var_22 = var_2 - var_A;
   ;	
	mov	ax,word ptr [bp-2]
	sub	ax,word ptr [bp-10]
	mov	word ptr [bp-20],ax
   ;	
   ;	        var_1E = var_E - var_22;
   ;	
	mov	ax,word ptr [bp-14]
	sub	ax,word ptr [bp-20]
	mov	word ptr [bp-22],ax
   ;	
   ;	        if (var_1E > var_6) var_1E = var_6;
   ;	
	mov	ax,word ptr [bp-22]
	cmp	ax,word ptr [bp-6]
	jle	short @11@646
	mov	ax,word ptr [bp-6]
	mov	word ptr [bp-22],ax
@11@646:
   ;	
   ;	        var_26 = var_6 * var_24;
   ;	
	mov	ax,word ptr [bp-6]
	imul	word ptr [bp-18]
	mov	word ptr [bp-24],ax
   ;	
   ;	        var_28 = var_22;
   ;	
	mov	ax,word ptr [bp-20]
	mov	word ptr [bp-26],ax
@11@674:
   ;	
   ;	    }
   ;	    if (var_C + var_10 <= var_4 + var_8)
   ;	
	mov	ax,word ptr [bp-12]
	add	ax,word ptr [bp-16]
	mov	dx,word ptr [bp-4]
	add	dx,word ptr [bp-8]
	cmp	ax,dx
	jg	short @11@730
   ;	
   ;	        var_20 = var_10;
   ;	
	mov	ax,word ptr [bp-16]
	jmp	short @11@758
@11@730:
   ;	
   ;	    else
   ;	        var_20 = var_8 - var_24;
   ;	
	mov	ax,word ptr [bp-8]
	sub	ax,word ptr [bp-18]
@11@758:
	mov	word ptr [bp-28],ax
   ;	
   ;	    var_18 = a->loop_data->frames[a->current_loop]->bitmap;
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+60]
	mov	ah,0
	shl	ax,2
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+70]
	add	bx,ax
	les	bx,dword ptr es:[bx+6]
	mov	ax,word ptr es:[bx+2]
	mov	dx,word ptr es:[bx]
	mov	word ptr [bp-38],ax
	mov	word ptr [bp-40],dx
   ;	
   ;	    var_1C = b->loop_data->frames[b->current_loop]->bitmap;
   ;	
	les	bx,dword ptr [bp+10]
	mov	al,byte ptr es:[bx+60]
	mov	ah,0
	shl	ax,2
	les	bx,dword ptr [bp+10]
	les	bx,dword ptr es:[bx+70]
	add	bx,ax
	les	bx,dword ptr es:[bx+6]
	mov	ax,word ptr es:[bx+2]
	mov	dx,word ptr es:[bx]
	mov	word ptr [bp-42],ax
	mov	word ptr [bp-44],dx
   ;	
   ;	    var_2E = var_6 - var_1E;
   ;	
	mov	ax,word ptr [bp-6]
	sub	ax,word ptr [bp-22]
	mov	word ptr [bp-30],ax
   ;	
   ;	    var_30 = var_E - var_1E;
   ;	
	mov	ax,word ptr [bp-14]
	sub	ax,word ptr [bp-22]
	mov	word ptr [bp-32],ax
   ;	
   ;	    var_2A = 0;
   ;	
	mov	word ptr [bp-34],0
   ;	
   ;	    var_2C = var_20;
   ;	
	mov	ax,word ptr [bp-28]
	mov	word ptr [bp-36],ax
	jmp	short @11@954
@11@814:
   ;	
   ;	    while (var_2C) {
   ;	        if (var_18[var_26] != 0 && var_1C[var_28] != 0)
   ;	
	les	bx,dword ptr [bp-40]
	add	bx,word ptr [bp-24]
	cmp	byte ptr es:[bx],0
	je	short @11@898
	les	bx,dword ptr [bp-44]
	add	bx,word ptr [bp-26]
	cmp	byte ptr es:[bx],0
	je	short @11@898
   ;	
   ;	            return 1;
   ;	
	mov	al,1
	jmp	short @11@1010
@11@898:
   ;	
   ;	        var_26++; var_28++; var_2A++;
   ;	
	inc	word ptr [bp-24]
	inc	word ptr [bp-26]
	inc	word ptr [bp-34]
   ;	
   ;	        if (var_2A == var_1E) {
   ;	
	mov	ax,word ptr [bp-34]
	cmp	ax,word ptr [bp-22]
	jne	short @11@954
   ;	
   ;	            var_26 += var_2E;
   ;	
	mov	ax,word ptr [bp-30]
	add	word ptr [bp-24],ax
   ;	
   ;	            var_28 += var_30;
   ;	
	mov	ax,word ptr [bp-32]
	add	word ptr [bp-26],ax
   ;	
   ;	            var_2C--;
   ;	
	dec	word ptr [bp-36]
   ;	
   ;	            var_2A = 0;
   ;	
	mov	word ptr [bp-34],0
@11@954:
	cmp	word ptr [bp-36],0
	jne	short @11@814
@11@982:
   ;	
   ;	        }
   ;	    }
   ;	    return 0;
   ;	
	mov	al,0
@11@1010:
   ;	
   ;	}
   ;	
	leave	
	ret	
@touching$qn7m_actort1	endp
   ;	
   ;	game_cast::game_cast()
   ;	
	assume	cs:ACTOR_TEXT
@game_cast@$bctr$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	
	cmp	dword ptr [bp+6],large 0
	jne	short @12@86
	push	802
	call	far ptr @$bnew$qui
	pop	cx
	mov	word ptr [bp+8],dx
	mov	word ptr [bp+6],ax
	or	ax,dx
	je	short @12@114
@12@86:
   ;	
   ;	    count = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx],0
   ;	
   ;	    ed_list_size = 0;
   ;	
	mov	byte ptr DGROUP:_ed_list_size,0
@12@114:
   ;	
   ;	}
   ;	
	mov	dx,word ptr [bp+8]
	mov	ax,word ptr [bp+6]
	pop	bp
	ret	
@game_cast@$bctr$qv	endp
   ;	
   ;	m_actor far *game_cast::add(uchar far *name, void far *a, void far *b)
   ;	
	assume	cs:ACTOR_TEXT
@game_cast@add$qnucnvt2	proc	far
	push	bp
	mov	bp,sp
	push	si
   ;	
   ;	{
   ;	    if (count == 0xC8)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx],200
	jne	short @13@86
   ;	
   ;	        return 0;
   ;	
	xor	dx,dx
	xor	ax,ax
	jmp	@13@170
@13@86:
   ;	
   ;	    actors[count] = new m_actor(name, a, b);
   ;	
	push	word ptr [bp+20]
	push	word ptr [bp+18]
	push	word ptr [bp+16]
	push	word ptr [bp+14]
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	push	0
	push	0
	push	cs
	call	near ptr @m_actor@$bctr$qnucnvt2
	add	sp,16
	les	bx,dword ptr [bp+6]
	mov	bl,byte ptr es:[bx]
	mov	bh,0
	shl	bx,2
	les	si,dword ptr [bp+6]
	add	si,bx
	mov	word ptr es:[si+4],dx
	mov	word ptr es:[si+2],ax
   ;	
   ;	    if (actors[count] == 0)
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx]
	mov	ah,0
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	mov	ax,word ptr es:[bx+2]
	or	ax,word ptr es:[bx+4]
	jne	short @13@142
   ;	
   ;	        no_heap((uchar far *)"Adding actor to cast.");
   ;	
	push	ds
	push	offset DGROUP:s@+54
	call	far ptr @no_heap$qnuc
	add	sp,4
@13@142:
   ;	
   ;	    return actors[count++];
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx]
	inc	byte ptr es:[bx]
	mov	ah,0
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	mov	dx,word ptr es:[bx+4]
	mov	ax,word ptr es:[bx+2]
@13@170:
   ;	
   ;	}
   ;	
	pop	si
	pop	bp
	ret	
@game_cast@add$qnucnvt2	endp
   ;	
   ;	void game_cast::kill_all()
   ;	
	assume	cs:ACTOR_TEXT
@game_cast@kill_all$qv	proc	far
	enter	2,0
   ;	
   ;	{
   ;	    uchar i;
   ;	    for (i = 0; i < count; i++)
   ;	
	mov	byte ptr [bp-1],0
	jmp	short @14@114
@14@58:
   ;	
   ;	        actors[i]->erase();
   ;	
	mov	al,byte ptr [bp-1]
	mov	ah,0
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	push	word ptr es:[bx+4]
	push	word ptr es:[bx+2]
	push	cs
	call	near ptr @m_actor@erase$qv
	add	sp,4
	inc	byte ptr [bp-1]
@14@114:
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx]
	cmp	al,byte ptr [bp-1]
	ja	short @14@58
   ;	
   ;	    for (i = 0; i < count; i++)
   ;	
	mov	byte ptr [bp-1],0
	jmp	short @14@226
@14@170:
   ;	
   ;	        delete actors[i];
   ;	
	push	3
	mov	al,byte ptr [bp-1]
	mov	ah,0
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	push	word ptr es:[bx+4]
	push	word ptr es:[bx+2]
	push	cs
	call	near ptr @m_actor@$bdtr$qv
	add	sp,6
	inc	byte ptr [bp-1]
@14@226:
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx]
	cmp	al,byte ptr [bp-1]
	ja	short @14@170
   ;	
   ;	    count = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx],0
   ;	
   ;	    ed_list_size = 0;
   ;	
	mov	byte ptr DGROUP:_ed_list_size,0
   ;	
   ;	}
   ;	
	leave	
	ret	
@game_cast@kill_all$qv	endp
   ;	
   ;	void game_cast::remove(uchar idx)
   ;	
	assume	cs:ACTOR_TEXT
@game_cast@remove$quc	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    delete actors[idx];
   ;	
	push	3
	mov	al,byte ptr [bp+10]
	mov	ah,0
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	push	word ptr es:[bx+4]
	push	word ptr es:[bx+2]
	push	cs
	call	near ptr @m_actor@$bdtr$qv
	add	sp,6
   ;	
   ;	    my_movsd(&actors[idx], &actors[idx + 1], count - idx);
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx]
	mov	ah,0
	mov	dl,byte ptr [bp+10]
	mov	dh,0
	sub	ax,dx
	push	ax
	mov	al,byte ptr [bp+10]
	mov	ah,0
	inc	ax
	shl	ax,2
	mov	dx,word ptr [bp+6]
	add	dx,ax
	add	dx,2
	push	word ptr [bp+8]
	push	dx
	mov	al,byte ptr [bp+10]
	mov	ah,0
	shl	ax,2
	mov	dx,word ptr [bp+6]
	add	dx,ax
	add	dx,2
	push	word ptr [bp+8]
	push	dx
	call	far ptr _my_movsd
	add	sp,10
   ;	
   ;	    count--;
   ;	
	les	bx,dword ptr [bp+6]
	dec	byte ptr es:[bx]
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@game_cast@remove$quc	endp
   ;	
   ;	void m_actor::cycle()
   ;	
	assume	cs:ACTOR_TEXT
@m_actor@cycle$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (frame == 0)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+56],0
	jne short	@@3
	jmp	@16@1094
@@3:
   ;	
   ;	        return;
   ;	    if (inactive)
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,5
	and	ax,1
	or	ax,ax
	je short	@@4
	jmp	@16@1094
@@4:
   ;	
   ;	        return;
   ;	    if (cycle_timer++ != cycle_speed)
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+57]
	inc	byte ptr es:[bx+57]
	les	bx,dword ptr [bp+6]
	cmp	al,byte ptr es:[bx+58]
	je short	@@5
	jmp	@16@1094
@@5:
   ;	
   ;	        return;
   ;	    cycle_timer = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+57],0
   ;	
   ;	    switch (frame)
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+56]
	mov	ah,0
	dec	ax
	mov	bx,ax
	cmp	bx,9
	jbe short	@@6
	jmp	@16@1066
@@6:
	shl	bx,1
	jmp	word ptr cs:@16@C914[bx]
@16@226:
   ;	
   ;	    {
   ;	    case 1:
   ;	        ++current_loop;
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+60]
	inc	al
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+60],al
   ;	
   ;	        if (current_loop == num_frames) current_loop = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+60]
	les	bx,dword ptr [bp+6]
	cmp	al,byte ptr es:[bx+59]
	je short	@@7
	jmp	@16@1066
@@7:
@16@254:
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+60],0
	jmp	@16@1066
   ;	
   ;	        break;
   ;	
	jmp	@16@1066
@16@310:
   ;	
   ;	    case 2:
   ;	        if (current_loop++ == num_frames - 2) flag_0 = 1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+60]
	inc	byte ptr es:[bx+60]
	mov	ah,0
	les	bx,dword ptr [bp+6]
	mov	dl,byte ptr es:[bx+59]
	mov	dh,0
	add	dx,-2
	cmp	ax,dx
	je short	@@8
	jmp	@16@1066
@@8:
	les	bx,dword ptr [bp+6]
	or	byte ptr es:[bx+82],1
	jmp	@16@1066
   ;	
   ;	        break;
   ;	
	jmp	@16@1066
@16@394:
   ;	
   ;	    case 3:
   ;	    case 4:
   ;	        ++current_loop;
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+60]
	inc	al
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+60],al
   ;	
   ;	        if (current_loop == num_frames) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+60]
	les	bx,dword ptr [bp+6]
	cmp	al,byte ptr es:[bx+59]
	je short	@@9
	jmp	@16@1066
@@9:
   ;	
   ;	            if (frame == 4) current_loop = num_frames - 1;
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+56],4
	jne	short @16@478
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+59]
	add	al,255
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+60],al
	jmp	short @16@618
@16@478:
	jmp	short @16@590
	jmp	short @16@618
   ;	
   ;	            else            current_loop = 0;
   ;	            frame = 0;
   ;	        }
   ;	        break;
   ;	
	jmp	@16@1066
@16@562:
   ;	
   ;	    case 5:
   ;	        if (current_loop-- == 0) { current_loop = 0; frame = 0; }
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+60]
	dec	byte ptr es:[bx+60]
	or	al,al
	je short	@@10
	jmp	@16@1066
@@10:
@16@590:
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+60],0
@16@618:
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+56],0
	jmp	@16@1066
   ;	
   ;	        break;
   ;	
	jmp	@16@1066
@16@674:
   ;	
   ;	    case 6:
   ;	        ++current_loop;
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+60]
	inc	al
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+60],al
   ;	
   ;	        if (current_loop == num_frames) { current_loop = num_frames - 2; frame = 7; }
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+60]
	les	bx,dword ptr [bp+6]
	cmp	al,byte ptr es:[bx+59]
	je short	@@11
	jmp	@16@1066
@@11:
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+59]
	add	al,254
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+60],al
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+56],7
	jmp	@16@1066
   ;	
   ;	        break;
   ;	
	jmp	@16@1066
@16@758:
   ;	
   ;	    case 7:
   ;	        if (current_loop-- == 0) { current_loop = 1; frame = 6; }
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+60]
	dec	byte ptr es:[bx+60]
	or	al,al
	jne	short @16@1066
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+60],1
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+56],6
	jmp	short @16@1066
   ;	
   ;	        break;
   ;	
	jmp	short @16@1066
@16@842:
   ;	
   ;	    case 8:
   ;	        --current_loop;
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+60]
	add	al,255
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+60],al
   ;	
   ;	        if (current_loop == 0xFF) current_loop = num_frames - 1;
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+60],255
	jne	short @16@1066
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+59]
	add	al,255
	jmp	short @16@1038
   ;	
   ;	        break;
   ;	
	jmp	short @16@1066
@16@926:
   ;	
   ;	    case 9:
   ;	        ++current_loop;
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+60]
	inc	al
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+60],al
   ;	
   ;	        if (current_loop == 2) current_loop = 0;
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+60],2
	jne	short @16@1066
	jmp	@16@254
   ;	
   ;	        break;
   ;	
	jmp	short @16@1066
@16@1010:
   ;	
   ;	    case 10:
   ;	        current_loop = random(num_frames);
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+59]
	mov	ah,0
	push	ax
	call	far ptr @random$qi
	pop	cx
@16@1038:
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+60],al
   ;	
   ;	        break;
   ;	
@16@1066:
   ;	
   ;	    }
   ;	    width  = loop_data->frames[current_loop]->w;
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+60]
	mov	ah,0
	shl	ax,2
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+70]
	add	bx,ax
	les	bx,dword ptr es:[bx+6]
	mov	ax,word ptr es:[bx+6]
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+16],ax
   ;	
   ;	    height = loop_data->frames[current_loop]->h;
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+60]
	mov	ah,0
	shl	ax,2
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+70]
	add	bx,ax
	les	bx,dword ptr es:[bx+6]
	mov	ax,word ptr es:[bx+4]
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+18],ax
   ;	
   ;	    field_1A = (width  >> 3) + 1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+16]
	sar	ax,3
	inc	ax
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+26],ax
   ;	
   ;	    field_1C = (height >> 3) + 1;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+18]
	sar	ax,3
	inc	ax
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+28],ax
@16@1094:
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@m_actor@cycle$qv	endp
@16@C914	label	word
	dw	@16@226
	dw	@16@310
	dw	@16@394
	dw	@16@394
	dw	@16@562
	dw	@16@674
	dw	@16@758
	dw	@16@842
	dw	@16@926
	dw	@16@1010
   ;	
   ;	void m_actor::move()
   ;	
	assume	cs:ACTOR_TEXT
@m_actor@move$qv	proc	far
	enter	4,0
	push	si
   ;	
   ;	{
   ;	    int var_2, var_4;
   ;	    if (flag_0)
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	and	ax,1
	or	ax,ax
	je short	@@12
	jmp	@17@338
@@12:
   ;	
   ;	        return;
   ;	    if (update_func)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	dword ptr es:[bx+62],large 0
	je	short @17@114
   ;	
   ;	        update_func(this);
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	les	bx,dword ptr [bp+6]
	call	dword ptr es:[bx+62]
	add	sp,4
@17@114:
   ;	
   ;	    if (move_func) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	dword ptr es:[bx+66],large 0
	je	short @17@170
   ;	
   ;	        var_2 = x + x_speed;
   ;	
	les	bx,dword ptr [bp+6]
	push	es
	les	si,dword ptr [bp+6]
	mov	ax,word ptr es:[si]
	pop	es
	add	ax,word ptr es:[bx+20]
	mov	word ptr [bp-2],ax
   ;	
   ;	        var_4 = y + y_speed;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+22]
	mov	word ptr [bp-4],ax
   ;	
   ;	        move_func(this, &var_2, &var_4);
   ;	
	push	ss
	lea	ax,word ptr [bp-4]
	push	ax
	push	ss
	lea	ax,word ptr [bp-2]
	push	ax
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	les	bx,dword ptr [bp+6]
	call	dword ptr es:[bx+66]
	add	sp,12
   ;	
   ;	        x = var_2;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp-2]
	mov	word ptr es:[bx],ax
   ;	
   ;	        y = var_4;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp-4]
	mov	word ptr es:[bx+2],ax
   ;	
   ;	    } else {
   ;	
	jmp	short @17@198
@17@170:
   ;	
   ;	        x += x_speed;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+20]
	les	bx,dword ptr [bp+6]
	add	word ptr es:[bx],ax
   ;	
   ;	        y += y_speed;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+22]
	les	bx,dword ptr [bp+6]
	add	word ptr es:[bx+2],ax
@17@198:
   ;	
   ;	    }
   ;	    old_x = x + width;
   ;	
	les	bx,dword ptr [bp+6]
	push	es
	les	si,dword ptr [bp+6]
	mov	ax,word ptr es:[si]
	pop	es
	add	ax,word ptr es:[bx+16]
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+4],ax
   ;	
   ;	    old_y = y + height;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+18]
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+6],ax
   ;	
   ;	    center_x = x + (width  >> 1);
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+16]
	sar	ax,1
	les	bx,dword ptr [bp+6]
	mov	dx,word ptr es:[bx]
	add	dx,ax
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+8],dx
   ;	
   ;	    center_y = y + (height >> 1);
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	mov	dx,word ptr es:[bx+18]
	sar	dx,1
	add	ax,dx
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+10],ax
   ;	
   ;	    map_pos = tbl_mul_tw[y >> 3] + (x >> 3);
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
   ;	    check_in_window();
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @m_actor@check_in_window$qv
	add	sp,4
   ;	
   ;	    if (in_window) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,1
	and	ax,1
	or	ax,ax
	je	short @17@338
   ;	
   ;	        if (this == ego)
   ;	
	mov	eax,dword ptr [bp+6]
	cmp	eax,dword ptr DGROUP:_ego
	je	short @17@338
   ;	
   ;	            return;
   ;	        if (ed_list_size >= 0x63)
   ;	
	cmp	byte ptr DGROUP:_ed_list_size,99
	jb	short @17@310
   ;	
   ;	            terminate((uchar far *)"Too many actors to draw.", (uchar far *)0);
   ;	
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+76
	call	far ptr @terminate$qnuct1
	add	sp,8
@17@310:
   ;	
   ;	        ed_list[ed_list_size] = this;
   ;	
	mov	al,byte ptr DGROUP:_ed_list_size
	mov	ah,0
	shl	ax,2
	mov	dx,word ptr [bp+8]
	mov	bx,word ptr [bp+6]
	mov	si,ax
	mov	word ptr DGROUP:_ed_list[si+2],dx
	mov	word ptr DGROUP:_ed_list[si],bx
   ;	
   ;	        ed_list_size++;
   ;	
	inc	byte ptr DGROUP:_ed_list_size
@17@338:
   ;	
   ;	    }
   ;	}
   ;	
	pop	si
	leave	
	ret	
@m_actor@move$qv	endp
   ;	
   ;	void m_actor::draw()
   ;	
	assume	cs:ACTOR_TEXT
@m_actor@draw$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (new_sprite == 1)
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,4
	and	ax,1
	cmp	ax,1
	jne	short @18@86
   ;	
   ;	        new_sprite = 0;
   ;	
	les	bx,dword ptr [bp+6]
	and	byte ptr es:[bx+82],239
@18@86:
   ;	
   ;	    if (!in_window)
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	shr	ax,1
	and	ax,1
	or	ax,ax
	jne short	@@13
	jmp	@18@226
@@13:
   ;	
   ;	        return;
   ;	    if (flag_0 == 1)
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+82]
	and	ax,1
	cmp	ax,1
	jne short	@@14
	jmp	@18@226
@@14:
   ;	
   ;	        return;
   ;	    the_map->put_bits_masked(x, y, width, height,
   ;	
   ;	
   ;	        loop_data->frames[current_loop]->bitmap, 0, field_36);
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+54]
	push	ax
	push	0
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+60]
	mov	ah,0
	shl	ax,2
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+70]
	add	bx,ax
	les	bx,dword ptr es:[bx+6]
	push	word ptr es:[bx+2]
	push	word ptr es:[bx]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+18]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+16]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+2]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx]
	push	word ptr DGROUP:_the_map+2
	push	word ptr DGROUP:_the_map
	call	far ptr @tilemap@put_bits_masked$qiiiinucuiuc
	add	sp,20
   ;	
   ;	    if (field_36 == 0)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+54],0
	je	short @18@226
   ;	
   ;	        return;
   ;	    if (field_37++ == 1) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+55]
	inc	byte ptr es:[bx+55]
	cmp	al,1
	jne	short @18@226
   ;	
   ;	        field_37 = field_36 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,0
	mov	byte ptr es:[bx+54],al
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+55],al
@18@226:
   ;	
   ;	    }
   ;	}
   ;	
	pop	bp
	ret	
@m_actor@draw$qv	endp
   ;	
   ;	uchar m_actor::tile_collision(int arg4, int arg6, int arg8)
   ;	
	assume	cs:ACTOR_TEXT
@m_actor@tile_collision$qiii	proc	far
	enter	12,0
   ;	
   ;	{
   ;	    uchar var_B = 0;
   ;	
	mov	byte ptr [bp-1],0
   ;	
   ;	    int var_8, var_A, var_4, var_6;
   ;	    uint var_2;
   ;	    if (arg4 == 0) {
   ;	
	cmp	word ptr [bp+10],0
	jne	short @19@86
   ;	
   ;	        var_8 = field_1A;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+26]
	mov	word ptr [bp-4],ax
   ;	
   ;	        var_A = field_1C;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+28]
	jmp	short @19@114
@19@86:
   ;	
   ;	    } else {
   ;	        var_8 = arg4 - arg8;
   ;	
	mov	ax,word ptr [bp+10]
	sub	ax,word ptr [bp+14]
	mov	word ptr [bp-4],ax
   ;	
   ;	        var_A = arg6;
   ;	
	mov	ax,word ptr [bp+12]
@19@114:
	mov	word ptr [bp-6],ax
   ;	
   ;	    }
   ;	    var_4 = map_pos + arg8;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+24]
	add	ax,word ptr [bp+14]
	mov	word ptr [bp-8],ax
   ;	
   ;	    var_6 = var_4 + tbl_mul_tw[var_A - 1];
   ;	
	mov	bx,word ptr [bp-6]
	shl	bx,1
	mov	ax,word ptr [bp-8]
	add	ax,word ptr DGROUP:_tbl_mul_tw[bx-2]
	mov	word ptr [bp-10],ax
   ;	
   ;	    for (var_2 = 0; var_2 < var_8; var_2++) {
   ;	
	mov	word ptr [bp-12],0
	jmp	short @19@338
@19@170:
   ;	
   ;	        if (the_map->tile_attr[var_4].attr < 0x100) var_B |= 1;
   ;	
	les	bx,dword ptr DGROUP:_the_map
	les	bx,dword ptr es:[bx+926]
	mov	ax,word ptr [bp-8]
	shl	ax,2
	add	bx,ax
	cmp	word ptr es:[bx],256
	jae	short @19@226
	or	byte ptr [bp-1],1
@19@226:
   ;	
   ;	        if (the_map->tile_attr[var_6].attr < 0x100) var_B |= 4;
   ;	
	les	bx,dword ptr DGROUP:_the_map
	les	bx,dword ptr es:[bx+926]
	mov	ax,word ptr [bp-10]
	shl	ax,2
	add	bx,ax
	cmp	word ptr es:[bx],256
	jae	short @19@282
	or	byte ptr [bp-1],4
@19@282:
   ;	
   ;	        var_4++;
   ;	
	inc	word ptr [bp-8]
   ;	
   ;	        var_6++;
   ;	
	inc	word ptr [bp-10]
	inc	word ptr [bp-12]
@19@338:
	mov	ax,word ptr [bp-12]
	cmp	ax,word ptr [bp-4]
	jb	short @19@170
   ;	
   ;	    }
   ;	    var_4 = map_pos + arg8;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+24]
	add	ax,word ptr [bp+14]
	mov	word ptr [bp-8],ax
   ;	
   ;	    var_6 = var_4 + var_8 - 1;
   ;	
	mov	ax,word ptr [bp-8]
	add	ax,word ptr [bp-4]
	dec	ax
	mov	word ptr [bp-10],ax
   ;	
   ;	    for (var_2 = 0; var_2 < var_A; var_2++) {
   ;	
	mov	word ptr [bp-12],0
	jmp	short @19@562
@19@394:
   ;	
   ;	        if (the_map->tile_attr[var_4].attr < 0x100) var_B |= 2;
   ;	
	les	bx,dword ptr DGROUP:_the_map
	les	bx,dword ptr es:[bx+926]
	mov	ax,word ptr [bp-8]
	shl	ax,2
	add	bx,ax
	cmp	word ptr es:[bx],256
	jae	short @19@450
	or	byte ptr [bp-1],2
@19@450:
   ;	
   ;	        if (the_map->tile_attr[var_6].attr < 0x100) var_B |= 8;
   ;	
	les	bx,dword ptr DGROUP:_the_map
	les	bx,dword ptr es:[bx+926]
	mov	ax,word ptr [bp-10]
	shl	ax,2
	add	bx,ax
	cmp	word ptr es:[bx],256
	jae	short @19@506
	or	byte ptr [bp-1],8
@19@506:
   ;	
   ;	        var_4 += the_map->map_width;
   ;	
	les	bx,dword ptr DGROUP:_the_map
	mov	ax,word ptr es:[bx+142]
	add	word ptr [bp-8],ax
   ;	
   ;	        var_6 += the_map->map_width;
   ;	
	les	bx,dword ptr DGROUP:_the_map
	mov	ax,word ptr es:[bx+142]
	add	word ptr [bp-10],ax
	inc	word ptr [bp-12]
@19@562:
	mov	ax,word ptr [bp-12]
	cmp	ax,word ptr [bp-6]
	jb	short @19@394
   ;	
   ;	    }
   ;	    return var_B;
   ;	
	mov	al,byte ptr [bp-1]
   ;	
   ;	}
   ;	
	leave	
	ret	
@m_actor@tile_collision$qiii	endp
   ;	
   ;	void game_cast::update(uchar arg4)
   ;	
	assume	cs:ACTOR_TEXT
@game_cast@update$quc	proc	far
	enter	12,0
   ;	
   ;	{
   ;	    int var_2, var_4, var_6, var_8, var_A, var_C;
   ;	    if (arg4 == 0) {
   ;	
	cmp	byte ptr [bp+10],0
	jne	short @20@170
   ;	
   ;	        ego->erase();
   ;	
	push	word ptr DGROUP:_ego+2
	push	word ptr DGROUP:_ego
	push	cs
	call	near ptr @m_actor@erase$qv
	add	sp,4
   ;	
   ;	        var_2 = 0;
   ;	
	mov	word ptr [bp-2],0
	jmp	short @20@114
@20@86:
   ;	
   ;	        while (var_2 < ed_list_size)
   ;	            ed_list[var_2++]->erase();
   ;	
	mov	bx,word ptr [bp-2]
	inc	word ptr [bp-2]
	shl	bx,2
	push	word ptr DGROUP:_ed_list[bx+2]
	push	word ptr DGROUP:_ed_list[bx]
	push	cs
	call	near ptr @m_actor@erase$qv
	add	sp,4
@20@114:
	mov	al,byte ptr DGROUP:_ed_list_size
	mov	ah,0
	cmp	ax,word ptr [bp-2]
	jg	short @20@86
   ;	
   ;	    } else {
   ;	
	jmp	short @20@254
@20@170:
   ;	
   ;	        var_2 = 0;
   ;	
	mov	word ptr [bp-2],0
	jmp	short @20@226
@20@198:
   ;	
   ;	        while (var_2 < ed_list_size) {
   ;	            ed_list[var_2]->new_sprite = 0;
   ;	
	mov	bx,word ptr [bp-2]
	shl	bx,2
	les	bx,dword ptr DGROUP:_ed_list[bx]
	and	byte ptr es:[bx+82],239
   ;	
   ;	            ed_list[var_2]->no_erase = 0;
   ;	
	mov	bx,word ptr [bp-2]
	shl	bx,2
	les	bx,dword ptr DGROUP:_ed_list[bx]
	and	byte ptr es:[bx+82],251
   ;	
   ;	            var_2++;
   ;	
	inc	word ptr [bp-2]
@20@226:
	mov	al,byte ptr DGROUP:_ed_list_size
	mov	ah,0
	cmp	ax,word ptr [bp-2]
	jg	short @20@198
@20@254:
   ;	
   ;	        }
   ;	    }
   ;	    ed_list_size = 0;
   ;	
	mov	byte ptr DGROUP:_ed_list_size,0
   ;	
   ;	    var_2 = 0;
   ;	
	mov	word ptr [bp-2],0
	jmp	short @20@366
@20@282:
   ;	
   ;	    while (var_2 < count) {
   ;	        if (actors[var_2]->flag_0 == 1)
   ;	
	mov	ax,word ptr [bp-2]
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	les	bx,dword ptr es:[bx+2]
	mov	al,byte ptr es:[bx+82]
	and	ax,1
	cmp	ax,1
	jne	short @20@338
   ;	
   ;	            remove(var_2);
   ;	
	mov	al,byte ptr [bp-2]
	push	ax
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @game_cast@remove$quc
	add	sp,6
@20@338:
   ;	
   ;	        var_2++;
   ;	
	inc	word ptr [bp-2]
@20@366:
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx]
	mov	ah,0
	cmp	ax,word ptr [bp-2]
	jg	short @20@282
   ;	
   ;	    }
   ;	    var_6 = count & 0xF;
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx]
	mov	ah,0
	and	ax,15
	mov	word ptr [bp-6],ax
   ;	
   ;	    var_8 = count >> 4;
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx]
	mov	ah,0
	sar	ax,4
	mov	word ptr [bp-8],ax
   ;	
   ;	    var_A = var_8 << 4;
   ;	
	mov	ax,word ptr [bp-8]
	shl	ax,4
	mov	word ptr [bp-10],ax
   ;	
   ;	    var_C = var_A + var_6;
   ;	
	mov	ax,word ptr [bp-10]
	add	ax,word ptr [bp-6]
	mov	word ptr [bp-12],ax
   ;	
   ;	    var_4 = 0;
   ;	
	mov	word ptr [bp-4],0
	jmp	@20@450
@20@422:
   ;	
   ;	    while (var_4 < var_8) {
   ;	        var_2 = var_4 << 4;
   ;	
	mov	ax,word ptr [bp-4]
	shl	ax,4
	mov	word ptr [bp-2],ax
   ;	
   ;	        actors[var_2 + 0]->cycle(); actors[var_2 + 0]->move();
   ;	
	mov	ax,word ptr [bp-2]
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	push	word ptr es:[bx+4]
	push	word ptr es:[bx+2]
	push	cs
	call	near ptr @m_actor@cycle$qv
	add	sp,4
	mov	ax,word ptr [bp-2]
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	push	word ptr es:[bx+4]
	push	word ptr es:[bx+2]
	push	cs
	call	near ptr @m_actor@move$qv
	add	sp,4
   ;	
   ;	        actors[var_2 + 1]->cycle(); actors[var_2 + 1]->move();
   ;	
	mov	ax,word ptr [bp-2]
	inc	ax
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	push	word ptr es:[bx+4]
	push	word ptr es:[bx+2]
	push	cs
	call	near ptr @m_actor@cycle$qv
	add	sp,4
	mov	ax,word ptr [bp-2]
	inc	ax
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	push	word ptr es:[bx+4]
	push	word ptr es:[bx+2]
	push	cs
	call	near ptr @m_actor@move$qv
	add	sp,4
   ;	
   ;	        actors[var_2 + 2]->cycle(); actors[var_2 + 2]->move();
   ;	
	mov	ax,word ptr [bp-2]
	add	ax,2
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	push	word ptr es:[bx+4]
	push	word ptr es:[bx+2]
	push	cs
	call	near ptr @m_actor@cycle$qv
	add	sp,4
	mov	ax,word ptr [bp-2]
	add	ax,2
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	push	word ptr es:[bx+4]
	push	word ptr es:[bx+2]
	push	cs
	call	near ptr @m_actor@move$qv
	add	sp,4
   ;	
   ;	        actors[var_2 + 3]->cycle(); actors[var_2 + 3]->move();
   ;	
	mov	ax,word ptr [bp-2]
	add	ax,3
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	push	word ptr es:[bx+4]
	push	word ptr es:[bx+2]
	push	cs
	call	near ptr @m_actor@cycle$qv
	add	sp,4
	mov	ax,word ptr [bp-2]
	add	ax,3
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	push	word ptr es:[bx+4]
	push	word ptr es:[bx+2]
	push	cs
	call	near ptr @m_actor@move$qv
	add	sp,4
   ;	
   ;	        actors[var_2 + 4]->cycle(); actors[var_2 + 4]->move();
   ;	
	mov	ax,word ptr [bp-2]
	add	ax,4
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	push	word ptr es:[bx+4]
	push	word ptr es:[bx+2]
	push	cs
	call	near ptr @m_actor@cycle$qv
	add	sp,4
	mov	ax,word ptr [bp-2]
	add	ax,4
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	push	word ptr es:[bx+4]
	push	word ptr es:[bx+2]
	push	cs
	call	near ptr @m_actor@move$qv
	add	sp,4
   ;	
   ;	        actors[var_2 + 5]->cycle(); actors[var_2 + 5]->move();
   ;	
	mov	ax,word ptr [bp-2]
	add	ax,5
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	push	word ptr es:[bx+4]
	push	word ptr es:[bx+2]
	push	cs
	call	near ptr @m_actor@cycle$qv
	add	sp,4
	mov	ax,word ptr [bp-2]
	add	ax,5
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	push	word ptr es:[bx+4]
	push	word ptr es:[bx+2]
	push	cs
	call	near ptr @m_actor@move$qv
	add	sp,4
   ;	
   ;	        actors[var_2 + 6]->cycle(); actors[var_2 + 6]->move();
   ;	
	mov	ax,word ptr [bp-2]
	add	ax,6
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	push	word ptr es:[bx+4]
	push	word ptr es:[bx+2]
	push	cs
	call	near ptr @m_actor@cycle$qv
	add	sp,4
	mov	ax,word ptr [bp-2]
	add	ax,6
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	push	word ptr es:[bx+4]
	push	word ptr es:[bx+2]
	push	cs
	call	near ptr @m_actor@move$qv
	add	sp,4
   ;	
   ;	        actors[var_2 + 7]->cycle(); actors[var_2 + 7]->move();
   ;	
	mov	ax,word ptr [bp-2]
	add	ax,7
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	push	word ptr es:[bx+4]
	push	word ptr es:[bx+2]
	push	cs
	call	near ptr @m_actor@cycle$qv
	add	sp,4
	mov	ax,word ptr [bp-2]
	add	ax,7
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	push	word ptr es:[bx+4]
	push	word ptr es:[bx+2]
	push	cs
	call	near ptr @m_actor@move$qv
	add	sp,4
   ;	
   ;	        actors[var_2 + 8]->cycle(); actors[var_2 + 8]->move();
   ;	
	mov	ax,word ptr [bp-2]
	add	ax,8
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	push	word ptr es:[bx+4]
	push	word ptr es:[bx+2]
	push	cs
	call	near ptr @m_actor@cycle$qv
	add	sp,4
	mov	ax,word ptr [bp-2]
	add	ax,8
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	push	word ptr es:[bx+4]
	push	word ptr es:[bx+2]
	push	cs
	call	near ptr @m_actor@move$qv
	add	sp,4
   ;	
   ;	        actors[var_2 + 9]->cycle(); actors[var_2 + 9]->move();
   ;	
	mov	ax,word ptr [bp-2]
	add	ax,9
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	push	word ptr es:[bx+4]
	push	word ptr es:[bx+2]
	push	cs
	call	near ptr @m_actor@cycle$qv
	add	sp,4
	mov	ax,word ptr [bp-2]
	add	ax,9
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	push	word ptr es:[bx+4]
	push	word ptr es:[bx+2]
	push	cs
	call	near ptr @m_actor@move$qv
	add	sp,4
   ;	
   ;	        actors[var_2 + 10]->cycle(); actors[var_2 + 10]->move();
   ;	
	mov	ax,word ptr [bp-2]
	add	ax,10
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	push	word ptr es:[bx+4]
	push	word ptr es:[bx+2]
	push	cs
	call	near ptr @m_actor@cycle$qv
	add	sp,4
	mov	ax,word ptr [bp-2]
	add	ax,10
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	push	word ptr es:[bx+4]
	push	word ptr es:[bx+2]
	push	cs
	call	near ptr @m_actor@move$qv
	add	sp,4
   ;	
   ;	        actors[var_2 + 11]->cycle(); actors[var_2 + 11]->move();
   ;	
	mov	ax,word ptr [bp-2]
	add	ax,11
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	push	word ptr es:[bx+4]
	push	word ptr es:[bx+2]
	push	cs
	call	near ptr @m_actor@cycle$qv
	add	sp,4
	mov	ax,word ptr [bp-2]
	add	ax,11
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	push	word ptr es:[bx+4]
	push	word ptr es:[bx+2]
	push	cs
	call	near ptr @m_actor@move$qv
	add	sp,4
   ;	
   ;	        actors[var_2 + 12]->cycle(); actors[var_2 + 12]->move();
   ;	
	mov	ax,word ptr [bp-2]
	add	ax,12
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	push	word ptr es:[bx+4]
	push	word ptr es:[bx+2]
	push	cs
	call	near ptr @m_actor@cycle$qv
	add	sp,4
	mov	ax,word ptr [bp-2]
	add	ax,12
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	push	word ptr es:[bx+4]
	push	word ptr es:[bx+2]
	push	cs
	call	near ptr @m_actor@move$qv
	add	sp,4
   ;	
   ;	        actors[var_2 + 13]->cycle(); actors[var_2 + 13]->move();
   ;	
	mov	ax,word ptr [bp-2]
	add	ax,13
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	push	word ptr es:[bx+4]
	push	word ptr es:[bx+2]
	push	cs
	call	near ptr @m_actor@cycle$qv
	add	sp,4
	mov	ax,word ptr [bp-2]
	add	ax,13
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	push	word ptr es:[bx+4]
	push	word ptr es:[bx+2]
	push	cs
	call	near ptr @m_actor@move$qv
	add	sp,4
   ;	
   ;	        actors[var_2 + 14]->cycle(); actors[var_2 + 14]->move();
   ;	
	mov	ax,word ptr [bp-2]
	add	ax,14
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	push	word ptr es:[bx+4]
	push	word ptr es:[bx+2]
	push	cs
	call	near ptr @m_actor@cycle$qv
	add	sp,4
	mov	ax,word ptr [bp-2]
	add	ax,14
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	push	word ptr es:[bx+4]
	push	word ptr es:[bx+2]
	push	cs
	call	near ptr @m_actor@move$qv
	add	sp,4
   ;	
   ;	        actors[var_2 + 15]->cycle(); actors[var_2 + 15]->move();
   ;	
	mov	ax,word ptr [bp-2]
	add	ax,15
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	push	word ptr es:[bx+4]
	push	word ptr es:[bx+2]
	push	cs
	call	near ptr @m_actor@cycle$qv
	add	sp,4
	mov	ax,word ptr [bp-2]
	add	ax,15
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	push	word ptr es:[bx+4]
	push	word ptr es:[bx+2]
	push	cs
	call	near ptr @m_actor@move$qv
	add	sp,4
   ;	
   ;	        var_4++;
   ;	
	inc	word ptr [bp-4]
@20@450:
	mov	ax,word ptr [bp-4]
	cmp	ax,word ptr [bp-8]
	jge short	@@15
	jmp	@20@422
@@15:
   ;	
   ;	    }
   ;	    var_2 = var_A;
   ;	
	mov	ax,word ptr [bp-10]
	mov	word ptr [bp-2],ax
	jmp	short @20@534
@20@506:
   ;	
   ;	    while (var_2 < var_C) {
   ;	        actors[var_2]->cycle();
   ;	
	mov	ax,word ptr [bp-2]
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	push	word ptr es:[bx+4]
	push	word ptr es:[bx+2]
	push	cs
	call	near ptr @m_actor@cycle$qv
	add	sp,4
   ;	
   ;	        actors[var_2]->move();
   ;	
	mov	ax,word ptr [bp-2]
	shl	ax,2
	les	bx,dword ptr [bp+6]
	add	bx,ax
	push	word ptr es:[bx+4]
	push	word ptr es:[bx+2]
	push	cs
	call	near ptr @m_actor@move$qv
	add	sp,4
   ;	
   ;	        var_2++;
   ;	
	inc	word ptr [bp-2]
@20@534:
	mov	ax,word ptr [bp-2]
	cmp	ax,word ptr [bp-12]
	jl	short @20@506
   ;	
   ;	    }
   ;	    ego->draw();
   ;	
	push	word ptr DGROUP:_ego+2
	push	word ptr DGROUP:_ego
	push	cs
	call	near ptr @m_actor@draw$qv
	add	sp,4
   ;	
   ;	    var_2 = 0;
   ;	
	mov	word ptr [bp-2],0
	jmp	short @20@618
@20@590:
   ;	
   ;	    while (var_2 < ed_list_size)
   ;	        ed_list[var_2++]->draw();
   ;	
	mov	bx,word ptr [bp-2]
	inc	word ptr [bp-2]
	shl	bx,2
	push	word ptr DGROUP:_ed_list[bx+2]
	push	word ptr DGROUP:_ed_list[bx]
	push	cs
	call	near ptr @m_actor@draw$qv
	add	sp,4
@20@618:
	mov	al,byte ptr DGROUP:_ed_list_size
	mov	ah,0
	cmp	ax,word ptr [bp-2]
	jg	short @20@590
   ;	
   ;	}
   ;	
	leave	
	ret	
@game_cast@update$quc	endp
	?debug	C E9
	?debug	C FA00000000
ACTOR_TEXT	ends
_DATA	segment word public use16 'DATA'
s@	label	byte
	db	'Too many actors in ed_list.'
	db	0
	db	'Error looking for loop : '
	db	0
	db	'Adding actor to cast.'
	db	0
	db	'Too many actors to draw.'
	db	0
_DATA	ends
ACTOR_TEXT	segment byte public use16 'CODE'
ACTOR_TEXT	ends
	extrn	@no_heap$qnuc:far
	extrn	_my_movsd:far
	extrn	@terminate$qnuct1:far
	public	@touching$qn7m_actort1
	extrn	@random$qi:far
	extrn	_ed_list:dword
	extrn	_tbl_mul_tw:word
	extrn	_ed_list_size:byte
	extrn	_ego:dword
	extrn	_the_map:dword
	extrn	_the_game:dword
	extrn	@tilemap@put_bits_masked$qiiiinucuiuc:far
	extrn	@tilemap@erase_bits$qiiii:far
	extrn	@game_manager@get_loop$qnuc:far
	public	@game_cast@remove$quc
	public	@game_cast@kill_all$qv
	public	@game_cast@update$quc
	public	@game_cast@add$qnucnvt2
	public	@game_cast@$bctr$qv
	public	@m_actor@on_pos$qui
	public	@m_actor@on_tile$qi
	public	@m_actor@tile_collision$qiii
	public	@m_actor@draw$qv
	public	@m_actor@move$qv
	public	@m_actor@cycle$qv
	public	@m_actor@erase$qv
	public	@m_actor@new_loop$qnuc
	public	@m_actor@set_cycle$qucuc
	public	@m_actor@set_xy$qii
	public	@m_actor@check_in_window$qv
	public	@m_actor@facing_actor$qn7m_actor
	public	@m_actor@$bdtr$qv
	public	@m_actor@$bctr$qnucnvt2
_pokeb	equ	pokeb
_poke	equ	poke
_peekb	equ	peekb
_peek	equ	peek
	extrn	@$bdele$qnv:far
	extrn	@$bnew$qui:far
_s@	equ	s@
	end
