.model tiny
.486

.data

str1    db "we are taught you must blame your parents your sisters your brothers the school the teachers  but never blame yourself it is never your fault but it is always your fault because if you wanted to change you are the one who has got to change "  
cnt     dw  239

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

    MOV CX,DX
    MOV AX, 0h

X2: ADD AL, 01h
    DAA
    CMP AL, 0h
    JNE  X3
    INC AH
X3: LOOP X2

    MOV CL, AL

    MOV BH, AH
    AND AH, 0Fh
    AND BH, 0F0h
    SHR BH, 4
    OR  BH, 30h
    OR  AH, 30h
    MOV DH, AH

    MOV AH, 02h
    MOV DL, BH
    INT 21h

    MOV DL, DH
    INT 21h

    MOV BL, CL
    MOV BH, CL
    AND BH, 0F0h
    SHR BH, 4h
    OR  BH, 30h
    AND BL, 0Fh
    OR  BL, 30h

    MOV AH, 02h
    MOV DL, BH
    INT 21h

    MOV DL, BL
    INT 21h
    
.EXIT
END