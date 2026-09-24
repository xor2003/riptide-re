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
	?debug	S "tilemap.cpp"
	?debug	C E98F0E385D0B74696C656D61702E637070
	?debug	C E98F0E385D09726970746964652E68
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
TILEMAP_TEXT	segment byte public use16 'CODE'
TILEMAP_TEXT	ends
DGROUP	group	_DATA,_BSS
	assume	cs:TILEMAP_TEXT,ds:DGROUP
_DATA	segment word public use16 'DATA'
d@	label	byte
d@w	label	word
_DATA	ends
_BSS	segment word public use16 'BSS'
b@	label	byte
b@w	label	word
_BSS	ends
TILEMAP_TEXT	segment byte public use16 'CODE'
   ;	
   ;	tilemap::tilemap(uchar far *path, int w, int h)
   ;	
	assume	cs:TILEMAP_TEXT
@tilemap@$bctr$qnucii	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	
	cmp	dword ptr [bp+6],large 0
	jne	short @1@86
	push	930
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
   ;	    map_data = new char[0x8000];
   ;	
	push	000008000h
	call	far ptr @$bnew$qui
	pop	cx
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+154],dx
	mov	word ptr es:[bx+152],ax
   ;	
   ;	    if (!map_data)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	dword ptr es:[bx+152],large 0
	jne	short @1@142
   ;	
   ;	        no_heap("Tiles.");
   ;	
	push	ds
	push	offset DGROUP:s@
	call	far ptr @no_heap$qnuc
	add	sp,4
@1@142:
   ;	
   ;	    exploded = 2;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+924],2
   ;	
   ;	    init_work_vars();
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @tilemap@init_work_vars$qv
	add	sp,4
   ;	
   ;	    if (path == 0) {
   ;	
	cmp	dword ptr [bp+10],large 0
	je short	@@1
	jmp	@1@198
@@1:
   ;	
   ;	        map_width = w;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp+14]
	mov	word ptr es:[bx+142],ax
   ;	
   ;	        map_height = h;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp+16]
	mov	word ptr es:[bx+144],ax
   ;	
   ;	        map_w_pixels = map_width << 3;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+142]
	shl	ax,3
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+20],ax
   ;	
   ;	        map_h_pixels = map_height << 3;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+144]
	shl	ax,3
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+22],ax
   ;	
   ;	        init_tables();
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @tilemap@init_tables$qv
	add	sp,4
   ;	
   ;	        reset_map();
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @tilemap@reset_map$qv
	add	sp,4
   ;	
   ;	        display->get_palette();
   ;	
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@get_palette$qv
	add	sp,4
   ;	
   ;	        memcpy(palette, ::palette, 0x300);
   ;	
	push	768
	push	ds
	push	offset DGROUP:_palette
	mov	ax,word ptr [bp+6]
	add	ax,156
	push	word ptr [bp+8]
	push	ax
	call	far ptr _memcpy
	add	sp,10
   ;	
   ;	        download_tiles();
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @tilemap@download_tiles$qv
	jmp	short @1@226
@1@198:
   ;	
   ;	    } else {
   ;	        load(path, 0);
   ;	
	push	0
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @tilemap@load$qnucuc
	add	sp,10
   ;	
   ;	        init_tables();
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @tilemap@init_tables$qv
@1@226:
	add	sp,4
@1@254:
   ;	
   ;	    }
   ;	}
   ;	
	mov	dx,word ptr [bp+8]
	mov	ax,word ptr [bp+6]
	pop	bp
	ret	
@tilemap@$bctr$qnucii	endp
   ;	
   ;	tilemap::~tilemap()
   ;	
	assume	cs:TILEMAP_TEXT
@tilemap@$bdtr$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	
	cmp	dword ptr [bp+6],large 0
	je	short @2@142
   ;	
   ;	    beep();
   ;	
	call	far ptr @beep$qv
   ;	
   ;	    delete map_data;
   ;	
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+154]
	push	word ptr es:[bx+152]
	call	far ptr @$bdele$qnv
	add	sp,4
   ;	
   ;	    delete tile_attr;
   ;	
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+928]
	push	word ptr es:[bx+926]
	call	far ptr @$bdele$qnv
	add	sp,4
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
@tilemap@$bdtr$qv	endp
   ;	
   ;	void tilemap::init_tables()
   ;	
	assume	cs:TILEMAP_TEXT
@tilemap@init_tables$qv	proc	far
	enter	2,0
   ;	
   ;	{
   ;	    uint i;
   ;	    for (i = 0; i < 0xC8; ++i)
   ;	
	mov	word ptr [bp-2],0
	jmp	short @3@114
@3@58:
   ;	
   ;	        tbl_mul_tw[i] = i * map_width;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp-2]
	imul	word ptr es:[bx+142]
	mov	bx,word ptr [bp-2]
	shl	bx,1
	mov	word ptr DGROUP:_tbl_mul_tw[bx],ax
	inc	word ptr [bp-2]
@3@114:
	cmp	word ptr [bp-2],200
	jb	short @3@58
   ;	
   ;	    for (i = 0; i < 0x200; ++i) {
   ;	
	mov	word ptr [bp-2],0
	jmp	short @3@226
@3@170:
   ;	
   ;	        tbl_tile_src[i] = 0xD980;
   ;	
	mov	bx,word ptr [bp-2]
	shl	bx,1
	mov	word ptr DGROUP:_tbl_tile_src[bx],00000D980h
   ;	
   ;	        tbl_tile_src[i] += (i / 0x28) * 0x280;
   ;	
	mov	ax,word ptr [bp-2]
	mov	bx,40
	xor	dx,dx
	div	bx
	imul	ax,ax,640
	mov	bx,word ptr [bp-2]
	shl	bx,1
	add	word ptr DGROUP:_tbl_tile_src[bx],ax
   ;	
   ;	        tbl_tile_src[i] += (i % 0x28) * 2;
   ;	
	mov	ax,word ptr [bp-2]
	mov	bx,40
	xor	dx,dx
	div	bx
	shl	dx,1
	mov	bx,word ptr [bp-2]
	shl	bx,1
	add	word ptr DGROUP:_tbl_tile_src[bx],dx
	inc	word ptr [bp-2]
@3@226:
	cmp	word ptr [bp-2],512
	jb	short @3@170
   ;	
   ;	    }
   ;	    for (i = 0; i < 0x100; ++i)
   ;	
	mov	word ptr [bp-2],0
	jmp	short @3@338
@3@282:
   ;	
   ;	        tbl_mul80[i] = i * 0x50;
   ;	
	mov	ax,word ptr [bp-2]
	imul	ax,ax,80
	mov	bx,word ptr [bp-2]
	shl	bx,1
	mov	word ptr DGROUP:_tbl_mul80[bx],ax
	inc	word ptr [bp-2]
@3@338:
	cmp	word ptr [bp-2],256
	jb	short @3@282
   ;	
   ;	}
   ;	
	leave	
	ret	
@tilemap@init_tables$qv	endp
   ;	
   ;	void tilemap::init_work_vars()
   ;	
	assume	cs:TILEMAP_TEXT
@tilemap@init_work_vars$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    map_exploded = 0;
   ;	
	mov	byte ptr DGROUP:_map_exploded,0
   ;	
   ;	    field_92 = map_x = map_y = field_0C = field_0E = field_10 = field_12 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	xor	ax,ax
	mov	word ptr es:[bx+18],ax
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+16],ax
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+14],ax
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+12],ax
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+10],ax
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+8],ax
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+146],ax
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@tilemap@init_work_vars$qv	endp
   ;	
   ;	void tilemap::set_viewport(int x, int y, int w, int h)
   ;	
	assume	cs:TILEMAP_TEXT
