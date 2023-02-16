.model tiny 
.486
.data 
array1 dw 2304h,8923h,0AB34H,1234H,8439H,5a23h
res     DB 4 DUP(?)
count equ 6
.CODE 
.STARTUP
	lea si,array1
	lea ebx,si
	mov cl,count
x3: lea eax,si
	cmp ebx,eax
	jge x2
x4:	inc si
	dec cl
	jnz x3
	jmp x1
	
	
x2: mov eax,[si]	
   jmp x4


x1:	mov res,eax

