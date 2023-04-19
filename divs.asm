.model  tiny
.data
dat1    db      20h
prev	db		00h
.code
.startup
; to split screen - first set mode to 3 in text
        mov     ah,00h
        mov     al,03h
        int     10h
;move the cursor to row 0 column 0
        mov     ah,02h
        mov     bh,0
        mov     dx,0
        int     10h
;display space in blue background with yellow foreground and no blinking
;attrib will be 00011110 - display 13 * 80 - this fills the upper 13 rows
;ie rows 0 to 12 will be filled with spaces
;hence there will be a blue screen from rows 0 to 12
        mov     al,dat1
        mov     ah,09h
        mov     bh,0
        mov     cx,13*80
        mov     bl,1eh
        int     10h
; move cursor to row 13 column 0
        mov     ah,02h
        mov     bh,0
        mov     dl,0
        mov     dh,13
        int     10h
;fill lower screen with spaces white background bright green foreground
;attrib will be 01111010
; this will fill columns 13 to 24 - with white space
        mov     ah,09h
        mov     al,dat1
        mov     bh,0
        mov     cx,13*80
        mov     bl,7ah
        int     10h
;cursor is moved to row 0 column 0
        mov     ah,02h
        mov     dx,0
        mov     bh,0
        int     10h
;take in user input with no echo - this is necessary to contine with
;the font we want - else when you use int 21h - the OS will use 
;the default font white on black background
x1:     mov		ah,07h
        int		21h
;data is moved into location prev
x2:		mov		prev,al
;data is displyed on row 0 column 0 with attrib as yellow against blue 
;background
		mov		bl,1eh
		mov		bh,0
		mov		cx,01
		mov		ah,09h
		int		10h
;cursor moved to row 13 column 0 
		mov		ah,02h
		add		dh,13
		int		10h
;same data displayed in bright green with white background
		mov		ah,09h
		mov		bl,7ah
		mov		cx,10
		int		10h

;waiting for the user to tell to stop, by pressing f
    mov      ah,07h
x3: int         21h
    cmp       al,'f'
    jnz         x3

.exit
end
