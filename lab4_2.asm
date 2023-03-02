;To the file resulting from Task1, 
;append your hostel name and room number. Close the file in the end.

.MODEL TINY
.486

.DATA

filn	db	"shrID.txt",0
host	db	"1 2 ka 4, AH-4",0Dh,0Ah
cnt1	dw	16
hand1	dw	?

.CODE
.STARTUP
;open the file
	MOV	AH, 3Dh
	LEA	DX, filn
	MOV	AL,	2
	INT	21h
	MOV	hand1,	AX
	
;Moving pointer to the end
	MOV AH, 42h
	MOV	BX, hand1
	MOV	AL,	2
	MOV	DX,	0
	MOV	CX,	0
	INT 21h
	
;writing the hostel no
	MOV	AH, 40h
	MOV BX,	hand1
	LEA	DX, host
	MOV CX, cnt1
	INT 21h
	

;close the file
	MOV	AH, 3Eh
    MOV	BX, hand1
	INT 21h
	
.EXIT
END
