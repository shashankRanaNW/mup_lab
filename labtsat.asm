.model TINY
.486

.data

stmk    DB  97,96,95,94,90,89,88,86,85,84,83,80,78,
 76,75,73,71,70,65,63,61,59, 43,42, 41,  
 34,32,30,  4,1

amk     DB  20  DUP(69)
bmk     DB  20  DUP(69)
cmk     DB  20  DUP(69)
emk     DB  20  DUP(69)
ncmk    DB  20  DUP(69)

.code
.startup

    MOV CL, 30
    MOV SI, OFFSET  stmk
    MOV DI, OFFSET  amk
    MOV CH, 3

    MOV BL, [SI]
    MOV AL,BL
    STOSB
    DEC CH

X1: INC SI
    MOV AL, [SI]
    SUB BL, AL
    CMP BL, 03
    JA  BMKJ
    STOSB
    MOV BL,AL
    DEC CH
    JNZ X1

BMKJ:MOV DI, OFFSET cmk
    MOV BL, [SI]
    MOV AL,BL
    STOSB
    DEC CH

X2: INC SI
    MOV AL, [SI]
    SUB BL, AL
    CMP BL, 03
    JA  CMKJ
    STOSB
    MOV BL,AL
    DEC CH
    JNZ X2

CMKJ:MOV DI, OFFSET cmk
    MOV BL, [SI]
    MOV AL,BL
    STOSB
    DEC CH

X3: INC SI
    MOV AL, [SI]
    SUB BL, AL
    CMP BL, 03
    JA  DMKJ
    STOSB
    MOV BL,AL
    DEC CH
    JNZ X3

DMKJ:MOV DI, OFFSET dmk
    MOV BL, [SI]
    MOV AL,BL
    STOSB
    DEC CH

X4: INC SI
    MOV AL, [SI]
    SUB BL, AL
    CMP BL, 03
    JA  EMKJ
    STOSB
    MOV BL,AL
    DEC CH
    JNZ X4

EMKJ:MOV DI, OFFSET emk
    MOV BL, [SI]
    MOV AL,BL
    STOSB
    DEC CH

X5: INC SI
    MOV AL, [SI]
    SUB BL, AL
    CMP BL, 03
    JA  NCMKJ
    STOSB
    MOV BL,AL
    DEC CH
    JNZ X5

NCMKJ:
    MOV DI, OFFSET ncmk
    MOV BL, [SI]
    MOV AL,BL
    STOSB
    DEC CH

X4: INC SI
    MOV AL, [SI]
    SUB BL, AL
    CMP BL, 03
    JA  NCMKJ
    STOSB
    MOV BL,AL
    DEC CH
    JNZ X4

.exit
end