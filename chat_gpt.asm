.MODEL TINY
.486

.DATA

loc1    DB  "Purab Nandi,Manish Gupta,Abhijit Pethe,"
COUNT   DW  3
firs1   DB  100 DUP(' ')
sec1    DB  100 DUP(' ')

.CODE
.STARTUP

    MOV SI, OFFSET loc1
    MOV DI, OFFSET  firs1
    MOV BP, OFFSET  firs1
    MOV SP, OFFSET  sec1
    MOV CX, COUNT
    MOV AL, ' '
    MOV AH, ','
    JMP X1

firsn:
    MOV [DI], '$' ; add null terminator to firs1
    INC SI
    MOV SP,DI
    MOV DI,BP
    DEC CX
    JZ  X3

X1: CMP AL,[SI]
    JE secn
    MOVSB
    JMP X1

secn:
    MOV [DI], '$' ; add null terminator to sec1
    INC SI
    MOV BP,DI
    MOV DI,SP
X2: CMP AH,[SI]
    JE firsn
    MOVSB
    JMP X2

X3: 
    MOV [DI], '$' ; add null terminator to sec1
    ; exit the program here
    JMP $

.END
