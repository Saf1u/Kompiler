entry
muli r0,r0,0
muli r14,r0,0
addi r14,r0,stackbase
%r14 is stack ptr, stack grows downwards
addi r14,r14,2048
%24kb stack
% begin generating indice offseting
addi r12,r0,0
% done generating indice offseting
% begin var offset calculation
addi r11,r12,pmain
sw offset0(r0),r11
% end var offset calculation
% begin intlit storeage
addi r11,r0,133
sw literal0(r0), r11
% done intlit storeage
% begin assignment 
lw r11,literal0(r0)
 lw r12,offset0(r0) 
sw 0(r12),r11
% end assignment 
% begin intlit storeage
addi r12,r0,293
sw literal1(r0), r12
% done intlit storeage
% begin write 
lw r12,literal1(r0)
sw -8(r14),r12
addi r12,r0,buffer
sw -12(r14),r12
jl r15,intstr
sw -8(r14),r13
jl r15,putstr
% end write
hlt
pmain                res     4
offset0              res     4
literal0             res     4
literal1             res     4
buffer               res     200
stackbase            res     2048
