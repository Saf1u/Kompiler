entry
muli r0,r0,0
muli r14,r0,0
addi r14,r0,stackbase
%r14 is stack ptr, stack grows downwards or upwards
%24kb stack
hlt
%funcdef begin
fnmutate1
sw 0(r14),r15
lw r15,0(r14)
jr r15 
%funcdef end