@tilemap@set_viewport$qiiii	proc	far
	enter	2,0
   ;	
   ;	{
   ;	    int i;
   ;	    display->cls(1, 1);
   ;	
	push	1
	push	1
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@cls$qucuc
	add	sp,8
   ;	
   ;	    viewport_x = x;                        /* 00 */
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp+10]
	mov	word ptr es:[bx],ax
   ;	
   ;	    viewport_y = y;                        /* 02 */
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp+12]
	mov	word ptr es:[bx+2],ax
   ;	
   ;	    field_22 = viewport_y * 0x50 + viewport_x / 4;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	imul	ax,ax,80
	les	bx,dword ptr [bp+6]
	push	ax
	mov	ax,word ptr es:[bx]
	mov	bx,4
	cwd	
	idiv	bx
	pop	dx
	add	dx,ax
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+34],dx
   ;	
   ;	    viewport_w = w;                        /* 04 */
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp+14]
	mov	word ptr es:[bx+4],ax
   ;	
   ;	    field_20 = viewport_w / 4;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+4]
	mov	bx,4
	cwd	
	idiv	bx
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+32],ax
   ;	
   ;	    viewport_h = h;                        /* 06 */
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp+16]
	mov	word ptr es:[bx+6],ax
   ;	
   ;	    field_1C = (viewport_w + 0x20) >> 3;   /* tile cols */
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+4]
	add	ax,32
	sar	ax,3
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+28],ax
   ;	
   ;	    if (field_1C > 0x28)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+28],40
	jle	short @5@86
   ;	
   ;	        terminate("Viewport width too big.", (uchar far *)0);
   ;	
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+7
	call	far ptr @terminate$qnuct1
	add	sp,8
@5@86:
   ;	
   ;	    field_1E = (viewport_h + 0x20) >> 3;   /* tile rows */
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+6]
	add	ax,32
	sar	ax,3
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+30],ax
   ;	
   ;	    if (field_1E > 0x19)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+30],25
	jle	short @5@142
   ;	
   ;	        terminate("Viewport height too big.", (uchar far *)0);
   ;	
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+31
	call	far ptr @terminate$qnuct1
	add	sp,8
@5@142:
   ;	
   ;	    for (i = 0; i < 0x3E8; ++i) {
   ;	
	mov	word ptr [bp-2],0
	jmp	short @5@226
@5@170:
   ;	
   ;	        tbl_tile_dst[i] = 0x7D00;
   ;	
	mov	bx,word ptr [bp-2]
	shl	bx,1
	mov	word ptr DGROUP:_tbl_tile_dst[bx],32000
   ;	
   ;	        tbl_tile_dst[i] += (i / 0x28) * 0x280;
   ;	
	mov	ax,word ptr [bp-2]
	mov	bx,40
	cwd	
	idiv	bx
	imul	ax,ax,640
	mov	bx,word ptr [bp-2]
	shl	bx,1
	add	word ptr DGROUP:_tbl_tile_dst[bx],ax
   ;	
   ;	        tbl_tile_dst[i] += (i % 0x28) * 2;
   ;	
	mov	ax,word ptr [bp-2]
	mov	bx,40
	cwd	
	idiv	bx
	shl	dx,1
	mov	bx,word ptr [bp-2]
	shl	bx,1
	add	word ptr DGROUP:_tbl_tile_dst[bx],dx
	inc	word ptr [bp-2]
@5@226:
	cmp	word ptr [bp-2],1000
	jl	short @5@170
   ;	
   ;	    }
   ;	    field_18 = field_1C << 3;              /* cached window pixel width */
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+28]
	shl	ax,3
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+24],ax
   ;	
   ;	    field_1A = field_1E << 3;              /* cached window pixel height */
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+30]
	shl	ax,3
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+26],ax
   ;	
   ;	    display->height = field_1A;            /* 0A */
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+26]
	les	bx,dword ptr DGROUP:_display
	mov	word ptr es:[bx+10],ax
   ;	
   ;	    display->field_07 = 0;                 /* 07 */
   ;	
	les	bx,dword ptr DGROUP:_display
	mov	byte ptr es:[bx+7],0
   ;	
   ;	    explode();
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @tilemap@explode$qv
	add	sp,4
   ;	
   ;	}
   ;	
	leave	
	ret	
@tilemap@set_viewport$qiiii	endp
   ;	
   ;	int tilemap::get_map_pos(int x, int y)
   ;	
	assume	cs:TILEMAP_TEXT
@tilemap@get_map_pos$qii	proc	far
	enter	2,0
   ;	
   ;	{
   ;	    int pos = field_92;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+146]
	mov	word ptr [bp-2],ax
   ;	
   ;	    pos += tbl_mul_tw[y >> 3];
   ;	
	mov	bx,word ptr [bp+12]
	sar	bx,3
	shl	bx,1
	mov	ax,word ptr [bp-2]
	add	ax,word ptr DGROUP:_tbl_mul_tw[bx]
	mov	word ptr [bp-2],ax
   ;	
   ;	    pos += (uint)(x >> 3) % map_width;
   ;	
	mov	ax,word ptr [bp+10]
	sar	ax,3
	les	bx,dword ptr [bp+6]
	xor	dx,dx
	div	word ptr es:[bx+142]
	mov	ax,word ptr [bp-2]
	add	ax,dx
	mov	word ptr [bp-2],ax
   ;	
   ;	    return pos;
   ;	
	mov	ax,word ptr [bp-2]
   ;	
   ;	}
   ;	
	leave	
	ret	
@tilemap@get_map_pos$qii	endp
   ;	
   ;	void tilemap::new_map(uchar far *path, int w, int h)
   ;	
	assume	cs:TILEMAP_TEXT
@tilemap@new_map$qnucii	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    delete tile_attr;
   ;	
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+928]
	push	word ptr es:[bx+926]
	call	far ptr @$bdele$qnv
	add	sp,4
   ;	
   ;	    init_work_vars();
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @tilemap@init_work_vars$qv
	add	sp,4
   ;	
   ;	    if (path) {
   ;	
	cmp	dword ptr [bp+10],large 0
	je	short @7@86
   ;	
   ;	        load(path, 0);
   ;	
	push	0
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @tilemap@load$qnucuc
	add	sp,10
   ;	
   ;	        init_tables();
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @tilemap@init_tables$qv
	jmp	short @7@114
@7@86:
   ;	
   ;	    } else {
   ;	        map_width = w;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp+14]
	mov	word ptr es:[bx+142],ax
   ;	
   ;	        map_height = h;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp+16]
	mov	word ptr es:[bx+144],ax
   ;	
   ;	        map_w_pixels = w << 3;
   ;	
	mov	ax,word ptr [bp+14]
	shl	ax,3
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+20],ax
   ;	
   ;	        map_h_pixels = h << 3;
   ;	
	mov	ax,word ptr [bp+16]
	shl	ax,3
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+22],ax
   ;	
   ;	        init_tables();
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @tilemap@init_tables$qv
	add	sp,4
   ;	
   ;	        reset_map();
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @tilemap@reset_map$qv
	add	sp,4
   ;	
   ;	        explode();
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @tilemap@explode$qv
@7@114:
	add	sp,4
   ;	
   ;	    }
   ;	}
   ;	
	pop	bp
	ret	
@tilemap@new_map$qnucii	endp
   ;	
   ;	void tilemap::reset_map()
   ;	
	assume	cs:TILEMAP_TEXT
@tilemap@reset_map$qv	proc	far
	enter	2,0
   ;	
   ;	{
   ;	    uint i;
   ;	    map_size = (ulong)(uint)(map_width * map_height);
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+142]
	les	bx,dword ptr [bp+6]
	imul	word ptr es:[bx+144]
	movzx	eax,ax
	les	bx,dword ptr [bp+6]
	mov	dword ptr es:[bx+148],eax
   ;	
   ;	    for (i = 0; i < 0x8000; ++i)
   ;	
	mov	word ptr [bp-2],0
	jmp	short @8@114
