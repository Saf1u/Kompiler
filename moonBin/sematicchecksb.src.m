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
fnside1
sw 4(r14),r15
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 20(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,16
lw r10,20(r14)
 add r11,r11,r10
sw 24(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
sw 28(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,12
lw r12,28(r14)
 add r11,r11,r12
sw 32(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 36(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,8
lw r10,36(r14)
 add r11,r11,r10
sw 40(r14),r11
% end var offset calculation
% begin add op 
lw r9,32(r14)
add r9,r14,r9
lw r10,0(r9)
lw r9,40(r14)
add r9,r14,r9
lw r11,0(r9)
add r12,r10,r11
sw 44(r14),r12
% end add op 
% begin intlit storeage
addi r9,r0,10
sw 44(r14), r9
% done intlit storeage
% begin add op 
lw r9,44(r14)
lw r12,44(r14)
add r11,r9,r12
sw 48(r14),r11
% end add op 
% begin intlit storeage
addi r10,r0,200
sw 48(r14), r10
% done intlit storeage
% begin add op 
lw r10,48(r14)
lw r11,48(r14)
add r12,r10,r11
sw 52(r14),r12
% end add op 
% begin add op 
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,0
bz r8,endCopy1

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,56
lw r9,24(r14)
add r9,r14,r9
%set position counter
mul r10,r0,r0
beginCopy1
%move data via register
lw r11,0(r12)
sw 0(r9),r11
%increment registers
addi r12,r12,4
addi r9,r9,4
addi r10,r10,4
%branch out if done
subi r8,r10,0
bnz r8,beginCopy1

endCopy1
% end assignment 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy2

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,10
%read direct value
add r10,r0,r14
addi r10,r10,0
%set position counter
mul r12,r0,r0
beginCopy2
%move data via register
lw r11,0(r8)
sw 0(r10),r11
%increment registers
addi r8,r8,4
addi r10,r10,4
addi r12,r12,4
%branch out if done
subi r9,r12,4
bnz r9,beginCopy2

endCopy2
% end copy 
lw r15,4(r14)
jr r15 
%funcdef end
%funcdef begin
fnsideb1
sw 4(r14),r15
% begin generating indice offseting
% begin var offset calculation
% begin intlit storeage
addi r11,r0,33
sw 16(r14), r11
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy3

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,16
lw r11,12(r14)
add r11,r14,r11
%set position counter
mul r8,r0,r0
beginCopy3
%move data via register
lw r12,0(r9)
sw 0(r11),r12
%increment registers
addi r9,r9,4
addi r11,r11,4
addi r8,r8,4
%branch out if done
subi r10,r8,4
bnz r10,beginCopy3

endCopy3
% end assignment 
lw r15,4(r14)
jr r15 
%funcdef end
%funcdef begin
fnhumangreet1
sw 0(r14),r15
% begin generating indice offseting
addi r8,r0,1
addi r10,r0,0
sw 12(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,4
lw r12,12(r14)
 add r10,r10,r12
sw 16(r14),r10
% end var offset calculation
% begin write 
lw r12,16(r14)
add r12,r14,r12
lw r12,0(r12)
%s move ptr to prevent mem corruption
addi r14,r14,116
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
addi r14,r14,-116
% end write
% begin generating indice offseting
addi r12,r0,1
addi r10,r0,0
sw 20(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,8
lw r8,20(r14)
 add r10,r10,r8
sw 24(r14),r10
% end var offset calculation
% begin write 
lw r8,24(r14)
add r8,r14,r8
lw r8,0(r8)
%s move ptr to prevent mem corruption
addi r14,r14,116
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
addi r14,r14,-116
% end write
% begin generating indice offseting
% begin var offset calculation
% begin write 
lw r12,32(r14)
add r12,r14,r12
lw r12,0(r12)
%s move ptr to prevent mem corruption
addi r14,r14,116
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
addi r14,r14,-116
% end write
lw r15,0(r14)
jr r15 
%funcdef end
