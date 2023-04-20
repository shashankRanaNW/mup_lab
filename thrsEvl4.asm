.MODEL TINY
.486

.DATA

filn    DB  "thurs4.txt",0
hand    DW  1 DUP('a')          ; takes space of whole word, in little endian ofc
countH  DW  0
countL  DW  0
text    DB  1000 DUP(0)
textR   DB  1000 DUP('$')
currC   DW  0
dat1	db	0Dh,0Ah,"I am in love with her and I feel fine", 0Dh, 0Ah
cnt1	dw	41

.CODE
.STARTUP
    
    ;open the file
    MOV AH, 3Dh
    LEA DX, filn
    ;opened the file for read/write
    MOV AL, 2
    INT 21h
    MOV hand,   AX

    ;moving the cursor to the end
    MOV AH, 42h
    MOV AL, 2
    MOV BX, hand
    MOV CX,0
    MOV DX,0
    INT 21h

    ;Storing the current cursor position
    MOV countH, DX
    MOV countL, AX

    ;move cursor to the beginning
    MOV AH, 42h
    MOV AL, 0
    MOV BX, hand
    MOV CX, 0
    MOV DX, 0
    INT 21h

    ;reading characters and storing
    MOV AH, 3Fh
    MOV BX, hand
    MOV CX, countL
    LEA DX, text
    INT 21h;

    ;reversing and storing
    
    ;setting SI to stat of text
    ;DI to the last char of textR
    LEA SI, text
    LEA DI, textR
    ADD DI, countL
    SUB DI, 1
    MOV currC,  0

X1: MOV AL, [SI]
    MOV [DI],   AL
    INC SI
    DEC DI
    INC currC
    MOV AX, currC
    CMP AX, countL
    JNZ X1

    ;Printing the textR
    MOV AH, 09h
    LEA DX, textR
    INT 21h

;close the file
	MOV	AH, 3Eh
	MOV	BX, hand
	INT 21h

.EXIT
END