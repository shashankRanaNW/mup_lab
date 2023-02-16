;Question 2 
;Write an ALP to scan a string stored from memory location labeled 
;ARRI for blank spaces and replace every blank space in the string 
;with a A 
;The size of the array is stored at location with label CNT. 

.MODEL TINY
.486

.DATA

ARR1    DB  'a','b','c','d',' ','1','2'
COUNT   DW  7h

.CODE
.STARTUP

    MOV CX, COUNT
    MOV AL,' '
    MOV DI, OFFSET ARR1
X1: SCASB
    JNZ X2
    MOV BX, DI
    DEC BX
    MOV AH, '^'
    MOV [BX],AH
X2: DEC CX
    JNZ X1

.EXIT
END