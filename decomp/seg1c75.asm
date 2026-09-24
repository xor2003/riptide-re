; decomp/seg1c75.asm — seg1c75 (extracted from RIPTIDE_.asm)
		.386p

		public	_core_closeworx
		public	_core_startworx
		public	sub_20B06
		public	sub_20B16
		public	sub_20B32
		public	sub_20B42
		public	sub_20C7D
		public	sub_21748
		public	sub_21774
		public	sub_21789
		public	sub_217A9
		public	sub_21837
		public	sub_2187B
		public	sub_218E1
		public	sub_21911
		public	sub_21916
		public	sub_2191B
		public	sub_2192A
		public	sub_2199B
		public	sub_219A7
		public	sub_219CE
		public	sub_219E8
		public	sub_219F3
		public	sub_21A3B
		public	sub_21AD7
		public	sub_21C0F
		public	sub_21C65
		public	sub_21C85
		public	sub_21CB9
		public	sub_21DC5
		public	sub_21DCB
		public	sub_21E96
		public	sub_21FD4
		public	sub_2201C
		public	sub_2203D
		public	sub_2205E
		public	sub_2207F
		public	sub_220B1
		public	sub_220BE
		public	sub_22187
		public	sub_22194
		public	sub_221BF
		public	sub_22228
		public	sub_2222E
		public	sub_2233A
		public	sub_22448
		public	sub_225A6
		public	sub_2269E
		public	sub_226A6
		public	sub_226B0
		public	sub_22708
		public	sub_22738
		public	sub_22744
		public	sub_22754
		public	sub_227B4
		public	sub_229C4
		public	sub_22A90
		public	sub_22AAA
		public	sub_22AC4
		public	sub_22AD3
		public	sub_22B42
		public	sub_22C66
		public	sub_22D4D
		public	sub_22D53
		public	sub_22D90
		public	sub_22EBA
		public	sub_22EC2
		public	sub_22ECA
		public	sub_22ECF
		public	sub_22ED6
		public	sub_22F0D
		public	sub_22F47
		public	sub_22F7C
		public	sub_22F8B
		public	sub_22F9A
		public	sub_22FF3
		public	sub_2301E
		public	sub_23069
		public	sub_23135
		public	sub_2313B
		public	sub_23141
		public	sub_23184
		public	sub_231C6
		public	sub_23233
		public	sub_23291
		public	sub_232ED
		public	sub_23536
		public	sub_23540
		public	sub_2354A
		public	sub_235B6
		public	sub_23DD7
		public	sub_23E1E
		public	sub_23E32
		public	sub_23F39
		public	sub_23F4A
		public	sub_23F6F
		public	sub_23FE6
		public	sub_24087
		public	sub_24157
		public	sub_241CB
		public	sub_241EB
		public	sub_24219
		public	sub_24266
		public	sub_242BB
		public	sub_24311
		public	sub_2433E
		public	sub_24429
		public	sub_24477
		public	sub_244C3
		public	sub_2450D
		public	sub_2457A
		public	sub_245A0
		public	sub_24619
		public	sub_2469C
		public	sub_246C3
		public	sub_24777
		public	sub_247C1
		public	sub_249B6

seg2608		segment	para public 'DATA' use16
seg2608		ends


; ---- segment seg1c75 ----
seg1c75		segment	byte public 'CODE' use16
		assume cs:seg1c75
		org 7
		assume es:nothing, ss:nothing, ds:seg2608, fs:nothing, gs:nothing
		db 3 dup(0)
off_1E93A	dw 0; DATA XREF: _core_startworx+5Cw
					; _core_closeworx+23r ...
word_1E93C	dw 0			; DATA XREF: _core_startworx+64w
					; _core_closeworx+28r
byte_1E93E	db 2002h dup(																																 80h)
word_20940	dw 0			; DATA XREF: sub_23069+39w
					; sub_23069:loc_230BBw	...
word_20942	dw 0			; DATA XREF: sub_22A90r sub_22AD3+6w ...
word_20944	dw 0			; DATA XREF: sub_22AAAr sub_22AD3+Dw ...
unk_20946	db    0			; DATA XREF: sub_22AC4+1o
					; sub_22AD3+15o
		db    0
		db    0
		db    0
word_2094A	dw 0			; DATA XREF: sub_22A90+Br
					; sub_22AD3+54r ...
word_2094C	dw 0			; DATA XREF: sub_22AAA+Br
					; sub_22AD3+68w
word_2094E	dw 0			; DATA XREF: sub_22744+7w sub_22F47r
word_20950	dw 0			; DATA XREF: sub_219F3+1Dr
		dw offset sub_23069
		dw offset sub_23135
		dw offset sub_2199B
		dw offset sub_242BB
		dw offset sub_246C3
		dw offset sub_24777
		dw offset sub_2301E
		dw offset sub_22EC2
		dw offset sub_219A7
		dw offset sub_219CE
		dw offset sub_219E8
		dw offset sub_22B42
		dw offset sub_22754
		dw offset sub_22EBA
		dw offset sub_2207F
		dw offset sub_2269E
		dw offset sub_226A6
		dw offset sub_22708
		dw offset sub_21911
		dw offset sub_21C0F
		dw offset sub_21FD4
		dw offset sub_21916
		dw offset sub_21AD7
		dw offset sub_21A3B
		dw offset sub_21C65
		dw offset sub_21C85
		dw offset sub_21DCB
		dw offset sub_21CB9
		dw offset sub_22738
		dw offset sub_22C66
		dw offset sub_22ECF
		dw offset sub_2201C
		dw offset sub_2205E
		dw offset sub_2203D
		dw offset sub_2192A
		dw offset sub_2187B
		dw offset sub_218E1
		dw offset sub_217A9
		dw 0
		dw 0
		dw offset sub_22AD3
		dw offset sub_22A90
		dw offset sub_22AAA
		dw offset sub_22AC4
		dw offset sub_22ECA
		dw offset sub_22744
		dw offset sub_22D53
		dw offset sub_22D4D
		dw offset sub_235B6
		dw offset sub_23F4A
		dw offset sub_23FE6
		dw offset sub_23F6F
		dw offset sub_2354A
		dw offset sub_23F39
		dw offset sub_2313B
		dw offset sub_24219
		dw offset sub_24266
		dw offset sub_24619
		dw offset sub_245A0
		dw offset sub_24477
		dw offset sub_2457A
		dw offset sub_227B4
		dw offset sub_2450D
		dw offset sub_21E96
		dw offset sub_24087
		dw offset sub_2469C
		dw offset sub_21DC5
		dw offset sub_23536
		dw offset sub_244C3
		dw offset sub_22187
		dw offset sub_23540
		dw offset sub_20B42
		dw offset sub_20C7D
		dw offset sub_20B32
		dw offset sub_20B06
		dw offset sub_20B16
		dw offset sub_22228
		dw offset sub_23E1E
word_209EE	dw 0			; DATA XREF: sub_20C7D:loc_20C8Cw
					; sub_20C7D+39r ...
word_209F0	dw 0			; DATA XREF: sub_20C7D+42r
					; sub_23FE6+1Fr ...
word_209F2	dw 0			; DATA XREF: sub_20C7D+50r
					; sub_23FE6+28r ...
word_209F4	dw 0			; DATA XREF: sub_20C7D+4Bw
					; sub_20C7D+86w
word_209F6	dw 0			; DATA XREF: sub_20C7D+55w
					; sub_20C7D+8Bw
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
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
word_20AF0	dw 0FFFFh		; DATA XREF: sub_20B42+29w
					; sub_20C7D+31r ...
dword_20AF2	dd 0			; DATA XREF: sub_20B42+6w
					; sub_20B42+12r ...
word_20AF6	dw 0			; DATA XREF: sub_20C7D+69w
					; sub_20C7D+79r ...
word_20AF8	dw 0			; DATA XREF: sub_20C7D+19w
					; sub_23FE6+40w ...
word_20AFA	dw 0			; DATA XREF: sub_20C7D+20w
					; sub_23FE6+35w ...
word_20AFC	dw 0			; DATA XREF: sub_20C7D+27w
					; sub_23FE6+24w ...
word_20AFE	dw 0			; DATA XREF: sub_20C7D+2Cw
					; sub_23FE6+2Dw ...
word_20B00	dw 0			; DATA XREF: sub_20C7D+35w
					; sub_23FE6+47w ...
word_20B02	dw 0			; DATA XREF: sub_20C7D+47w
					; sub_20C7D+91w ...
word_20B04	dw 0			; DATA XREF: sub_20C7D+5Aw
					; sub_20C7D+96w ...

; =============== S U B	R O U T	I N E =======================================


sub_20B06	proc near		; DATA XREF: seg1c75:20B6o
		mov	dx, cs:word_21723
		add	dx, 4
		mov	al, 0Ch
		out	dx, al
		inc	dx
		mov	al, bl
		out	dx, al
		retn
sub_20B06	endp


; =============== S U B	R O U T	I N E =======================================


sub_20B16	proc near		; DATA XREF: seg1c75:20B8o
		mov	dx, cs:word_21723
		add	dx, 4
		mov	al, 2Eh	; '.'
		out	dx, al
		inc	dx
		mov	bh, bl
		shl	bh, 1
		shl	bh, 1
		shl	bh, 1
		shl	bh, 1
		or	bl, bh
		mov	al, bl
		out	dx, al
		retn
sub_20B16	endp


; =============== S U B	R O U T	I N E =======================================


sub_20B32	proc near		; DATA XREF: seg1c75:20B4o
		mov	dx, cs:word_21723
		add	dx, 4
		mov	al, 0Ah
		out	dx, al
		inc	dx
		mov	al, bl
		out	dx, al
		retn
sub_20B32	endp


; =============== S U B	R O U T	I N E =======================================


sub_20B42	proc near		; DATA XREF: seg1c75:20B0o
		push	bx
		mov	ax, 4310h
		int	2Fh		; - Multiplex -	XMS - GET DRIVER ADDRESS
					; Return: ES:BX	-> driver entry	point
		mov	word ptr cs:dword_20AF2, bx
		mov	word ptr cs:dword_20AF2+2, es
		mov	ah, 0
		call	cs:dword_20AF2
		cmp	ax, 200h
		jb	loc_20B78
		pop	dx
		mov	ah, 9
		call	cs:dword_20AF2
		cmp	ax, 1
		jnz	loc_20B74
		mov	cs:word_20AF0, dx
		mov	ax, 0
		retn
; ---------------------------------------------------------------------------

loc_20B74::				; CODE XREF: sub_20B42+27j
		mov	ax, 0FFFFh
		retn
; ---------------------------------------------------------------------------

loc_20B78::				; CODE XREF: sub_20B42+1Aj
		pop	bx
		mov	ax, 0
		retn
sub_20B42	endp

; ---------------------------------------------------------------------------
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

; =============== S U B	R O U T	I N E =======================================


sub_20C7D	proc near		; DATA XREF: seg1c75:20B2o
		mov	bx, 0
		call	sub_21AD7
		cmp	dx, 0FFFFh
		jnz	loc_20C8C
		mov	ax, 0FFFFh
		retn
; ---------------------------------------------------------------------------

loc_20C8C::				; CODE XREF: sub_20C7D+9j
		inc	cs:word_209EE
		mov	di, 224Dh
		push	cs
		pop	es
		assume es:seg1c75
		mov	cs:word_20AF8, 0
		mov	cs:word_20AFA, 0
		mov	cs:word_20AFC, di
		mov	cs:word_20AFE, es
		mov	ax, cs:word_20AF0
		mov	cs:word_20B00, ax
		mov	bx, cs:word_209EE
		shl	bx, 1
		shl	bx, 1
		mov	ax, cs:word_209F0[bx]
		mov	cs:word_20B02, ax
		mov	cs:word_209F4[bx], ax
		mov	ax, cs:word_209F2[bx]
		mov	cs:word_209F6[bx], ax
		mov	cs:word_20B04, ax

loc_20CDB::				; CODE XREF: sub_20C7D+9Cj
		mov	bx, 100h
		call	sub_21A3B
		cmp	ax, 0
		jz	loc_20D1B
		mov	cs:word_20AF6, ax
		mov	si, 21C6h
		mov	ah, 0Bh
		call	cs:dword_20AF2
		push	cs
		pop	ds
		assume ds:seg1c75
		mov	ax, cs:word_20AF6
		mov	bx, cs:word_209EE

loc_20CFF::
		shl	bx, 1
		shl	bx, 1
		add	cs:word_209F4[bx], ax
		adc	cs:word_209F6[bx], 0
		add	cs:word_20B02, ax
		adc	cs:word_20B04, 0
		jmp	loc_20CDB
; ---------------------------------------------------------------------------

loc_20D1B::				; CODE XREF: sub_20C7D+67j
		mov	ax, cs:word_209EE
		mov	dx, 0
		retn
sub_20C7D	endp

; ---------------------------------------------------------------------------
		mov	dx, 0
		mov	ax, 0
		retn
; ---------------------------------------------------------------------------
unk_20D2A	db    1			; DATA XREF: sub_21837+6o
		db  11h
		db  4Fh	; O
		db    0
		db 0F1h	; ñ
		db 0F2h	; ò
		db  53h	; S
		db  74h	; t
		db    0
		db    0
unk_20D34	db    8			; DATA XREF: sub_21837+33o
		db    0
		db    8
		db    2
		db    8
		db    4
		db    8
		db  0Bh
		db    8
		db  0Dh
		db    8
		db  0Fh
		db    8
		db  16h
		db    8
		db  18h
		db    8
		db  1Ah
