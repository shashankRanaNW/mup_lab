;Write an ALP that will count the number of negative numbers in an array of 16-bit signed data stored from location ‘ARRAY1’. 
;The number of elements in the array is present in location ‘COUNT’. 
;The count of negative numbers must be stored in location ‘NEG1’

.model tiny
.386

.data

ARRAY1  DW  8000h,0000h,7001h,012ah,0bc55h,0000h,0000h,0000h
COUNT   DW  8
NEG1     DW  0200h

.code
.startup

    MOV CX, COUNT
    MOV BX, 0h
    MOV SI, OFFSET ARRAY1
    MOV AX,0h
X2: MOV DI,[SI]
    ADD DI,AX
    JNS X1  
    INC BX
X1: ADD SI,02h
    DEC CX
    JNZ X2
    MOV NEG1,BX

.exit
end
