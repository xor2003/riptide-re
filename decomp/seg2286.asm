; decomp/seg2286.asm — seg2286 (extracted from RIPTIDE_.asm)
		.386p

		extrn	_int86:far16
		extrn	_core_closeworx:far16
		extrn	_farmalloc:far16
		extrn	_farfree:far16
		extrn	_core_startworx:far16
		public	_adlibdetect
		public	_closepoly
		public	_closeworx
		public	_closeworxdriver
		public	_continuesequence
		public	_dspclose
		public	_dspportsetting
		public	_dspreset
		public	_elementgets
		public	_elementread
		public	_forceconfig
		public	_getlastvocmarker
		public	_getmidibeat
		public	_getsequence
		public	_getxmsblock
		public	_gonote
		public	_joystickbutton
		public	_joystickupdate
		public	_joystickx
		public	_joysticky
		public	_killpolychannel
		public	_loadibkfile
		public	_loadoneshot
		public	_loadsbifile
		public	_loadxmsoneshot
		public	_newpitchpoly
		public	_openelement
		public	_playcmfblock
		public	_playflatfile
		public	_playmidblock
		public	_playpwmblock
		public	_playpwmwav
		public	_playvocblock
		public	_playvocfile
		public	_playvocpoly
		public	_playwavblock
		public	_playwavfile
		public	_playwavpoly
		public	_polycellstatus
		public	_processflatfile
		public	_programchange
		public	_pwmplaying
		public	_recordflatfile
		public	_releasepolychannel
		public	_resetmpu401
		public	_resetrealtime
		public	_selectinput
		public	_sequenceplaying
		public	_setaudiomode
		public	_setchannelvolume
		public	_setfmvolume
		public	_setlinelevel
		public	_setloopmode
		public	_setmastervolume
		public	_setmiclevel
		public	_setmidispeaker
		public	_setpwmrate
		public	_setrealtime
		public	_setsmpvolume
		public	_setvocindex
		public	_setvocvolume
		public	_startpoly
		public	_startresource
		public	_startworx
		public	_stopflatrecord
		public	_stopnote
		public	_stoppwm
		public	_stopsequence
		public	_stopvoc
		public	_timerdone
		public	_vochooksetting
		public	_vocplaying
		public	_vocpoll
		public	_worx_call

seg0000		segment	byte public 'CODE' use16
seg0000		ends

seg1c75		segment	byte public 'CODE' use16
seg1c75		ends

seg2608		segment	para public 'DATA' use16
		extrn	_worx_ax:word
		extrn	_worx_bx:word
		extrn	_worx_dx:word
		extrn	_worx_di:word
seg2608		ends


; ---- segment seg2286 ----
seg2286		segment	byte public 'CODE' use16
		assume cs:seg2286
		;org 4
		assume es:nothing, ss:nothing, ds:seg2608, fs:nothing, gs:nothing
		pop	es
		pop	ds
		pop	di
		pop	dx
		pop	cx
		pop	bx
		pop	bp
		pop	ax
		popf
		retn
		assume es:nothing

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

_worx_call	proc far		; CODE XREF: seg2286:0087p
					; _elementread+14p ...

arg_0		= byte ptr  6
arg_2		= byte ptr  8
arg_4		= word ptr  0Ah
arg_6		= word ptr  0Ch
arg_8		= word ptr  0Eh

		push	bp
		mov	bp, sp
		sub	sp, 10h
		mov	ax, [bp+arg_6]
		mov	[bp-0Ah], ax
		mov	al, [bp+arg_2]
		mov	[bp-10h], al
		mov	al, [bp+arg_0]
		mov	[bp-0Fh], al
		mov	ax, [bp+arg_4]
		mov	[bp-0Eh], ax

loc_24A6C::
		mov	ax, [bp+arg_8]
		mov	[bp-6],	ax
		push	ss
		lea	ax, [bp-10h]
		push	ax		; outregs
		push	ss
		lea	ax, [bp-10h]
		push	ax		; inregs
		mov	ax, 63h	; 'c'
		push	ax		; intno
		call	_int86
		add	sp, 0Ah
		mov	ax, [bp-10h]
		mov	_worx_ax, ax
		mov	ax, [bp-0Eh]
		mov	_worx_bx, ax
		mov	ax, [bp-0Ah]
		mov	_worx_dx, ax
		mov	ax, [bp-6]
		mov	_worx_di, ax
		mov	ax, _worx_ax
		jmp	$+2
; ---------------------------------------------------------------------------

loc_24AA5::				; CODE XREF: _worx_call+55j
		mov	sp, bp
		pop	bp
		retf
_worx_call	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

_closeworx	proc far		; CODE XREF: game_manager::~game_manager(void):loc_13531P
		push	bp
		mov	bp, sp
		call	_core_closeworx
		pop	bp
		retf
_closeworx	endp

; ---------------------------------------------------------------------------

_elementgets:
		push	bp
		mov	bp, sp
		push	word ptr [bp+6]
		push	word ptr [bp+8]
		xor	ax, ax
		push	ax

