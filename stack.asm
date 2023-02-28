.model tiny
.486

.data

arr1    dw  0h, 01h, 02h, 03h, 04h, 05h, 06h, 07h, 08h
count   dw  8h
arr2    dw  8 DUP(0h)

.code
.startup

    MOV CX, count
    MOV SI, OFFSET  arr1
X1: LODSW
    PUSH AX
    LOOP X1
    PUSH 1234h

    MOV CX, count
    ADD CX, 01h
    MOV     DI, OFFSET  arr2
X2: POP AX
    STOSW
    LOOP X2

.EXIT
END