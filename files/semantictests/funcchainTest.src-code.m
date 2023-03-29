entry
muli r0,r0,0
muli r14,r0,0
addi r14,r0,stackbase
%r14 is stack ptr, stack grows downwards or upwards
%24kb stack
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 24(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r10,24(r14)
 add r11,r11,r10
sw 28(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
sw 32(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r12,32(r14)
 add r11,r11,r12
sw 36(r14),r11
% end var offset calculation
%begin dot offsetting
lw r12,36(r14)
sw 40(r14),r12
%end dot offsetting
%check if size is zero if yes, leave
addi r8,r0,0
bz r8,endCopy1

%set left and right ptrs
%set ptr
lw r11,40(r14)
add r11,r14,r11
addi r11,r11,0
%read direct value
add r12,r0,r14
addi r12,r12,144
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
subi r8,r9,0
bnz r8,beginCopy1

endCopy1
% end copy 
addi r14,r14,140
jl r15, fnmanleg1
subi r14,r14,140
%check if size is zero if yes, leave
addi r12,r0,0
bz r12,endCopy2

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,140
%read direct value
add r9,r0,r14
addi r9,r9,44
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
subi r12,r11,0
bnz r12,beginCopy2

endCopy2
% end copy 
%begin copy back object
%check if size is zero if yes, leave
addi r9,r0,0
bz r9,endCopy3

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,144
%set ptr
lw r11,40(r14)
add r11,r14,r11
addi r11,r11,0
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
subi r9,r8,0
bnz r9,beginCopy3

endCopy3
% end copy 
%check if size is zero if yes, leave
addi r11,r0,0
bz r11,endCopy4

%set left and right ptrs
%set ptr
lw r9,44(r14)
add r9,r14,r9
addi r9,r9,0
%read direct value
add r8,r0,r14
addi r8,r8,164
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
subi r11,r12,0
bnz r11,beginCopy4

endCopy4
% end copy 
addi r14,r14,140
jl r15, fnlegendwar1
subi r14,r14,140
%check if size is zero if yes, leave
addi r8,r0,20
bz r8,endCopy5

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,140
%read direct value
add r12,r0,r14
addi r12,r12,48
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
subi r8,r9,20
bnz r8,beginCopy5

endCopy5
% end copy 
%begin copy back object
%check if size is zero if yes, leave
addi r12,r0,0
bz r12,endCopy6

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,164
%set ptr
lw r9,44(r14)
add r9,r14,r9
addi r9,r9,0
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
subi r12,r11,0
bnz r12,beginCopy6

endCopy6
% end copy 
% begin assignment 
%check if size is zero if yes, leave
addi r9,r0,20
bz r9,endCopy7

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,48
lw r11,28(r14)
add r11,r14,r11
%set position counter
mul r8,r0,r0
beginCopy7
%move data via register
lw r10,0(r12)
sw 0(r11),r10
%increment registers
addi r12,r12,4
addi r11,r11,4
addi r8,r8,4
%branch out if done
subi r9,r8,20
bnz r9,beginCopy7

endCopy7
% end assignment 
% begin generating indice offseting
addi r8,r0,1
addi r9,r0,0
sw 68(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,4
lw r10,68(r14)
 add r9,r9,r10
sw 72(r14),r9
% end var offset calculation
%begin dot offsetting
lw r10,72(r14)
addi r10,r10,0
sw 76(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,0
sw 80(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
lw r8,80(r14)
muli r12,r10,4
mul r12,r8,r12
add r9,r9,r12
sw 84(r14),r9
% done generating indice offseting
% begin var offset calculation
lw r8,84(r14)
lw r9,76(r14)
add r9,r9,r8
sw 88(r14),r9
% end var offset calculation
% begin write 
lw r8,88(r14)
add r8,r14,r8
lw r8,0(r8)
%s move ptr to prevent mem corruption
addi r14,r14,220
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
addi r14,r14,-220
% end write
% begin generating indice offseting
addi r8,r0,1
addi r9,r0,0
sw 92(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,4
lw r10,92(r14)
 add r9,r9,r10
sw 96(r14),r9
% end var offset calculation
%begin dot offsetting
lw r10,96(r14)
addi r10,r10,0
sw 100(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,1
sw 104(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
lw r8,104(r14)
muli r12,r10,4
mul r12,r8,r12
add r9,r9,r12
sw 108(r14),r9
% done generating indice offseting
% begin var offset calculation
lw r8,108(r14)
lw r9,100(r14)
add r9,r9,r8
sw 112(r14),r9
% end var offset calculation
% begin write 
lw r8,112(r14)
add r8,r14,r8
lw r8,0(r8)
%s move ptr to prevent mem corruption
addi r14,r14,220
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
addi r14,r14,-220
% end write
% begin generating indice offseting
addi r8,r0,1
addi r9,r0,0
sw 116(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,4
lw r10,116(r14)
 add r9,r9,r10
sw 120(r14),r9
% end var offset calculation
%begin dot offsetting
lw r10,120(r14)
addi r10,r10,0
sw 124(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,2
sw 128(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
lw r8,128(r14)
muli r12,r10,4
mul r12,r8,r12
add r9,r9,r12
sw 132(r14),r9
% done generating indice offseting
% begin var offset calculation
lw r8,132(r14)
lw r9,124(r14)
add r9,r9,r8
sw 136(r14),r9
% end var offset calculation
% begin write 
lw r8,136(r14)
add r8,r14,r8
lw r8,0(r8)
%s move ptr to prevent mem corruption
addi r14,r14,220
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
addi r14,r14,-220
% end write
hlt
%funcdef begin
fnmanleg1
sw 0(r14),r15
% begin generating indice offseting
addi r8,r0,1
addi r9,r0,0
sw 4(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,4
lw r10,4(r14)
 add r9,r9,r10
sw 8(r14),r9
% end var offset calculation
%check if size is zero if yes, leave
addi r11,r0,0
bz r11,endCopy8

%set left and right ptrs
%set ptr
lw r9,8(r14)
add r9,r14,r9
addi r9,r9,0
%read direct value
add r10,r0,r14
addi r10,r10,0
%set position counter
mul r12,r0,r0
beginCopy8
%move data via register
lw r8,0(r9)
sw 0(r10),r8
%increment registers
addi r9,r9,4
addi r10,r10,4
addi r12,r12,4
%branch out if done
subi r11,r12,0
bnz r11,beginCopy8

endCopy8
% end copy 
lw r15,0(r14)
jr r15 
%funcdef end
%funcdef begin
fnwarriorset1
sw 0(r14),r15
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 32(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,24
lw r8,32(r14)
 add r11,r11,r8
sw 36(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r8,r0,1
addi r11,r0,0
lw r12,36(r14)
add r12,r14,r12
lw r12,0(r12)
muli r9,r8,4
mul r9,r12,r9
add r11,r11,r9
sw 40(r14),r11
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r12,40(r14)
 add r11,r11,r12
sw 44(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 48(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,28
lw r8,48(r14)
 add r11,r11,r8
sw 52(r14),r11
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy9

%set left and right ptrs
%set ptr
lw r11,52(r14)
add r11,r14,r11
lw r8,44(r14)
add r8,r14,r8
%set position counter
mul r9,r0,r0
beginCopy9
%move data via register
lw r12,0(r11)
sw 0(r8),r12
%increment registers
addi r11,r11,4
addi r8,r8,4
addi r9,r9,4
%branch out if done
subi r10,r9,4
bnz r10,beginCopy9

endCopy9
% end assignment 
lw r15,0(r14)
jr r15 
%funcdef end
%funcdef begin
fnlegendwar1
sw 20(r14),r15
% begin generating indice offseting
addi r9,r0,1
addi r10,r0,0
sw 44(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,24
lw r12,44(r14)
 add r10,r10,r12
sw 48(r14),r10
% end var offset calculation
%begin dot offsetting
lw r12,48(r14)
sw 52(r14),r12
%end dot offsetting
% begin intlit storeage
addi r12,r0,0
sw 56(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,20
sw 60(r14), r12
% done intlit storeage
%check if size is zero if yes, leave
addi r8,r0,20
bz r8,endCopy10

%set left and right ptrs
%set ptr
lw r10,52(r14)
add r10,r14,r10
addi r10,r10,0
%read direct value
add r12,r0,r14
addi r12,r12,116
%set position counter
mul r11,r0,r0
beginCopy10
%move data via register
lw r9,0(r10)
sw 0(r12),r9
%increment registers
addi r10,r10,4
addi r12,r12,4
addi r11,r11,4
%branch out if done
subi r8,r11,20
bnz r8,beginCopy10

endCopy10
% end copy 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy11

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,56
%read direct value
add r11,r0,r14
addi r11,r11,136
%set position counter
mul r10,r0,r0
beginCopy11
%move data via register
lw r9,0(r8)
sw 0(r11),r9
%increment registers
addi r8,r8,4
addi r11,r11,4
addi r10,r10,4
%branch out if done
subi r12,r10,4
bnz r12,beginCopy11

endCopy11
% end copy 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy12

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,60
%read direct value
add r10,r0,r14
addi r10,r10,140
%set position counter
mul r8,r0,r0
beginCopy12
%move data via register
lw r9,0(r12)
sw 0(r10),r9
%increment registers
addi r12,r12,4
addi r10,r10,4
addi r8,r8,4
%branch out if done
subi r11,r8,4
bnz r11,beginCopy12

endCopy12
% end copy 
addi r14,r14,112
jl r15, fnwarriorset1
subi r14,r14,112
%check if size is zero if yes, leave
addi r10,r0,0
bz r10,endCopy13

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,112
%read direct value
add r8,r0,r14
addi r8,r8,64
%set position counter
mul r12,r0,r0
beginCopy13
%move data via register
lw r9,0(r11)
sw 0(r8),r9
%increment registers
addi r11,r11,4
addi r8,r8,4
addi r12,r12,4
%branch out if done
subi r10,r12,0
bnz r10,beginCopy13

endCopy13
% end copy 
%begin copy back object
%check if size is zero if yes, leave
addi r8,r0,20
bz r8,endCopy14

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,116
%set ptr
lw r12,52(r14)
add r12,r14,r12
addi r12,r12,0
%set position counter
mul r11,r0,r0
beginCopy14
%move data via register
lw r9,0(r10)
sw 0(r12),r9
%increment registers
addi r10,r10,4
addi r12,r12,4
addi r11,r11,4
%branch out if done
subi r8,r11,20
bnz r8,beginCopy14

endCopy14
% end copy 
% begin generating indice offseting
addi r11,r0,1
addi r8,r0,0
sw 64(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,24
lw r9,64(r14)
 add r8,r8,r9
sw 68(r14),r8
% end var offset calculation
%begin dot offsetting
lw r9,68(r14)
sw 72(r14),r9
%end dot offsetting
% begin intlit storeage
addi r9,r0,1
sw 76(r14), r9
% done intlit storeage
% begin intlit storeage
addi r9,r0,40
sw 80(r14), r9
% done intlit storeage
%check if size is zero if yes, leave
addi r12,r0,20
bz r12,endCopy15

%set left and right ptrs
%set ptr
lw r8,72(r14)
add r8,r14,r8
addi r8,r8,0
%read direct value
add r9,r0,r14
addi r9,r9,116
%set position counter
mul r10,r0,r0
beginCopy15
%move data via register
lw r11,0(r8)
sw 0(r9),r11
%increment registers
addi r8,r8,4
addi r9,r9,4
addi r10,r10,4
%branch out if done
subi r12,r10,20
bnz r12,beginCopy15

endCopy15
% end copy 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy16

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,76
%read direct value
add r10,r0,r14
addi r10,r10,136
%set position counter
mul r8,r0,r0
beginCopy16
%move data via register
lw r11,0(r12)
sw 0(r10),r11
%increment registers
addi r12,r12,4
addi r10,r10,4
addi r8,r8,4
%branch out if done
subi r9,r8,4
bnz r9,beginCopy16

endCopy16
% end copy 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy17

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,80
%read direct value
add r8,r0,r14
addi r8,r8,140
%set position counter
mul r12,r0,r0
beginCopy17
%move data via register
lw r11,0(r9)
sw 0(r8),r11
%increment registers
addi r9,r9,4
addi r8,r8,4
addi r12,r12,4
%branch out if done
subi r10,r12,4
bnz r10,beginCopy17

endCopy17
% end copy 
addi r14,r14,112
jl r15, fnwarriorset1
subi r14,r14,112
%check if size is zero if yes, leave
addi r8,r0,0
bz r8,endCopy18

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,112
%read direct value
add r12,r0,r14
addi r12,r12,84
%set position counter
mul r9,r0,r0
beginCopy18
%move data via register
lw r11,0(r10)
sw 0(r12),r11
%increment registers
addi r10,r10,4
addi r12,r12,4
addi r9,r9,4
%branch out if done
subi r8,r9,0
bnz r8,beginCopy18

endCopy18
% end copy 
%begin copy back object
%check if size is zero if yes, leave
addi r12,r0,20
bz r12,endCopy19

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,116
%set ptr
lw r9,72(r14)
add r9,r14,r9
addi r9,r9,0
%set position counter
mul r10,r0,r0
beginCopy19
%move data via register
lw r11,0(r8)
sw 0(r9),r11
%increment registers
addi r8,r8,4
addi r9,r9,4
addi r10,r10,4
%branch out if done
subi r12,r10,20
bnz r12,beginCopy19

endCopy19
% end copy 
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
sw 84(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,24
lw r11,84(r14)
 add r12,r12,r11
sw 88(r14),r12
% end var offset calculation
%begin dot offsetting
lw r11,88(r14)
sw 92(r14),r11
%end dot offsetting
% begin intlit storeage
addi r11,r0,2
sw 96(r14), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,50
sw 100(r14), r11
% done intlit storeage
%check if size is zero if yes, leave
addi r9,r0,20
bz r9,endCopy20

%set left and right ptrs
%set ptr
lw r12,92(r14)
add r12,r14,r12
addi r12,r12,0
%read direct value
add r11,r0,r14
addi r11,r11,116
%set position counter
mul r8,r0,r0
beginCopy20
%move data via register
lw r10,0(r12)
sw 0(r11),r10
%increment registers
addi r12,r12,4
addi r11,r11,4
addi r8,r8,4
%branch out if done
subi r9,r8,20
bnz r9,beginCopy20

endCopy20
% end copy 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy21

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,96
%read direct value
add r8,r0,r14
addi r8,r8,136
%set position counter
mul r12,r0,r0
beginCopy21
%move data via register
lw r10,0(r9)
sw 0(r8),r10
%increment registers
addi r9,r9,4
addi r8,r8,4
addi r12,r12,4
%branch out if done
subi r11,r12,4
bnz r11,beginCopy21

endCopy21
% end copy 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy22

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,100
%read direct value
add r12,r0,r14
addi r12,r12,140
%set position counter
mul r9,r0,r0
beginCopy22
%move data via register
lw r10,0(r11)
sw 0(r12),r10
%increment registers
addi r11,r11,4
addi r12,r12,4
addi r9,r9,4
%branch out if done
subi r8,r9,4
bnz r8,beginCopy22

endCopy22
% end copy 
addi r14,r14,112
jl r15, fnwarriorset1
subi r14,r14,112
%check if size is zero if yes, leave
addi r12,r0,0
bz r12,endCopy23

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,112
%read direct value
add r9,r0,r14
addi r9,r9,104
%set position counter
mul r11,r0,r0
beginCopy23
%move data via register
lw r10,0(r8)
sw 0(r9),r10
%increment registers
addi r8,r8,4
addi r9,r9,4
addi r11,r11,4
%branch out if done
subi r12,r11,0
bnz r12,beginCopy23

endCopy23
% end copy 
%begin copy back object
%check if size is zero if yes, leave
addi r9,r0,20
bz r9,endCopy24

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,116
%set ptr
lw r11,92(r14)
add r11,r14,r11
addi r11,r11,0
%set position counter
mul r8,r0,r0
beginCopy24
%move data via register
lw r10,0(r12)
sw 0(r11),r10
%increment registers
addi r12,r12,4
addi r11,r11,4
addi r8,r8,4
%branch out if done
subi r9,r8,20
bnz r9,beginCopy24

endCopy24
% end copy 
% begin generating indice offseting
addi r8,r0,1
addi r9,r0,0
sw 104(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,24
lw r10,104(r14)
 add r9,r9,r10
sw 108(r14),r9
% end var offset calculation
%check if size is zero if yes, leave
addi r11,r0,20
bz r11,endCopy25

%set left and right ptrs
%set ptr
lw r9,108(r14)
add r9,r14,r9
addi r9,r9,0
%read direct value
add r10,r0,r14
addi r10,r10,0
%set position counter
mul r12,r0,r0
beginCopy25
%move data via register
lw r8,0(r9)
sw 0(r10),r8
%increment registers
addi r9,r9,4
addi r10,r10,4
addi r12,r12,4
%branch out if done
subi r11,r12,20
bnz r11,beginCopy25

endCopy25
% end copy 
lw r15,20(r14)
jr r15 
%funcdef end
