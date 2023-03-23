.model tiny
.486

.data

    ALIGN 2
D1  Db  "abcde"
D2  db  1h
D3  db  2h

.code
.startup

    MOV AX, OFFSET D1

.exit
END