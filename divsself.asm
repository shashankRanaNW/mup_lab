.model tiny
.486

.data

char    db  1 DUP(?)

.code
.startup

    ;set the mode
    MOV AH,0h
    MOV AL,03h
    INT 10h

    ;moving cursor to 0,0 position
    MOV AH, 02h
    MOV DH, 0
    MOV DL, 0
    MOV BH,0
    INT 10h

    ;fill the first 12 rows will blue back ground
    MOV AH, 09h
    MOV AL,' '
    MOV BH, 0h
    MOV BL, 00010111b
    MOV CX, 80*12
    INT 10h

    ;move the cursor to the 12th row
    ;12 cuz the row indexing starts from 0
    MOV AH, 02h
    MOV DH, 12
    MOV DL, 0
    MOV BH, 0
    INT 10h

    ;fill the next 12 rows with yellow background
    MOV AH, 09h
    MOV AL,' '
    MOV BH, 0h
    MOV BL, 00110000b
    MOV CX, 80*13
    INT 10h

    ;taking in the char
    MOV AH, 08h
    INT 21h
    MOV char,AL

    ;printing the char
    MOV AH, 09h
    MOV AL, char
    MOV BH, 0
    MOV BL, 01000001b
    MOV CX, 10
    INT 10h

    ;set cursor to beginning
    MOV AH, 02h
    MOV DH, 0
    MOV DL, 0
    MOV BH, 0
    INT 10h

    ;printing the char
    MOV AH, 09h
    MOV AL, char
    MOV BH, 0
    MOV BL, 01110000b
    MOV CX, 10
    INT 10h

    mov      ah,07h
x1: int         21h
    cmp       al,'f'
    jnz         x1

.exit
END