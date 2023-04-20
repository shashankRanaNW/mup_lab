.model tiny
.486

.DATA

filn	db	"mnop.txt",0
newfile db "wow.txt", 0

.CODE
.STARTUP

mov ah, 56h
lea dx, filn
lea di, newfile
int 21h


.EXIT
END

	