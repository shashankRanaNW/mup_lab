.model tiny 
.486
.data
array1 dw 1234h,2367h,3478h,3412h,9898h,5553h,1234h,7834h
array2 dw 3453h,6745h,2389h,3467h,1289h,2425h,2536h,2573h
res  dd 4 dup(?)
count equ 8
.code
.startup
	lea si,array1
	lea di,array2
	mov cl,count
	clc
	lea ax,si
x1: adc ax,[di]
	add si,2
	add di,2 
	dec cl
	jnz x1
.exit
end


