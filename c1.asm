.model  tiny
.486
.data
orgdis  db      ?
endrow  db      25
dat1    db      45 dup(0)
off1    db      0
off2    db      0ah
cnt1    db      40
filen   db      11 dup(0)
.code
.startup
        mov     ah,0fh
        int     10h
        mov     orgdis,al
        mov     ah,00
        mov     al,03
        int     10h
        mov     dh,0
        mov     dl,0
        lea     si,dat1
x2:     mov     ah,02
        int     10h
        mov     ah,07
        int     21h
        mov     bh,0
        cmp     al,0dh
        jz      x1
        mov     [si],al
        inc     si
        mov     ah,09
        mov     bl,0dh
        mov     cx,1
        int     10h
        dec     cnt1
        jz      x1
        inc     dl
        cmp     dl,off2
        jb      x2
        inc     dh
        inc     off1
        mov     dl,0
        add     dl,off1
        mov     al,off1
        add     al,0ah
        mov     off2,al
        jmp     x2
x1:     mov     ah,0
        mov     al,orgdis
        int     10h
        lea     si,dat1
        lea     di,filen
        mov     cx,10
   rep  movsb
        mov     ah,3ch
        lea     dx,filen
        mov     al,20h
        int     21h
        mov     al,02
        lea     dx,filen
        mov     ah,3dh
        int     21h
        mov     bx,ax
        mov     cl,40
        sub     cl,cnt1
        sub     cl,0ah
        mov     ch,0
        lea     dx,dat1
        add     dx,0ah
        mov     ah,40h
        int     21h
        mov     ah,3eh
        int     21h

.exit
end
