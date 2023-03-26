entry
muli r0,r0,0
muli r14,r0,0
addi r14,r0,stackbase
%r14 is stack ptr, stack grows downwards or upwards
%24kb stack
% begin intlit storeage
addi r12,r0,44
sw 4(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,11
sw 8(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,22
sw 12(r14), r12
% done intlit storeage
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy1

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,4
%read direct value
add r12,r0,r14
addi r12,r12,32
%set position counter
mul r9,r0,r0
beginCopy1
%move data via register
lw r10,0(r11)
sw 0(r12),r10
%increment registers
addi r11,r11,4
addi r12,r12,4
addi r9,r9,4
%branch out if done
subi r8,r9,4
bnz r8,beginCopy1

endCopy1
% end copy 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy2

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,8
%read direct value
add r9,r0,r14
addi r9,r9,36
%set position counter
mul r11,r0,r0
beginCopy2
%move data via register
lw r10,0(r8)
sw 0(r9),r10
%increment registers
addi r8,r8,4
addi r9,r9,4
addi r11,r11,4
%branch out if done
subi r12,r11,4
bnz r12,beginCopy2

endCopy2
% end copy 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy3

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,12
%read direct value
add r11,r0,r14
addi r11,r11,40
%set position counter
mul r8,r0,r0
beginCopy3
%move data via register
lw r10,0(r12)
sw 0(r11),r10
%increment registers
addi r12,r12,4
addi r11,r11,4
addi r8,r8,4
%branch out if done
subi r9,r8,4
bnz r9,beginCopy3

endCopy3
% end copy 
addi r14,r14,24
jl r15, fnside1
subi r14,r14,24
% begin intlit storeage
addi r8,r0,1
sw 20(r14), r8
% done intlit storeage
% begin write 
lw r8,20(r14)
%s move ptr to prevent mem corruption
addi r14,r14,104
sw -8(r14),r8
addi r8,r0,buffer
sw -12(r14),r8
jl r15,intstr
sw -8(r14),r13
jl r15,putstr
addi r8,r0,newline
sw -8(r14),r8
jl r15,putstr
%s move ptr to og location 
addi r14,r14,-104
% end write
hlt
%funcdef begin
fnside1
sw 4(r14),r15
% begin generating indice offseting
addi r8,r0,1
addi r9,r0,0
sw 20(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,8
lw r10,20(r14)
 add r9,r9,r10
sw 24(r14),r9
% end var offset calculation
% begin write 
lw r10,24(r14)
add r10,r14,r10
lw r10,0(r10)
%s move ptr to prevent mem corruption
addi r14,r14,124
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
addi r14,r14,-124
% end write
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
sw 28(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,12
lw r8,28(r14)
 add r9,r9,r8
sw 32(r14),r9
% end var offset calculation
% begin write 
lw r8,32(r14)
add r8,r14,r8
lw r8,0(r8)
%s move ptr to prevent mem corruption
addi r14,r14,124
sw -8(r14),r8
addi r8,r0,buffer
sw -12(r14),r8
jl r15,intstr
sw -8(r14),r13
jl r15,putstr
addi r8,r0,newline
sw -8(r14),r8
jl r15,putstr
%s move ptr to og location 
addi r14,r14,-124
% end write
% begin generating indice offseting
addi r8,r0,1
addi r9,r0,0
sw 36(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,16
lw r10,36(r14)
 add r9,r9,r10
sw 40(r14),r9
% end var offset calculation
% begin write 
lw r10,40(r14)
add r10,r14,r10
lw r10,0(r10)
%s move ptr to prevent mem corruption
addi r14,r14,124
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
addi r14,r14,-124
% end write
lw r15,4(r14)
jr r15 
%funcdef end
