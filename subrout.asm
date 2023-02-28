.model tiny
.486

.data

str1    db  "abcdefg"
count   dw  7

.code
.startup

    MOV SI, OFFSET str1
    MOV CX, count

X1: LODSB
    MOV DL, AL
    CALL cout
    LOOP X1

.EXIT

cout    PROC    NEAR
        MOV AH, 02h
        INT 21h
        RET
cout    ENDP


END
