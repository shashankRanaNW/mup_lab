;Write an ALP that will scan a database of 
;grades – the grades are to be stored as follows in 
;memory: Last three digits of the id 
;followed by grade. Only coarse grading is used so valid 
;grades are – A, B, C D, E. For e.g. for 5
; students the storage in memory will be 
; as follows:
;'238', 'A', '211', 'B', '247', 'C', '110','E', '111', 'B'
;The count of students is available in 
;location cnt1. The database of student 
;ids and grades are 
;available from location dat1. Your ALP 
;must find the id of students who have 
;scored an A and 
;store the ids alone starting from location 
;res1. The ALP must also find out how many students 
;have scored an ‘A’ grade and store 
;it in location acnt1.
;The number of students will vary from a 
;minimum of 10 to a maximum of 100. You need to
;demonstrate your ALP only for the minimum number.

.MODEL TINY
.486

.data

cnt1    DB  5h
dat1    DB  '238', 'A', '211', 'A', '247', 'C', '110','E', '111', 'B'
acnt1   DB  0h
res1    DD  0h

.code
.startup

    CLD
    MOV     SI, OFFSET dat1
    MOV     DI, OFFSET res1
    MOV     CL, cnt1

X2: LODSD
    MOV     EBX, 'B'
    SHL     EBX, 24
    CMP     EBX, EAX
    
    JB     X1

    SHL     EAX, 8
    SHR     EAX, 8
    ADD     EAX, 20000000h
    INC     CH
    STOSD
    
X1: DEC     CL
    JNZ     X2


.exit
end