unk_20D46	db    0			; DATA XREF: sub_22448-1Eo
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
		db  75h	; u
		db 0A6h	; ¦
		db 0B8h	; ¸
		db 0A0h	;  
		db  59h	; Y
		db  96h	; 
		db  3Ch	; <
		db  8Dh	; 
		db  2Ah	; *
		db  85h	; 

		db 0F8h	; ø
		db  7Dh	; }
		db  82h	; 
		db  77h	; w
		db 0ADh	; ­
		db  71h	; q
		db 0EDh	; í
		db  69h	; i
		db  52h	; R
		db  65h	; e
		db  1Eh
		db  5Fh	; _
		db 0A1h	; ¡
		db  59h	; Y
		db 0BEh	; ¾
		db  54h	; T
		db  5Ch	; \
		db  50h	; P
		db  2Ch	; ,
		db  4Bh	; K
		db 0B4h	; ´
		db  47h	; G
		db  8Ch	; 
		db  43h	; C
		db 0D8h	; Ø
		db  3Fh	; ?
		db 0C1h	; Á
		db  3Bh	; ;
		db 0D6h	; Ö
		db  38h	; 8
		db  92h	; 
		db  35h	; 5
		db 0A9h	; ©
		db  32h	; 2
		db  8Fh	; 
		db  2Fh	; /
		db 0D0h	; Ð
		db  2Ch	; ,
		db  5Fh	; _
		db  2Ah	; *
		db 0D6h	; Ö
		db  27h	; '
		db 0E4h	; ä
		db  25h	; %
		db  94h	; 
		db  23h	; #
		db  88h	; 
		db  21h	; !
		db 0B4h	; ´
		db  1Fh
		db 0E0h	; à
		db  1Dh
		db  3Fh	; ?
		db  1Ch
		db 0A2h	; ¢
		db  1Ah
		db  31h	; 1
		db  19h
		db 0C7h	; Ç
		db  17h
		db  68h	; h
		db  16h
		db  2Fh	; /
		db  15h
		db    0
		db  14h
		db 0DEh	; Þ
		db  12h
		db 0CAh	; Ê
		db  11h
		db 0D3h	; Ó
		db  10h
		db 0DAh	; Ú
		db  0Fh
		db 0FCh	; ü
		db  0Eh
		db  1Fh
		db  0Eh
		db  5Ah	; Z
		db  0Dh
		db  98h	; 
		db  0Ch
		db 0E3h	; ã
		db  0Bh
		db  3Bh	; ;
		db  0Bh
		db  97h	; 
		db  0Ah
		db    0
		db  0Ah
		db  6Fh	; o
		db    9
		db 0E9h	; é
		db    8
		db  69h	; i
		db    8
		db 0F0h	; ð
		db    7
		db  7Eh	; ~
		db    7
		db  12h
		db    7
		db 0ADh	; ­
		db    6
		db  4Ch	; L
		db    6
		db 0F1h	; ñ
		db    5
		db  9Bh	; 
		db    5
		db  4Bh	; K
		db    5
		db    0
		db    5
		db 0B7h	; ·
		db    4
		db  73h	; s
		db    4
		db  33h	; 3
		db    4
		db 0F7h	; ÷
		db    3
		db 0BEh	; ¾
		db    3
		db  88h	; 
		db    3
		db  56h	; V
		db    3
		db  26h	; &
		db    3
		db 0F8h	; ø
		db    2
		db 0CEh	; Î
		db    2
		db 0A5h	; ¥
		db    2
		db  7Fh	; 
		db    2
		db  5Bh	; [
		db    2
		db  3Ah	; :
		db    2
		db  1Ah
		db    2
		db 0FBh	; û
		db    1
		db 0DFh	; ß
		db    1
		db 0C4h	; Ä
		db    1
		db 0ABh	; «
		db    1
		db  93h	; 
		db    1
		db  7Ch	; |
		db    1
		db  67h	; g
		db    1
		db  52h	; R
		db    1
		db  3Fh	; ?
		db    1
		db  2Dh	; -
		db    1
		db  1Dh
		db    1
		db  0Dh
		db    1
		db 0FDh	; ý
		db    0
		db 0EFh	; ï
		db    0
		db 0E2h	; â
		db    0
		db 0D5h	; Õ
		db    0
		db 0C9h	; É
		db    0
		db 0BEh	; ¾
		db    0
		db 0B3h	; ³
		db    0
		db 0A9h	; ©
		db    0
		db  9Fh	; 
		db    0
		db  96h	; 
		db    0
		db  8Eh	; 
		db    0
		db  86h	; 
		db    0
		db  7Eh	; ~
		db    0
		db  77h	; w
		db    0
		db  71h	; q
		db    0
		db  6Ah	; j
		db    0
		db  64h	; d
		db    0
		db  5Fh	; _
		db    0
		db  59h	; Y
		db    0
		db  54h	; T
		db    0
		db  4Fh	; O
		db    0
		db  4Bh	; K
		db    0
		db  47h	; G
		db    0
		db  43h	; C
		db    0
		db  3Fh	; ?
		db    0
		db  3Bh	; ;
		db    0
		db  38h	; 8
		db    0
		db  35h	; 5
		db    0
		db  32h	; 2
		db    0
		db  2Fh	; /
		db    0
byte_20E46	db 1			; DATA XREF: sub_2207F:loc_22091o
					; sub_220BE+5o	...
		db 1
		db 4Fh
		db 12h
		db 0F1h
		db 0D3h
		db 50h
		db 7Ch
		db 0
		db 0
		db    6
		db    2
		db    1
		db  50h	; P
		db  12h
		db 0F1h	; ñ
		db 0D2h	; Ò
		db  50h	; P
		db  76h	; v
		db    0
		db    0
		db    6
		db    1
		db    1
		db  4Bh	; K
		db  17h
		db 0F1h	; ñ
		db 0D2h	; Ò
		db  50h	; P
		db  76h	; v
		db    0
		db    0
		db    6
		db  13h
		db    1
		db  50h	; P
		db  11h
		db 0F1h	; ñ
		db 0D2h	; Ò
		db  50h	; P
		db  76h	; v
		db    0
		db    0
		db    6
		db  32h	; 2
		db    1
		db  92h	; 
		db  8Fh	; 
		db 0FFh
		db 0FFh
		db  11h
		db  13h
		db    0
		db    0
		db  0Ah
		db  34h	; 4
		db    3
		db  92h	; 
		db  0Fh
		db 0FFh
		db 0FFh
		db  10h
		db    4
		db    0
		db    0
		db  0Ah
		db  34h	; 4
		db    3
		db  92h	; 
		db  14h
		db 0FFh
		db 0FFh
		db  10h
		db    4
		db    0
		db    0
		db  0Ah
		db  53h	; S
		db  51h	; Q
		db  4Eh	; N
		db    0
		db 0F1h	; ñ
		db 0D2h	; Ò
		db    0
		db  86h	; 
		db    0
		db    0
		db    6
		db  28h	; (
		db  21h	; !
		db 0CFh	; Ï
		db  0Dh
		db 0F8h	; ø
		db 0C0h	; À
		db 0E5h	; å
		db 0FFh
		db    0
		db    0
		db    0
		db 0E2h	; â
		db 0E1h	; á
		db 0CAh	; Ê
		db  15h
		db 0F8h	; ø
		db 0C0h	; À
		db 0E5h	; å
		db  0Eh
		db    0
		db    0
		db    8
		db  2Ch	; ,
		db 0A1h	; ¡
		db 0D4h	; Ô
		db  1Ch
		db 0F9h	; ù
		db 0C0h	; À
		db 0FFh
		db 0FFh
		db    0
		db    0
		db    0
		db  2Bh	; +
		db  21h	; !
		db 0CAh	; Ê
		db  13h
		db 0F8h	; ø
		db 0C0h	; À
		db 0E5h	; å
		db 0FFh
		db    0
		db    0
		db    0
		db  29h	; )
		db  21h	; !
		db 0CDh	; Í
		db  14h
		db 0F0h	; ð
		db 0E0h	; à
		db  91h	; 
		db  86h	; 
		db    0
		db    0
		db    2
		db  24h	; $
		db  21h	; !
		db 0D0h	; Ð
		db  14h
		db 0F0h	; ð
		db 0E0h	; à
		db    1
		db  86h	; 
		db    0
		db    0
		db    2
		db  23h	; #
		db  21h	; !
		db 0C8h	; È
		db  10h
		db 0F0h	; ð
		db 0E0h	; à
		db    1
		db  86h	; 
		db    0
		db    0
		db    2
		db  64h	; d
		db  61h	; a
		db 0C9h	; É
		db  14h
		db 0B0h	; °
		db 0F0h	; ð
		db    1
		db  86h	; 
		db    0
		db    0
		db    2
		db  33h	; 3
		db  15h
		db  85h	; 

		db  94h	; 
		db 0A1h	; ¡
		db  72h	; r
		db  10h
		db  23h	; #
		db    0
		db    0
		db    8
		db  31h	; 1
		db  15h
		db  85h	; 

		db  94h	; 
		db 0A1h	; ¡
		db  73h	; s
		db  10h
		db  33h	; 3
		db    0
		db    0
		db    8
		db  31h	; 1
		db  16h
		db  81h	; 
		db  94h	; 
		db 0A1h	; ¡
		db 0C2h	; Â
		db  30h	; 0
		db  74h	; t
		db    0
		db    0
		db    8
		db    3
		db    2
		db  8Ah	; 
		db  94h	; 
		db 0F0h	; ð
		db 0F4h	; ô
		db  7Bh	; {
		db  7Bh	; {
		db    0
		db    0
		db    8
		db    3
		db    1
		db  8Ah	; 
		db  99h	; 
		db 0F0h	; ð
		db 0F4h	; ô
		db  7Bh	; {
		db  7Bh	; {
		db    0
		db    0
		db    8
		db  23h	; #
		db    1
		db  8Ah	; 
		db  94h	; 
		db 0F2h	; ò
		db 0F4h	; ô
		db  7Bh	; {
		db  7Bh	; {
		db    0
		db    0
		db    8
		db  32h	; 2
		db  12h
		db  80h	; 
		db  95h	; 
		db    1
		db  72h	; r
		db  10h
		db  33h	; 3
		db    0
		db    0
		db    8
		db  32h	; 2
		db  14h
		db  80h	; 
		db  90h	; 
		db    1
		db  73h	; s
		db  10h
		db  33h	; 3
		db    0
		db    0
		db    8
		db  31h	; 1
		db  21h	; !
		db  16h
		db  14h
		db  73h	; s
		db  80h	; 
		db  8Eh	; 
		db  9Eh	; 
		db    0
		db    0
		db  0Eh
		db  30h	; 0
		db  21h	; !
		db  16h
		db  10h
		db  73h	; s
		db  80h	; 
		db  7Eh	; ~
		db  9Eh	; 
		db    0
		db    0
		db  0Eh
		db  31h	; 1
		db  21h	; !
		db  94h	; 
		db  15h
		db  33h	; 3
		db 0A0h	;  
		db  73h	; s
		db  97h	; 
		db    0
		db    0
		db  0Eh
		db  31h	; 1
		db  21h	; !
		db  94h	; 
		db  13h
		db 0D3h	; Ó
		db 0A0h	;  
		db  73h	; s
		db  97h	; 
		db    0
		db    0
		db  0Eh
		db  31h	; 1
		db  32h	; 2
		db  45h	; E
		db  11h
		db 0F1h	; ñ
		db 0F2h	; ò
		db  53h	; S
		db  27h	; '
		db    0
		db    0
		db    6
		db  13h
		db  15h
		db  0Ch
		db  1Ah
		db 0F2h	; ò
		db 0F2h	; ò
		db    1
		db 0B6h	; ¶
		db    0
		db    0
		db    8
		db  11h
		db  11h
		db  0Ch
		db  15h
		db 0F2h	; ò
		db 0F2h	; ò
		db    1
		db 0B6h	; ¶
		db    0
		db    0
		db    8
		db  11h
		db  11h
		db  0Ah
		db  10h
		db 0FEh	; þ
		db 0F2h	; ò
		db    4
		db 0BDh	; ½
		db    0
		db    0
		db    8
		db  16h
		db 0E1h	; á
		db  4Dh	; M
		db  11h
		db 0FAh	; ú
		db 0F1h	; ñ
		db  11h
		db 0F1h	; ñ
		db    0
		db    0
		db    8
		db  16h
		db 0F1h	; ñ
		db  40h	; @
		db  17h
		db 0BAh	; º
		db  24h	; $
		db  11h
		db  31h	; 1
		db    0
		db    0
		db    8
		db  61h	; a
		db 0E1h	; á
		db 0A7h	; §
		db  8Eh	; 
		db  72h	; r
		db  50h	; P
		db  8Eh	; 
		db  1Ah
		db    0
		db    0
		db    2
		db  18h
		db 0E1h	; á
		db  4Dh	; M
		db  13h
		db  32h	; 2
		db  51h	; Q
		db  13h
		db 0E3h	; ã
		db    0
		db    0
		db    8
		db  17h
		db  31h	; 1
		db 0C0h	; À
		db  92h	; 
		db  12h
		db  13h
		db  41h	; A
		db  31h	; 1
		db    0
		db    0
		db    6
		db    3
		db  21h	; !
		db  8Fh	; 
		db  90h	; 
		db 0F5h	; õ
		db 0F3h	; ó
		db  55h	; U
		db  33h	; 3
		db    0
		db    0
		db    0
		db  13h
		db 0E1h	; á
		db  4Dh	; M
		db  12h
		db 0FAh	; ú
		db 0F1h	; ñ
		db  11h
		db 0F1h	; ñ
		db    0
		db    0
		db    8
		db  11h
		db 0F1h	; ñ
		db  43h	; C
		db  10h
		db  20h
		db  31h	; 1
		db  15h
		db 0F8h	; ø
		db    0
		db    0
		db    8
		db  11h
		db 0E4h	; ä
		db    3
		db  52h	; R
		db  82h	; 
		db 0F0h	; ð
		db  97h	; 
		db 0F2h	; ò
		db    0
		db    0
		db    8
		db    5
		db  14h
		db  40h	; @
		db  0Fh
		db 0D1h	; Ñ
		db  51h	; Q
		db  53h	; S
		db  71h	; q
		db    0
		db    0
		db    6
		db 0F1h	; ñ
		db  21h	; !
		db    1
		db  12h
		db  77h	; w
		db  81h	; 
		db  17h
		db  18h
		db    0
		db    0
		db    2
		db 0F1h	; ñ
		db 0E1h	; á
		db  18h
		db  17h
		db  32h	; 2
		db 0F1h	; ñ
		db  11h
		db  13h
		db    0
		db    0
		db    0
		db  73h	; s
		db  71h	; q
		db  48h	; H
		db  13h
		db 0F1h	; ñ
		db 0F1h	; ñ
		db  53h	; S
		db    6
		db    0
		db    0
		db    8
		db  71h	; q
		db  61h	; a
		db  8Dh	; 
		db  53h	; S
		db  71h	; q
		db  72h	; r
		db  11h
		db  15h
		db    0
		db    0
		db    6
		db 0D7h	; ×
		db 0D2h	; Ò
		db  4Fh	; O
		db  14h
		db 0F2h	; ò
		db 0F1h	; ñ
		db  61h	; a
		db 0B2h	; ²
		db    0
		db    0
		db    8
		db    1
		db    1
		db  11h
		db  13h
		db 0F0h	; ð
		db 0F0h	; ð
		db 0FFh
		db 0F8h	; ø
		db    0
		db    0
		db  0Ah
		db  31h	; 1
		db  61h	; a
		db  8Bh	; 
		db  10h
		db  41h	; A
		db  22h	; "
		db  11h
		db  13h
		db    0
		db    0
		db    6
		db  31h	; 1
		db  61h	; a
		db  8Bh	; 
		db  10h
		db 0FFh
		db  44h	; D
		db  21h	; !
		db  15h
		db    0
		db    0
		db  0Ah
		db  31h	; 1
		db  61h	; a
		db  8Bh	; 
		db  10h
		db  41h	; A
		db  32h	; 2
		db  11h
		db  15h
		db    0
		db    0
		db    2
		db  71h	; q
		db  21h	; !
		db  1Ch
		db  10h
		db 0FDh	; ý
		db 0E7h	; ç
		db  13h
		db 0D6h	; Ö
		db    0
		db    0
		db  0Eh
		db  71h	; q
		db  21h	; !
		db  1Ch
		db  10h
		db  51h	; Q
		db  54h	; T
		db    3
		db  67h	; g
		db    0
		db    0
		db  0Eh
		db  71h	; q
		db  21h	; !
		db  1Ch
		db  10h
		db  51h	; Q
		db  54h	; T
		db    3
		db  17h
		db    0
		db    0
		db  0Eh
		db  71h	; q
		db  21h	; !
		db  1Ch
		db  10h
		db  54h	; T
		db  53h	; S
		db  15h
		db  49h	; I
		db    0
		db    0
		db  0Eh
		db  71h	; q
		db  61h	; a
		db  56h	; V
		db  10h
		db  51h	; Q
		db  54h	; T
		db    3
		db  17h
		db    0
		db    0
		db  0Eh
		db  71h	; q
		db  21h	; !
		db  1Ch
		db  10h
		db  51h	; Q
		db  54h	; T
		db    3
		db  17h
		db    0
		db    0
		db  0Eh
		db    2
		db    1
		db  29h	; )
		db  90h	; 
		db 0F5h	; õ
		db 0F2h	; ò
		db  75h	; u
		db 0F3h	; ó
		db    0
		db    0
		db    0
		db    2
		db    1
		db  29h	; )
		db  90h	; 
		db 0F0h	; ð
		db 0F4h	; ô
		db  75h	; u
		db  33h	; 3
		db    0
		db    0
		db    0
		db    1
		db  11h
		db  49h	; I
		db  10h
		db 0F1h	; ñ
		db 0F1h	; ñ
		db  53h	; S
		db  74h	; t
		db    0
		db    0
		db    6
		db    1
		db  11h
		db  89h	; 
		db  10h
		db 0F1h	; ñ
		db 0F1h	; ñ
		db  53h	; S
		db  74h	; t
		db    0
		db    0
		db    6
		db    2
		db  11h
		db  89h	; 
		db  10h
		db 0F1h	; ñ
		db 0F1h	; ñ
		db  53h	; S
		db  74h	; t
		db    0
		db    0
		db    6
		db    2
		db  11h
		db  80h	; 
		db  10h
		db 0F1h	; ñ
		db 0F1h	; ñ
		db  53h	; S
		db  74h	; t
		db    0
		db    0
		db    6
		db    1
		db    8
		db  40h	; @
		db  50h	; P
		db 0F1h	; ñ
		db 0F1h	; ñ
		db  53h	; S
		db  53h	; S
		db    0
		db    0
		db    0
		db  21h	; !
		db  21h	; !
		db  15h
		db  90h	; 
		db 0D3h	; Ó
		db 0C3h	; Ã
		db  2Ch	; ,
		db  2Ch	; ,
		db    0
		db    0
		db  0Ah
		db    1
		db  21h	; !
		db  18h
		db  90h	; 
		db 0D4h	; Ô
		db 0C4h	; Ä
		db 0F2h	; ò
		db  8Ah	; 
		db    0
		db    0
		db  0Ah
		db    1
		db  11h
		db  4Eh	; N
		db  10h
		db 0F0h	; ð
		db 0F4h	; ô
		db  7Bh	; {
		db 0C8h	; È
		db    0
		db    0
		db    4
		db    1
		db  11h
		db  44h	; D
		db  10h
		db 0F0h	; ð
		db 0F3h	; ó
		db 0ABh	; «
		db 0ABh	; «
		db    0
		db    0
		db    4
		db  53h	; S
		db  11h
		db  0Eh
		db  10h
		db 0F4h	; ô
		db 0F1h	; ñ
		db 0C8h	; È
		db 0BBh	; »
		db    0
		db    0
		db    4
		db  53h	; S
		db  11h
		db  0Bh
		db  10h
		db 0F2h	; ò
		db 0F2h	; ò
		db 0C8h	; È
		db 0C5h	; Å
		db    0
		db    0
		db    4
		db  21h	; !
		db  21h	; !
		db  15h
		db  10h
		db 0B4h	; ´
		db  94h	; 
		db  4Ch	; L
		db 0ACh	; ¬
		db    0
		db    0
		db  0Ah
		db  21h	; !
		db  21h	; !
		db  15h
		db  10h
		db  94h	; 
		db  64h	; d
		db  1Ch
		db 0ACh	; ¬
		db    0
		db    0
		db  0Ah
		db  21h	; !
		db 0A1h	; ¡
		db  16h
		db  90h	; 
		db  77h	; w
		db  60h	; `
		db  8Fh	; 
		db  2Ah	; *
		db    0
		db    0
		db    6
		db  21h	; !
		db 0A1h	; ¡
		db  19h
		db  90h	; 
		db  77h	; w
		db  60h	; `
		db 0BFh	; ¿
		db  2Ah	; *
		db    0
		db    0
		db    6
		db 0A1h	; ¡
		db 0E2h	; â
		db  13h
		db  90h	; 
		db 0D6h	; Ö
		db  60h	; `
		db 0AFh	; ¯
		db  2Ah	; *
		db    0
		db    0
		db    2
		db 0A2h	; ¢
		db 0E2h	; â
		db  1Dh
		db  90h	; 
		db  95h	; 
		db  60h	; `
		db  24h	; $
		db  2Ah	; *
		db    0
		db    0
		db    2
		db  32h	; 2
		db  61h	; a
		db  9Ah	; 
		db  90h	; 
		db  51h	; Q
		db  60h	; `
		db  19h
		db  39h	; 9
		db    0
		db    0
		db  0Ch
		db 0A4h	; ¤
		db 0E2h	; â
		db  12h
		db  90h	; 
		db 0F4h	; ô
		db  60h	; `
		db  30h	; 0
		db  2Ah	; *
		db    0
		db    0
		db    2
		db  21h	; !
		db  21h	; !
		db  16h
		db  10h
		db  63h	; c
		db  63h	; c
		db  0Eh
		db  0Eh
		db    0
		db    0
		db  0Ch
		db  31h	; 1
		db  21h	; !
		db  16h
		db  10h
		db  63h	; c
		db  63h	; c
		db  0Ah
		db  0Bh
		db    0
		db    0
		db  0Ch
		db  21h	; !
		db  21h	; !
		db  1Bh
		db  10h
		db  63h	; c
		db  63h	; c
		db  0Ah
		db  0Bh
		db    0
		db    0
		db  0Ch
		db  20h
		db  21h	; !
		db  1Bh
		db  10h
		db  63h	; c
		db  63h	; c
		db  0Ah
		db  0Bh
		db    0
		db    0
		db  0Ch
		db  32h	; 2
		db  61h	; a
		db  1Ch
		db  90h	; 
		db  82h	; 
		db  60h	; `
		db  18h
		db    7
		db    0
		db    0
		db  0Ch
		db  32h	; 2
		db 0E1h	; á
		db  18h
		db  90h	; 
		db  51h	; Q
		db  62h	; b
		db  14h
		db  36h	; 6
		db    0
		db    0
		db  0Ch
		db  31h	; 1
		db  22h	; "
		db 0C3h	; Ã
		db  10h
		db  87h	; 
		db  8Bh	; 
		db  17h
		db  0Eh
		db    0
		db    0
		db    2
		db  71h	; q
		db  22h	; "
		db 0C3h	; Ã
		db  14h
		db  8Eh	; 
		db  8Bh	; 
		db  17h
		db  0Eh
		db    0
		db    0
		db    2
		db  70h	; p
		db  22h	; "
		db  8Dh	; 
		db  10h
		db  6Eh	; n
		db  6Bh	; k
		db  17h
		db  0Eh
		db    0
		db    0
		db    2
		db  24h	; $
		db  31h	; 1
		db  4Fh	; O
		db  10h
		db 0F2h	; ò
		db  52h	; R
		db    6
		db    6
		db    0
		db    0
		db  0Eh
		db  31h	; 1
		db  61h	; a
		db  1Bh
		db  10h
		db  64h	; d
		db 0D0h	; Ð
		db    7
		db  67h	; g
		db    0
		db    0
		db  0Eh
		db  31h	; 1
		db  61h	; a
		db  1Bh
		db  10h
		db  61h	; a
		db 0D2h	; Ò
		db    6
		db  36h	; 6
		db    0
		db    0
		db  0Ch
		db  31h	; 1
		db  61h	; a
		db  1Fh
		db  10h
		db  31h	; 1
		db  50h	; P
		db    6
		db  36h	; 6
		db    0
		db    0
		db  0Ch
		db  31h	; 1
		db  61h	; a
		db  1Fh
		db  10h
		db  41h	; A
		db 0A0h	;  
		db    6
		db  36h	; 6
		db    0
		db    0
		db  0Ch
		db  21h	; !
		db  21h	; !
		db  9Ah	; 
		db  90h	; 
		db  53h	; S
		db 0A0h	;  
		db  56h	; V
		db  16h
		db    0
		db    0
		db  0Eh
		db  21h	; !
		db  21h	; !
		db  9Ah	; 
		db  90h	; 
		db  53h	; S
		db 0A0h	;  
		db  56h	; V
		db  16h
		db    0
		db    0
		db  0Eh
		db  61h	; a
		db  21h	; !
		db  19h
		db  10h
		db  53h	; S
		db 0A0h	;  
		db  58h	; X
		db  18h
		db    0
		db    0
		db  0Ch
		db  61h	; a
		db  21h	; !
		db  19h
		db  10h
		db  73h	; s
		db 0A0h	;  
		db  57h	; W
		db  17h
		db    0
		db    0
		db  0Ch
		db  21h	; !
		db  21h	; !
		db  1Bh
		db  10h
		db  71h	; q
		db 0A1h	; ¡
		db 0A6h	; ¦
		db  96h	; 
		db    0
		db    0
		db  0Eh
		db  85h	; 

		db 0A1h	; ¡
		db  91h	; 
		db  10h
		db 0F5h	; õ
		db 0F0h	; ð
		db  44h	; D
		db  45h	; E
		db    0
		db    0
		db    6
		db    7
		db  61h	; a
		db  51h	; Q
		db  10h
		db 0F5h	; õ
		db 0F0h	; ð
		db  33h	; 3
		db  25h	; %
		db    0
		db    0
		db    6
		db  13h
		db  11h
		db  8Ch	; 
		db  90h	; 
		db 0FFh
		db 0FFh
		db  21h	; !
		db    3
		db    0
		db    0
		db  0Eh
		db  38h	; 8
		db 0B1h	; ±
		db  8Ch	; 
		db  50h	; P
		db 0F3h	; ó
		db 0F5h	; õ
		db  0Dh
		db  33h	; 3
		db    0
		db    0
		db  0Eh
		db  87h	; 
		db  22h	; "
		db  91h	; 
		db  10h
		db 0F5h	; õ
		db 0F0h	; ð
		db  55h	; U
		db  54h	; T
		db    0
		db    0
		db    6
		db 0B3h	; ³
		db  90h	; 
		db  4Ah	; J
		db  10h
		db 0B6h	; ¶
		db 0D1h	; Ñ
		db  32h	; 2
		db  31h	; 1
		db    0
		db    0
		db  0Eh
		db    4
		db 0C2h	; Â
		db    0
		db  10h
		db 0FEh	; þ
		db 0F6h	; ö
		db 0F0h	; ð
		db 0B5h	; µ
		db    0
		db    0
		db  0Eh
		db    5
		db    1
		db  4Eh	; N
		db  90h	; 
		db 0DAh	; Ú
		db 0F0h	; ð
		db  15h
		db  13h
		db    0
		db    0
		db  0Ah
		db  31h	; 1
		db  32h	; 2
		db  44h	; D
		db  10h
		db 0F2h	; ò
		db 0F0h	; ð
		db  9Ah	; 
		db  27h	; '
		db    0
		db    0
		db    6
		db 0B0h	; °
		db 0D7h	; ×
		db 0C4h	; Ä
		db  90h	; 
		db 0A4h	; ¤
		db  40h	; @
		db    2
		db  42h	; B
		db    0
		db    0
		db    0
		db 0CAh	; Ê
		db 0CCh	; Ì
		db  84h	; 
		db  10h
		db 0F0h	; ð
		db  59h	; Y
		db 0F0h	; ð
		db  62h	; b
		db    0
		db    0
		db  0Ch
		db  30h	; 0
		db  35h	; 5
		db  35h	; 5
		db  10h
		db 0F5h	; õ
		db 0F0h	; ð
		db 0F0h	; ð
		db  9Bh	; 
		db    0
		db    0
		db    2
		db 0B4h	; ´
		db 0D7h	; ×
		db  87h	; 
		db  90h	; 
		db 0A4h	; ¤
		db  40h	; @
		db    2
		db  42h	; B
		db    0
		db    0
		db    6
		db    7
		db    5
		db  40h	; @
		db    0
		db    9
		db 0F6h	; ö
		db  53h	; S
		db  96h	; 
		db    0
		db    0
		db  0Eh
		db    9
		db    1
		db  4Eh	; N
		db  10h
		db 0DAh	; Ú
		db 0F1h	; ñ
		db  25h	; %
		db  15h
		db    0
		db    0
		db  0Ah
		db    6
		db    0
		db    9
		db  10h
		db 0F4h	; ô
		db 0F6h	; ö
		db 0A0h	;  
		db  46h	; F
		db    0
		db    0
		db  0Eh
		db    7
		db    0
		db    0
		db  10h
		db 0F0h	; ð
		db  5Ch	; \
		db 0F0h	; ð
		db 0DCh	; Ü
		db    0
		db    0
		db  0Eh
		db  1Ch
		db  0Ch
		db  1Eh
		db  10h
		db 0E5h	; å
		db  5Dh	; ]
		db  5Bh	; [
		db 0FAh	; ú
		db    0
		db    0
		db  0Eh
		db  11h
		db    1
		db  8Ah	; 
		db  50h	; P
		db 0F1h	; ñ
		db 0F1h	; ñ
		db  11h
		db 0B3h	; ³
		db    0
		db    0
		db    6
		db    0
		db    0
		db  40h	; @
		db  10h
		db 0D1h	; Ñ
		db 0F2h	; ò
		db  53h	; S
		db  56h	; V
		db    0
		db    0
		db  0Eh
		db  32h	; 2
		db  11h
		db  44h	; D
		db  10h
		db 0F8h	; ø
		db 0F5h	; õ
		db 0FFh
		db  7Fh	; 
		db    0
		db    0
		db  0Eh
		db    0
		db    2
		db  40h	; @
		db  10h
		db    9
		db 0F7h	; ÷
		db  53h	; S
		db  94h	; 
		db    0
		db    0
		db  0Eh
		db  11h
		db    1
		db  86h	; 
		db  90h	; 
		db 0F2h	; ò
		db 0A0h	;  
		db 0A8h	; ¨
		db 0A8h	; ¨
		db    0
		db    0
		db    8
		db    0
		db  13h
		db  50h	; P
		db  10h
		db 0F2h	; ò
		db 0F2h	; ò
		db  70h	; p
		db  72h	; r
		db    0
		db    0
		db  0Eh
		db 0F0h	; ð
		db 0E0h	; à
		db    0
		db 0D0h	; Ð
		db  11h
		db  11h
		db  11h
		db  11h
		db    0
		db    0
		db  0Eh
		db    7
		db  12h
		db  4Fh	; O
		db  10h
		db 0F2h	; ò
		db 0F2h	; ò
		db  60h	; `
		db  72h	; r
		db    0
		db    0
		db    8
		db    0
		db    0
		db  0Bh
		db  10h
		db 0A8h	; ¨
		db 0D6h	; Ö
		db  4Ch	; L
		db  4Fh	; O
		db    0
		db    0
		db    0
		db    0
		db    0
		db  0Dh
		db  10h
		db 0E8h	; è
		db 0A5h	; ¥
		db 0EFh	; ï
		db 0FFh
		db    0
		db    0
		db    6
		db  31h	; 1
		db  16h
		db  87h	; 
		db  90h	; 
		db 0A1h	; ¡
		db  7Dh	; }
		db  11h
		db  46h	; F
		db    0
		db    0
		db    8
		db  30h	; 0
		db  10h
		db  90h	; 
		db  10h
		db 0F4h	; ô
		db 0F4h	; ô
		db  49h	; I
		db  33h	; 3
		db    0
		db    0
		db  0Ch
		db  24h	; $
		db  31h	; 1
		db  54h	; T
		db  10h
		db  55h	; U
		db  50h	; P
		db 0FDh	; ý
		db  2Dh	; -
		db    0
		db    0
		db  0Eh
byte_213C6	db 10h			; DATA XREF: sub_22448+5Er
		db  10h
		db    1
		db    8
		db    1
		db    8
		db  10h
		db    1
		db  10h
		db    1
		db    4
		db    1
		db    4
		db    4
		db    2
		db    4
		db    2
		db    1
		db    1
		db    4
		db    4
		db    1
		db    4
		db    4
		db    4
		db    4
		db    4
		db    4
		db    1
		db    1
		db    1
		db    1
		db    4
		db    4
		db    1
		db    1
		db    1
		db    1
		db    4
		db    4
unk_213EE	db 0E0h	; à		; DATA XREF: sub_2222E+C3o
		db 0BDh	; ½
		db    0
		db    8
		db  38h	; 8
		db 0A6h	; ¦
		db    9
		db 0B6h	; ¶
		db  0Bh
		db  50h	; P
		db    0
		db 0C6h	; Æ
		db 0A8h	; ¨
		db  70h	; p
		db  4Ch	; L
		db  90h	; 
		db    0
		db  30h	; 0
		db    0
		db 0F0h	; ð
		db    4
		db  53h	; S
		db 0D6h	; Ö
		db  73h	; s
		db  4Fh	; O
		db  93h	; 
		db    0
		db  33h	; 3
		db    0
		db 0F3h	; ó
		db 0E0h	; à
		db 0BDh	; ½
		db    0
		db    8
		db 0E0h	; à
		db 0BDh	; ½
		db    0
		db    8
		db    3
		db 0A7h	; §
		db  0Ah
		db 0B7h	; ·
		db  0Dh
		db  51h	; Q
		db    1
		db 0C7h	; Ç
		db 0FAh	; ú
		db  71h	; q
		db  8Ch	; 
		db  91h	; 
		db    1
		db  31h	; 1
		db    0
		db 0F1h	; ñ
		db 0E0h	; à
		db 0BDh	; ½
		db    0
		db    8
		db 0E0h	; à
		db 0BDh	; ½
		db    0
		db    8
		db  57h	; W
		db 0A8h	; ¨
		db    9
		db 0B8h	; ¸
		db    0
		db  52h	; R
		db    1
		db 0C8h	; È
		db 0F7h	; ÷
		db  72h	; r
		db 0B5h	; µ
		db  92h	; 
		db    4
		db  32h	; 2
		db    0
		db 0F2h	; ò
		db 0E0h	; à
		db 0BDh	; ½
		db    0
		db    8
		db 0E0h	; à
		db 0BDh	; ½
		db    0
		db    8
		db    7
		db  54h	; T
		db 0F8h	; ø
		db  74h	; t
		db  47h	; G
		db  94h	; 
		db  0Ch
		db  34h	; 4
		db    0
		db 0F4h	; ô
		db 0E0h	; à
		db 0BDh	; ½
		db    0
		db    8
		db 0E0h	; à
		db 0BDh	; ½
		db    0
		db    8
		db  0Dh
		db  55h	; U
		db 0F5h	; õ
		db  75h	; u
		db 0A5h	; ¥
		db  95h	; 
		db    1
		db  35h	; 5
		db    0
		db 0F5h	; õ
		db 0E0h	; à
		db 0BDh	; ½
		db    0
		db    8
		db 0FFh
		db 0FFh
unk_21466	db  0Bh			; DATA XREF: sub_2222E+2Eo
		db  50h	; P
		db  0Bh
		db  50h	; P
		db    4
		db  53h	; S
		db    4
		db  53h	; S
		db  0Dh
		db  51h	; Q
		db  0Dh
		db  51h	; Q
		db    0
		db  52h	; R
		db    0
		db  52h	; R
		db    7
		db  54h	; T
		db    7
		db  54h	; T
		db  0Dh
		db  55h	; U
		db  0Dh
		db  55h	; U
		db 0FFh
		db 0FFh
byte_21480	db 0			; DATA XREF: sub_2222E+1Er
					; sub_2222E+81w ...
unk_21481	db  6Bh	; k		; DATA XREF: sub_225A6+27o
		db    1
		dw 181h
		db  98h	; 
		db    1
		db 0B0h	; °
		db    1
		db 0CAh	; Ê
		db    1
		db 0E5h	; å
		db    1
		db    2
		db    2
		db  20h
		db    2
		db  41h	; A
		db    2
		db  63h	; c
		db    2
		db  87h	; 
		db    2
		db 0AEh	; ®
		db    2
word_21499	dw 100h			; DATA XREF: sub_21837+Co
					; sub_220BE+1Br ...
		db    2
		db    8
		db    9
		db  0Ah
		db  10h
		db  11h
		db  12h
word_214A2	dw 403h			; DATA XREF: sub_21837+1Bo
					; sub_220BE+2Ar ...
		db    5
		db  0Bh
		db  0Ch
		db  0Dh
		db  13h
		db  14h
		db  15h
unk_214AB	db  16h			; DATA XREF: sub_225A6+43o
		db 16h
		db  16h
		db  16h
		db  16h
		db  16h
		db  16h
		db  16h
		db  16h
		db  16h
		db  16h
		db  16h
		db  16h
byte_214B8	db 0			; DATA XREF: sub_2222E+F7o
					; sub_225A6+38r ...
		db 0
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
word_214C8	dw 0			; DATA XREF: sub_221BF:loc_221F7o
					; sub_2222E+8Do ...
		db    0
		db    0
		dw 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		dw 0
		dw 0
		dw 0
byte_214DA	db 0			; DATA XREF: sub_22448+131o
					; sub_226B0+23o ...
		db    0
		db 0
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
byte_214EA	db 7Fh			; DATA XREF: sub_2222E+19w
					; sub_225A6+CBr
		db  7Fh	; 
		dw 7F7Fh
		db  7Fh	; 
		db  7Fh	; 
		db  7Fh	; 
		db  7Fh	; 
		db  7Fh	; 
		db  7Fh	; 
		db  7Fh	; 
		db  7Fh	; 
		db  7Fh	; 
		db  7Fh	; 
		db  7Fh	; 
		db  7Fh	; 
byte_214FA	db 0			; DATA XREF: sub_221BF+58o
					; sub_22448:loc_224E2o	...
		db    0
		db 0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
word_21503	dw 0			; DATA XREF: sub_220BE+4Dw
					; sub_225A6+B6r
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db  58h	; X
		db  58h	; X
		db  58h	; X
		db  58h	; X
		db  58h	; X
		db  58h	; X
		db  58h	; X
		db  58h	; X
		db  58h	; X
		db  58h	; X
		db  58h	; X
		db  58h	; X
		db  58h	; X
		db  58h	; X
		db  58h	; X
		db  58h	; X
		db  58h	; X
		db  58h	; X
		db  58h	; X
		db  58h	; X
		db  58h	; X
		db  58h	; X
		db  58h	; X
		db  58h	; X
		db  58h	; X
		db  58h	; X
		db  58h	; X
		db  58h	; X
		db  58h	; X
		db  58h	; X
		db  58h	; X
		db  58h	; X
		db  58h	; X
		db  58h	; X
		db  58h	; X
		db  58h	; X
		db  58h	; X
		db  58h	; X
		db  58h	; X
		db  58h	; X
		db  58h	; X
		db  58h	; X
		db  58h	; X
		db  58h	; X
		db  58h	; X
		db  58h	; X
		db  58h	; X
		db  58h	; X
		db  58h	; X
		db  58h	; X
		db  58h	; X
byte_2153F	db 0			; DATA XREF: sub_217A9w
					; _core_startworx+Dw ...
aWorxToolkitVer	db 'WORX TOOLKIT VERSION 2.1 COPYRIGHT 1993 BY MYSTIC SOFTWARE',0
		db 0
word_2157C	dw 0FFFFh		; DATA XREF: _core_startworx+75w
					; seg1c75:366Cr ...
word_2157E	dw 0			; DATA XREF: sub_219A7+Aw sub_219CE+5w ...
word_21580	dw 0			; DATA XREF: sub_219A7+Ew sub_219CE+Dw ...
word_21582	dw 0			; DATA XREF: sub_219A7+13w
					; sub_219CE+1r
word_21584	dw 0			; DATA XREF: sub_219A7+17w
					; sub_219CE+9r
byte_21586	db 0			; DATA XREF: sub_219A7+1Cw
					; sub_219CE+11w ...
word_21587	dw 0			; DATA XREF: sub_22B42+ADw
					; sub_22C66+D4w ...
word_21589	dw 0			; DATA XREF: sub_22B42+B4w
					; sub_22C66+DBw ...
word_2158B	dw 0			; DATA XREF: sub_22B42+79w
					; sub_22B42+89r ...
word_2158D	dw 0			; DATA XREF: sub_22B42+85w
					; sub_22C66+55w ...
byte_2158F	db 0			; DATA XREF: sub_22B42:loc_22BE3w
					; sub_22C66+CFw ...
word_21590	dw 0			; DATA XREF: sub_22B42:loc_22B6Dw
					; sub_22C66+Fw	...
word_21592	dw 0			; DATA XREF: sub_22B42+53w
					; sub_22C66+Bw	...
byte_21594	db 1			; DATA XREF: sub_22738+5w
					; sub_22D90:loc_22E90r
word_21595	dw 0			; DATA XREF: sub_22B42+48o
					; sub_22B42+10Ao ...
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
word_215D5	dw 0			; DATA XREF: sub_22B42+EDo
					; sub_22C66+AEo ...
word_215D7	dw 0			; DATA XREF: sub_22D90+1Ar
					; sub_22D90+27w ...
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
		db    0
		db    0
		db    0
		db    0
word_21655	dw 0			; DATA XREF: sub_22B42+FEo
					; sub_22C66+C5w ...
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
byte_21695	db 0			; DATA XREF: sub_22754+5w sub_22B42+Ew ...
word_21696	dw 0			; DATA XREF: sub_22D90+46w
					; sub_22D90:loc_22DDCr	...
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
byte_216D6	db 0F4h			; DATA XREF: sub_2233A+A9r
byte_216D7	db 0			; DATA XREF: sub_2233A+31r
					; sub_22D90+59r
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    2
		db    2
		db    2
		dw 102h
		db    1
		db    2
		db    0
word_216E7	dw 0			; DATA XREF: seg1c75:loc_22A4Cw
					; seg1c75:4122r ...
word_216E9	dw 0			; DATA XREF: seg1c75:4126r
					; sub_22F47+1Cw
		db 4 dup(0)
byte_216EF	db 0Ch			; DATA XREF: sub_21911w sub_221BFr ...
byte_216F0	db 0			; DATA XREF: sub_21916w sub_22448-54r
word_216F1	dw 0			; DATA XREF: seg1c75:3679r
					; sub_21FD4+1Dr ...
word_216F3	dw 0			; DATA XREF: sub_22B42+8Ew
					; sub_22B42+F0r ...
word_216F5	dw 0			; DATA XREF: sub_22448+8w
					; sub_22448+17w ...
byte_216F7	db 0			; DATA XREF: sub_2222E+26r
					; sub_2222E+FCr ...
byte_216F8	db 0			; DATA XREF: sub_2233A+10w
					; sub_2233A+49r ...
byte_216F9	db 0			; DATA XREF: sub_2222E+43r
					; sub_2233A+15w ...
byte_216FA	db 0			; DATA XREF: sub_22448:loc_224F3w
					; sub_22448+123w ...
byte_216FB	db 0			; DATA XREF: sub_2233A+Bw
					; sub_2233A+3Ar ...
byte_216FC	db 0			; DATA XREF: sub_2222E:loc_222A9w
					; sub_2222E:loc_222D0w	...
byte_216FD	db 0			; DATA XREF: sub_21CB9r sub_21DCB+1r ...
word_216FE	dw 0			; DATA XREF: sub_21DCB+7Ew
					; sub_21E96+65w ...
word_21700	dw 0			; DATA XREF: sub_21DCB+86w
					; sub_21E96+6Dw ...
word_21702	dw 0			; DATA XREF: sub_21DCB+69w
					; sub_21DCB+95r ...
word_21704	dw 0			; DATA XREF: sub_21DCB+70w
					; sub_21DCB+9Fr ...
		db    0
byte_21707	db 14h			; DATA XREF: sub_231C6+4Fo
		db 75h
		db 77h
		db 17h
byte_2170B	db 14h			; DATA XREF: sub_232ED+1Do
		db 74h
		db 76h
		db 16h
		db 0
		db 0
word_21711	dw 0			; DATA XREF: sub_23069+30w
					; sub_231C6+3Cr ...
		db    0
word_21714	dw 0			; DATA XREF: sub_23069:loc_2308Dw
					; sub_23069+2Bw
		db    0
		db  64h	; d
		db    0
		db    0
		db    0
		db    0
		db    0
byte_2171D	db 0			; DATA XREF: sub_22EC2r sub_2301E+6w ...
		db 5 dup(0)
word_21723	dw 210h			; DATA XREF: sub_20B06r sub_20B16r ...
byte_21725	db 0			; DATA XREF: sub_2201Cr sub_2203Dr ...
word_21726	dw 0FFFFh		; DATA XREF: sub_21A3B+43r
					; sub_21A3B+80r ...
word_21728	dw 0			; DATA XREF: sub_21AD7+DCr
					; sub_21C0F+37o ...
word_2172A	dw 0			; DATA XREF: sub_21A3B+1Er
					; sub_21A3B+4Ao ...
word_2172C	dw 0			; DATA XREF: sub_21AD7+24w
		db    0
		db    0
		db    0
		db    0
word_21732	dw 0			; DATA XREF: sub_21A3B+19r
					; sub_21A3B+22r ...
word_21734	dw 0			; DATA XREF: sub_21AD7+32w
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
byte_21743	db 0			; DATA XREF: sub_21AD7:loc_21B27r
					; sub_21C0F:loc_21C55w	...
word_21744	dw 0			; DATA XREF: _core_startworx+1Dw
					; _core_closeworx+34r ...
word_21746	dw 0			; DATA XREF: _core_startworx+25w
					; _core_closeworx+39r ...

; =============== S U B	R O U T	I N E =======================================


sub_21748	proc near		; CODE XREF: sub_21C85+30p
		push	ax
		push	bx
		xor	bx, bx

loc_2174C::				; CODE XREF: sub_21748+Bj
		cmp	byte ptr es:[bx+di], 0
		jz	loc_21755
		inc	bx
		jmp	loc_2174C
; ---------------------------------------------------------------------------

loc_21755::				; CODE XREF: sub_21748+8j
		cmp	bx, 0
		jz	loc_21771
		mov	ah, es:[di]
		mov	es:[di], bl

loc_21760::				; CODE XREF: sub_21748+23j
		mov	al, es:[bx+di]
		mov	es:[bx+di+1], al
		dec	bx
		cmp	bx, 0
		ja	loc_21760
		mov	es:[di+1], ah

loc_21771::				; CODE XREF: sub_21748+10j
		pop	bx
		pop	ax
		retn
sub_21748	endp

		assume es:nothing

; =============== S U B	R O U T	I N E =======================================


sub_21774	proc near		; CODE XREF: sub_23141+10p
					; sub_23141+3Cp ...
		push	ax
		push	bx
		push	cx
		push	dx
		xor	ax, ax
		int	1Ah		; CLOCK	- GET TIME OF DAY
					; Return: CX:DX	= clock	count
					; AL = 00h if clock was	read or	written	(via AH=0,1) since the previous
					; midnight
					; Otherwise, AL	> 0
		add	bx, dx

loc_2177E::				; CODE XREF: sub_21774+Ej
		int	1Ah
		cmp	dx, bx
		jbe	loc_2177E
		pop	dx
		pop	cx
		pop	bx
		pop	ax
		retn
sub_21774	endp


; =============== S U B	R O U T	I N E =======================================


sub_21789	proc near		; CODE XREF: sub_21AD7+4Dp
					; sub_21C0F+12p
		push	cx
		push	ds
		push	si
		mov	cl, es:[di]
		xor	ch, ch
		mov	si, di
		mov	di, 2BDCh
		push	ds
		push	es
		pop	ds
		assume ds:nothing
		pop	es
		assume es:nothing
		inc	si
		rep movsb
		xor	cl, cl
		mov	es:[di], cl
		pop	si
		pop	ds
		assume ds:seg2608
		pop	cx
		mov	di, 2BDCh
		retn
sub_21789	endp


; =============== S U B	R O U T	I N E =======================================


sub_217A9	proc near		; DATA XREF: seg1c75:206Co
		mov	cs:byte_2153F, 1
		retn
sub_217A9	endp

		assume es:nothing

; =============== S U B	R O U T	I N E =======================================


_core_startworx	proc far		; CODE XREF: _startworx+3P
		push	ax
		push	bx
		push	cx
		push	dx
		push	bp
		push	di
		push	si
		push	ds
		push	es
		push	cs
		pop	ds
		assume ds:seg1c75
		cli
		cld
		mov	cs:byte_2153F, 0
		xor	ax, ax
		mov	es, ax
		assume es:nothing
		mov	di, 18Ch
		mov	ax, es:[di]
		mov	cs:word_21744, ax
		mov	ax, es:[di+2]
		mov	cs:word_21746, ax
		mov	ax, offset sub_219F3
		stosw
		mov	ax, cs
		stosw
		mov	ax, 4092h
		sub	ax, 4
		mov	cs:word_227BE, ax
		mov	ax, cs
		mov	cs:word_227C0, ax
		xor	ax, ax

loc_217F2::				; CODE XREF: _core_startworx+4Aj
		call	sub_22194
		inc	ah
		cmp	ah, 0
		jnz	loc_217F2
		mov	ax, 2001h
		call	sub_22194
		xor	ax, ax
		mov	es, ax
		mov	di, 20h	; ' '
		mov	ax, es:[di]
		mov	cs:off_1E93A, ax
		mov	ax, es:[di+2]
		mov	cs:word_1E93C, ax
		mov	ax, offset loc_22A2D
		stosw
		mov	ax, cs
		stosw
		mov	ax, 952h
		call	sub_22F47
		mov	cs:word_2157C, 952h
		pop	es
		assume es:nothing
		pop	ds
		assume ds:seg2608
		pop	si
		pop	di
		pop	bp
		pop	dx
		pop	cx
		pop	bx
		pop	ax
		sti
		retf
_core_startworx	endp


; =============== S U B	R O U T	I N E =======================================


sub_21837	proc near
		mov	dx, 20h	; ' '
		mov	cx, 5
		mov	si, offset unk_20D2A

loc_21840::				; CODE XREF: sub_21837:loc_21868j
		mov	ah, [si]
		inc	si
		mov	di, offset word_21499
		add	di, bx
		mov	al, [di]
		add	al, dl
		call	sub_22194
		mov	ah, [si]
		inc	si
		mov	di, offset word_214A2
		add	di, bx
		mov	al, [di]
		add	al, dl
		call	sub_22194
		add	dl, 20h	; ' '
		cmp	dl, 0A0h ; ' '
		jnz	loc_21868
		mov	dl, 0E0h ; 'à'

loc_21868::				; CODE XREF: sub_21837+2Dj
		loop	loc_21840
		mov	di, offset unk_20D34
		push	bx
		shl	bl, 1
		add	di, bx
		pop	bx
		mov	ax, [di]
		xchg	ah, al
		call	sub_22194
		retn
sub_21837	endp


; =============== S U B	R O U T	I N E =======================================


sub_2187B	proc near		; DATA XREF: seg1c75:2068o
		mov	ax, 1234h
		mov	dx, 5678h
		retn
sub_2187B	endp


; =============== S U B	R O U T	I N E =======================================


_core_closeworx	proc far		; CODE XREF: _closeworx+3P
		cld
		cli
		push	ax
		push	bx
		push	cx
		push	dx
		push	bp
		push	di
		push	si
		push	ds
		push	es
		push	cs
		pop	ds
		assume ds:seg1c75
		call	sub_2301E
		call	sub_22754
		call	sub_220B1
		call	sub_22744
		call	sub_21C65
		mov	di, 20h	; ' '
		xor	ax, ax
		mov	es, ax
		assume es:nothing
		mov	ax, cs:off_1E93A
		stosw
		mov	ax, cs:word_1E93C
		stosw
		mov	di, 18Ch
		xor	ax, ax
		mov	es, ax
		mov	ax, cs:word_21744
		stosw
		mov	ax, cs:word_21746
		stosw
		push	cs
		pop	ds
		cmp	cs:word_20AF0, 0FFFFh
		jz	loc_218D6
		mov	ah, 0Ah
		mov	dx, cs:word_20AF0
		call	cs:dword_20AF2

loc_218D6::				; CODE XREF: _core_closeworx+46j
		pop	es
		assume es:nothing
		pop	ds
		assume ds:seg2608
		pop	si
		pop	di
		pop	bp
		pop	dx
		pop	cx
		pop	bx
		pop	ax
		sti
		retf
_core_closeworx	endp


; =============== S U B	R O U T	I N E =======================================


sub_218E1	proc near		; DATA XREF: seg1c75:206Ao
		push	ax
		push	bx
		push	cx
		push	dx
		push	bp
		push	di
		push	si
		push	ds
		push	es
		call	sub_22754
		call	sub_220B1
		call	sub_22744
		call	sub_21C65
		mov	di, 18Ch
		xor	ax, ax
		mov	es, ax
		assume es:nothing
		mov	ax, cs:word_21744
		stosw
		mov	ax, cs:word_21746
		stosw
		pop	es
		assume es:nothing
		pop	ds
		pop	si
		pop	di
		pop	bp
		pop	dx
		pop	cx
		pop	bx
		pop	ax
		retn
sub_218E1	endp


; =============== S U B	R O U T	I N E =======================================


sub_21911	proc near		; DATA XREF: seg1c75:2046o
		mov	cs:byte_216EF, al
		retn
sub_21911	endp


; =============== S U B	R O U T	I N E =======================================


sub_21916	proc near		; DATA XREF: seg1c75:204Co
		mov	cs:byte_216F0, al
		retn
sub_21916	endp

		assume es:nothing, ds:seg1c75

; =============== S U B	R O U T	I N E =======================================


sub_2191B	proc near		; CODE XREF: sub_2192A+8p
					; sub_2192A+11p ...
		push	ax
		push	cx
		push	dx
		mov	cx, 8FFh

loc_21921::				; CODE XREF: sub_2191B+9j
		in	al, dx
		in	al, dx
		in	al, dx
		loop	loc_21921
		pop	dx
		pop	cx
		pop	ax
		retn
sub_2191B	endp


; =============== S U B	R O U T	I N E =======================================


sub_2192A	proc near		; DATA XREF: seg1c75:2066o
		push	bx
		push	dx
		mov	dx, 388h
		mov	al, 4
		out	dx, al
		call	sub_2191B
		mov	dx, 389h
		mov	al, 60h	; '`'
		out	dx, al
		call	sub_2191B
		mov	al, 80h	; ''
		out	dx, al
		call	sub_2191B
		mov	dx, 388h
		in	al, dx
		mov	bl, al
		mov	al, 2
		out	dx, al
		call	sub_2191B
		mov	dx, 389h
		mov	al, 0FFh
		out	dx, al
		call	sub_2191B
		mov	dx, 388h
		mov	al, 4
		out	dx, al
		call	sub_2191B
		mov	dx, 389h
		mov	al, 21h	; '!'
		out	dx, al
		call	sub_2191B
		mov	dx, 388h
		in	al, dx
		mov	bh, al
		mov	al, 4
		out	dx, al
		call	sub_2191B
		mov	dx, 389h
		mov	al, 60h	; '`'
		out	dx, al
		call	sub_2191B
		mov	dx, 389h
		mov	al, 80h	; ''
		out	dx, al
		call	sub_2191B
		and	bx, 0E0E0h
		and	bh, bl
		xor	ax, ax
		cmp	bh, 0
		jnz	loc_21997
		inc	ax

loc_21997::				; CODE XREF: sub_2192A+6Aj
		pop	dx
		pop	bx
		clc
		retn
sub_2192A	endp


; =============== S U B	R O U T	I N E =======================================


sub_2199B	proc near		; DATA XREF: seg1c75:2026o
		mov	ax, word ptr cs:aWorxToolkitVer+3Ah ; ""
		mov	word ptr cs:aWorxToolkitVer+3Ah, 0 ; ""
		retn
sub_2199B	endp


; =============== S U B	R O U T	I N E =======================================


sub_219A7	proc near		; DATA XREF: seg1c75:2032o
		mov	ax, bx
		xor	dx, dx
		mov	bx, 1193
		mul	bx
		cli
		mov	cs:word_2157E, ax
		mov	cs:word_21580, dx
		mov	cs:word_21582, ax
		mov	cs:word_21584, dx
		mov	cs:byte_21586, 0
		clc
		mov	ax, bx
		sti
		retn
sub_219A7	endp


; =============== S U B	R O U T	I N E =======================================


sub_219CE	proc near		; DATA XREF: seg1c75:2034o
		push	ax
		mov	ax, cs:word_21582
		mov	cs:word_2157E, ax
		mov	ax, cs:word_21584
		mov	cs:word_21580, ax
		mov	cs:byte_21586, 0
		clc
		pop	ax
		retn
sub_219CE	endp


; =============== S U B	R O U T	I N E =======================================


sub_219E8	proc near		; DATA XREF: seg1c75:2036o
		xor	ah, ah

loc_219EA::
		mov	al, cs:byte_21586
		retn
sub_219E8	endp

; ---------------------------------------------------------------------------
word_219EF	dw 0			; DATA XREF: sub_219F3+22w
					; sub_219F3+39r
word_219F1	dw 0			; DATA XREF: sub_219F3+26w
					; sub_219F3+3Dr
		assume es:nothing, ds:seg2608

; =============== S U B	R O U T	I N E =======================================


sub_219F3	proc far		; DATA XREF: _core_startworx+29o
		inc	cs:word_227B1
		push	ax
		push	bx
		push	cx
		push	dx
		push	bp
		push	di
		push	si
		push	ds
		push	es
		push	cs
		pop	ds
		assume ds:seg1c75
		cld
		mov	es, dx
		assume es:seg2608
		push	ax
		xchg	ah, al
		xor	ah, ah
		shl	ax, 1
		mov	si, ax
		pop	ax
		call	cs:word_20950[si]
		mov	cs:word_219EF, ax
		mov	cs:word_219F1, dx
		pop	es
		assume es:nothing
		pop	ds
		assume ds:seg2608
		pop	si
		pop	di
		pop	bp
		pop	dx
		pop	cx
		pop	bx
		pop	ax
		dec	cs:word_227B1
		mov	ax, cs:word_219EF
		mov	dx, cs:word_219F1
		iret
sub_219F3	endp

; ---------------------------------------------------------------------------
word_21A36	dw 0			; DATA XREF: sub_21A3B+14r
					; sub_21AD7+15w
word_21A38	dw 0			; DATA XREF: sub_21AD7+1Aw
byte_21A3A	db 0			; DATA XREF: sub_21A3B+Br sub_21AD7+Fw ...
		assume es:nothing, ds:seg1c75

; =============== S U B	R O U T	I N E =======================================


sub_21A3B	proc near		; CODE XREF: sub_20C7D+61p
					; sub_21C85+Dp	...
		push	bx
		push	cx
		push	dx
		push	bp
		push	di
		push	si
		push	ds
		push	es
		push	cs
		pop	ds
		push	bx
		cmp	cs:byte_21A3A, 0
		jz	loc_21A77
		assume es:nothing
		pop	bx
		lds	si, dword ptr cs:word_21A36
		assume ds:nothing
		add	si, cs:word_21732
		mov	ax, cs:word_2172A
		sub	ax, cs:word_21732
		cmp	ax, bx
		jnb	loc_21A68
		mov	bx, ax

loc_21A68::				; CODE XREF: sub_21A3B+29j
		add	cs:word_21732, bx
		mov	cx, bx
		rep movsb
		mov	ax, bx
		clc
		jmp	loc_21ACE
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
		assume es:nothing, ds:seg1c75

loc_21A77::				; CODE XREF: sub_21A3B+11j
		mov	ax, 4201h
		xor	cx, cx
		xor	dx, dx
		mov	bx, cs:word_21726
		int	21h		; DOS -	2+ - MOVE FILE READ/WRITE POINTER (LSEEK)
					; AL = method: offset from present location
		mov	si, offset word_2172A
		sub	ax, [si+8]
		sbb	dx, [si+0Ah]
		cmp	dx, [si+2]
		jb	loc_21A9E
		cmp	ax, [si]
		jb	loc_21A9E
		assume es:seg1c75
		xor	ax, ax
		xor	dx, dx
		jmp	loc_21ACC
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
		assume es:nothing

loc_21A9E::				; CODE XREF: sub_21A3B+56j
					; sub_21A3B+5Aj
		xchg	ax, bx
		xchg	cx, dx
		mov	ax, [si]
		mov	dx, [si+2]
		sub	ax, bx
		sbb	dx, cx
		pop	bx
		cmp	dx, 0
		ja	loc_21AB6
		cmp	bx, ax
		jbe	loc_21AB6

loc_21AB4::
		mov	bx, ax

loc_21AB6::				; CODE XREF: sub_21A3B+73j
					; sub_21A3B+77j
		push	ds
		mov	cx, bx
		mov	dx, di
		mov	bx, cs:word_21726
		mov	ax, es
		mov	ds, ax
		assume ds:nothing
		mov	ah, 3Fh
		int	21h		; DOS -	2+ - READ FROM FILE WITH HANDLE
					; BX = file handle, CX = number	of bytes to read
					; DS:DX	-> buffer
		pop	ds
		assume ds:seg1c75
		jmp	loc_21ACE
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
		assume es:seg1c75

loc_21ACC::				; CODE XREF: sub_21A3B+60j
		pop	bx
		stc
		assume es:nothing

loc_21ACE::				; CODE XREF: sub_21A3B+39j
					; sub_21A3B+8Ej
		pop	es
		pop	ds
		pop	si
		pop	di
		pop	bp
		pop	dx
		pop	cx
		pop	bx
		retn
sub_21A3B	endp

		assume es:seg2608

; =============== S U B	R O U T	I N E =======================================


sub_21AD7	proc near		; CODE XREF: sub_20C7D+3p
					; sub_2450D+24p ...
		push	bx
		push	cx
		push	si
		push	di
		push	es
		push	cs
		pop	ds
		call	sub_22F0D
		assume es:nothing
		cmp	bx, 0
		jz	loc_21B16
		assume es:nothing
		mov	cs:byte_21A3A, 1
		mov	cs:word_21A36, di
		mov	cs:word_21A38, es
		mov	cs:word_2172A, bx
		mov	cs:word_2172C, 0
		mov	cs:word_21732, 0
		mov	cs:word_21734, 0
		mov	ax, bx
		clc
		jmp	loc_21C09
; ---------------------------------------------------------------------------
		assume es:nothing

loc_21B16::				; CODE XREF: sub_21AD7+Dj
		mov	cs:byte_21A3A, 0
		cmp	cs:byte_2153F, 0
		jz	loc_21B27
		call	sub_21789

loc_21B27::				; CODE XREF: sub_21AD7+4Bj
		cmp	cs:byte_21743, 0
		jnz	loc_21B9F
		mov	ax, cs:word_21726
		cmp	ax, 0FFFFh
		jz	loc_21B50
		mov	cs:word_21726, 0FFFFh
		mov	bx, ax
		mov	ah, 3Eh
		xor	al, al
		int	21h		; DOS -	2+ - CLOSE A FILE WITH HANDLE
					; BX = file handle
		jnb	loc_21B50
		mov	word ptr cs:aWorxToolkitVer+3Ah, ax ; ""
		jmp	loc_21C02
; ---------------------------------------------------------------------------

loc_21B50::				; CODE XREF: sub_21AD7+5Fj
					; sub_21AD7+70j
		push	ds
		push	dx
		mov	ax, es
		mov	ds, ax
		assume ds:nothing
		mov	ax, 3D00h
		mov	dx, di
		int	21h		; DOS -	2+ - OPEN DISK FILE WITH HANDLE
					; DS:DX	-> ASCIZ filename
					; AL = access mode
					; 0 - read
		pop	dx
		pop	ds
		assume ds:seg2608
		jnb	loc_21B68
		mov	word ptr cs:aWorxToolkitVer+3Ah, ax ; ""
		jmp	loc_21C02
; ---------------------------------------------------------------------------

loc_21B68::				; CODE XREF: sub_21AD7+88j
		mov	cs:word_21726, ax
		mov	bx, ax
		mov	ax, 4202h
		xor	cx, cx
		xor	dx, dx
		int	21h		; DOS -	2+ - MOVE FILE READ/WRITE POINTER (LSEEK)
					; AL = method: offset from end of file
		mov	si, offset word_2172A
		mov	[si], ax
		mov	[si+2],	dx
		mov	word ptr [si+8], 0
		mov	word ptr [si+0Ah], 0
		mov	bx, cs:word_21726
		mov	ax, 4200h
		xor	cx, cx
		xor	dx, dx
		int	21h		; DOS -	2+ - MOVE FILE READ/WRITE POINTER (LSEEK)
					; AL = method: offset from beginning of	file
		mov	ax, [si]
		mov	dx, [si+2]
		jmp	loc_21C09
; ---------------------------------------------------------------------------
		db  90h	; 
; ---------------------------------------------------------------------------
		assume ds:seg1c75

loc_21B9F::				; CODE XREF: sub_21AD7+56j
		call	sub_23184
		mov	ax, 4200h
		mov	bx, cs:word_21726
		xor	cx, cx
		mov	dx, 2
		int	21h		; DOS -	2+ - MOVE FILE READ/WRITE POINTER (LSEEK)
					; AL = method: offset from beginning of	file
		jb	loc_21C09
		mov	cx, cs:word_21728

loc_21BB8::				; CODE XREF: sub_21AD7+104j
					; sub_21AD7+10Fj
		jcxz	loc_21C02
		push	cx
		mov	cx, 19h
		mov	dx, offset word_2172A
		mov	bx, cs:word_21726
		mov	ah, 3Fh
		int	21h		; DOS -	2+ - READ FROM FILE WITH HANDLE
					; BX = file handle, CX = number	of bytes to read
					; DS:DX	-> buffer
		pop	cx
		dec	cx
		xor	bx, bx
		mov	si, dx
		add	si, 0Ch

loc_21BD3::				; CODE XREF: sub_21AD7+107j
		lodsb
		cmp	al, 0
		jz	loc_21BE0
		cmp	al, es:[bx+di]
		jnz	loc_21BB8
		inc	bx
		jmp	loc_21BD3
; ---------------------------------------------------------------------------

loc_21BE0::				; CODE XREF: sub_21AD7+FFj
		cmp	byte ptr es:[bx+di], 0
		jz	loc_21BE8
		jmp	loc_21BB8
; ---------------------------------------------------------------------------

loc_21BE8::				; CODE XREF: sub_21AD7+10Dj
		mov	si, offset word_2172A
		mov	dx, [si+8]
		mov	cx, [si+0Ah]
		mov	bx, cs:word_21726
		mov	ax, 4200h
		int	21h		; DOS -	2+ - MOVE FILE READ/WRITE POINTER (LSEEK)
					; AL = method: offset from beginning of	file
		mov	ax, [si]
		mov	dx, [si+2]
		jnb	loc_21C09
		assume es:nothing

loc_21C02::				; CODE XREF: sub_21AD7+76j
					; sub_21AD7+8Ej ...
		stc
		mov	dx, 0FFFFh
		mov	ax, 0FFFFh
		assume es:nothing

loc_21C09::				; CODE XREF: sub_21AD7+3Cj
					; sub_21AD7+C5j ...
		pop	es
		assume es:seg2608
		pop	di
		pop	si
		pop	cx
		pop	bx
		retn
sub_21AD7	endp


; =============== S U B	R O U T	I N E =======================================


sub_21C0F	proc near		; DATA XREF: seg1c75:2048o
		push	bx
		push	cx
		push	dx
		push	es
		call	sub_21C65
		call	sub_22F0D
		assume es:nothing
		cmp	cs:byte_2153F, 0
		jz	loc_21C24
		call	sub_21789

loc_21C24::				; CODE XREF: sub_21C0F+10j
		push	ds
		mov	dx, di
		mov	ax, es
		mov	ds, ax
		assume ds:nothing
		mov	ax, 3D00h
		int	21h		; DOS -	2+ - OPEN DISK FILE WITH HANDLE
					; DS:DX	-> ASCIZ filename
					; AL = access mode
					; 0 - read
		pop	ds
		assume ds:seg1c75
		jnb	loc_21C3B
		mov	word ptr cs:aWorxToolkitVer+3Ah, ax ; ""
		stc
		jmp	loc_21C60
; ---------------------------------------------------------------------------
		db  90h	; 
; ---------------------------------------------------------------------------

loc_21C3B::				; CODE XREF: sub_21C0F+22j
		mov	cs:word_21726, ax
		mov	bx, ax
		mov	ah, 3Fh	; '?'
		mov	cx, 2
		mov	dx, offset word_21728
		int	21h		; DOS -	2+ - READ FROM FILE WITH HANDLE
					; BX = file handle, CX = number	of bytes to read
					; DS:DX	-> buffer
		jnb	loc_21C55
		mov	word ptr cs:aWorxToolkitVer+3Ah, ax ; ""
		stc
		jmp	loc_21C60
; ---------------------------------------------------------------------------
		db  90h	; 
; ---------------------------------------------------------------------------

loc_21C55::				; CODE XREF: sub_21C0F+3Cj
		mov	cs:byte_21743, 1
		mov	ax, cs:word_21728
		clc

loc_21C60::				; CODE XREF: sub_21C0F+29j
					; sub_21C0F+43j
		pop	es
		assume es:seg2608
		pop	dx
		pop	cx
		pop	bx
		retn
sub_21C0F	endp


; =============== S U B	R O U T	I N E =======================================


sub_21C65	proc near		; CODE XREF: _core_closeworx+19p
					; sub_218E1+12p ...
		push	ax
		push	bx
		mov	bx, cs:word_21726
		cmp	bx, 0FFFFh
		jz	loc_21C75
		mov	ah, 3Eh
		int	21h		; DOS -	2+ - CLOSE A FILE WITH HANDLE
					; BX = file handle

loc_21C75::				; CODE XREF: sub_21C65+Aj
		mov	cs:byte_21743, 0
		mov	cs:word_21726, 0FFFFh
		pop	bx
		pop	ax
		retn
sub_21C65	endp


; =============== S U B	R O U T	I N E =======================================


sub_21C85	proc near		; DATA XREF: seg1c75:2054o
		push	ax
		push	bx
		push	cx
		push	di
		mov	cl, al
		xor	ch, ch

loc_21C8D::				; CODE XREF: sub_21C85+1Dj
		jcxz	loc_21CA4
		mov	bx, 1
		call	sub_21A3B
		cmp	ax, 0
		jz	loc_21CA5
		cmp	byte ptr es:[di], 0Ah
		jz	loc_21CA4
		inc	di
		dec	cx
		jmp	loc_21C8D
; ---------------------------------------------------------------------------

loc_21CA4::				; CODE XREF: sub_21C85:loc_21C8Dj
					; sub_21C85+19j
		inc	di

loc_21CA5::				; CODE XREF: sub_21C85+13j
		mov	byte ptr es:[di], 0
		pop	di
		pop	cx
		pop	bx
		pop	ax
		cmp	cs:byte_2153F, 0
		jz	locret_21CB8
		call	sub_21748

locret_21CB8::				; CODE XREF: sub_21C85+2Ej
		retn
sub_21C85	endp


; =============== S U B	R O U T	I N E =======================================


sub_21CB9	proc near		; DATA XREF: seg1c75:2058o
		mov	al, cs:byte_216FD
		xor	ah, ah
		and	ax, 1
		retn
sub_21CB9	endp

; ---------------------------------------------------------------------------
unk_21CC3	db    0			; DATA XREF: seg1c75:364Fo
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
		db    1
		db    1
		db    1
		db    1
		db    1
		db    1
		db    1
		db    1
		db    1
		db    1
		db    1
		db    1
		db    1
		db    1
		db    1
		db    1
		db    1
		db    2
		db    2
		db    2
		db    2
		db    2
		db    2
		db    2
		db    2
		db    2
		db    2
		db    2
		db    2
		db    2
		db    2
		db    3
		db    3
		db    3
		db    3
		db    3
		db    3
		db    3
		db    3
		db    3
		db    3
		db    3
		db    3
		db    4
		db    4
		db    4
		db    4
		db    4
		db    4
		db    4
		db    4
		db    4
		db    4
		db    4
		db    5
		db    5
		db    5
		db    5
		db    5
		db    5
		db    5
		db    5
		db    5
		db    6
		db    6
		db    6
		db    6
		db    6
		db    6
		db    6
		db    6
		db    7
		db    7
		db    7
		db    7
		db    7
		db    7
		db    8
		db    8
		db    8
		db    8
		db    8
		db    8
		db    9
		db    9
		db    9
		db    9
		db    9
		db  0Ah
		db  0Ah
		db  0Ah
		db  0Ah
		db  0Bh
		db  0Bh
		db  0Bh
		db  0Bh
		db  0Ch
		db  0Ch
		db  0Ch
		db  0Dh
		db  0Dh
		db  0Dh
		db  0Eh
		db  0Eh
		db  0Fh
		db  0Fh
		db  10h
		db  10h
		db  11h
		db  12h
		db  12h
		db  13h
		db  14h
		db  15h
		db  17h
		db  19h
		db  1Bh
		db  20h
		db  25h	; %
		db  27h	; '
		db  29h	; )
		db  2Bh	; +
		db  2Ch	; ,
		db  2Dh	; -
		db  2Eh	; .
		db  2Eh	; .
		db  2Fh	; /
		db  30h	; 0
		db  30h	; 0
		db  31h	; 1
		db  31h	; 1
		db  32h	; 2
		db  32h	; 2
		db  33h	; 3
		db  33h	; 3
		db  33h	; 3
		db  34h	; 4
		db  34h	; 4
		db  34h	; 4
		db  35h	; 5
		db  35h	; 5
		db  35h	; 5
		db  35h	; 5
		db  36h	; 6
		db  36h	; 6
		db  36h	; 6
		db  36h	; 6
		db  37h	; 7
		db  37h	; 7
		db  37h	; 7
		db  37h	; 7
		db  37h	; 7
		db  38h	; 8
		db  38h	; 8
		db  38h	; 8
		db  38h	; 8
		db  38h	; 8
		db  38h	; 8
		db  39h	; 9
		db  39h	; 9
		db  39h	; 9
		db  39h	; 9
		db  39h	; 9
		db  39h	; 9
		db  3Ah	; :
		db  3Ah	; :
		db  3Ah	; :
		db  3Ah	; :
		db  3Ah	; :
		db  3Ah	; :
		db  3Ah	; :
		db  3Ah	; :
		db  3Bh	; ;
		db  3Bh	; ;
		db  3Bh	; ;
		db  3Bh	; ;
		db  3Bh	; ;
		db  3Bh	; ;
		db  3Bh	; ;
		db  3Bh	; ;
		db  3Bh	; ;
		db  3Ch	; <
		db  3Ch	; <
		db  3Ch	; <
		db  3Ch	; <
		db  3Ch	; <
		db  3Ch	; <
		db  3Ch	; <
		db  3Ch	; <
		db  3Ch	; <
		db  3Ch	; <
		db  3Ch	; <
		db  3Dh	; =
		db  3Dh	; =
		db  3Dh	; =
		db  3Dh	; =
		db  3Dh	; =
		db  3Dh	; =
		db  3Dh	; =
		db  3Dh	; =
		db  3Dh	; =
		db  3Dh	; =
		db  3Dh	; =
		db  3Dh	; =
		db  3Eh	; >
		db  3Eh	; >
		db  3Eh	; >
		db  3Eh	; >
		db  3Eh	; >
		db  3Eh	; >
		db  3Eh	; >
		db  3Eh	; >
		db  3Eh	; >
		db  3Eh	; >
		db  3Eh	; >
		db  3Eh	; >
		db  3Eh	; >
		db  3Eh	; >
		db  3Fh	; ?
		db  3Fh	; ?
		db  3Fh	; ?
		db  3Fh	; ?
		db  3Fh	; ?
		db  3Fh	; ?
		db  3Fh	; ?
		db  3Fh	; ?
		db  3Fh	; ?
		db  3Fh	; ?
		db  3Fh	; ?
		db  3Fh	; ?
		db  3Fh	; ?
		db  3Fh	; ?
		db  3Fh	; ?
		db  3Fh	; ?
		db  3Fh	; ?
		db  3Fh	; ?
		db  3Fh	; ?
		db  3Fh	; ?
		db  3Fh	; ?
		db  3Fh	; ?
		db  3Fh	; ?
		db  3Fh	; ?
		db  3Fh	; ?
		db  3Fh	; ?
		db  3Fh	; ?
word_21DC3	dw 18643		; DATA XREF: sub_21DC5w sub_21DCB+4Er	...

; =============== S U B	R O U T	I N E =======================================


sub_21DC5	proc near		; DATA XREF: seg1c75:20A6o
		mov	cs:word_21DC3, bx
		retn
sub_21DC5	endp


; =============== S U B	R O U T	I N E =======================================


sub_21DCB	proc near		; DATA XREF: seg1c75:2056o
		cli
		cmp	cs:byte_216FD, 0
		jz	loc_21DD7
		call	sub_21FD4

loc_21DD7::				; CODE XREF: sub_21DCB+7j
		call	sub_22F0D
		add	di, 1Ah

loc_21DDD::				; CODE XREF: sub_21DCB+2Aj
		cmp	byte ptr es:[di], 1
		jz	loc_21DF7
		cmp	byte ptr es:[di], 0
		jnz	loc_21DEC
		jmp	loc_21E92
; ---------------------------------------------------------------------------

loc_21DEC::				; CODE XREF: sub_21DCB+1Cj
		mov	ax, es:[di+1]
		add	di, ax
		add	di, 4
		jmp	loc_21DDD
; ---------------------------------------------------------------------------

loc_21DF7::				; CODE XREF: sub_21DCB+16j
		mov	ax, es:[di+1]
		mov	cs:word_21F63, ax
		mov	al, es:[di+4]
		xor	ah, ah
		mov	bx, 100h
		sub	bx, ax
		mov	dx, 0Fh
		mov	ax, 4240h
		cmp	bx, 0
		jz	loc_21E92
		div	bx
		xor	dx, dx
		mov	bx, cs:word_21DC3
		div	bx
		mov	cs:word_21F73, ax
		xor	ax, ax
		mov	bx, cs:word_21DC3
		div	bx
		mov	cs:word_21F6C, ax
		add	di, 20h	; ' '
		mov	cs:word_21702, di
		mov	ax, es
		mov	cs:word_21704, ax
		xor	ax, ax
		mov	es, ax
		assume es:nothing
		mov	di, 20h	; ' '
		mov	ax, es:[di]
		mov	cs:word_216FE, ax
		mov	ax, es:[di+2]
		mov	cs:word_21700, ax
		mov	ax, offset loc_21F48
		stosw
		mov	ax, cs
		stosw
		mov	al, 0B0h ; '°'
		out	43h, al		; Timer	8253-5 (AT: 8254.2).
		mov	di, cs:word_21702
		mov	cs:word_21F7B, di
		mov	ax, cs:word_21704
		mov	cs:word_21F76, ax
		mov	es, ax
		assume es:nothing
		in	al, 61h		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	ÍËÍ OR	03H=spkr ON
					; 1: Tmr 2 data	Í¼  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		or	al, 3
		out	61h, al		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	ÍËÍ OR	03H=spkr ON
					; 1: Tmr 2 data	Í¼  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		mov	dx, 12h
		mov	ax, 2D0Ch
		mov	bx, cs:word_21DC3
		div	bx
		xor	ah, ah
		call	sub_22F47
		mov	al, 1
		mov	cs:byte_216FD, al

loc_21E92::				; CODE XREF: sub_21DCB+1Ej
					; sub_21DCB+48j
		xor	ax, ax
		sti
		retn
sub_21DCB	endp


; =============== S U B	R O U T	I N E =======================================


sub_21E96	proc near		; DATA XREF: seg1c75:20A0o
		cli
		cmp	cs:byte_216FD, 0
		jz	loc_21EA2
		call	sub_21FD4

loc_21EA2::				; CODE XREF: sub_21E96+7j
		call	sub_22F0D
		mov	cx, 2Ch	; ','
		mov	si, di
		mov	ax, es
		mov	ds, ax
		assume ds:seg2608
		mov	di, offset aRiff ; "RIFF"
		mov	ax, cs
		mov	es, ax
		assume es:seg1c75
		cld
		rep movsb
		push	ds
		pop	es
		assume es:seg2608
		mov	di, si
		push	cs
		pop	ds
		assume ds:seg1c75
		mov	ax, cs:word_242B3
		add	ax, di
		mov	cs:word_21F63, ax
		mov	ax, cs:word_242A3
		xor	dx, dx
		mov	bx, cs:word_21DC3
		div	bx
		mov	cs:word_21F73, ax
		xor	ax, ax
		mov	bx, cs:word_21DC3
		div	bx
		mov	cs:word_21F6C, ax
		mov	cs:word_21702, di
		mov	ax, es
		mov	cs:word_21704, ax
		xor	ax, ax
		mov	es, ax
		assume es:nothing
		mov	di, 20h	; ' '
		mov	ax, es:[di]
		mov	cs:word_216FE, ax
		mov	ax, es:[di+2]
		mov	cs:word_21700, ax
		mov	ax, offset loc_21F48
		stosw
		mov	ax, cs
		stosw
		mov	al, 0B0h ; '°'
		out	43h, al		; Timer	8253-5 (AT: 8254.2).
		mov	di, cs:word_21702
		mov	cs:word_21F7B, di
		mov	ax, cs:word_21704
		mov	cs:word_21F76, ax
		mov	es, ax
		assume es:nothing
		in	al, 61h		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	ÍËÍ OR	03H=spkr ON
					; 1: Tmr 2 data	Í¼  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		or	al, 3
		out	61h, al		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	ÍËÍ OR	03H=spkr ON
					; 1: Tmr 2 data	Í¼  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		mov	dx, 12h
		mov	ax, 2D0Ch
		mov	bx, cs:word_21DC3
		div	bx
		xor	ah, ah
		call	sub_22F47
		mov	al, 1
		mov	cs:byte_216FD, al
		sti
		retn
sub_21E96	endp

; ---------------------------------------------------------------------------
		dw 0
; ---------------------------------------------------------------------------

loc_21F48::				; DATA XREF: sub_21DCB+8Ao
					; sub_21E96+71o
		push	ax
		push	ds
		push	cs
		pop	ds
		sub	cs:word_2157E, 40h ; '@'
		sbb	cs:word_21580, 0
		adc	cs:byte_21586, 0
; ---------------------------------------------------------------------------
		db 2Eh
		db  81h	; 
		db  3Eh	; >
		db  4Bh	; K
		db  36h	; 6
word_21F63	dw 5555h		; DATA XREF: sub_21DCB+30w
					; sub_21E96+2Ew
; ---------------------------------------------------------------------------
		jnb	loc_21F97
; ---------------------------------------------------------------------------
		db  2Eh	; .
		db  81h	; 
		db    6
		db  16h
		db  36h	; 6
word_21F6C	dw 5555h		; DATA XREF: sub_21DCB+62w
					; sub_21E96+4Cw
		db  2Eh	; .
		db  81h	; 
		db  16h
		db  4Bh	; K
		db  36h	; 6
word_21F73	dw 5555h		; DATA XREF: sub_21DCB+55w
					; sub_21E96+3Fw
		db 0B8h	; ¸
word_21F76	dw 5555h		; DATA XREF: sub_21DCB+A3w
					; sub_21E96+8Aw
		db  8Eh	; 
		db 0D8h	; Ø
		db 0A0h	;  
word_21F7B	dw 5555h		; DATA XREF: sub_21DCB+9Aw
					; sub_21E96+81w
; ---------------------------------------------------------------------------
		xor	ah, ah
		add	ax, offset unk_21CC3
		mov	cs:word_21F88, ax
; ---------------------------------------------------------------------------
		db  2Eh	; .
		db 0A0h	;  
word_21F88	dw 5555h		; DATA XREF: seg1c75:3652w
; ---------------------------------------------------------------------------
		out	42h, al		; Timer	8253-5 (AT: 8254.2).
		xor	al, al
		out	42h, al		; Timer	8253-5 (AT: 8254.2).
		mov	al, 20h	; ' '
		out	20h, al		; Interrupt controller,	8259A.
		pop	ds
		assume ds:seg2608
		pop	ax
		iret
; ---------------------------------------------------------------------------

loc_21F97::				; CODE XREF: seg1c75:3635j
		push	di
		mov	al, 34h	; '4'
		out	43h, al		; Timer	8253-5 (AT: 8254.2).
		mov	ax, cs:word_2157C
		call	sub_22F47
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
		mov	ax, cs:word_216F1
		out	42h, al		; Timer	8253-5 (AT: 8254.2).
		xchg	al, ah
		out	42h, al		; Timer	8253-5 (AT: 8254.2).
		xor	al, al
		mov	cs:byte_216FD, al
		push	es
		mov	di, 20h	; ' '
		xor	ax, ax
		mov	es, ax
		assume es:nothing
		mov	ax, cs:word_216FE
		stosw
		mov	ax, cs:word_21700
		stosw
		pop	es
		assume es:nothing
		mov	al, 20h	; ' '
		out	20h, al		; Interrupt controller,	8259A.
		pop	di
		pop	ds
		pop	ax
		iret

; =============== S U B	R O U T	I N E =======================================


sub_21FD4	proc near		; CODE XREF: sub_21DCB+9p sub_21E96+9p
					; DATA XREF: ...
		cli
		push	ax
		push	bx
		push	cx
		push	dx
		push	bp
		push	di
		push	si
		push	ds
		push	es
		push	cs
		pop	ds
		assume ds:seg1c75
		mov	al, 34h	; '4'
		out	43h, al		; Timer	8253-5 (AT: 8254.2).
		mov	ax, cs:word_2157C
		call	sub_22F47
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
		mov	ax, cs:word_216F1
		out	42h, al		; Timer	8253-5 (AT: 8254.2).
		xchg	al, ah
		out	42h, al		; Timer	8253-5 (AT: 8254.2).
		xor	al, al
		mov	cs:byte_216FD, al
		mov	di, 20h	; ' '
		xor	ax, ax
		mov	es, ax
		assume es:nothing
		mov	ax, cs:word_216FE
		stosw
		mov	ax, cs:word_21700
		stosw
		pop	es
		assume es:nothing
		pop	ds
		assume ds:seg2608
		pop	si
		pop	di
		pop	bp
		pop	dx
		pop	cx
		pop	bx
		pop	ax
		retn
sub_21FD4	endp

		assume es:nothing, ds:seg1c75

; =============== S U B	R O U T	I N E =======================================


sub_2201C	proc near		; CODE XREF: sub_23069+7Dp
					; DATA XREF: seg1c75:2060o
		cmp	cs:byte_21725, 1
		jb	loc_22037
		mov	dx, cs:word_21723
		add	dx, 4
		mov	al, 22h	; '"'
		out	dx, al
		inc	dx
		mov	al, bl
		out	dx, al
		xor	ax, ax
		clc
		retn
; ---------------------------------------------------------------------------

loc_22037::				; CODE XREF: sub_2201C+6j
		xor	ax, ax
		not	ax
		clc
		retn
sub_2201C	endp


; =============== S U B	R O U T	I N E =======================================


sub_2203D	proc near		; CODE XREF: sub_23069+82p
					; DATA XREF: seg1c75:2064o
		cmp	cs:byte_21725, 1
		jb	loc_22058
		mov	dx, cs:word_21723
		add	dx, 4
		mov	al, 26h	; '&'
		out	dx, al
		inc	dx
		mov	al, bl
		out	dx, al
		xor	ax, ax
		clc
		retn
; ---------------------------------------------------------------------------

loc_22058::				; CODE XREF: sub_2203D+6j
		xor	ax, ax
		not	ax
		clc
		retn
sub_2203D	endp


; =============== S U B	R O U T	I N E =======================================


sub_2205E	proc near		; CODE XREF: sub_23069+87p
					; DATA XREF: seg1c75:2062o
		cmp	cs:byte_21725, 1
		jb	loc_22079
		mov	dx, cs:word_21723
		add	dx, 4
		mov	al, 4
		out	dx, al
		inc	dx
		mov	al, bl
		out	dx, al
		xor	ax, ax
		clc
		retn
; ---------------------------------------------------------------------------

loc_22079::				; CODE XREF: sub_2205E+6j
		xor	ax, ax
		not	ax
		clc
		retn
sub_2205E	endp


; =============== S U B	R O U T	I N E =======================================


sub_2207F	proc near		; DATA XREF: seg1c75:203Eo
		push	bx
		push	cx
		push	si
		push	di
		push	ds
		push	es
		mov	ax, es:[di]
		cmp	ax, 'BS'
		jz	loc_22091
		stc
		jmp	loc_220AA
; ---------------------------------------------------------------------------
		db  90h	; 
; ---------------------------------------------------------------------------

loc_22091::				; CODE XREF: sub_2207F+Cj
		mov	si, offset byte_20E46
		push	ds
		push	es
		pop	ds
		assume ds:nothing
		pop	es
		assume es:nothing
		xchg	di, si
		mov	ax, 0Bh
		mul	bx
		add	di, ax
		add	si, 24h	; '$'
		mov	cx, 0Bh
		rep movsb
		clc

loc_220AA::				; CODE XREF: sub_2207F+Fj
		pop	es
		pop	ds
		assume ds:seg2608
		pop	di
		pop	si
		pop	cx
		pop	bx
		retn
sub_2207F	endp


; =============== S U B	R O U T	I N E =======================================


sub_220B1	proc near		; CODE XREF: _core_closeworx+13p
					; sub_218E1+Cp
		xor	ax, ax

loc_220B3::				; CODE XREF: sub_220B1+Aj
		call	sub_22194
		inc	ah
		cmp	ah, 0
		jnz	loc_220B3
		retn
sub_220B1	endp

		assume es:nothing, ds:seg1c75

; =============== S U B	R O U T	I N E =======================================


sub_220BE	proc near		; CODE XREF: sub_22448+156p
					; sub_226B0:loc_226C9p
		push	ax
		push	bx
		push	di
		push	dx
		push	si
		mov	si, offset byte_20E46
		push	bx
		mov	ax, 0Bh
		xor	bh, bh
		mul	bx
		add	si, ax
		pop	bx
		xchg	bl, bh
		xor	bh, bh
		mov	al, [si]
		mov	ah, 20h	; ' '
		add	ah, byte ptr cs:word_21499[bx]
		xchg	al, ah
		call	sub_22194
		inc	si
		mov	al, [si]
		mov	ah, 20h	; ' '
		add	ah, byte ptr cs:word_214A2[bx]
		xchg	al, ah
		call	sub_22194
		inc	si
		mov	al, [si]
		mov	ah, 40h	; '@'
		add	ah, byte ptr cs:word_21499[bx]
		xchg	al, ah
		call	sub_22194
		inc	si
		mov	al, [si]
		mov	ah, 40h	; '@'
		add	ah, byte ptr cs:word_214A2[bx]
		mov	byte ptr cs:word_21503[bx], al
		xchg	al, ah
		call	sub_22194
		inc	si
		mov	al, [si]
		mov	di, offset word_21499
		mov	ah, 60h	; '`'
		add	ah, [bx+di]
		xchg	al, ah
		call	sub_22194
		inc	si
		mov	al, [si]
		mov	di, offset word_214A2
		mov	ah, 60h	; '`'
		add	ah, [bx+di]
		xchg	al, ah
		call	sub_22194
		inc	si
		mov	al, [si]
		mov	di, offset word_21499
		mov	ah, 80h	; ''
		add	ah, [bx+di]
		xchg	al, ah
		call	sub_22194
		inc	si
		mov	al, [si]
		mov	di, offset word_214A2
		mov	ah, 80h	; ''
		add	ah, [bx+di]
		xchg	al, ah
		call	sub_22194
		inc	si
		mov	al, [si]
		mov	di, offset word_21499
		mov	ah, 0E0h ; 'à'
		add	ah, [bx+di]
		xchg	al, ah
		call	sub_22194
		inc	si
		mov	al, [si]
		mov	di, offset word_214A2
		mov	ah, 0E0h ; 'à'
		add	ah, [bx+di]
		xchg	al, ah
		call	sub_22194
		inc	si
		mov	ax, 0C0h ; 'À'
		add	ax, bx
		xchg	al, ah
		lodsb
		xchg	ah, al
		call	sub_22194
		pop	si
		pop	dx
		pop	di
		pop	bx
		pop	ax
		retn
sub_220BE	endp

; ---------------------------------------------------------------------------
dword_22183	dd 0			; DATA XREF: sub_22187+1w
					; sub_22194+25r ...

; =============== S U B	R O U T	I N E =======================================


sub_22187	proc near		; DATA XREF: seg1c75:20ACo
		cli
		mov	word ptr cs:dword_22183, bx
		mov	word ptr cs:dword_22183+2, dx
		sti
		retn
sub_22187	endp

		assume es:nothing

; =============== S U B	R O U T	I N E =======================================


sub_22194	proc near		; CODE XREF: _core_startworx:loc_217F2p
					; _core_startworx+4Fp ...
		push	ax
		push	bx
		push	cx
		push	dx
		mov	dx, 388h
		out	dx, al
		mov	cx, 6

loc_2219F::				; CODE XREF: sub_22194+Cj
		in	al, dx
		loop	loc_2219F
		inc	dx
		xchg	al, ah
		out	dx, al
		mov	cx, 23h	; '#'

loc_221A9::				; CODE XREF: sub_22194+17j
		in	al, dx
		in	al, dx
		loop	loc_221A9
		pop	dx
		pop	cx
		pop	bx
		pop	ax
		cmp	word ptr cs:dword_22183+2, 0
		jz	locret_221BE
		call	cs:dword_22183

locret_221BE::				; CODE XREF: sub_22194+23j
		retn
sub_22194	endp ; sp-analysis failed


; =============== S U B	R O U T	I N E =======================================


sub_221BF	proc near		; CODE XREF: sub_2222E+Ap sub_22754+2p
		test	cs:byte_216EF, 10h
		jz	loc_221E4
		mov	bl, 0

loc_221C9::				; CODE XREF: sub_221BF+20j
		mov	al, 0B0h ; '°'
		or	al, bl
		call	sub_241EB
		mov	al, 7Bh	; '{'
		call	sub_241EB
		mov	al, 0
		call	sub_241EB
		inc	bl
		cmp	bl, 10h
		jb	loc_221C9
		jmp	loc_221F2
; ---------------------------------------------------------------------------
		nop

loc_221E4::				; CODE XREF: sub_221BF+6j
		test	cs:byte_216EF, 2
		jz	loc_221F2
		in	al, 61h		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	ÍËÍ OR	03H=spkr ON
					; 1: Tmr 2 data	Í¼  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		and	al, 0FDh
		out	61h, al		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	ÍËÍ OR	03H=spkr ON
					; 1: Tmr 2 data	Í¼  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd

loc_221F2::				; CODE XREF: sub_221BF+22j
					; sub_221BF+2Bj
		push	bx
		xor	cx, cx
		mov	bh, ah

loc_221F7::				; CODE XREF: sub_221BF+65j
		mov	si, offset word_214C8
		push	cx
		shl	cx, 1
		add	si, cx
		pop	cx
		lodsw
		cmp	bh, ah
		jnz	loc_22220
		mov	al, 0A0h ; ' '
		add	al, cl
		xor	ah, ah
		call	sub_22194
		mov	al, 0B0h ; '°'
		add	al, cl
		xor	ah, ah
		call	sub_22194
		mov	si, offset byte_214FA
		add	si, cx
		mov	al, 0
		mov	[si], al

loc_22220::				; CODE XREF: sub_221BF+44j
		inc	cx
		cmp	cx, 9
		jb	loc_221F7
		pop	bx
		retn
sub_221BF	endp


; =============== S U B	R O U T	I N E =======================================


sub_22228	proc near		; DATA XREF: seg1c75:20BAo
		or	al, 0B0h
		call	sub_2233A
		retn
sub_22228	endp


; =============== S U B	R O U T	I N E =======================================


sub_2222E	proc near		; CODE XREF: sub_2233A+6Ep
		mov	ah, al
		and	ah, 0Fh
		cmp	bh, 7Bh	; '{'
		jnz	loc_2223E
		call	sub_221BF
		jmp	locret_22339
; ---------------------------------------------------------------------------

loc_2223E::				; CODE XREF: sub_2222E+8j
		cmp	bh, 7
		jnz	loc_22297
		xchg	ah, bl
		xor	bh, bh
		mov	cs:byte_214EA[bx], ah
		test	cs:byte_21480, 1
		jz	loc_22294
		cmp	cs:byte_216F7, 9
		jnz	loc_22294
		mov	si, offset unk_21466

loc_2225F::				; CODE XREF: sub_2222E+64j
		mov	ax, [si]
		cmp	ax, 0FFFFh
		jz	loc_22294
		add	si, 2
		mov	ah, 3Fh	; '?'
		sub	ah, al
		xor	al, al
		xchg	al, ah
		mov	bl, cs:byte_216F9
		xor	bh, bh
		xor	dx, dx
		mul	bx
		mov	al, ah
		xor	ah, ah
		shl	ax, 1
		mov	ah, 3Fh	; '?'
		sub	ah, al
		mov	[si], ah
		mov	ax, [si]
		xchg	ah, al
		call	sub_22194
		add	si, 2
		jmp	loc_2225F
; ---------------------------------------------------------------------------

loc_22294::				; CODE XREF: sub_2222E+24j
					; sub_2222E+2Cj ...
		jmp	locret_22339
; ---------------------------------------------------------------------------
		assume es:nothing

loc_22297::				; CODE XREF: sub_2222E+13j
		cmp	bh, 67h	; 'g'
		jnz	loc_22316
		cmp	bl, 0
		jz	loc_222A9
		cmp	bl, 1
		jz	loc_222D0
		jmp	locret_22339
; ---------------------------------------------------------------------------

loc_222A9::				; CODE XREF: sub_2222E+71j
		mov	cs:byte_216FC, 0C0h ; 'À'
		mov	cs:byte_21480, 0
		mov	ax, 0C0BDh
		call	sub_22194
		mov	si, offset word_214C8
		mov	word ptr [si+0Ch], 0FFFFh
		mov	word ptr [si+0Eh], 0FFFFh
		mov	word ptr [si+10h], 0FFFFh
		jmp	locret_22339
; ---------------------------------------------------------------------------
		nop

loc_222D0::				; CODE XREF: sub_2222E+76j
		mov	cs:byte_216FC, 0E0h ; 'à'
		mov	cs:byte_21480, 1
		mov	ax, 0E0BDh
		call	sub_22194
		mov	bx, (offset byte_1E93E+10F1h)
		mov	si, offset word_214C8
		mov	[si+0Ch], bx
		mov	[si+0Eh], bx
		mov	[si+10h], bx
		mov	si, offset unk_213EE

loc_222F4::				; CODE XREF: sub_2222E+D1j
		lodsw
		xchg	ah, al
		cmp	ax, 0FFFFh
		jz	loc_22301
		call	sub_22194
		jmp	loc_222F4
; ---------------------------------------------------------------------------

loc_22301::				; CODE XREF: sub_2222E+CCj
		mov	ax, 0E0BDh
		call	sub_22194
		mov	ax, 8
		call	sub_22194
		mov	cs:byte_216FC, 0E0h ; 'à'
		jmp	locret_22339
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------

loc_22316::				; CODE XREF: sub_2222E+6Cj
		cmp	bh, 69h	; 'i'
		jz	loc_22323
		cmp	bh, 68h	; 'h'
		jz	loc_22323
		jmp	locret_22339
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------

loc_22323::				; CODE XREF: sub_2222E+EBj
					; sub_2222E+F0j
		xor	bh, bh
		mov	si, offset byte_214B8
		mov	cl, bl
		mov	bl, cs:byte_216F7
		cmp	bh, 68h	; 'h'
		jnz	loc_22337
		or	cl, 80h

loc_22337::				; CODE XREF: sub_2222E+104j
		mov	[bx+si], cl
		assume es:nothing

locret_22339::				; CODE XREF: sub_2222E+Dj
					; sub_2222E:loc_22294j	...
		retn
sub_2222E	endp


; =============== S U B	R O U T	I N E =======================================


sub_2233A	proc near		; CODE XREF: sub_22228+2p sub_2269E+4p ...
		mov	ah, al
		and	ah, 0F0h
		and	al, 0Fh
		mov	cs:byte_216F7, al
		mov	cs:byte_216FB, ah
		mov	cs:byte_216F8, bh
		mov	cs:byte_216F9, bl
		test	cs:byte_216EF, 6
		jnz	loc_22398
		push	cs
		pop	ds
		push	ax
		push	cx
		push	si
		mov	al, ah
		xor	ah, ah
		mov	cl, 4
		shr	ax, cl
		mov	si, ax
		mov	cl, cs:byte_216D7[si]
		xor	ch, ch
		jcxz	loc_22394
		mov	al, cs:byte_216FB
		or	al, cs:byte_216F7
		call	sub_241EB
		jcxz	loc_22394
		dec	cx
		mov	al, cs:byte_216F8
		call	sub_241EB
		jcxz	loc_22394
		dec	cx
		mov	al, cs:byte_216F9
		call	sub_241EB

loc_22394::				; CODE XREF: sub_2233A+38j
					; sub_2233A+46j ...
		pop	si
		pop	cx
		pop	ax
		retn
; ---------------------------------------------------------------------------

loc_22398::				; CODE XREF: sub_2233A+20j
		cmp	cs:byte_216FB, 90h ; ''
		jbe	loc_223BC
		cmp	cs:byte_216FB, 0B0h ; '°'
		ja	loc_223AE
		call	sub_2222E
		jmp	loc_223EF
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------
		assume es:nothing

loc_223AE::				; CODE XREF: sub_2233A+6Cj
		cmp	cs:byte_216FB, 0C0h ; 'À'
		ja	loc_223EF
		call	loc_22711
		jmp	loc_223EF
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------

loc_223BC::				; CODE XREF: sub_2233A+64j
		test	cs:byte_216FC, 20h
		jz	loc_223DF
		cmp	cs:byte_21480, 1
		jnz	loc_223D7
		cmp	cs:byte_216F7, 9
		jz	loc_223EC
		jmp	loc_223DF
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------

loc_223D7::				; CODE XREF: sub_2233A+90j
		cmp	cs:byte_216F7, 0Bh
		jnb	loc_223EC

loc_223DF::				; CODE XREF: sub_2233A+88j
					; sub_2233A+9Aj
		mov	al, cs:byte_216F8
		add	al, cs:byte_216D6
		mov	cs:byte_216F8, al

loc_223EC::				; CODE XREF: sub_2233A+98j
					; sub_2233A+A3j
		call	sub_22448
		assume es:nothing

loc_223EF::				; CODE XREF: sub_2233A+71j
					; sub_2233A+7Aj ...
		clc
		retn
sub_2233A	endp

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_22448

loc_223F1::				; CODE XREF: sub_22448+6j
		push	ax
		push	bx
		push	si
		mov	al, cs:byte_216F0
		cmp	cs:byte_216F7, al
		jnz	loc_22443
		cmp	cs:byte_216FB, 90h ; ''
		jnz	loc_22443
		cmp	cs:byte_216F9, 0
		jz	loc_22443
		cmp	cs:byte_216F8, 9
		jb	loc_22443
		in	al, 61h		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	ÍËÍ OR	03H=spkr ON
					; 1: Tmr 2 data	Í¼  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		test	al, 2
		jz	loc_22421
		and	al, 0FDh
		out	61h, al		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	ÍËÍ OR	03H=spkr ON
					; 1: Tmr 2 data	Í¼  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd

loc_22421::				; CODE XREF: sub_22448-2Dj
		xor	bx, bx
		mov	bl, cs:byte_216F8
		shl	bx, 1
		mov	si, offset unk_20D46
		mov	al, 0B6h ; '¶'
		out	43h, al		; Timer	8253-5 (AT: 8254.2).
		mov	ax, [bx+si]
		mov	cs:word_216F1, ax
		out	42h, al		; Timer	8253-5 (AT: 8254.2).
		xchg	al, ah
		out	42h, al		; Timer	8253-5 (AT: 8254.2).
		in	al, 61h		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	ÍËÍ OR	03H=spkr ON
					; 1: Tmr 2 data	Í¼  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd
		or	al, 3
		out	61h, al		; PC/XT	PPI port B bits:
					; 0: Tmr 2 gate	ÍËÍ OR	03H=spkr ON
					; 1: Tmr 2 data	Í¼  AND	0fcH=spkr OFF
					; 3: 1=read high switches
					; 4: 0=enable RAM parity checking
					; 5: 0=enable I/O channel check
					; 6: 0=hold keyboard clock low
					; 7: 0=enable kbrd

loc_22443::				; CODE XREF: sub_22448-4Bj
					; sub_22448-43j ...
		clc
		pop	si
		pop	bx
		pop	ax
		retn
; END OF FUNCTION CHUNK	FOR sub_22448
		assume es:nothing

; =============== S U B	R O U T	I N E =======================================


sub_22448	proc near		; CODE XREF: sub_2233A:loc_223ECp

; FUNCTION CHUNK AT 3AC1 SIZE 00000057 BYTES

		test	cs:byte_216EF, 2
		jnz	loc_223F1
		mov	cs:word_216F5, 9
		test	cs:byte_216FC, 20h
		jz	loc_224BD
		mov	cs:word_216F5, 6
		cmp	cs:byte_21480, 1
		jnz	loc_22476
		cmp	cs:byte_216F7, 9
		jz	loc_2249C

loc_22476::				; CODE XREF: sub_22448+24j
		cmp	cs:byte_216F7, 0Bh
		jb	loc_224BD
		mov	ah, 10h
		mov	cl, cs:byte_216F7
		sub	cl, 0Bh
		shr	ah, cl
		xor	cs:byte_216FC, ah
		mov	ah, cs:byte_216FC
		mov	al, 0BDh ; '½'
		call	sub_22194
		jmp	locret_225A5
; ---------------------------------------------------------------------------

loc_2249C::				; CODE XREF: sub_22448+2Cj
		mov	bl, cs:byte_216F8
		sub	bl, 23h	; '#'
		xor	bh, bh
		mov	ah, cs:byte_213C6[bx]
		xor	cs:byte_216FC, ah
		mov	ah, cs:byte_216FC
		mov	al, 0BDh ; '½'
		call	sub_22194
		jmp	locret_225A5
; ---------------------------------------------------------------------------

loc_224BD::				; CODE XREF: sub_22448+15j
					; sub_22448+34j
		cmp	cs:byte_216FB, 80h ; ''
		ja	loc_22501

loc_224C5::				; CODE XREF: sub_22448+BFj
		mov	cx, cs:word_216F5
		xor	bx, bx
		mov	si, offset word_214C8

loc_224CF::				; CODE XREF: sub_22448+95j
		shl	bx, 1
		mov	ax, [bx+si]
		shr	bx, 1
		cmp	ah, cs:byte_216F7
		jz	loc_224E2

loc_224DC::				; CODE XREF: sub_22448+A9j
		inc	bx
		loop	loc_224CF
		jmp	locret_225A5
; ---------------------------------------------------------------------------

loc_224E2::				; CODE XREF: sub_22448+92j
		mov	si, offset byte_214FA
		mov	al, [bx+si]
		cmp	al, cs:byte_216F8
		jz	loc_224F3
		assume es:nothing
		mov	si, offset word_214C8
		jmp	loc_224DC
; ---------------------------------------------------------------------------
		assume es:nothing

loc_224F3::				; CODE XREF: sub_22448+A4j
		mov	cs:byte_216FA, bl
		call	sub_225A6
		mov	byte ptr [bx+si], 0
		jmp	locret_225A5
; ---------------------------------------------------------------------------

loc_22501::				; CODE XREF: sub_22448+7Bj
					; sub_22448+107j
		cmp	cs:byte_216F9, 0
		jz	loc_224C5
		xor	cx, cx
		mov	si, offset word_214C8

loc_2250E::				; CODE XREF: sub_22448+D4j
					; sub_22448+11Bj
		lodsw
		cmp	ah, cs:byte_216F7
		jz	loc_22551
		inc	cx
		cmp	cx, cs:word_216F5
		jnz	loc_2250E

loc_2251E::				; CODE XREF: sub_22448+11Dj
		xor	cx, cx
		mov	si, offset word_214C8

loc_22523::				; CODE XREF: sub_22448+E7j
		lodsw
		cmp	ah, 0FFh
		jz	loc_22551
		inc	cx
		cmp	cx, cs:word_216F5
		jnz	loc_22523
		assume es:nothing
		xor	bx, bx

loc_22533::				; CODE XREF: sub_22448+F9j
		mov	si, offset byte_214FA
		cmp	byte ptr [bx+si], 0
		jz	loc_22546
		inc	bx
		cmp	bx, cs:word_216F5
		jb	loc_22533
		jmp	locret_225A5
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------

loc_22546::				; CODE XREF: sub_22448+F1j
		mov	si, offset word_214C8
		shl	bx, 1
		mov	word ptr [bx+si], 0FFFFh
		jmp	loc_22501
; ---------------------------------------------------------------------------
		assume es:nothing

loc_22551::				; CODE XREF: sub_22448+CCj
					; sub_22448+DFj
		push	si
		mov	si, offset byte_214FA
		add	si, cx
		cmp	byte ptr [si], 0
		pop	si
		jz	loc_22567
		assume es:nothing
		inc	cx
		cmp	cx, cs:word_216F5
		jnz	loc_2250E
		jmp	loc_2251E
; ---------------------------------------------------------------------------
		assume es:nothing

loc_22567::				; CODE XREF: sub_22448+113j
		xor	ch, ch
		mov	dx, bx
		mov	cs:byte_216FA, cl
		mov	bl, cs:byte_216F7
		mov	ah, bl
		xor	bh, bh
		mov	si, offset byte_214DA
		mov	ch, [bx+si]
		cmp	ch, al
		jz	loc_225A1
		mov	si, offset word_214C8
		mov	bl, cs:byte_216FA
		xor	bh, bh
		shl	bl, 1
		mov	al, ch
		mov	ah, cs:byte_216F7
		mov	[bx+si], ax
		mov	bh, cs:byte_216FA
		mov	bl, al
		call	sub_220BE

loc_225A1::				; CODE XREF: sub_22448+138j
		call	sub_225A6
		retn
; ---------------------------------------------------------------------------

locret_225A5::				; CODE XREF: sub_22448+51j
					; sub_22448+72j ...
		retn
sub_22448	endp


; =============== S U B	R O U T	I N E =======================================


sub_225A6	proc near		; CODE XREF: sub_22448+B0p
					; sub_22448:loc_225A1p
		push	bx
		push	dx
		push	si
		mov	dh, cs:byte_216F8
		mov	bl, cs:byte_216FA
		xor	bh, bh
		mov	cs:byte_214FA[bx], dh
		mov	bh, dh
		dec	bh
		mov	al, bh
		xor	ah, ah
		mov	bx, 0Ch
		xor	dx, dx
		div	bx
		mov	bx, ax
		mov	cl, dl
		mov	si, offset unk_21481
		shl	dx, 1
		add	si, dx
		mov	dx, [si]
		push	bx
		xor	bh, bh
		mov	bl, cs:byte_216F7
		mov	al, cs:byte_214B8[bx]
		cmp	al, 0
		jz	loc_2260F
		mov	ch, al
		mov	si, offset unk_214AB
		mov	bl, cl
		cmp	al, 80h	; ''
		jb	loc_225F3
		inc	si

loc_225F3::				; CODE XREF: sub_225A6+4Aj
		mov	bl, [bx+si]
		mul	bl
		shl	ax, 1
		xchg	ah, al
		xor	ah, ah
		cmp	ch, 80h	; ''
		jnz	loc_22609
		add	ax, dx
		mov	dx, ax
		jmp	loc_2260F
; ---------------------------------------------------------------------------
		db 90h
; ---------------------------------------------------------------------------

loc_22609::				; CODE XREF: sub_225A6+5Aj
		neg	ax
		add	ax, dx
		mov	dx, ax

loc_2260F::				; CODE XREF: sub_225A6+3Fj
					; sub_225A6+60j
		pop	bx
		mov	al, 0A0h ; ' '
		add	al, cs:byte_216FA
		mov	ah, dl
		call	sub_22194
		mov	al, 0B0h ; '°'
		add	al, cs:byte_216FA
		and	dh, 3
		shl	bx, 1
		shl	bx, 1
		cmp	cs:byte_216FB, 80h ; ''
		jz	loc_2264D
		cmp	cs:byte_216F9, 0
		jz	loc_2264D
		test	cs:byte_21480, 1
		jz	loc_2264A
		cmp	cs:byte_216F7, 9
		jnb	loc_2264D

loc_2264A::				; CODE XREF: sub_225A6+9Aj
		or	bl, 20h

loc_2264D::				; CODE XREF: sub_225A6+8Aj
					; sub_225A6+92j ...
		or	bl, dh
		mov	ah, bl
		call	sub_22194
		mov	bl, cs:byte_216FA
		xor	bh, bh
		push	cx
		mov	ah, byte ptr cs:word_21503[bx]
		and	ah, 3Fh
		mov	al, 3Fh	; '?'
		sub	al, ah
		xor	ah, ah
		mov	bl, cs:byte_216F7
		xor	bh, bh
		mov	cl, cs:byte_214EA[bx]
		xor	ch, ch
		xor	ah, ah
		xor	dx, dx
		mul	cx
		pop	cx
		mov	al, ah
		xor	ah, ah
		shl	ax, 1
		mov	ah, 3Fh	; '?'
		sub	ah, al
		mov	bl, cs:byte_216FA
		xor	bh, bh
		mov	al, 40h	; '@'
		add	al, byte ptr cs:word_214A2[bx]
		call	sub_22194
		pop	si
		pop	dx
		pop	bx
		retn
sub_225A6	endp


; =============== S U B	R O U T	I N E =======================================


sub_2269E	proc near		; DATA XREF: seg1c75:2040o
		and	al, 0Fh
		or	al, 90h
		call	sub_2233A
		retn
sub_2269E	endp


; =============== S U B	R O U T	I N E =======================================


sub_226A6	proc near		; DATA XREF: seg1c75:2042o
		and	al, 0Fh
		or	al, 80h
		xor	bl, bl
		call	sub_2233A
		retn
sub_226A6	endp


; =============== S U B	R O U T	I N E =======================================


sub_226B0	proc near		; CODE XREF: sub_22B42+Bp
					; sub_22C66+16p
		push	ax
		push	di
		push	es
		mov	ax, 0
		call	sub_22194
		mov	cs:byte_216FC, 0C0h ; 'À'
		mov	ax, 0C0BDh
		call	sub_22194
		mov	bh, 0
		mov	bl, 0

loc_226C9::				; CODE XREF: sub_226B0+21j
		call	sub_220BE
		inc	bh
		cmp	bh, 9
		jb	loc_226C9
		mov	di, offset byte_214DA
		mov	ax, ds
		mov	es, ax
		assume es:seg1c75
		mov	al, 0
		mov	cx, 10h
		rep stosb
		mov	di, offset byte_214B8
		mov	ax, ds
		mov	es, ax
		mov	al, 0
		mov	cx, 10h
		rep stosb
		mov	di, offset byte_214FA
		xor	al, al
		mov	cx, 9
		rep stosb
		mov	di, offset word_214C8
		mov	ax, 0FFFFh
		mov	cx, 9
		rep stosw
		pop	es
		assume es:nothing
		pop	di
		pop	ax
		retn
sub_226B0	endp


; =============== S U B	R O U T	I N E =======================================


sub_22708	proc near		; DATA XREF: seg1c75:2044o
		mov	cs:byte_216F7, al
		mov	cs:byte_216F8, bl

loc_22711::				; CODE XREF: sub_2233A+7Cp
		push	ax
		push	bx
		push	si
		test	cs:byte_216FC, 20h
		jz	loc_22724
		cmp	cs:byte_216F7, 0B0h ; '°'
		jnb	loc_22734

loc_22724::				; CODE XREF: sub_22708+12j
		mov	si, offset byte_214DA
		mov	bl, cs:byte_216F7
		xor	bh, bh
		mov	al, cs:byte_216F8
		mov	[bx+si], al

loc_22734::				; CODE XREF: sub_22708+1Aj
		pop	si
		pop	bx
		pop	ax
		retn
sub_22708	endp


; =============== S U B	R O U T	I N E =======================================


sub_22738	proc near		; DATA XREF: seg1c75:205Ao
		push	ax
		mov	ax, cs
		mov	ds, ax
		mov	cs:byte_21594, bl
		pop	ax
		retn
sub_22738	endp


; =============== S U B	R O U T	I N E =======================================


sub_22744	proc near		; CODE XREF: _core_closeworx+16p
					; sub_218E1+Fp
					; DATA XREF: ...
		cli
		mov	ax, 0FFFFh
		call	sub_22F47
		mov	cs:word_2094E, 1
		sti
		retn
sub_22744	endp

		assume es:nothing

; =============== S U B	R O U T	I N E =======================================


sub_22754	proc near		; CODE XREF: _core_closeworx+10p
					; sub_218E1+9p
					; DATA XREF: ...
		push	ax
		push	cx
		call	sub_221BF
		mov	cs:byte_21695, 0
		mov	al, cs:byte_216FC
		and	al, 0E0h
		cmp	al, 0E0h ; 'à'
		jz	loc_22787
		mov	cx, 9
		mov	ax, 0A0h ; ' '

loc_2276F::				; CODE XREF: sub_22754+20j
		call	sub_22194
		inc	al
		loop	loc_2276F
		mov	cx, 9
		mov	ax, 0B0h ; '°'

loc_2277C::				; CODE XREF: sub_22754+2Dj
		call	sub_22194
		inc	al
		loop	loc_2277C
		clc
		pop	cx
		pop	ax
		retn
; ---------------------------------------------------------------------------

loc_22787::				; CODE XREF: sub_22754+13j
		mov	ax, 0C0BDh
		call	sub_22194
		mov	ax, 8
		call	sub_22194
		mov	cx, 6
		mov	ax, 0A0h ; ' '

loc_22799::				; CODE XREF: sub_22754+4Aj
		call	sub_22194
		inc	al
		loop	loc_22799
		mov	cx, 6
		mov	ax, 0B0h ; '°'

loc_227A6::				; CODE XREF: sub_22754+57j
		call	sub_22194
		inc	al
		loop	loc_227A6
		pop	cx
		pop	ax
		clc
		retn
sub_22754	endp

; ---------------------------------------------------------------------------
word_227B1	dw 0FFFFh		; DATA XREF: sub_219F3w sub_219F3+34w	...
byte_227B3	db 0			; DATA XREF: sub_227B4w
					; sub_229C4:loc_22A0Dr

; =============== S U B	R O U T	I N E =======================================


sub_227B4	proc near		; DATA XREF: seg1c75:209Co
		mov	cs:byte_227B3, bl
		retn
sub_227B4	endp

; ---------------------------------------------------------------------------
word_227BA	dw 0			; DATA XREF: sub_229C4+1w
					; sub_229C4+5Er
word_227BC	dw 0			; DATA XREF: sub_229C4+6w
					; sub_229C4+63r
word_227BE	dw 0			; DATA XREF: _core_startworx+36w
					; sub_229C4+Br
word_227C0	dw 0			; DATA XREF: _core_startworx+3Cw
					; sub_229C4+10r
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
word_229C2	dw 0			; DATA XREF: seg1c75:414Fw
		assume es:nothing, ds:seg2608

; =============== S U B	R O U T	I N E =======================================


sub_229C4	proc near		; CODE XREF: seg1c75:loc_22A87p
		cli
		mov	cs:word_227BA, sp
		mov	cs:word_227BC, ss
		mov	sp, cs:word_227BE
		mov	ss, cs:word_227C0
		sti
		push	ax
		push	bx
		push	cx
		push	dx
		push	bp
		push	di
		push	si
		push	ds
		push	es
		push	cs
		pop	ds
		assume ds:seg1c75
		mov	ax, cs:word_2157C
		sub	cs:word_2157E, ax
		sbb	cs:word_21580, 0
		cmp	cs:word_21580, 0
		jge	loc_22A02
		mov	cs:byte_21586, 1

loc_22A02::				; CODE XREF: sub_229C4+36j
		test	cs:byte_216EF, 20h
		jz	loc_22A0D
		call	sub_23E32

loc_22A0D::				; CODE XREF: sub_229C4+44j
		cmp	cs:byte_227B3, 0
		jz	loc_22A18
		assume es:nothing
		call	sub_2469C
		assume es:nothing

loc_22A18::				; CODE XREF: sub_229C4+4Fj
		pop	es
		pop	ds
		assume ds:seg2608
		pop	si
		pop	di
		pop	bp
		pop	dx
		pop	cx
		pop	bx
		pop	ax
		cli
		mov	sp, cs:word_227BA
		mov	ss, cs:word_227BC
		retn
sub_229C4	endp

; ---------------------------------------------------------------------------
		assume es:nothing

loc_22A2D::				; DATA XREF: _core_startworx+68o
		cld
		cli
		test	cs:byte_216EF, 16h
		jz	loc_22A4C
		push	ax
		push	bx
		push	cx
		push	dx
		push	bp
		push	di
		push	si
		push	ds
		push	es
		call	sub_22D53
		assume ds:seg1c75
		pop	es
		pop	ds
		assume ds:seg2608
		pop	si
		pop	di
		pop	bp
		pop	dx
		pop	cx
		pop	bx
		pop	ax

loc_22A4C::				; CODE XREF: seg1c75:4105j
		inc	cs:word_216E7
		push	ax
		mov	ax, cs:word_216E7
		cmp	ax, cs:word_216E9
		pop	ax
		jb	loc_22A6C
		mov	cs:word_216E7, 0
		pushf
		call	dword ptr cs:off_1E93A
		iret
; ---------------------------------------------------------------------------
		assume es:nothing

loc_22A6C::				; CODE XREF: seg1c75:412Cj
		inc	cs:word_227B1
		push	ax
		mov	al, 20h	; ' '
		out	20h, al		; Interrupt controller,	8259A.
		pop	ax
		cmp	cs:word_227B1, 0
		jz	loc_22A87
		assume es:nothing, ds:seg1c75
		inc	cs:word_229C2
		jmp	loc_22A8A
; ---------------------------------------------------------------------------
		db  90h	; 
; ---------------------------------------------------------------------------
		assume es:nothing, ds:seg2608

loc_22A87::				; CODE XREF: seg1c75:414Dj
		call	sub_229C4

loc_22A8A::				; CODE XREF: seg1c75:4154j
		dec	cs:word_227B1
		iret

; =============== S U B	R O U T	I N E =======================================


sub_22A90	proc near		; DATA XREF: seg1c75:2074o
		mov	ax, cs:word_20942
		mov	bx, 40h	; '@'
		mul	bx
		xor	dx, dx
		mov	bx, cs:word_2094A
		cmp	bx, 0
		stc
		jz	locret_22AA9
		div	bx
		clc

locret_22AA9::				; CODE XREF: sub_22A90+14j
		retn
sub_22A90	endp


; =============== S U B	R O U T	I N E =======================================


sub_22AAA	proc near		; DATA XREF: seg1c75:2076o
		mov	ax, cs:word_20944
		mov	bx, 40h	; '@'
		mul	bx
		xor	dx, dx
		mov	bx, cs:word_2094C
		cmp	bx, 0
		stc
		jz	locret_22AC3
		div	bx
		clc

locret_22AC3::				; CODE XREF: sub_22AAA+14j
		retn
sub_22AAA	endp


; =============== S U B	R O U T	I N E =======================================


sub_22AC4	proc near		; DATA XREF: seg1c75:2078o
		push	si
		mov	si, offset unk_20946
		xor	ah, ah
		add	si, ax
		mov	al, [si]
		xor	ah, ah
		pop	si
		clc
		retn
sub_22AC4	endp


; =============== S U B	R O U T	I N E =======================================


sub_22AD3	proc near		; DATA XREF: seg1c75:2072o
		cli
		push	ax
		push	dx
		mov	dx, 201h
		mov	cs:word_20942, 0
		mov	cs:word_20944, 0
		in	al, dx		; Game I/O port
					; bits 0-3: Coordinates	(resistive, time-dependent inputs)
					; bits 4-7: Buttons/Triggers (digital inputs)
		mov	si, offset unk_20946
		add	si, 3
		mov	cx, 4

loc_22AF1::				; CODE XREF: sub_22AD3+29j
		xor	ah, ah
		shl	al, 1
		jb	loc_22AF9
		mov	ah, 1

loc_22AF9::				; CODE XREF: sub_22AD3+22j
		mov	[si], ah
		dec	si
		loop	loc_22AF1
		mov	cx, 28h	; '('

loc_22B01::				; CODE XREF: sub_22AD3+2Fj
		out	dx, al		; Game I/O port
					; bits 0-3: Coordinates	(resistive, time-dependent inputs)
					; bits 4-7: Buttons/Triggers (digital inputs)
		loop	loc_22B01
		mov	cx, 320h

loc_22B07::				; CODE XREF: sub_22AD3+52j
		mov	dx, 201h
		in	al, dx		; Game I/O port
					; bits 0-3: Coordinates	(resistive, time-dependent inputs)
					; bits 4-7: Buttons/Triggers (digital inputs)
		mov	bl, al
		and	bl, 1
		xor	bh, bh
		add	cs:word_20942, bx
		mov	bl, al
		shr	bl, 1
		and	bl, 1
		xor	bh, bh
		add	cs:word_20944, bx
		loop	loc_22B07
		cmp	cs:word_2094A, 0
		jnz	loc_22B3F
		mov	ax, cs:word_20942
		mov	cs:word_2094A, ax
		mov	ax, cs:word_20944
		mov	cs:word_2094C, ax

loc_22B3F::				; CODE XREF: sub_22AD3+5Aj
		pop	dx
		pop	ax
		retn
sub_22AD3	endp


; =============== S U B	R O U T	I N E =======================================


sub_22B42	proc near		; CODE XREF: sub_22D90+115p
					; DATA XREF: seg1c75:2038o
		push	si
		push	di
		push	ds
		call	sub_22F0D
		push	es
		mov	ax, cs
		mov	ds, ax
		assume ds:seg1c75
		call	sub_226B0
		mov	cs:byte_21695, 0
		cmp	cs:byte_21480, 1
		jnz	loc_22B67
		mov	cs:byte_216FC, 0E0h ; 'à'
		jmp	loc_22B6D
; ---------------------------------------------------------------------------
		db  90h	; 
; ---------------------------------------------------------------------------

loc_22B67::				; CODE XREF: sub_22B42+1Aj
		mov	cs:byte_216FC, 0C0h ; 'À'

loc_22B6D::				; CODE XREF: sub_22B42+22j
		mov	cs:word_21590, di
		mov	si, di
		mov	ax, es
		mov	ds, ax
		assume ds:nothing
		lodsw
		cmp	ax, 'TM'
		jnz	loc_22BDC
		lodsw
		cmp	ax, 'dh'
		jnz	loc_22BDC
		mov	ax, cs
		mov	ds, ax
		assume ds:seg1c75
		mov	es, ax
		assume es:seg1c75
		mov	di, offset word_21595
		mov	cx, 20h	; ' '
		xor	ax, ax
		rep stosw
		pop	es
		assume es:nothing
		mov	cs:word_21592, es
		mov	di, si
		mov	ax, es:[di]
		add	di, 2
		mov	ax, es:[di]
		add	di, 2
		mov	ax, es:[di]
		add	di, 2
		cmp	ah, 1
		ja	loc_22BDC
		mov	ax, es:[di]
		add	di, 2
		xchg	al, ah
		mov	cs:word_2158B, ax
		mov	ax, es:[di]
		add	di, 2
		xchg	al, ah
		mov	cs:word_2158D, ax
		mov	cx, cs:word_2158B
		mov	cs:word_216F3, 0
		jcxz	loc_22BE3
		jmp	loc_22C02
; ---------------------------------------------------------------------------
		db  90h	; 
; ---------------------------------------------------------------------------

loc_22BDC::				; CODE XREF: sub_22B42+3Aj
					; sub_22B42+40j ...
		stc
		mov	ax, bx
		pop	ds
		assume ds:seg2608
		pop	di
		pop	si
		retn
; ---------------------------------------------------------------------------

loc_22BE3::				; CODE XREF: sub_22B42+95j
					; sub_22B42:loc_22C02j
		mov	cs:byte_2158F, 0
		mov	cs:byte_21695, 1
		mov	cs:word_21587, 0
		mov	cs:word_21589, 0
		clc
		pop	ds
		pop	di
		pop	si
		retn
; ---------------------------------------------------------------------------

loc_22C02::				; CODE XREF: sub_22B42+97j
					; sub_22B42+11Bj
		jcxz	loc_22BE3
		mov	ax, es:[di]
		add	di, 2
		cmp	ax, 'TM'
		jnz	loc_22BDC
		mov	ax, es:[di]
		add	di, 2
		cmp	ax, 'kr'
		jnz	loc_22BDC
		mov	ax, es:[di]
		add	di, 2
		mov	ax, es:[di]
		add	di, 2
		xchg	ah, al
		mov	bx, ax
		push	bx
		push	di
		call	sub_22ED6
		mov	si, offset word_215D5
		mov	bx, cs:word_216F3
		shl	bx, 1
		shl	bx, 1
		mov	[bx+si], ax
		mov	[bx+si+2], dx
		mov	si, offset word_21655
		mov	bx, cs:word_216F3
		shl	bx, 1
		mov	[bx+si], di
		mov	si, offset word_21595
		mov	word ptr [bx+si], 1
		pop	di
		pop	bx
		add	di, bx
		inc	cs:word_216F3
		dec	cx
		jmp	loc_22C02
sub_22B42	endp ; sp-analysis failed

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_22C66

loc_22C5F::				; CODE XREF: sub_22C66+27j
					; sub_22C66+2Dj
		stc
		mov	ax, bx
		pop	ds
		pop	di
		pop	si
		retn
; END OF FUNCTION CHUNK	FOR sub_22C66
		assume es:nothing, ds:seg1c75

; =============== S U B	R O U T	I N E =======================================


sub_22C66	proc near		; CODE XREF: sub_22D90:loc_22EABp
					; DATA XREF: seg1c75:205Co

; FUNCTION CHUNK AT 432F SIZE 00000007 BYTES

		push	si
		push	di
		push	ds
		call	sub_22F0D
		push	es
		push	cs
		pop	ds
		mov	ax, es
		mov	cs:word_21592, ax
		mov	cs:word_21590, di
		mov	dx, di
		call	sub_226B0
		mov	cs:byte_21695, al
		mov	si, di
		mov	ax, es
		mov	ds, ax
		assume ds:nothing
		lodsw
		cmp	ax, 'TC'
		jnz	loc_22C5F
		lodsw
		cmp	ax, 'FM'
		jnz	loc_22C5F
		mov	ax, cs
		mov	ds, ax
		assume ds:seg1c75
		mov	es, ax
		assume es:seg1c75
		mov	di, offset word_21595
		mov	cx, 20h	; ' '
		xor	ax, ax
		rep stosw
		pop	es
		assume es:nothing
		mov	di, si
		add	di, 2
		mov	ax, es:[di]
		push	ax
		add	di, 2
		mov	bx, es:[di]
		add	di, 2
		mov	ax, es:[di]
		mov	cs:word_2158D, ax
		add	di, 2
		push	bx
		push	dx
		mov	bx, es:[di]
		mov	dx, 12h
		mov	ax, 34DCh
		div	bx
		call	sub_22F47
		mov	cs:word_2157C, ax
		pop	dx
		pop	bx
		add	di, 2
		add	di, 2
		add	di, 2
		add	di, 2
		add	di, 10h
		mov	cx, es:[di]
		add	di, 2
		mov	di, dx
		pop	ax
		add	di, ax
		mov	si, di
		mov	di, offset byte_20E46
		push	ds
		push	es
		pop	ds
		assume ds:nothing
		pop	es
		assume es:seg1c75

loc_22CFB::				; CODE XREF: sub_22C66+A1j
		jcxz	loc_22D09
		push	cx
		mov	cx, 0Bh
		rep movsb
		add	si, 5
		pop	cx
		loop	loc_22CFB

loc_22D09::				; CODE XREF: sub_22C66:loc_22CFBj
		mov	di, dx
		add	di, bx
		push	es
		push	ds
		pop	es
		assume es:nothing
		pop	ds
		assume ds:seg1c75
		call	sub_22ED6
		mov	si, offset word_215D5
		mov	[si], ax
		mov	[si+2],	dx
		mov	ax, 1
		mov	cs:word_2158B, ax
		mov	cs:word_21595, ax
		mov	cs:byte_21695, al
		mov	cs:word_21655, di
		jmp	loc_22D33
; ---------------------------------------------------------------------------
		db  90h	; 
; ---------------------------------------------------------------------------

loc_22D33::				; CODE XREF: sub_22C66+CAj
		mov	bl, 1
		mov	cs:byte_2158F, bl
		mov	cs:word_21587, 0
		mov	cs:word_21589, 0
		clc
		pop	ds
		pop	di
		pop	si
		retn
sub_22C66	endp ; sp-analysis failed


; =============== S U B	R O U T	I N E =======================================


sub_22D4D	proc near		; DATA XREF: seg1c75:2080o
		mov	ax, cs:word_2157C
		clc
		retn
sub_22D4D	endp

		assume es:nothing, ds:seg2608

; =============== S U B	R O U T	I N E =======================================


sub_22D53	proc near		; CODE XREF: seg1c75:4110p
					; DATA XREF: seg1c75:207Eo
		push	cs
		pop	ds
		assume ds:seg1c75
		cmp	cs:byte_21695, 0
		jnz	loc_22D5E
		retn
; ---------------------------------------------------------------------------
		assume es:nothing

loc_22D5E::				; CODE XREF: sub_22D53+8j
		inc	cs:word_21587
		mov	ax, cs:word_21587
		cmp	ax, cs:word_2158D
		jb	loc_22D7A
		assume es:seg2608
		mov	cs:word_21587, 0
		inc	cs:word_21589
		assume es:nothing

loc_22D7A::				; CODE XREF: sub_22D53+19j
		mov	cs:word_216F3, 0
		mov	cx, cs:word_2158B

loc_22D86::				; CODE XREF: sub_22D53+3Bj
		call	sub_22D90
		assume es:nothing
		inc	cs:word_216F3
		loop	loc_22D86
sub_22D53	endp

		assume es:nothing

; =============== S U B	R O U T	I N E =======================================


sub_22D90	proc near		; CODE XREF: sub_22D53:loc_22D86p
		push	cx

loc_22D91::				; CODE XREF: sub_22D90+90j
					; sub_22D90+FDj ...
		mov	bx, cs:word_216F3
		shl	bx, 1
		test	cs:word_21595[bx], 1
		jnz	loc_22DA3
		assume es:nothing
		pop	cx
		retn
; ---------------------------------------------------------------------------
		assume es:nothing

loc_22DA3::				; CODE XREF: sub_22D90+Fj
		shl	bx, 1
		mov	ax, cs:word_215D5[bx]
		or	ax, cs:word_215D7[bx]
		jz	loc_22DBF
		assume es:nothing
		sub	cs:word_215D5[bx], 1
		sbb	cs:word_215D7[bx], 0
		pop	cx
		retn
; ---------------------------------------------------------------------------
		assume es:nothing

loc_22DBF::				; CODE XREF: sub_22D90+1Fj
		shr	bx, 1
		mov	di, cs:word_21655[bx]
		mov	es, cs:word_21592
		assume es:nothing
		mov	al, es:[di]
		cmp	al, 0FFh
		jz	loc_22E23
		test	al, 80h
		jz	loc_22DDC
		mov	cs:word_21696[bx], ax
		inc	di

loc_22DDC::				; CODE XREF: sub_22D90+44j
		mov	ax, cs:word_21696[bx]
		xor	ah, ah
		mov	cl, 4
		shr	ax, cl
		mov	si, ax
		mov	cl, cs:byte_216D7[si]
		xor	ch, ch
		mov	ax, cs:word_21696[bx]
		jcxz	loc_22E02
		mov	bh, es:[di]
		inc	di
		dec	cx
		jcxz	loc_22E02
		mov	bl, es:[di]
		inc	di

loc_22E02::				; CODE XREF: sub_22D90+65j
					; sub_22D90+6Cj
		call	sub_2233A

loc_22E05::				; CODE XREF: sub_22D90+A8j
					; sub_22D90+D7j
		call	sub_22ED6
		mov	bx, cs:word_216F3
		shl	bx, 1
		mov	cs:word_21655[bx], di
		shl	bx, 1
		mov	cs:word_215D5[bx], ax
		mov	cs:word_215D7[bx], dx
		jmp	loc_22D91
; ---------------------------------------------------------------------------

loc_22E23::				; CODE XREF: sub_22D90+40j
		inc	di
		mov	al, es:[di]
		inc	di
		cmp	al, 2Fh	; '/'
		jz	loc_22E69
		cmp	al, 51h	; 'Q'
		jz	loc_22E3A
		xor	ah, ah
		mov	al, es:[di]
		inc	di
		add	di, ax
		jmp	loc_22E05
; ---------------------------------------------------------------------------

loc_22E3A::				; CODE XREF: sub_22D90+9Ej
		inc	di
		push	bx
		push	dx
		mov	dl, es:[di]
		inc	di
		xor	dh, dh
		mov	ax, es:[di]
		add	di, 2
		xchg	ah, al
		mov	bx, cs:word_2158D
		div	bx
		mov	bx, 7795
		mul	bx
		mov	ax, dx
		mov	bx, 10
		mul	bx
		call	sub_22F47
		mov	cs:word_2157C, ax
		pop	dx
		pop	bx
		jmp	loc_22E05
; ---------------------------------------------------------------------------

loc_22E69::				; CODE XREF: sub_22D90+9Aj
		mov	cs:word_21595[bx], 0
		mov	cx, cs:word_2158B
		xor	bx, bx

loc_22E77::				; CODE XREF: sub_22D90+F3j
		test	cs:word_21595[bx], 0FFFFh
		jnz	loc_22E88
		add	bx, 2
		loop	loc_22E77
		jmp	loc_22E90
; ---------------------------------------------------------------------------
		db  90h	; 
; ---------------------------------------------------------------------------

loc_22E88::				; CODE XREF: sub_22D90+EEj
		inc	cs:word_216F3
		jmp	loc_22D91
; ---------------------------------------------------------------------------

loc_22E90::				; CODE XREF: sub_22D90+F5j
		cmp	cs:byte_21594, 0
		jz	loc_22EB1
		les	di, dword ptr cs:word_21590
		assume es:nothing
		mov	al, cs:byte_2158F
		cmp	al, 1
		jz	loc_22EAB
		call	sub_22B42
		jmp	loc_22D91
; ---------------------------------------------------------------------------

loc_22EAB::				; CODE XREF: sub_22D90+113j
		call	sub_22C66
		jmp	loc_22D91
; ---------------------------------------------------------------------------

loc_22EB1::				; CODE XREF: sub_22D90+106j
		mov	cs:byte_21695, 0
		jmp	loc_22D91
sub_22D90	endp


; =============== S U B	R O U T	I N E =======================================


sub_22EBA	proc near		; DATA XREF: seg1c75:203Co
		mov	al, cs:byte_21695
		and	ax, 1
		retn
sub_22EBA	endp

		assume es:nothing

; =============== S U B	R O U T	I N E =======================================


sub_22EC2	proc near		; DATA XREF: seg1c75:2030o
		mov	al, cs:byte_2171D
		and	ax, 1
		retn
sub_22EC2	endp


; =============== S U B	R O U T	I N E =======================================


sub_22ECA	proc near		; DATA XREF: seg1c75:207Ao
		mov	ax, cs:word_21589
		retn
sub_22ECA	endp


; =============== S U B	R O U T	I N E =======================================


sub_22ECF	proc near		; DATA XREF: seg1c75:205Eo
		mov	cs:byte_21695, 1
		retn
sub_22ECF	endp

		assume es:nothing

; =============== S U B	R O U T	I N E =======================================


sub_22ED6	proc near		; CODE XREF: sub_22B42+EAp
					; sub_22C66+ABp ...
		push	bx
		push	cx
		xor	ax, ax
		xor	dx, dx

loc_22EDC::				; CODE XREF: sub_22ED6+32j
		mov	bl, es:[di]
		inc	di
		mov	bh, bl
		and	bl, 7Fh
		or	al, bl
		cmp	bh, 80h	; ''
		jb	loc_22F0A
		shl	ax, 1
		rcl	dx, 1
		shl	ax, 1
		rcl	dx, 1
		shl	ax, 1
		rcl	dx, 1
		shl	ax, 1
		rcl	dx, 1
		shl	ax, 1
		rcl	dx, 1
		shl	ax, 1
		rcl	dx, 1
		shl	ax, 1
		rcl	dx, 1
		jmp	loc_22EDC
; ---------------------------------------------------------------------------

loc_22F0A::				; CODE XREF: sub_22ED6+14j
		pop	cx
		pop	bx
		retn
sub_22ED6	endp

		assume es:seg2608

; =============== S U B	R O U T	I N E =======================================


sub_22F0D	proc near		; CODE XREF: sub_21AD7+7p sub_21C0F+7p ...
		push	ax
		push	dx
		mov	ax, es
		cmp	ax, 0
		jz	loc_22F44
		xor	dx, dx
		shl	ax, 1
		rcl	dx, 1
		shl	ax, 1
		rcl	dx, 1
		shl	ax, 1
		rcl	dx, 1
		shl	ax, 1
		rcl	dx, 1
		add	ax, di
		adc	dx, 0
		mov	di, ax
		and	di, 0Fh
		shr	dx, 1
		rcr	ax, 1
		shr	dx, 1
		rcr	ax, 1
		shr	dx, 1
		rcr	ax, 1
		shr	dx, 1
		rcr	ax, 1
		mov	es, ax
		assume es:nothing

loc_22F44::				; CODE XREF: sub_22F0D+7j
		pop	dx
		pop	ax
		retn
sub_22F0D	endp

		assume es:nothing

; =============== S U B	R O U T	I N E =======================================


sub_22F47	proc near		; CODE XREF: _core_startworx+72p
					; sub_21DCB+BEp ...
		cmp	cs:word_2094E, 1
		jnz	loc_22F50
		retn
; ---------------------------------------------------------------------------

loc_22F50::				; CODE XREF: sub_22F47+6j
		push	ax
		push	bx
		push	ds
		mov	bx, cs
		mov	ds, bx
		push	ax
		push	bx
		push	dx
		mov	bx, ax
		xor	dx, dx
		mov	ax, 0FFFFh
		div	bx
		mov	cs:word_216E9, ax
		mov	cs:word_216E7, ax
		pop	dx
		pop	bx
		mov	al, 34h	; '4'
		out	43h, al		; Timer	8253-5 (AT: 8254.2).
		pop	ax
		out	40h, al		; Timer	8253-5 (AT: 8254.2).
		mov	al, ah
		out	40h, al		; Timer	8253-5 (AT: 8254.2).
		pop	ds
		pop	bx
		pop	ax
		retn
sub_22F47	endp


; =============== S U B	R O U T	I N E =======================================


sub_22F7C	proc near
		push	ax
		cmp	al, 8
		jnb	loc_22F85
		add	al, 8
		pop	ax
		retn
; ---------------------------------------------------------------------------

loc_22F85::				; CODE XREF: sub_22F7C+3j
		sub	al, 8
		add	al, 70h	; 'p'
		pop	ax
		retn
sub_22F7C	endp


; =============== S U B	R O U T	I N E =======================================


sub_22F8B	proc near
		push	ax
		cmp	al, 8
		jnb	loc_22F94
		add	al, 8
		pop	ax
		retn
; ---------------------------------------------------------------------------

loc_22F94::				; CODE XREF: sub_22F8B+3j
		sub	al, 8
		add	al, 70h	; 'p'
		pop	ax
		retn
sub_22F8B	endp


; =============== S U B	R O U T	I N E =======================================


sub_22F9A	proc near		; CODE XREF: sub_22F9A+4Ap
		push	ax
		push	bx
		push	cx
		push	dx
		cmp	al, 8
		jnb	loc_22FC2
		cmp	al, 2
		jz	loc_22FBC
		mov	cl, al
		mov	bl, 1
		shl	bl, cl
		in	al, 21h		; Interrupt controller,	8259A.
		and	al, bl
		cmp	al, bl
		jnz	loc_22FED
		not	bl
		in	al, 21h		; Interrupt controller,	8259A.
		and	al, bl
		out	21h, al		; Interrupt controller,	8259A.

loc_22FBC::				; CODE XREF: sub_22F9A+Aj
		pop	dx
		pop	cx
		pop	bx
		pop	ax
		clc
		retn
; ---------------------------------------------------------------------------

loc_22FC2::				; CODE XREF: sub_22F9A+6j
		sub	al, 8
		mov	cl, al
		mov	bl, 1
		shl	bl, cl
		mov	dx, 0A1h ; '¡'
		in	al, dx		; Interrupt Controller #2, 8259A
		and	al, bl
		cmp	al, bl
		jnz	loc_22FED
		not	bl
		mov	dx, 0A1h ; '¡'
		in	al, dx		; Interrupt Controller #2, 8259A
		and	al, bl
		out	dx, al		; Interrupt Controller #2, 8259A
		mov	al, 60h	; '`'
		out	0A0h, al	; PIC 2	 same as 0020 for PIC 1
		mov	ax, 2
		call	sub_22F9A
		pop	dx
		pop	cx
		pop	bx
		pop	ax
		clc
		retn
; ---------------------------------------------------------------------------

loc_22FED::				; CODE XREF: sub_22F9A+18j
					; sub_22F9A+38j
		pop	dx
		pop	cx
		pop	bx
		pop	ax
		stc
		retn
sub_22F9A	endp


; =============== S U B	R O U T	I N E =======================================


sub_22FF3	proc near
		push	ax
		push	bx
		push	dx
		cmp	al, 8
		jnb	loc_2300A
		mov	cl, al
		mov	bl, 1
		shl	bl, cl
		in	al, 21h		; Interrupt controller,	8259A.
		or	al, bl
		out	21h, al		; Interrupt controller,	8259A.
		pop	dx
		pop	bx
		pop	ax
		retn
; ---------------------------------------------------------------------------

loc_2300A::				; CODE XREF: sub_22FF3+5j
		sub	al, 8
		mov	cl, al
		mov	bl, 1
		shl	bl, cl
		mov	dx, 0A1h ; '¡'
		in	al, dx		; Interrupt Controller #2, 8259A
		or	al, bl
		out	dx, al		; Interrupt Controller #2, 8259A
		pop	dx
		pop	bx
		pop	ax
		retn
sub_22FF3	endp

; ---------------------------------------------------------------------------
byte_2301D	db 0			; DATA XREF: sub_2301E+Cr
					; sub_2301E+14w ...
		assume es:seg2608

; =============== S U B	R O U T	I N E =======================================


sub_2301E	proc near		; CODE XREF: _core_closeworx+Dp
					; sub_23F6Fp ...
		mov	cs:byte_231C5, 0
		mov	cs:byte_2171D, 0
		test	cs:byte_2301D, 1
		jz	locret_23041
		assume es:nothing
		mov	cs:byte_2301D, 0
		mov	al, 0D0h ; 'Ð'
		call	sub_24311
		mov	al, 5
		out	0Ah, al		; DMA controller, 8237A-5.
					; single mask bit register
					; 0-1: select channel (00=0; 01=1; 10=2; 11=3)
					; 2: 1=set mask	for channel; 0=clear mask (enable)
		assume es:seg2608

locret_23041::				; CODE XREF: sub_2301E+12j
		retn
sub_2301E	endp

; ---------------------------------------------------------------------------
word_23042	dw 0			; DATA XREF: sub_23069:loc_230F3r
					; sub_242BB+Br	...
word_23044	dw 2121h		; DATA XREF: sub_242BB+10r
					; sub_2433E:loc_24347r	...
		db  21h	; !
		db  21h	; !
		db 0A1h	; ¡
		db    0
word_2304A	dw 2080h		; DATA XREF: sub_2433E+53r
					; sub_2433E+CEr
		db    8
		db    4
		db    4
word_2304F	dw 3Ch			; DATA XREF: sub_23069+91r
					; sub_242BB+1Er ...
		db  34h	; 4
		db    0
		db  2Ch	; ,
		db    0
		db  28h	; (
		db    0
		db 0C8h	; È
		db    1
word_23059	dw 507h			; DATA XREF: sub_2433E+1Fr
					; sub_2433E+E2r
		db    3
		db    2
		db  0Ah
word_2305E	dw 0			; DATA XREF: sub_242BB+2Ar
					; sub_2433E+3Bw ...
word_23060	dw 0			; DATA XREF: sub_242BB+31r
					; sub_2433E+43w ...
word_23062	dw 0			; DATA XREF: sub_242BB+17r
					; sub_2433E+1Bw ...
		db    0
		db  64h	; d
		db  18h
word_23067	dw 0			; DATA XREF: sub_23E32+15w
					; sub_23E32:loc_23E61r
		assume es:nothing

; =============== S U B	R O U T	I N E =======================================


sub_23069	proc near		; DATA XREF: seg1c75:2022o
		mov	ax, ds
		xor	dx, dx
		mov	dx, ax
		mov	cl, 0Ch
		shr	dx, cl
		mov	cl, 4
		shl	ax, cl
		mov	bx, 0Eh
		add	ax, bx
		adc	dx, 0
		mov	bx, ax
		add	bx, 1000h
		jnb	loc_2308D
		add	ax, 1000h
		adc	dx, 0

loc_2308D::				; CODE XREF: sub_23069+1Cj
		mov	cs:word_21714, dx
		mov	cl, 0Ch
		shl	cs:word_21714, cl
		mov	byte ptr cs:word_21711,	dl
		mov	cs:word_21711+1, ax
		mov	cs:word_20940, 0
		call	sub_24429
		jnb	loc_230B2
		mov	ax, 0FFFFh
		retn
; ---------------------------------------------------------------------------

loc_230B2::				; CODE XREF: sub_23069+43j
		call	sub_2433E
		jnb	loc_230BB
		mov	ax, 0FFFFh
		retn
; ---------------------------------------------------------------------------

loc_230BB::				; CODE XREF: sub_23069+4Cj
		mov	cs:word_20940, ax
		mov	dx, cs:word_21723
		add	dx, 4
		xor	al, al
		out	dx, al
		inc	dx
		out	dx, al
		dec	dx
		mov	al, 22h	; '"'
		out	dx, al
		inc	dx
		mov	al, 55h	; 'U'
		out	dx, al
		dec	dx
		mov	al, 22h	; '"'
		out	dx, al
		inc	dx
		in	al, dx
		cmp	al, 55h	; 'U'
		jnz	loc_230F3
		mov	cs:byte_21725, 1
		mov	bl, 0FFh
		call	sub_2201C
		mov	bl, 0FFh
		call	sub_2203D
		mov	bl, 0FFh
		call	sub_2205E

loc_230F3::				; CODE XREF: sub_23069+73j
		mov	bx, cs:word_23042
		shl	bx, 1
		mov	di, cs:word_2304F[bx]
		xor	ax, ax
		mov	es, ax
		mov	word ptr es:[di], offset sub_232ED
		mov	ax, cs
		mov	es:[di+2], ax
		mov	al, 0D1h ; 'Ñ'
		call	sub_24311
		mov	dx, cs:word_21723
		add	dx, 4
		xor	al, al
		out	dx, al
		inc	dx
		out	dx, al
		dec	dx
		mov	al, 4
		out	dx, al
		inc	dx
		mov	al, 0FFh
		out	dx, al
		dec	dx
		mov	al, 22h	; '"'
		out	dx, al
		inc	dx
		mov	al, 0FFh
		out	dx, al
		mov	ax, cs:word_20940
		retn
sub_23069	endp


; =============== S U B	R O U T	I N E =======================================


sub_23135	proc near		; DATA XREF: seg1c75:2024o
		mov	cs:word_21723, bx
		retn
sub_23135	endp


; =============== S U B	R O U T	I N E =======================================


sub_2313B	proc near		; DATA XREF: seg1c75:208Eo
		mov	ax, cs:word_21723
		clc
		retn
sub_2313B	endp


; =============== S U B	R O U T	I N E =======================================


sub_23141	proc near
		push	ax
		push	dx
		mov	dx, cs:word_21723
		add	dx, 6
		mov	al, 1
		out	dx, al
		mov	bx, 1
		call	sub_21774
		xor	al, al
		out	dx, al
		mov	cx, 0C8h ; 'È'
		mov	dx, cs:word_21723
		add	dx, 0Eh

loc_23162::				; CODE XREF: sub_23141+26j
		in	al, dx
		cmp	al, 80h	; ''
		jnb	loc_2316D
		loop	loc_23162

loc_23169::				; CODE XREF: sub_23141+37j
		stc
		pop	dx
		pop	ax
		retn
; ---------------------------------------------------------------------------

loc_2316D::				; CODE XREF: sub_23141+24j
		mov	dx, cs:word_21723
		add	dx, 0Ah
		in	al, dx
		cmp	al, 0AAh ; 'ª'
		jnz	loc_23169
		mov	bx, 4
		call	sub_21774
		clc
		pop	dx
		pop	ax
		retn
sub_23141	endp

		assume es:nothing

; =============== S U B	R O U T	I N E =======================================


sub_23184	proc near		; CODE XREF: sub_21AD7:loc_21B9Fp
		push	ax
		push	bx
		push	cx
		push	dx
		push	bp
		push	di
		push	si
		push	ds
		push	es
		push	es
		pop	ds
		assume ds:nothing
		push	di
		pop	si
		jmp	loc_2319F
; ---------------------------------------------------------------------------
		db  90h	; 
; ---------------------------------------------------------------------------

loc_23194::				; CODE XREF: sub_23184+1Ej
		sub	al, 61h	; 'a'
		cmp	al, 19h
		ja	loc_2319F
		add	al, 41h	; 'A'
		mov	[si-1],	al

loc_2319F::				; CODE XREF: sub_23184+Dj
					; sub_23184+14j
		lodsb
		and	al, al
		jnz	loc_23194
		pop	es
		pop	ds
		assume ds:seg1c75
		pop	si
		pop	di
		pop	bp
		pop	dx
		pop	cx
		pop	bx
		pop	ax
		retn
sub_23184	endp

; ---------------------------------------------------------------------------
		db    0
		db    0
word_231B0	dw 0			; DATA XREF: sub_23291+50w
					; sub_2450D+39w ...
word_231B2	dw 0			; DATA XREF: sub_231C6+Dw
					; sub_23233+12w ...
word_231B4	dw 0			; DATA XREF: sub_2450D+4Ew
					; sub_245A0+1Aw ...
word_231B6	dw 0			; DATA XREF: sub_2450D+55w
					; sub_245A0+22w ...
byte_231B8	db 0			; DATA XREF: sub_2450D+33w
					; sub_245A0+4Dw ...
word_231B9	dw 0			; DATA XREF: sub_231C6+52r
					; sub_232ED+20r ...
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
word_231C3	dw 0			; DATA XREF: sub_2450D+47w
					; sub_245A0+61w ...
byte_231C5	db 0			; DATA XREF: sub_2301Ew sub_231C6+26r	...
		assume es:nothing

; =============== S U B	R O U T	I N E =======================================


sub_231C6	proc near		; CODE XREF: sub_23F4A+18p
					; sub_2450D+65p ...
		cli
		push	cs
		pop	ds
		mov	al, 5
		out	0Ah, al		; DMA controller, 8237A-5.
					; single mask bit register
					; 0-1: select channel (00=0; 01=1; 10=2; 11=3)
					; 2: 1=set mask	for channel; 0=clear mask (enable)
		mov	cs:byte_2301D, 1
		mov	cs:word_231B2, 0
		mov	al, 40h	; '@'
		call	sub_24311
		mov	al, byte ptr cs:word_231B9+1
		call	sub_24311
		xor	al, al
		out	0Ch, al		; DMA controller, 8237A-5.
					; clear	byte pointer flip-flop.
		mov	al, 59h	; 'Y'
		cmp	cs:byte_231C5, 1
		jnz	loc_231F6
		mov	al, 55h	; 'U'

loc_231F6::				; CODE XREF: sub_231C6+2Cj
		out	0Bh, al		; DMA 8237A-5. mode register bits:
					; 0-1: channel (00=0; 01=1; 10=2; 11=3)
					; 2-3: transfer	type (00=verify=Nop; 01=write; 10=read)
					; 4: 1=enable auto-initialization
					; 5: 1=address increment; 0=address decrement
					; 6-7: 00=demand mode; 01=single; 10=block; 11=cascade
		mov	ax, cs:word_21711+1
		out	2, al		; DMA controller, 8237A-5.
					; channel 1 base address
					; (also	sets current address)
		xchg	ah, al
		out	2, al		; DMA controller, 8237A-5.
					; channel 1 base address
					; (also	sets current address)
		mov	al, byte ptr cs:word_21711
		out	83h, al		; DMA page register 74LS612:
					; Channel 1 (address bits 16-23)
		mov	ax, 0FFFh
		out	3, al		; DMA controller, 8237A-5.
					; channel 1 base address and word count
		xchg	ah, al
		out	3, al		; DMA controller, 8237A-5.
					; channel 1 base address and word count
		mov	al, 1
		out	0Ah, al		; DMA controller, 8237A-5.
					; single mask bit register
					; 0-1: select channel (00=0; 01=1; 10=2; 11=3)
					; 2: 1=set mask	for channel; 0=clear mask (enable)
		mov	bx, offset byte_21707
		mov	al, byte ptr cs:word_231B9
		xlat
		cmp	cs:byte_231C5, 1
		jnz	loc_23227
		mov	al, 24h	; '$'

loc_23227::				; CODE XREF: sub_231C6+5Dj
		call	sub_24311
		mov	al, 0E0h ; 'à'
		call	sub_24311
		call	sub_24311
		retn
sub_231C6	endp


; =============== S U B	R O U T	I N E =======================================


sub_23233	proc near		; CODE XREF: sub_24477+45p
		cli
		mov	cs:byte_231C5, 1
		mov	al, 0D3h ; 'Ó'
		call	sub_24311
		mov	cs:byte_2301D, 1
		mov	cs:word_231B2, 0
		mov	al, 40h	; '@'
		call	sub_24311
		mov	al, byte ptr cs:word_231B9+1
		call	sub_24311
		mov	al, 5
		out	0Ah, al		; DMA controller, 8237A-5.
					; single mask bit register
					; 0-1: select channel (00=0; 01=1; 10=2; 11=3)
					; 2: 1=set mask	for channel; 0=clear mask (enable)
		mov	al, 55h	; 'U'
		out	0Bh, al		; DMA 8237A-5. mode register bits:
					; 0-1: channel (00=0; 01=1; 10=2; 11=3)
					; 2-3: transfer	type (00=verify=Nop; 01=write; 10=read)
					; 4: 1=enable auto-initialization
					; 5: 1=address increment; 0=address decrement
					; 6-7: 00=demand mode; 01=single; 10=block; 11=cascade
		xor	al, al
		out	0Ch, al		; DMA controller, 8237A-5.
					; clear	byte pointer flip-flop.
		mov	ax, cs:word_21711+1
		out	2, al		; DMA controller, 8237A-5.
					; channel 1 base address
					; (also	sets current address)
		xchg	ah, al
		out	2, al		; DMA controller, 8237A-5.
					; channel 1 base address
					; (also	sets current address)
		mov	al, byte ptr cs:word_21711
		out	83h, al		; DMA page register 74LS612:
					; Channel 1 (address bits 16-23)
		mov	ax, 0FFFh
		out	3, al		; DMA controller, 8237A-5.
					; channel 1 base address and word count
		xchg	ah, al
		out	3, al		; DMA controller, 8237A-5.
					; channel 1 base address and word count
		mov	al, 1
		out	0Ah, al		; DMA controller, 8237A-5.
					; single mask bit register
					; 0-1: select channel (00=0; 01=1; 10=2; 11=3)
					; 2: 1=set mask	for channel; 0=clear mask (enable)
		mov	al, 24h	; '$'
		call	sub_24311
		mov	al, 20h	; ' '
		call	sub_24311
		call	sub_24311
		retn
sub_23233	endp

; ---------------------------------------------------------------------------
word_2328F	dw 0			; DATA XREF: sub_23291+36w
					; sub_23E32+10r ...
		assume es:seg2608

; =============== S U B	R O U T	I N E =======================================


sub_23291	proc near		; CODE XREF: sub_23E32+2p sub_244C3+4p ...
		push	cs
		pop	ds
		cli
		xor	al, al
		out	0Ch, al		; DMA controller, 8237A-5.
					; clear	byte pointer flip-flop.
		in	al, 2		; DMA controller, 8237A-5.
					; channel 1 current address
		in	al, 2		; DMA controller, 8237A-5.
					; channel 1 current address
		sti
		xchg	ah, al
		xor	al, al
		mov	cx, ax
		mov	ax, cs:word_21711+1
		cmp	cx, ax
		jnb	loc_232AE
		xor	cx, cx
		retn
; ---------------------------------------------------------------------------

loc_232AE::				; CODE XREF: sub_23291+18j
		sub	cx, ax
		cmp	cx, 400h
		jnb	loc_232B9
		xor	cx, cx
		retn
; ---------------------------------------------------------------------------

loc_232B9::				; CODE XREF: sub_23291+23j
		cmp	cx, 1000h
		jle	loc_232C2
		xor	cx, cx
		retn
; ---------------------------------------------------------------------------

loc_232C2::				; CODE XREF: sub_23291+2Cj
		mov	dx, cs:word_231B2
		mov	cs:word_2328F, dx
		mov	cs:word_231B2, cx
		cmp	cx, dx
		jge	loc_232DF
		mov	cs:word_231B2, 0
		mov	cx, 1000h

loc_232DF::				; CODE XREF: sub_23291+42j
		sub	cx, dx
		mov	cs:word_231B0, cx
		retn
sub_23291	endp

; ---------------------------------------------------------------------------
		db    0
		db    0
		db    0
		db    0
		db 0FFh
		db 0FFh

; =============== S U B	R O U T	I N E =======================================


sub_232ED	proc far		; DATA XREF: sub_23069+9Ao
		cli
		push	ax
		push	bx
		push	dx
		push	ds
		push	cs
		pop	ds
		mov	dx, cs:word_21723
		add	dx, 0Eh
		in	al, dx
		mov	dx, cs:word_21723
		add	dx, 0Ch

loc_23305::				; CODE XREF: sub_232ED+1Bj
		in	al, dx
		test	al, 80h
		jnz	loc_23305
		mov	bx, offset byte_2170B
		mov	al, byte ptr cs:word_231B9
		xlat
		cmp	cs:byte_231C5, 0
		jz	loc_2331C
		mov	al, 24h	; '$'

loc_2331C::				; CODE XREF: sub_232ED+2Bj
		out	dx, al

loc_2331D::				; CODE XREF: sub_232ED+33j
		in	al, dx
		test	al, 80h
		jnz	loc_2331D
		mov	al, 0D0h ; 'Ð'
		out	dx, al

loc_23325::				; CODE XREF: sub_232ED+3Bj
		in	al, dx
		test	al, 80h
		jnz	loc_23325
		mov	al, 0D0h ; 'Ð'
		out	dx, al
		mov	al, 20h	; ' '
		out	20h, al		; Interrupt controller,	8259A.
		out	0A0h, al	; PIC 2	 same as 0020 for PIC 1
		pop	ds
		assume ds:seg2608
		pop	dx
		pop	bx
		pop	ax
		iret
sub_232ED	endp

; ---------------------------------------------------------------------------
word_23338	dw 0			; DATA XREF: sub_2354A+2Dr
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
		db  1Ch
		db    0
		db  1Dh
		db    0
		db  1Fh
		db    0
		db  21h	; !
		db    0
		db  23h	; #
		db    0
		db  25h	; %
		db    0
		db  27h	; '
		db    0
		db  29h	; )
		db    0
		db  2Ch	; ,
		db    0
		db  2Eh	; .
		db    0
		db  31h	; 1
		db    0
		db  34h	; 4
		db    0
		db  37h	; 7
		db    0
		db  3Ah	; :
		db    0
		db  3Eh	; >
		db    0
		db  41h	; A
		db    0
		db  45h	; E
		db    0
		db  49h	; I
		db    0
		db  4Eh	; N
		db    0
		db  52h	; R
		db    0
		db  57h	; W
		db    0
		db  5Ch	; \
		db    0
		db  62h	; b
		db    0
		db  68h	; h
		db    0
		db  6Eh	; n
		db    0
		db  75h	; u
		db    0
		db  7Bh	; {
		db    0
		db  83h	; 
		db    0
		db  8Bh	; 
		db    0
		db  93h	; 
		db    0
		db  9Ch	; 
		db    0
		db 0A5h	; ¥
		db    0
		db 0AFh	; ¯
		db    0
		db 0B9h	; ¹
		db    0
		db 0C4h	; Ä
		db    0
		db 0D0h	; Ð
		db    0
		db 0DCh	; Ü
		db    0
		db 0E9h	; é
		db    0
		db 0F7h	; ÷
		db    0
		db    6
		db    1
		db  15h
		db    1
		db  26h	; &
		db    1
		db  37h	; 7
		db    1
		db  4Ah	; J
		db    1
		db  5Dh	; ]
		db    1
		db  72h	; r
		db    1
		db  88h	; 
		db    1
		db  9Fh	; 
		db    1
		db 0B8h	; ¸
		db    1
		db 0D2h	; Ò
		db    1
		db 0EEh	; î
		db    1
		db  0Bh
		db    2
		db  2Ah	; *
		db    2
		db  4Bh	; K
		db    2
		db  6Eh	; n
		db    2
		db  93h	; 
		db    2
		db 0BAh	; º
		db    2
		db 0E4h	; ä
		db    2
		db  10h
		db    3
		db  3Fh	; ?
		db    3
		db  70h	; p
		db    3
		db 0A4h	; ¤
		db    3
		db 0DCh	; Ü
		db    3
		db  17h
		db    4
		db  55h	; U
		db    4
		db  97h	; 
		db    4
		db 0DDh	; Ý
		db    4
		db  27h	; '
		db    5
		db  75h	; u
		db    5
		db 0C8h	; È
		db    5
		db  20h
		db    6
		db  7Dh	; }
		db    6
		db 0E0h	; à
		db    6
		db  49h	; I
		db    7
		db 0B8h	; ¸
		db    7
		db  2Dh	; -
		db    8
		db 0A9h	; ©
		db    8
		db  2Dh	; -
		db    9
		db 0B9h	; ¹
		db    9
		db  4Dh	; M
		db  0Ah
		db 0EAh	; ê
		db  0Ah
		db  90h	; 
		db  0Bh
		db  40h	; @
		db  0Ch
		db 0FAh	; ú
		db  0Ch
		db 0C0h	; À
		db  0Dh
		db  91h	; 
		db  0Eh
		db  6Fh	; o
		db  0Fh
		db  5Ah	; Z
		db  10h
		db  53h	; S
		db  11h
		db  5Bh	; [
		db  12h
		db  72h	; r
		db  13h
		db  9Ah	; 
		db  14h
		db 0D4h	; Ô
		db  15h
		db  20h
		db  17h
		db  80h	; 
		db  18h
		db 0F5h	; õ
		db  19h
		db  80h	; 
		db  1Bh
		db  23h	; #
		db  1Dh
		db 0DEh	; Þ
		db  1Eh
		db 0B4h	; ´
		db  20h
		db 0A6h	; ¦
		db  22h	; "
		db 0B5h	; µ
		db  24h	; $
		db 0E4h	; ä
		db  26h	; &
		db  34h	; 4
		db  29h	; )
		db 0A7h	; §
		db  2Bh	; +
		db  40h	; @
		db  2Eh	; .
		db    0
		db  31h	; 1
		db 0EAh	; ê
		db  33h	; 3
		db    0
		db  37h	; 7
		db  45h	; E
		db  3Ah	; :
		db 0BCh	; ¼
		db  3Dh	; =
		db  68h	; h
		db  41h	; A
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
word_23444	dw 0			; DATA XREF: sub_23FE6+Ew sub_24087+Ew ...
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
word_23454	dw 0			; DATA XREF: sub_23E32+93r
					; sub_23FE6+9w	...
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
word_23464	dw 0			; DATA XREF: sub_23E32+52r
					; sub_23FE6+92w ...
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
word_23474	dw 0			; DATA XREF: sub_23E32+4Br
					; sub_23FE6+9Bw ...
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
word_23484	dw 0			; DATA XREF: sub_23536+2w
					; sub_23E32+43r ...
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
word_23494	dw 3Fh			; DATA XREF: sub_235B6+6w
					; sub_23E32+D2r
		db  3Fh	; ?
		db    0
		db  3Fh	; ?
		db    0
		db  3Fh	; ?
		db    0
		db  3Fh	; ?
		db    0
		db  3Fh	; ?
		db    0
		db  3Fh	; ?
		db    0
		db  3Fh	; ?
		db    0
word_234A4	dw 0			; DATA XREF: sub_23E32:loc_23E70r
					; sub_23E32+57w ...
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
word_234B4	dw 0			; DATA XREF: sub_23E32:loc_23E91r
					; sub_23FE6+77w ...
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
word_234C4	dw 0			; DATA XREF: sub_23540+2w
					; sub_23E32:loc_23E55r	...
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
word_234D4	dw 0			; DATA XREF: sub_2354A+4Cw
					; sub_23E32+E1r
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
word_234E4	dw 0			; DATA XREF: sub_2354A+47w
					; sub_23E32+EBr
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
word_234F4	dw 0			; DATA XREF: sub_2354A+5Dw
					; sub_23E32+E6w
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
word_23504	dw 0			; DATA XREF: sub_2354A+56w
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
word_23514	dw 0			; DATA XREF: sub_2354A+Ar
					; sub_23FE6+80w ...
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
		db 0B8h	; ¸
		db    1
		db 0B8h	; ¸
		db    1
		db 0B8h	; ¸
		db    1
		db 0B8h	; ¸
		db    1
		db 0B8h	; ¸
		db    1
		db 0B8h	; ¸
		db    1
		db 0B8h	; ¸
		db    1
		db 0B8h	; ¸
		db    1
word_23534	dw 0			; DATA XREF: seg1c75:5615r

; =============== S U B	R O U T	I N E =======================================


sub_23536	proc near		; DATA XREF: seg1c75:20A8o
		shl	bx, 1
		mov	cs:word_23484[bx], 2
		retn
sub_23536	endp


; =============== S U B	R O U T	I N E =======================================


sub_23540	proc near		; DATA XREF: seg1c75:20AEo
		shl	bx, 1
		mov	cs:word_234C4[bx], 0
		retn
sub_23540	endp


; =============== S U B	R O U T	I N E =======================================


sub_2354A	proc near		; CODE XREF: sub_23DD7+3Dp
					; DATA XREF: seg1c75:208Ao
		push	ax
		xchg	bh, bl
		xor	bh, bh
		mov	di, bx
		shl	di, 1
		push	dx
		mov	ax, cs:word_23514[di]
		mov	bx, 18181
		xor	dx, dx
		div	bx
		push	ax
		xor	ax, ax
		div	bx
		pop	dx
		mov	al, ah
		mov	ah, dl
		mov	bp, ax
		pop	si
		mov	ax, si
		cmp	si, 80h	; ''
		jnb	loc_2357C
		shl	si, 1
		mov	ax, cs:word_23338[si]

loc_2357C::				; CODE XREF: sub_2354A+29j
		mov	bx, 1B8h
		xor	dx, dx
		div	bx
		push	ax
		xor	ax, ax
		div	bx
		pop	dx
		mov	al, ah
		mov	ah, dl
		xor	dx, dx
		mul	bp
		mov	cs:word_234E4[di], dx
		mov	cs:word_234D4[di], ax
		pop	ax
		cmp	al, 0
		jnz	locret_235B5
		mov	cs:word_23504[di], 0
		mov	cs:word_234F4[di], 0
		mov	ax, di
		shr	ax, 1
		call	sub_241CB

locret_235B5::				; CODE XREF: sub_2354A+54j
		retn
sub_2354A	endp


; =============== S U B	R O U T	I N E =======================================


sub_235B6	proc near		; DATA XREF: seg1c75:2082o
		shl	bx, 1
		and	al, 3Fh
		xor	ah, ah
		mov	cs:word_23494[bx], ax
		retn
sub_235B6	endp

; ---------------------------------------------------------------------------
unk_235C2	db    0			; DATA XREF: sub_23E32+B5o
					; sub_24157+Bo
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
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
word_23DC2	dw 0			; DATA XREF: sub_23E32+A2r
					; sub_23E32+BFr ...
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
byte_23DD2	db 0			; DATA XREF: sub_23DD7+Cw sub_23E1Ew ...
dword_23DD3	dd 0			; DATA XREF: sub_23DD7r
					; sub_23DD7:loc_23E05r	...

; =============== S U B	R O U T	I N E =======================================


sub_23DD7	proc near		; CODE XREF: sub_23E1E+10p
					; sub_23E32+82p
		les	di, cs:dword_23DD3
		assume es:nothing
		cmp	byte ptr es:[di+4], 2
		jnz	loc_23DEA
		mov	cs:byte_23DD2, 0
		retn
; ---------------------------------------------------------------------------

loc_23DEA::				; CODE XREF: sub_23DD7+Aj
		mov	bl, es:[di+4]
		mov	al, es:[di+7]
		les	di, es:[di]
		mov	dx, es
		cmp	bl, 1
		jz	loc_23E02
		call	sub_23FE6
		jmp	loc_23E05
; ---------------------------------------------------------------------------
		db  90h	; 
; ---------------------------------------------------------------------------

loc_23E02::				; CODE XREF: sub_23DD7+23j
		call	sub_24087

loc_23E05::				; CODE XREF: sub_23DD7+28j
		les	di, cs:dword_23DD3
		mov	bh, es:[di+7]
		mov	dx, es:[di+5]
		xor	al, al
		call	sub_2354A
		add	word ptr cs:dword_23DD3, 8
		retn
sub_23DD7	endp


; =============== S U B	R O U T	I N E =======================================


sub_23E1E	proc near		; DATA XREF: seg1c75:20BCo
		mov	cs:byte_23DD2, 1
		mov	word ptr cs:dword_23DD3, di
		mov	word ptr cs:dword_23DD3+2, es
		call	sub_23DD7
		retn
sub_23E1E	endp


; =============== S U B	R O U T	I N E =======================================


sub_23E32	proc near		; CODE XREF: sub_229C4+46p
		push	cs
		pop	ds
		assume ds:seg1c75
		call	sub_23291
		cmp	cx, 0
		jnz	loc_23E3D
		retn
; ---------------------------------------------------------------------------

loc_23E3D::				; CODE XREF: sub_23E32+8j
		les	di, dword ptr cs:word_21711+1
		add	di, cs:word_2328F
		mov	cs:word_23067, cx
		shr	cx, 1
		mov	ax, 8080h
		rep stosw
		xor	bx, bx

loc_23E55::				; CODE XREF: sub_23E32+103j
		test	cs:word_234C4[bx], 1
		jnz	loc_23E61
		jmp	loc_23F2D
; ---------------------------------------------------------------------------

loc_23E61::				; CODE XREF: sub_23E32+2Aj
		mov	cx, cs:word_23067
		les	di, dword ptr cs:word_21711+1
		add	di, cs:word_2328F

loc_23E70::				; CODE XREF: sub_23E32+F8j
		mov	si, cs:word_234A4[bx]
		cmp	cs:word_23484[bx], 1
		jnz	loc_23E91
		cmp	si, cs:word_23474[bx]
		jb	loc_23EC4
		mov	si, cs:word_23464[bx]
		mov	cs:word_234A4[bx], si
		jmp	loc_23EC4
; ---------------------------------------------------------------------------
		db  90h	; 
; ---------------------------------------------------------------------------

loc_23E91::				; CODE XREF: sub_23E32+49j
		cmp	si, cs:word_234B4[bx]
		jb	loc_23EC4
		cmp	cs:word_23484[bx], 2
		jnz	loc_23EA7
		mov	cs:word_23484[bx], 1

loc_23EA7::				; CODE XREF: sub_23E32+6Cj
		cmp	bx, 0
		jnz	loc_23EBA
		cmp	cs:byte_23DD2, 0
		jz	loc_23EBA
		call	sub_23DD7
		jmp	loc_23F2D
; ---------------------------------------------------------------------------
		db  90h	; 
; ---------------------------------------------------------------------------

loc_23EBA::				; CODE XREF: sub_23E32+78j
					; sub_23E32+80j
		mov	cs:word_234C4[bx], 0
		jmp	loc_23F2D
; ---------------------------------------------------------------------------
		db  90h	; 
; ---------------------------------------------------------------------------

loc_23EC4::				; CODE XREF: sub_23E32+50j
					; sub_23E32+5Cj ...
		push	ds
		mov	ax, cs:word_23454[bx]
		cmp	ax, 0
		jnz	loc_23EF8
		mov	ax, cs:word_234A4[bx]
		sub	ax, cs:word_23DC2[bx]
		cmp	ax, 100h
		jb	loc_23EE1
		call	sub_24157

loc_23EE1::				; CODE XREF: sub_23E32+AAj
		mov	ax, bx
		shr	ax, 1
		xchg	ah, al
		add	ax, offset unk_235C2
		mov	si, ax
		add	si, cs:word_234A4[bx]
		sub	si, cs:word_23DC2[bx]
		mov	ax, cs

loc_23EF8::				; CODE XREF: sub_23E32+9Bj
		mov	ds, ax
		mov	al, [si]
		xor	ah, ah
		shr	ax, 1
		pop	ds
		assume ds:seg2608
		sub	ax, 40h	; '@'
		mov	dx, cs:word_23494[bx]
		shl	dx, 1
		shl	dx, 1
		imul	dx
		add	es:[di], ah
		inc	di
		mov	ax, cs:word_234D4[bx]
		add	cs:word_234F4[bx], ax
		mov	ax, cs:word_234E4[bx]
		adc	cs:word_234A4[bx], ax
		dec	cx
		jcxz	loc_23F2D
		jmp	loc_23E70
; ---------------------------------------------------------------------------

loc_23F2D::				; CODE XREF: sub_23E32+2Cj
					; sub_23E32+85j ...
		add	bx, 2
		cmp	bx, 10h
		jnb	locret_23F38
		jmp	loc_23E55
; ---------------------------------------------------------------------------

locret_23F38::				; CODE XREF: sub_23E32+101j
		retn
sub_23E32	endp


; =============== S U B	R O U T	I N E =======================================


sub_23F39	proc near		; DATA XREF: seg1c75:208Co
		mov	bl, al
		xor	bh, bh
		shl	bx, 1
		mov	ax, cs:word_234C4[bx]
		retn
sub_23F39	endp

; ---------------------------------------------------------------------------
		mov	ax, cs:word_23534
		retn

; =============== S U B	R O U T	I N E =======================================


sub_23F4A	proc near		; DATA XREF: seg1c75:2084o
		les	di, dword ptr cs:word_21711+1
		mov	cx, 1000h
		mov	al, 80h	; ''
		rep stosb
		mov	byte ptr cs:word_231B9+1, 0C9h ; 'É'
		mov	byte ptr cs:word_231B9,	0
		call	sub_231C6
		or	cs:byte_216EF, 20h
		mov	ax, 0
		retn
sub_23F4A	endp


; =============== S U B	R O U T	I N E =======================================


sub_23F6F	proc near		; DATA XREF: seg1c75:2088o
		call	sub_2301E
		mov	bx, 4
		call	sub_21774
		and	cs:byte_216EF, 0DFh
		mov	ax, 0
		retn
sub_23F6F	endp

; ---------------------------------------------------------------------------
unk_23F82	db    0			; DATA XREF: sub_23FE6+4Eo
					; sub_24087+4Eo
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

; =============== S U B	R O U T	I N E =======================================


sub_23FE6	proc near		; CODE XREF: sub_23DD7+25p
					; DATA XREF: seg1c75:2086o
		call	sub_22F0D
		mov	bl, al
		xor	bh, bh
		shl	bx, 1
		mov	cs:word_23454[bx], es
		mov	cs:word_23444[bx], di
		cmp	dx, 0
		jnz	loc_24059
		push	bx
		mov	bx, di
		shl	bx, 1
		shl	bx, 1
		mov	ax, cs:word_209F0[bx]
		mov	cs:word_20AFC, ax
		mov	ax, cs:word_209F2[bx]
		mov	cs:word_20AFE, ax
		mov	ax, cs:word_20AF0
		mov	cs:word_20AFA, ax
		mov	cs:word_20AF6, 40h ; '@'
		mov	cs:word_20AF8, 0
		mov	cs:word_20B00, 0
		mov	cs:word_20B02, offset unk_23F82
		mov	cs:word_20B04, seg seg1c75
		mov	si, offset word_20AF6
		mov	ah, 0Bh
		call	cs:dword_20AF2
		push	cs
		pop	ds
		assume ds:seg1c75
		pop	bx
		mov	di, cs:word_20B02
		mov	es, cs:word_20B04

loc_24059::				; CODE XREF: sub_23FE6+16j
		mov	dx, es:[di+28h]
		mov	cs:word_234B4[bx], dx
		mov	ax, es:[di+18h]
		mov	cs:word_23514[bx], ax
		mov	ax, es:[di+12h]
		mov	cs:word_23484[bx], ax
		mov	ax, es:[di+2Ch]
		mov	cs:word_23464[bx], ax
		mov	ax, es:[di+2Eh]
		mov	cs:word_23474[bx], ax
		retn
sub_23FE6	endp


; =============== S U B	R O U T	I N E =======================================


sub_24087	proc near		; CODE XREF: sub_23DD7:loc_23E02p
					; DATA XREF: seg1c75:20A2o
		mov	bl, al
		xor	bh, bh
		shl	bx, 1
		call	sub_22F0D
		mov	cs:word_23454[bx], es
		mov	cs:word_23444[bx], di
		cmp	dx, 0
		jnz	loc_240FA
		push	bx
		mov	bx, di
		shl	bx, 1
		shl	bx, 1
		mov	ax, cs:word_209F0[bx]
		mov	cs:word_20AFC, ax
		mov	ax, cs:word_209F2[bx]
		mov	cs:word_20AFE, ax
		mov	ax, cs:word_20AF0
		mov	cs:word_20AFA, ax
		mov	cs:word_20AF6, 40h ; '@'
		mov	cs:word_20AF8, 0
		mov	cs:word_20B00, 0
		mov	cs:word_20B02, offset unk_23F82
		mov	cs:word_20B04, seg seg1c75
		mov	si, offset word_20AF6
		mov	ah, 0Bh
		call	cs:dword_20AF2
		push	cs
		pop	ds
		pop	bx
		mov	di, cs:word_20B02
		mov	es, cs:word_20B04

loc_240FA::				; CODE XREF: sub_24087+16j
		push	bx
		mov	dx, es:[di+1Bh]
		sub	dx, 80h	; ''
		mov	cs:word_234B4[bx], dx
		mov	al, es:[di+1Eh]
		xor	ah, ah
		mov	bx, 100h
		sub	bx, ax
		mov	dx, 0Fh
		mov	ax, 4240h
		cmp	bx, 0
		jz	short locret_24156
		div	bx
		pop	bx
		mov	cs:word_23514[bx], ax
		mov	ax, es:[di+20h]
		mov	cs:word_23484[bx], 0
		cmp	ax, 1
		jnz	short loc_2414F
		mov	cs:word_23484[bx], 1
		mov	ax, es:[di+22h]
		mov	cs:word_23464[bx], ax
		mov	ax, es:[di+24h]
		mov	cs:word_23474[bx], ax

loc_2414F::				; CODE XREF: sub_24087+ADj
		mov	cs:word_234A4[bx], 40h ; '@'

locret_24156::				; CODE XREF: sub_24087+95j
		retn
sub_24087	endp ; sp-analysis failed


; =============== S U B	R O U T	I N E =======================================


sub_24157	proc near		; CODE XREF: sub_23E32+ACp
					; sub_241CB+1Cp
		push	ax
		push	bx
		push	cx
		push	dx
		push	si
		mov	ax, bx
		shr	ax, 1
		xchg	ah, al
		add	ax, offset unk_235C2
		mov	cs:word_20B02, ax
		mov	cs:word_20B04, cs
		mov	cs:word_20AF6, 100h
		mov	cs:word_20B00, 0
		mov	ax, cs:word_20AF0
		mov	cs:word_20AFA, ax
		mov	ax, cs:word_234A4[bx]
		mov	cs:word_23DC2[bx], ax
		mov	bx, cs:word_23444[bx]
		shl	bx, 1
		shl	bx, 1
		add	ax, cs:word_209F0[bx]
		mov	cs:word_20AFC, ax
		mov	ax, cs:word_209F2[bx]
		mov	cs:word_20AFE, 0
		adc	cs:word_20AFE, ax
		mov	ah, 0Bh
		mov	si, offset word_20AF6
		call	cs:dword_20AF2
		cmp	ax, 1
		jz	loc_241C3
		mov	ax, 0

loc_241C3::				; CODE XREF: sub_24157+67j
		push	cs
		pop	ds
		pop	si
		pop	dx
		pop	cx
		pop	bx
		pop	ax
		retn
sub_24157	endp


; =============== S U B	R O U T	I N E =======================================


sub_241CB	proc near		; CODE XREF: sub_2354A+68p
		mov	bl, al
		xor	bh, bh
		shl	bx, 1
		mov	cs:word_234C4[bx], 1
		mov	cs:word_234A4[bx], 40h ; '@'
		cmp	cs:word_23454[bx], 0
		jnz	locret_241EA
		call	sub_24157

locret_241EA::				; CODE XREF: sub_241CB+1Aj
		retn
sub_241CB	endp


; =============== S U B	R O U T	I N E =======================================


sub_241EB	proc near		; CODE XREF: sub_221BF+Ep
					; sub_221BF+13p ...
		push	ax
		push	cx
		push	dx
		mov	ah, al
		mov	cx, 0FFFFh
		mov	dx, 331h

loc_241F6::				; CODE XREF: sub_241EB+11j
		jcxz	loc_24215
		dec	cx
		in	al, dx
		test	al, 40h
		jnz	loc_241F6
		mov	al, ah
		mov	dx, 330h
		out	dx, al
		pop	dx
		pop	cx
		pop	ax
		cmp	word ptr cs:dword_22183+2, 0
		jz	locret_24214
		call	cs:dword_22183

locret_24214::				; CODE XREF: sub_241EB+22j
		retn
; ---------------------------------------------------------------------------

loc_24215::				; CODE XREF: sub_241EB:loc_241F6j
		pop	dx
		pop	cx
		pop	ax
		retn
sub_241EB	endp


; =============== S U B	R O U T	I N E =======================================


sub_24219	proc near		; DATA XREF: seg1c75:2090o
		xor	bx, bx

loc_2421B::				; CODE XREF: sub_24219+30j
		cmp	bx, 3
		jnb	loc_24262
		inc	bx
		mov	dx, 331h
		mov	cx, 0FFFFh

loc_24227::				; CODE XREF: sub_24219+14j
		jcxz	loc_24262
		dec	cx
		in	al, dx
		test	al, 40h
		jnz	loc_24227
		mov	dx, 331h
		mov	al, 0FFh
		out	dx, al
		mov	dx, 331h
		mov	cx, 0FFFFh

loc_2423B::				; CODE XREF: sub_24219+28j
		jcxz	loc_24262
		dec	cx
		in	al, dx
		test	al, 80h
		jnz	loc_2423B
		mov	dx, 330h
		in	al, dx
		cmp	al, 0FEh ; 'þ'
		jnz	loc_2421B
		mov	dx, 331h
		mov	cx, 0FFFFh

loc_24251::				; CODE XREF: sub_24219+3Ej
		jcxz	loc_24262
		dec	cx
		in	al, dx
		test	al, 40h
		jnz	loc_24251
		mov	dx, 331h
		mov	al, 3Fh	; '?'
		out	dx, al
		xor	ax, ax
		retn
; ---------------------------------------------------------------------------

loc_24262::				; CODE XREF: sub_24219+5j
					; sub_24219:loc_24227j	...
		mov	ax, 0FFFFh
		retn
sub_24219	endp


; =============== S U B	R O U T	I N E =======================================


sub_24266	proc near		; DATA XREF: seg1c75:2092o
		call	sub_22F0D
		xor	bx, bx
		mov	si, offset byte_20E46
		add	di, 4

loc_24271::				; CODE XREF: sub_24266+1Fj
		mov	cx, 0Bh

loc_24274::				; CODE XREF: sub_24266+15j
		mov	al, es:[di]
		inc	di
		mov	[si], al
		inc	si
		loop	loc_24274
		add	di, 5
		inc	bx
		cmp	bx, 80h	; ''
		jb	loc_24271
		mov	ax, 0
		retn
sub_24266	endp

; ---------------------------------------------------------------------------
aRiff		db 'RIFF',0             ; DATA XREF: sub_21E96+18o
					; sub_245A0+Bo	...
		db    0
		db    0
		db    0
		db  57h	; W
		db  41h	; A
		db  56h	; V
		db  45h	; E
		db  66h	; f
		db  6Dh	; m
		db  74h	; t
		db  20h
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
		db    0
word_242A3	dw 0			; DATA XREF: sub_21E96+32r
					; sub_245A0+2Cr ...
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
		db  64h	; d
		db  61h	; a
		db  74h	; t
		db  61h	; a
word_242B3	dw 0			; DATA XREF: sub_21E96+28r
					; sub_245A0+16r ...
word_242B5	dw 0			; DATA XREF: sub_245A0+1Er
					; sub_24619+27r
		db    0
		db    0
		db    0
		db    0

; =============== S U B	R O U T	I N E =======================================


sub_242BB	proc near		; DATA XREF: seg1c75:2028o
		cmp	cs:word_20940, 0
		jz	locret_242F4
		call	sub_2301E
		mov	bx, cs:word_23042
		mov	dl, byte ptr cs:word_23044[bx]
		xor	dh, dh
		mov	al, byte ptr cs:word_23062
		out	dx, al
		shl	bx, 1
		mov	di, cs:word_2304F[bx]
		shr	bx, 1
		mov	ax, 0
		mov	es, ax
		assume es:nothing
		mov	ax, cs:word_2305E
		mov	es:[di], ax
		mov	ax, cs:word_23060
		mov	es:[di+2], ax

locret_242F4::				; CODE XREF: sub_242BB+6j
		retn
sub_242BB	endp

; ---------------------------------------------------------------------------
		assume es:nothing

loc_242F5::				; DATA XREF: sub_2433E+47o
		cld
		push	ax
		push	dx
		mov	dx, cs:word_21723
		add	dx, 0Eh
		in	al, dx
		mov	cs:word_23062+1, 1
		mov	al, 20h	; ' '
		out	20h, al		; Interrupt controller,	8259A.
		out	0A0h, al	; PIC 2	 same as 0020 for PIC 1
		pop	dx
		pop	ax
		iret

; =============== S U B	R O U T	I N E =======================================


sub_24311	proc near		; CODE XREF: sub_2301E+1Cp
					; sub_23069+A7p ...
		push	ax
		push	bx
		push	cx
		push	dx
		push	bp
		push	di
		push	si
		push	ds
		push	es
		push	cs
		pop	ds
		mov	bl, al
		mov	dx, cs:word_21723
		add	dx, 0Ch
		mov	cx, 0FFFFh

loc_24329::				; CODE XREF: sub_24311+1Ej
		jcxz	loc_24331
		in	al, dx
		dec	cx
		test	al, 80h
		jnz	loc_24329

loc_24331::				; CODE XREF: sub_24311:loc_24329j
		mov	al, bl
		out	dx, al
		pop	es
		pop	ds
		pop	si
		pop	di
		pop	bp
		pop	dx
		pop	cx
		pop	bx
		pop	ax
		retn
sub_24311	endp


; =============== S U B	R O U T	I N E =======================================


sub_2433E	proc near		; CODE XREF: sub_23069:loc_230B2p
		xor	bx, bx
		push	cs
		pop	ds
		mov	al, 0D3h ; 'Ó'
		call	sub_24311

loc_24347::				; CODE XREF: sub_2433E+BBj
		mov	dl, byte ptr cs:word_23044[bx]
		cmp	dl, 0

loc_2434F::
		jnz	loc_24354
		jmp	loc_243FC
; ---------------------------------------------------------------------------

loc_24354::				; CODE XREF: sub_2433E:loc_2434Fj
		xor	dh, dh
		in	al, dx
		xor	ah, ah
		mov	byte ptr cs:word_23062,	al
		cmp	byte ptr cs:word_23059[bx], 0Ah
		jnz	loc_24369
		mov	al, 67h	; 'g'
		out	0A0h, al	; PIC 2	 same as 0020 for PIC 1

loc_24369::				; CODE XREF: sub_2433E+25j
		shl	bx, 1
		mov	di, cs:word_2304F[bx]
		shr	bx, 1
		xor	ax, ax
		mov	es, ax
		mov	ax, es:[di]
		mov	cs:word_2305E, ax
		mov	ax, es:[di+2]
		mov	cs:word_23060, ax
		mov	ax, offset loc_242F5
		mov	es:[di], ax
		mov	ax, cs
		mov	es:[di+2], ax
		mov	ah, byte ptr cs:word_2304A[bx]
		not	ah
		mov	al, ah
		and	al, 0FEh
		out	dx, al
		mov	cs:word_23062+1, 0
		mov	al, 40h	; '@'
		call	sub_24311
		mov	al, 7Fh	; ''
		call	sub_24311
		mov	al, 80h	; ''
		call	sub_24311
		mov	al, 1
		call	sub_24311
		call	sub_24311
		push	bx
		mov	bx, 3
		call	sub_21774
		pop	bx
		cmp	cs:word_23062+1, 1
		jz	loc_24401
		mov	dx, cs:word_21723
		add	dx, 0Eh
		in	al, dx
		mov	al, 0D0h ; 'Ð'
		call	sub_24311
		mov	al, 20h	; ' '
		out	20h, al		; Interrupt controller,	8259A.
		mov	dl, byte ptr cs:word_23044[bx]
		xor	dh, dh
		mov	al, byte ptr cs:word_23062
		out	dx, al
		mov	ax, cs:word_2305E
		mov	es:[di], ax
		mov	ax, cs:word_23060
		mov	es:[di+2], ax
		inc	bx
		jmp	loc_24347
; ---------------------------------------------------------------------------

loc_243FC::				; CODE XREF: sub_2433E+13j
		mov	ax, 0FFFFh
		stc
		retn
; ---------------------------------------------------------------------------

loc_24401::				; CODE XREF: sub_2433E+8Bj
		mov	dl, byte ptr cs:word_23044[bx]
		xor	dh, dh
		mov	al, byte ptr cs:word_23062
		mov	ah, byte ptr cs:word_2304A[bx]
		not	ah
		and	al, ah
		out	dx, al
		mov	al, 0D3h ; 'Ó'
		call	sub_24311
		mov	cs:word_23042, bx
		mov	al, byte ptr cs:word_23059[bx]
		xor	ah, ah
		clc
		retn
sub_2433E	endp


; =============== S U B	R O U T	I N E =======================================


sub_24429	proc near		; CODE XREF: sub_23069+40p
					; sub_24429+33j
		mov	dx, cs:word_21723
		add	dx, 6
		mov	al, 1
		out	dx, al		; XT Expansion chassis address register	(low byte)
		mov	bx, 1
		call	sub_21774
		mov	al, 0
		out	dx, al
		mov	cx, 0C8h ; 'È'

loc_24440::				; CODE XREF: sub_24429+24j
		mov	dx, cs:word_21723
		add	dx, 0Eh
		in	al, dx
		test	al, 80h
		jnz	loc_24460
		loop	loc_24440

loc_2444F::				; CODE XREF: sub_24429+42j
		add	cs:word_21723, 10h
		cmp	cs:word_21723, 300h
		jb	sub_24429
		stc
		retn
; ---------------------------------------------------------------------------

loc_24460::				; CODE XREF: sub_24429+22j
		mov	dx, cs:word_21723
		add	dx, 0Ah
		in	al, dx
		cmp	al, 0AAh ; 'ª'
		jnz	loc_2444F
		mov	bx, 4
		call	sub_21774
		clc
		retn
sub_24429	endp

; ---------------------------------------------------------------------------
word_24475	dw 0			; DATA XREF: sub_24477+34w
					; sub_244C3+Br	...

; =============== S U B	R O U T	I N E =======================================


sub_24477	proc near		; DATA XREF: seg1c75:2098o
		mov	byte ptr cs:word_231B9,	0
		cmp	bx, 0
		jnz	loc_24486

loc_24482::				; CODE XREF: sub_24477+30j
		mov	ax, 0FFFFh
		retn
; ---------------------------------------------------------------------------

loc_24486::				; CODE XREF: sub_24477+9j
		mov	dx, 0Fh
		mov	ax, 4240h
		div	bx
		mov	bx, 100h
		sub	bx, ax
		mov	byte ptr cs:word_231B9+1, bl
		mov	dx, di
		mov	ax, es
		mov	ds, ax
		assume ds:nothing
		mov	cx, 0
		mov	ah, 3Ch	; '<'
		mov	al, 0
		int	21h		; DOS -	2+ - CREATE A FILE WITH	HANDLE (CREAT)
					; CX = attributes for file
					; DS:DX	-> ASCIZ filename (may include drive and path)
		jb	loc_24482
		push	cs
		pop	ds
		assume ds:seg1c75
		mov	cs:word_24475, ax
		mov	cs:word_2328F, 0
		mov	cs:byte_2171D, 1
		call	sub_23233
		mov	ax, 0
		retn
sub_24477	endp


; =============== S U B	R O U T	I N E =======================================


sub_244C3	proc near		; DATA XREF: seg1c75:20AAo
		push	cs
		pop	ds
		xor	cx, cx
		call	sub_23291
		jcxz	loc_244E7
		mov	ah, 40h	; '@'
		mov	bx, cs:word_24475
		lds	dx, dword ptr cs:word_21711+1
		assume ds:seg2608
		add	dx, cs:word_2328F
		int	21h		; DOS -	2+ - WRITE TO FILE WITH	HANDLE
					; BX = file handle, CX = number	of bytes to write, DS:DX -> buffer
		push	cs
		pop	ds
		assume ds:seg1c75
		jb	loc_244EB
		cmp	ax, cx
		jnz	loc_244EB

loc_244E7::				; CODE XREF: sub_244C3+7j
		mov	ax, 0
		retn
; ---------------------------------------------------------------------------

loc_244EB::				; CODE XREF: sub_244C3+1Ej
					; sub_244C3+22j
		mov	bx, cs:word_24475
		mov	ah, 3Eh
		int	21h		; DOS -	2+ - CLOSE A FILE WITH HANDLE
					; BX = file handle
		mov	cs:word_24475, 0
		call	sub_2301E
		mov	al, 0D1h ; 'Ñ'
		call	sub_24311
		mov	cs:byte_2171D, 0
		mov	ax, 0FFFFh
		retn
sub_244C3	endp


; =============== S U B	R O U T	I N E =======================================


sub_2450D	proc near		; DATA XREF: seg1c75:209Eo
		mov	byte ptr cs:word_231B9,	al
		cmp	bx, 0
		jnz	loc_2451A

loc_24516::				; CODE XREF: sub_2450D+27j
		mov	ax, 0FFFFh
		retn
; ---------------------------------------------------------------------------

loc_2451A::				; CODE XREF: sub_2450D+7j
		mov	dx, 0Fh
		mov	ax, 4240h
		div	bx
		mov	bx, 100h
		sub	bx, ax
		mov	byte ptr cs:word_231B9+1, bl
		push	cs
		pop	ds
		mov	bx, 0
		call	sub_21AD7
		jb	loc_24516
		mov	cs:word_2328F, 0
		mov	cx, 1000h
		mov	cs:byte_231B8, 2
		mov	cs:word_231B0, 1000h
		mov	cs:word_2328F, 0
		mov	cs:word_231C3, 0
		mov	cs:word_231B4, 0FFFFh
		mov	cs:word_231B6, 0FFFFh
		call	sub_249B6
		mov	cs:byte_2171D, 1
		call	sub_231C6
		clc
		mov	ax, 0
		retn
sub_2450D	endp


; =============== S U B	R O U T	I N E =======================================


sub_2457A	proc near		; DATA XREF: seg1c75:209Ao
		call	sub_2301E
		mov	cs:byte_2171D, 0
		mov	ah, 3Eh	; '>'
		mov	bx, cs:word_24475
		cmp	bx, 0
		jz	loc_2459C
		int	21h		; DOS -	2+ - CLOSE A FILE WITH HANDLE
					; BX = file handle
		mov	cs:word_24475, 0
		mov	ax, 0
		retn
; ---------------------------------------------------------------------------

loc_2459C::				; CODE XREF: sub_2457A+13j
		mov	ax, 0FFFFh
		retn
sub_2457A	endp


; =============== S U B	R O U T	I N E =======================================


sub_245A0	proc near		; DATA XREF: seg1c75:2096o
		cli
		call	sub_2301E
		xor	bx, bx
		call	sub_21AD7
		jb	locret_24618
		mov	di, offset aRiff ; "RIFF"
		push	cs
		pop	es
		assume es:seg1c75
		mov	bx, 2Ch	; ','
		call	sub_21A3B
		mov	ax, cs:word_242B3
		mov	cs:word_231B4, ax
		mov	ax, cs:word_242B5
		mov	cs:word_231B6, ax
		mov	byte ptr cs:word_231B9,	0
		mov	bx, cs:word_242A3
		mov	dx, 0Fh
		mov	ax, 4240h
		div	bx
		mov	bx, 100h
		sub	bx, ax
		mov	byte ptr cs:word_231B9+1, bl
		mov	cs:word_2328F, 0
		mov	cx, 1000h
		mov	cs:byte_231B8, 2
		mov	cs:word_231B0, 1000h
		mov	cs:word_2328F, 0
		mov	cs:word_231C3, 0
		call	sub_249B6
		mov	cs:byte_2171D, 1

loc_24611::
		call	sub_231C6
		clc
		mov	ax, 0

locret_24618::				; CODE XREF: sub_245A0+9j
		retn
sub_245A0	endp


; =============== S U B	R O U T	I N E =======================================


sub_24619	proc near		; DATA XREF: seg1c75:2094o
		cli
		call	sub_22F0D
		call	sub_2301E
		mov	bx, es:[di+28h]
		add	bx, 2Ch	; ','
		call	sub_22F0D
		call	sub_21AD7
		mov	di, offset aRiff ; "RIFF"
		push	ds
		pop	es
		mov	bx, 2Ch	; ','
		call	sub_21A3B
		mov	ax, cs:word_242B3
		mov	cs:word_231B4, ax
		mov	ax, cs:word_242B5
		mov	cs:word_231B6, ax
		mov	byte ptr cs:word_231B9,	0
		mov	bx, cs:word_242A3
		mov	dx, 0Fh
		mov	ax, 4240h
		div	bx
		mov	bx, 100h
		sub	bx, ax
		mov	byte ptr cs:word_231B9+1, bl
		mov	cs:word_2328F, 0
		mov	cx, 1000h
		mov	cs:byte_231B8, 2
		mov	cs:word_231B0, 1000h
		mov	cs:word_2328F, 0
		mov	cs:word_231C3, 0
		call	sub_249B6
		mov	cs:byte_2171D, 1
		call	sub_231C6
		clc
		mov	ax, 0
		clc
		retn
sub_24619	endp

		assume es:nothing

; =============== S U B	R O U T	I N E =======================================


sub_2469C	proc near		; CODE XREF: sub_229C4+51p
					; DATA XREF: seg1c75:20A4o
		cmp	cs:byte_2171D, 1
		jz	loc_246A5
		retn
; ---------------------------------------------------------------------------
		assume es:seg2608

loc_246A5::				; CODE XREF: sub_2469C+6j
		xor	cx, cx
		cmp	cs:byte_231B8, 2
		jz	loc_246BA
		cmp	cs:byte_231B8, 0Ch
		jz	loc_246BA
		jmp	loc_246BF
; ---------------------------------------------------------------------------
		db  90h	; 
; ---------------------------------------------------------------------------

loc_246BA::				; CODE XREF: sub_2469C+11j
					; sub_2469C+19j
		call	sub_23291
		jcxz	locret_246C2

loc_246BF::				; CODE XREF: sub_2469C+1Bj
		call	sub_247C1

locret_246C2::				; CODE XREF: sub_2469C+21j
		retn
sub_2469C	endp


; =============== S U B	R O U T	I N E =======================================


sub_246C3	proc near		; DATA XREF: seg1c75:202Ao
		cli
		call	sub_2301E
		mov	bx, 0
		call	sub_21AD7
		mov	ax, 0FFFFh
		jb	locret_24712
		mov	bx, cs:word_21726
		mov	ah, 42h	; 'B'
		mov	al, 1
		mov	cx, 0
		mov	dx, 1Ah
		int	21h		; DOS -	2+ - MOVE FILE READ/WRITE POINTER (LSEEK)
					; AL = method: offset from present location
		mov	cs:word_231B0, 1000h
		mov	cs:word_2328F, 0
		mov	cs:word_231C3, 0
		mov	cs:word_231B4, 0
		mov	cs:word_231B6, 0
		mov	byte ptr cs:word_231B9,	0
		call	sub_247C1
		assume es:nothing
		mov	ax, 0

locret_24712::				; CODE XREF: sub_246C3+Dj
		retn
sub_246C3	endp

; ---------------------------------------------------------------------------
unk_24713	db    0			; DATA XREF: sub_247C1+AFo
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
		assume es:nothing

; =============== S U B	R O U T	I N E =======================================


sub_24777	proc near		; DATA XREF: seg1c75:202Co
		cli
		call	sub_22F0D
		call	sub_2301E
		mov	bx, 0FF00h
		call	sub_21AD7
		les	di, dword ptr cs:word_21711+1
		assume es:nothing
		mov	bx, 1Ah
		call	sub_21A3B
		mov	cs:word_231B0, 1000h
		mov	cs:word_2328F, 0
		mov	cs:word_231C3, 0
		mov	cs:word_231B4, 0
		mov	cs:word_231B6, 0
		mov	byte ptr cs:word_231B9,	0
		call	sub_247C1
		mov	ax, 0
		retn
sub_24777	endp

; ---------------------------------------------------------------------------
		db    0
		db    0
		assume es:seg2608

; =============== S U B	R O U T	I N E =======================================


sub_247C1	proc near		; CODE XREF: sub_2469C:loc_246BFp
					; sub_246C3+49p ...
		push	cs
		pop	ds
		mov	cs:byte_2171D, 1
		mov	cx, cs:word_231B0
		jcxz	loc_247E8
		les	di, dword ptr cs:word_21711+1
		assume es:nothing
		add	di, cs:word_2328F
		mov	al, 0
		cmp	byte ptr cs:word_231B9,	0
		jnz	loc_247E6
		mov	al, 80h	; ''

loc_247E6::				; CODE XREF: sub_247C1+21j
		rep stosb

loc_247E8::				; CODE XREF: sub_247C1+Dj
		mov	ax, cs:word_231B4
		or	ax, cs:word_231B6
		jnz	loc_2482B
		cmp	cs:word_231C3, 0
		jnz	loc_2482B
		test	cs:byte_2301D, 1
		jz	loc_24812
		mov	cs:byte_2301D, 0
		mov	al, 0D0h ; 'Ð'
		call	sub_24311
		mov	al, 5
		out	0Ah, al		; DMA controller, 8237A-5.
					; single mask bit register
					; 0-1: select channel (00=0; 01=1; 10=2; 11=3)
					; 2: 1=set mask	for channel; 0=clear mask (enable)

loc_24812::				; CODE XREF: sub_247C1+40j
		mov	bx, 1
		push	cs
		pop	es
		assume es:seg1c75
		mov	di, offset byte_231B8
		call	sub_21A3B
		cmp	ax, 1
		jnz	loc_24864
		mov	bx, 3
		mov	di, offset word_231B4
		call	sub_21A3B

loc_2482B::				; CODE XREF: sub_247C1+30j
					; sub_247C1+38j
		cmp	cs:byte_231B8, 0Ch
		jz	loc_2487C
		cmp	cs:byte_231B8, 3
		jz	loc_2489D
		cmp	cs:byte_231B8, 8
		jz	loc_24869
		cmp	cs:byte_231B8, 9
		jnz	loc_2484E
		jmp	loc_2493C
; ---------------------------------------------------------------------------

loc_2484E::				; CODE XREF: sub_247C1+88j
		cmp	cs:byte_231B8, 2
		jnz	loc_24859
		assume es:nothing
		jmp	loc_24992
; ---------------------------------------------------------------------------
		assume es:seg1c75

loc_24859::				; CODE XREF: sub_247C1+93j
		cmp	cs:byte_231B8, 1
		jnz	loc_24864
		jmp	loc_248E1
; ---------------------------------------------------------------------------
		db  90h	; 
; ---------------------------------------------------------------------------

loc_24864::				; CODE XREF: sub_247C1+5Fj
					; sub_247C1+9Ej
		call	sub_2301E
		stc
		retn
; ---------------------------------------------------------------------------

loc_24869::				; CODE XREF: sub_247C1+80j
		mov	bx, cs:word_231B4
		push	cs
		pop	es
		mov	di, offset unk_24713
		call	sub_21A3B
		sub	cs:word_231B4, ax
		retn
; ---------------------------------------------------------------------------

loc_2487C::				; CODE XREF: sub_247C1+70j
		mov	cx, cs:word_231B0
		sub	cs:word_231B4, cx
		sbb	cs:word_231B6, 0
		jnb	locret_2489C
		mov	cs:word_231B4, 0
		mov	cs:word_231B6, 0

locret_2489C::				; CODE XREF: sub_247C1+CBj
		retn
; ---------------------------------------------------------------------------

loc_2489D::				; CODE XREF: sub_247C1+78j
		call	sub_2301E
		mov	cs:byte_2171D, 1
		mov	bx, 2
		mov	di, offset word_231B4
		mov	cs:word_231B6, 0
		push	cs
		pop	es
		call	sub_21A3B
		mov	bx, 1
		mov	di, (offset word_231B9+1)
		call	sub_21A3B
		mov	cx, 1000h
		les	di, dword ptr cs:word_21711+1
		assume es:nothing
		xor	al, al
		cmp	byte ptr cs:word_231B9,	0
		jnz	loc_248D5
		mov	al, 80h	; ''

loc_248D5::				; CODE XREF: sub_247C1+110j
		rep stosb
		call	sub_231C6
		mov	cs:byte_231B8, 0Ch
		retn
; ---------------------------------------------------------------------------
		assume es:seg1c75

loc_248E1::				; CODE XREF: sub_247C1+A0j
		mov	bx, 1
		mov	di, (offset word_231B9+1)
		push	cs
		pop	es
		call	sub_21A3B
		mov	bx, 1
		mov	di, offset word_231B9
		call	sub_21A3B
		sub	cs:word_231B4, 2
		sbb	cs:word_231B6, 0
		mov	cs:word_231B0, 1000h
		mov	cs:word_2328F, 0
		mov	cs:byte_231B8, 2
		call	sub_249B6
		assume es:nothing
		call	sub_231C6
		retn
; ---------------------------------------------------------------------------
unk_2491C	db    0			; DATA XREF: sub_247C1+17Eo
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
; ---------------------------------------------------------------------------

loc_2493C::				; CODE XREF: sub_247C1+8Aj
		mov	bx, 2
		mov	di, offset unk_2491C
		push	cs
		pop	es
		assume es:seg1c75
		call	sub_21A3B
		mov	bx, es:[di]
		mov	dx, 0Fh
		mov	ax, 4240h
		div	bx
		mov	bx, 100h
		sub	bx, ax
		mov	byte ptr cs:word_231B9+1, bl
		mov	bx, 1
		mov	di, offset word_231B9
		call	sub_21A3B
		mov	bx, 0Dh
		call	sub_21A3B
		sub	cs:word_231B4, 10h
		sbb	cs:word_231B6, 0
		mov	cs:word_231B0, 1000h
		mov	cs:word_2328F, 0
		mov	cs:byte_231B8, 2
		call	sub_249B6
		call	sub_231C6
		retn
; ---------------------------------------------------------------------------
		assume es:nothing

loc_24992::				; CODE XREF: sub_247C1+95j
		call	sub_249B6
		mov	ax, cs:word_231B0
		sub	cs:word_231C3, ax
		jnb	locret_249B5
		mov	cs:word_231C3, 0
		mov	cs:word_231B4, 0
		mov	cs:word_231B6, 0

locret_249B5::				; CODE XREF: sub_247C1+1DDj
		retn
sub_247C1	endp

		assume es:seg1c75

; =============== S U B	R O U T	I N E =======================================


sub_249B6	proc near		; CODE XREF: sub_2450D+5Cp
					; sub_245A0+68p ...
		mov	bx, cs:word_231B0
		cmp	cs:word_231B6, 0
		jnz	loc_249CF
		cmp	bx, cs:word_231B4
		jbe	loc_249CF
		assume es:nothing
		mov	bx, cs:word_231B4
		assume es:seg1c75

loc_249CF::				; CODE XREF: sub_249B6+Bj
					; sub_249B6+12j
		mov	ax, 0
		cmp	bx, 0
		jz	loc_249E4
		les	di, dword ptr cs:word_21711+1
		assume es:nothing
		add	di, cs:word_2328F
		call	sub_21A3B

loc_249E4::				; CODE XREF: sub_249B6+1Fj
		add	cs:word_231C3, ax
		sub	cs:word_231B4, ax
		sbb	cs:word_231B6, 0
		retn
sub_249B6	endp

; ---------------------------------------------------------------------------
unk_249F5	db  30h	; 0		; DATA XREF: seg1c75:60FCo
		db  31h	; 1
		db  32h	; 2
		db  33h	; 3
		db  34h	; 4
		db  35h	; 5
		db  36h	; 6
		db  37h	; 7
		db  38h	; 8
		db  39h	; 9
		db  41h	; A
		db  42h	; B
		db  43h	; C
		db  44h	; D
		db  45h	; E
		db  46h	; F
; ---------------------------------------------------------------------------
		pushf
		cld
		push	ax
		push	bp
		push	bx
		push	cx
		push	dx
		push	di
		push	ds
		push	es
		push	cs
		pop	ds
		push	ax
		mov	ax, 0A0h ; ' '
		mov	dx, 0
		mov	cl, bh
		mov	ch, 0
		mov	bh, 0
		mul	bx
		add	ax, cx
		add	ax, cx
		mov	di, ax
		mov	ax, 0B000h
		mov	es, ax
		assume es:nothing
		pop	dx
		mov	bx, offset unk_249F5
		mov	bp, 4

loc_24A32::				; CODE XREF: seg1c75:6112j
		mov	cl, 4
		rol	dx, cl
		mov	al, dl
		and	al, 0Fh
		xlat
		mov	ah, 7
		stosw
		dec	bp

loc_24A3F::
		cmp	bp, 0
		jnz	loc_24A32
seg1c75		ends
		end
