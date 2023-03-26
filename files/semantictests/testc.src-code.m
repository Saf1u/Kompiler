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
addi r11,r0,102
sw 16(r14), r11
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r7,r0,4
bz r7,endCopy1

%set left and right ptrs
%read direct value address
add r10,r0,r14
addi r10,r10,16
lw r12,12(r14)
%set position counter
mul r8,r0,r0
beginCopy1
%move data via register
lb r9,0(r10)
sb 0(r12),r9
%increment registers
addi r10,r10,1
addi r12,r12,1
addi r8,r8,1
%branch out if done
subi r7,r8,4
bnz r7,beginCopy1

endCopy1
% end assignment 
% begin generating indice offseting
addi r8,r0,0
% done generating indice offseting
% begin var offset calculation
addi r7,r8,8
sw 20(r14),r7
% end var offset calculation
% begin write 
lw r7,20(r14)
lw r7,0(r7)
%s move ptr to prevent mem corruption
sw -8(r14),r7
addi r7,r0,buffer
sw -12(r14),r7
jl r15,intstr
sw -8(r14),r13
jl r15,putstr
addi r7,r0,newline
sw -8(r14),r7
jl r15,putstr
%s move ptr to og location 
% end write
% begin generating indice offseting
addi r7,r0,0
% done generating indice offseting
% begin var offset calculation
addi r8,r7,8
sw 24(r14),r8
% end var offset calculation
% begin write 
lw r8,24(r14)
lw r8,0(r8)
%s move ptr to prevent mem corruption
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
% end write
hlt
