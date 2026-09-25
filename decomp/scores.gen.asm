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
	?debug	S "scores.cpp"
	?debug	C E9134D395D0A73636F7265732E637070
	?debug	C E9134D395D09726970746964652E68
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
SCORES_TEXT	segment byte public use16 'CODE'
SCORES_TEXT	ends
DGROUP	group	_DATA,_BSS
	assume	cs:SCORES_TEXT,ds:DGROUP
_DATA	segment word public use16 'DATA'
d@	label	byte
d@w	label	word
_DATA	ends
_BSS	segment word public use16 'BSS'
b@	label	byte
b@w	label	word
_BSS	ends
SCORES_TEXT	segment byte public use16 'CODE'
   ;	
   ;	void far init_scores_array(void)
   ;	
	assume	cs:SCORES_TEXT
@init_scores_array$qv	proc	far
	enter	4,0
   ;	
   ;	{
   ;	    FILE *stream;
   ;	
   ;	    if ((stream = fopen("high.scr", "rb")) == 0) {
   ;	
	push	ds
	push	offset DGROUP:s@+9
	push	ds
	push	offset DGROUP:s@
	call	far ptr _fopen
	add	sp,8
	mov	word ptr [bp-2],dx
	mov	word ptr [bp-4],ax
	or	ax,dx
	jne	short @1@142
   ;	
   ;	        if (stream != 0)
   ;	
	cmp	dword ptr [bp-4],large 0
	je	short @1@114
   ;	
   ;	            fclose(stream);
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr _fclose
	add	sp,4
@1@114:
   ;	
   ;	        init_scores_file();
   ;	
	call	far ptr @init_scores_file$qv
   ;	
   ;	    } else {
   ;	
	jmp	short @1@170
@1@142:
   ;	
   ;	        fclose(stream);
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	far ptr _fclose
	add	sp,4
   ;	
   ;	        load_scores_in();
   ;	
	call	far ptr @load_scores_in$qv
@1@170:
   ;	
   ;	    }
   ;	    _high_score = _game_highs[0].score;
   ;	
	mov	eax,dword ptr DGROUP:__game_highs+10
	mov	dword ptr DGROUP:__high_score,eax
   ;	
   ;	}
   ;	
	leave	
	ret	
@init_scores_array$qv	endp
   ;	
   ;	void far init_scores_file(void)
   ;	
	assume	cs:SCORES_TEXT
@init_scores_file$qv	proc	far
	enter	2,0
   ;	
   ;	{
   ;	    byte var_1;
   ;	
   ;	    var_1 = 0;
   ;	
	mov	byte ptr [bp-1],0
	jmp	short @2@86
@2@58:
   ;	
   ;	    while (var_1 < 0x0A) {
   ;	        strcpy(_game_highs[var_1].name, "........");
   ;	
	push	ds
	push	offset DGROUP:s@+12
	mov	al,byte ptr [bp-1]
	mov	ah,0
	shl	ax,4
	add	ax,offset DGROUP:__game_highs
	push	ds
	push	ax
	call	far ptr _strcpy
	add	sp,8
   ;	
   ;	        _game_highs[var_1].score    = 0;
   ;	
	mov	al,byte ptr [bp-1]
	mov	ah,0
	shl	ax,4
	mov	bx,ax
	mov	dword ptr DGROUP:__game_highs[bx+10],large 0
   ;	
   ;	        _game_highs[var_1].field_0E = 0;
   ;	
	mov	al,byte ptr [bp-1]
	mov	ah,0
	shl	ax,4
	mov	bx,ax
	mov	byte ptr DGROUP:__game_highs[bx+14],0
   ;	
   ;	        var_1++;
   ;	
	inc	byte ptr [bp-1]
@2@86:
	cmp	byte ptr [bp-1],10
	jb	short @2@58
   ;	
   ;	    }
   ;	    save_all_scores();
   ;	
	call	far ptr @save_all_scores$qv
   ;	
   ;	}
   ;	
	leave	
	ret	
@init_scores_file$qv	endp
   ;	
   ;	void far save_all_scores(void)
   ;	
	assume	cs:SCORES_TEXT
@save_all_scores$qv	proc	far
	enter	4,0
   ;	
   ;	{
   ;	    int handle;
   ;	    int len;
   ;	
   ;	    if ((handle = open("high.scr", 0x8104, 0x180)) == -1) {
   ;	
	push	384
	push	-32508
	push	ds
	push	offset DGROUP:s@+21
	call	far ptr _open
	add	sp,8
	mov	word ptr [bp-2],ax
	cmp	ax,-1
	jne	short @3@86
   ;	
   ;	        perror("Error:");
   ;	
	push	ds
	push	offset DGROUP:s@+30
	call	far ptr _perror
	add	sp,4
   ;	
   ;	        return;
   ;	
	jmp	short @3@114
@3@86:
   ;	
   ;	    }
   ;	    len = 0xA0;
   ;	
	mov	word ptr [bp-4],160
   ;	
   ;	    write(handle, _game_highs, len);
   ;	
	push	word ptr [bp-4]
	push	ds
	push	offset DGROUP:__game_highs
	push	word ptr [bp-2]
	call	far ptr _write
	add	sp,8
   ;	
   ;	    close(handle);
   ;	
	push	word ptr [bp-2]
	call	far ptr _close
	pop	cx
@3@114:
   ;	
   ;	}
   ;	
	leave	
	ret	
