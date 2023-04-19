.MODEL TINY
.486

.DATA

origdisp    db  1   DUP(?)
cnt1        db  1   DUP(?)
last        db  1   DUP(?)
secL        db  1   DUP(?)
currCol     db  1   DUP(?)

.CODE
.STARTUP

    ;gets the orig mode
    MOV AH, 0Fh
    INT 10h
    MOV origdisp,   AL

    ;set the mode 03h
    MOV AH, 0h
    MOV AL, 03h
    INT 10h

    MOV cnt1, 0


X1: ;moves the cursor to the origin
    MOV AH, 02h
    MOV DH, cnt1
    MOV DL, 0
    MOV BH, 0
    INT 10h

    ;write the ' ' 40 times in the color required
    MOV AH, 09h
    MOV AL, ' '
    MOV BH, 0
    MOV BL, 00010111b
    MOV CX, 40
    INT 10h

    ;moves the cursor to the 40th column
    MOV AH, 02h
    MOV DH, cnt1
    MOV DL, 40
    MOV BH, 0
    INT 10h

    ;write the ' ' 40 times in the color required
    MOV AH, 09h
    MOV AL, ' '
    MOV BH, 0
    MOV BL, 01000111b
    MOV CX, 40
    INT 10h

    INC cnt1
    MOV AL, 25
    CMP cnt1, AL
    JNZ X1

    ;curr col is 0
    MOV currCol,0

X4: ;reading 1 char sans ECHO
    MOV AH, 08h
    INT 21h
    MOV AH, last
    MOV last,   AL
    MOV secL,   AH

    ;checking for escape char
    CMP AH, '$'
    JNZ X2
    CMP AL, '#'
    JNZ X2
    JMP X3
    ;end program

X2: ;moving to currCol
    MOV AH, 02h
    MOV DH, 0
    MOV DL, currCol
    MOV BH, 0
    INT 10h

    ;typing the char
    MOV AH, 09h
    MOV AL, last
    MOV BH, 0
    MOV BL, 01000001b
    MOV CX, 1
    INT 10h

    ;moving to the 2nd the color
    MOV AH, 02h
    MOV DL, currCol
    ADD DL, 40
    MOV BH, 0
    INT 10h

    ;typing the char
    MOV AH, 09h
    MOV AL, last
    MOV BH, 0
    MOV BL, 00010100b
    MOV CX, 1
    INT 10h

    ;incrementing the column
    INC currCol

    JMP X4

X3: ;the program terminates
    ;resets the display mode
    MOV AH, 0
    MOV AL, origdisp
    INT 10h

.EXIT
END