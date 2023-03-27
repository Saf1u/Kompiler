entry
muli r0,r0,0
muli r14,r0,0
addi r14,r0,stackbase
%r14 is stack ptr, stack grows downwards or upwards
%24kb stack
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 32(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,28
lw r10,32(r14)
 add r11,r11,r10
sw 36(r14),r11
% end var offset calculation
% begin intlit storeage
addi r10,r0,100
sw 40(r14), r10
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy1

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,40
lw r10,36(r14)
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
addi r9,r0,2
sw 44(r14), r9
% done intlit storeage
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
lw r12,44(r14)
muli r11,r9,4
mul r11,r12,r11
muli r11,r11,2
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
addi r12,r0,10
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
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
sw 64(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,28
lw r9,64(r14)
 add r10,r10,r9
sw 68(r14),r10
% end var offset calculation
% begin intlit storeage
addi r9,r0,2
sw 72(r14), r9
% done intlit storeage
% begin mult op 
lw r8,68(r14)
add r8,r14,r8
lw r9,0(r8)
lw r10,72(r14)
mul r11,r9,r10
sw 76(r14),r11
% end mult op 
% begin intlit storeage
addi r8,r0,2
sw 80(r14), r8
% done intlit storeage
% begin intlit storeage
addi r8,r0,1
sw 84(r14), r8
% done intlit storeage
% begin generating indice offseting
addi r8,r0,1
addi r11,r0,0
lw r10,84(r14)
muli r9,r8,4
mul r9,r10,r9
add r11,r11,r9
lw r10,80(r14)
muli r9,r8,4
mul r9,r10,r9
muli r9,r9,2
add r11,r11,r9
sw 88(r14),r11
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r10,88(r14)
 add r11,r11,r10
sw 92(r14),r11
% end var offset calculation
% begin intlit storeage
addi r10,r0,2
sw 96(r14), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,1
sw 100(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
lw r8,100(r14)
muli r9,r10,4
mul r9,r8,r9
add r11,r11,r9
lw r8,96(r14)
muli r9,r10,4
mul r9,r8,r9
muli r9,r9,2
add r11,r11,r9
sw 104(r14),r11
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r8,104(r14)
 add r11,r11,r8
sw 108(r14),r11
% end var offset calculation
% begin intlit storeage
addi r8,r0,5
sw 112(r14), r8
% done intlit storeage
% begin mult op 
lw r9,108(r14)
add r9,r14,r9
lw r8,0(r9)
lw r11,112(r14)
mul r10,r8,r11
sw 116(r14),r10
% end mult op 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy3

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,76
%read direct value
add r9,r0,r14
addi r9,r9,156
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
% end copy 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy4

%set left and right ptrs
%set ptr
lw r12,92(r14)
add r12,r14,r12
%read direct value
add r8,r0,r14
addi r8,r8,160
%set position counter
mul r10,r0,r0
beginCopy4
%move data via register
lw r11,0(r12)
sw 0(r8),r11
%increment registers
addi r12,r12,4
addi r8,r8,4
addi r10,r10,4
%branch out if done
subi r9,r10,4
bnz r9,beginCopy4

endCopy4
% end copy 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy5

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,116
%read direct value
add r10,r0,r14
addi r10,r10,164
%set position counter
mul r12,r0,r0
beginCopy5
%move data via register
lw r11,0(r9)
sw 0(r10),r11
%increment registers
addi r9,r9,4
addi r10,r10,4
addi r12,r12,4
%branch out if done
subi r8,r12,4
bnz r8,beginCopy5

endCopy5
% end copy 
addi r14,r14,148
jl r15, fnside1
subi r14,r14,148
% begin generating indice offseting
addi r12,r0,1
addi r8,r0,0
sw 124(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,28
lw r11,124(r14)
 add r8,r8,r11
sw 128(r14),r8
% end var offset calculation
% begin write 
lw r11,128(r14)
add r11,r14,r11
lw r11,0(r11)
%s move ptr to prevent mem corruption
addi r14,r14,228
sw -8(r14),r11
addi r11,r0,buffer
sw -12(r14),r11
jl r15,intstr
sw -8(r14),r13
jl r15,putstr
addi r11,r0,newline
sw -8(r14),r11
jl r15,putstr
%s move ptr to og location 
addi r14,r14,-228
% end write
% begin intlit storeage
addi r11,r0,2
sw 132(r14), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,1
sw 136(r14), r11
% done intlit storeage
% begin generating indice offseting
addi r11,r0,1
addi r8,r0,0
lw r12,136(r14)
muli r9,r11,4
mul r9,r12,r9
add r8,r8,r9
lw r12,132(r14)
muli r9,r11,4
mul r9,r12,r9
muli r9,r9,2
add r8,r8,r9
sw 140(r14),r8
% done generating indice offseting
% begin var offset calculation
addi r8,r0,4
lw r12,140(r14)
 add r8,r8,r12
sw 144(r14),r8
% end var offset calculation
% begin write 
lw r12,144(r14)
add r12,r14,r12
lw r12,0(r12)
%s move ptr to prevent mem corruption
addi r14,r14,228
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
addi r14,r14,-228
% end write
hlt
%funcdef begin
fnside1
sw 4(r14),r15
% begin generating indice offseting
addi r12,r0,1
addi r8,r0,0
sw 20(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,8
lw r11,20(r14)
 add r8,r8,r11
sw 24(r14),r8
% end var offset calculation
% begin generating indice offseting
addi r11,r0,1
addi r8,r0,0
sw 28(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,8
lw r12,28(r14)
 add r8,r8,r12
sw 32(r14),r8
% end var offset calculation
% begin intlit storeage
addi r12,r0,2
sw 36(r14), r12
% done intlit storeage
% begin mult op 
lw r9,32(r14)
add r9,r14,r9
lw r12,0(r9)
lw r8,36(r14)
div r11,r12,r8
sw 40(r14),r11
% end mult op 
% begin assignment 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy6

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,40
lw r9,24(r14)
add r9,r14,r9
%set position counter
mul r12,r0,r0
beginCopy6
%move data via register
lw r8,0(r11)
sw 0(r9),r8
%increment registers
addi r11,r11,4
addi r9,r9,4
addi r12,r12,4
%branch out if done
subi r10,r12,4
bnz r10,beginCopy6

endCopy6
% end assignment 
% begin generating indice offseting
addi r12,r0,1
addi r10,r0,0
sw 44(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,12
lw r8,44(r14)
 add r10,r10,r8
sw 48(r14),r10
% end var offset calculation
% begin generating indice offseting
addi r8,r0,1
addi r10,r0,0
sw 52(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,12
lw r12,52(r14)
 add r10,r10,r12
sw 56(r14),r10
% end var offset calculation
% begin intlit storeage
addi r12,r0,3
sw 60(r14), r12
% done intlit storeage
% begin mult op 
lw r11,56(r14)
add r11,r14,r11
lw r12,0(r11)
lw r10,60(r14)
mul r8,r12,r10
sw 64(r14),r8
% end mult op 
% begin assignment 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy7

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,64
lw r11,48(r14)
add r11,r14,r11
%set position counter
mul r12,r0,r0
beginCopy7
%move data via register
lw r10,0(r8)
sw 0(r11),r10
%increment registers
addi r8,r8,4
addi r11,r11,4
addi r12,r12,4
%branch out if done
subi r9,r12,4
bnz r9,beginCopy7

endCopy7
% end assignment 
% begin generating indice offseting
addi r12,r0,1
addi r9,r0,0
sw 68(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,16
lw r10,68(r14)
 add r9,r9,r10
sw 72(r14),r9
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
sw 76(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,16
lw r12,76(r14)
 add r9,r9,r12
sw 80(r14),r9
% end var offset calculation
% begin intlit storeage
addi r12,r0,2
sw 84(r14), r12
% done intlit storeage
% begin mult op 
lw r8,80(r14)
add r8,r14,r8
lw r12,0(r8)
lw r9,84(r14)
div r10,r12,r9
sw 88(r14),r10
% end mult op 
% begin assignment 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy8

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,88
lw r8,72(r14)
add r8,r14,r8
%set position counter
mul r12,r0,r0
beginCopy8
%move data via register
lw r9,0(r10)
sw 0(r8),r9
%increment registers
addi r10,r10,4
addi r8,r8,4
addi r12,r12,4
%branch out if done
subi r11,r12,4
bnz r11,beginCopy8

endCopy8
% end assignment 
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 92(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,8
lw r9,92(r14)
 add r11,r11,r9
sw 96(r14),r11
% end var offset calculation
% begin write 
lw r9,96(r14)
add r9,r14,r9
lw r9,0(r9)
%s move ptr to prevent mem corruption
addi r14,r14,196
sw -8(r14),r9
addi r9,r0,buffer
sw -12(r14),r9
jl r15,intstr
sw -8(r14),r13
jl r15,putstr
addi r9,r0,newline
sw -8(r14),r9
jl r15,putstr
%s move ptr to og location 
addi r14,r14,-196
% end write
% begin generating indice offseting
addi r9,r0,1
addi r11,r0,0
sw 100(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,12
lw r12,100(r14)
 add r11,r11,r12
sw 104(r14),r11
% end var offset calculation
% begin write 
lw r12,104(r14)
add r12,r14,r12
lw r12,0(r12)
%s move ptr to prevent mem corruption
addi r14,r14,196
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
addi r14,r14,-196
% end write
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 108(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,16
lw r9,108(r14)
 add r11,r11,r9
sw 112(r14),r11
% end var offset calculation
% begin write 
lw r9,112(r14)
add r9,r14,r9
lw r9,0(r9)
%s move ptr to prevent mem corruption
addi r14,r14,196
sw -8(r14),r9
addi r9,r0,buffer
sw -12(r14),r9
jl r15,intstr
sw -8(r14),r13
jl r15,putstr
addi r9,r0,newline
sw -8(r14),r9
jl r15,putstr
%s move ptr to og location 
addi r14,r14,-196
% end write
lw r15,4(r14)
jr r15 
%funcdef end
