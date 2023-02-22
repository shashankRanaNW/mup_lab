.model TINY
.486

.DATA

usr1    db  "anupama"
pwd1    db  "anp6969"

usr_max db  0ah
usr_act db  ?
usr_nam db  0bh DUP('$')

pwd_len dw  09h
pwd_etr db  9h DUP('*')

well_pmt    db  "Hello, please enter username",0dh,0ah,'$'
pwd_pmt     db  0dh,0ah,"Enter password fafa",0dh,0ah,'$'
cor_pwd     db  0dh,0ah,"Welcome",0dh,0ah,'$'
wrg_pwd     db  0dh,0ah,"Wrong password",0dh,0ah,'$'
wrg_usr     db  0dh,0ah,"Wrong username",0dh,0ah,'$'


.CODE
.STARTUP

    CLD

    MOV DX, OFFSET well_pmt
    MOV AH, 09h
    INT 21h

    MOV DX, OFFSET usr_max
    MOV AH, 0Ah
    INT 21h

    MOV DX, OFFSET pwd_pmt
    MOV AH, 09h
    INT 21h

    MOV CX, pwd_len
    MOV DI, OFFSET pwd_etr
PWD:MOV AH, 08h
    INT 21h
    STOSB
    MOV AH, 02h
    MOV AL, '*'
    INT 21h
    LOOP PWD

    MOV SI, OFFSET usr1
    MOV DI, OFFSET usr_nam
    MOV AL, usr_act
    CBW
    MOV CX, AX
REPE    CMPSB
    JZ X1
    MOV DX, OFFSET wrg_usr
    MOV AH, 09h
    INT 21h

    
X1: MOV SI, OFFSET pwd1
    MOV DI, OFFSET pwd_etr
    MOV CX, pwd_len
REPE    CMPSB
    JZ X2
    MOV DX, OFFSET wrg_pwd
    MOV AH, 09h
    INT 21h

X2:  MOV DX, OFFSET cor_pwd
    MOV AH, 09h
    INT 21h

.exit
end
