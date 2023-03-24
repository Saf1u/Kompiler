entry
muli r0,r0,0
muli r14,r0,0
addi r14,r0,stackbase
%r14 is stack ptr, stack grows downwards
addi r14,r14,2048
%24kb stack
hlt
buffer               res     200
stackbase            res     2048
newline              db      ,13,10,0
