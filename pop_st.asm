.model tiny
.486

.data

.code
.startup

    MOV AX,1
    MOV BX,2
    MOV CX,3
    MOV DX,4

    PUSH AX
    PUSH BX
    POP SP
    PUSH DX

.EXIT
END