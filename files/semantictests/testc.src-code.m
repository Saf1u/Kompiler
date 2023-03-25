entry
muli r0,r0,0
muli r14,r0,0
addi r14,r0,stackbase
%r14 is stack ptr, stack grows downwards
addi r14,r14,2048
%24kb stack
% begin intlit storeage
addi r12,r0,0
sw literal0(r0), r12
% done intlit storeage
hlt
