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
sw 8(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r10,8(r14)
 add r11,r11,r10
sw 12(r14),r11
% end var offset calculation
addi r14,r14,60
jl r15, fnnuma1
subi r14,r14,60
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy1

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,60
%read direct value
add r10,r0,r14
addi r10,r10,16
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
% end copy 
% begin intlit storeage
addi r9,r0,5
sw 20(r14), r9
% done intlit storeage
% begin add op 
lw r9,16(r14)
lw r8,20(r14)
add r12,r9,r8
sw 24(r14),r12
% end add op 
% begin intlit storeage
addi r11,r0,1
sw 28(r14), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,3
sw 32(r14), r11
% done intlit storeage
% begin add op 
lw r11,28(r14)
lw r12,32(r14)
add r8,r11,r12
sw 36(r14),r8
% end add op 
% begin mult op 
lw r9,24(r14)
lw r8,36(r14)
mul r12,r9,r8
sw 40(r14),r12
% end mult op 
addi r14,r14,60
jl r15, fnnuma1
subi r14,r14,60
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy2

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,60
%read direct value
add r11,r0,r14
addi r11,r11,44
%set position counter
mul r9,r0,r0
beginCopy2
%move data via register
lw r8,0(r12)
sw 0(r11),r8
%increment registers
addi r12,r12,4
addi r11,r11,4
addi r9,r9,4
%branch out if done
subi r10,r9,4
bnz r10,beginCopy2

endCopy2
% end copy 
% begin add op 
lw r9,40(r14)
lw r10,44(r14)
add r8,r9,r10
sw 48(r14),r8
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy3

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,48
lw r12,12(r14)
add r12,r14,r12
%set position counter
mul r9,r0,r0
beginCopy3
%move data via register
lw r10,0(r8)
sw 0(r12),r10
%increment registers
addi r8,r8,4
addi r12,r12,4
addi r9,r9,4
%branch out if done
subi r11,r9,4
bnz r11,beginCopy3

endCopy3
% end assignment 
% begin generating indice offseting
addi r9,r0,1
addi r11,r0,0
sw 52(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r10,52(r14)
 add r11,r11,r10
sw 56(r14),r11
% end var offset calculation
% begin write 
lw r10,56(r14)
add r10,r14,r10
lw r10,0(r10)
%s move ptr to prevent mem corruption
addi r14,r14,140
sw -8(r14),r10
addi r10,r0,buffer
sw -12(r14),r10
jl r15,intstr
sw -8(r14),r13
jl r15,putstr
addi r10,r0,newline
sw -8(r14),r10
jl r15,putstr
%s move ptr to og location 
addi r14,r14,-140
% end write
hlt
%funcdef begin
fnnuma1
sw 4(r14),r15
% begin intlit storeage
addi r10,r0,1
sw 8(r14), r10
% done intlit storeage
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy4

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,8
%read direct value
add r10,r0,r14
addi r10,r10,0
%set position counter
mul r8,r0,r0
beginCopy4
%move data via register
lw r9,0(r11)
sw 0(r10),r9
%increment registers
addi r11,r11,4
addi r10,r10,4
addi r8,r8,4
%branch out if done
subi r12,r8,4
bnz r12,beginCopy4

endCopy4
% end copy 
lw r15,4(r14)
jr r15 
%funcdef end
