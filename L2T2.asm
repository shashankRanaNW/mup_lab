.model tiny
.486
.data
array1 dd 1234abceh, 5678abceh, 65436969h, abcd6996h, 87654321h
count1 db 5
max 1 dd ?
.code
.startup
     lea si, array1
	 mov cl, count1
	 dec cl
	 mov eax ,[si]
x1:	 add si,4
     cmp eax, [si]
     jae x2
	 mov eax, [si]
x2:  dec cl
     jnz x1 
     mov max1,eax
.exit
end
 	 