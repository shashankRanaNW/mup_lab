.MODEL TINY
.486

.DATA

origVid DB  ?
currRow DB  ?
filn    DB  "monc.txt",0
handl   DW  ?
char    DB  ?

.CODE
.STARTUP

    ;getting video mode
    MOV AH, 0Fh
    INT 10h
    MOV origVid,    AL

    ;setting video mode
    MOV AH,0
    MOV AL, 03h
    INT 10h

    ;move cursor to the begining
    MOV currRow,    0

X1: MOV AH, 02h
    MOV DL, 0
    MOV DH, currRow
    MOV BH, 0
    INT 10h

    ;writing blue background
    MOV AH, 09h
    MOV AL, ' '
    MOV BH, 0b
    MOV BL, 00010100b
    MOV CX, 80
    INT 10h

    INC currRow
    CMP currRow,    25
    JNZ X1

    ;open file 
    MOV AH, 3Dh
    MOV AL, 2
    MOV DX, OFFSET filn
    INT 21h
    MOV handl,  AX

    ;moving the cursor of file
    MOV AH, 42h
    MOV AL, 2
    MOV BX, handl
    MOV CX, 0ffffh
    MOV DX, 0ffffh
    INT 21h

    ;reading the char
    MOV AH, 3Fh
    MOV BX, handl
    MOV DX, OFFSET char
    INT 21h

    ;moving the cursor to the last row
    MOV AH, 02h
    MOV DH, 24
    MOV DL, 0
    MOV BH, 0
    INT 10h

    ;writing the char
    MOV AH, 09h
    MOV AL, char
    MOV BH, 0
    MOV BL, 00011010b
    MOV CX, 10
    INT 10h

    MOV AH, 07h
X2: INT 21h
    CMP AL,'%'
    JNZ X2

.EXIT
END