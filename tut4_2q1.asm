;Question 1 
;An interleaved string is stored from displacement 'istrl'. 
;The size of the interleaved string is stored in location 'cntl'. 
;Write an ALP that will separate the interleaved string into two 
;strings as shown. 
;If the interleaved string is "hmeilclroo" it should be separated as 
;two strings "hello" and "micro". 
;You can assume that the strings to be separated will be of equal 
;size. 
;[use string instructions]

.MODEL TINY
.386

.DATA

istr1   DB  "ilnaguoddawleathrsuusnt."
cnt1    DW  24
str1    DB  12 DUP(69h)
str2    DB  12 DUP(42h)

.CODE
.STARTUP

    MOV CX, cnt1
    SHR CX, 1
    MOV SI, OFFSET istr1
    MOV BX, OFFSET str1
    MOV DI, OFFSET str2

L1: LODSB
    MOVSW
    MOV     [BX],AH
    INC     BX
    LOOP    L1

.EXIT
END