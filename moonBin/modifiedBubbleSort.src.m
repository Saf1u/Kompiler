org 0
buffer               res     200
stackbase            res     4096
newline              db      ,13,10,0
align
entry
muli r0,r0,0
muli r14,r0,0
addi r14,r0,stackbase
%r14 is stack ptr, stack grows downwards or upwards
%24kb stack
% begin intlit storeage
addi r12,r0,0
sw 32(r14), r12
% done intlit storeage
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
lw r10,32(r14)
muli r9,r12,4
mul r9,r10,r9
add r11,r11,r9
sw 36(r14),r11
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r10,36(r14)
 add r11,r11,r10
sw 40(r14),r11
% end var offset calculation
% begin intlit storeage
addi r10,r0,64
sw 44(r14), r10
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy1

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,44
lw r10,40(r14)
add r10,r14,r10
%set position counter
mul r9,r0,r0
beginCopy1
%move data via register
lw r12,0(r11)
sw 0(r10),r12
%increment registers
addi r11,r11,4
addi r10,r10,4
addi r9,r9,4
%branch out if done
subi r8,r9,4
bnz r8,beginCopy1

endCopy1
% end assignment 
% begin intlit storeage
addi r9,r0,1
sw 48(r14), r9
% done intlit storeage
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
lw r12,48(r14)
muli r11,r9,4
mul r11,r12,r11
add r8,r8,r11
sw 52(r14),r8
% done generating indice offseting
% begin var offset calculation
addi r8,r0,4
lw r12,52(r14)
 add r8,r8,r12
sw 56(r14),r8
% end var offset calculation
% begin intlit storeage
addi r12,r0,34
sw 60(r14), r12
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy2

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,60
lw r12,56(r14)
add r12,r14,r12
%set position counter
mul r11,r0,r0
beginCopy2
%move data via register
lw r9,0(r8)
sw 0(r12),r9
%increment registers
addi r8,r8,4
addi r12,r12,4
addi r11,r11,4
%branch out if done
subi r10,r11,4
bnz r10,beginCopy2

endCopy2
% end assignment 
% begin intlit storeage
addi r11,r0,2
sw 64(r14), r11
% done intlit storeage
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
lw r9,64(r14)
muli r8,r11,4
mul r8,r9,r8
add r10,r10,r8
sw 68(r14),r10
% done generating indice offseting
% begin var offset calculation
addi r10,r0,4
lw r9,68(r14)
 add r10,r10,r9
sw 72(r14),r10
% end var offset calculation
% begin intlit storeage
addi r9,r0,25
sw 76(r14), r9
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy3

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,76
lw r9,72(r14)
add r9,r14,r9
%set position counter
mul r8,r0,r0
beginCopy3
%move data via register
lw r11,0(r10)
sw 0(r9),r11
%increment registers
addi r10,r10,4
addi r9,r9,4
addi r8,r8,4
%branch out if done
subi r12,r8,4
bnz r12,beginCopy3

endCopy3
% end assignment 
% begin intlit storeage
addi r8,r0,3
sw 80(r14), r8
% done intlit storeage
% begin generating indice offseting
addi r8,r0,1
addi r12,r0,0
lw r11,80(r14)
muli r10,r8,4
mul r10,r11,r10
add r12,r12,r10
sw 84(r14),r12
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r11,84(r14)
 add r12,r12,r11
sw 88(r14),r12
% end var offset calculation
% begin intlit storeage
addi r11,r0,12
sw 92(r14), r11
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy4

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,92
lw r11,88(r14)
add r11,r14,r11
%set position counter
mul r10,r0,r0
beginCopy4
%move data via register
lw r8,0(r12)
sw 0(r11),r8
%increment registers
addi r12,r12,4
addi r11,r11,4
addi r10,r10,4
%branch out if done
subi r9,r10,4
bnz r9,beginCopy4

