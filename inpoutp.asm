.model tiny
.486

.DATA

max1    db  32
act1    db  ?
str1    db  32 dup('$')

.CODE
.STARTUP

    LEA     DX, max1
    MOV     AH, 0Ah
    INT     21h

    MOV     AX, OFFSET str1


.EXIT
END