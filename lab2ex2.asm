.model tiny
.486
.data 
	dat1 db "math", "have", "    ", "bury", "mine", "dine", "    " , "hell", "deep", "tree"
	res1 db 10 dup(?)
	count db 10
.code
.startup
		LEA SI, count
		MOV Cl, [SI]
		LEA SI, dat1
		LEA DI, res1
		MOV DL,0
X0:		MOV EAX, [SI]
		CMP EAX, "    "
		JNE X1
		XOR DL,1 ; acts like flip flop
		JMP X2
X1:		CMP DL,1
		JNE X2
		MOV BH, AL ;to reverse string
		MOV BL, AH
		SHL EBX, 16
		SHR EAX, 16
		MOV BH, AL
		MOV BL, AH
		MOV [DI],EBX
		JMP X3
X2:		MOV [DI],EAX
X3:		ADD SI, 4
		ADD DI, 4
		DEC CL
		JNZ X0		 
.exit
end