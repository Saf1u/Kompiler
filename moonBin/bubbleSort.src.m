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
sw 40(r14),r11
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r10,40(r14)
 add r11,r11,r10
sw 44(r14),r11
% end var offset calculation
% begin intlit storeage
addi r10,r0,9
sw 48(r14), r10
% done intlit storeage
%check if size is zero if yes, leave
addi r8,r0,36
bz r8,endCopy1

%set left and right ptrs
%set ptr
lw r11,44(r14)
add r11,r14,r11
addi r11,r11,0
%read direct value
add r10,r0,r14
addi r10,r10,56
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
subi r8,r9,36
bnz r8,beginCopy1

endCopy1
% end copy 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy2

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,48
%read direct value
add r9,r0,r14
addi r9,r9,92
%set position counter
mul r11,r0,r0
beginCopy2
%move data via register
lw r12,0(r8)
sw 0(r9),r12
%increment registers
addi r8,r8,4
addi r9,r9,4
addi r11,r11,4
%branch out if done
subi r10,r11,4
bnz r10,beginCopy2

endCopy2
% end copy 
addi r14,r14,52
jl r15, fnprintArray1
subi r14,r14,52
%check if size is zero if yes, leave
addi r9,r0,0
bz r9,endCopy3

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,52
%read direct value
add r11,r0,r14
addi r11,r11,52
%set position counter
mul r8,r0,r0
beginCopy3
%move data via register
lw r12,0(r10)
sw 0(r11),r12
%increment registers
addi r10,r10,4
addi r11,r11,4
addi r8,r8,4
%branch out if done
subi r9,r8,0
bnz r9,beginCopy3

endCopy3
% end copy 
hlt
%funcdef begin
fnprintArray1
sw 0(r14),r15
% begin generating indice offseting
addi r8,r0,1
addi r9,r0,0
sw 52(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,44
lw r12,52(r14)
 add r9,r9,r12
sw 56(r14),r9
% end var offset calculation
% begin generating indice offseting
addi r12,r0,1
addi r9,r0,0
sw 60(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,40
lw r8,60(r14)
 add r9,r9,r8
sw 64(r14),r9
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy4

%set left and right ptrs
%set ptr
lw r9,64(r14)
add r9,r14,r9
lw r8,56(r14)
add r8,r14,r8
%set position counter
mul r10,r0,r0
beginCopy4
%move data via register
lw r12,0(r9)
sw 0(r8),r12
%increment registers
addi r9,r9,4
addi r8,r8,4
addi r10,r10,4
%branch out if done
subi r11,r10,4
bnz r11,beginCopy4

endCopy4
% end assignment 
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
sw 68(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,48
lw r12,68(r14)
 add r11,r11,r12
sw 72(r14),r11
% end var offset calculation
% begin intlit storeage
addi r12,r0,0
sw 76(r14), r12
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy5

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,76
lw r12,72(r14)
add r12,r14,r12
%set position counter
mul r9,r0,r0
beginCopy5
%move data via register
lw r10,0(r11)
sw 0(r12),r10
%increment registers
addi r11,r11,4
addi r12,r12,4
addi r9,r9,4
%branch out if done
subi r8,r9,4
bnz r8,beginCopy5

endCopy5
% end assignment 
gowhile1
% begin generating indice offseting
addi r8,r0,1
addi r10,r0,0
sw 80(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,48
lw r11,80(r14)
 add r10,r10,r11
sw 84(r14),r10
% end var offset calculation
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
sw 88(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,44
lw r8,88(r14)
 add r10,r10,r8
sw 92(r14),r10
% end var offset calculation
% begin RELOP op 
lw r12,84(r14)
add r12,r14,r12
lw r8,0(r12)
lw r12,92(r14)
add r12,r14,r12
lw r10,0(r12)
clt r11,r8,r10
sw 96(r14),r11
% end relop op 
lw r9,96(r14)
bz r9,endwhile1
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 100(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,48
lw r10,100(r14)
 add r11,r11,r10
sw 104(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
lw r12,104(r14)
add r12,r14,r12
lw r12,0(r12)
muli r8,r10,4
mul r8,r12,r8
add r11,r11,r8
sw 108(r14),r11
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r12,108(r14)
 add r11,r11,r12
sw 112(r14),r11
% end var offset calculation
% begin write 
lw r12,112(r14)
add r12,r14,r12
lw r12,0(r12)
%s move ptr to prevent mem corruption
addi r14,r14,220
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
addi r14,r14,-220
% end write
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 116(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,48
lw r10,116(r14)
 add r11,r11,r10
sw 120(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
sw 124(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,48
lw r12,124(r14)
 add r11,r11,r12
sw 128(r14),r11
% end var offset calculation
% begin intlit storeage
addi r12,r0,1
sw 132(r14), r12
% done intlit storeage
% begin add op 
lw r8,128(r14)
add r8,r14,r8
lw r12,0(r8)
lw r11,132(r14)
add r10,r12,r11
sw 136(r14),r10
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r7,r0,4
bz r7,endCopy6

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,136
lw r8,120(r14)
add r8,r14,r8
%set position counter
mul r12,r0,r0
beginCopy6
%move data via register
lw r11,0(r10)
sw 0(r8),r11
%increment registers
addi r10,r10,4
addi r8,r8,4
addi r12,r12,4
%branch out if done
subi r7,r12,4
bnz r7,beginCopy6

endCopy6
% end assignment 
j gowhile1
endwhile1
lw r15,0(r14)
jr r15 
%funcdef end
