.model TINY
.486

.DATA

str1    db  "with a little help from my friends$"
str2    db  "with a little help from my friends$"
wrg     db  "Wrong$"
rght    db  "Correct$"

.CODE
.STARTUP

    CLD
    MOV SI, OFFSET str1
    MOV DI, OFFSET str2
    MOV CX, 34
REPE    CMPSB
    JE X1
    MOV DX, OFFSET wrg
    MOV AH, 09h
    INT 21h

X1: MOV DX, OFFSET rght
    MOV AH, 09h
    INT 21h

.exit
END