loc_24ABF::
		mov	al, [bp+0Ah]
		push	ax
		mov	al, 1Ah
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		les	bx, [bp+6]
		assume es:nothing
		cmp	byte ptr es:[bx], 0
		jnz	loc_24ADE
		xor	dx, dx
		xor	ax, ax
		jmp	loc_24AE6
; ---------------------------------------------------------------------------
		jmp	loc_24AE6
; ---------------------------------------------------------------------------

loc_24ADE::				; CODE XREF: seg2286:0094j
		mov	dx, [bp+8]
		mov	ax, [bp+6]
		jmp	$+2
; ---------------------------------------------------------------------------

loc_24AE6::				; CODE XREF: seg2286:009Aj
					; seg2286:009Cj ...
		pop	bp
		retf
		assume es:nothing

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

_elementread	proc far		; CODE XREF: seg110e:002FP
					; _loadoneshot+73p ...

arg_0		= word ptr  6
arg_2		= word ptr  8
arg_4		= word ptr  0Ah

		push	bp
		mov	bp, sp
		push	si
		push	[bp+arg_0]
		push	[bp+arg_2]
		push	[bp+arg_4]
		mov	al, 0
		push	ax
		mov	al, 18h
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		mov	si, ax
		cmp	si, 0FFFFh
		jnz	loc_24B0F
		xor	ax, ax
		jmp	loc_24B14
; ---------------------------------------------------------------------------
		jmp	loc_24B14
; ---------------------------------------------------------------------------

loc_24B0F::				; CODE XREF: _elementread+1Fj
		mov	ax, _worx_ax
		jmp	$+2
; ---------------------------------------------------------------------------

loc_24B14::				; CODE XREF: _elementread+23j
					; _elementread+25j ...
		pop	si
		pop	bp
		retf
_elementread	endp

		assume es:nothing

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

_openelement	proc far		; CODE XREF: seg110e:0017P
					; _loadoneshot+17p ...

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	[bp+arg_0]
		push	[bp+arg_2]
		xor	ax, ax
		push	ax
		mov	al, 0
		push	ax
		mov	al, 17h
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		mov	dx, _worx_dx
		xor	ax, ax
		add	ax, _worx_ax
		adc	dx, 0
		jmp	$+2
; ---------------------------------------------------------------------------

loc_24B3F::				; CODE XREF: _openelement+26j
		pop	bp
		retf
_openelement	endp

; ---------------------------------------------------------------------------

_getxmsblock:
		push	bp
		mov	bp, sp
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		push	word ptr [bp+6]
		mov	al, 0
		push	ax
		mov	al, 48h	; 'H'
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		jmp	$+2
; ---------------------------------------------------------------------------

loc_24B5C::				; CODE XREF: seg2286:011Aj
		pop	bp
		retf

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

_loadoneshot	proc far		; CODE XREF: seg2286:0261p

nbytes___	= dword	ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		mov	[bp+var_4], 0
		mov	[bp+var_2], 0
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr _openelement
		pop	cx
		pop	cx
		mov	word ptr [bp+nbytes___], ax
		mov	word ptr [bp+nbytes___+2], dx
		cmp	word ptr [bp+nbytes___+2], 0
		jl	loc_24BD9
		jg	loc_24B8E
		cmp	word ptr [bp+nbytes___], 0
		jbe	loc_24BD9

loc_24B8E::				; CODE XREF: _loadoneshot+28j
		xor	ax, ax
		push	ax
		push	word ptr [bp+nbytes___]	; nbytes
		call	_farmalloc
		pop	cx
		pop	cx
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		mov	ax, [bp+var_4]
		or	ax, [bp+var_2]
		jnz	loc_24BAF
		xor	dx, dx
		xor	ax, ax
		jmp	loc_24BE7
; ---------------------------------------------------------------------------

loc_24BAF::				; CODE XREF: _loadoneshot+49j
		cmp	word ptr [bp+nbytes___+2], 0
		jl	loc_24BC7
		jg	loc_24BBD
		cmp	word ptr [bp+nbytes___], 0FFFFh
		jbe	loc_24BC7

loc_24BBD::				; CODE XREF: _loadoneshot+57j
		mov	word ptr [bp+nbytes___], 0FFFFh
		mov	word ptr [bp+nbytes___+2], 0

loc_24BC7::				; CODE XREF: _loadoneshot+55j
					; _loadoneshot+5Dj
		push	word ptr [bp+nbytes___]
		push	[bp+var_2]
		push	[bp+var_4]
		push	cs
		call	near ptr _elementread
		add	sp, 6
		jmp	loc_24BDF
; ---------------------------------------------------------------------------

loc_24BD9::				; CODE XREF: _loadoneshot+26j
					; _loadoneshot+2Ej
		xor	dx, dx
		xor	ax, ax
		jmp	loc_24BE7
; ---------------------------------------------------------------------------

loc_24BDF::				; CODE XREF: _loadoneshot+79j
		mov	dx, [bp+var_2]
		mov	ax, [bp+var_4]
		jmp	$+2
; ---------------------------------------------------------------------------

loc_24BE7::				; CODE XREF: _loadoneshot+4Fj
					; _loadoneshot+7Fj ...
		mov	sp, bp
		pop	bp
		retf
