entry
muli r0,r0,0
muli r14,r0,0
addi r14,r0,stackbase
%r14 is stack ptr, stack grows downwards or upwards
%24kb stack
% begin intlit storeage
addi r12,r0,9
sw 36(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,22
sw 40(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,10
sw 44(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,20
sw 48(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,30
sw 52(r14), r12
% done intlit storeage
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy1

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,36
%read direct value
add r12,r0,r14
addi r12,r12,612
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
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy2

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,40
%read direct value
add r9,r0,r14
addi r9,r9,616
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
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy3

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,44
%read direct value
add r11,r0,r14
addi r11,r11,620
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
% end copy 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy4

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,48
%read direct value
add r8,r0,r14
addi r8,r8,624
%set position counter
mul r12,r0,r0
beginCopy4
%move data via register
lw r10,0(r9)
sw 0(r8),r10
%increment registers
addi r9,r9,4
addi r8,r8,4
addi r12,r12,4
%branch out if done
subi r11,r12,4
bnz r11,beginCopy4

endCopy4
% end copy 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy5

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,52
%read direct value
add r12,r0,r14
addi r12,r12,628
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
% end copy 
addi r14,r14,576
jl r15, fnmanconstructor1
subi r14,r14,576
%check if size is zero if yes, leave
addi r12,r0,32
bz r12,endCopy6

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,576
%read direct value
add r9,r0,r14
addi r9,r9,4
%set position counter
mul r11,r0,r0
beginCopy6
%move data via register
lw r10,0(r8)
sw 0(r9),r10
%increment registers
addi r8,r8,4
addi r9,r9,4
addi r11,r11,4
%branch out if done
subi r12,r11,32
bnz r12,beginCopy6

endCopy6
% end copy 
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 56(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r10,56(r14)
 add r12,r12,r10
sw 60(r14),r12
% end var offset calculation
%begin dot offsetting
lw r10,60(r14)
addi r10,r10,0
sw 64(r14),r10
%end dot offsetting
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
sw 68(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r11,68(r14)
lw r12,64(r14)
add r12,r12,r11
sw 72(r14),r12
% end var offset calculation
% begin write 
lw r11,72(r14)
add r11,r14,r11
lw r11,0(r11)
%s move ptr to prevent mem corruption
addi r14,r14,656
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
addi r14,r14,-656
% end write
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 76(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r10,76(r14)
 add r12,r12,r10
sw 80(r14),r12
% end var offset calculation
%begin dot offsetting
lw r10,80(r14)
sw 84(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,49
sw 88(r14), r10
% done intlit storeage
%check if size is zero if yes, leave
addi r9,r0,32
bz r9,endCopy7

%set left and right ptrs
%set ptr
lw r12,84(r14)
add r12,r14,r12
addi r12,r12,0
%read direct value
add r10,r0,r14
addi r10,r10,584
%set position counter
mul r8,r0,r0
beginCopy7
%move data via register
lw r11,0(r12)
sw 0(r10),r11
%increment registers
addi r12,r12,4
addi r10,r10,4
addi r8,r8,4
%branch out if done
subi r9,r8,32
bnz r9,beginCopy7

endCopy7
% end copy 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy8

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,88
%read direct value
add r8,r0,r14
addi r8,r8,616
%set position counter
mul r12,r0,r0
beginCopy8
%move data via register
lw r11,0(r9)
sw 0(r8),r11
%increment registers
addi r9,r9,4
addi r8,r8,4
addi r12,r12,4
%branch out if done
subi r10,r12,4
bnz r10,beginCopy8

endCopy8
% end copy 
addi r14,r14,576
jl r15, fnmanmutateX1
subi r14,r14,576
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy9

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,576
%read direct value
add r12,r0,r14
addi r12,r12,92
%set position counter
mul r9,r0,r0
beginCopy9
%move data via register
lw r11,0(r10)
sw 0(r12),r11
%increment registers
addi r10,r10,4
addi r12,r12,4
addi r9,r9,4
%branch out if done
subi r8,r9,4
bnz r8,beginCopy9

endCopy9
% end copy 
%begin copy back object
%check if size is zero if yes, leave
addi r12,r0,32
bz r12,endCopy10

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,584
%set ptr
lw r9,84(r14)
add r9,r14,r9
addi r9,r9,0
%set position counter
mul r10,r0,r0
beginCopy10
%move data via register
lw r11,0(r8)
sw 0(r9),r11
%increment registers
addi r8,r8,4
addi r9,r9,4
addi r10,r10,4
%branch out if done
subi r12,r10,32
bnz r12,beginCopy10

endCopy10
% end copy 
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
sw 96(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r11,96(r14)
 add r12,r12,r11
sw 100(r14),r12
% end var offset calculation
%begin dot offsetting
lw r11,100(r14)
addi r11,r11,0
sw 104(r14),r11
%end dot offsetting
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 108(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r10,108(r14)
lw r12,104(r14)
add r12,r12,r10
sw 112(r14),r12
% end var offset calculation
% begin write 
lw r10,112(r14)
add r10,r14,r10
lw r10,0(r10)
%s move ptr to prevent mem corruption
addi r14,r14,656
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
addi r14,r14,-656
% end write
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
sw 116(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r11,116(r14)
 add r12,r12,r11
sw 120(r14),r12
% end var offset calculation
%begin dot offsetting
lw r11,120(r14)
addi r11,r11,4
sw 124(r14),r11
%end dot offsetting
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 128(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r10,128(r14)
lw r12,124(r14)
add r12,r12,r10
sw 132(r14),r12
% end var offset calculation
% begin write 
lw r10,132(r14)
add r10,r14,r10
lw r10,0(r10)
%s move ptr to prevent mem corruption
addi r14,r14,656
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
addi r14,r14,-656
% end write
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
sw 136(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r11,136(r14)
 add r12,r12,r11
sw 140(r14),r12
% end var offset calculation
%begin dot offsetting
lw r11,140(r14)
sw 144(r14),r11
%end dot offsetting
% begin intlit storeage
addi r11,r0,44
sw 148(r14), r11
% done intlit storeage
%check if size is zero if yes, leave
addi r9,r0,32
bz r9,endCopy11

%set left and right ptrs
%set ptr
lw r12,144(r14)
add r12,r14,r12
addi r12,r12,0
%read direct value
add r11,r0,r14
addi r11,r11,584
%set position counter
mul r8,r0,r0
beginCopy11
%move data via register
lw r10,0(r12)
sw 0(r11),r10
%increment registers
addi r12,r12,4
addi r11,r11,4
addi r8,r8,4
%branch out if done
subi r9,r8,32
bnz r9,beginCopy11

endCopy11
% end copy 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy12

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,148
%read direct value
add r8,r0,r14
addi r8,r8,616
%set position counter
mul r12,r0,r0
beginCopy12
%move data via register
lw r10,0(r9)
sw 0(r8),r10
%increment registers
addi r9,r9,4
addi r8,r8,4
addi r12,r12,4
%branch out if done
subi r11,r12,4
bnz r11,beginCopy12

endCopy12
% end copy 
addi r14,r14,576
jl r15, fnmanmutateH1
subi r14,r14,576
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy13

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,576
%read direct value
add r12,r0,r14
addi r12,r12,152
%set position counter
mul r9,r0,r0
beginCopy13
%move data via register
lw r10,0(r11)
sw 0(r12),r10
%increment registers
addi r11,r11,4
addi r12,r12,4
addi r9,r9,4
%branch out if done
subi r8,r9,4
bnz r8,beginCopy13

endCopy13
% end copy 
%begin copy back object
%check if size is zero if yes, leave
addi r12,r0,32
bz r12,endCopy14

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,584
%set ptr
lw r9,144(r14)
add r9,r14,r9
addi r9,r9,0
%set position counter
mul r11,r0,r0
beginCopy14
%move data via register
lw r10,0(r8)
sw 0(r9),r10
%increment registers
addi r8,r8,4
addi r9,r9,4
addi r11,r11,4
%branch out if done
subi r12,r11,32
bnz r12,beginCopy14

endCopy14
% end copy 
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 156(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r10,156(r14)
 add r12,r12,r10
sw 160(r14),r12
% end var offset calculation
%begin dot offsetting
lw r10,160(r14)
addi r10,r10,4
sw 164(r14),r10
%end dot offsetting
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
sw 168(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r11,168(r14)
lw r12,164(r14)
add r12,r12,r11
sw 172(r14),r12
% end var offset calculation
% begin write 
lw r11,172(r14)
add r11,r14,r11
lw r11,0(r11)
%s move ptr to prevent mem corruption
addi r14,r14,656
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
addi r14,r14,-656
% end write
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 176(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r10,176(r14)
 add r12,r12,r10
sw 180(r14),r12
% end var offset calculation
%begin dot offsetting
lw r10,180(r14)
addi r10,r10,8
sw 184(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,0
sw 188(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
lw r11,188(r14)
muli r8,r10,4
mul r8,r11,r8
add r12,r12,r8
sw 192(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r11,192(r14)
lw r12,184(r14)
add r12,r12,r11
sw 196(r14),r12
% end var offset calculation
% begin write 
lw r11,196(r14)
add r11,r14,r11
lw r11,0(r11)
%s move ptr to prevent mem corruption
addi r14,r14,656
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
addi r14,r14,-656
% end write
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 200(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r10,200(r14)
 add r12,r12,r10
sw 204(r14),r12
% end var offset calculation
%begin dot offsetting
lw r10,204(r14)
addi r10,r10,8
sw 208(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,1
sw 212(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
lw r11,212(r14)
muli r8,r10,4
mul r8,r11,r8
add r12,r12,r8
sw 216(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r11,216(r14)
lw r12,208(r14)
add r12,r12,r11
sw 220(r14),r12
% end var offset calculation
% begin write 
lw r11,220(r14)
add r11,r14,r11
lw r11,0(r11)
%s move ptr to prevent mem corruption
addi r14,r14,656
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
addi r14,r14,-656
% end write
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 224(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r10,224(r14)
 add r12,r12,r10
sw 228(r14),r12
% end var offset calculation
%begin dot offsetting
lw r10,228(r14)
addi r10,r10,8
sw 232(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,2
sw 236(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
lw r11,236(r14)
muli r8,r10,4
mul r8,r11,r8
add r12,r12,r8
sw 240(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r11,240(r14)
lw r12,232(r14)
add r12,r12,r11
sw 244(r14),r12
% end var offset calculation
% begin write 
lw r11,244(r14)
add r11,r14,r11
lw r11,0(r11)
%s move ptr to prevent mem corruption
addi r14,r14,656
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
addi r14,r14,-656
% end write
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 248(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r10,248(r14)
 add r12,r12,r10
sw 252(r14),r12
% end var offset calculation
%begin dot offsetting
lw r10,252(r14)
addi r10,r10,8
sw 256(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,3
sw 260(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
lw r11,260(r14)
muli r8,r10,4
mul r8,r11,r8
add r12,r12,r8
sw 264(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r11,264(r14)
lw r12,256(r14)
add r12,r12,r11
sw 268(r14),r12
% end var offset calculation
% begin write 
lw r11,268(r14)
add r11,r14,r11
lw r11,0(r11)
%s move ptr to prevent mem corruption
addi r14,r14,656
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
addi r14,r14,-656
% end write
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 272(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r10,272(r14)
 add r12,r12,r10
sw 276(r14),r12
% end var offset calculation
%begin dot offsetting
lw r10,276(r14)
addi r10,r10,8
sw 280(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,4
sw 284(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
lw r11,284(r14)
muli r8,r10,4
mul r8,r11,r8
add r12,r12,r8
sw 288(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r11,288(r14)
lw r12,280(r14)
add r12,r12,r11
sw 292(r14),r12
% end var offset calculation
% begin write 
lw r11,292(r14)
add r11,r14,r11
lw r11,0(r11)
%s move ptr to prevent mem corruption
addi r14,r14,656
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
addi r14,r14,-656
% end write
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 296(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r10,296(r14)
 add r12,r12,r10
sw 300(r14),r12
% end var offset calculation
%begin dot offsetting
lw r10,300(r14)
sw 304(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,0
sw 308(r14), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,90
sw 312(r14), r10
% done intlit storeage
%check if size is zero if yes, leave
addi r9,r0,32
bz r9,endCopy15

%set left and right ptrs
%set ptr
lw r12,304(r14)
add r12,r14,r12
addi r12,r12,0
%read direct value
add r10,r0,r14
addi r10,r10,584
%set position counter
mul r8,r0,r0
beginCopy15
%move data via register
lw r11,0(r12)
sw 0(r10),r11
%increment registers
addi r12,r12,4
addi r10,r10,4
addi r8,r8,4
%branch out if done
subi r9,r8,32
bnz r9,beginCopy15

endCopy15
% end copy 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy16

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,308
%read direct value
add r8,r0,r14
addi r8,r8,616
%set position counter
mul r12,r0,r0
beginCopy16
%move data via register
lw r11,0(r9)
sw 0(r8),r11
%increment registers
addi r9,r9,4
addi r8,r8,4
addi r12,r12,4
%branch out if done
subi r10,r12,4
bnz r10,beginCopy16

endCopy16
% end copy 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy17

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,312
%read direct value
add r12,r0,r14
addi r12,r12,620
%set position counter
mul r9,r0,r0
beginCopy17
%move data via register
lw r11,0(r10)
sw 0(r12),r11
%increment registers
addi r10,r10,4
addi r12,r12,4
addi r9,r9,4
%branch out if done
subi r8,r9,4
bnz r8,beginCopy17

endCopy17
% end copy 
addi r14,r14,576
jl r15, fnmanmutateAmount1
subi r14,r14,576
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy18

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,576
%read direct value
add r9,r0,r14
addi r9,r9,316
%set position counter
mul r10,r0,r0
beginCopy18
%move data via register
lw r11,0(r8)
sw 0(r9),r11
%increment registers
addi r8,r8,4
addi r9,r9,4
addi r10,r10,4
%branch out if done
subi r12,r10,4
bnz r12,beginCopy18

endCopy18
% end copy 
%begin copy back object
%check if size is zero if yes, leave
addi r9,r0,32
bz r9,endCopy19

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,584
%set ptr
lw r10,304(r14)
add r10,r14,r10
addi r10,r10,0
%set position counter
mul r8,r0,r0
beginCopy19
%move data via register
lw r11,0(r12)
sw 0(r10),r11
%increment registers
addi r12,r12,4
addi r10,r10,4
addi r8,r8,4
%branch out if done
subi r9,r8,32
bnz r9,beginCopy19

endCopy19
% end copy 
% begin generating indice offseting
addi r8,r0,1
addi r9,r0,0
sw 320(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,4
lw r11,320(r14)
 add r9,r9,r11
sw 324(r14),r9
% end var offset calculation
%begin dot offsetting
lw r11,324(r14)
sw 328(r14),r11
%end dot offsetting
% begin intlit storeage
addi r11,r0,1
sw 332(r14), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,70
sw 336(r14), r11
% done intlit storeage
%check if size is zero if yes, leave
addi r10,r0,32
bz r10,endCopy20

%set left and right ptrs
%set ptr
lw r9,328(r14)
add r9,r14,r9
addi r9,r9,0
%read direct value
add r11,r0,r14
addi r11,r11,584
%set position counter
mul r12,r0,r0
beginCopy20
%move data via register
lw r8,0(r9)
sw 0(r11),r8
%increment registers
addi r9,r9,4
addi r11,r11,4
addi r12,r12,4
%branch out if done
subi r10,r12,32
bnz r10,beginCopy20

endCopy20
% end copy 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy21

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,332
%read direct value
add r12,r0,r14
addi r12,r12,616
%set position counter
mul r9,r0,r0
beginCopy21
%move data via register
lw r8,0(r10)
sw 0(r12),r8
%increment registers
addi r10,r10,4
addi r12,r12,4
addi r9,r9,4
%branch out if done
subi r11,r9,4
bnz r11,beginCopy21

endCopy21
% end copy 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy22

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,336
%read direct value
add r9,r0,r14
addi r9,r9,620
%set position counter
mul r10,r0,r0
beginCopy22
%move data via register
lw r8,0(r11)
sw 0(r9),r8
%increment registers
addi r11,r11,4
addi r9,r9,4
addi r10,r10,4
%branch out if done
subi r12,r10,4
bnz r12,beginCopy22

endCopy22
% end copy 
addi r14,r14,576
jl r15, fnmanmutateAmount1
subi r14,r14,576
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy23

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,576
%read direct value
add r10,r0,r14
addi r10,r10,340
%set position counter
mul r11,r0,r0
beginCopy23
%move data via register
lw r8,0(r12)
sw 0(r10),r8
%increment registers
addi r12,r12,4
addi r10,r10,4
addi r11,r11,4
%branch out if done
subi r9,r11,4
bnz r9,beginCopy23

endCopy23
% end copy 
%begin copy back object
%check if size is zero if yes, leave
addi r10,r0,32
bz r10,endCopy24

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,584
%set ptr
lw r11,328(r14)
add r11,r14,r11
addi r11,r11,0
%set position counter
mul r12,r0,r0
beginCopy24
%move data via register
lw r8,0(r9)
sw 0(r11),r8
%increment registers
addi r9,r9,4
addi r11,r11,4
addi r12,r12,4
%branch out if done
subi r10,r12,32
bnz r10,beginCopy24

endCopy24
% end copy 
% begin generating indice offseting
addi r12,r0,1
addi r10,r0,0
sw 344(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,4
lw r8,344(r14)
 add r10,r10,r8
sw 348(r14),r10
% end var offset calculation
%begin dot offsetting
lw r8,348(r14)
sw 352(r14),r8
%end dot offsetting
% begin intlit storeage
addi r8,r0,2
sw 356(r14), r8
% done intlit storeage
% begin intlit storeage
addi r8,r0,220
sw 360(r14), r8
% done intlit storeage
%check if size is zero if yes, leave
addi r11,r0,32
bz r11,endCopy25

%set left and right ptrs
%set ptr
lw r10,352(r14)
add r10,r14,r10
addi r10,r10,0
%read direct value
add r8,r0,r14
addi r8,r8,584
%set position counter
mul r9,r0,r0
beginCopy25
%move data via register
lw r12,0(r10)
sw 0(r8),r12
%increment registers
addi r10,r10,4
addi r8,r8,4
addi r9,r9,4
%branch out if done
subi r11,r9,32
bnz r11,beginCopy25

endCopy25
% end copy 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy26

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,356
%read direct value
add r9,r0,r14
addi r9,r9,616
%set position counter
mul r10,r0,r0
beginCopy26
%move data via register
lw r12,0(r11)
sw 0(r9),r12
%increment registers
addi r11,r11,4
addi r9,r9,4
addi r10,r10,4
%branch out if done
subi r8,r10,4
bnz r8,beginCopy26

endCopy26
% end copy 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy27

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,360
%read direct value
add r10,r0,r14
addi r10,r10,620
%set position counter
mul r11,r0,r0
beginCopy27
%move data via register
lw r12,0(r8)
sw 0(r10),r12
%increment registers
addi r8,r8,4
addi r10,r10,4
addi r11,r11,4
%branch out if done
subi r9,r11,4
bnz r9,beginCopy27

endCopy27
% end copy 
addi r14,r14,576
jl r15, fnmanmutateAmount1
subi r14,r14,576
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy28

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,576
%read direct value
add r11,r0,r14
addi r11,r11,364
%set position counter
mul r8,r0,r0
beginCopy28
%move data via register
lw r12,0(r9)
sw 0(r11),r12
%increment registers
addi r9,r9,4
addi r11,r11,4
addi r8,r8,4
%branch out if done
subi r10,r8,4
bnz r10,beginCopy28

endCopy28
% end copy 
%begin copy back object
%check if size is zero if yes, leave
addi r11,r0,32
bz r11,endCopy29

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,584
%set ptr
lw r8,352(r14)
add r8,r14,r8
addi r8,r8,0
%set position counter
mul r9,r0,r0
beginCopy29
%move data via register
lw r12,0(r10)
sw 0(r8),r12
%increment registers
addi r10,r10,4
addi r8,r8,4
addi r9,r9,4
%branch out if done
subi r11,r9,32
bnz r11,beginCopy29

endCopy29
% end copy 
% begin generating indice offseting
addi r9,r0,1
addi r11,r0,0
sw 368(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r12,368(r14)
 add r11,r11,r12
sw 372(r14),r11
% end var offset calculation
%begin dot offsetting
lw r12,372(r14)
sw 376(r14),r12
%end dot offsetting
% begin intlit storeage
addi r12,r0,3
sw 380(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,720
sw 384(r14), r12
% done intlit storeage
%check if size is zero if yes, leave
addi r8,r0,32
bz r8,endCopy30

%set left and right ptrs
%set ptr
lw r11,376(r14)
add r11,r14,r11
addi r11,r11,0
%read direct value
add r12,r0,r14
addi r12,r12,584
%set position counter
mul r10,r0,r0
beginCopy30
%move data via register
lw r9,0(r11)
sw 0(r12),r9
%increment registers
addi r11,r11,4
addi r12,r12,4
addi r10,r10,4
%branch out if done
subi r8,r10,32
bnz r8,beginCopy30

endCopy30
% end copy 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy31

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,380
%read direct value
add r10,r0,r14
addi r10,r10,616
%set position counter
mul r11,r0,r0
beginCopy31
%move data via register
lw r9,0(r8)
sw 0(r10),r9
%increment registers
addi r8,r8,4
addi r10,r10,4
addi r11,r11,4
%branch out if done
subi r12,r11,4
bnz r12,beginCopy31

endCopy31
% end copy 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy32

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,384
%read direct value
add r11,r0,r14
addi r11,r11,620
%set position counter
mul r8,r0,r0
beginCopy32
%move data via register
lw r9,0(r12)
sw 0(r11),r9
%increment registers
addi r12,r12,4
addi r11,r11,4
addi r8,r8,4
%branch out if done
subi r10,r8,4
bnz r10,beginCopy32

endCopy32
% end copy 
addi r14,r14,576
jl r15, fnmanmutateAmount1
subi r14,r14,576
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy33

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,576
%read direct value
add r8,r0,r14
addi r8,r8,388
%set position counter
mul r12,r0,r0
beginCopy33
%move data via register
lw r9,0(r10)
sw 0(r8),r9
%increment registers
addi r10,r10,4
addi r8,r8,4
addi r12,r12,4
%branch out if done
subi r11,r12,4
bnz r11,beginCopy33

endCopy33
% end copy 
%begin copy back object
%check if size is zero if yes, leave
addi r8,r0,32
bz r8,endCopy34

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,584
%set ptr
lw r12,376(r14)
add r12,r14,r12
addi r12,r12,0
%set position counter
mul r10,r0,r0
beginCopy34
%move data via register
lw r9,0(r11)
sw 0(r12),r9
%increment registers
addi r11,r11,4
addi r12,r12,4
addi r10,r10,4
%branch out if done
subi r8,r10,32
bnz r8,beginCopy34

endCopy34
% end copy 
% begin generating indice offseting
addi r10,r0,1
addi r8,r0,0
sw 392(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,4
lw r9,392(r14)
 add r8,r8,r9
sw 396(r14),r8
% end var offset calculation
%begin dot offsetting
lw r9,396(r14)
sw 400(r14),r9
%end dot offsetting
% begin intlit storeage
addi r9,r0,4
sw 404(r14), r9
% done intlit storeage
% begin intlit storeage
addi r9,r0,120
sw 408(r14), r9
% done intlit storeage
%check if size is zero if yes, leave
addi r12,r0,32
bz r12,endCopy35

%set left and right ptrs
%set ptr
lw r8,400(r14)
add r8,r14,r8
addi r8,r8,0
%read direct value
add r9,r0,r14
addi r9,r9,584
%set position counter
mul r11,r0,r0
beginCopy35
%move data via register
lw r10,0(r8)
sw 0(r9),r10
%increment registers
addi r8,r8,4
addi r9,r9,4
addi r11,r11,4
%branch out if done
subi r12,r11,32
bnz r12,beginCopy35

endCopy35
% end copy 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy36

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,404
%read direct value
add r11,r0,r14
addi r11,r11,616
%set position counter
mul r8,r0,r0
beginCopy36
%move data via register
lw r10,0(r12)
sw 0(r11),r10
%increment registers
addi r12,r12,4
addi r11,r11,4
addi r8,r8,4
%branch out if done
subi r9,r8,4
bnz r9,beginCopy36

endCopy36
% end copy 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy37

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,408
%read direct value
add r8,r0,r14
addi r8,r8,620
%set position counter
mul r12,r0,r0
beginCopy37
%move data via register
lw r10,0(r9)
sw 0(r8),r10
%increment registers
addi r9,r9,4
addi r8,r8,4
addi r12,r12,4
%branch out if done
subi r11,r12,4
bnz r11,beginCopy37

endCopy37
% end copy 
addi r14,r14,576
jl r15, fnmanmutateAmount1
subi r14,r14,576
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy38

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,576
%read direct value
add r12,r0,r14
addi r12,r12,412
%set position counter
mul r9,r0,r0
beginCopy38
%move data via register
lw r10,0(r11)
sw 0(r12),r10
%increment registers
addi r11,r11,4
addi r12,r12,4
addi r9,r9,4
%branch out if done
subi r8,r9,4
bnz r8,beginCopy38

endCopy38
% end copy 
%begin copy back object
%check if size is zero if yes, leave
addi r12,r0,32
bz r12,endCopy39

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,584
%set ptr
lw r9,400(r14)
add r9,r14,r9
addi r9,r9,0
%set position counter
mul r11,r0,r0
beginCopy39
%move data via register
lw r10,0(r8)
sw 0(r9),r10
%increment registers
addi r8,r8,4
addi r9,r9,4
addi r11,r11,4
%branch out if done
subi r12,r11,32
bnz r12,beginCopy39

endCopy39
% end copy 
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 416(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r10,416(r14)
 add r12,r12,r10
sw 420(r14),r12
% end var offset calculation
%begin dot offsetting
lw r10,420(r14)
addi r10,r10,8
sw 424(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,0
sw 428(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
lw r11,428(r14)
muli r8,r10,4
mul r8,r11,r8
add r12,r12,r8
sw 432(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r11,432(r14)
lw r12,424(r14)
add r12,r12,r11
sw 436(r14),r12
% end var offset calculation
% begin write 
lw r11,436(r14)
add r11,r14,r11
lw r11,0(r11)
%s move ptr to prevent mem corruption
addi r14,r14,656
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
addi r14,r14,-656
% end write
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 440(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r10,440(r14)
 add r12,r12,r10
sw 444(r14),r12
% end var offset calculation
%begin dot offsetting
lw r10,444(r14)
addi r10,r10,8
sw 448(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,1
sw 452(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
lw r11,452(r14)
muli r8,r10,4
mul r8,r11,r8
add r12,r12,r8
sw 456(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r11,456(r14)
lw r12,448(r14)
add r12,r12,r11
sw 460(r14),r12
% end var offset calculation
% begin write 
lw r11,460(r14)
add r11,r14,r11
lw r11,0(r11)
%s move ptr to prevent mem corruption
addi r14,r14,656
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
addi r14,r14,-656
% end write
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 464(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r10,464(r14)
 add r12,r12,r10
sw 468(r14),r12
% end var offset calculation
%begin dot offsetting
lw r10,468(r14)
addi r10,r10,8
sw 472(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,2
sw 476(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
lw r11,476(r14)
muli r8,r10,4
mul r8,r11,r8
add r12,r12,r8
sw 480(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r11,480(r14)
lw r12,472(r14)
add r12,r12,r11
sw 484(r14),r12
% end var offset calculation
% begin write 
lw r11,484(r14)
add r11,r14,r11
lw r11,0(r11)
%s move ptr to prevent mem corruption
addi r14,r14,656
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
addi r14,r14,-656
% end write
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 488(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r10,488(r14)
 add r12,r12,r10
sw 492(r14),r12
% end var offset calculation
%begin dot offsetting
lw r10,492(r14)
addi r10,r10,8
sw 496(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,3
sw 500(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
lw r11,500(r14)
muli r8,r10,4
mul r8,r11,r8
add r12,r12,r8
sw 504(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r11,504(r14)
lw r12,496(r14)
add r12,r12,r11
sw 508(r14),r12
% end var offset calculation
% begin write 
lw r11,508(r14)
add r11,r14,r11
lw r11,0(r11)
%s move ptr to prevent mem corruption
addi r14,r14,656
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
addi r14,r14,-656
% end write
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 512(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r10,512(r14)
 add r12,r12,r10
sw 516(r14),r12
% end var offset calculation
%begin dot offsetting
lw r10,516(r14)
addi r10,r10,8
sw 520(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,4
sw 524(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
lw r11,524(r14)
muli r8,r10,4
mul r8,r11,r8
add r12,r12,r8
sw 528(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r11,528(r14)
lw r12,520(r14)
add r12,r12,r11
sw 532(r14),r12
% end var offset calculation
% begin write 
lw r11,532(r14)
add r11,r14,r11
lw r11,0(r11)
%s move ptr to prevent mem corruption
addi r14,r14,656
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
addi r14,r14,-656
% end write
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 536(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r10,536(r14)
 add r12,r12,r10
sw 540(r14),r12
% end var offset calculation
%begin dot offsetting
lw r10,540(r14)
addi r10,r10,0
sw 544(r14),r10
%end dot offsetting
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
sw 548(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r11,548(r14)
lw r12,544(r14)
add r12,r12,r11
sw 552(r14),r12
% end var offset calculation
% begin write 
lw r11,552(r14)
add r11,r14,r11
lw r11,0(r11)
%s move ptr to prevent mem corruption
addi r14,r14,656
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
addi r14,r14,-656
% end write
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 556(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r10,556(r14)
 add r12,r12,r10
sw 560(r14),r12
% end var offset calculation
%begin dot offsetting
lw r10,560(r14)
addi r10,r10,4
sw 564(r14),r10
%end dot offsetting
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
sw 568(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r11,568(r14)
lw r12,564(r14)
add r12,r12,r11
sw 572(r14),r12
% end var offset calculation
% begin write 
lw r11,572(r14)
add r11,r14,r11
lw r11,0(r11)
%s move ptr to prevent mem corruption
addi r14,r14,656
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
addi r14,r14,-656
% end write
hlt
%funcdef begin
fnmanmutateH1
sw 4(r14),r15
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 44(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,12
lw r10,44(r14)
 add r12,r12,r10
sw 48(r14),r12
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
sw 52(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,40
lw r11,52(r14)
 add r12,r12,r11
sw 56(r14),r12
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy40

%set left and right ptrs
%set ptr
lw r12,56(r14)
add r12,r14,r12
lw r11,48(r14)
add r11,r14,r11
%set position counter
mul r8,r0,r0
beginCopy40
%move data via register
lw r10,0(r12)
sw 0(r11),r10
%increment registers
addi r12,r12,4
addi r11,r11,4
addi r8,r8,4
%branch out if done
subi r9,r8,4
bnz r9,beginCopy40

endCopy40
% end assignment 
% begin generating indice offseting
addi r8,r0,1
addi r9,r0,0
sw 60(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,12
lw r10,60(r14)
 add r9,r9,r10
sw 64(r14),r9
% end var offset calculation
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy41

%set left and right ptrs
%set ptr
lw r9,64(r14)
add r9,r14,r9
addi r9,r9,0
%read direct value
add r10,r0,r14
addi r10,r10,0
%set position counter
mul r12,r0,r0
beginCopy41
%move data via register
lw r8,0(r9)
sw 0(r10),r8
%increment registers
addi r9,r9,4
addi r10,r10,4
addi r12,r12,4
%branch out if done
subi r11,r12,4
bnz r11,beginCopy41

endCopy41
% end copy 
lw r15,4(r14)
jr r15 
%funcdef end
%funcdef begin
fnmanmutateX1
sw 4(r14),r15
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 44(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,8
lw r8,44(r14)
 add r11,r11,r8
sw 48(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r8,r0,1
addi r11,r0,0
sw 52(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,40
lw r12,52(r14)
 add r11,r11,r12
sw 56(r14),r11
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy42

%set left and right ptrs
%set ptr
lw r11,56(r14)
add r11,r14,r11
lw r12,48(r14)
add r12,r14,r12
%set position counter
mul r9,r0,r0
beginCopy42
%move data via register
lw r8,0(r11)
sw 0(r12),r8
%increment registers
addi r11,r11,4
addi r12,r12,4
addi r9,r9,4
%branch out if done
subi r10,r9,4
bnz r10,beginCopy42

endCopy42
% end assignment 
% begin generating indice offseting
addi r9,r0,1
addi r10,r0,0
sw 60(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,8
lw r8,60(r14)
 add r10,r10,r8
sw 64(r14),r10
% end var offset calculation
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy43

%set left and right ptrs
%set ptr
lw r10,64(r14)
add r10,r14,r10
addi r10,r10,0
%read direct value
add r8,r0,r14
addi r8,r8,0
%set position counter
mul r11,r0,r0
beginCopy43
%move data via register
lw r9,0(r10)
sw 0(r8),r9
%increment registers
addi r10,r10,4
addi r8,r8,4
addi r11,r11,4
%branch out if done
subi r12,r11,4
bnz r12,beginCopy43

endCopy43
% end copy 
lw r15,4(r14)
jr r15 
%funcdef end
%funcdef begin
fnmanmutateAmount1
sw 4(r14),r15
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 48(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,40
lw r9,48(r14)
 add r12,r12,r9
sw 52(r14),r12
% end var offset calculation
% begin generating indice offseting
addi r9,r0,1
addi r12,r0,0
lw r11,52(r14)
add r11,r14,r11
lw r11,0(r11)
muli r10,r9,4
mul r10,r11,r10
add r12,r12,r10
sw 56(r14),r12
% done generating indice offseting
% begin var offset calculation
addi r12,r0,16
lw r11,56(r14)
 add r12,r12,r11
sw 60(r14),r12
% end var offset calculation
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 64(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,44
lw r9,64(r14)
 add r12,r12,r9
sw 68(r14),r12
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy44

%set left and right ptrs
%set ptr
lw r12,68(r14)
add r12,r14,r12
lw r9,60(r14)
add r9,r14,r9
%set position counter
mul r10,r0,r0
beginCopy44
%move data via register
lw r11,0(r12)
sw 0(r9),r11
%increment registers
addi r12,r12,4
addi r9,r9,4
addi r10,r10,4
%branch out if done
subi r8,r10,4
bnz r8,beginCopy44

endCopy44
% end assignment 
% begin generating indice offseting
addi r10,r0,1
addi r8,r0,0
sw 72(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,40
lw r11,72(r14)
 add r8,r8,r11
sw 76(r14),r8
% end var offset calculation
% begin generating indice offseting
addi r11,r0,1
addi r8,r0,0
lw r10,76(r14)
add r10,r14,r10
lw r10,0(r10)
muli r12,r11,4
mul r12,r10,r12
add r8,r8,r12
sw 80(r14),r8
% done generating indice offseting
% begin var offset calculation
addi r8,r0,16
lw r10,80(r14)
 add r8,r8,r10
sw 84(r14),r8
% end var offset calculation
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy45

%set left and right ptrs
%set ptr
lw r8,84(r14)
add r8,r14,r8
addi r8,r8,0
%read direct value
add r10,r0,r14
addi r10,r10,0
%set position counter
mul r12,r0,r0
beginCopy45
%move data via register
lw r11,0(r8)
sw 0(r10),r11
%increment registers
addi r8,r8,4
addi r10,r10,4
addi r12,r12,4
%branch out if done
subi r9,r12,4
bnz r9,beginCopy45

endCopy45
% end copy 
lw r15,4(r14)
jr r15 
%funcdef end
%funcdef begin
fnmanconstructor1
sw 32(r14),r15
% begin generating indice offseting
addi r12,r0,1
addi r9,r0,0
sw 88(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,56
lw r11,88(r14)
 add r9,r9,r11
sw 92(r14),r9
% end var offset calculation
%begin dot offsetting
lw r11,92(r14)
addi r11,r11,0
sw 96(r14),r11
%end dot offsetting
% begin generating indice offseting
addi r11,r0,1
addi r9,r0,0
sw 100(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r12,100(r14)
lw r9,96(r14)
add r9,r9,r12
sw 104(r14),r9
% end var offset calculation
% begin generating indice offseting
addi r12,r0,1
addi r9,r0,0
sw 108(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,36
lw r11,108(r14)
 add r9,r9,r11
sw 112(r14),r9
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy46

%set left and right ptrs
%set ptr
lw r9,112(r14)
add r9,r14,r9
lw r11,104(r14)
add r11,r14,r11
%set position counter
mul r8,r0,r0
beginCopy46
%move data via register
lw r12,0(r9)
sw 0(r11),r12
%increment registers
addi r9,r9,4
addi r11,r11,4
addi r8,r8,4
%branch out if done
subi r10,r8,4
bnz r10,beginCopy46

endCopy46
% end assignment 
% begin generating indice offseting
addi r8,r0,1
addi r10,r0,0
sw 116(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,56
lw r12,116(r14)
 add r10,r10,r12
sw 120(r14),r10
% end var offset calculation
%begin dot offsetting
lw r12,120(r14)
addi r12,r12,4
sw 124(r14),r12
%end dot offsetting
% begin generating indice offseting
addi r12,r0,1
addi r10,r0,0
sw 128(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r8,128(r14)
lw r10,124(r14)
add r10,r10,r8
sw 132(r14),r10
% end var offset calculation
% begin generating indice offseting
addi r8,r0,1
addi r10,r0,0
sw 136(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,40
lw r12,136(r14)
 add r10,r10,r12
sw 140(r14),r10
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy47

%set left and right ptrs
%set ptr
lw r10,140(r14)
add r10,r14,r10
lw r12,132(r14)
add r12,r14,r12
%set position counter
mul r9,r0,r0
beginCopy47
%move data via register
lw r8,0(r10)
sw 0(r12),r8
%increment registers
addi r10,r10,4
addi r12,r12,4
addi r9,r9,4
%branch out if done
subi r11,r9,4
bnz r11,beginCopy47

endCopy47
% end assignment 
% begin generating indice offseting
addi r9,r0,1
addi r11,r0,0
sw 144(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,56
lw r8,144(r14)
 add r11,r11,r8
sw 148(r14),r11
% end var offset calculation
%begin dot offsetting
lw r8,148(r14)
addi r8,r8,8
sw 152(r14),r8
%end dot offsetting
% begin intlit storeage
addi r8,r0,0
sw 156(r14), r8
% done intlit storeage
% begin generating indice offseting
addi r8,r0,1
addi r11,r0,0
lw r9,156(r14)
muli r10,r8,4
mul r10,r9,r10
add r11,r11,r10
sw 160(r14),r11
% done generating indice offseting
% begin var offset calculation
lw r9,160(r14)
lw r11,152(r14)
add r11,r11,r9
sw 164(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r9,r0,1
addi r11,r0,0
sw 168(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,44
lw r8,168(r14)
 add r11,r11,r8
sw 172(r14),r11
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy48

%set left and right ptrs
%set ptr
lw r11,172(r14)
add r11,r14,r11
lw r8,164(r14)
add r8,r14,r8
%set position counter
mul r10,r0,r0
beginCopy48
%move data via register
lw r9,0(r11)
sw 0(r8),r9
%increment registers
addi r11,r11,4
addi r8,r8,4
addi r10,r10,4
%branch out if done
subi r12,r10,4
bnz r12,beginCopy48

endCopy48
% end assignment 
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
sw 176(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,56
lw r9,176(r14)
 add r12,r12,r9
sw 180(r14),r12
% end var offset calculation
%begin dot offsetting
lw r9,180(r14)
addi r9,r9,8
sw 184(r14),r9
%end dot offsetting
% begin intlit storeage
addi r9,r0,1
sw 188(r14), r9
% done intlit storeage
% begin generating indice offseting
addi r9,r0,1
addi r12,r0,0
lw r10,188(r14)
muli r11,r9,4
mul r11,r10,r11
add r12,r12,r11
sw 192(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r10,192(r14)
lw r12,184(r14)
add r12,r12,r10
sw 196(r14),r12
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
sw 200(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,48
lw r9,200(r14)
 add r12,r12,r9
sw 204(r14),r12
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy49

%set left and right ptrs
%set ptr
lw r12,204(r14)
add r12,r14,r12
lw r9,196(r14)
add r9,r14,r9
%set position counter
mul r11,r0,r0
beginCopy49
%move data via register
lw r10,0(r12)
sw 0(r9),r10
%increment registers
addi r12,r12,4
addi r9,r9,4
addi r11,r11,4
%branch out if done
subi r8,r11,4
bnz r8,beginCopy49

endCopy49
% end assignment 
% begin generating indice offseting
addi r11,r0,1
addi r8,r0,0
sw 208(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,56
lw r10,208(r14)
 add r8,r8,r10
sw 212(r14),r8
% end var offset calculation
%begin dot offsetting
lw r10,212(r14)
addi r10,r10,8
sw 216(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,2
sw 220(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r8,r0,0
lw r11,220(r14)
muli r12,r10,4
mul r12,r11,r12
add r8,r8,r12
sw 224(r14),r8
% done generating indice offseting
% begin var offset calculation
lw r11,224(r14)
lw r8,216(r14)
add r8,r8,r11
sw 228(r14),r8
% end var offset calculation
% begin generating indice offseting
addi r11,r0,1
addi r8,r0,0
sw 232(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,52
lw r10,232(r14)
 add r8,r8,r10
sw 236(r14),r8
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy50

%set left and right ptrs
%set ptr
lw r8,236(r14)
add r8,r14,r8
lw r10,228(r14)
add r10,r14,r10
%set position counter
mul r12,r0,r0
beginCopy50
%move data via register
lw r11,0(r8)
sw 0(r10),r11
%increment registers
addi r8,r8,4
addi r10,r10,4
addi r12,r12,4
%branch out if done
subi r9,r12,4
bnz r9,beginCopy50

endCopy50
% end assignment 
% begin generating indice offseting
addi r12,r0,1
addi r9,r0,0
sw 240(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,56
lw r11,240(r14)
 add r9,r9,r11
sw 244(r14),r9
% end var offset calculation
%begin dot offsetting
lw r11,244(r14)
addi r11,r11,8
sw 248(r14),r11
%end dot offsetting
% begin intlit storeage
addi r11,r0,3
sw 252(r14), r11
% done intlit storeage
% begin generating indice offseting
addi r11,r0,1
addi r9,r0,0
lw r12,252(r14)
muli r8,r11,4
mul r8,r12,r8
add r9,r9,r8
sw 256(r14),r9
% done generating indice offseting
% begin var offset calculation
lw r12,256(r14)
lw r9,248(r14)
add r9,r9,r12
sw 260(r14),r9
% end var offset calculation
% begin generating indice offseting
addi r12,r0,1
addi r9,r0,0
sw 264(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,52
lw r11,264(r14)
 add r9,r9,r11
sw 268(r14),r9
% end var offset calculation
% begin intlit storeage
addi r11,r0,10
sw 272(r14), r11
% done intlit storeage
% begin add op 
lw r8,268(r14)
add r8,r14,r8
lw r11,0(r8)
lw r9,272(r14)
add r12,r11,r9
sw 276(r14),r12
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy51

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,276
lw r8,260(r14)
add r8,r14,r8
%set position counter
mul r11,r0,r0
beginCopy51
%move data via register
lw r9,0(r12)
sw 0(r8),r9
%increment registers
addi r12,r12,4
addi r8,r8,4
addi r11,r11,4
%branch out if done
subi r10,r11,4
bnz r10,beginCopy51

endCopy51
% end assignment 
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
sw 280(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,56
lw r9,280(r14)
 add r10,r10,r9
sw 284(r14),r10
% end var offset calculation
%begin dot offsetting
lw r9,284(r14)
addi r9,r9,8
sw 288(r14),r9
%end dot offsetting
% begin intlit storeage
addi r9,r0,4
sw 292(r14), r9
% done intlit storeage
% begin generating indice offseting
addi r9,r0,1
addi r10,r0,0
lw r11,292(r14)
muli r12,r9,4
mul r12,r11,r12
add r10,r10,r12
sw 296(r14),r10
% done generating indice offseting
% begin var offset calculation
lw r11,296(r14)
lw r10,288(r14)
add r10,r10,r11
sw 300(r14),r10
% end var offset calculation
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
sw 304(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,52
lw r9,304(r14)
 add r10,r10,r9
sw 308(r14),r10
% end var offset calculation
% begin intlit storeage
addi r9,r0,20
sw 312(r14), r9
% done intlit storeage
% begin add op 
lw r12,308(r14)
add r12,r14,r12
lw r9,0(r12)
lw r10,312(r14)
add r11,r9,r10
sw 316(r14),r11
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy52

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,316
lw r12,300(r14)
add r12,r14,r12
%set position counter
mul r9,r0,r0
beginCopy52
%move data via register
lw r10,0(r11)
sw 0(r12),r10
%increment registers
addi r11,r11,4
addi r12,r12,4
addi r9,r9,4
%branch out if done
subi r8,r9,4
bnz r8,beginCopy52

endCopy52
% end assignment 
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
sw 320(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,56
lw r10,320(r14)
 add r8,r8,r10
sw 324(r14),r8
% end var offset calculation
%check if size is zero if yes, leave
addi r12,r0,32
bz r12,endCopy53

%set left and right ptrs
%set ptr
lw r8,324(r14)
add r8,r14,r8
addi r8,r8,0
%read direct value
add r10,r0,r14
addi r10,r10,0
%set position counter
mul r11,r0,r0
beginCopy53
%move data via register
lw r9,0(r8)
sw 0(r10),r9
%increment registers
addi r8,r8,4
addi r10,r10,4
addi r11,r11,4
%branch out if done
subi r12,r11,32
bnz r12,beginCopy53

endCopy53
% end copy 
lw r15,32(r14)
jr r15 
%funcdef end