@8@58:
   ;	
   ;	        map_data[i] = i >> 7;
   ;	
	mov	ax,word ptr [bp-2]
	shr	ax,7
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+152]
	add	bx,word ptr [bp-2]
	mov	byte ptr es:[bx],al
	inc	word ptr [bp-2]
@8@114:
	cmp	word ptr [bp-2],000008000h
	jb	short @8@58
   ;	
   ;	    tile_attr = new tattr[map_size];
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+148]
	shl	ax,2
	push	ax
	call	far ptr @$bnew$qui
	pop	cx
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+928],dx
	mov	word ptr es:[bx+926],ax
   ;	
   ;	    if (!tile_attr)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	dword ptr es:[bx+926],large 0
	jne	short @8@198
   ;	
   ;	        no_heap("Init map.");
   ;	
	push	ds
	push	offset DGROUP:s@+56
	call	far ptr @no_heap$qnuc
	add	sp,4
@8@198:
   ;	
   ;	    for (i = 0; i < map_size; ++i) {
   ;	
	mov	word ptr [bp-2],0
	jmp	short @8@282
@8@226:
   ;	
   ;	        tile_attr[i].attr = 2;
   ;	
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+926]
	mov	ax,word ptr [bp-2]
	shl	ax,2
	add	bx,ax
	mov	word ptr es:[bx],2
   ;	
   ;	        tile_attr[i].type = 0;
   ;	
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+926]
	mov	ax,word ptr [bp-2]
	shl	ax,2
	add	bx,ax
	mov	word ptr es:[bx+2],0
	inc	word ptr [bp-2]
@8@282:
	movzx	eax,word ptr [bp-2]
	les	bx,dword ptr [bp+6]
	cmp	eax,dword ptr es:[bx+148]
	jb	short @8@226
   ;	
   ;	    }
   ;	    for (i = 0; i < 0x32; ++i)
   ;	
	mov	word ptr [bp-2],0
	jmp	short @8@394
@8@338:
   ;	
   ;	        map_hdr[i] = 0;
   ;	
	mov	ax,word ptr [bp-2]
	shl	ax,1
	les	bx,dword ptr [bp+6]
	add	bx,ax
	mov	word ptr es:[bx+36],0
	inc	word ptr [bp-2]
@8@394:
	cmp	word ptr [bp-2],50
	jb	short @8@338
   ;	
   ;	    field_88 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+136],0
   ;	
   ;	    field_89 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+137],0
   ;	
   ;	    field_8A = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+138],0
   ;	
   ;	    cycling = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+140],0
   ;	
   ;	}
   ;	
	leave	
	ret	
@tilemap@reset_map$qv	endp
   ;	
   ;	void tilemap::download_tiles()
   ;	
	assume	cs:TILEMAP_TEXT
@tilemap@download_tiles$qv	proc	far
	enter	10,0
   ;	
   ;	{
   ;	    unsigned var_2, var_4, var_6;
   ;	    int var_8, var_A;
   ;	    var_6 = 0;
   ;	
	mov	word ptr [bp-6],0
   ;	
   ;	    for (var_4 = 0; var_4 < 0xD; ++var_4) {
   ;	
	mov	word ptr [bp-4],0
	jmp	@9@282
@9@58:
   ;	
   ;	        for (var_2 = 0; var_2 < 0x28 - ((var_4 == 0xC) << 3); ++var_2) {
   ;	
	mov	word ptr [bp-2],0
	jmp	short @9@142
@9@86:
   ;	
   ;	            var_8 = var_2 << 3;
   ;	
	mov	ax,word ptr [bp-2]
	shl	ax,3
	mov	word ptr [bp-8],ax
   ;	
   ;	            var_A = (var_4 << 3) + 0x60;
   ;	
	mov	ax,word ptr [bp-4]
	shl	ax,3
	add	ax,96
	mov	word ptr [bp-10],ax
   ;	
   ;	            display->put_bits(var_8, var_A, var_8 + 8, var_A + 8,
   ;	
   ;	
   ;	                              map_data + (var_6 << 6), 0, 0xBB80);
   ;	
	push	00000BB80h
	push	0
	mov	ax,word ptr [bp-6]
	shl	ax,6
	les	bx,dword ptr [bp+6]
	mov	dx,word ptr es:[bx+152]
	add	dx,ax
	push	word ptr es:[bx+154]
	push	dx
	mov	ax,word ptr [bp-10]
	add	ax,8
	push	ax
	mov	ax,word ptr [bp-8]
	add	ax,8
	push	ax
	push	word ptr [bp-10]
	push	word ptr [bp-8]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@put_bits$qiiiinucuiui
	add	sp,20
   ;	
   ;	            ++var_6;
   ;	
	inc	word ptr [bp-6]
	inc	word ptr [bp-2]
@9@142:
	cmp	word ptr [bp-4],12
	jne	short @9@198
	mov	ax,1
	jmp	short @9@226
@9@198:
	xor	ax,ax
@9@226:
	shl	ax,3
	mov	dx,40
	sub	dx,ax
	cmp	dx,word ptr [bp-2]
	ja	short @9@86
	inc	word ptr [bp-4]
@9@282:
	cmp	word ptr [bp-4],13
	jae short	@@2
	jmp	@9@58
@@2:
   ;	
   ;	        }
   ;	    }
   ;	}
   ;	
	leave	
	ret	
@tilemap@download_tiles$qv	endp
   ;	
   ;	void tilemap::update(uint arg_4)
   ;	
	assume	cs:TILEMAP_TEXT
@tilemap@update$qui	proc	far
	enter	2,0
   ;	
   ;	{
   ;	    int var_2;
   ;	    var_2 = (field_10 >> 2) + 0x7D00 + tbl_mul80[field_12];
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+16]
	sar	ax,2
	add	ax,32000
	les	bx,dword ptr [bp+6]
	mov	bx,word ptr es:[bx+18]
	shl	bx,1
	add	ax,word ptr DGROUP:_tbl_mul80[bx]
	mov	word ptr [bp-2],ax
   ;	
   ;	    x_update_map(var_2, field_20, viewport_h, field_22 + arg_4);
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+34]
	add	ax,word ptr [bp+10]
	push	ax
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+6]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+32]
	push	word ptr [bp-2]
	call	far ptr _x_update_map
	add	sp,8
   ;	
   ;	}
   ;	
	leave	
	ret	
@tilemap@update$qui	endp
   ;	
   ;	void tilemap::explode()
   ;	
	assume	cs:TILEMAP_TEXT
@tilemap@explode$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    x_explode_map(map_width, field_1E, tile_attr, field_92,
   ;	
   ;	
   ;	                  tbl_tile_src, tbl_tile_dst);
   ;	
	push	ds
	push	offset DGROUP:_tbl_tile_dst
	push	ds
	push	offset DGROUP:_tbl_tile_src
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+146]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+928]
	push	word ptr es:[bx+926]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+30]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+142]
	call	far ptr _x_explode_map
	add	sp,18
   ;	
   ;	    ++map_exploded;
   ;	
	mov	al,byte ptr DGROUP:_map_exploded
	inc	al
	mov	byte ptr DGROUP:_map_exploded,al
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@tilemap@explode$qv	endp
   ;	
   ;	uchar tilemap::center_on(uint x, uint y)
   ;	
	assume	cs:TILEMAP_TEXT
