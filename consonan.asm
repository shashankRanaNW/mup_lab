.model tiny
.486

.data

str1    db "heena neena aur kareena"  
cnt     dw  23

.code
.startup

    MOV SI, OFFSET str1
    MOV CX,cnt
    MOV DX,0h
    
    MOV     AL, [SI]

X0: CMP   AL,'a'
    JNE     X1
    INC     DX

X1: CMP   AL,'e'
    JNE     X2
    INC DX

X2: CMP   AL,'i'
    JNE     X3
    INC DX

X3: CMP   AL,'o'
    JNE     X4
    INC DX

X4: CMP   AL,'u'
    JNE     X5
    INC DX

X5: CMP   AL,' '
    JNE X6
    INC DX

X6: DEC CX
    INC SI

    JNZ X0

    MOV CX, cnt
    SUB CX, DX
    MOV BL, DL
    MOV BH, DL
    AND BH, 0F0h
    ROR BH, 4
    OR  BH, 30h
    AND BL, 0fh
    OR  BL, 30h

    MOV AH, 02h
    MOV DL, BH
    INT 21h
    MOV DL, BL
    INT 21h

.EXIT
END