;Create a new file of any name and in that file write your name and ID. 
;No. twice on two different lines. Hint: make use of carriage return and line feed ASCII codes. 
;Be sure to close the file.

.model tiny
.486

.DATA

filn	db	"shrID.txt",0
nam1	db	"Shashank Rana",0Dh, 0Ah
cnt1	dw	15							;extra chars for next line char
id		db	"2021A7PS2671G",0Dh, 0Ah
cnt2	dw	15
hand1	dw	?

.CODE
.STARTUP

;create a file
	MOV	AH, 3Ch
	MOV	CL, 20h
	LEA	DX,	filn
	INT	21h
	
;open the file
	MOV	AH, 3Dh
	LEA	DX, filn
	MOV	AL,	2
	INT	21h
	MOV	hand1,	AX
	
;writing data
	MOV	AH, 40h
	MOV BX,	hand1
	LEA	DX, nam1
	MOV CX, cnt1
	INT 21h

;if we write data continuously, the pointer gets moved
;no need to manually move it
;writing id number.
	MOV	AH, 40h
	MOV BX,	hand1
	LEA	DX, id
	MOV CX, cnt2
	INT 21h
	
;close the file
	MOV	AH, 3Eh
    MOV	BX, hand1
	INT 21h

.EXIT
END