@tilemap@center_on$quiui	proc	far
	enter	4,0
   ;	
   ;	{
   ;	    int var_2, var_4;
   ;	    var_2 = x - (viewport_w >> 1);
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+4]
	sar	ax,1
	mov	dx,word ptr [bp+10]
	sub	dx,ax
	mov	word ptr [bp-2],dx
   ;	
   ;	    var_4 = y - (viewport_h >> 1);
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+6]
	sar	ax,1
	mov	dx,word ptr [bp+12]
	sub	dx,ax
	mov	word ptr [bp-4],dx
   ;	
   ;	    set_position(var_2, var_4);
   ;	
	push	word ptr [bp-4]
	push	word ptr [bp-2]
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @tilemap@set_position$qii
	add	sp,8
   ;	
   ;	    if (map_exploded) {
   ;	
	cmp	byte ptr DGROUP:_map_exploded,0
	je	short @12@86
   ;	
   ;	        map_exploded = 0;
   ;	
	mov	byte ptr DGROUP:_map_exploded,0
   ;	
   ;	        return 1;
   ;	
	mov	al,1
	jmp	short @12@114
@12@86:
   ;	
   ;	    }
   ;	    return 0;
   ;	
	mov	al,0
@12@114:
   ;	
   ;	}
   ;	
	leave	
	ret	
@tilemap@center_on$quiui	endp
   ;	
   ;	void tilemap::scroll(uchar dir)
   ;	
	assume	cs:TILEMAP_TEXT
@tilemap@scroll$quc	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    switch (dir) {
   ;	
	mov	al,byte ptr [bp+10]
	mov	ah,0
	mov	bx,ax
	cmp	bx,3
	ja	short @13@282
	shl	bx,1
	jmp	word ptr cs:@13@C130[bx]
@13@114:
   ;	
   ;	    case 0: set_position(map_x + 4, map_y); break;
   ;	
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+10]
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+8]
	add	ax,4
	push	ax
	jmp	short @13@254
@13@142:
   ;	
   ;	    case 1: set_position(map_x - 4, map_y); break;
   ;	
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+10]
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+8]
	add	ax,-4
	push	ax
	jmp	short @13@254
@13@170:
   ;	
   ;	    case 2: set_position(map_x, map_y - 1); break;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+10]
	dec	ax
	jmp	short @13@226
@13@198:
   ;	
   ;	    case 3: set_position(map_x, map_y + 1); break;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+10]
	inc	ax
@13@226:
	push	ax
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+8]
@13@254:
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @tilemap@set_position$qii
	add	sp,8
@13@282:
   ;	
   ;	    }
   ;	}
   ;	
	pop	bp
	ret	
@tilemap@scroll$quc	endp
@13@C130	label	word
	dw	@13@114
	dw	@13@142
	dw	@13@170
	dw	@13@198
   ;	
   ;	void tilemap::set_position(int x, int y)
   ;	
	assume	cs:TILEMAP_TEXT
@tilemap@set_position$qii	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (x < 0)
   ;	
	cmp	word ptr [bp+10],0
	jge	short @14@86
   ;	
   ;	        x = 0;
   ;	
	mov	word ptr [bp+10],0
@14@86:
   ;	
   ;	    if (x + viewport_w > map_w_pixels)
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp+10]
	add	ax,word ptr es:[bx+4]
	les	bx,dword ptr [bp+6]
	cmp	ax,word ptr es:[bx+20]
	jle	short @14@142
   ;	
   ;	        x = map_w_pixels - viewport_w;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+20]
	les	bx,dword ptr [bp+6]
	sub	ax,word ptr es:[bx+4]
	mov	word ptr [bp+10],ax
@14@142:
   ;	
   ;	    if (y < 0)
   ;	
	cmp	word ptr [bp+12],0
	jge	short @14@198
   ;	
   ;	        y = 0;
   ;	
	mov	word ptr [bp+12],0
@14@198:
   ;	
   ;	    if (y + viewport_h > map_h_pixels)
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp+12]
	add	ax,word ptr es:[bx+6]
	les	bx,dword ptr [bp+6]
	cmp	ax,word ptr es:[bx+22]
	jle	short @14@254
   ;	
   ;	        y = map_h_pixels - viewport_h;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+22]
	les	bx,dword ptr [bp+6]
	sub	ax,word ptr es:[bx+6]
	mov	word ptr [bp+12],ax
@14@254:
   ;	
   ;	    map_x = x;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp+10]
	mov	word ptr es:[bx+8],ax
   ;	
   ;	    map_y = y;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr [bp+12]
	mov	word ptr es:[bx+10],ax
   ;	
   ;	    if ((map_x > field_0C || field_0C == 0) &&
   ;	
   ;	
   ;	        (map_x + viewport_w < field_0C + field_18) &&
   ;	        (map_y > field_0E || field_0E == 0) &&
   ;	        (map_y + viewport_h < field_0E + field_1A)) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+8]
	les	bx,dword ptr [bp+6]
	cmp	ax,word ptr es:[bx+12]
	jg	short @14@310
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+12],0
	je short	@@3
	jmp	@14@450
@@3:
@14@310:
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+8]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+4]
	les	bx,dword ptr [bp+6]
	mov	dx,word ptr es:[bx+12]
	les	bx,dword ptr [bp+6]
	add	dx,word ptr es:[bx+24]
	cmp	ax,dx
	jge	short @14@450
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+10]
	les	bx,dword ptr [bp+6]
	cmp	ax,word ptr es:[bx+14]
	jg	short @14@394
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+14],0
	jne	short @14@450
@14@394:
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+10]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+6]
	les	bx,dword ptr [bp+6]
	mov	dx,word ptr es:[bx+14]
	les	bx,dword ptr [bp+6]
	add	dx,word ptr es:[bx+26]
	cmp	ax,dx
	jge	short @14@450
   ;	
   ;	        field_10 = map_x - field_0C;       /* sub-tile offset in window */
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+8]
	les	bx,dword ptr [bp+6]
	sub	ax,word ptr es:[bx+12]
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+16],ax
   ;	
   ;	        field_12 = map_y - field_0E;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+10]
	les	bx,dword ptr [bp+6]
	sub	ax,word ptr es:[bx+14]
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+18],ax
   ;	
   ;	        return;
   ;	
	jmp	@14@814
@14@450:
   ;	
   ;	    }
   ;	    field_0C = ((map_x - 0x10) >> 3) << 3; /* new window origin, 8-aligned */
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+8]
	add	ax,-16
	sar	ax,3
	shl	ax,3
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+12],ax
   ;	
   ;	    field_0E = ((map_y - 0x10) >> 3) << 3;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+10]
	add	ax,-16
	sar	ax,3
	shl	ax,3
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+14],ax
   ;	
   ;	    if (field_0C < 0)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+12],0
	jge	short @14@506
   ;	
   ;	        field_0C = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+12],0
@14@506:
   ;	
   ;	    if (field_0E < 0)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+14],0
	jge	short @14@562
   ;	
   ;	        field_0E = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+14],0
@14@562:
   ;	
   ;	    field_92 = tbl_mul_tw[field_0E >> 3];
   ;	
	les	bx,dword ptr [bp+6]
	mov	bx,word ptr es:[bx+14]
	sar	bx,3
	shl	bx,1
	mov	ax,word ptr DGROUP:_tbl_mul_tw[bx]
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+146],ax
   ;	
   ;	    field_92 += (uint)(field_0C >> 3) % map_width;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+12]
	sar	ax,3
	les	bx,dword ptr [bp+6]
	xor	dx,dx
	div	word ptr es:[bx+142]
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+146]
	add	ax,dx
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+146],ax
   ;	
   ;	    if (map_x < 0x10)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+8],16
	jge	short @14@618
   ;	
   ;	        field_10 = map_x % 0x10;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+8]
	mov	bx,16
	cwd	
	idiv	bx
	jmp	short @14@646
@14@618:
   ;	
   ;	    else
   ;	        field_10 = (map_x % 8) + 0x10;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+8]
	mov	bx,8
	cwd	
	idiv	bx
	add	dx,16
