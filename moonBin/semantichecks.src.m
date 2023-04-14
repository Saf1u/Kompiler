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
fnsuperHumangreet1
sw 0(r14),r15
lw r15,0(r14)
jr r15 
%funcdef end
%funcdef begin
fnsuperHumangreet2
sw 0(r14),r15
lw r15,0(r14)
jr r15 
%funcdef end
%funcdef begin
fnhumangreet1
sw 0(r14),r15
lw r15,0(r14)
jr r15 
%funcdef end
%funcdef begin
fnpersongreet1
sw 0(r14),r15
lw r15,0(r14)
jr r15 
%funcdef end
%funcdef begin
fncall1
sw 4(r14),r15
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 24(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,12
lw r10,24(r14)
 add r11,r11,r10
sw 28(r14),r11
% end var offset calculation
%begin dot offsetting
lw r10,28(r14)
addi r10,r10,0
sw 32(r14),r10
%end dot offsetting
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
sw 36(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r12,36(r14)
lw r11,32(r14)
add r11,r11,r12
sw 40(r14),r11
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
lw r15,4(r14)
jr r15 
%funcdef end
%funcdef begin
%funcdef begin
fncall2
sw 4(r14),r15
lw r15,4(r14)
jr r15 
%funcdef end