@save_all_scores$qv	endp
   ;	
   ;	void far load_scores_in(void)
   ;	
	assume	cs:SCORES_TEXT
@load_scores_in$qv	proc	far
	enter	4,0
   ;	
   ;	{
   ;	    int handle;
   ;	    int len;
   ;	
   ;	    if ((handle = open("high.scr", 0x8001)) == -1) {
   ;	
	push	-32767
	push	ds
	push	offset DGROUP:s@+37
	call	far ptr _open
	add	sp,6
	mov	word ptr [bp-2],ax
	cmp	ax,-1
	jne	short @4@86
   ;	
   ;	        perror("Error:");
   ;	
	push	ds
	push	offset DGROUP:s@+46
	call	far ptr _perror
	add	sp,4
   ;	
   ;	    } else {
   ;	
	jmp	short @4@114
@4@86:
   ;	
   ;	        len = 0xA0;
   ;	
	mov	word ptr [bp-4],160
   ;	
   ;	        read(handle, _game_highs, len);
   ;	
	push	word ptr [bp-4]
	push	ds
	push	offset DGROUP:__game_highs
	push	word ptr [bp-2]
	call	far ptr _read
	add	sp,8
@4@114:
   ;	
   ;	    }
   ;	    close(handle);
   ;	
	push	word ptr [bp-2]
	call	far ptr _close
	pop	cx
   ;	
   ;	}
   ;	
	leave	
	ret	
@load_scores_in$qv	endp
   ;	
   ;	void far save_new_score(ulong score, uchar far *src, uchar arg_8)
   ;	
	assume	cs:SCORES_TEXT
@save_new_score$qulnucuc	proc	far
	enter	4,0
   ;	
   ;	{
   ;	    byte var_3;
   ;	    int  var_2;
   ;	
   ;	    var_3 = is_record(score);
   ;	
	push	dword ptr [bp+6]
	call	far ptr @is_record$qul
	add	sp,4
	mov	byte ptr [bp-1],al
   ;	
   ;	    var_2 = 9;
   ;	
	mov	word ptr [bp-4],9
	jmp	short @5@86
@5@58:
   ;	
   ;	    while (var_3 - 1 < var_2) {
   ;	        _game_highs[var_2] = _game_highs[var_2 - 1];
   ;	
	mov	ax,word ptr [bp-4]
	shl	ax,4
	add	ax,offset DGROUP:__game_highs
	push	ds
	push	ax
	mov	ax,word ptr [bp-4]
	shl	ax,4
	add	ax,offset DGROUP:__game_highs-16
	push	ds
	push	ax
	mov	cx,16
	call	far ptr F_SCOPY@
   ;	
   ;	        var_2--;
   ;	
	dec	word ptr [bp-4]
@5@86:
	mov	al,byte ptr [bp-1]
	mov	ah,0
	dec	ax
	cmp	ax,word ptr [bp-4]
	jl	short @5@58
   ;	
   ;	    }
   ;	    strcpy(_game_highs[var_3 - 1].name, (char far *)src);
   ;	
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	mov	al,byte ptr [bp-1]
	mov	ah,0
	shl	ax,4
	add	ax,offset DGROUP:__game_highs-16
	push	ds
	push	ax
	call	far ptr _strcpy
	add	sp,8
   ;	
   ;	    _game_highs[var_3 - 1].score    = score;
   ;	
	mov	al,byte ptr [bp-1]
	mov	ah,0
	shl	ax,4
	mov	edx,dword ptr [bp+6]
	mov	bx,ax
	mov	dword ptr DGROUP:__game_highs[bx-6],edx
   ;	
   ;	    _game_highs[var_3 - 1].field_0E = arg_8;
   ;	
	mov	al,byte ptr [bp-1]
	mov	ah,0
	shl	ax,4
	mov	dl,byte ptr [bp+14]
	mov	bx,ax
	mov	byte ptr DGROUP:__game_highs[bx-2],dl
   ;	
   ;	    save_all_scores();
   ;	
	push	cs
	call	near ptr @save_all_scores$qv
   ;	
   ;	}
   ;	
	leave	
	ret	
@save_new_score$qulnucuc	endp
   ;	
   ;	uchar far is_record(ulong score)
   ;	
	assume	cs:SCORES_TEXT
