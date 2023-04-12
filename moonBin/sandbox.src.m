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
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 12(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,8
lw r10,12(r14)
 add r11,r11,r10
sw 16(r14),r11
% end var offset calculation
% begin intlit storeage
addi r10,r0,313
sw 20(r14), r10
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy1

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,20
lw r10,16(r14)
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
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
sw 24(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,8
lw r12,24(r14)
 add r8,r8,r12
sw 28(r14),r8
% end var offset calculation
% begin write 
lw r12,28(r14)
add r12,r14,r12
lw r12,0(r12)
%s move ptr to prevent mem corruption
addi r14,r14,112
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
addi r14,r14,-112
% end write
hlt
% begin intlit storeage
addi r12,r0,22
sw 0(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,11
sw 0(r14), r12
% done intlit storeage
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy2

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,0
%read direct value
add r12,r0,r14
addi r12,r12,36
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
% end copy 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy3

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,0
%read direct value
add r11,r0,r14
addi r11,r11,40
%set position counter
mul r8,r0,r0
beginCopy3
%move data via register
lw r9,0(r10)
sw 0(r11),r9
%increment registers
addi r10,r10,4
addi r11,r11,4
addi r8,r8,4
%branch out if done
subi r12,r8,4
bnz r12,beginCopy3

endCopy3
% end copy 
addi r14,r14,32
jl r15, fnp2
subi r14,r14,32
%check if size is zero if yes, leave
addi r11,r0,0
bz r11,endCopy4

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,32
%read direct value
add r8,r0,r14
addi r8,r8,0
%set position counter
mul r10,r0,r0
beginCopy4
%move data via register
lw r9,0(r12)
sw 0(r8),r9
%increment registers
addi r12,r12,4
addi r8,r8,4
addi r10,r10,4
%branch out if done
subi r11,r10,0
bnz r11,beginCopy4

endCopy4
% end copy 
hlt
%funcdef begin
fnp1
sw 0(r14),r15
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
sw 8(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r9,8(r14)
 add r11,r11,r9
sw 12(r14),r11
% end var offset calculation
% begin write 
lw r9,12(r14)
add r9,r14,r9
lw r9,0(r9)
%s move ptr to prevent mem corruption
addi r14,r14,96
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
addi r14,r14,-96
% end write
lw r15,0(r14)
jr r15 
%funcdef end
%funcdef begin
fnp2
sw 0(r14),r15
% begin generating indice offseting
addi r9,r0,1
addi r11,r0,0
sw 12(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r10,12(r14)
 add r11,r11,r10
sw 16(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
sw 20(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,8
lw r9,20(r14)
 add r11,r11,r9
sw 24(r14),r11
% end var offset calculation
% begin add op 
lw r12,16(r14)
add r12,r14,r12
lw r9,0(r12)
lw r12,24(r14)
add r12,r14,r12
lw r11,0(r12)
add r10,r9,r11
sw 28(r14),r10
% end add op 
% begin write 
lw r12,28(r14)
%s move ptr to prevent mem corruption
addi r14,r14,112
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
addi r14,r14,-112
% end write
lw r15,0(r14)
jr r15 
%funcdef end
