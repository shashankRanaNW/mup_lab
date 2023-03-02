.model tiny
.486

.DATA

filn	db	"mnop.txt",0
dat1	db	"ab to aadat si he mujhko "
cnt1	dw	25
disp	db	35 dup('$')
hand1	dw	?

.CODE
.STARTUP
	
;create a file
	MOV	AH, 3Ch
	MOV	CL, 20h
	LEA	DX,	filn
	INT	21h
;done, created the file
	
;open the file
	MOV	ah, 3Dh
	LEA	DX, filn
	MOV	AL,	2
	INT	21h
	MOV	hand1,	AX
	
;writing data
	MOV	AH, 40h
	MOV BX,	hand1
	LEA	DX, dat1
	MOV CX, cnt1
	INT 21h
;it erases, previous data of the file
	
;moving the file pointer
;CX:DX store the offset together in signed form
	MOV AH, 42h
	MOV	BX, hand1
	MOV	AL,	0
	MOV	DX,	8
	MOV	CX,	0
	INT 21h
	
;writing data at the CX th position, after moving the
;file pointer to 5th position
	MOV	AH, 40h
	MOV BX,	hand1
	LEA	DX, dat1
	MOV CX, cnt1
	INT 21h
	
;moving the file ptr back to beginning
	MOV AH, 42h
	MOV	BX, hand1
	MOV	AL,	0
	MOV	DX,	0
	MOV	CX,	0
	INT 21h

;reading file

	MOV	AH,	3Fh
	MOV	BX,	hand1
	MOV DX,	OFFSET disp
	MOV CX, 35
	INT 21h
	
;close the file
	MOV	AH, 3Eh
    MOV	BX, hand1
	INT 21h
	
.EXIT
END
