.model tiny
.486

.DATA

filn	db	"mnop.txt",0
dat1	db	0Dh,0Ah,"I am in love with her and I feel fine"
cnt1	dw	39
disp	db	35 dup('$')
hand1	dw	?

.CODE
.STARTUP
	
;create a file
;	MOV	AH, 3Ch
;	MOV	CL, 20h
;	LEA	DX,	filn
;	INT	21h
;done, created the file
	
;open the file
	MOV	ah, 3Dh
	LEA	DX, filn
	MOV	AL,	2
	INT	21h
	MOV	hand1,	AX
	
;writing data
;	MOV	AH, 40h
;	MOV BX,	hand1
;	LEA	DX, dat1
;	MOV CX, cnt1
;	INT 21h
;it starts overwritting the data from beginning of the file
	
;moving the file pointer 
;CX:DX store the offset together in signed form
	MOV AH, 42h
	MOV	BX, hand1
	MOV	AL,	2
	MOV	CX,	0
	MOV	DX,	0
	INT 21h
	
;writing data at the CX th position, after moving the file pointer
	MOV	AH, 40h
	MOV BX,	hand1
	LEA	DX, dat1
	MOV CX, cnt1
	INT 21h

	;delete file
	MOV	AH, 41h
	MOV	DX, OFFSET filn
	INT 21h
	
;close the file
	MOV	AH, 3Eh
	MOV	BX, hand1
	INT 21h
	
.EXIT
END
