.model tiny
.486

.data

str1    dd  1234h  
cnt     dw  23
cons    dw  0h

.code
.startup

    MOV SI, OFFSET str1
    MOV AX, 1235h
    CMP AX, WORD PTR[SI]
    JNE X1

    MOV AH, 02h
    MOV AL, 'y'
    INT 21h

X1: MOV AH, 02h
    MOV AL, 'F'
    INT 21h

.EXIT
END