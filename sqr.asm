.model tiny
.data
att     db      0Eh		;yellow color
strow   dw      20		;starting row number  
; using 16-bit as row & column number have to be given as 16-bit values
stcol   dw      20		;starting column number
enr     dw      22		;ending column number
enc     dw      600		;ending row number
orgn    db      ?		;orginal display attrib

.code
.startup
; get orginal video mode and store in location orgn
        mov     ah,0fh
        int     10h
        mov     orgn,al
;set graphics mode - 12h
        mov     al,12h
        mov     ah,00
        int     10h
;starting row number in dx
;logic uses displays graphic row by row
        mov     dx,strow
;starting column in cx
x2:     mov     cx,stcol
;display one pixel
x1:     mov     al,att
        mov     ah,0ch
        int     10h
;increment pixel column number and check whether end column reached
;if no go to the next column
        inc     cx
        cmp     cx,enc
        jnz     x1
;if all columns in a row display has been completed then 
;increment row number - check if last row is reached
;if reached display completed
;if not go on to stcolumn in the next row and display
        inc     dx
        cmp     dx,enr
        jnz     x2
;blocking function of 'e'
x3:     mov     ah,07h
        int     21h
        cmp     al,'e'
        jnz     x3
		mov     al,orgn
        mov     ah,0
        int     10h

.exit
end