@14@646:
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+16],dx
   ;	
   ;	    if (map_y < 0x10)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	word ptr es:[bx+10],16
	jge	short @14@730
   ;	
   ;	        field_12 = map_y % 0x10;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+10]
	mov	bx,16
	cwd	
	idiv	bx
	jmp	short @14@758
@14@730:
   ;	
   ;	    else
   ;	        field_12 = (map_y % 8) + 0x10;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+10]
	mov	bx,8
	cwd	
	idiv	bx
	add	dx,16
@14@758:
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+18],dx
   ;	
   ;	    explode();
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @tilemap@explode$qv
	add	sp,4
@14@814:
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@tilemap@set_position$qii	endp
   ;	
   ;	void tilemap::save(uchar far *path)
   ;	
	assume	cs:TILEMAP_TEXT
@tilemap@save$qnuc	proc	far
	enter	4,0
   ;	
   ;	{
   ;	    int fd;
   ;	    uint len;
   ;	    fd = open(path, 0x8304, 0x180);
   ;	
	push	384
	push	-31996
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	call	far ptr _open
	add	sp,8
	mov	word ptr [bp-2],ax
   ;	
   ;	    if (fd == -1)
   ;	
	cmp	word ptr [bp-2],-1
	jne short	@@4
	jmp	@15@282
@@4:
   ;	
   ;	        goto fail;
   ;	    if (write(fd, &map_width, 2) != 2)      /* this+8E */
   ;	
	push	2
	mov	ax,word ptr [bp+6]
	add	ax,142
	push	word ptr [bp+8]
	push	ax
	push	word ptr [bp-2]
	call	far ptr _write
	add	sp,8
	cmp	ax,2
	je short	@@5
	jmp	@15@282
@@5:
   ;	
   ;	        goto fail;
   ;	    if (write(fd, &map_height, 2) != 2)     /* this+90 */
   ;	
	push	2
	mov	ax,word ptr [bp+6]
	add	ax,144
	push	word ptr [bp+8]
	push	ax
	push	word ptr [bp-2]
	call	far ptr _write
	add	sp,8
	cmp	ax,2
	je short	@@6
	jmp	@15@282
@@6:
   ;	
   ;	        goto fail;
   ;	    len = map_size * 4;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+148]
	shl	ax,2
	mov	word ptr [bp-4],ax
   ;	
   ;	    if (write(fd, tile_attr, len) != len)   /* attr array */
   ;	
	push	word ptr [bp-4]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+928]
	push	word ptr es:[bx+926]
	push	word ptr [bp-2]
	call	far ptr _write
	add	sp,8
	cmp	ax,word ptr [bp-4]
	je short	@@7
	jmp	@15@282
@@7:
   ;	
   ;	        goto fail;
   ;	    if (write(fd, map_data, 0x8000) != 0x8000)
   ;	
	push	000008000h
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+154]
	push	word ptr es:[bx+152]
	push	word ptr [bp-2]
	call	far ptr _write
	add	sp,8
	cmp	ax,000008000h
	jne	short @15@282
   ;	
   ;	        goto fail;
   ;	    if (write(fd, palette, 0x300) != 0x300) /* this+9C */
   ;	
	push	768
	mov	ax,word ptr [bp+6]
	add	ax,156
	push	word ptr [bp+8]
	push	ax
	push	word ptr [bp-2]
	call	far ptr _write
	add	sp,8
	cmp	ax,768
	jne	short @15@282
   ;	
   ;	        goto fail;
   ;	    if (write(fd, map_hdr, 0x64) != 0x64)   /* this+24 */
   ;	
	push	100
	mov	ax,word ptr [bp+6]
	add	ax,36
	push	word ptr [bp+8]
	push	ax
	push	word ptr [bp-2]
	call	far ptr _write
	add	sp,8
	cmp	ax,100
	jne	short @15@282
   ;	
   ;	        goto fail;
   ;	    len = 4;
   ;	
	mov	word ptr [bp-4],4
   ;	
   ;	    if (write(fd, &field_88, len) != len)   /* this+88 — cycle params */
   ;	
	push	word ptr [bp-4]
	mov	ax,word ptr [bp+6]
	add	ax,136
	push	word ptr [bp+8]
	push	ax
	push	word ptr [bp-2]
	call	far ptr _write
	add	sp,8
	cmp	ax,word ptr [bp-4]
	jne	short @15@282
   ;	
   ;	        goto fail;
   ;	    close(fd);
   ;	
	push	word ptr [bp-2]
	call	far ptr _close
	pop	cx
   ;	
   ;	    return;
   ;	
	jmp	short @15@310
@15@282:
   ;	
   ;	fail:
   ;	    close(fd);
   ;	
	push	word ptr [bp-2]
	call	far ptr _close
	pop	cx
   ;	
   ;	    write_error("Saving map.");
   ;	
	push	ds
	push	offset DGROUP:s@+66
	call	far ptr @write_error$qnuc
	add	sp,4
@15@310:
   ;	
   ;	}
   ;	
	leave	
	ret	
@tilemap@save$qnuc	endp
   ;	
   ;	void tilemap::load(uchar far *path, uchar arg_8)
   ;	
	assume	cs:TILEMAP_TEXT
@tilemap@load$qnucuc	proc	far
	enter	2,0
   ;	
   ;	{
   ;	    uint len;
   ;	    if (cycling) {                          /* 8C */
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+140],0
	je	short @16@86
   ;	
   ;	        display->field_05 = 0;              /* kill display cycling */
   ;	
	les	bx,dword ptr DGROUP:_display
	mov	byte ptr es:[bx+5],0
   ;	
   ;	        cycling = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+140],0
@16@86:
   ;	
   ;	    }
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
	jne short	@@8
	jmp	@16@450
@@8:
   ;	
   ;	        goto fail;
   ;	    if (g_element_read(&map_width, 2) != 2)      /* this+8E */
   ;	
	push	2
	mov	ax,word ptr [bp+6]
	add	ax,142
	push	word ptr [bp+8]
	push	ax
	call	far ptr @g_element_read$qnvui
	push	dx
	push	ax
	pop	eax
	add	sp,6
	cmp	eax,large 2
	je short	@@9
	jmp	@16@450
@@9:
   ;	
   ;	        goto fail;
   ;	    if (g_element_read(&map_height, 2) != 2)     /* this+90 */
   ;	
	push	2
	mov	ax,word ptr [bp+6]
	add	ax,144
	push	word ptr [bp+8]
	push	ax
	call	far ptr @g_element_read$qnvui
	push	dx
	push	ax
	pop	eax
	add	sp,6
	cmp	eax,large 2
	je short	@@10
	jmp	@16@450
@@10:
   ;	
   ;	        goto fail;
   ;	    map_size = (ulong)(uint)(map_width * map_height);
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+142]
	les	bx,dword ptr [bp+6]
	imul	word ptr es:[bx+144]
	movzx	eax,ax
	les	bx,dword ptr [bp+6]
	mov	dword ptr es:[bx+148],eax
   ;	
   ;	    map_w_pixels = map_width << 3;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+142]
	shl	ax,3
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+20],ax
   ;	
   ;	    map_h_pixels = map_height << 3;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+144]
	shl	ax,3
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+22],ax
   ;	
   ;	    tile_attr = new tattr[map_size];
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+148]
	shl	ax,2
	push	ax
	call	far ptr @$bnew$qui
	pop	cx
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+928],dx
	mov	word ptr es:[bx+926],ax
   ;	
   ;	    len = map_size * 4;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+148]
	shl	ax,2
	mov	word ptr [bp-2],ax
   ;	
   ;	    if ((uint)g_element_read(tile_attr, len) != len)
   ;	
	push	word ptr [bp-2]
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+928]
	push	word ptr es:[bx+926]
	call	far ptr @g_element_read$qnvui
	add	sp,6
	cmp	ax,word ptr [bp-2]
	je short	@@11
	jmp	@16@450
