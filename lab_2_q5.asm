;Write an ALP that will transfer data from ‘ARRAY1’ to ‘ARRAY2’. 
;The number of elements in the array is 10. The array is a double word array. 
;The starting address of ARRAY2 = starting address of ARRAY1 + 20d.

.model small
.386

.data

ARRAY1  DD  69696969h,69696969h,69696969h,69696969h,69696969h,69696969h,69696969h,69696969h,69696969h,69696969h
