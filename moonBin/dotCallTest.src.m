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
% begin intlit storeage
addi r12,r0,2
sw 12(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,3
sw 16(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,4
sw 20(r14), r12
% done intlit storeage
hlt
%funcdef begin
fnmanevaluate1
sw 8(r14),r15
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 32(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,24
lw r10,32(r14)
 add r11,r11,r10
sw 36(r14),r11
% end var offset calculation
%check if size is zero if yes, leave
addi r8,r0,8
bz r8,endCopy1

%set left and right ptrs
%set ptr
lw r11,36(r14)
add r11,r14,r11
%read direct value
add r10,r0,r14
addi r10,r10,0
%set position counter
mul r9,r0,r0
beginCopy1
%move data via register
lw r12,0(r11)
sw 0(r10),r12
%increment registers
addi r11,r11,4
addi r10,r10,4
addi r9,r9,4
%branch out if done
subi r8,r9,8
bnz r8,beginCopy1

endCopy1
% end copy 
lw r15,8(r14)
jr r15 
%funcdef end
%funcdef begin
fnmanconstructor1
sw 8(r14),r15
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
sw 32(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,24
lw r12,32(r14)
 add r8,r8,r12
sw 36(r14),r8
% end var offset calculation
%check if size is zero if yes, leave
addi r10,r0,8
bz r10,endCopy2

%set left and right ptrs
%set ptr
lw r8,36(r14)
add r8,r14,r8
%read direct value
add r12,r0,r14
addi r12,r12,0
%set position counter
mul r11,r0,r0
beginCopy2
%move data via register
lw r9,0(r8)
sw 0(r12),r9
%increment registers
addi r8,r8,4
addi r12,r12,4
addi r11,r11,4
%branch out if done
subi r10,r11,8
bnz r10,beginCopy2

endCopy2
% end copy 
lw r15,8(r14)
jr r15 
%funcdef end
