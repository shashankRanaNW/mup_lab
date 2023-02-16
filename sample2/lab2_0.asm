.model tiny
.486
.data
arr1	db	"assemblyline"
cnt1	db	12
cnt2	db	0
.code
.startup
	lea	si,arr1
	lea bx,cnt2
	mov cl,cnt1
	mov al,'#'
x1:	cmp al,[si]
	jne x2
	inc byte ptr[bx]
x2:	inc si
	dec cl
	jnz x1
.exit
end