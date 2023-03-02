;Open the file you created in Task 2 and read its contents. 
;You can count the number of bytes to be read beforehand. 
;After reading the file, display the data using dos function call 09h. 
;Close the file in the end.

.MODEL TINY
.486

.DATA

filn		db	"shrID.txt",0
hand1		dw	?
fil_len		dw	46	;includes enter chars
fil_cont	db	16 DUP('_')


.CODE
.STARTUP

;open the file
	MOV	AH, 3Dh
	LEA	DX, filn
	MOV	AL,	2
	INT	21h
	MOV	hand1,	AX
	
;reading file

	MOV	AH,	3Fh
	MOV	BX,	hand1
	MOV DX,	OFFSET fil_cont
	MOV CX, fil_len
	INT 21h

;added $ char to make it a string
	MOV SI, 	OFFSET fil_cont
	ADD	SI, 	fil_len
	MOV BL,		'$'
	MOV [SI],	BL
	
;Print the string
	lea	dx, fil_cont
    mov	ah, 09h
    int 21h
	
;close the file
	MOV	AH, 3Eh
    MOV	BX, hand1
	INT 21h
	
.EXIT
END
