.model TINY
.486

.DATA

dat1 db ?

.CODE
.STARTUP

    mov ah,08
    int 21h
    mov dat1,AL
.exit
end