.model	tiny
.486
.data
str1	db 	"abcdef "
cnt		db	7
cocnt	db 	?
.code
.startup
		lea		si,str1
		movzx 	cx,cnt
x1:		lodsb
		cmp		al,'a'
		je		x6
		cmp		al,'e'
		je		x6
		cmp		al,'i'
		je		x6
		cmp		al,'o'
		je		x6
		cmp		al,'u'
		je		x6
		cmp		al,' '
		je 		x6
		inc 	byte ptr cocnt		
x6:		loop	x1

		mov bl, cocnt
		mov bh, 0f0h
		and bh, bl
		and bl, 0fh
		ror bh, 4
		or  bh, 30h
		or  bl, 30h
		mov dl, bh
		mov ah, 02h
		int 21h
		mov dl, bl
		mov ah, 02h
		int 21h
.exit
end		