@is_record$qul	proc	far
	enter	2,0
   ;	
   ;	{
   ;	    byte var_1;
   ;	
   ;	    var_1 = 0;
   ;	
	mov	byte ptr [bp-1],0
	jmp	short @6@142
@6@58:
   ;	
   ;	    while (var_1 < 0x0A) {
   ;	        if (_game_highs[var_1].score < score)
   ;	
	mov	al,byte ptr [bp-1]
	mov	ah,0
	shl	ax,4
	mov	bx,ax
	mov	eax,dword ptr DGROUP:__game_highs[bx+10]
	cmp	eax,dword ptr [bp+6]
	jae	short @6@114
   ;	
   ;	            return var_1 + 1;
   ;	
	mov	al,byte ptr [bp-1]
	inc	al
	jmp	short @6@198
@6@114:
   ;	
   ;	        var_1++;
   ;	
	inc	byte ptr [bp-1]
@6@142:
	cmp	byte ptr [bp-1],10
	jb	short @6@58
   ;	
   ;	    }
   ;	    return 0;
   ;	
	mov	al,0
@6@198:
   ;	
   ;	}
   ;	
	leave	
	ret	
@is_record$qul	endp
   ;	
   ;	uchar far *far return_element(uchar arg_0, uchar arg_2)
   ;	
	assume	cs:SCORES_TEXT
@return_element$qucuc	proc	far
	enter	20,0
   ;	
   ;	{
   ;	    score_line string;
   ;	
   ;	    string = unk_2A7EC;
   ;	
	lea	ax,word ptr [bp-20]
	push	ss
	push	ax
	push	ds
	push	offset DGROUP:_unk_2A7EC
	mov	cx,20
	call	far ptr F_SCOPY@
   ;	
   ;	    switch (arg_2) {
   ;	
	mov	al,byte ptr [bp+8]
	mov	ah,0
	cmp	ax,1
	je	short @7@198
	cmp	ax,2
	je	short @7@226
	cmp	ax,3
	je	short @7@254
	jmp	short @7@310
@7@198:
   ;	
   ;	    case 1:
   ;	        return (uchar far *)ultoa(_game_highs[arg_0].score, string.s, 0x0A);
   ;	
	push	10
	push	ss
	lea	ax,word ptr [bp-20]
	push	ax
	mov	al,byte ptr [bp+6]
	mov	ah,0
	shl	ax,4
	mov	bx,ax
	push	dword ptr DGROUP:__game_highs[bx+10]
	call	far ptr _ultoa
	add	sp,10
	jmp	short @7@338
@7@226:
   ;	
   ;	    case 2:
   ;	        return (uchar far *)_game_highs[arg_0].name;
   ;	
	mov	al,byte ptr [bp+6]
	mov	ah,0
	shl	ax,4
	mov	dx,ds
	add	ax,offset DGROUP:__game_highs
	jmp	short @7@338
@7@254:
   ;	
   ;	    case 3:
   ;	        if (_game_highs[arg_0].field_0E != 0)
   ;	
	mov	al,byte ptr [bp+6]
	mov	ah,0
	shl	ax,4
	mov	bx,ax
	cmp	byte ptr DGROUP:__game_highs[bx+14],0
	je	short @7@310
   ;	
   ;	            return (uchar far *)"1";
   ;	
	mov	dx,ds
	mov	ax,offset DGROUP:s@+53
	jmp	short @7@338
@7@310:
   ;	
   ;	    }
   ;	    return 0;
   ;	
	xor	dx,dx
	xor	ax,ax
@7@338:
   ;	
   ;	}
   ;	
	leave	
	ret	
@return_element$qucuc	endp
	?debug	C E9
	?debug	C FA00000000
SCORES_TEXT	ends
_DATA	segment word public use16 'DATA'
s@	label	byte
	db	'high.scr'
	db	0
	db	'rb'
	db	0
	db	'........'
	db	0
	db	'high.scr'
	db	0
	db	'Error:'
	db	0
	db	'high.scr'
	db	0
	db	'Error:'
	db	0
	db	'1'
	db	0
_DATA	ends
SCORES_TEXT	segment byte public use16 'CODE'
SCORES_TEXT	ends
	extrn	F_SCOPY@:far
	public	@save_new_score$qulnucuc
	public	@is_record$qul
	public	@load_scores_in$qv
	extrn	_ultoa:far
	public	@return_element$qucuc
	public	@save_all_scores$qv
	public	@init_scores_file$qv
	public	@init_scores_array$qv
	extrn	_unk_2A7EC:word
	extrn	__high_score:word
	extrn	__game_highs:word
_pokeb	equ	pokeb
_poke	equ	poke
_peekb	equ	peekb
_peek	equ	peek
	extrn	_write:far
	extrn	_read:far
	extrn	_open:far
	extrn	_close:far
	extrn	_strcpy:far
	extrn	_perror:far
	extrn	_fopen:far
	extrn	_fclose:far
_s@	equ	s@
	end
