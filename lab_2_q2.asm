;lab 2 q 2
;write a program to add 2 16 byte numbers

.model tiny
.386

.data
NUM1	DW	0001h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h, 0000h
NUM2	DW	0ffffh, 0ffffh, 0ffffh, 0ffffh, 0ffffh, 0ffffh, 0ffffh, 0ffffh
COUNT	DW	08h
;remember that the left most word is the lsb word not the msb word, as the 16 byte number will be stored
;as in little endian form

.code
.startup

	mov	DI, OFFSET NUM1
	mov	SI, OFFSET NUM2
	MOV	CX, COUNT
	MOV AX, 00h

X1:	MOV	AX,[SI]
	ADC	[DI],AX
	MOV AX, [DI]
	INC	DI
	INC	DI
	INC	SI
	INC	SI
	DEC	CX
	JNZ	X1
	JNC	X2
	MOV	AX,01h
	MOV	[DI],AX
X2:	MOV	CX,6969h

.exit
end