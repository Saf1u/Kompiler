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
%funcdef begin
fnpersongreet1
sw 0(r14),r15
lw r15,0(r14)
jr r15 
%funcdef end
%funcdef begin
fncall1
sw 4(r14),r15
lw r15,4(r14)
jr r15 
%funcdef end
%funcdef begin
