entry
muli r0,r0,0
muli r14,r0,0
addi r14,r0,stackbase
%r14 is stack ptr, stack grows downwards or upwards
%24kb stack
% begin intlit storeage
addi r12,r0,9
sw 40(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,22
sw 44(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,10
sw 48(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,20
sw 52(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,30
sw 56(r14), r12
% done intlit storeage
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy1

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,40
%read direct value
add r12,r0,r14
addi r12,r12,696
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
addi r8,r8,44
%read direct value
add r9,r0,r14
addi r9,r9,700
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
addi r12,r12,48
%read direct value
add r11,r0,r14
addi r11,r11,704
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
addi r9,r9,52
%read direct value
add r8,r0,r14
addi r8,r8,708
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
addi r11,r11,56
%read direct value
add r12,r0,r14
addi r12,r12,712
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
addi r14,r14,660
jl r15, fnmanconstructor1
subi r14,r14,660
%check if size is zero if yes, leave
addi r12,r0,32
bz r12,endCopy6

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,660
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
sw 60(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r10,60(r14)
 add r12,r12,r10
sw 64(r14),r12
% end var offset calculation
%begin dot offsetting
lw r10,64(r14)
addi r10,r10,0
sw 68(r14),r10
%end dot offsetting
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
sw 72(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r11,72(r14)
lw r12,68(r14)
add r12,r12,r11
sw 76(r14),r12
% end var offset calculation
% begin write 
lw r11,76(r14)
add r11,r14,r11
lw r11,0(r11)
%s move ptr to prevent mem corruption
addi r14,r14,740
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
addi r14,r14,-740
% end write
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 80(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r10,80(r14)
 add r12,r12,r10
sw 84(r14),r12
% end var offset calculation
%begin dot offsetting
lw r10,84(r14)
sw 88(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,49
sw 92(r14), r10
% done intlit storeage
%check if size is zero if yes, leave
addi r9,r0,32
bz r9,endCopy7

%set left and right ptrs
%set ptr
lw r12,88(r14)
add r12,r14,r12
addi r12,r12,0
%read direct value
add r10,r0,r14
addi r10,r10,668
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
addi r9,r9,92
%read direct value
add r8,r0,r14
addi r8,r8,700
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
addi r14,r14,660
jl r15, fnmanmutateX1
subi r14,r14,660
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy9

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,660
%read direct value
add r12,r0,r14
addi r12,r12,96
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
addi r8,r8,668
%set ptr
lw r9,88(r14)
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
sw 100(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r11,100(r14)
 add r12,r12,r11
sw 104(r14),r12
% end var offset calculation
%begin dot offsetting
lw r11,104(r14)
addi r11,r11,0
sw 108(r14),r11
%end dot offsetting
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 112(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r10,112(r14)
lw r12,108(r14)
add r12,r12,r10
sw 116(r14),r12
% end var offset calculation
% begin write 
lw r10,116(r14)
add r10,r14,r10
lw r10,0(r10)
%s move ptr to prevent mem corruption
addi r14,r14,740
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
addi r14,r14,-740
% end write
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
sw 120(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r11,120(r14)
 add r12,r12,r11
sw 124(r14),r12
% end var offset calculation
%begin dot offsetting
lw r11,124(r14)
addi r11,r11,4
sw 128(r14),r11
%end dot offsetting
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 132(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r10,132(r14)
lw r12,128(r14)
add r12,r12,r10
sw 136(r14),r12
% end var offset calculation
% begin write 
lw r10,136(r14)
add r10,r14,r10
lw r10,0(r10)
%s move ptr to prevent mem corruption
addi r14,r14,740
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
addi r14,r14,-740
% end write
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
sw 140(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r11,140(r14)
 add r12,r12,r11
sw 144(r14),r12
% end var offset calculation
%begin dot offsetting
lw r11,144(r14)
sw 148(r14),r11
%end dot offsetting
% begin intlit storeage
addi r11,r0,44
sw 152(r14), r11
% done intlit storeage
%check if size is zero if yes, leave
addi r9,r0,32
bz r9,endCopy11

%set left and right ptrs
%set ptr
lw r12,148(r14)
add r12,r14,r12
addi r12,r12,0
%read direct value
add r11,r0,r14
addi r11,r11,668
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
addi r9,r9,152
%read direct value
add r8,r0,r14
addi r8,r8,700
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
addi r14,r14,660
jl r15, fnmanmutateH1
subi r14,r14,660
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy13

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,660
%read direct value
add r12,r0,r14
addi r12,r12,156
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
addi r8,r8,668
%set ptr
lw r9,148(r14)
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
sw 160(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r10,160(r14)
 add r12,r12,r10
sw 164(r14),r12
% end var offset calculation
%begin dot offsetting
lw r10,164(r14)
addi r10,r10,4
sw 168(r14),r10
%end dot offsetting
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
sw 172(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r11,172(r14)
lw r12,168(r14)
add r12,r12,r11
sw 176(r14),r12
% end var offset calculation
% begin write 
lw r11,176(r14)
add r11,r14,r11
lw r11,0(r11)
%s move ptr to prevent mem corruption
addi r14,r14,740
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
addi r14,r14,-740
% end write
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 180(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r10,180(r14)
 add r12,r12,r10
sw 184(r14),r12
% end var offset calculation
%begin dot offsetting
lw r10,184(r14)
addi r10,r10,8
sw 188(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,0
sw 192(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
lw r11,192(r14)
muli r8,r10,4
mul r8,r11,r8
add r12,r12,r8
sw 196(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r11,196(r14)
lw r12,188(r14)
add r12,r12,r11
sw 200(r14),r12
% end var offset calculation
% begin write 
lw r11,200(r14)
add r11,r14,r11
lw r11,0(r11)
%s move ptr to prevent mem corruption
addi r14,r14,740
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
addi r14,r14,-740
% end write
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 204(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r10,204(r14)
 add r12,r12,r10
sw 208(r14),r12
% end var offset calculation
%begin dot offsetting
lw r10,208(r14)
addi r10,r10,8
sw 212(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,1
sw 216(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
lw r11,216(r14)
muli r8,r10,4
mul r8,r11,r8
add r12,r12,r8
sw 220(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r11,220(r14)
lw r12,212(r14)
add r12,r12,r11
sw 224(r14),r12
% end var offset calculation
% begin write 
lw r11,224(r14)
add r11,r14,r11
lw r11,0(r11)
%s move ptr to prevent mem corruption
addi r14,r14,740
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
addi r14,r14,-740
% end write
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 228(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r10,228(r14)
 add r12,r12,r10
sw 232(r14),r12
% end var offset calculation
%begin dot offsetting
lw r10,232(r14)
addi r10,r10,8
sw 236(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,2
sw 240(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
lw r11,240(r14)
muli r8,r10,4
mul r8,r11,r8
add r12,r12,r8
sw 244(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r11,244(r14)
lw r12,236(r14)
add r12,r12,r11
sw 248(r14),r12
% end var offset calculation
% begin write 
lw r11,248(r14)
add r11,r14,r11
lw r11,0(r11)
%s move ptr to prevent mem corruption
addi r14,r14,740
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
addi r14,r14,-740
% end write
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 252(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r10,252(r14)
 add r12,r12,r10
sw 256(r14),r12
% end var offset calculation
%begin dot offsetting
lw r10,256(r14)
addi r10,r10,8
sw 260(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,3
sw 264(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
lw r11,264(r14)
muli r8,r10,4
mul r8,r11,r8
add r12,r12,r8
sw 268(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r11,268(r14)
lw r12,260(r14)
add r12,r12,r11
sw 272(r14),r12
% end var offset calculation
% begin write 
lw r11,272(r14)
add r11,r14,r11
lw r11,0(r11)
%s move ptr to prevent mem corruption
addi r14,r14,740
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
addi r14,r14,-740
% end write
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 276(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r10,276(r14)
 add r12,r12,r10
sw 280(r14),r12
% end var offset calculation
%begin dot offsetting
lw r10,280(r14)
addi r10,r10,8
sw 284(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,4
sw 288(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
lw r11,288(r14)
muli r8,r10,4
mul r8,r11,r8
add r12,r12,r8
sw 292(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r11,292(r14)
lw r12,284(r14)
add r12,r12,r11
sw 296(r14),r12
% end var offset calculation
% begin write 
lw r11,296(r14)
add r11,r14,r11
lw r11,0(r11)
%s move ptr to prevent mem corruption
addi r14,r14,740
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
addi r14,r14,-740
% end write
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 300(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,36
lw r10,300(r14)
 add r12,r12,r10
sw 304(r14),r12
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
sw 308(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r11,308(r14)
 add r12,r12,r11
sw 312(r14),r12
% end var offset calculation
%begin dot offsetting
lw r11,312(r14)
sw 316(r14),r11
%end dot offsetting
% begin intlit storeage
addi r11,r0,0
sw 320(r14), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,90
sw 324(r14), r11
% done intlit storeage
%check if size is zero if yes, leave
addi r9,r0,32
bz r9,endCopy15

%set left and right ptrs
%set ptr
lw r12,316(r14)
add r12,r14,r12
addi r12,r12,0
%read direct value
add r11,r0,r14
addi r11,r11,668
%set position counter
mul r8,r0,r0
beginCopy15
%move data via register
lw r10,0(r12)
sw 0(r11),r10
%increment registers
addi r12,r12,4
addi r11,r11,4
addi r8,r8,4
%branch out if done
subi r9,r8,32
bnz r9,beginCopy15

endCopy15
% end copy 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy16

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,320
%read direct value
add r8,r0,r14
addi r8,r8,700
%set position counter
mul r12,r0,r0
beginCopy16
%move data via register
lw r10,0(r9)
sw 0(r8),r10
%increment registers
addi r9,r9,4
addi r8,r8,4
addi r12,r12,4
%branch out if done
subi r11,r12,4
bnz r11,beginCopy16

endCopy16
% end copy 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy17

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,324
%read direct value
add r12,r0,r14
addi r12,r12,704
%set position counter
mul r9,r0,r0
beginCopy17
%move data via register
lw r10,0(r11)
sw 0(r12),r10
%increment registers
addi r11,r11,4
addi r12,r12,4
addi r9,r9,4
%branch out if done
subi r8,r9,4
bnz r8,beginCopy17

endCopy17
% end copy 
addi r14,r14,660
jl r15, fnmanmutateAmount1
subi r14,r14,660
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy18

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,660
%read direct value
add r9,r0,r14
addi r9,r9,328
%set position counter
mul r11,r0,r0
beginCopy18
%move data via register
lw r10,0(r8)
sw 0(r9),r10
%increment registers
addi r8,r8,4
addi r9,r9,4
addi r11,r11,4
%branch out if done
subi r12,r11,4
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
addi r12,r12,668
%set ptr
lw r11,316(r14)
add r11,r14,r11
addi r11,r11,0
%set position counter
mul r8,r0,r0
beginCopy19
%move data via register
lw r10,0(r12)
sw 0(r11),r10
%increment registers
addi r12,r12,4
addi r11,r11,4
addi r8,r8,4
%branch out if done
subi r9,r8,32
bnz r9,beginCopy19

endCopy19
% end copy 
% begin assignment 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy20

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,328
lw r8,304(r14)
add r8,r14,r8
%set position counter
mul r12,r0,r0
beginCopy20
%move data via register
lw r10,0(r9)
sw 0(r8),r10
%increment registers
addi r9,r9,4
addi r8,r8,4
addi r12,r12,4
%branch out if done
subi r11,r12,4
bnz r11,beginCopy20

endCopy20
% end assignment 
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 332(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,36
lw r10,332(r14)
 add r11,r11,r10
sw 336(r14),r11
% end var offset calculation
% begin write 
lw r10,336(r14)
add r10,r14,r10
lw r10,0(r10)
%s move ptr to prevent mem corruption
addi r14,r14,740
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
addi r14,r14,-740
% end write
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
sw 340(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,36
lw r12,340(r14)
 add r11,r11,r12
sw 344(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 348(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r10,348(r14)
 add r11,r11,r10
sw 352(r14),r11
% end var offset calculation
%begin dot offsetting
lw r10,352(r14)
sw 356(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,1
sw 360(r14), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,70
sw 364(r14), r10
% done intlit storeage
%check if size is zero if yes, leave
addi r8,r0,32
bz r8,endCopy21

%set left and right ptrs
%set ptr
lw r11,356(r14)
add r11,r14,r11
addi r11,r11,0
%read direct value
add r10,r0,r14
addi r10,r10,668
%set position counter
mul r9,r0,r0
beginCopy21
%move data via register
lw r12,0(r11)
sw 0(r10),r12
%increment registers
addi r11,r11,4
addi r10,r10,4
addi r9,r9,4
%branch out if done
subi r8,r9,32
bnz r8,beginCopy21

endCopy21
% end copy 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy22

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,360
%read direct value
add r9,r0,r14
addi r9,r9,700
%set position counter
mul r11,r0,r0
beginCopy22
%move data via register
lw r12,0(r8)
sw 0(r9),r12
%increment registers
addi r8,r8,4
addi r9,r9,4
addi r11,r11,4
%branch out if done
subi r10,r11,4
bnz r10,beginCopy22

endCopy22
% end copy 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy23

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,364
%read direct value
add r11,r0,r14
addi r11,r11,704
%set position counter
mul r8,r0,r0
beginCopy23
%move data via register
lw r12,0(r10)
sw 0(r11),r12
%increment registers
addi r10,r10,4
addi r11,r11,4
addi r8,r8,4
%branch out if done
subi r9,r8,4
bnz r9,beginCopy23

endCopy23
% end copy 
addi r14,r14,660
jl r15, fnmanmutateAmount1
subi r14,r14,660
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy24

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,660
%read direct value
add r8,r0,r14
addi r8,r8,368
%set position counter
mul r10,r0,r0
beginCopy24
%move data via register
lw r12,0(r9)
sw 0(r8),r12
%increment registers
addi r9,r9,4
addi r8,r8,4
addi r10,r10,4
%branch out if done
subi r11,r10,4
bnz r11,beginCopy24

endCopy24
% end copy 
%begin copy back object
%check if size is zero if yes, leave
addi r8,r0,32
bz r8,endCopy25

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,668
%set ptr
lw r10,356(r14)
add r10,r14,r10
addi r10,r10,0
%set position counter
mul r9,r0,r0
beginCopy25
%move data via register
lw r12,0(r11)
sw 0(r10),r12
%increment registers
addi r11,r11,4
addi r10,r10,4
addi r9,r9,4
%branch out if done
subi r8,r9,32
bnz r8,beginCopy25

endCopy25
% end copy 
% begin assignment 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy26

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,368
lw r9,344(r14)
add r9,r14,r9
%set position counter
mul r11,r0,r0
beginCopy26
%move data via register
lw r12,0(r8)
sw 0(r9),r12
%increment registers
addi r8,r8,4
addi r9,r9,4
addi r11,r11,4
%branch out if done
subi r10,r11,4
bnz r10,beginCopy26

endCopy26
% end assignment 
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
sw 372(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,36
lw r12,372(r14)
 add r10,r10,r12
sw 376(r14),r10
% end var offset calculation
% begin write 
lw r12,376(r14)
add r12,r14,r12
lw r12,0(r12)
%s move ptr to prevent mem corruption
addi r14,r14,740
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
addi r14,r14,-740
% end write
% begin generating indice offseting
addi r12,r0,1
addi r10,r0,0
sw 380(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,36
lw r11,380(r14)
 add r10,r10,r11
sw 384(r14),r10
% end var offset calculation
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
sw 388(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,4
lw r12,388(r14)
 add r10,r10,r12
sw 392(r14),r10
% end var offset calculation
%begin dot offsetting
lw r12,392(r14)
sw 396(r14),r12
%end dot offsetting
% begin intlit storeage
addi r12,r0,2
sw 400(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,220
sw 404(r14), r12
% done intlit storeage
%check if size is zero if yes, leave
addi r9,r0,32
bz r9,endCopy27

%set left and right ptrs
%set ptr
lw r10,396(r14)
add r10,r14,r10
addi r10,r10,0
%read direct value
add r12,r0,r14
addi r12,r12,668
%set position counter
mul r8,r0,r0
beginCopy27
%move data via register
lw r11,0(r10)
sw 0(r12),r11
%increment registers
addi r10,r10,4
addi r12,r12,4
addi r8,r8,4
%branch out if done
subi r9,r8,32
bnz r9,beginCopy27

endCopy27
% end copy 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy28

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,400
%read direct value
add r8,r0,r14
addi r8,r8,700
%set position counter
mul r10,r0,r0
beginCopy28
%move data via register
lw r11,0(r9)
sw 0(r8),r11
%increment registers
addi r9,r9,4
addi r8,r8,4
addi r10,r10,4
%branch out if done
subi r12,r10,4
bnz r12,beginCopy28

endCopy28
% end copy 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy29

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,404
%read direct value
add r10,r0,r14
addi r10,r10,704
%set position counter
mul r9,r0,r0
beginCopy29
%move data via register
lw r11,0(r12)
sw 0(r10),r11
%increment registers
addi r12,r12,4
addi r10,r10,4
addi r9,r9,4
%branch out if done
subi r8,r9,4
bnz r8,beginCopy29

endCopy29
% end copy 
addi r14,r14,660
jl r15, fnmanmutateAmount1
subi r14,r14,660
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy30

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,660
%read direct value
add r9,r0,r14
addi r9,r9,408
%set position counter
mul r12,r0,r0
beginCopy30
%move data via register
lw r11,0(r8)
sw 0(r9),r11
%increment registers
addi r8,r8,4
addi r9,r9,4
addi r12,r12,4
%branch out if done
subi r10,r12,4
bnz r10,beginCopy30

endCopy30
% end copy 
%begin copy back object
%check if size is zero if yes, leave
addi r9,r0,32
bz r9,endCopy31

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,668
%set ptr
lw r12,396(r14)
add r12,r14,r12
addi r12,r12,0
%set position counter
mul r8,r0,r0
beginCopy31
%move data via register
lw r11,0(r10)
sw 0(r12),r11
%increment registers
addi r10,r10,4
addi r12,r12,4
addi r8,r8,4
%branch out if done
subi r9,r8,32
bnz r9,beginCopy31

endCopy31
% end copy 
% begin assignment 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy32

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,408
lw r8,384(r14)
add r8,r14,r8
%set position counter
mul r10,r0,r0
beginCopy32
%move data via register
lw r11,0(r9)
sw 0(r8),r11
%increment registers
addi r9,r9,4
addi r8,r8,4
addi r10,r10,4
%branch out if done
subi r12,r10,4
bnz r12,beginCopy32

endCopy32
% end assignment 
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
sw 412(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,36
lw r11,412(r14)
 add r12,r12,r11
sw 416(r14),r12
% end var offset calculation
% begin write 
lw r11,416(r14)
add r11,r14,r11
lw r11,0(r11)
%s move ptr to prevent mem corruption
addi r14,r14,740
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
addi r14,r14,-740
% end write
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 420(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,36
lw r10,420(r14)
 add r12,r12,r10
sw 424(r14),r12
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
sw 428(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r11,428(r14)
 add r12,r12,r11
sw 432(r14),r12
% end var offset calculation
%begin dot offsetting
lw r11,432(r14)
sw 436(r14),r11
%end dot offsetting
% begin intlit storeage
addi r11,r0,3
sw 440(r14), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,720
sw 444(r14), r11
% done intlit storeage
%check if size is zero if yes, leave
addi r8,r0,32
bz r8,endCopy33

%set left and right ptrs
%set ptr
lw r12,436(r14)
add r12,r14,r12
addi r12,r12,0
%read direct value
add r11,r0,r14
addi r11,r11,668
%set position counter
mul r9,r0,r0
beginCopy33
%move data via register
lw r10,0(r12)
sw 0(r11),r10
%increment registers
addi r12,r12,4
addi r11,r11,4
addi r9,r9,4
%branch out if done
subi r8,r9,32
bnz r8,beginCopy33

endCopy33
% end copy 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy34

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,440
%read direct value
add r9,r0,r14
addi r9,r9,700
%set position counter
mul r12,r0,r0
beginCopy34
%move data via register
lw r10,0(r8)
sw 0(r9),r10
%increment registers
addi r8,r8,4
addi r9,r9,4
addi r12,r12,4
%branch out if done
subi r11,r12,4
bnz r11,beginCopy34

endCopy34
% end copy 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy35

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,444
%read direct value
add r12,r0,r14
addi r12,r12,704
%set position counter
mul r8,r0,r0
beginCopy35
%move data via register
lw r10,0(r11)
sw 0(r12),r10
%increment registers
addi r11,r11,4
addi r12,r12,4
addi r8,r8,4
%branch out if done
subi r9,r8,4
bnz r9,beginCopy35

endCopy35
% end copy 
addi r14,r14,660
jl r15, fnmanmutateAmount1
subi r14,r14,660
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy36

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,660
%read direct value
add r8,r0,r14
addi r8,r8,448
%set position counter
mul r11,r0,r0
beginCopy36
%move data via register
lw r10,0(r9)
sw 0(r8),r10
%increment registers
addi r9,r9,4
addi r8,r8,4
addi r11,r11,4
%branch out if done
subi r12,r11,4
bnz r12,beginCopy36

endCopy36
% end copy 
%begin copy back object
%check if size is zero if yes, leave
addi r8,r0,32
bz r8,endCopy37

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,668
%set ptr
lw r11,436(r14)
add r11,r14,r11
addi r11,r11,0
%set position counter
mul r9,r0,r0
beginCopy37
%move data via register
lw r10,0(r12)
sw 0(r11),r10
%increment registers
addi r12,r12,4
addi r11,r11,4
addi r9,r9,4
%branch out if done
subi r8,r9,32
bnz r8,beginCopy37

endCopy37
% end copy 
% begin assignment 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy38

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,448
lw r9,424(r14)
add r9,r14,r9
%set position counter
mul r12,r0,r0
beginCopy38
%move data via register
lw r10,0(r8)
sw 0(r9),r10
%increment registers
addi r8,r8,4
addi r9,r9,4
addi r12,r12,4
%branch out if done
subi r11,r12,4
bnz r11,beginCopy38

endCopy38
% end assignment 
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 452(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,36
lw r10,452(r14)
 add r11,r11,r10
sw 456(r14),r11
% end var offset calculation
% begin write 
lw r10,456(r14)
add r10,r14,r10
lw r10,0(r10)
%s move ptr to prevent mem corruption
addi r14,r14,740
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
addi r14,r14,-740
% end write
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
sw 460(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,36
lw r12,460(r14)
 add r11,r11,r12
sw 464(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 468(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r10,468(r14)
 add r11,r11,r10
sw 472(r14),r11
% end var offset calculation
%begin dot offsetting
lw r10,472(r14)
sw 476(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,4
sw 480(r14), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,120
sw 484(r14), r10
% done intlit storeage
%check if size is zero if yes, leave
addi r9,r0,32
bz r9,endCopy39

%set left and right ptrs
%set ptr
lw r11,476(r14)
add r11,r14,r11
addi r11,r11,0
%read direct value
add r10,r0,r14
addi r10,r10,668
%set position counter
mul r8,r0,r0
beginCopy39
%move data via register
lw r12,0(r11)
sw 0(r10),r12
%increment registers
addi r11,r11,4
addi r10,r10,4
addi r8,r8,4
%branch out if done
subi r9,r8,32
bnz r9,beginCopy39

endCopy39
% end copy 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy40

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,480
%read direct value
add r8,r0,r14
addi r8,r8,700
%set position counter
mul r11,r0,r0
beginCopy40
%move data via register
lw r12,0(r9)
sw 0(r8),r12
%increment registers
addi r9,r9,4
addi r8,r8,4
addi r11,r11,4
%branch out if done
subi r10,r11,4
bnz r10,beginCopy40

endCopy40
% end copy 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy41

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,484
%read direct value
add r11,r0,r14
addi r11,r11,704
%set position counter
mul r9,r0,r0
beginCopy41
%move data via register
lw r12,0(r10)
sw 0(r11),r12
%increment registers
addi r10,r10,4
addi r11,r11,4
addi r9,r9,4
%branch out if done
subi r8,r9,4
bnz r8,beginCopy41

endCopy41
% end copy 
addi r14,r14,660
jl r15, fnmanmutateAmount1
subi r14,r14,660
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy42

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,660
%read direct value
add r9,r0,r14
addi r9,r9,488
%set position counter
mul r10,r0,r0
beginCopy42
%move data via register
lw r12,0(r8)
sw 0(r9),r12
%increment registers
addi r8,r8,4
addi r9,r9,4
addi r10,r10,4
%branch out if done
subi r11,r10,4
bnz r11,beginCopy42

endCopy42
% end copy 
%begin copy back object
%check if size is zero if yes, leave
addi r9,r0,32
bz r9,endCopy43

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,668
%set ptr
lw r10,476(r14)
add r10,r14,r10
addi r10,r10,0
%set position counter
mul r8,r0,r0
beginCopy43
%move data via register
lw r12,0(r11)
sw 0(r10),r12
%increment registers
addi r11,r11,4
addi r10,r10,4
addi r8,r8,4
%branch out if done
subi r9,r8,32
bnz r9,beginCopy43

endCopy43
% end copy 
% begin assignment 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy44

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,488
lw r8,464(r14)
add r8,r14,r8
%set position counter
mul r11,r0,r0
beginCopy44
%move data via register
lw r12,0(r9)
sw 0(r8),r12
%increment registers
addi r9,r9,4
addi r8,r8,4
addi r11,r11,4
%branch out if done
subi r10,r11,4
bnz r10,beginCopy44

endCopy44
% end assignment 
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
sw 492(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,36
lw r12,492(r14)
 add r10,r10,r12
sw 496(r14),r10
% end var offset calculation
% begin write 
lw r12,496(r14)
add r12,r14,r12
lw r12,0(r12)
%s move ptr to prevent mem corruption
addi r14,r14,740
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
addi r14,r14,-740
% end write
% begin generating indice offseting
addi r12,r0,1
addi r10,r0,0
sw 500(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,4
lw r11,500(r14)
 add r10,r10,r11
sw 504(r14),r10
% end var offset calculation
%begin dot offsetting
lw r11,504(r14)
addi r11,r11,8
sw 508(r14),r11
%end dot offsetting
% begin intlit storeage
addi r11,r0,0
sw 512(r14), r11
% done intlit storeage
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
lw r12,512(r14)
muli r9,r11,4
mul r9,r12,r9
add r10,r10,r9
sw 516(r14),r10
% done generating indice offseting
% begin var offset calculation
lw r12,516(r14)
lw r10,508(r14)
add r10,r10,r12
sw 520(r14),r10
% end var offset calculation
% begin write 
lw r12,520(r14)
add r12,r14,r12
lw r12,0(r12)
%s move ptr to prevent mem corruption
addi r14,r14,740
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
addi r14,r14,-740
% end write
% begin generating indice offseting
addi r12,r0,1
addi r10,r0,0
sw 524(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,4
lw r11,524(r14)
 add r10,r10,r11
sw 528(r14),r10
% end var offset calculation
%begin dot offsetting
lw r11,528(r14)
addi r11,r11,8
sw 532(r14),r11
%end dot offsetting
% begin intlit storeage
addi r11,r0,1
sw 536(r14), r11
% done intlit storeage
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
lw r12,536(r14)
muli r9,r11,4
mul r9,r12,r9
add r10,r10,r9
sw 540(r14),r10
% done generating indice offseting
% begin var offset calculation
lw r12,540(r14)
lw r10,532(r14)
add r10,r10,r12
sw 544(r14),r10
% end var offset calculation
% begin write 
lw r12,544(r14)
add r12,r14,r12
lw r12,0(r12)
%s move ptr to prevent mem corruption
addi r14,r14,740
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
addi r14,r14,-740
% end write
% begin generating indice offseting
addi r12,r0,1
addi r10,r0,0
sw 548(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,4
lw r11,548(r14)
 add r10,r10,r11
sw 552(r14),r10
% end var offset calculation
%begin dot offsetting
lw r11,552(r14)
addi r11,r11,8
sw 556(r14),r11
%end dot offsetting
% begin intlit storeage
addi r11,r0,2
sw 560(r14), r11
% done intlit storeage
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
lw r12,560(r14)
muli r9,r11,4
mul r9,r12,r9
add r10,r10,r9
sw 564(r14),r10
% done generating indice offseting
% begin var offset calculation
lw r12,564(r14)
lw r10,556(r14)
add r10,r10,r12
sw 568(r14),r10
% end var offset calculation
% begin write 
lw r12,568(r14)
add r12,r14,r12
lw r12,0(r12)
%s move ptr to prevent mem corruption
addi r14,r14,740
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
addi r14,r14,-740
% end write
% begin generating indice offseting
addi r12,r0,1
addi r10,r0,0
sw 572(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,4
lw r11,572(r14)
 add r10,r10,r11
sw 576(r14),r10
% end var offset calculation
%begin dot offsetting
lw r11,576(r14)
addi r11,r11,8
sw 580(r14),r11
%end dot offsetting
% begin intlit storeage
addi r11,r0,3
sw 584(r14), r11
% done intlit storeage
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
lw r12,584(r14)
muli r9,r11,4
mul r9,r12,r9
add r10,r10,r9
sw 588(r14),r10
% done generating indice offseting
% begin var offset calculation
lw r12,588(r14)
lw r10,580(r14)
add r10,r10,r12
sw 592(r14),r10
% end var offset calculation
% begin write 
lw r12,592(r14)
add r12,r14,r12
lw r12,0(r12)
%s move ptr to prevent mem corruption
addi r14,r14,740
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
addi r14,r14,-740
% end write
% begin generating indice offseting
addi r12,r0,1
addi r10,r0,0
sw 596(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,4
lw r11,596(r14)
 add r10,r10,r11
sw 600(r14),r10
% end var offset calculation
%begin dot offsetting
lw r11,600(r14)
addi r11,r11,8
sw 604(r14),r11
%end dot offsetting
% begin intlit storeage
addi r11,r0,4
sw 608(r14), r11
% done intlit storeage
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
lw r12,608(r14)
muli r9,r11,4
mul r9,r12,r9
add r10,r10,r9
sw 612(r14),r10
% done generating indice offseting
% begin var offset calculation
lw r12,612(r14)
lw r10,604(r14)
add r10,r10,r12
sw 616(r14),r10
% end var offset calculation
% begin write 
lw r12,616(r14)
add r12,r14,r12
lw r12,0(r12)
%s move ptr to prevent mem corruption
addi r14,r14,740
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
addi r14,r14,-740
% end write
% begin generating indice offseting
addi r12,r0,1
addi r10,r0,0
sw 620(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,4
lw r11,620(r14)
 add r10,r10,r11
sw 624(r14),r10
% end var offset calculation
%begin dot offsetting
lw r11,624(r14)
addi r11,r11,0
sw 628(r14),r11
%end dot offsetting
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
sw 632(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r12,632(r14)
lw r10,628(r14)
add r10,r10,r12
sw 636(r14),r10
% end var offset calculation
% begin write 
lw r12,636(r14)
add r12,r14,r12
lw r12,0(r12)
%s move ptr to prevent mem corruption
addi r14,r14,740
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
addi r14,r14,-740
% end write
% begin generating indice offseting
addi r12,r0,1
addi r10,r0,0
sw 640(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,4
lw r11,640(r14)
 add r10,r10,r11
sw 644(r14),r10
% end var offset calculation
%begin dot offsetting
lw r11,644(r14)
addi r11,r11,4
sw 648(r14),r11
%end dot offsetting
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
sw 652(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r12,652(r14)
lw r10,648(r14)
add r10,r10,r12
sw 656(r14),r10
% end var offset calculation
% begin write 
lw r12,656(r14)
add r12,r14,r12
lw r12,0(r12)
%s move ptr to prevent mem corruption
addi r14,r14,740
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
addi r14,r14,-740
% end write
hlt
%funcdef begin
fnmanmutateH1
sw 4(r14),r15
% begin generating indice offseting
addi r12,r0,1
addi r10,r0,0
sw 44(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,12
lw r11,44(r14)
 add r10,r10,r11
sw 48(r14),r10
% end var offset calculation
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
sw 52(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,40
lw r12,52(r14)
 add r10,r10,r12
sw 56(r14),r10
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy45

%set left and right ptrs
%set ptr
lw r10,56(r14)
add r10,r14,r10
lw r12,48(r14)
add r12,r14,r12
%set position counter
mul r9,r0,r0
beginCopy45
%move data via register
lw r11,0(r10)
sw 0(r12),r11
%increment registers
addi r10,r10,4
addi r12,r12,4
addi r9,r9,4
%branch out if done
subi r8,r9,4
bnz r8,beginCopy45

endCopy45
% end assignment 
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
sw 60(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,12
lw r11,60(r14)
 add r8,r8,r11
sw 64(r14),r8
% end var offset calculation
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy46

%set left and right ptrs
%set ptr
lw r8,64(r14)
add r8,r14,r8
addi r8,r8,0
%read direct value
add r11,r0,r14
addi r11,r11,0
%set position counter
mul r10,r0,r0
beginCopy46
%move data via register
lw r9,0(r8)
sw 0(r11),r9
%increment registers
addi r8,r8,4
addi r11,r11,4
addi r10,r10,4
%branch out if done
subi r12,r10,4
bnz r12,beginCopy46

endCopy46
% end copy 
lw r15,4(r14)
jr r15 
%funcdef end
%funcdef begin
fnmanmutateX1
sw 4(r14),r15
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
sw 44(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,8
lw r9,44(r14)
 add r12,r12,r9
sw 48(r14),r12
% end var offset calculation
% begin generating indice offseting
addi r9,r0,1
addi r12,r0,0
sw 52(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,40
lw r10,52(r14)
 add r12,r12,r10
sw 56(r14),r12
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy47

%set left and right ptrs
%set ptr
lw r12,56(r14)
add r12,r14,r12
lw r10,48(r14)
add r10,r14,r10
%set position counter
mul r8,r0,r0
beginCopy47
%move data via register
lw r9,0(r12)
sw 0(r10),r9
%increment registers
addi r12,r12,4
addi r10,r10,4
addi r8,r8,4
%branch out if done
subi r11,r8,4
bnz r11,beginCopy47

endCopy47
% end assignment 
% begin generating indice offseting
addi r8,r0,1
addi r11,r0,0
sw 60(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,8
lw r9,60(r14)
 add r11,r11,r9
sw 64(r14),r11
% end var offset calculation
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy48

%set left and right ptrs
%set ptr
lw r11,64(r14)
add r11,r14,r11
addi r11,r11,0
%read direct value
add r9,r0,r14
addi r9,r9,0
%set position counter
mul r12,r0,r0
beginCopy48
%move data via register
lw r8,0(r11)
sw 0(r9),r8
%increment registers
addi r11,r11,4
addi r9,r9,4
addi r12,r12,4
%branch out if done
subi r10,r12,4
bnz r10,beginCopy48

endCopy48
% end copy 
lw r15,4(r14)
jr r15 
%funcdef end
%funcdef begin
fnmanmutateAmount1
sw 4(r14),r15
% begin generating indice offseting
addi r12,r0,1
addi r10,r0,0
sw 52(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,48
lw r8,52(r14)
 add r10,r10,r8
sw 56(r14),r10
% end var offset calculation
% begin generating indice offseting
addi r8,r0,1
addi r10,r0,0
sw 60(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,40
lw r12,60(r14)
 add r10,r10,r12
sw 64(r14),r10
% end var offset calculation
% begin generating indice offseting
addi r12,r0,1
addi r10,r0,0
lw r8,64(r14)
add r8,r14,r8
lw r8,0(r8)
muli r11,r12,4
mul r11,r8,r11
add r10,r10,r11
sw 68(r14),r10
% done generating indice offseting
% begin var offset calculation
addi r10,r0,16
lw r8,68(r14)
 add r10,r10,r8
sw 72(r14),r10
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy49

%set left and right ptrs
%set ptr
lw r10,72(r14)
add r10,r14,r10
lw r8,56(r14)
add r8,r14,r8
%set position counter
mul r11,r0,r0
beginCopy49
%move data via register
lw r12,0(r10)
sw 0(r8),r12
%increment registers
addi r10,r10,4
addi r8,r8,4
addi r11,r11,4
%branch out if done
subi r9,r11,4
bnz r9,beginCopy49

endCopy49
% end assignment 
% begin generating indice offseting
addi r11,r0,1
addi r9,r0,0
sw 76(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,40
lw r12,76(r14)
 add r9,r9,r12
sw 80(r14),r9
% end var offset calculation
% begin generating indice offseting
addi r12,r0,1
addi r9,r0,0
lw r11,80(r14)
add r11,r14,r11
lw r11,0(r11)
muli r10,r12,4
mul r10,r11,r10
add r9,r9,r10
sw 84(r14),r9
% done generating indice offseting
% begin var offset calculation
addi r9,r0,16
lw r11,84(r14)
 add r9,r9,r11
sw 88(r14),r9
% end var offset calculation
% begin generating indice offseting
addi r11,r0,1
addi r9,r0,0
sw 92(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,44
lw r12,92(r14)
 add r9,r9,r12
sw 96(r14),r9
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy50

%set left and right ptrs
%set ptr
lw r9,96(r14)
add r9,r14,r9
lw r12,88(r14)
add r12,r14,r12
%set position counter
mul r10,r0,r0
beginCopy50
%move data via register
lw r11,0(r9)
sw 0(r12),r11
%increment registers
addi r9,r9,4
addi r12,r12,4
addi r10,r10,4
%branch out if done
subi r8,r10,4
bnz r8,beginCopy50

endCopy50
% end assignment 
% begin generating indice offseting
addi r10,r0,1
addi r8,r0,0
sw 100(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,48
lw r11,100(r14)
 add r8,r8,r11
sw 104(r14),r8
% end var offset calculation
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy51

%set left and right ptrs
%set ptr
lw r8,104(r14)
add r8,r14,r8
addi r8,r8,0
%read direct value
add r11,r0,r14
addi r11,r11,0
%set position counter
mul r9,r0,r0
beginCopy51
%move data via register
lw r10,0(r8)
sw 0(r11),r10
%increment registers
addi r8,r8,4
addi r11,r11,4
addi r9,r9,4
%branch out if done
subi r12,r9,4
bnz r12,beginCopy51

endCopy51
% end copy 
lw r15,4(r14)
jr r15 
%funcdef end
%funcdef begin
fnmanconstructor1
sw 32(r14),r15
% begin generating indice offseting
addi r9,r0,1
addi r12,r0,0
sw 88(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,56
lw r10,88(r14)
 add r12,r12,r10
sw 92(r14),r12
% end var offset calculation
%begin dot offsetting
lw r10,92(r14)
addi r10,r10,0
sw 96(r14),r10
%end dot offsetting
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
sw 100(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r9,100(r14)
lw r12,96(r14)
add r12,r12,r9
sw 104(r14),r12
% end var offset calculation
% begin generating indice offseting
addi r9,r0,1
addi r12,r0,0
sw 108(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,36
lw r10,108(r14)
 add r12,r12,r10
sw 112(r14),r12
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy52

%set left and right ptrs
%set ptr
lw r12,112(r14)
add r12,r14,r12
lw r10,104(r14)
add r10,r14,r10
%set position counter
mul r8,r0,r0
beginCopy52
%move data via register
lw r9,0(r12)
sw 0(r10),r9
%increment registers
addi r12,r12,4
addi r10,r10,4
addi r8,r8,4
%branch out if done
subi r11,r8,4
bnz r11,beginCopy52

endCopy52
% end assignment 
% begin generating indice offseting
addi r8,r0,1
addi r11,r0,0
sw 116(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,56
lw r9,116(r14)
 add r11,r11,r9
sw 120(r14),r11
% end var offset calculation
%begin dot offsetting
lw r9,120(r14)
addi r9,r9,4
sw 124(r14),r9
%end dot offsetting
% begin generating indice offseting
addi r9,r0,1
addi r11,r0,0
sw 128(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r8,128(r14)
lw r11,124(r14)
add r11,r11,r8
sw 132(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r8,r0,1
addi r11,r0,0
sw 136(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,40
lw r9,136(r14)
 add r11,r11,r9
sw 140(r14),r11
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy53

%set left and right ptrs
%set ptr
lw r11,140(r14)
add r11,r14,r11
lw r9,132(r14)
add r9,r14,r9
%set position counter
mul r12,r0,r0
beginCopy53
%move data via register
lw r8,0(r11)
sw 0(r9),r8
%increment registers
addi r11,r11,4
addi r9,r9,4
addi r12,r12,4
%branch out if done
subi r10,r12,4
bnz r10,beginCopy53

endCopy53
% end assignment 
% begin generating indice offseting
addi r12,r0,1
addi r10,r0,0
sw 144(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,56
lw r8,144(r14)
 add r10,r10,r8
sw 148(r14),r10
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
addi r10,r0,0
lw r12,156(r14)
muli r11,r8,4
mul r11,r12,r11
add r10,r10,r11
sw 160(r14),r10
% done generating indice offseting
% begin var offset calculation
lw r12,160(r14)
lw r10,152(r14)
add r10,r10,r12
sw 164(r14),r10
% end var offset calculation
% begin generating indice offseting
addi r12,r0,1
addi r10,r0,0
sw 168(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,44
lw r8,168(r14)
 add r10,r10,r8
sw 172(r14),r10
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy54

%set left and right ptrs
%set ptr
lw r10,172(r14)
add r10,r14,r10
lw r8,164(r14)
add r8,r14,r8
%set position counter
mul r11,r0,r0
beginCopy54
%move data via register
lw r12,0(r10)
sw 0(r8),r12
%increment registers
addi r10,r10,4
addi r8,r8,4
addi r11,r11,4
%branch out if done
subi r9,r11,4
bnz r9,beginCopy54

endCopy54
% end assignment 
% begin generating indice offseting
addi r11,r0,1
addi r9,r0,0
sw 176(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,56
lw r12,176(r14)
 add r9,r9,r12
sw 180(r14),r9
% end var offset calculation
%begin dot offsetting
lw r12,180(r14)
addi r12,r12,8
sw 184(r14),r12
%end dot offsetting
% begin intlit storeage
addi r12,r0,1
sw 188(r14), r12
% done intlit storeage
% begin generating indice offseting
addi r12,r0,1
addi r9,r0,0
lw r11,188(r14)
muli r10,r12,4
mul r10,r11,r10
add r9,r9,r10
sw 192(r14),r9
% done generating indice offseting
% begin var offset calculation
lw r11,192(r14)
lw r9,184(r14)
add r9,r9,r11
sw 196(r14),r9
% end var offset calculation
% begin generating indice offseting
addi r11,r0,1
addi r9,r0,0
sw 200(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,48
lw r12,200(r14)
 add r9,r9,r12
sw 204(r14),r9
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy55

%set left and right ptrs
%set ptr
lw r9,204(r14)
add r9,r14,r9
lw r12,196(r14)
add r12,r14,r12
%set position counter
mul r10,r0,r0
beginCopy55
%move data via register
lw r11,0(r9)
sw 0(r12),r11
%increment registers
addi r9,r9,4
addi r12,r12,4
addi r10,r10,4
%branch out if done
subi r8,r10,4
bnz r8,beginCopy55

endCopy55
% end assignment 
% begin generating indice offseting
addi r10,r0,1
addi r8,r0,0
sw 208(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,56
lw r11,208(r14)
 add r8,r8,r11
sw 212(r14),r8
% end var offset calculation
%begin dot offsetting
lw r11,212(r14)
addi r11,r11,8
sw 216(r14),r11
%end dot offsetting
% begin intlit storeage
addi r11,r0,2
sw 220(r14), r11
% done intlit storeage
% begin generating indice offseting
addi r11,r0,1
addi r8,r0,0
lw r10,220(r14)
muli r9,r11,4
mul r9,r10,r9
add r8,r8,r9
sw 224(r14),r8
% done generating indice offseting
% begin var offset calculation
lw r10,224(r14)
lw r8,216(r14)
add r8,r8,r10
sw 228(r14),r8
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r8,r0,0
sw 232(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,52
lw r11,232(r14)
 add r8,r8,r11
sw 236(r14),r8
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy56

%set left and right ptrs
%set ptr
lw r8,236(r14)
add r8,r14,r8
lw r11,228(r14)
add r11,r14,r11
%set position counter
mul r9,r0,r0
beginCopy56
%move data via register
lw r10,0(r8)
sw 0(r11),r10
%increment registers
addi r8,r8,4
addi r11,r11,4
addi r9,r9,4
%branch out if done
subi r12,r9,4
bnz r12,beginCopy56

endCopy56
% end assignment 
% begin generating indice offseting
addi r9,r0,1
addi r12,r0,0
sw 240(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,56
lw r10,240(r14)
 add r12,r12,r10
sw 244(r14),r12
% end var offset calculation
%begin dot offsetting
lw r10,244(r14)
addi r10,r10,8
sw 248(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,3
sw 252(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
lw r9,252(r14)
muli r8,r10,4
mul r8,r9,r8
add r12,r12,r8
sw 256(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r9,256(r14)
lw r12,248(r14)
add r12,r12,r9
sw 260(r14),r12
% end var offset calculation
% begin generating indice offseting
addi r9,r0,1
addi r12,r0,0
sw 264(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,52
lw r10,264(r14)
 add r12,r12,r10
sw 268(r14),r12
% end var offset calculation
% begin intlit storeage
addi r10,r0,10
sw 272(r14), r10
% done intlit storeage
% begin add op 
lw r8,268(r14)
add r8,r14,r8
lw r10,0(r8)
lw r12,272(r14)
add r9,r10,r12
sw 276(r14),r9
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy57

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,276
lw r8,260(r14)
add r8,r14,r8
%set position counter
mul r10,r0,r0
beginCopy57
%move data via register
lw r12,0(r9)
sw 0(r8),r12
%increment registers
addi r9,r9,4
addi r8,r8,4
addi r10,r10,4
%branch out if done
subi r11,r10,4
bnz r11,beginCopy57

endCopy57
% end assignment 
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
sw 280(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,56
lw r12,280(r14)
 add r11,r11,r12
sw 284(r14),r11
% end var offset calculation
%begin dot offsetting
lw r12,284(r14)
addi r12,r12,8
sw 288(r14),r12
%end dot offsetting
% begin intlit storeage
addi r12,r0,4
sw 292(r14), r12
% done intlit storeage
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
lw r10,292(r14)
muli r9,r12,4
mul r9,r10,r9
add r11,r11,r9
sw 296(r14),r11
% done generating indice offseting
% begin var offset calculation
lw r10,296(r14)
lw r11,288(r14)
add r11,r11,r10
sw 300(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
sw 304(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,52
lw r12,304(r14)
 add r11,r11,r12
sw 308(r14),r11
% end var offset calculation
% begin intlit storeage
addi r12,r0,20
sw 312(r14), r12
% done intlit storeage
% begin add op 
lw r9,308(r14)
add r9,r14,r9
lw r12,0(r9)
lw r11,312(r14)
add r10,r12,r11
sw 316(r14),r10
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy58

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,316
lw r9,300(r14)
add r9,r14,r9
%set position counter
mul r12,r0,r0
beginCopy58
%move data via register
lw r11,0(r10)
sw 0(r9),r11
%increment registers
addi r10,r10,4
addi r9,r9,4
addi r12,r12,4
%branch out if done
subi r8,r12,4
bnz r8,beginCopy58

endCopy58
% end assignment 
% begin generating indice offseting
addi r12,r0,1
addi r8,r0,0
sw 320(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,56
lw r11,320(r14)
 add r8,r8,r11
sw 324(r14),r8
% end var offset calculation
%check if size is zero if yes, leave
addi r9,r0,32
bz r9,endCopy59

%set left and right ptrs
%set ptr
lw r8,324(r14)
add r8,r14,r8
addi r8,r8,0
%read direct value
add r11,r0,r14
addi r11,r11,0
%set position counter
mul r10,r0,r0
beginCopy59
%move data via register
lw r12,0(r8)
sw 0(r11),r12
%increment registers
addi r8,r8,4
addi r11,r11,4
addi r10,r10,4
%branch out if done
subi r9,r10,32
bnz r9,beginCopy59

endCopy59
% end copy 
lw r15,32(r14)
jr r15 
%funcdef end
