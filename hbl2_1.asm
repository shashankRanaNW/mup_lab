.model tiny 
.486
.data 
array1 dd 2304h,8923h,0F000AB34H,1234H,8439H,5a23h
res     dd 1 DUP(?)
count equ 6
.CODE 
.STARTUP
	lea si,array1
	mov ebx,[si]
	mov cl,count
x3: mov eax,[si]
	cmp eax,ebx
	jge x2
x4:	add si,4 ;dd=4 byte
	dec cl
	jnz x3
	jmp x1
x2: mov ebx,[si]	;jl signed comparison ,jb unsigned comparison
   jmp x4
x1:	mov res,ebx
.exit
 end
