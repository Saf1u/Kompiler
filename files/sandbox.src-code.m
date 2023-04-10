entry
muli r0,r0,0
muli r14,r0,0
addi r14,r0,stackbase
%r14 is stack ptr, stack grows downwards or upwards
%24kb stack
% begin intlit storeage
addi r12,r0,100
sw 4(r14), r12
% done intlit storeage
% begin write 
lw r12,4(r14)
%s move ptr to prevent mem corruption
addi r14,r14,92
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
addi r14,r14,-92
% end write
% begin intlit storeage
addi r12,r0,200
sw 8(r14), r12
% done intlit storeage
hlt
