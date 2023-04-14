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
hlt
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 0(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,0
lw r10,0(r14)
 add r11,r11,r10
sw 0(r14),r11
% end var offset calculation
%begin dot offsetting
% begin generating indice offseting
% begin var offset calculation
lw r12,0(r14)
lw r11,0(r14)
add r11,r11,r12
sw 0(r14),r11
% end var offset calculation
% begin write 
lw r12,0(r14)
add r12,r14,r12
lw r12,0(r12)
%s move ptr to prevent mem corruption
addi r14,r14,84
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
addi r14,r14,-84
% end write
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 0(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,0
lw r10,0(r14)
 add r11,r11,r10
sw 0(r14),r11
% end var offset calculation
%begin dot offsetting
% begin generating indice offseting
% begin var offset calculation
lw r12,0(r14)
lw r11,0(r14)
add r11,r11,r12
sw 0(r14),r11
% end var offset calculation
% begin write 
lw r12,0(r14)
add r12,r14,r12
lw r12,0(r12)
%s move ptr to prevent mem corruption
addi r14,r14,84
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
addi r14,r14,-84
% end write
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 0(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,0
lw r10,0(r14)
 add r11,r11,r10
sw 0(r14),r11
% end var offset calculation
%begin dot offsetting
% begin generating indice offseting
% begin var offset calculation
lw r12,0(r14)
lw r11,0(r14)
add r11,r11,r12
sw 0(r14),r11
% end var offset calculation
% begin write 
lw r12,0(r14)
add r12,r14,r12
lw r12,0(r12)
%s move ptr to prevent mem corruption
addi r14,r14,84
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
addi r14,r14,-84
% end write
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 0(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,0
lw r10,0(r14)
 add r11,r11,r10
sw 0(r14),r11
% end var offset calculation
%begin dot offsetting
% begin generating indice offseting
% begin var offset calculation
lw r12,0(r14)
lw r11,0(r14)
add r11,r11,r12
sw 0(r14),r11
% end var offset calculation
% begin write 
lw r12,0(r14)
add r12,r14,r12
lw r12,0(r12)
%s move ptr to prevent mem corruption
addi r14,r14,84
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
addi r14,r14,-84
% end write
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 0(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,0
lw r10,0(r14)
 add r11,r11,r10
sw 0(r14),r11
% end var offset calculation
%begin dot offsetting
% begin generating indice offseting
% begin var offset calculation
lw r12,0(r14)
lw r11,0(r14)
add r11,r11,r12
sw 0(r14),r11
% end var offset calculation
% begin write 
lw r12,0(r14)
add r12,r14,r12
lw r12,0(r12)
%s move ptr to prevent mem corruption
addi r14,r14,84
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
addi r14,r14,-84
% end write
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 0(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,0
lw r10,0(r14)
 add r11,r11,r10
sw 0(r14),r11
% end var offset calculation
%begin dot offsetting
lw r10,0(r14)
addi r10,r10,0
sw 0(r14),r10
%end dot offsetting
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
sw 0(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,0
lw r12,0(r14)
 add r11,r11,r12
sw 0(r14),r11
% end var offset calculation
%begin dot offsetting
lw r12,0(r14)
addi r12,r12,0
sw 0(r14),r12
%end dot offsetting
% begin intlit storeage
addi r12,r0,1
sw 0(r14), r12
% done intlit storeage
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
lw r10,0(r14)
muli r9,r12,4
mul r9,r10,r9
muli r9,r9,5
add r11,r11,r9
sw 0(r14),r11
% done generating indice offseting
% begin var offset calculation
addi r11,r0,0
lw r10,0(r14)
 add r11,r11,r10
sw 0(r14),r11
% end var offset calculation
% begin intlit storeage
addi r10,r0,44
sw 0(r14), r10
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy1

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,0
lw r10,0(r14)
add r10,r14,r10
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
subi r8,r9,4
bnz r8,beginCopy1

endCopy1
% end assignment 
% begin intlit storeage
addi r9,r0,1
sw 0(r14), r9
% done intlit storeage
% begin generating indice offseting
% begin var offset calculation
addi r8,r0,0
lw r12,0(r14)
 add r8,r8,r12
sw 0(r14),r8
% end var offset calculation
% begin intlit storeage
addi r12,r0,4
sw 0(r14), r12
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy2

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,0
lw r12,0(r14)
add r12,r14,r12
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
subi r10,r11,4
bnz r10,beginCopy2

endCopy2
% end assignment 
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
sw 0(r14),r10
% done generating indice offseting
% begin var offset calculation
addi r10,r0,0
lw r9,0(r14)
 add r10,r10,r9
sw 0(r14),r10
% end var offset calculation
hlt
%funcdef begin
fnrullergoodBye1
sw 0(r14),r15
% begin intlit storeage
addi r9,r0,20
sw 8(r14), r9
% done intlit storeage
% begin write 
lw r9,8(r14)
%s move ptr to prevent mem corruption
addi r14,r14,92
sw -8(r14),r9
addi r9,r0,buffer
sw -12(r14),r9
jl r15,intstr
sw -8(r14),r13
jl r15,putstr
addi r9,r0,newline
sw -8(r14),r9
jl r15,putstr
%s move ptr to og location 
addi r14,r14,-92
% end write
lw r15,0(r14)
jr r15 
%funcdef end
%funcdef begin
fntest1
sw 0(r14),r15
% begin generating indice offseting
addi r9,r0,1
addi r10,r0,0
sw 8(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,4
lw r11,8(r14)
 add r10,r10,r11
sw 12(r14),r10
% end var offset calculation
%begin dot offsetting
% begin generating indice offseting
% begin var offset calculation
lw r9,20(r14)
lw r10,16(r14)
add r10,r10,r9
sw 24(r14),r10
% end var offset calculation
% begin intlit storeage
addi r9,r0,33
sw 28(r14), r9
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy3

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,28
lw r9,24(r14)
add r9,r14,r9
%set position counter
mul r8,r0,r0
beginCopy3
%move data via register
lw r11,0(r10)
sw 0(r9),r11
%increment registers
addi r10,r10,4
addi r9,r9,4
addi r8,r8,4
%branch out if done
subi r12,r8,4
bnz r12,beginCopy3

endCopy3
% end assignment 
lw r15,0(r14)
jr r15 
%funcdef end
%funcdef begin
fnarrayAcceptor1
sw 0(r14),r15
lw r15,0(r14)
jr r15 
%funcdef end
