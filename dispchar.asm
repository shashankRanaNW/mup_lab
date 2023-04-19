.model tiny
.486

.data

.code
.startup

    MOV AH, 09h
    MOV AL,'A'
    MOV BH, 0H
    MOV BL, 10001001b
    MOV CX, 2
    INT 10h

    mov      ah,07h
x1: int         21h
    cmp       al,'f'
    jnz         x1

.exit
end