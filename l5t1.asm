.model tiny
.486

.data

count   db    11
curr    db  0
text    db  "I am Gian, I am so strong, my voice is so melodious, post listening to voice, people get post trauma stress disorder"

.code
.startup

    ;setting up mode
    MOV AH, 0
    MOV AL, 03h
    INT 10h

    ;moving the cursor to the mid row
    MOV AH, 02h
    MOV DH, 13
    MOV DL, 0
    MOV BH, 0
    INT 10h

    MOV SI, OFFSET text

X1: 
    MOV AH, 02h
    MOV DH, 13
    MOV DL, curr
    MOV BH, 0
    INT 10h
    INC curr
    
    LODSB
    MOV AH, 09h
    MOV BH,0
    MOV BL, 00001111b
    MOV CX,1
    INT 10h
    INC SI

    MOV AL, curr
    CMP AL,count
    JNZ X1

    MOV     AH,07h
x2: INT         21h
    cmp       al,'f'
    jnz         x2

.EXIT
END