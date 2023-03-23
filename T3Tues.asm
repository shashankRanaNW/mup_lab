.model tiny
.486

.DATA

numc    db  ?
filn    db  "tue3.txt",0
hand1   dw  ?
filcont db  10 DUP('$')

.CODE
.STARTUP

;inputting no. of chars to read
    MOV AH, 8h
    INT 21h
    AND AL,0Fh
    MOV numc, AL

;oppening the file
    MOV AH, 3Dh
    MOV AL, 2h
    LEA DX, filn
    INT 21h
    MOV hand1,  AX

;reading first numc chars from the file
    MOV AH, 3Fh
    MOV BX, hand1
    MOV CL, numc
    MOV CH, 0h
    LEA DX, filcont
    INT 21h

;displaying the chars read
    LEA DX, filcont
    MOV AH, 9h
    INT 21h

.EXIT
END