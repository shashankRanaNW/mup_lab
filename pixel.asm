.model tiny
.486

.data

.code
.startup

 Mov      al, 12h

              mov      ah, 0

              int         10h     ; set graphics video mode.

              mov      al, 1101b

              mov      cx, 0
            MOV BH.0
              mov      dx, 0

              mov      ah, 0ch

              int         10h     ; set pixel.

    mov      ah,07h
x1: int         21h
    cmp       al,'f'
    jnz         x1

.EXIT
END