_loadoneshot	endp

; ---------------------------------------------------------------------------

_loadxmsoneshot:
		push	bp
		mov	bp, sp
		sub	sp, 4
		mov	word ptr [bp-4], 0
		mov	word ptr [bp-2], 0
		push	word ptr [bp+6]
		push	word ptr [bp+8]
		xor	ax, ax
		push	ax
		mov	al, 0
		push	ax
		mov	al, 49h	; 'I'
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		mov	ax, _worx_ax
		mov	[bp-4],	ax
		mov	dx, [bp-2]
		mov	ax, [bp-4]
		jmp	$+2
; ---------------------------------------------------------------------------

loc_24C1F::				; CODE XREF: seg2286:01DDj
		mov	sp, bp
		pop	bp
		retf
; ---------------------------------------------------------------------------

_processflatfile:
		push	bp
		mov	bp, sp
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		mov	al, 0
		push	ax
		mov	al, 45h	; 'E'
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		jmp	$+2
; ---------------------------------------------------------------------------

loc_24C3E::				; CODE XREF: seg2286:01FCj
		pop	bp
		retf
; ---------------------------------------------------------------------------

_getmidibeat:
		push	bp
		mov	bp, sp
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		mov	al, 0
		push	ax
		mov	al, 2Dh	; '-'
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		jmp	$+2
; ---------------------------------------------------------------------------

loc_24C5B::				; CODE XREF: seg2286:0219j
		pop	bp
		retf

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

_continuesequence proc far		; CODE XREF: game_manager::continue_song(void)+1AP
		push	bp
		mov	bp, sp
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		mov	al, 0
		push	ax
		mov	al, 1Fh
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		pop	bp
		retf
_continuesequence endp

; ---------------------------------------------------------------------------

_setaudiomode:
		push	bp
		mov	bp, sp
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		mov	al, [bp+6]
		push	ax
		mov	al, 13h
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		pop	bp
		retf
; ---------------------------------------------------------------------------

_loadibkfile:
		push	bp
		mov	bp, sp
		sub	sp, 4
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		push	cs
		call	near ptr _loadoneshot
		pop	cx
		pop	cx
		mov	[bp-4],	ax
		mov	[bp-2],	dx
		mov	ax, [bp-4]
		or	ax, [bp-2]
		jnz	loc_24CBB
		mov	ax, 0FFFFh
		jmp	loc_24CE2
; ---------------------------------------------------------------------------
		jmp	loc_24CDE
; ---------------------------------------------------------------------------

loc_24CBB::				; CODE XREF: seg2286:0272j
		push	word ptr [bp-4]
		push	word ptr [bp-2]
		xor	ax, ax
		push	ax
		mov	al, 0
		push	ax
		mov	al, 39h	; '9'
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		push	word ptr [bp-2]
		push	word ptr [bp-4]
		call	_farfree
		pop	cx
		pop	cx

loc_24CDE::				; CODE XREF: seg2286:0279j
		xor	ax, ax
		jmp	$+2
; ---------------------------------------------------------------------------

loc_24CE2::				; CODE XREF: seg2286:0277j
					; seg2286:02A0j
		mov	sp, bp
		pop	bp
		retf
; ---------------------------------------------------------------------------

_setmidispeaker:
		push	bp
		mov	bp, sp
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		mov	al, [bp+6]
		push	ax
		mov	al, 16h
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		pop	bp
		retf
; ---------------------------------------------------------------------------

_resetmpu401:
		push	bp
		mov	bp, sp
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		mov	al, 0
		push	ax
		mov	al, 38h	; '8'
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		jmp	$+2
; ---------------------------------------------------------------------------

loc_24D1D::				; CODE XREF: seg2286:02DBj
		pop	bp
		retf
; ---------------------------------------------------------------------------

_setmastervolume:
		push	bp
		mov	bp, sp
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		mov	al, [bp+6]
		mov	ah, 0
		mov	cl, 4
		shl	ax, cl
		mov	dl, [bp+8]
		mov	dh, 0
		or	ax, dx
		push	ax

loc_24D39::
		mov	al, 0
		push	ax
		mov	al, 20h	; ' '
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		jmp	$+2
; ---------------------------------------------------------------------------

loc_24D48::				; CODE XREF: seg2286:0306j
		pop	bp
		retf
; ---------------------------------------------------------------------------