@@11:
   ;	
   ;	        goto fail;
   ;	    if (map_data == 0) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	dword ptr es:[bx+152],large 0
	jne	short @16@282
   ;	
   ;	        map_data = new char[0x8000];
   ;	
	push	000008000h
	call	far ptr @$bnew$qui
	pop	cx
	les	bx,dword ptr [bp+6]
	mov	word ptr es:[bx+154],dx
	mov	word ptr es:[bx+152],ax
   ;	
   ;	        if (!map_data)
   ;	
	les	bx,dword ptr [bp+6]
	cmp	dword ptr es:[bx+152],large 0
	jne	short @16@282
   ;	
   ;	            no_heap("Tiles.");
   ;	
	push	ds
	push	offset DGROUP:s@+78
	call	far ptr @no_heap$qnuc
	add	sp,4
@16@282:
   ;	
   ;	    }
   ;	    if (g_element_read(map_data, 0x4000) != 0x4000)
   ;	
	push	16384
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+154]
	push	word ptr es:[bx+152]
	call	far ptr @g_element_read$qnvui
	push	dx
	push	ax
	pop	eax
	add	sp,6
	cmp	eax,large 16384
	je short	@@12
	jmp	@16@450
@@12:
   ;	
   ;	        goto fail;
   ;	    if (g_element_read(map_data + 0x4000, 0x4000) != 0x4000)
   ;	
	push	16384
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+152]
	add	ax,16384
	push	word ptr es:[bx+154]
	push	ax
	call	far ptr @g_element_read$qnvui
	push	dx
	push	ax
	pop	eax
	add	sp,6
	cmp	eax,large 16384
	je short	@@13
	jmp	@16@450
@@13:
   ;	
   ;	        goto fail;
   ;	    if (g_element_read(palette, 0x300) != 0x300)  /* this+9C */
   ;	
	push	768
	mov	ax,word ptr [bp+6]
	add	ax,156
	push	word ptr [bp+8]
	push	ax
	call	far ptr @g_element_read$qnvui
	push	dx
	push	ax
	pop	eax
	add	sp,6
	cmp	eax,large 768
	jne	short @16@450
   ;	
   ;	        goto fail;
   ;	    if (g_element_read(map_hdr, 0x64) != 0x64)     /* this+24 */
   ;	
	push	100
	mov	ax,word ptr [bp+6]
	add	ax,36
	push	word ptr [bp+8]
	push	ax
	call	far ptr @g_element_read$qnvui
	push	dx
	push	ax
	pop	eax
	add	sp,6
	cmp	eax,large 100
	jne	short @16@450
   ;	
   ;	        goto fail;
   ;	    len = 4;
   ;	
	mov	word ptr [bp-2],4
   ;	
   ;	    if (g_element_read(&field_88, len) != len)    /* this+88 */
   ;	
	push	word ptr [bp-2]
	mov	ax,word ptr [bp+6]
	add	ax,136
	push	word ptr [bp+8]
	push	ax
	call	far ptr @g_element_read$qnvui
	push	dx
	push	ax
	pop	eax
	add	sp,6
	movzx	edx,word ptr [bp-2]
	cmp	eax,edx
	jne	short @16@450
   ;	
   ;	        goto fail;
   ;	    g_close_element();
   ;	
	call	far ptr @g_close_element$qv
   ;	
   ;	    reset_palette(arg_8);
   ;	
	mov	al,byte ptr [bp+14]
	push	ax
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	far ptr @tilemap@reset_palette$quc
	add	sp,6
   ;	
   ;	    download_tiles();
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @tilemap@download_tiles$qv
	jmp	short @16@478
@16@450:
   ;	
   ;	    return;
   ;	fail:
   ;	    g_close_element();
   ;	
	call	far ptr @g_close_element$qv
   ;	
   ;	    read_error("Loading map.");
   ;	
	push	ds
	push	offset DGROUP:s@+85
	call	far ptr @read_error$qnuc
@16@478:
	add	sp,4
   ;	
   ;	}
   ;	
	leave	
	ret	
@tilemap@load$qnucuc	endp
   ;	
   ;	void tilemap::change_tile(ulong pos, uint val)
   ;	
	assume	cs:TILEMAP_TEXT
@tilemap@change_tile$qului	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (map_size < pos) {
   ;	
	les	bx,dword ptr [bp+6]
	mov	eax,dword ptr es:[bx+148]
	cmp	eax,dword ptr [bp+10]
	jae	short @17@86
   ;	
   ;	        beep();
   ;	
	call	far ptr @beep$qv
   ;	
   ;	        terminate("Tile change out of range.", (uchar far *)0);
   ;	
	push	0
	push	0
	push	ds
	push	offset DGROUP:s@+98
	call	far ptr @terminate$qnuct1
	add	sp,8
@17@86:
   ;	
   ;	    }
   ;	    tile_attr[pos].attr = val;
   ;	
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+926]
	mov	ax,word ptr [bp+10]
	shl	ax,2
	add	bx,ax
	mov	ax,word ptr [bp+14]
	mov	word ptr es:[bx],ax
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@tilemap@change_tile$qului	endp
   ;	
   ;	void tilemap::add_cycle(uchar a, uchar b, uchar c)
   ;	
	assume	cs:TILEMAP_TEXT
@tilemap@add_cycle$qucucuc	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    field_88 = a;
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr [bp+10]
	mov	byte ptr es:[bx+136],al
   ;	
   ;	    field_89 = b;
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr [bp+12]
	mov	byte ptr es:[bx+137],al
   ;	
   ;	    field_8A = c;
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr [bp+14]
	mov	byte ptr es:[bx+138],al
   ;	
   ;	    display->setup_cycle(a, b, c);
   ;	
	mov	al,byte ptr [bp+14]
	push	ax
	mov	al,byte ptr [bp+12]
	push	ax
	mov	al,byte ptr [bp+10]
	push	ax
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@setup_cycle$qucucuc
	add	sp,10
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@tilemap@add_cycle$qucucuc	endp
   ;	
   ;	void tilemap::turn_cycling(uchar on)
   ;	
	assume	cs:TILEMAP_TEXT
@tilemap@turn_cycling$quc	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    cycling = on;                          /* 8C */
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr [bp+10]
	mov	byte ptr es:[bx+140],al
   ;	
   ;	    display->turn_cycling(on);
   ;	
	mov	al,byte ptr [bp+10]
	push	ax
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@turn_cycling$quc
	add	sp,6
   ;	
   ;	    if (on == 0)
   ;	
	cmp	byte ptr [bp+10],0
	jne	short @19@86
   ;	
   ;	        field_88 = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	byte ptr es:[bx+136],0
@19@86:
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@tilemap@turn_cycling$quc	endp
   ;	
   ;	void tilemap::reset_palette(uchar apply)
   ;	
	assume	cs:TILEMAP_TEXT
@tilemap@reset_palette$quc	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    memcpy(::palette, palette, 0x300);      /* map palette -> global */
   ;	
	push	768
	mov	ax,word ptr [bp+6]
	add	ax,156
	push	word ptr [bp+8]
	push	ax
	push	ds
	push	offset DGROUP:_palette
	call	far ptr _memcpy
	add	sp,10
   ;	
   ;	    if (apply)
   ;	
	cmp	byte ptr [bp+10],0
	je	short @20@86
   ;	
   ;	        display->set_palette();
   ;	
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@set_palette$qv
	add	sp,4
@20@86:
   ;	
   ;	    if (field_88) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	byte ptr es:[bx+136],0
	je	short @20@142
   ;	
   ;	        display->setup_cycle(field_88, field_89, field_8A);
   ;	
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+138]
	push	ax
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+137]
	push	ax
	les	bx,dword ptr [bp+6]
	mov	al,byte ptr es:[bx+136]
	push	ax
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@setup_cycle$qucucuc
	add	sp,10
   ;	
   ;	        turn_cycling(1);
   ;	
	push	1
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @tilemap@turn_cycling$quc
	add	sp,6
