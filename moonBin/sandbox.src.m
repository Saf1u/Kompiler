% begin intlit storeage
addi r12,r0,20
sw 0(r14), r12
% done intlit storeage
% begin write 
lw r12,0(r14)
%s move ptr to prevent mem corruption
addi r14,r14,80
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
addi r14,r14,-80
% end write
