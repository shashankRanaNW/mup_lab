.model	tiny
.486

.data

str1	db 	"abcdefghijklmnopqrstuvwxyz "
cnt		db	26
cocnt	db 	?
msb     db ' '
lsb     db ' '
hexc	dw	0h
decc	dw	0h

cout    MACRO   A
        PUSH    AX
        PUSH    DX
        MOV     AH, 02h
        MOV     DL, A
        INT     21h
        POP     DX
        POP     AX
        ENDM

hexDec		MACRO	hex
		PUSH	AX
		PUSH	BX
		PUSH 	cx
		MOV 	CX, 0h
		mov 	bx, 0h
		MOV		AX,	hex
		DIV		100
		MOV		BL,	AL
		SHR		AX,	8
		CBW
		DIV 	10
		MOV		CH,	AL
		SHR		CH, 4
		SHL		BX, 8
		SHR 	AX, 8
		ADD		BX, CX
		ADD 	BX, AX
		MOV 	decc, BX
		MOV decc, BX
		POP CX
		POP BX
		POP AX
		ENDM


.code
.startup
		lea		si,str1
		movzx 	cx,cnt
x1:		lodsb
		cmp		al,'a'
		je		x6
		cmp		al,'e'
		je		x6
		cmp		al,'i'
		je		x6
		cmp		al,'o'
		je		x6
		cmp		al,'u'
		je		x6
		cmp		al,' '
		je 		x6
		inc 	byte ptr cocnt		
x6:		loop	x1

		mov 		AX, 	cocnt
		MOV			hexc,	AX
		hexDec		hexc

		mov AX, decc

		mov bl, AL
		mov bh, 0f0h
		and bh, bl
		and bl, 0fh
		ror bh, 4
		or  bh, 30h
		or  bl, 30h
        MOV msb, bh
        MOV lsb, bl
		cout    msb
		cout    lsb
.exit
end