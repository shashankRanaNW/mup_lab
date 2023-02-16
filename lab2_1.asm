.model tiny
.486
.data
arr1	dd	00000032,12345678,00000500
cnt1	equ	3
dwrd	dd	2 DUP(0)
.code
.startup
	mov ebx,arr1	
	lea	si,arr1
	cmp [si],[si+2]
	jle x1
	mov eax,[si]
	cmp [si],[si+4]
	jle x2
	mov eax,[si]
x1: mov eax, [si+2]
	cmp [si+2],[si+4]
	jle x2	
x2:	mov eax,[si+4]
.exit
end
