.model tiny
.486

.DATA

max1    db  25
act1    db  ?
inp1    db  26 DUP('$')
str1    db  "123$"
linb    db  0Dh, 0Ah,'$'

.CODE
.STARTUP

    LEA DX, max1
    MOV AH, 0Ah
    INT 21h

;    LEA DX, linb
 ;   MOV AH, 09h
  ;  INT 21h

    LEA DX, inp1
    MOV AH, 09h
    INT 21h

.EXIT
END