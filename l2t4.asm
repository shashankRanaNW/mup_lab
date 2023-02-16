.model tiny
.486
.data
ARRAY1 DW 0103h, 2904h, 1004h, 1102h, 0806h
COUNT  DB 5
NEG1   DB 0
.CODE
.STARTUP
     lea si, ARRAY1
	 mov cl, COUNT
	 dec cl
	 mov eax,[si]
X1:  cmp eax, 0000h
     jl X2
	 dec cl
	 jnz X1
X2:  inc NEG1
     dec cl
     jnz X1
.exit
end	 
      	 
