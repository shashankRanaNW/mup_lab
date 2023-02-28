.model tiny
.486

.data

str1    db "f f f and f "  
cnt     dw  12

.code
.startup

    MOV SI, OFFSET str1
    MOV CX,cnt
    MOV DX,0h

X0: 
    MOV     AL, [SI]

    CMP   AL,'a'
    JE     X1

    CMP   AL,'e'
    JE     X1

    CMP   AL,'i'
    JE     X1

    CMP   AL,'o'
    JE     X1

    CMP   AL,'u'
    JE     X1

    CMP   AL,' '
    JE     X1
    INC DX 
X1: 
    INC SI
    DEC CX
    JNZ X0

    MOV AX, DX
    MOV BL, 100
    DIV BL
    MOV CL, AL

    MOV AL, AH
    MOV AH, 0h
    MOV BL, 10
    DIV BL
    MOV CL, AL

    ;CL-1
    ;AL-1
    ;AH-4

    MOV DH, CL
    MOV CH, AL
    MOV BH, AH

    ;DH -MSB
    ;CH -Middle
    ;BH -LSD

    MOV AH, 02h
    MOV DL, DH
    OR DL, 030h
    INT 21h

    MOV DL, CH
    OR DL, 030h
    INT 21h
    MOV DL, BH
    OR DL, 030h
    INT 21h
    
.EXIT
END