.model 	tiny
.data
curr	db		?
.code
.startup
		mov		ah,0fh		;get the video mode
		int		10h
		mov		curr,al		;save the current mode in location curr
		mov		ah,00
		mov		al,03h		;text mode. 80x25. 16 colours. 8 pages
		int		10h
; pl note: that pages do not work with current displays - you will use only
;page 0
;moving the cursor to the centre of the screen 12th row 40th column
		mov     ah,02H               
        mov     dl,38
		mov     dh,12
		mov     bh,0                  
        int     10H
;display a character at the centre of the screen
		mov		ah,09h		;function to display character
		mov		al,'m'		;character to be displayed is mode
		mov		cx,1		;number of m's to be displayed = 1
		mov		bh,0		;page 0 is where the display takes place
		mov		bl,10001110b
;D7 is 1 so blinking enabled
;D6D5D4 is 000 - so black background
;D3D2D1D0 - 1110 so foreground is yellow
		int 	10h
;mov cursor to row 12 column 39 (i.e) move cursor by one position
;every time you have to display a new character
;cursor has to be moved forward one step
		mov     ah,02H               
       mov     dl,39
		mov     dh,12
		mov     bh,0                  
       int     10H
;display p blinking black background and bright cyan foreground at current
;cursor
		mov		ah,09h		;function to display character
		mov		al,'p'		;character to be displayed is mode
		mov		cx,1		;number of m's to be displayed = 1
		mov		bh,0		;page 0 is where the display takes place
		mov		bl,10001011b
		int 	10h
;D7 is 1 so blinking enabled
;D6D5D4 is 000 - so black background
;D3D2D1D0 - 1011 so foreground is bright cyan
;mov cursor to row 12 column 40 (i.e) move cursor by one position
;every time you have to display a new character
;cursor has to be moved forward one step
		mov     ah,02H               
	    mov     dl,40
		mov     dh,12
		mov     bh,0                  
		int     10H
;display i blinking black background and bright magenta foreground at current
;cursor
		mov		ah,09h		;function to display character
		mov		al,'i'		;character to be displayed is mode
		mov		cx,1		;number of m's to be displayed = 1
		mov		bh,0		;page 0 is where the display takes place
		mov		bl,10001101b
		int		10h
;D7 is 1 so blinking enabled
;D6D5D4 is 000 - so black background
;D3D2D1D0 - 1101 so foreground is bright magenta

		mov     ah,07h
x1:     int     21h
		cmp     al,'f'
        jnz     x1		   	;blocking function - same as single input with 
							;with no echo - % is used to come out of the screen
		mov		ah,00
		mov		al,curr
		int		10h
.exit
end

		