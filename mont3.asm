.model tiny
.486

.DATA

max1    db  20
act1    db  ?
str1    db  20 DUP('$')

filn    db  "mon3.txt",0
hand1   dw  ?

.CODE
.STARTUP

    LEA     DX, max1
    MOV     AH, 0Ah
    INT     21h

    MOV     SI, OFFSET max1
    ADD     SI, 2
    MOV     CL, act1
    SUB     CL, 5
    MOV     CH, 0h
    ADD     SI, CX

    MOV     AH, 3Dh
    MOV     AL, 2
    MOV     DX, OFFSET filn
    INT     21h
    MOV     hand1,  AX

    MOV     AH, 42h
    MOV     AL, 0
    MOV     BX, hand1
    MOV     DX, 0
    INT     21h

    MOV     AH, 40h
    MOV     CX, 5
    MOV     DX, SI
    INT     21h

.EXIT
END