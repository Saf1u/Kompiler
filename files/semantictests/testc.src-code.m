entry
muli r0,r0,0
muli r14,r0,0
addi r14,r0,stackbase
%r14 is stack ptr, stack grows downwards or upwards
%24kb stack
% begin generating indice offseting
addi r12,r0,0
% done generating indice offseting
% begin var offset calculation
addi r11,r12,8
sw 12(r14),r11
% end var offset calculation
% begin intlit storeage
addi r11,r0,1293
sw 16(r14), r11
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy1

%set left and right ptrs
%read direct value address
add r12,r0,r14
addi r12,r12,16
lw r11,12(r14)
add r11,r14,r11
%set position counter
mul r9,r0,r0
beginCopy1
%move data via register
lb r10,0(r12)
sb 0(r11),r10
%increment registers
addi r12,r12,1
addi r11,r11,1
addi r9,r9,1
%branch out if done
subi r8,r9,4
bnz r8,beginCopy1

endCopy1
% end assignment 
% begin generating indice offseting
addi r9,r0,0
% done generating indice offseting
% begin var offset calculation
addi r8,r9,8
sw 20(r14),r8
% end var offset calculation
% begin write 
lw r8,20(r14)
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
addi r8,r0,0
% done generating indice offseting
% begin var offset calculation
addi r9,r8,8
sw 24(r14),r9
% end var offset calculation
% begin write 
lw r9,24(r14)
add r9,r14,r9
lw r9,0(r9)
%s move ptr to prevent mem corruption
addi r14,r14,124
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
addi r14,r14,-124
% end write
% begin generating indice offseting
addi r9,r0,0
% done generating indice offseting
% begin var offset calculation
addi r8,r9,4
sw 28(r14),r8
% end var offset calculation
% begin intlit storeage
addi r8,r0,3123
sw 32(r14), r8
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy2

%set left and right ptrs
%read direct value address
add r9,r0,r14
addi r9,r9,32
lw r8,28(r14)
add r8,r14,r8
%set position counter
mul r12,r0,r0
beginCopy2
%move data via register
lb r10,0(r9)
sb 0(r8),r10
%increment registers
addi r9,r9,1
addi r8,r8,1
addi r12,r12,1
%branch out if done
subi r11,r12,4
bnz r11,beginCopy2

endCopy2
% end assignment 
% begin generating indice offseting
addi r12,r0,0
% done generating indice offseting
% begin var offset calculation
addi r11,r12,4
sw 36(r14),r11
% end var offset calculation
% begin write 
lw r11,36(r14)
add r11,r14,r11
lw r11,0(r11)
%s move ptr to prevent mem corruption
addi r14,r14,124
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
addi r14,r14,-124
% end write
% begin generating indice offseting
addi r11,r0,0
% done generating indice offseting
% begin var offset calculation
addi r12,r11,4
sw 40(r14),r12
% end var offset calculation
% begin write 
lw r12,40(r14)
add r12,r14,r12
lw r12,0(r12)
%s move ptr to prevent mem corruption
addi r14,r14,124
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
addi r14,r14,-124
% end write
hlt
