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
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 16(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r10,16(r14)
 add r11,r11,r10
sw 20(r14),r11
% end var offset calculation
%begin dot offsetting
lw r10,20(r14)
addi r10,r10,8
sw 24(r14),r10
%end dot offsetting
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
sw 28(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r12,28(r14)
lw r11,24(r14)
add r11,r11,r12
sw 32(r14),r11
% end var offset calculation
% begin intlit storeage
addi r12,r0,200
sw 36(r14), r12
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy1

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,36
lw r12,32(r14)
add r12,r14,r12
%set position counter
mul r9,r0,r0
beginCopy1
%move data via register
lw r10,0(r11)
sw 0(r12),r10
%increment registers
addi r11,r11,4
addi r12,r12,4
addi r9,r9,4
%branch out if done
subi r8,r9,4
bnz r8,beginCopy1

endCopy1
% end assignment 
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
sw 40(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,4
lw r10,40(r14)
 add r8,r8,r10
sw 44(r14),r8
% end var offset calculation
%begin dot offsetting
lw r10,44(r14)
addi r10,r10,4
sw 48(r14),r10
%end dot offsetting
% begin generating indice offseting
addi r10,r0,1
addi r8,r0,0
sw 52(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r9,52(r14)
lw r8,48(r14)
add r8,r8,r9
sw 56(r14),r8
% end var offset calculation
% begin intlit storeage
addi r9,r0,500
sw 60(r14), r9
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy2

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,60
lw r9,56(r14)
add r9,r14,r9
%set position counter
mul r11,r0,r0
beginCopy2
%move data via register
lw r10,0(r8)
sw 0(r9),r10
%increment registers
addi r8,r8,4
addi r9,r9,4
addi r11,r11,4
%branch out if done
subi r12,r11,4
bnz r12,beginCopy2

endCopy2
% end assignment 
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 64(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r10,64(r14)
 add r12,r12,r10
sw 68(r14),r12
% end var offset calculation
%begin dot offsetting
lw r10,68(r14)
addi r10,r10,0
sw 72(r14),r10
%end dot offsetting
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
sw 76(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r11,76(r14)
lw r12,72(r14)
add r12,r12,r11
sw 80(r14),r12
% end var offset calculation
% begin intlit storeage
addi r11,r0,400
sw 84(r14), r11
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy3

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,84
lw r11,80(r14)
add r11,r14,r11
%set position counter
mul r8,r0,r0
beginCopy3
%move data via register
lw r10,0(r12)
sw 0(r11),r10
%increment registers
addi r12,r12,4
addi r11,r11,4
addi r8,r8,4
%branch out if done
subi r9,r8,4
bnz r9,beginCopy3

endCopy3
% end assignment 
% begin generating indice offseting
addi r8,r0,1
addi r9,r0,0
sw 88(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,4
lw r10,88(r14)
 add r9,r9,r10
sw 92(r14),r9
% end var offset calculation
%begin dot offsetting
lw r10,92(r14)
addi r10,r10,8
sw 96(r14),r10
%end dot offsetting
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
sw 100(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r8,100(r14)
lw r9,96(r14)
add r9,r9,r8
sw 104(r14),r9
% end var offset calculation
% begin write 
lw r8,104(r14)
add r8,r14,r8
lw r8,0(r8)
%s move ptr to prevent mem corruption
addi r14,r14,228
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
addi r14,r14,-228
% end write
% begin generating indice offseting
addi r8,r0,1
addi r9,r0,0
sw 108(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,4
lw r10,108(r14)
 add r9,r9,r10
sw 112(r14),r9
% end var offset calculation
%begin dot offsetting
lw r10,112(r14)
addi r10,r10,4
sw 116(r14),r10
%end dot offsetting
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
sw 120(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r8,120(r14)
lw r9,116(r14)
add r9,r9,r8
sw 124(r14),r9
% end var offset calculation
% begin write 
lw r8,124(r14)
add r8,r14,r8
lw r8,0(r8)
%s move ptr to prevent mem corruption
addi r14,r14,228
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
addi r14,r14,-228
% end write
% begin generating indice offseting
addi r8,r0,1
addi r9,r0,0
sw 128(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,4
lw r10,128(r14)
 add r9,r9,r10
sw 132(r14),r9
% end var offset calculation
%begin dot offsetting
lw r10,132(r14)
addi r10,r10,0
sw 136(r14),r10
%end dot offsetting
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
sw 140(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r8,140(r14)
lw r9,136(r14)
add r9,r9,r8
sw 144(r14),r9
% end var offset calculation
% begin write 
lw r8,144(r14)
add r8,r14,r8
lw r8,0(r8)
%s move ptr to prevent mem corruption
addi r14,r14,228
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
addi r14,r14,-228
% end write
hlt
