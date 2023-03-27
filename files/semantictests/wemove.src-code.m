entry
muli r0,r0,0
muli r14,r0,0
addi r14,r0,stackbase
%r14 is stack ptr, stack grows downwards or upwards
%24kb stack
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 8(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r10,8(r14)
 add r11,r11,r10
sw 12(r14),r11
% end var offset calculation
% begin write 
lw r10,12(r14)
add r10,r14,r10
lw r10,0(r10)
%s move ptr to prevent mem corruption
addi r14,r14,120
sw -8(r14),r10
addi r10,r0,buffer
sw -12(r14),r10
jl r15,intstr
sw -8(r14),r13
jl r15,putstr
addi r10,r0,newline
sw -8(r14),r10
jl r15,putstr
%s move ptr to og location 
addi r14,r14,-120
% end write
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
sw 16(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r12,16(r14)
 add r11,r11,r12
sw 20(r14),r11
% end var offset calculation
% begin intlit storeage
addi r12,r0,14
sw 24(r14), r12
% done intlit storeage
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy1

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,24
%read direct value
add r12,r0,r14
addi r12,r12,48
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
% end copy 
addi r14,r14,40
jl r15, fnfactorial1
subi r14,r14,40
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy2

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,40
%read direct value
add r9,r0,r14
addi r9,r9,28
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
% end copy 
% begin assignment 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy3

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,28
lw r11,20(r14)
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
sw 32(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,4
lw r10,32(r14)
 add r9,r9,r10
sw 36(r14),r9
% end var offset calculation
% begin write 
lw r10,36(r14)
add r10,r14,r10
lw r10,0(r10)
%s move ptr to prevent mem corruption
addi r14,r14,120
sw -8(r14),r10
addi r10,r0,buffer
sw -12(r14),r10
jl r15,intstr
sw -8(r14),r13
jl r15,putstr
addi r10,r0,newline
sw -8(r14),r10
jl r15,putstr
%s move ptr to og location 
addi r14,r14,-120
% end write
hlt
%funcdef begin
fnfactorial1
sw 4(r14),r15
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
sw 12(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,8
lw r12,12(r14)
 add r8,r8,r12
sw 16(r14),r8
% end var offset calculation
% begin intlit storeage
addi r12,r0,0
sw 20(r14), r12
% done intlit storeage
% begin RELOP op 
lw r11,16(r14)
add r11,r14,r11
lw r12,0(r11)
lw r8,20(r14)
ceq r9,r12,r8
sw 24(r14),r9
% end relop op 
lw r10,24(r14)
bz r10,else1
% begin intlit storeage
addi r11,r0,1
sw 28(r14), r11
% done intlit storeage
%check if size is zero if yes, leave
addi r7,r0,4
bz r7,endCopy4

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,28
%read direct value
add r11,r0,r14
addi r11,r11,0
%set position counter
mul r12,r0,r0
beginCopy4
%move data via register
lw r8,0(r9)
sw 0(r11),r8
%increment registers
addi r9,r9,4
addi r11,r11,4
addi r12,r12,4
%branch out if done
subi r7,r12,4
bnz r7,beginCopy4

endCopy4
% end copy 
j endif1
else1
% begin generating indice offseting
addi r12,r0,1
addi r7,r0,0
sw 32(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r7,r0,8
lw r8,32(r14)
 add r7,r7,r8
sw 36(r14),r7
% end var offset calculation
% begin generating indice offseting
addi r8,r0,1
addi r7,r0,0
sw 40(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r7,r0,8
lw r12,40(r14)
 add r7,r7,r12
sw 44(r14),r7
% end var offset calculation
% begin intlit storeage
addi r12,r0,1
sw 48(r14), r12
% done intlit storeage
% begin add op 
lw r9,44(r14)
add r9,r14,r9
lw r12,0(r9)
lw r7,48(r14)
sub r8,r12,r7
sw 52(r14),r8
% end add op 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy5

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,52
%read direct value
add r9,r0,r14
addi r9,r9,72
%set position counter
mul r12,r0,r0
beginCopy5
%move data via register
lw r7,0(r8)
sw 0(r9),r7
%increment registers
addi r8,r8,4
addi r9,r9,4
addi r12,r12,4
%branch out if done
subi r11,r12,4
bnz r11,beginCopy5

endCopy5
% end copy 
addi r14,r14,64
jl r15, fnfactorial1
subi r14,r14,64
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy6

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,64
%read direct value
add r12,r0,r14
addi r12,r12,56
%set position counter
mul r8,r0,r0
beginCopy6
%move data via register
lw r7,0(r11)
sw 0(r12),r7
%increment registers
addi r11,r11,4
addi r12,r12,4
addi r8,r8,4
%branch out if done
subi r9,r8,4
bnz r9,beginCopy6

endCopy6
% end copy 
% begin mult op 
lw r11,36(r14)
add r11,r14,r11
lw r8,0(r11)
lw r9,56(r14)
mul r7,r8,r9
sw 60(r14),r7
% end mult op 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy7

%set left and right ptrs
%read direct value
add r7,r0,r14
addi r7,r7,60
%read direct value
add r11,r0,r14
addi r11,r11,0
%set position counter
mul r8,r0,r0
beginCopy7
%move data via register
lw r9,0(r7)
sw 0(r11),r9
%increment registers
addi r7,r7,4
addi r11,r11,4
addi r8,r8,4
%branch out if done
subi r12,r8,4
bnz r12,beginCopy7

endCopy7
% end copy 
endif1
lw r15,4(r14)
jr r15 
%funcdef end