_getlastvocmarker:
		push	bp
		mov	bp, sp
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		mov	al, 0
		push	ax
		mov	al, 27h	; '''
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		jmp	$+2
; ---------------------------------------------------------------------------

loc_24D65::				; CODE XREF: seg2286:0323j
		pop	bp
		retf
; ---------------------------------------------------------------------------

_setvocindex:
		push	bp
		mov	bp, sp
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		push	word ptr [bp+6]
		mov	al, 0
		push	ax
		mov	al, 28h	; '('
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		pop	bp
		retf
		assume es:nothing

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

_setvocvolume	proc far		; CODE XREF: game_manager::game_manager(uchar *)+141P

arg_0		= byte ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		mov	al, [bp+arg_0]
		mov	ah, 0
		mov	cl, 4
		shl	ax, cl
		mov	dl, [bp+arg_2]
		mov	dh, 0
		or	ax, dx
		push	ax
		mov	al, 0
		push	ax
		mov	al, 21h	; '!'
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		jmp	$+2
; ---------------------------------------------------------------------------

loc_24DAB::				; CODE XREF: _setvocvolume+27j
		pop	bp
		retf
_setvocvolume	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

_setfmvolume	proc far		; CODE XREF: game_manager::game_manager(uchar *)+135P

arg_0		= byte ptr  6
arg_2		= byte ptr  8

		push	bp
		mov	bp, sp
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		mov	al, [bp+arg_0]
		mov	ah, 0
		mov	cl, 4
		shl	ax, cl
		mov	dl, [bp+arg_2]
		mov	dh, 0
		or	ax, dx
		push	ax
		mov	al, 0
		push	ax
		mov	al, 22h	; '"'
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		jmp	$+2
; ---------------------------------------------------------------------------

loc_24DD6::				; CODE XREF: _setfmvolume+27j
		pop	bp
		retf
_setfmvolume	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

_joystickupdate	proc far		; CODE XREF: game_manager::doit(void)+A4P
					; game_manager::joy_update(void)+3P
		push	bp
		mov	bp, sp
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		mov	al, 0
		push	ax
		mov	al, 29h	; ')'
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		pop	bp
		retf
_joystickupdate	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

_joystickbutton	proc far		; CODE XREF: seg0fa9:0D14P
					; game_manager::doit(void)+F8P	...

arg_0		= byte ptr  6

		push	bp
		mov	bp, sp
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		mov	al, [bp+arg_0]
		push	ax
		mov	al, 2Ch	; ','
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		jmp	$+2
; ---------------------------------------------------------------------------

loc_24E0F::				; CODE XREF: _joystickbutton+1Aj
		pop	bp
		retf
_joystickbutton	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

_joystickx	proc far		; CODE XREF: game_manager::doit(void)+A9P
		push	bp
		mov	bp, sp
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		mov	al, 0
		push	ax
		mov	al, 2Ah	; '*'
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		jmp	$+2
; ---------------------------------------------------------------------------

loc_24E2C::				; CODE XREF: _joystickx+19j
		pop	bp
		retf
_joystickx	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

_joysticky	proc far		; CODE XREF: game_manager::doit(void)+B1P
		push	bp
		mov	bp, sp
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		mov	al, 0
		push	ax
		mov	al, 2Bh	; '+'
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		jmp	$+2
; ---------------------------------------------------------------------------

loc_24E49::				; CODE XREF: _joysticky+19j
		pop	bp
		retf
_joysticky	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

_adlibdetect	proc far		; CODE XREF: game_manager::game_manager(uchar *)+ECP
		push	bp
		mov	bp, sp
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		mov	al, 0
		push	ax
		mov	al, 23h	; '#'
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		jmp	$+2
; ---------------------------------------------------------------------------

loc_24E66::				; CODE XREF: _adlibdetect+19j
		pop	bp
		retf
_adlibdetect	endp

; ---------------------------------------------------------------------------

_dspportsetting:
		push	bp
		mov	bp, sp
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		mov	al, 0
		push	ax
		mov	al, 37h	; '7'
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		jmp	$+2
; ---------------------------------------------------------------------------

loc_24E83::				; CODE XREF: seg2286:0441j
		pop	bp
		retf

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

_dspclose	proc far		; CODE XREF: game_manager::~game_manager(void)+14P
					; seg2286:0926p
		push	bp
		mov	bp, sp
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		mov	al, 0
		push	ax
		mov	al, 4
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		pop	bp
		retf
_dspclose	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

_dspreset	proc far		; CODE XREF: game_manager::game_manager(uchar *)+F8P
		push	bp
		mov	bp, sp
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		mov	al, 0
		push	ax
		mov	al, 1
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		jmp	$+2
; ---------------------------------------------------------------------------

loc_24EBB::				; CODE XREF: _dspreset+19j
		pop	bp
		retf
_dspreset	endp

; ---------------------------------------------------------------------------

_forceconfig:
		push	bp
		mov	bp, sp
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		push	word ptr [bp+6]
		mov	al, [bp+8]
		push	ax
		mov	al, 2
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		jmp	$+2
; ---------------------------------------------------------------------------

loc_24ED9::				; CODE XREF: seg2286:0497j
		pop	bp
		retf
		assume es:nothing

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

_getsequence	proc far		; CODE XREF: game_manager::play_song(uchar *)+23P
					; game_manager::load_voc(uchar *)+38P

nbytes_______	= dword	ptr -8
var_4		= word ptr -4
var_2		= word ptr -2
arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		sub	sp, 8
		mov	[bp+var_4], 0
		mov	[bp+var_2], 0
		push	[bp+arg_2]
		push	[bp+arg_0]
		push	cs
		call	near ptr _openelement
		pop	cx
		pop	cx
		mov	word ptr [bp+nbytes_______], ax
		mov	word ptr [bp+nbytes_______+2], dx
		cmp	word ptr [bp+nbytes_______+2], 0
		jl	loc_24F46
		jg	loc_24F0B
		cmp	word ptr [bp+nbytes_______], 0
		jbe	loc_24F46

loc_24F0B::				; CODE XREF: _getsequence+28j
		xor	ax, ax
		push	ax
		push	word ptr [bp+nbytes_______] ; nbytes
		call	_farmalloc
		assume es:nothing
		pop	cx
		pop	cx
		mov	[bp+var_4], ax
		mov	[bp+var_2], dx
		mov	ax, [bp+var_4]
		or	ax, [bp+var_2]
		jnz	loc_24F2C
		xor	dx, dx
		xor	ax, ax
		jmp	loc_24F54
; ---------------------------------------------------------------------------

loc_24F2C::				; CODE XREF: _getsequence+49j
		push	word ptr [bp+nbytes_______]
		push	[bp+var_2]
		push	[bp+var_4]
		push	cs
		call	near ptr _elementread
		add	sp, 6
		mov	word ptr [bp+nbytes_______], ax
		mov	word ptr [bp+nbytes_______+2], 0
		jmp	loc_24F4C
; ---------------------------------------------------------------------------

loc_24F46::				; CODE XREF: _getsequence+26j
					; _getsequence+2Ej
		xor	dx, dx
		xor	ax, ax
		jmp	loc_24F54
; ---------------------------------------------------------------------------

loc_24F4C::				; CODE XREF: _getsequence+69j
		mov	dx, [bp+var_2]
		mov	ax, [bp+var_4]
		jmp	$+2
; ---------------------------------------------------------------------------

loc_24F54::				; CODE XREF: _getsequence+4Fj
					; _getsequence+6Fj ...
		mov	sp, bp
		pop	bp
		retf
_getsequence	endp

; ---------------------------------------------------------------------------

_gonote:
		push	bp
		mov	bp, sp
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		mov	al, [bp+8]
		mov	ah, 0
		mov	cl, 8
		shl	ax, cl
		mov	dl, [bp+0Ah]
		mov	dh, 0
		or	ax, dx
		push	ax
		mov	al, [bp+6]
		push	ax
		mov	al, 10h
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		pop	bp
		retf
; ---------------------------------------------------------------------------

_loadsbifile:
		push	bp
		mov	bp, sp
		sub	sp, 84h
		push	word ptr [bp+8]
		push	word ptr [bp+6]
		push	cs
		call	near ptr _openelement
		pop	cx
		pop	cx
		mov	[bp-4],	ax
		mov	[bp-2],	dx
		cmp	word ptr [bp-2], 0
		jl	loc_24FD3
		jg	loc_24FA9
		cmp	word ptr [bp-4], 0
		jbe	loc_24FD3

loc_24FA9::				; CODE XREF: seg2286:0561j
		push	word ptr [bp-4]
		push	ss
		lea	ax, [bp-84h]
		push	ax
		push	cs
		call	near ptr _elementread
		add	sp, 6
		lea	ax, [bp-84h]
		push	ax
		push	ss
		mov	al, [bp+0Ah]
		cbw
		push	ax
		mov	al, 0
		push	ax
		mov	al, 0Fh
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		jmp	loc_24FD8
; ---------------------------------------------------------------------------

loc_24FD3::				; CODE XREF: seg2286:055Fj
					; seg2286:0567j
		mov	ax, 0FFFFh
		jmp	loc_24FDC
; ---------------------------------------------------------------------------

loc_24FD8::				; CODE XREF: seg2286:0591j
		xor	ax, ax
		jmp	$+2
; ---------------------------------------------------------------------------

loc_24FDC::				; CODE XREF: seg2286:0596j
					; seg2286:059Aj
		mov	sp, bp
		pop	bp
		retf
; ---------------------------------------------------------------------------

_setpwmrate:
		push	bp
		mov	bp, sp
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		push	word ptr [bp+6]
		mov	al, 0
		push	ax
		mov	al, 43h	; 'C'
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		pop	bp
		retf
; ---------------------------------------------------------------------------

_playpwmblock:
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		or	ax, [bp+8]
		jnz	loc_2500B
		mov	ax, 0FFFFh
		jmp	loc_25023
; ---------------------------------------------------------------------------

loc_2500B::				; CODE XREF: seg2286:05C4j
		push	word ptr [bp+6]
		push	word ptr [bp+8]
		xor	ax, ax
		push	ax
		mov	al, 0
		push	ax
		mov	al, 1Bh
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		jmp	$+2
; ---------------------------------------------------------------------------

loc_25023::				; CODE XREF: seg2286:05C9j
					; seg2286:05E1j
		pop	bp
		retf
; ---------------------------------------------------------------------------

_playpwmwav:
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		or	ax, [bp+8]
		jnz	loc_25035
		mov	ax, 0FFFFh
		jmp	loc_2504D
; ---------------------------------------------------------------------------

loc_25035::				; CODE XREF: seg2286:05EEj
		push	word ptr [bp+6]
		push	word ptr [bp+8]
		xor	ax, ax
		push	ax
		mov	al, 0
		push	ax
		mov	al, 40h	; '@'
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		jmp	$+2
; ---------------------------------------------------------------------------

loc_2504D::				; CODE XREF: seg2286:05F3j
					; seg2286:060Bj
		pop	bp
		retf
		assume es:nothing

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

_playvocblock	proc far		; CODE XREF: game_manager::play_voc(uchar *)+24P

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		or	ax, [bp+arg_2]
		jnz	loc_2505F
		mov	ax, 0FFFFh
		jmp	loc_25077
; ---------------------------------------------------------------------------

loc_2505F::				; CODE XREF: _playvocblock+9j
		push	[bp+arg_0]
		push	[bp+arg_2]
		xor	ax, ax
		push	ax
		mov	al, 0
		push	ax
		mov	al, 6
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		jmp	$+2
; ---------------------------------------------------------------------------

loc_25077::				; CODE XREF: _playvocblock+Ej
					; _playvocblock+26j
		pop	bp
		retf
_playvocblock	endp

; ---------------------------------------------------------------------------

_playwavblock:
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		or	ax, [bp+8]
		jnz	loc_25089
		mov	ax, 0FFFFh
		jmp	loc_250A1
; ---------------------------------------------------------------------------

loc_25089::				; CODE XREF: seg2286:0642j
		push	word ptr [bp+6]
		push	word ptr [bp+8]
		xor	ax, ax
		push	ax
		mov	al, 0
		push	ax
		mov	al, 3Ah	; ':'
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		jmp	$+2
; ---------------------------------------------------------------------------

loc_250A1::				; CODE XREF: seg2286:0647j
					; seg2286:065Fj
		pop	bp
		retf
; ---------------------------------------------------------------------------

_releasepolychannel:
		push	bp
		mov	bp, sp
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		push	word ptr [bp+6]
		mov	al, 0
		push	ax
		mov	al, 44h	; 'D'
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		pop	bp
		retf
; ---------------------------------------------------------------------------

_killpolychannel:
		push	bp
		mov	bp, sp
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		push	word ptr [bp+6]
		mov	al, 0
		push	ax
		mov	al, 47h	; 'G'
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		pop	bp
		retf

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

_playcmfblock	proc far		; CODE XREF: game_manager::turn_sound(uchar)+37P
					; game_manager::play_song(uchar	*)+68P

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		mov	ax, [bp+arg_0]
		or	ax, [bp+arg_2]
		jnz	loc_250E6
		jmp	loc_250FC
; ---------------------------------------------------------------------------

loc_250E6::				; CODE XREF: _playcmfblock+9j
		push	[bp+arg_0]
		push	[bp+arg_2]
		xor	ax, ax
		push	ax
		mov	al, 0
		push	ax
		mov	al, 1Eh
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah

loc_250FC::				; CODE XREF: _playcmfblock+Bj
		pop	bp
		retf
_playcmfblock	endp

; ---------------------------------------------------------------------------

_playmidblock:
		push	bp
		mov	bp, sp
		mov	ax, [bp+6]
		or	ax, [bp+8]
		jnz	loc_2510B
		jmp	loc_25121
; ---------------------------------------------------------------------------

loc_2510B::				; CODE XREF: seg2286:06C7j
		push	word ptr [bp+6]
		push	word ptr [bp+8]
		xor	ax, ax
		push	ax
		mov	al, 0
		push	ax
		mov	al, 0Ch
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah

loc_25121::				; CODE XREF: seg2286:06C9j
		pop	bp
		retf
		assume es:seg2608

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

_playvocfile	proc far		; CODE XREF: game_manager::play_voc_file(uchar *)+43P

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	[bp+arg_0]
		push	[bp+arg_2]
		xor	ax, ax
		push	ax
		mov	al, 0
		push	ax
		mov	al, 5
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		jmp	$+2
; ---------------------------------------------------------------------------

loc_2513E::				; CODE XREF: _playvocfile+19j
		pop	bp
		retf
_playvocfile	endp

; ---------------------------------------------------------------------------

_recordflatfile:
		push	bp
		mov	bp, sp
		push	word ptr [bp+6]
		push	word ptr [bp+8]
		push	word ptr [bp+0Ah]
		mov	al, 0
		push	ax
		mov	al, 3Ch	; '<'
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		jmp	$+2
; ---------------------------------------------------------------------------

loc_2515B::				; CODE XREF: seg2286:0719j
		pop	bp
		retf
; ---------------------------------------------------------------------------

_playflatfile:
		push	bp
		mov	bp, sp
		push	word ptr [bp+6]
		push	word ptr [bp+8]
		push	word ptr [bp+0Ah]
		mov	al, [bp+0Ch]
		push	ax
		mov	al, 3Fh	; '?'
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		jmp	$+2
; ---------------------------------------------------------------------------

loc_25179::				; CODE XREF: seg2286:0737j
		pop	bp
		retf
; ---------------------------------------------------------------------------

_stopflatrecord:
		push	bp
		mov	bp, sp
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		mov	al, 0
		push	ax
		mov	al, 3Dh	; '='
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		jmp	$+2
; ---------------------------------------------------------------------------

loc_25196::				; CODE XREF: seg2286:0754j
		pop	bp
		retf
; ---------------------------------------------------------------------------

_playwavfile:
		push	bp
		mov	bp, sp
		push	word ptr [bp+6]
		push	word ptr [bp+8]
		xor	ax, ax
		push	ax
		mov	al, 0
		push	ax
		mov	al, 3Bh	; ';'
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		jmp	$+2
; ---------------------------------------------------------------------------

loc_251B3::				; CODE XREF: seg2286:0771j
		pop	bp
		retf
; ---------------------------------------------------------------------------

_programchange:
		push	bp
		mov	bp, sp
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		mov	ax, [bp+8]
		and	ax, 0FFh
		push	ax
		mov	al, [bp+6]
		push	ax
		mov	al, 12h
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		pop	bp
		retf
		assume es:nothing

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

_setchannelvolume proc far		; CODE XREF: game_manager::game_manager(uchar *)+155P

arg_0		= byte ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		mov	ax, [bp+arg_2]
		and	ax, 0FFh
		mov	dx, 700h
		or	dx, ax
		push	dx
		mov	al, [bp+arg_0]
		push	ax
		mov	al, 4Dh	; 'M'
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		pop	bp
		retf
_setchannelvolume endp

; ---------------------------------------------------------------------------

_resetrealtime:
		push	bp
		mov	bp, sp
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		mov	al, 0
		push	ax
		mov	al, 0Ah
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		pop	bp
		retf
; ---------------------------------------------------------------------------

_sequenceplaying:
		push	bp
		mov	bp, sp
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		mov	al, 0
		push	ax
		mov	al, 0Eh
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		jmp	$+2
; ---------------------------------------------------------------------------

loc_25230::				; CODE XREF: seg2286:07EEj
		pop	bp
		retf
; ---------------------------------------------------------------------------

_setloopmode:
		push	bp
		mov	bp, sp
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		push	word ptr [bp+6]
		mov	al, 0
		push	ax
		mov	al, 1Dh
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		pop	bp
		retf
; ---------------------------------------------------------------------------

_setrealtime:
		push	bp
		mov	bp, sp
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		push	word ptr [bp+6]
		mov	al, 0
		push	ax
		mov	al, 9
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		jmp	$+2
; ---------------------------------------------------------------------------

loc_25268::				; CODE XREF: seg2286:0826j
		pop	bp
		retf
		assume es:nothing

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

_startresource	proc far		; CODE XREF: game_manager::game_manager(uchar *)+33P

arg_0		= word ptr  6
arg_2		= word ptr  8

		push	bp
		mov	bp, sp
		push	[bp+arg_0]
		push	[bp+arg_2]
		xor	ax, ax
		push	ax
		mov	al, 0
		push	ax
		mov	al, 14h
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		mov	ax, _worx_ax
		jmp	$+2
; ---------------------------------------------------------------------------

loc_25288::				; CODE XREF: _startresource+1Cj
		pop	bp
		retf
_startresource	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

_startworx	proc far		; CODE XREF: game_manager::game_manager(uchar *):loc_13325P
		push	bp
		mov	bp, sp
		call	_core_startworx
		pop	bp
		retf
_startworx	endp

; ---------------------------------------------------------------------------

_stopnote:
		push	bp
		mov	bp, sp
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		mov	al, [bp+8]
		mov	ah, 0
		and	ax, 0FFh
		mov	cl, 8
		shl	ax, cl
		push	ax
		mov	al, [bp+6]
		push	ax
		mov	al, 11h
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		pop	bp
		retf
		assume es:nothing

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

_stopsequence	proc far		; CODE XREF: game_manager::turn_sound(uchar)+4CP
					; game_manager::stop_song(void)+1AP ...
		push	bp
		mov	bp, sp
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		mov	al, 0
		push	ax
		mov	al, 0Dh
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		pop	bp
		retf
_stopsequence	endp


; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

_stopvoc	proc far		; CODE XREF: game_manager::turn_sound(uchar)+5AP
					; game_manager::remove_sound(uchar *)+EP ...
		push	bp
		mov	bp, sp
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		mov	al, 0
		push	ax
		mov	al, 7
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		pop	bp
		retf
_stopvoc	endp

; ---------------------------------------------------------------------------

_stoppwm:
		push	bp
		mov	bp, sp
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		mov	al, 0
		push	ax
		mov	al, 15h
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		pop	bp
		retf
; ---------------------------------------------------------------------------

_timerdone:
		push	bp
		mov	bp, sp
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		mov	al, 0
		push	ax
		mov	al, 0Bh
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		jmp	$+2
; ---------------------------------------------------------------------------

loc_25326::				; CODE XREF: seg2286:08E4j
		pop	bp
		retf

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

_vocplaying	proc far		; CODE XREF: game_manager::doit(void)+16P
					; game_manager::turn_sound(uchar):loc_13829P ...
		push	bp
		mov	bp, sp
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		mov	al, 0
		push	ax
		mov	al, 8
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		jmp	$+2
; ---------------------------------------------------------------------------

loc_25343::				; CODE XREF: _vocplaying+19j
		pop	bp
		retf
_vocplaying	endp

; ---------------------------------------------------------------------------

_pwmplaying:
		push	bp
		mov	bp, sp
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		mov	al, 0
		push	ax
		mov	al, 1Ch
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		jmp	$+2
; ---------------------------------------------------------------------------

loc_25360::				; CODE XREF: seg2286:091Ej
		pop	bp
		retf
; ---------------------------------------------------------------------------

_closeworxdriver:
		push	bp
		mov	bp, sp
		push	cs
		call	near ptr _dspclose
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		mov	al, 0
		push	ax
		mov	al, 25h	; '%'
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		pop	bp
		retf
; ---------------------------------------------------------------------------

_startpoly:
		push	bp
		mov	bp, sp
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		mov	al, 0
		push	ax
		mov	al, 32h	; '2'
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		pop	bp
		retf
; ---------------------------------------------------------------------------

_closepoly:
		push	bp
		mov	bp, sp
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		mov	al, 0
		push	ax
		mov	al, 34h	; '4'
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		pop	bp
		retf
; ---------------------------------------------------------------------------

_setsmpvolume:
		push	bp
		mov	bp, sp
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		push	word ptr [bp+6]
		mov	al, [bp+8]
		push	ax
		mov	al, 31h	; '1'
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		pop	bp
		retf
; ---------------------------------------------------------------------------

_newpitchpoly:
		push	bp
		mov	bp, sp
		xor	ax, ax
		push	ax
		push	word ptr [bp+8]
		mov	ax, [bp+6]
		mov	cl, 8
		shl	ax, cl
		push	ax
		mov	al, 1
		push	ax
		mov	al, 35h	; '5'
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		pop	bp
		retf
; ---------------------------------------------------------------------------

_playwavpoly:
		push	bp
		mov	bp, sp
		push	word ptr [bp+6]
		push	word ptr [bp+8]
		xor	ax, ax
		push	ax
		mov	al, [bp+0Ah]
		push	ax
		mov	al, 33h	; '3'
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		xor	ax, ax
		push	ax
		push	word ptr [bp+0Ch]
		mov	ax, [bp+0Ah]
		mov	cl, 8
		shl	ax, cl
		push	ax
		mov	al, 0
		push	ax
		mov	al, 35h	; '5'
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		xor	ax, ax
		jmp	$+2
; ---------------------------------------------------------------------------

loc_2542C::				; CODE XREF: seg2286:09EAj
		pop	bp
		retf
; ---------------------------------------------------------------------------

_playvocpoly:
		push	bp
		mov	bp, sp
		push	word ptr [bp+6]
		push	word ptr [bp+8]
		xor	ax, ax
		push	ax
		mov	al, [bp+0Ah]
		push	ax
		mov	al, 41h	; 'A'
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		xor	ax, ax
		push	ax
		push	word ptr [bp+0Ch]
		mov	ax, [bp+0Ah]
		mov	cl, 8
		shl	ax, cl
		push	ax
		mov	al, 0
		push	ax
		mov	al, 35h	; '5'
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		xor	ax, ax
		jmp	$+2
; ---------------------------------------------------------------------------

loc_25467::				; CODE XREF: seg2286:0A25j
		pop	bp
		retf
; ---------------------------------------------------------------------------

_polycellstatus:
		push	bp
		mov	bp, sp
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		mov	al, [bp+6]
		push	ax
		mov	al, 36h	; '6'
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		jmp	$+2
; ---------------------------------------------------------------------------

loc_25485::				; CODE XREF: seg2286:0A43j
		pop	bp
		retf
; ---------------------------------------------------------------------------

_vocpoll:
		push	bp
		mov	bp, sp
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		mov	al, 0
		push	ax
		mov	al, 42h	; 'B'
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		pop	bp
		retf

; =============== S U B	R O U T	I N E =======================================

; Attributes: bp-based frame

_vochooksetting	proc far		; CODE XREF: game_manager::game_manager(uchar *)+12BP

arg_0		= word ptr  6

		push	bp
		mov	bp, sp
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		push	[bp+arg_0]
		mov	al, 0
		push	ax
		mov	al, 3Eh	; '>'
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		pop	bp
		retf
_vochooksetting	endp

; ---------------------------------------------------------------------------

_setmiclevel:
		push	bp
		mov	bp, sp
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		push	word ptr [bp+6]
		mov	al, 0
		push	ax
		mov	al, 4Ah	; 'J'
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		pop	bp
		retf
; ---------------------------------------------------------------------------

_selectinput:
		push	bp
		mov	bp, sp
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		push	word ptr [bp+6]
		mov	al, 0
		push	ax
		mov	al, 4Bh	; 'K'
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		pop	bp
		retf
; ---------------------------------------------------------------------------

_setlinelevel:
		push	bp
		mov	bp, sp
		xor	ax, ax
		push	ax
		xor	ax, ax
		push	ax
		push	word ptr [bp+6]
		mov	al, 0
		push	ax
		mov	al, 4Ch	; 'L'
		push	ax
		push	cs
		call	near ptr _worx_call
		add	sp, 0Ah
		pop	bp
		retf
; ---------------------------------------------------------------------------
		db 0
		db    0
seg2286		ends
		end
