.model tiny
.486
.data
arr1	dd	00000032,12345678,00000500
cnt1	equ	3
dwrd	dd	2 DUP(0)
.code
.startup
	lea ebx,dwrd	
	lea	si,arr1
	mov eax,si
	inc dword ptr[ebx]
	cmp eax,[si]
	jle x1
	inc dword ptr[ebx] 
	cmp eax,[si]
	jle x2
x1:	mov eax,[si]
	inc dword ptr[ebx] 
	cmp eax,[si]
	jle x2	
x2:	mov eax,[si]
.exit
end
