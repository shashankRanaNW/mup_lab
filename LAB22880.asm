.model tiny
.486
.data
; data segment
count1  EQU 32H
VAL1    EQU 0030H
DAT1    DB  45H, 67H, 100, 'A'
WRD     DW  10H, 3500H, 0910H
DAT2    DD  0902H
DAT3    DW  2 DUP(0)
DAT4    DB  56H
RES     DB  10 DUP(?)
DWRD    DD  01020304H

.code
.startup
     MOV SI, DAT3
	 MOV AL, DAT1+1
	 MOV BX, WORD PTR DAT1+4
	 ADD BX,120H
	 MOV AL,[BX]
	 LEA BX, DAT4
	 MOV AL, [BX]
	 MOV BX, VAL1
	 MOV AL, FS:[BX]
	 MOV EBX,DWRD
.exit
end