@20@142:
   ;	
   ;	    }
   ;	}
   ;	
	pop	bp
	ret	
@tilemap@reset_palette$quc	endp
   ;	
   ;	void tilemap::purge_tiles()
   ;	
	assume	cs:TILEMAP_TEXT
@tilemap@purge_tiles$qv	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (map_data) {
   ;	
	les	bx,dword ptr [bp+6]
	cmp	dword ptr es:[bx+152],large 0
	je	short @21@86
   ;	
   ;	        delete map_data;
   ;	
	les	bx,dword ptr [bp+6]
	push	word ptr es:[bx+154]
	push	word ptr es:[bx+152]
	call	far ptr @$bdele$qnv
	add	sp,4
   ;	
   ;	        map_data = 0;
   ;	
	les	bx,dword ptr [bp+6]
	mov	dword ptr es:[bx+152],large 0
@21@86:
   ;	
   ;	    }
   ;	}
   ;	
	pop	bp
	ret	
@tilemap@purge_tiles$qv	endp
   ;	
   ;	uchar tilemap::check_bounds(int *x1, int *y1, int *x2, int *y2)
   ;	
	assume	cs:TILEMAP_TEXT
@tilemap@check_bounds$qnit1t1t1	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    if (*x2 < field_0C)
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+12]
	les	bx,dword ptr [bp+18]
	cmp	ax,word ptr es:[bx]
	jle	short @22@86
@22@58:
   ;	
   ;	        return 0;
   ;	
	mov	al,0
	jmp	short @22@282
@22@86:
   ;	
   ;	    if (*x1 > field_0C + field_18)
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+12]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+24]
	les	bx,dword ptr [bp+10]
	cmp	ax,word ptr es:[bx]
	jge	short @22@142
   ;	
   ;	        return 0;
   ;	
	jmp	short @22@58
@22@142:
   ;	
   ;	    if (*y2 < field_0E)
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+14]
	les	bx,dword ptr [bp+22]
	cmp	ax,word ptr es:[bx]
	jle	short @22@198
   ;	
   ;	        return 0;
   ;	
	jmp	short @22@58
@22@198:
   ;	
   ;	    if (*y1 > field_0E + field_1A)
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+14]
	les	bx,dword ptr [bp+6]
	add	ax,word ptr es:[bx+26]
	les	bx,dword ptr [bp+14]
	cmp	ax,word ptr es:[bx]
	jge	short @22@254
	jmp	short @22@58
@22@254:
   ;	
   ;	        return 0;
   ;	    *x1 -= field_0C;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+12]
	les	bx,dword ptr [bp+10]
	sub	word ptr es:[bx],ax
   ;	
   ;	    *x2 -= field_0C;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+12]
	les	bx,dword ptr [bp+18]
	sub	word ptr es:[bx],ax
   ;	
   ;	    *y1 -= field_0E;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+14]
	les	bx,dword ptr [bp+14]
	sub	word ptr es:[bx],ax
   ;	
   ;	    *y2 -= field_0E;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+14]
	les	bx,dword ptr [bp+22]
	sub	word ptr es:[bx],ax
   ;	
   ;	    return 1;
   ;	
	mov	al,1
@22@282:
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@tilemap@check_bounds$qnit1t1t1	endp
   ;	
   ;	void tilemap::erase_bits(int x1, int y1, int x2, int y2)
   ;	
	assume	cs:TILEMAP_TEXT
@tilemap@erase_bits$qiiii	proc	far
	enter	22,0
   ;	
   ;	{
   ;	    unsigned var_2, var_4;
   ;	    int var_6, var_8, var_A, var_C;
   ;	    uint var_E;
   ;	    int var_10, var_12, var_14, var_16;
   ;	    x1 = (x1 >> 3) << 3;
   ;	
	mov	ax,word ptr [bp+10]
	sar	ax,3
	shl	ax,3
	mov	word ptr [bp+10],ax
   ;	
   ;	    y1 = (y1 >> 3) << 3;
   ;	
	mov	ax,word ptr [bp+12]
	sar	ax,3
	shl	ax,3
	mov	word ptr [bp+12],ax
   ;	
   ;	    if (!check_bounds(&x1, &y1, &x2, &y2))
   ;	
	push	ss
	lea	ax,word ptr [bp+16]
	push	ax
	push	ss
	lea	ax,word ptr [bp+14]
	push	ax
	push	ss
	lea	ax,word ptr [bp+12]
	push	ax
	push	ss
	lea	ax,word ptr [bp+10]
	push	ax
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @tilemap@check_bounds$qnit1t1t1
	add	sp,20
	mov	ah,0
	or	ax,ax
	jne short	@@14
	jmp	@23@506
@@14:
   ;	
   ;	        return;
   ;	    if (x1 < 0)
   ;	
	cmp	word ptr [bp+10],0
	jge	short @23@114
   ;	
   ;	        x1 = 0;
   ;	
	mov	word ptr [bp+10],0
@23@114:
   ;	
   ;	    if (y1 < 0)
   ;	
	cmp	word ptr [bp+12],0
	jge	short @23@170
   ;	
   ;	        y1 = 0;
   ;	
	mov	word ptr [bp+12],0
@23@170:
   ;	
   ;	    if (x2 > 0x138)
   ;	
	cmp	word ptr [bp+14],312
	jle	short @23@226
   ;	
   ;	        x2 = 0x138;
   ;	
	mov	word ptr [bp+14],312
@23@226:
   ;	
   ;	    if (field_1A - 8 < y2)
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+26]
	add	ax,-8
	cmp	ax,word ptr [bp+16]
	jge	short @23@282
   ;	
   ;	        y2 = field_1A - 8;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+26]
	add	ax,-8
	mov	word ptr [bp+16],ax
