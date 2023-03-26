entry
muli r0,r0,0
muli r14,r0,0
addi r14,r0,stackbase
%r14 is stack ptr, stack grows downwards or upwards
%24kb stack
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 108(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,100
lw r10,108(r14)
 add r11,r11,r10
sw 112(r14),r11
% end var offset calculation
% begin intlit storeage
addi r10,r0,3
sw 116(r14), r10
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy1

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,116
lw r10,112(r14)
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
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
sw 120(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,104
lw r12,120(r14)
 add r8,r8,r12
sw 124(r14),r8
% end var offset calculation
% begin intlit storeage
addi r12,r0,1
sw 128(r14), r12
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy2

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,128
lw r12,124(r14)
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
% begin intlit storeage
addi r11,r0,1
sw 132(r14), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,1
sw 136(r14), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,3
sw 140(r14), r11
% done intlit storeage
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
lw r9,140(r14)
muli r8,r11,4
mul r8,r9,r8
add r10,r10,r8
lw r9,136(r14)
muli r8,r11,4
mul r8,r9,r8
muli r8,r8,4
add r10,r10,r8
lw r9,132(r14)
muli r8,r11,4
mul r8,r9,r8
muli r8,r8,4
muli r8,r8,3
add r10,r10,r8
sw 144(r14),r10
% done generating indice offseting
% begin var offset calculation
addi r10,r0,4
lw r9,144(r14)
 add r10,r10,r9
sw 148(r14),r10
% end var offset calculation
% begin intlit storeage
addi r9,r0,9
sw 152(r14), r9
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy3

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,152
lw r9,148(r14)
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
% begin generating indice offseting
addi r8,r0,1
addi r12,r0,0
sw 156(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,104
lw r11,156(r14)
 add r12,r12,r11
sw 160(r14),r12
% end var offset calculation
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 164(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,104
lw r8,164(r14)
 add r12,r12,r8
sw 168(r14),r12
% end var offset calculation
% begin generating indice offseting
addi r8,r0,1
addi r12,r0,0
sw 172(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,100
lw r11,172(r14)
 add r12,r12,r11
sw 176(r14),r12
% end var offset calculation
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
lw r8,176(r14)
add r8,r14,r8
lw r8,0(r8)
muli r10,r11,4
mul r10,r8,r10
add r12,r12,r10
lw r8,168(r14)
add r8,r14,r8
lw r8,0(r8)
muli r10,r11,4
mul r10,r8,r10
muli r10,r10,4
add r12,r12,r10
lw r8,160(r14)
add r8,r14,r8
lw r8,0(r8)
muli r10,r11,4
mul r10,r8,r10
muli r10,r10,4
muli r10,r10,3
add r12,r12,r10
sw 180(r14),r12
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r8,180(r14)
 add r12,r12,r8
sw 184(r14),r12
% end var offset calculation
% begin write 
lw r8,184(r14)
add r8,r14,r8
lw r8,0(r8)
%s move ptr to prevent mem corruption
addi r14,r14,368
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
addi r14,r14,-368
% end write
% begin intlit storeage
addi r8,r0,1
sw 188(r14), r8
% done intlit storeage
% begin intlit storeage
addi r8,r0,1
sw 192(r14), r8
% done intlit storeage
% begin intlit storeage
addi r8,r0,3
sw 196(r14), r8
% done intlit storeage
% begin generating indice offseting
addi r8,r0,1
addi r12,r0,0
lw r11,196(r14)
muli r10,r8,4
mul r10,r11,r10
add r12,r12,r10
lw r11,192(r14)
muli r10,r8,4
mul r10,r11,r10
muli r10,r10,4
add r12,r12,r10
lw r11,188(r14)
muli r10,r8,4
mul r10,r11,r10
muli r10,r10,4
muli r10,r10,3
add r12,r12,r10
sw 200(r14),r12
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r11,200(r14)
 add r12,r12,r11
sw 204(r14),r12
% end var offset calculation
% begin write 
lw r11,204(r14)
add r11,r14,r11
lw r11,0(r11)
%s move ptr to prevent mem corruption
addi r14,r14,368
sw -8(r14),r11
addi r11,r0,buffer
sw -12(r14),r11
jl r15,intstr
sw -8(r14),r13
jl r15,putstr
addi r11,r0,newline
sw -8(r14),r11
jl r15,putstr
%s move ptr to og location 
addi r14,r14,-368
% end write
% begin intlit storeage
addi r11,r0,1
sw 208(r14), r11
% done intlit storeage
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 212(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,104
lw r8,212(r14)
 add r12,r12,r8
sw 216(r14),r12
% end var offset calculation
% begin intlit storeage
addi r8,r0,3
sw 220(r14), r8
% done intlit storeage
% begin generating indice offseting
addi r8,r0,1
addi r12,r0,0
lw r11,220(r14)
muli r10,r8,4
mul r10,r11,r10
add r12,r12,r10
lw r11,216(r14)
add r11,r14,r11
lw r11,0(r11)
muli r10,r8,4
mul r10,r11,r10
muli r10,r10,4
add r12,r12,r10
lw r11,208(r14)
muli r10,r8,4
mul r10,r11,r10
muli r10,r10,4
muli r10,r10,3
add r12,r12,r10
sw 224(r14),r12
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r11,224(r14)
 add r12,r12,r11
sw 228(r14),r12
% end var offset calculation
% begin intlit storeage
addi r11,r0,92
sw 232(r14), r11
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy4

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,232
lw r11,228(r14)
add r11,r14,r11
%set position counter
mul r10,r0,r0
beginCopy4
%move data via register
lw r8,0(r12)
sw 0(r11),r8
%increment registers
addi r12,r12,4
addi r11,r11,4
addi r10,r10,4
%branch out if done
subi r9,r10,4
bnz r9,beginCopy4

endCopy4
% end assignment 
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
sw 236(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,104
lw r8,236(r14)
 add r9,r9,r8
sw 240(r14),r9
% end var offset calculation
% begin generating indice offseting
addi r8,r0,1
addi r9,r0,0
sw 244(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,104
lw r10,244(r14)
 add r9,r9,r10
sw 248(r14),r9
% end var offset calculation
% begin intlit storeage
addi r10,r0,3
sw 252(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
lw r8,252(r14)
muli r12,r10,4
mul r12,r8,r12
add r9,r9,r12
lw r8,248(r14)
add r8,r14,r8
lw r8,0(r8)
muli r12,r10,4
mul r12,r8,r12
muli r12,r12,4
add r9,r9,r12
lw r8,240(r14)
add r8,r14,r8
lw r8,0(r8)
muli r12,r10,4
mul r12,r8,r12
muli r12,r12,4
muli r12,r12,3
add r9,r9,r12
sw 256(r14),r9
% done generating indice offseting
% begin var offset calculation
addi r9,r0,4
lw r8,256(r14)
 add r9,r9,r8
sw 260(r14),r9
% end var offset calculation
% begin write 
lw r8,260(r14)
add r8,r14,r8
lw r8,0(r8)
%s move ptr to prevent mem corruption
addi r14,r14,368
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
addi r14,r14,-368
% end write
% begin intlit storeage
addi r8,r0,1
sw 264(r14), r8
% done intlit storeage
% begin intlit storeage
addi r8,r0,1
sw 268(r14), r8
% done intlit storeage
% begin generating indice offseting
addi r8,r0,1
addi r9,r0,0
sw 272(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,100
lw r10,272(r14)
 add r9,r9,r10
sw 276(r14),r9
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
lw r8,276(r14)
add r8,r14,r8
lw r8,0(r8)
muli r12,r10,4
mul r12,r8,r12
add r9,r9,r12
lw r8,268(r14)
muli r12,r10,4
mul r12,r8,r12
muli r12,r12,4
add r9,r9,r12
lw r8,264(r14)
muli r12,r10,4
mul r12,r8,r12
muli r12,r12,4
muli r12,r12,3
add r9,r9,r12
sw 280(r14),r9
% done generating indice offseting
% begin var offset calculation
addi r9,r0,4
lw r8,280(r14)
 add r9,r9,r8
sw 284(r14),r9
% end var offset calculation
% begin write 
lw r8,284(r14)
add r8,r14,r8
lw r8,0(r8)
%s move ptr to prevent mem corruption
addi r14,r14,368
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
addi r14,r14,-368
% end write
hlt
