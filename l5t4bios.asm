.model TINY
.486

.DATA

orgn    db  1 DUP(?)
recX    db  1 DUP(?)
recY    db  1 DUP(?)
recW    db  1 DUP(?)
recH    db  1 DUP(?)
curW    db  1 DUP(?)
curH    db  1 DUP(?)
col     db  1 DUP(?)

.CODE
.STARTUP
    
    ; get orginal video mode and store in location orgn
    mov     ah,0fh
    int     10h
    mov     orgn,al

    ;setting the graphical mode
    MOV AH, 0h
    MOV AL, 12h
    INT 10h

    ;biggest rect
    MOV recX,   0
    MOV recY,   0
    MOV recW,   150
    MOV recH,   250
    MOV col,    0Eh
    CALL draw_rect

    ;inner green
    MOV recX,   20
    MOV recY,   20
    MOV recW,   110
    MOV recH,   210
    MOV col,    00h

    CALL draw_rect

    ;inner
    MOV recX,   40
    MOV recY,   40
    MOV recW,   70
    MOV recH,   170
    MOV col,    03h

    CALL draw_rect

    ;inner
    MOV recX,   60
    MOV recY,   60
    MOV recW,   30
    MOV recH,   130
    MOV col,    0Fh

    CALL draw_rect

    ;inner
    MOV recX,   80
    MOV recY,   120
    MOV recW,   10
    MOV recH,   10
    MOV col,    04h

    CALL draw_rect

    ;blocking function of 'f'
x3: mov     ah,07h
    int     21h
    cmp     al,'f'
    jnz     x3

    ;setting back the original disp mode
    mov     al,orgn
    mov     ah,0
    int     10h

.EXIT

draw_rect PROC NEAR
    MOV curW, 0
    MOV curH, 0
    PUSHA

    ;prints the pixel at the curH/curW offset and with reference to recX/recY
X1: MOV AH, 0Ch
    MOV AL, col
    MOV CL, recX
    ADD CL, curW
    MOV CH, 0
    MOV DL, recY
    ADD DL, curH
    MOV DH, 0
    INT 10h

    ;inc current W
    INC curW
    MOV AH, curW
    CMP AH, recW
    JNZ X1

    ;now we are done with a row

    ;resetting curW 0 for a new row
    MOV curW, 0
    INC curH
    MOV AH, curH
    CMP AH, recH

    JNZ X1

    ;done with all rows and columns
    POPA
    RET

draw_rect   ENDP
END