@23@282:
   ;	
   ;	    var_14 = ((x2 - x1) >> 3) + 1;          /* tiles wide */
   ;	
	mov	ax,word ptr [bp+14]
	sub	ax,word ptr [bp+10]
	sar	ax,3
	inc	ax
	mov	word ptr [bp-20],ax
   ;	
   ;	    var_16 = ((y2 - y1) >> 3) + 1;          /* tiles high */
   ;	
	mov	ax,word ptr [bp+16]
	sub	ax,word ptr [bp+12]
	sar	ax,3
	inc	ax
	mov	word ptr [bp-22],ax
   ;	
   ;	    var_10 = get_map_pos(x1, y1);           /* map index */
   ;	
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @tilemap@get_map_pos$qii
	add	sp,8
	mov	word ptr [bp-16],ax
   ;	
   ;	    var_12 = map_width - var_14;            /* row skip */
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+142]
	sub	ax,word ptr [bp-20]
	mov	word ptr [bp-18],ax
   ;	
   ;	    var_6 = x1;
   ;	
	mov	ax,word ptr [bp+10]
	mov	word ptr [bp-6],ax
   ;	
   ;	    var_8 = y1;
   ;	
	mov	ax,word ptr [bp+12]
	mov	word ptr [bp-8],ax
   ;	
   ;	    for (var_4 = 0; var_4 < var_16; ++var_4) {
   ;	
	mov	word ptr [bp-4],0
	jmp	@23@478
@23@310:
   ;	
   ;	        for (var_2 = 0; var_2 < var_14; ++var_2) {
   ;	
	mov	word ptr [bp-2],0
	jmp	short @23@394
@23@338:
   ;	
   ;	            var_E = tile_attr[var_10].attr;          /* tile index */
   ;	
	les	bx,dword ptr [bp+6]
	les	bx,dword ptr es:[bx+926]
	mov	ax,word ptr [bp-16]
	shl	ax,2
	add	bx,ax
	mov	ax,word ptr es:[bx]
	mov	word ptr [bp-14],ax
   ;	
   ;	            var_A = (var_E % 0x28) << 3;             /* src x */
   ;	
	mov	ax,word ptr [bp-14]
	mov	bx,40
	xor	dx,dx
	div	bx
	shl	dx,3
	mov	word ptr [bp-10],dx
   ;	
   ;	            var_C = ((var_E / 0x28) << 3) + 0x60;    /* src y */
   ;	
	mov	ax,word ptr [bp-14]
	mov	bx,40
	xor	dx,dx
	div	bx
	shl	ax,3
	add	ax,96
	mov	word ptr [bp-12],ax
   ;	
   ;	            display->copy_bits(var_A, var_C, var_A + 8, var_C + 8,
   ;	
   ;	
   ;	                               var_6, var_8, 0xBB80, 0x7D00, 0x140, 0x140);
   ;	
	push	320
	push	320
	push	32000
	push	00000BB80h
	push	word ptr [bp-8]
	push	word ptr [bp-6]
	mov	ax,word ptr [bp-12]
	add	ax,8
	push	ax
	mov	ax,word ptr [bp-10]
	add	ax,8
	push	ax
	push	word ptr [bp-12]
	push	word ptr [bp-10]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@copy_bits$qiiiiiiuiuiuiui
	add	sp,24
   ;	
   ;	            var_6 += 8;
   ;	
	add	word ptr [bp-6],8
   ;	
   ;	            ++var_10;
   ;	
	inc	word ptr [bp-16]
	inc	word ptr [bp-2]
@23@394:
	mov	ax,word ptr [bp-2]
	cmp	ax,word ptr [bp-20]
	jae short	@@15
	jmp	@23@338
@@15:
   ;	
   ;	        }
   ;	        var_6 = x1;
   ;	
	mov	ax,word ptr [bp+10]
	mov	word ptr [bp-6],ax
   ;	
   ;	        var_8 += 8;
   ;	
	add	word ptr [bp-8],8
   ;	
   ;	        var_10 += var_12;
   ;	
	mov	ax,word ptr [bp-18]
	add	word ptr [bp-16],ax
	inc	word ptr [bp-4]
@23@478:
	mov	ax,word ptr [bp-4]
	cmp	ax,word ptr [bp-22]
	jae short	@@16
	jmp	@23@310
@@16:
@23@506:
   ;	
   ;	    }
   ;	}
   ;	
	leave	
	ret	
@tilemap@erase_bits$qiiii	endp
   ;	
   ;	void tilemap::put_bits_masked(int x1, int y1, int w, int h,
   ;	
	assume	cs:TILEMAP_TEXT
@tilemap@put_bits_masked$qiiiinucuiuc	proc	far
	enter	4,0
   ;	
   ;	                              uchar far *bits, uint arg_10, uchar arg_12)
   ;	{
   ;	    int x2 = x1 + w;
   ;	
	mov	ax,word ptr [bp+10]
	add	ax,word ptr [bp+14]
	mov	word ptr [bp-2],ax
   ;	
   ;	    int y2 = y1 + h;
   ;	
	mov	ax,word ptr [bp+12]
	add	ax,word ptr [bp+16]
	mov	word ptr [bp-4],ax
   ;	
   ;	    if (!check_bounds(&x1, &y1, &x2, &y2))
   ;	
	push	ss
	lea	ax,word ptr [bp-4]
	push	ax
	push	ss
	lea	ax,word ptr [bp-2]
	push	ax
	push	ss
	lea	ax,word ptr [bp+12]
	push	ax
	push	ss
	lea	ax,word ptr [bp+10]
	push	ax
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	cs
	call	near ptr @tilemap@check_bounds$qnit1t1t1
	add	sp,20
	mov	ah,0
	or	ax,ax
	je	short @24@86
   ;	
   ;	        return;
   ;	    display->put_bits_masked(x1, y1, x2, y2, bits, arg_10, 0x7D00, arg_12);
   ;	
	mov	al,byte ptr [bp+24]
	push	ax
	push	32000
	push	word ptr [bp+22]
	push	word ptr [bp+20]
	push	word ptr [bp+18]
	push	word ptr [bp-4]
	push	word ptr [bp-2]
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	push	word ptr DGROUP:_display+2
	push	word ptr DGROUP:_display
	call	far ptr @vga_display@put_bits_masked$qiiiinucuiuiuc
	add	sp,22
@24@86:
   ;	
   ;	}
   ;	
	leave	
	ret	
@tilemap@put_bits_masked$qiiiinucuiuc	endp
	?debug	C E9
	?debug	C FA00000000
TILEMAP_TEXT	ends
_DATA	segment word public use16 'DATA'
s@	label	byte
	db	'Tiles.'
	db	0
	db	'Viewport width too big.'
	db	0
	db	'Viewport height too big.'
	db	0
	db	'Init map.'
	db	0
	db	'Saving map.'
	db	0
	db	'Tiles.'
	db	0
	db	'Loading map.'
	db	0
	db	'Tile change out of range.'
	db	0
_DATA	ends
TILEMAP_TEXT	segment byte public use16 'CODE'
TILEMAP_TEXT	ends
	extrn	@write_error$qnuc:far
	extrn	_tbl_tile_dst:word
	extrn	@beep$qv:far
	extrn	_x_explode_map:far
	extrn	_x_update_map:far
	extrn	@no_heap$qnuc:far
	extrn	@g_close_element$qv:far
	extrn	@g_element_read$qnvui:far
	extrn	@g_open_element$qnuc:far
	extrn	@read_error$qnuc:far
	extrn	@terminate$qnuct1:far
	extrn	_palette:byte
	extrn	_map_exploded:byte
	extrn	_tbl_tile_src:word
	extrn	_tbl_mul80:word
	extrn	_tbl_mul_tw:word
	extrn	_display:dword
	extrn	@vga_display@put_bits_masked$qiiiinucuiuiuc:far
	extrn	@vga_display@put_bits$qiiiinucuiui:far
	extrn	@vga_display@copy_bits$qiiiiiiuiuiuiui:far
	extrn	@vga_display@cls$qucuc:far
	extrn	@vga_display@get_palette$qv:far
	extrn	@vga_display@set_palette$qv:far
	extrn	@vga_display@setup_cycle$qucucuc:far
	extrn	@vga_display@turn_cycling$quc:far
	public	@tilemap@put_bits_masked$qiiiinucuiuc
	public	@tilemap@erase_bits$qiiii
	public	@tilemap@check_bounds$qnit1t1t1
	public	@tilemap@purge_tiles$qv
	public	@tilemap@reset_palette$quc
	public	@tilemap@turn_cycling$quc
	public	@tilemap@add_cycle$qucucuc
	public	@tilemap@change_tile$qului
	public	@tilemap@load$qnucuc
	public	@tilemap@save$qnuc
	public	@tilemap@set_position$qii
	public	@tilemap@scroll$quc
	public	@tilemap@center_on$quiui
	public	@tilemap@explode$qv
	public	@tilemap@update$qui
	public	@tilemap@download_tiles$qv
	public	@tilemap@reset_map$qv
	public	@tilemap@new_map$qnucii
	public	@tilemap@get_map_pos$qii
	public	@tilemap@set_viewport$qiiii
	public	@tilemap@init_work_vars$qv
	public	@tilemap@init_tables$qv
	public	@tilemap@$bdtr$qv
	public	@tilemap@$bctr$qnucii
_pokeb	equ	pokeb
_poke	equ	poke
_peekb	equ	peekb
_peek	equ	peek
	extrn	_write:far
	extrn	_open:far
	extrn	_close:far
	extrn	_memcpy:far
	extrn	@$bdele$qnv:far
	extrn	@$bnew$qui:far
_s@	equ	s@
	end
