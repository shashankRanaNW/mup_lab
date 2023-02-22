.model TINY
.486
.DATA

max1    db  13h ;includes enter key
act1    DB  ?
inp1    db  14h DUP('$') ;1 enter + 1 '$'
disnl   db  0DH,0AH,'$'
.CODE
.STARTUP

    MOV AH, 0Ah
    MOV DX, OFFSET max1
    INT 21h

    lea dx,disnl
    mov ah,09h
    int 21h

    MOV AL, act1
    MOV BL, act1
    OR  AL, 30h
    MOV DL, AL
    MOV AH, 02h
    INT 21h

    lea dx,disnl
    mov ah,09h
    int 21h

    MOV DX, OFFSET inp1;
    MOV AH, 09h
    INT 21h

.exit
end