endCopy4
% end assignment 
% begin intlit storeage
addi r10,r0,4
sw 96(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
lw r8,96(r14)
muli r12,r10,4
mul r12,r8,r12
add r9,r9,r12
sw 100(r14),r9
% done generating indice offseting
% begin var offset calculation
addi r9,r0,4
lw r8,100(r14)
 add r9,r9,r8
sw 104(r14),r9
% end var offset calculation
% begin intlit storeage
addi r8,r0,22
sw 108(r14), r8
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy5

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,108
lw r8,104(r14)
add r8,r14,r8
%set position counter
mul r12,r0,r0
beginCopy5
%move data via register
lw r10,0(r9)
sw 0(r8),r10
%increment registers
addi r9,r9,4
addi r8,r8,4
addi r12,r12,4
%branch out if done
subi r11,r12,4
bnz r11,beginCopy5

endCopy5
% end assignment 
% begin intlit storeage
addi r12,r0,5
sw 112(r14), r12
% done intlit storeage
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
lw r10,112(r14)
muli r9,r12,4
mul r9,r10,r9
add r11,r11,r9
sw 116(r14),r11
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r10,116(r14)
 add r11,r11,r10
sw 120(r14),r11
% end var offset calculation
% begin intlit storeage
addi r10,r0,11
sw 124(r14), r10
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy6

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,124
lw r10,120(r14)
add r10,r14,r10
%set position counter
mul r9,r0,r0
beginCopy6
%move data via register
lw r12,0(r11)
sw 0(r10),r12
%increment registers
addi r11,r11,4
addi r10,r10,4
addi r9,r9,4
%branch out if done
subi r8,r9,4
bnz r8,beginCopy6

endCopy6
% end assignment 
% begin intlit storeage
addi r9,r0,6
sw 128(r14), r9
% done intlit storeage
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
lw r12,128(r14)
muli r11,r9,4
mul r11,r12,r11
add r8,r8,r11
sw 132(r14),r8
% done generating indice offseting
% begin var offset calculation
addi r8,r0,4
lw r12,132(r14)
 add r8,r8,r12
sw 136(r14),r8
% end var offset calculation
% begin intlit storeage
addi r12,r0,90
sw 140(r14), r12
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy7

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,140
lw r12,136(r14)
add r12,r14,r12
%set position counter
mul r11,r0,r0
beginCopy7
%move data via register
lw r9,0(r8)
sw 0(r12),r9
%increment registers
addi r8,r8,4
addi r12,r12,4
addi r11,r11,4
%branch out if done
subi r10,r11,4
bnz r10,beginCopy7

endCopy7
% end assignment 
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
sw 144(r14),r10
% done generating indice offseting
% begin var offset calculation
addi r10,r0,4
lw r9,144(r14)
 add r10,r10,r9
sw 148(r14),r10
% end var offset calculation
% begin intlit storeage
addi r9,r0,7
sw 152(r14), r9
% done intlit storeage
%check if size is zero if yes, leave
addi r12,r0,28
bz r12,endCopy8

%set left and right ptrs
%set ptr
lw r10,148(r14)
add r10,r14,r10
addi r10,r10,0
%read direct value
add r9,r0,r14
addi r9,r9,160
%set position counter
mul r8,r0,r0
beginCopy8
%move data via register
lw r11,0(r10)
sw 0(r9),r11
%increment registers
addi r10,r10,4
addi r9,r9,4
addi r8,r8,4
%branch out if done
subi r12,r8,28
bnz r12,beginCopy8

endCopy8
% end copy 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy9

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,152
%read direct value
add r8,r0,r14
addi r8,r8,188
%set position counter
mul r10,r0,r0
beginCopy9
%move data via register
lw r11,0(r12)
sw 0(r8),r11
%increment registers
addi r12,r12,4
addi r8,r8,4
addi r10,r10,4
%branch out if done
subi r9,r10,4
bnz r9,beginCopy9

endCopy9
% end copy 
addi r14,r14,156
jl r15, fnbubbleSort1
subi r14,r14,156
%check if size is zero if yes, leave
addi r8,r0,0
bz r8,endCopy10

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,156
%read direct value
add r10,r0,r14
addi r10,r10,156
%set position counter
mul r12,r0,r0
beginCopy10
%move data via register
lw r11,0(r9)
sw 0(r10),r11
%increment registers
addi r9,r9,4
addi r10,r10,4
addi r12,r12,4
%branch out if done
subi r8,r12,0
bnz r8,beginCopy10

endCopy10
% end copy 
hlt
%funcdef begin
fnbubbleSort1
sw 0(r14),r15
% begin generating indice offseting
addi r12,r0,1
addi r8,r0,0
sw 52(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,36
lw r11,52(r14)
 add r8,r8,r11
sw 56(r14),r8
% end var offset calculation
% begin generating indice offseting
addi r11,r0,1
addi r8,r0,0
sw 60(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,32
lw r12,60(r14)
 add r8,r8,r12
sw 64(r14),r8
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy11

%set left and right ptrs
%set ptr
lw r8,64(r14)
add r8,r14,r8
lw r12,56(r14)
add r12,r14,r12
%set position counter
mul r9,r0,r0
beginCopy11
%move data via register
lw r11,0(r8)
sw 0(r12),r11
%increment registers
addi r8,r8,4
addi r12,r12,4
addi r9,r9,4
%branch out if done
subi r10,r9,4
bnz r10,beginCopy11

endCopy11
% end assignment 
% begin generating indice offseting
addi r9,r0,1
addi r10,r0,0
sw 68(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,40
lw r11,68(r14)
 add r10,r10,r11
sw 72(r14),r10
% end var offset calculation
% begin intlit storeage
addi r11,r0,0
sw 76(r14), r11
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy12

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,76
lw r11,72(r14)
add r11,r14,r11
%set position counter
mul r8,r0,r0
beginCopy12
%move data via register
lw r9,0(r10)
sw 0(r11),r9
%increment registers
addi r10,r10,4
addi r11,r11,4
addi r8,r8,4
%branch out if done
subi r12,r8,4
bnz r12,beginCopy12

endCopy12
% end assignment 
% begin generating indice offseting
addi r8,r0,1
addi r12,r0,0
sw 80(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,44
lw r9,80(r14)
 add r12,r12,r9
sw 84(r14),r12
% end var offset calculation
% begin intlit storeage
addi r9,r0,0
sw 88(r14), r9
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy13

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,88
lw r9,84(r14)
add r9,r14,r9
%set position counter
mul r10,r0,r0
beginCopy13
%move data via register
lw r8,0(r12)
sw 0(r9),r8
%increment registers
addi r12,r12,4
addi r9,r9,4
addi r10,r10,4
%branch out if done
subi r11,r10,4
bnz r11,beginCopy13

endCopy13
% end assignment 
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
sw 92(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,48
lw r8,92(r14)
 add r11,r11,r8
sw 96(r14),r11
% end var offset calculation
% begin intlit storeage
addi r8,r0,0
sw 100(r14), r8
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy14

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,100
lw r8,96(r14)
add r8,r14,r8
%set position counter
mul r12,r0,r0
beginCopy14
%move data via register
lw r10,0(r11)
sw 0(r8),r10
%increment registers
addi r11,r11,4
addi r8,r8,4
addi r12,r12,4
%branch out if done
subi r9,r12,4
bnz r9,beginCopy14

endCopy14
% end assignment 
gowhile1
% begin generating indice offseting
addi r9,r0,1
addi r10,r0,0
sw 104(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,40
lw r11,104(r14)
 add r10,r10,r11
sw 108(r14),r10
% end var offset calculation
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
sw 112(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,36
lw r9,112(r14)
 add r10,r10,r9
sw 116(r14),r10
% end var offset calculation
% begin intlit storeage
addi r9,r0,1
sw 120(r14), r9
% done intlit storeage
% begin add op 
lw r8,116(r14)
add r8,r14,r8
lw r9,0(r8)
lw r10,120(r14)
sub r11,r9,r10
sw 124(r14),r11
% end add op 
% begin RELOP op 
lw r9,108(r14)
add r9,r14,r9
lw r8,0(r9)
lw r11,124(r14)
clt r10,r8,r11
sw 128(r14),r10
% end relop op 
lw r12,128(r14)
bz r12,endwhile1
% begin generating indice offseting
addi r9,r0,1
addi r10,r0,0
sw 132(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,44
lw r11,132(r14)
 add r10,r10,r11
sw 136(r14),r10
% end var offset calculation
% begin intlit storeage
addi r11,r0,0
sw 140(r14), r11
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r7,r0,4
bz r7,endCopy15

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,140
lw r11,136(r14)
add r11,r14,r11
%set position counter
mul r8,r0,r0
beginCopy15
%move data via register
lw r9,0(r10)
sw 0(r11),r9
%increment registers
addi r10,r10,4
addi r11,r11,4
addi r8,r8,4
%branch out if done
subi r7,r8,4
bnz r7,beginCopy15

endCopy15
% end assignment 
gowhile2
% begin generating indice offseting
addi r7,r0,1
addi r9,r0,0
sw 144(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,44
lw r10,144(r14)
 add r9,r9,r10
sw 148(r14),r9
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
sw 152(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,36
lw r7,152(r14)
 add r9,r9,r7
sw 156(r14),r9
% end var offset calculation
% begin generating indice offseting
addi r7,r0,1
addi r9,r0,0
sw 160(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,40
lw r10,160(r14)
 add r9,r9,r10
sw 164(r14),r9
% end var offset calculation
% begin add op 
lw r11,156(r14)
add r11,r14,r11
lw r10,0(r11)
lw r11,164(r14)
add r11,r14,r11
lw r9,0(r11)
sub r7,r10,r9
sw 168(r14),r7
% end add op 
% begin intlit storeage
addi r11,r0,1
sw 172(r14), r11
% done intlit storeage
% begin add op 
lw r11,168(r14)
lw r7,172(r14)
sub r9,r11,r7
sw 176(r14),r9
% end add op 
% begin RELOP op 
lw r11,148(r14)
add r11,r14,r11
lw r10,0(r11)
lw r9,176(r14)
clt r7,r10,r9
sw 180(r14),r7
% end relop op 
lw r8,180(r14)
bz r8,endwhile2
% begin generating indice offseting
addi r7,r0,1
addi r9,r0,0
sw 184(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,44
lw r10,184(r14)
 add r9,r9,r10
sw 188(r14),r9
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
lw r7,188(r14)
add r7,r14,r7
lw r7,0(r7)
muli r6,r10,4
mul r6,r7,r6
add r9,r9,r6
sw 192(r14),r9
% done generating indice offseting
% begin var offset calculation
addi r9,r0,4
lw r7,192(r14)
 add r9,r9,r7
sw 196(r14),r9
% end var offset calculation
% begin generating indice offseting
addi r7,r0,1
addi r9,r0,0
sw 200(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,44
lw r10,200(r14)
 add r9,r9,r10
sw 204(r14),r9
% end var offset calculation
% begin intlit storeage
addi r10,r0,1
sw 208(r14), r10
% done intlit storeage
% begin add op 
lw r6,204(r14)
add r6,r14,r6
lw r10,0(r6)
lw r9,208(r14)
add r7,r10,r9
sw 212(r14),r7
% end add op 
% begin generating indice offseting
addi r6,r0,1
addi r7,r0,0
lw r9,212(r14)
muli r10,r6,4
mul r10,r9,r10
add r7,r7,r10
sw 216(r14),r7
% done generating indice offseting
% begin var offset calculation
addi r7,r0,4
lw r9,216(r14)
 add r7,r7,r9
sw 220(r14),r7
% end var offset calculation
% begin RELOP op 
lw r10,196(r14)
add r10,r14,r10
lw r9,0(r10)
lw r10,220(r14)
add r10,r14,r10
lw r7,0(r10)
cgt r6,r9,r7
sw 224(r14),r6
% end relop op 
lw r11,224(r14)
bz r11,else1
% begin generating indice offseting
addi r10,r0,1
addi r6,r0,0
sw 228(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r6,r0,48
lw r7,228(r14)
 add r6,r6,r7
sw 232(r14),r6
% end var offset calculation
% begin generating indice offseting
addi r7,r0,1
addi r6,r0,0
sw 236(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r6,r0,44
lw r10,236(r14)
 add r6,r6,r10
sw 240(r14),r6
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r6,r0,0
lw r7,240(r14)
add r7,r14,r7
lw r7,0(r7)
muli r9,r10,4
mul r9,r7,r9
add r6,r6,r9
sw 244(r14),r6
% done generating indice offseting
% begin var offset calculation
addi r6,r0,4
lw r7,244(r14)
 add r6,r6,r7
sw 248(r14),r6
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r5,r0,4
bz r5,endCopy16

%set left and right ptrs
%set ptr
lw r6,248(r14)
add r6,r14,r6
lw r7,232(r14)
add r7,r14,r7
%set position counter
mul r9,r0,r0
beginCopy16
%move data via register
lw r10,0(r6)
sw 0(r7),r10
%increment registers
addi r6,r6,4
addi r7,r7,4
addi r9,r9,4
%branch out if done
subi r5,r9,4
bnz r5,beginCopy16

endCopy16
% end assignment 
% begin generating indice offseting
addi r9,r0,1
addi r5,r0,0
sw 252(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r5,r0,44
lw r10,252(r14)
 add r5,r5,r10
sw 256(r14),r5
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r5,r0,0
lw r9,256(r14)
add r9,r14,r9
lw r9,0(r9)
muli r6,r10,4
mul r6,r9,r6
add r5,r5,r6
sw 260(r14),r5
% done generating indice offseting
% begin var offset calculation
addi r5,r0,4
lw r9,260(r14)
 add r5,r5,r9
sw 264(r14),r5
% end var offset calculation
% begin generating indice offseting
addi r9,r0,1
addi r5,r0,0
sw 268(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r5,r0,44
lw r10,268(r14)
 add r5,r5,r10
sw 272(r14),r5
% end var offset calculation
% begin intlit storeage
addi r10,r0,1
sw 276(r14), r10
% done intlit storeage
% begin add op 
lw r6,272(r14)
add r6,r14,r6
lw r10,0(r6)
lw r5,276(r14)
add r9,r10,r5
sw 280(r14),r9
% end add op 
% begin generating indice offseting
addi r6,r0,1
addi r9,r0,0
lw r5,280(r14)
muli r10,r6,4
mul r10,r5,r10
add r9,r9,r10
sw 284(r14),r9
% done generating indice offseting
% begin var offset calculation
addi r9,r0,4
lw r5,284(r14)
 add r9,r9,r5
sw 288(r14),r9
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r7,r0,4
bz r7,endCopy17

%set left and right ptrs
%set ptr
lw r9,288(r14)
add r9,r14,r9
lw r5,264(r14)
add r5,r14,r5
%set position counter
mul r10,r0,r0
beginCopy17
%move data via register
lw r6,0(r9)
sw 0(r5),r6
%increment registers
addi r9,r9,4
addi r5,r5,4
addi r10,r10,4
%branch out if done
subi r7,r10,4
bnz r7,beginCopy17

endCopy17
% end assignment 
% begin generating indice offseting
addi r10,r0,1
addi r7,r0,0
sw 292(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r7,r0,44
lw r6,292(r14)
 add r7,r7,r6
sw 296(r14),r7
% end var offset calculation
% begin intlit storeage
addi r6,r0,1
sw 300(r14), r6
% done intlit storeage
% begin add op 
lw r9,296(r14)
add r9,r14,r9
lw r6,0(r9)
lw r7,300(r14)
add r10,r6,r7
sw 304(r14),r10
% end add op 
% begin generating indice offseting
addi r9,r0,1
addi r10,r0,0
lw r7,304(r14)
muli r6,r9,4
mul r6,r7,r6
add r10,r10,r6
sw 308(r14),r10
% done generating indice offseting
% begin var offset calculation
addi r10,r0,4
lw r7,308(r14)
 add r10,r10,r7
sw 312(r14),r10
% end var offset calculation
% begin generating indice offseting
addi r7,r0,1
addi r10,r0,0
sw 316(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,48
lw r9,316(r14)
 add r10,r10,r9
sw 320(r14),r10
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r5,r0,4
bz r5,endCopy18

%set left and right ptrs
%set ptr
lw r10,320(r14)
add r10,r14,r10
lw r9,312(r14)
add r9,r14,r9
%set position counter
mul r6,r0,r0
beginCopy18
%move data via register
lw r7,0(r10)
sw 0(r9),r7
%increment registers
addi r10,r10,4
addi r9,r9,4
addi r6,r6,4
%branch out if done
subi r5,r6,4
bnz r5,beginCopy18

endCopy18
% end assignment 
j endif1
else1
endif1
% begin generating indice offseting
addi r11,r0,1
addi r6,r0,0
sw 324(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r6,r0,44
lw r5,324(r14)
 add r6,r6,r5
sw 328(r14),r6
% end var offset calculation
% begin generating indice offseting
addi r5,r0,1
addi r6,r0,0
sw 332(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r6,r0,44
lw r11,332(r14)
 add r6,r6,r11
sw 336(r14),r6
% end var offset calculation
% begin intlit storeage
addi r11,r0,1
sw 340(r14), r11
% done intlit storeage
% begin add op 
lw r7,336(r14)
add r7,r14,r7
lw r11,0(r7)
lw r6,340(r14)
add r5,r11,r6
sw 344(r14),r5
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy19

%set left and right ptrs
%read direct value
add r5,r0,r14
addi r5,r5,344
lw r7,328(r14)
add r7,r14,r7
%set position counter
mul r11,r0,r0
beginCopy19
%move data via register
lw r6,0(r5)
sw 0(r7),r6
%increment registers
addi r5,r5,4
addi r7,r7,4
addi r11,r11,4
%branch out if done
subi r10,r11,4
bnz r10,beginCopy19

endCopy19
% end assignment 
j gowhile2
endwhile2
% begin generating indice offseting
addi r8,r0,1
addi r11,r0,0
sw 348(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,40
lw r10,348(r14)
 add r11,r11,r10
sw 352(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
sw 356(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,40
lw r8,356(r14)
 add r11,r11,r8
sw 360(r14),r11
% end var offset calculation
% begin intlit storeage
addi r8,r0,1
sw 364(r14), r8
% done intlit storeage
% begin add op 
lw r6,360(r14)
add r6,r14,r6
lw r8,0(r6)
lw r11,364(r14)
add r10,r8,r11
sw 368(r14),r10
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r5,r0,4
bz r5,endCopy20

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,368
lw r6,352(r14)
add r6,r14,r6
%set position counter
mul r8,r0,r0
beginCopy20
%move data via register
lw r11,0(r10)
sw 0(r6),r11
%increment registers
addi r10,r10,4
addi r6,r6,4
addi r8,r8,4
%branch out if done
subi r5,r8,4
bnz r5,beginCopy20

endCopy20
% end assignment 
j gowhile1
endwhile1
% begin generating indice offseting
addi r12,r0,1
addi r8,r0,0
sw 372(r14),r8
% done generating indice offseting
% begin var offset calculation
addi r8,r0,4
lw r5,372(r14)
 add r8,r8,r5
sw 376(r14),r8
% end var offset calculation
% begin intlit storeage
addi r5,r0,7
sw 380(r14), r5
% done intlit storeage
%check if size is zero if yes, leave
addi r10,r0,28
bz r10,endCopy21

%set left and right ptrs
%set ptr
lw r8,376(r14)
add r8,r14,r8
addi r8,r8,0
%read direct value
add r5,r0,r14
addi r5,r5,388
%set position counter
mul r11,r0,r0
beginCopy21
%move data via register
lw r12,0(r8)
sw 0(r5),r12
%increment registers
addi r8,r8,4
addi r5,r5,4
addi r11,r11,4
%branch out if done
subi r10,r11,28
bnz r10,beginCopy21

endCopy21
% end copy 
%check if size is zero if yes, leave
addi r5,r0,4
bz r5,endCopy22

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,380
%read direct value
add r11,r0,r14
addi r11,r11,416
%set position counter
mul r8,r0,r0
beginCopy22
%move data via register
lw r12,0(r10)
sw 0(r11),r12
%increment registers
addi r10,r10,4
addi r11,r11,4
addi r8,r8,4
%branch out if done
subi r5,r8,4
bnz r5,beginCopy22

endCopy22
% end copy 
addi r14,r14,384
jl r15, fnprintArray1
subi r14,r14,384
%check if size is zero if yes, leave
addi r11,r0,0
bz r11,endCopy23

%set left and right ptrs
%read direct value
add r5,r0,r14
addi r5,r5,384
%read direct value
add r8,r0,r14
addi r8,r8,384
%set position counter
mul r10,r0,r0
beginCopy23
%move data via register
lw r12,0(r5)
sw 0(r8),r12
%increment registers
addi r5,r5,4
addi r8,r8,4
addi r10,r10,4
%branch out if done
subi r11,r10,0
bnz r11,beginCopy23

endCopy23
% end copy 
lw r15,0(r14)
jr r15 
%funcdef end
%funcdef begin
fnprintArray1
sw 0(r14),r15
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
sw 44(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,36
lw r12,44(r14)
 add r11,r11,r12
sw 48(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 52(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,32
lw r10,52(r14)
 add r11,r11,r10
sw 56(r14),r11
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy24

%set left and right ptrs
%set ptr
lw r11,56(r14)
add r11,r14,r11
lw r10,48(r14)
add r10,r14,r10
%set position counter
mul r5,r0,r0
beginCopy24
%move data via register
lw r12,0(r11)
sw 0(r10),r12
%increment registers
addi r11,r11,4
addi r10,r10,4
addi r5,r5,4
%branch out if done
subi r8,r5,4
bnz r8,beginCopy24

endCopy24
% end assignment 
% begin generating indice offseting
addi r5,r0,1
addi r8,r0,0
sw 60(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,40
lw r12,60(r14)
 add r8,r8,r12
sw 64(r14),r8
% end var offset calculation
% begin intlit storeage
addi r12,r0,0
sw 68(r14), r12
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy25

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,68
lw r12,64(r14)
add r12,r14,r12
%set position counter
mul r11,r0,r0
beginCopy25
%move data via register
lw r5,0(r8)
sw 0(r12),r5
%increment registers
addi r8,r8,4
addi r12,r12,4
addi r11,r11,4
%branch out if done
subi r10,r11,4
bnz r10,beginCopy25

endCopy25
% end assignment 
gowhile3
% begin generating indice offseting
addi r10,r0,1
addi r5,r0,0
sw 72(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r5,r0,40
lw r8,72(r14)
 add r5,r5,r8
sw 76(r14),r5
% end var offset calculation
% begin generating indice offseting
addi r8,r0,1
addi r5,r0,0
sw 80(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r5,r0,36
lw r10,80(r14)
 add r5,r5,r10
sw 84(r14),r5
% end var offset calculation
% begin RELOP op 
lw r12,76(r14)
add r12,r14,r12
lw r10,0(r12)
lw r12,84(r14)
add r12,r14,r12
lw r5,0(r12)
clt r8,r10,r5
sw 88(r14),r8
% end relop op 
lw r11,88(r14)
bz r11,endwhile3
% begin generating indice offseting
addi r12,r0,1
addi r8,r0,0
sw 92(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,40
lw r5,92(r14)
 add r8,r8,r5
sw 96(r14),r8
% end var offset calculation
% begin generating indice offseting
addi r5,r0,1
addi r8,r0,0
lw r12,96(r14)
add r12,r14,r12
lw r12,0(r12)
muli r10,r5,4
mul r10,r12,r10
add r8,r8,r10
sw 100(r14),r8
% done generating indice offseting
% begin var offset calculation
addi r8,r0,4
lw r12,100(r14)
 add r8,r8,r12
sw 104(r14),r8
% end var offset calculation
% begin write 
lw r12,104(r14)
add r12,r14,r12
lw r12,0(r12)
%s move ptr to prevent mem corruption
addi r14,r14,212
sw -8(r14),r12
addi r12,r0,buffer
sw -12(r14),r12
jl r15,intstr
sw -8(r14),r13
jl r15,putstr
addi r12,r0,newline
sw -8(r14),r12
jl r15,putstr
%s move ptr to og location 
addi r14,r14,-212
% end write
% begin generating indice offseting
addi r12,r0,1
addi r8,r0,0
sw 108(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,40
lw r5,108(r14)
 add r8,r8,r5
sw 112(r14),r8
% end var offset calculation
% begin generating indice offseting
addi r5,r0,1
addi r8,r0,0
sw 116(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,40
lw r12,116(r14)
 add r8,r8,r12
sw 120(r14),r8
% end var offset calculation
% begin intlit storeage
addi r12,r0,1
sw 124(r14), r12
% done intlit storeage
% begin add op 
lw r10,120(r14)
add r10,r14,r10
lw r12,0(r10)
lw r8,124(r14)
add r5,r12,r8
sw 128(r14),r5
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r6,r0,4
bz r6,endCopy26

%set left and right ptrs
%read direct value
add r5,r0,r14
addi r5,r5,128
lw r10,112(r14)
add r10,r14,r10
%set position counter
mul r12,r0,r0
beginCopy26
%move data via register
lw r8,0(r5)
sw 0(r10),r8
%increment registers
addi r5,r5,4
addi r10,r10,4
addi r12,r12,4
%branch out if done
subi r6,r12,4
bnz r6,beginCopy26

endCopy26
% end assignment 
j gowhile3
endwhile3
lw r15,0(r14)
jr r15 
%funcdef end
