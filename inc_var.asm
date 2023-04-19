.model tiny
.486

.data

count   db  10

.code
.startup

    INC count
    MOV BX, OFFSET count
    INC [BX]

.EXIT
END