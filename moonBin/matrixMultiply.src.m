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
addi r12,r0,10
sw 112(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,9
sw 116(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,4
sw 120(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,6
sw 124(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,71
sw 128(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,11
sw 132(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,2
sw 136(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,4
sw 140(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,5
sw 144(r14), r12
% done intlit storeage
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy1

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,112
%read direct value
add r12,r0,r14
addi r12,r12,340
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
addi r8,r8,116
%read direct value
add r9,r0,r14
addi r9,r9,344
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
addi r12,r12,120
%read direct value
add r11,r0,r14
addi r11,r11,348
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
addi r9,r9,124
%read direct value
add r8,r0,r14
addi r8,r8,352
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
addi r11,r11,128
%read direct value
add r12,r0,r14
addi r12,r12,356
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
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy6

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,132
%read direct value
add r9,r0,r14
addi r9,r9,360
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
subi r12,r11,4
bnz r12,beginCopy6

endCopy6
% end copy 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy7

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,136
%read direct value
add r11,r0,r14
addi r11,r11,364
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
subi r9,r8,4
bnz r9,beginCopy7

endCopy7
% end copy 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy8

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,140
%read direct value
add r8,r0,r14
addi r8,r8,368
%set position counter
mul r12,r0,r0
beginCopy8
%move data via register
lw r10,0(r9)
sw 0(r8),r10
%increment registers
addi r9,r9,4
addi r8,r8,4
addi r12,r12,4
%branch out if done
subi r11,r12,4
bnz r11,beginCopy8

endCopy8
% end copy 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy9

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,144
%read direct value
add r12,r0,r14
addi r12,r12,372
%set position counter
mul r9,r0,r0
beginCopy9
%move data via register
lw r10,0(r11)
sw 0(r12),r10
%increment registers
addi r11,r11,4
addi r12,r12,4
addi r9,r9,4
%branch out if done
subi r8,r9,4
bnz r8,beginCopy9

endCopy9
% end copy 
addi r14,r14,300
jl r15, fnMatrixconstructor1
subi r14,r14,300
%check if size is zero if yes, leave
addi r12,r0,36
bz r12,endCopy10

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,300
%read direct value
add r9,r0,r14
addi r9,r9,4
%set position counter
mul r11,r0,r0
beginCopy10
%move data via register
lw r10,0(r8)
sw 0(r9),r10
%increment registers
addi r8,r8,4
addi r9,r9,4
addi r11,r11,4
%branch out if done
subi r12,r11,36
bnz r12,beginCopy10

endCopy10
% end copy 
% begin intlit storeage
addi r11,r0,1
sw 148(r14), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,11
sw 152(r14), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,7
sw 156(r14), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,12
sw 160(r14), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,42
sw 164(r14), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,21
sw 168(r14), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,42
sw 172(r14), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,2
sw 176(r14), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,4
sw 180(r14), r11
% done intlit storeage
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy11

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,148
%read direct value
add r11,r0,r14
addi r11,r11,340
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
subi r9,r8,4
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
addi r8,r8,344
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
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy13

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,156
%read direct value
add r12,r0,r14
addi r12,r12,348
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
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy14

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,160
%read direct value
add r9,r0,r14
addi r9,r9,352
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
subi r12,r11,4
bnz r12,beginCopy14

endCopy14
% end copy 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy15

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,164
%read direct value
add r11,r0,r14
addi r11,r11,356
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
subi r9,r8,4
bnz r9,beginCopy15

endCopy15
% end copy 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy16

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,168
%read direct value
add r8,r0,r14
addi r8,r8,360
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
addi r11,r11,172
%read direct value
add r12,r0,r14
addi r12,r12,364
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
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy18

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,176
%read direct value
add r9,r0,r14
addi r9,r9,368
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
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy19

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,180
%read direct value
add r11,r0,r14
addi r11,r11,372
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
subi r9,r8,4
bnz r9,beginCopy19

endCopy19
% end copy 
addi r14,r14,300
jl r15, fnMatrixconstructor1
subi r14,r14,300
%check if size is zero if yes, leave
addi r11,r0,36
bz r11,endCopy20

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,300
%read direct value
add r8,r0,r14
addi r8,r8,40
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
subi r11,r12,36
bnz r11,beginCopy20

endCopy20
% end copy 
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 184(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,76
lw r10,184(r14)
 add r11,r11,r10
sw 188(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
sw 192(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r12,192(r14)
 add r11,r11,r12
sw 196(r14),r11
% end var offset calculation
%begin dot offsetting
lw r12,196(r14)
addi r12,r12,0
sw 200(r14),r12
%end dot offsetting
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 204(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,40
lw r10,204(r14)
 add r11,r11,r10
sw 208(r14),r11
% end var offset calculation
%check if size is zero if yes, leave
addi r8,r0,36
bz r8,endCopy21

%set left and right ptrs
%set ptr
lw r11,200(r14)
add r11,r14,r11
addi r11,r11,0
%read direct value
add r10,r0,r14
addi r10,r10,340
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
subi r8,r9,36
bnz r8,beginCopy21

endCopy21
% end copy 
%check if size is zero if yes, leave
addi r10,r0,36
bz r10,endCopy22

%set left and right ptrs
%set ptr
lw r8,208(r14)
add r8,r14,r8
addi r8,r8,0
%read direct value
add r9,r0,r14
addi r9,r9,376
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
subi r10,r11,36
bnz r10,beginCopy22

endCopy22
% end copy 
addi r14,r14,300
jl r15, fnMatrixmultiply1
subi r14,r14,300
%check if size is zero if yes, leave
addi r9,r0,36
bz r9,endCopy23

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,300
%read direct value
add r11,r0,r14
addi r11,r11,212
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
subi r9,r8,36
bnz r9,beginCopy23

endCopy23
% end copy 
%begin copy back object
%check if size is zero if yes, leave
addi r11,r0,36
bz r11,endCopy24

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,340
%set ptr
lw r8,200(r14)
add r8,r14,r8
addi r8,r8,0
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
subi r11,r10,36
bnz r11,beginCopy24

endCopy24
% end copy 
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,36
bz r8,endCopy25

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,212
lw r10,188(r14)
add r10,r14,r10
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
subi r8,r9,36
bnz r8,beginCopy25

endCopy25
% end assignment 
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
sw 248(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,76
lw r12,248(r14)
 add r8,r8,r12
sw 252(r14),r8
% end var offset calculation
%begin dot offsetting
lw r12,252(r14)
addi r12,r12,0
sw 256(r14),r12
%end dot offsetting
%check if size is zero if yes, leave
addi r10,r0,36
bz r10,endCopy26

%set left and right ptrs
%set ptr
lw r8,256(r14)
add r8,r14,r8
addi r8,r8,0
%read direct value
add r12,r0,r14
addi r12,r12,304
%set position counter
mul r11,r0,r0
beginCopy26
%move data via register
lw r9,0(r8)
sw 0(r12),r9
%increment registers
addi r8,r8,4
addi r12,r12,4
addi r11,r11,4
%branch out if done
subi r10,r11,36
bnz r10,beginCopy26

endCopy26
% end copy 
addi r14,r14,300
jl r15, fnMatrixprint1
subi r14,r14,300
%check if size is zero if yes, leave
addi r12,r0,0
bz r12,endCopy27

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,300
%read direct value
add r11,r0,r14
addi r11,r11,260
%set position counter
mul r8,r0,r0
beginCopy27
%move data via register
lw r9,0(r10)
sw 0(r11),r9
%increment registers
addi r10,r10,4
addi r11,r11,4
addi r8,r8,4
%branch out if done
subi r12,r8,0
bnz r12,beginCopy27

endCopy27
% end copy 
%begin copy back object
%check if size is zero if yes, leave
addi r11,r0,36
bz r11,endCopy28

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,304
%set ptr
lw r8,256(r14)
add r8,r14,r8
addi r8,r8,0
%set position counter
mul r10,r0,r0
beginCopy28
%move data via register
lw r9,0(r12)
sw 0(r8),r9
%increment registers
addi r12,r12,4
addi r8,r8,4
addi r10,r10,4
%branch out if done
subi r11,r10,36
bnz r11,beginCopy28

endCopy28
% end copy 
% begin intlit storeage
addi r10,r0,1
sw 260(r14), r10
% done intlit storeage
% begin sign op 
lw r10,260(r14)
sub r11,r0,r10
sw 264(r14),r11
% end sign op 
% begin write 
lw r9,264(r14)
%s move ptr to prevent mem corruption
addi r14,r14,380
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
addi r14,r14,-380
% end write
% begin generating indice offseting
addi r9,r0,1
addi r11,r0,0
sw 268(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r10,268(r14)
 add r11,r11,r10
sw 272(r14),r11
% end var offset calculation
%begin dot offsetting
lw r10,272(r14)
addi r10,r10,0
sw 276(r14),r10
%end dot offsetting
%check if size is zero if yes, leave
addi r8,r0,36
bz r8,endCopy29

%set left and right ptrs
%set ptr
lw r11,276(r14)
add r11,r14,r11
addi r11,r11,0
%read direct value
add r10,r0,r14
addi r10,r10,304
%set position counter
mul r12,r0,r0
beginCopy29
%move data via register
lw r9,0(r11)
sw 0(r10),r9
%increment registers
addi r11,r11,4
addi r10,r10,4
addi r12,r12,4
%branch out if done
subi r8,r12,36
bnz r8,beginCopy29

endCopy29
% end copy 
addi r14,r14,300
jl r15, fnMatrixprint1
subi r14,r14,300
%check if size is zero if yes, leave
addi r10,r0,0
bz r10,endCopy30

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,300
%read direct value
add r12,r0,r14
addi r12,r12,280
%set position counter
mul r11,r0,r0
beginCopy30
%move data via register
lw r9,0(r8)
sw 0(r12),r9
%increment registers
addi r8,r8,4
addi r12,r12,4
addi r11,r11,4
%branch out if done
subi r10,r11,0
bnz r10,beginCopy30

endCopy30
% end copy 
%begin copy back object
%check if size is zero if yes, leave
addi r12,r0,36
bz r12,endCopy31

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,304
%set ptr
lw r11,276(r14)
add r11,r14,r11
addi r11,r11,0
%set position counter
mul r8,r0,r0
beginCopy31
%move data via register
lw r9,0(r10)
sw 0(r11),r9
%increment registers
addi r10,r10,4
addi r11,r11,4
addi r8,r8,4
%branch out if done
subi r12,r8,36
bnz r12,beginCopy31

endCopy31
% end copy 
% begin intlit storeage
addi r8,r0,1
sw 280(r14), r8
% done intlit storeage
% begin sign op 
lw r8,280(r14)
sub r12,r0,r8
sw 284(r14),r12
% end sign op 
% begin write 
lw r9,284(r14)
%s move ptr to prevent mem corruption
addi r14,r14,380
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
addi r14,r14,-380
% end write
% begin generating indice offseting
addi r9,r0,1
addi r12,r0,0
sw 288(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,40
lw r8,288(r14)
 add r12,r12,r8
sw 292(r14),r12
% end var offset calculation
%begin dot offsetting
lw r8,292(r14)
addi r8,r8,0
sw 296(r14),r8
%end dot offsetting
%check if size is zero if yes, leave
addi r11,r0,36
bz r11,endCopy32

%set left and right ptrs
%set ptr
lw r12,296(r14)
add r12,r14,r12
addi r12,r12,0
%read direct value
add r8,r0,r14
addi r8,r8,304
%set position counter
mul r10,r0,r0
beginCopy32
%move data via register
lw r9,0(r12)
sw 0(r8),r9
%increment registers
addi r12,r12,4
addi r8,r8,4
addi r10,r10,4
%branch out if done
subi r11,r10,36
bnz r11,beginCopy32

endCopy32
% end copy 
addi r14,r14,300
jl r15, fnMatrixprint1
subi r14,r14,300
%check if size is zero if yes, leave
addi r8,r0,0
bz r8,endCopy33

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,300
%read direct value
add r10,r0,r14
addi r10,r10,300
%set position counter
mul r12,r0,r0
beginCopy33
%move data via register
lw r9,0(r11)
sw 0(r10),r9
%increment registers
addi r11,r11,4
addi r10,r10,4
addi r12,r12,4
%branch out if done
subi r8,r12,0
bnz r8,beginCopy33

endCopy33
% end copy 
%begin copy back object
%check if size is zero if yes, leave
addi r10,r0,36
bz r10,endCopy34

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,304
%set ptr
lw r12,296(r14)
add r12,r14,r12
addi r12,r12,0
%set position counter
mul r11,r0,r0
beginCopy34
%move data via register
lw r9,0(r8)
sw 0(r12),r9
%increment registers
addi r8,r8,4
addi r12,r12,4
addi r11,r11,4
%branch out if done
subi r10,r11,36
bnz r10,beginCopy34

endCopy34
% end copy 
hlt
%funcdef begin
fnMatrixconstructor1
sw 36(r14),r15
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
sw 112(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,76
lw r9,112(r14)
 add r10,r10,r9
sw 116(r14),r10
% end var offset calculation
%begin dot offsetting
lw r9,116(r14)
addi r9,r9,0
sw 120(r14),r9
%end dot offsetting
% begin intlit storeage
addi r9,r0,0
sw 124(r14), r9
% done intlit storeage
% begin intlit storeage
addi r9,r0,0
sw 128(r14), r9
% done intlit storeage
% begin generating indice offseting
addi r9,r0,1
addi r10,r0,0
lw r11,128(r14)
muli r8,r9,4
mul r8,r11,r8
add r10,r10,r8
lw r11,124(r14)
muli r8,r9,4
mul r8,r11,r8
muli r8,r8,3
add r10,r10,r8
sw 132(r14),r10
% done generating indice offseting
% begin var offset calculation
lw r11,132(r14)
lw r10,120(r14)
add r10,r10,r11
sw 136(r14),r10
% end var offset calculation
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
sw 140(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,40
lw r9,140(r14)
 add r10,r10,r9
sw 144(r14),r10
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy35

%set left and right ptrs
%set ptr
lw r10,144(r14)
add r10,r14,r10
lw r9,136(r14)
add r9,r14,r9
%set position counter
mul r8,r0,r0
beginCopy35
%move data via register
lw r11,0(r10)
sw 0(r9),r11
%increment registers
addi r10,r10,4
addi r9,r9,4
addi r8,r8,4
%branch out if done
subi r12,r8,4
bnz r12,beginCopy35

endCopy35
% end assignment 
% begin generating indice offseting
addi r8,r0,1
addi r12,r0,0
sw 148(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,76
lw r11,148(r14)
 add r12,r12,r11
sw 152(r14),r12
% end var offset calculation
%begin dot offsetting
lw r11,152(r14)
addi r11,r11,0
sw 156(r14),r11
%end dot offsetting
% begin intlit storeage
addi r11,r0,0
sw 160(r14), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,1
sw 164(r14), r11
% done intlit storeage
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
lw r8,164(r14)
muli r10,r11,4
mul r10,r8,r10
add r12,r12,r10
lw r8,160(r14)
muli r10,r11,4
mul r10,r8,r10
muli r10,r10,3
add r12,r12,r10
sw 168(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r8,168(r14)
lw r12,156(r14)
add r12,r12,r8
sw 172(r14),r12
% end var offset calculation
% begin generating indice offseting
addi r8,r0,1
addi r12,r0,0
sw 176(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,44
lw r11,176(r14)
 add r12,r12,r11
sw 180(r14),r12
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy36

%set left and right ptrs
%set ptr
lw r12,180(r14)
add r12,r14,r12
lw r11,172(r14)
add r11,r14,r11
%set position counter
mul r10,r0,r0
beginCopy36
%move data via register
lw r8,0(r12)
sw 0(r11),r8
%increment registers
addi r12,r12,4
addi r11,r11,4
addi r10,r10,4
%branch out if done
subi r9,r10,4
bnz r9,beginCopy36

endCopy36
% end assignment 
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
sw 184(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,76
lw r8,184(r14)
 add r9,r9,r8
sw 188(r14),r9
% end var offset calculation
%begin dot offsetting
lw r8,188(r14)
addi r8,r8,0
sw 192(r14),r8
%end dot offsetting
% begin intlit storeage
addi r8,r0,0
sw 196(r14), r8
% done intlit storeage
% begin intlit storeage
addi r8,r0,2
sw 200(r14), r8
% done intlit storeage
% begin generating indice offseting
addi r8,r0,1
addi r9,r0,0
lw r10,200(r14)
muli r12,r8,4
mul r12,r10,r12
add r9,r9,r12
lw r10,196(r14)
muli r12,r8,4
mul r12,r10,r12
muli r12,r12,3
add r9,r9,r12
sw 204(r14),r9
% done generating indice offseting
% begin var offset calculation
lw r10,204(r14)
lw r9,192(r14)
add r9,r9,r10
sw 208(r14),r9
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
sw 212(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,48
lw r8,212(r14)
 add r9,r9,r8
sw 216(r14),r9
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy37

%set left and right ptrs
%set ptr
lw r9,216(r14)
add r9,r14,r9
lw r8,208(r14)
add r8,r14,r8
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
% end assignment 
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 220(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,76
lw r10,220(r14)
 add r11,r11,r10
sw 224(r14),r11
% end var offset calculation
%begin dot offsetting
lw r10,224(r14)
addi r10,r10,0
sw 228(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,1
sw 232(r14), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,0
sw 236(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
lw r12,236(r14)
muli r9,r10,4
mul r9,r12,r9
add r11,r11,r9
lw r12,232(r14)
muli r9,r10,4
mul r9,r12,r9
muli r9,r9,3
add r11,r11,r9
sw 240(r14),r11
% done generating indice offseting
% begin var offset calculation
lw r12,240(r14)
lw r11,228(r14)
add r11,r11,r12
sw 244(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 248(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,52
lw r10,248(r14)
 add r11,r11,r10
sw 252(r14),r11
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy38

%set left and right ptrs
%set ptr
lw r11,252(r14)
add r11,r14,r11
lw r10,244(r14)
add r10,r14,r10
%set position counter
mul r9,r0,r0
beginCopy38
%move data via register
lw r12,0(r11)
sw 0(r10),r12
%increment registers
addi r11,r11,4
addi r10,r10,4
addi r9,r9,4
%branch out if done
subi r8,r9,4
bnz r8,beginCopy38

endCopy38
% end assignment 
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
sw 256(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,76
lw r12,256(r14)
 add r8,r8,r12
sw 260(r14),r8
% end var offset calculation
%begin dot offsetting
lw r12,260(r14)
addi r12,r12,0
sw 264(r14),r12
%end dot offsetting
% begin intlit storeage
addi r12,r0,1
sw 268(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,1
sw 272(r14), r12
% done intlit storeage
% begin generating indice offseting
addi r12,r0,1
addi r8,r0,0
lw r9,272(r14)
muli r11,r12,4
mul r11,r9,r11
add r8,r8,r11
lw r9,268(r14)
muli r11,r12,4
mul r11,r9,r11
muli r11,r11,3
add r8,r8,r11
sw 276(r14),r8
% done generating indice offseting
% begin var offset calculation
lw r9,276(r14)
lw r8,264(r14)
add r8,r8,r9
sw 280(r14),r8
% end var offset calculation
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
sw 284(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,56
lw r12,284(r14)
 add r8,r8,r12
sw 288(r14),r8
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy39

%set left and right ptrs
%set ptr
lw r8,288(r14)
add r8,r14,r8
lw r12,280(r14)
add r12,r14,r12
%set position counter
mul r11,r0,r0
beginCopy39
%move data via register
lw r9,0(r8)
sw 0(r12),r9
%increment registers
addi r8,r8,4
addi r12,r12,4
addi r11,r11,4
%branch out if done
subi r10,r11,4
bnz r10,beginCopy39

endCopy39
% end assignment 
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
sw 292(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,76
lw r9,292(r14)
 add r10,r10,r9
sw 296(r14),r10
% end var offset calculation
%begin dot offsetting
lw r9,296(r14)
addi r9,r9,0
sw 300(r14),r9
%end dot offsetting
% begin intlit storeage
addi r9,r0,1
sw 304(r14), r9
% done intlit storeage
% begin intlit storeage
addi r9,r0,2
sw 308(r14), r9
% done intlit storeage
% begin generating indice offseting
addi r9,r0,1
addi r10,r0,0
lw r11,308(r14)
muli r8,r9,4
mul r8,r11,r8
add r10,r10,r8
lw r11,304(r14)
muli r8,r9,4
mul r8,r11,r8
muli r8,r8,3
add r10,r10,r8
sw 312(r14),r10
% done generating indice offseting
% begin var offset calculation
lw r11,312(r14)
lw r10,300(r14)
add r10,r10,r11
sw 316(r14),r10
% end var offset calculation
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
sw 320(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,60
lw r9,320(r14)
 add r10,r10,r9
sw 324(r14),r10
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy40

%set left and right ptrs
%set ptr
lw r10,324(r14)
add r10,r14,r10
lw r9,316(r14)
add r9,r14,r9
%set position counter
mul r8,r0,r0
beginCopy40
%move data via register
lw r11,0(r10)
sw 0(r9),r11
%increment registers
addi r10,r10,4
addi r9,r9,4
addi r8,r8,4
%branch out if done
subi r12,r8,4
bnz r12,beginCopy40

endCopy40
% end assignment 
% begin generating indice offseting
addi r8,r0,1
addi r12,r0,0
sw 328(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,76
lw r11,328(r14)
 add r12,r12,r11
sw 332(r14),r12
% end var offset calculation
%begin dot offsetting
lw r11,332(r14)
addi r11,r11,0
sw 336(r14),r11
%end dot offsetting
% begin intlit storeage
addi r11,r0,2
sw 340(r14), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,0
sw 344(r14), r11
% done intlit storeage
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
lw r8,344(r14)
muli r10,r11,4
mul r10,r8,r10
add r12,r12,r10
lw r8,340(r14)
muli r10,r11,4
mul r10,r8,r10
muli r10,r10,3
add r12,r12,r10
sw 348(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r8,348(r14)
lw r12,336(r14)
add r12,r12,r8
sw 352(r14),r12
% end var offset calculation
% begin generating indice offseting
addi r8,r0,1
addi r12,r0,0
sw 356(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,64
lw r11,356(r14)
 add r12,r12,r11
sw 360(r14),r12
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy41

%set left and right ptrs
%set ptr
lw r12,360(r14)
add r12,r14,r12
lw r11,352(r14)
add r11,r14,r11
%set position counter
mul r10,r0,r0
beginCopy41
%move data via register
lw r8,0(r12)
sw 0(r11),r8
%increment registers
addi r12,r12,4
addi r11,r11,4
addi r10,r10,4
%branch out if done
subi r9,r10,4
bnz r9,beginCopy41

endCopy41
% end assignment 
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
sw 364(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,76
lw r8,364(r14)
 add r9,r9,r8
sw 368(r14),r9
% end var offset calculation
%begin dot offsetting
lw r8,368(r14)
addi r8,r8,0
sw 372(r14),r8
%end dot offsetting
% begin intlit storeage
addi r8,r0,2
sw 376(r14), r8
% done intlit storeage
% begin intlit storeage
addi r8,r0,1
sw 380(r14), r8
% done intlit storeage
% begin generating indice offseting
addi r8,r0,1
addi r9,r0,0
lw r10,380(r14)
muli r12,r8,4
mul r12,r10,r12
add r9,r9,r12
lw r10,376(r14)
muli r12,r8,4
mul r12,r10,r12
muli r12,r12,3
add r9,r9,r12
sw 384(r14),r9
% done generating indice offseting
% begin var offset calculation
lw r10,384(r14)
lw r9,372(r14)
add r9,r9,r10
sw 388(r14),r9
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
sw 392(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,68
lw r8,392(r14)
 add r9,r9,r8
sw 396(r14),r9
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy42

%set left and right ptrs
%set ptr
lw r9,396(r14)
add r9,r14,r9
lw r8,388(r14)
add r8,r14,r8
%set position counter
mul r12,r0,r0
beginCopy42
%move data via register
lw r10,0(r9)
sw 0(r8),r10
%increment registers
addi r9,r9,4
addi r8,r8,4
addi r12,r12,4
%branch out if done
subi r11,r12,4
bnz r11,beginCopy42

endCopy42
% end assignment 
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 400(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,76
lw r10,400(r14)
 add r11,r11,r10
sw 404(r14),r11
% end var offset calculation
%begin dot offsetting
lw r10,404(r14)
addi r10,r10,0
sw 408(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,2
sw 412(r14), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,2
sw 416(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
lw r12,416(r14)
muli r9,r10,4
mul r9,r12,r9
add r11,r11,r9
lw r12,412(r14)
muli r9,r10,4
mul r9,r12,r9
muli r9,r9,3
add r11,r11,r9
sw 420(r14),r11
% done generating indice offseting
% begin var offset calculation
lw r12,420(r14)
lw r11,408(r14)
add r11,r11,r12
sw 424(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 428(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,72
lw r10,428(r14)
 add r11,r11,r10
sw 432(r14),r11
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy43

%set left and right ptrs
%set ptr
lw r11,432(r14)
add r11,r14,r11
lw r10,424(r14)
add r10,r14,r10
%set position counter
mul r9,r0,r0
beginCopy43
%move data via register
lw r12,0(r11)
sw 0(r10),r12
%increment registers
addi r11,r11,4
addi r10,r10,4
addi r9,r9,4
%branch out if done
subi r8,r9,4
bnz r8,beginCopy43

endCopy43
% end assignment 
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
sw 436(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,76
lw r12,436(r14)
 add r8,r8,r12
sw 440(r14),r8
% end var offset calculation
%check if size is zero if yes, leave
addi r10,r0,36
bz r10,endCopy44

%set left and right ptrs
%set ptr
lw r8,440(r14)
add r8,r14,r8
addi r8,r8,0
%read direct value
add r12,r0,r14
addi r12,r12,0
%set position counter
mul r11,r0,r0
beginCopy44
%move data via register
lw r9,0(r8)
sw 0(r12),r9
%increment registers
addi r8,r8,4
addi r12,r12,4
addi r11,r11,4
%branch out if done
subi r10,r11,36
bnz r10,beginCopy44

endCopy44
% end copy 
lw r15,36(r14)
jr r15 
%funcdef end
%funcdef begin
fnMatrixmultiply1
sw 36(r14),r15
% begin intlit storeage
addi r11,r0,0
sw 160(r14), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,0
sw 164(r14), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,0
sw 168(r14), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,0
sw 172(r14), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,0
sw 176(r14), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,0
sw 180(r14), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,0
sw 184(r14), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,0
sw 188(r14), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,0
sw 192(r14), r11
% done intlit storeage
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy45

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,160
%read direct value
add r11,r0,r14
addi r11,r11,576
%set position counter
mul r8,r0,r0
beginCopy45
%move data via register
lw r9,0(r10)
sw 0(r11),r9
%increment registers
addi r10,r10,4
addi r11,r11,4
addi r8,r8,4
%branch out if done
subi r12,r8,4
bnz r12,beginCopy45

endCopy45
% end copy 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy46

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,164
%read direct value
add r8,r0,r14
addi r8,r8,580
%set position counter
mul r10,r0,r0
beginCopy46
%move data via register
lw r9,0(r12)
sw 0(r8),r9
%increment registers
addi r12,r12,4
addi r8,r8,4
addi r10,r10,4
%branch out if done
subi r11,r10,4
bnz r11,beginCopy46

endCopy46
% end copy 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy47

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,168
%read direct value
add r10,r0,r14
addi r10,r10,584
%set position counter
mul r12,r0,r0
beginCopy47
%move data via register
lw r9,0(r11)
sw 0(r10),r9
%increment registers
addi r11,r11,4
addi r10,r10,4
addi r12,r12,4
%branch out if done
subi r8,r12,4
bnz r8,beginCopy47

endCopy47
% end copy 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy48

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,172
%read direct value
add r12,r0,r14
addi r12,r12,588
%set position counter
mul r11,r0,r0
beginCopy48
%move data via register
lw r9,0(r8)
sw 0(r12),r9
%increment registers
addi r8,r8,4
addi r12,r12,4
addi r11,r11,4
%branch out if done
subi r10,r11,4
bnz r10,beginCopy48

endCopy48
% end copy 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy49

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,176
%read direct value
add r11,r0,r14
addi r11,r11,592
%set position counter
mul r8,r0,r0
beginCopy49
%move data via register
lw r9,0(r10)
sw 0(r11),r9
%increment registers
addi r10,r10,4
addi r11,r11,4
addi r8,r8,4
%branch out if done
subi r12,r8,4
bnz r12,beginCopy49

endCopy49
% end copy 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy50

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,180
%read direct value
add r8,r0,r14
addi r8,r8,596
%set position counter
mul r10,r0,r0
beginCopy50
%move data via register
lw r9,0(r12)
sw 0(r8),r9
%increment registers
addi r12,r12,4
addi r8,r8,4
addi r10,r10,4
%branch out if done
subi r11,r10,4
bnz r11,beginCopy50

endCopy50
% end copy 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy51

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,184
%read direct value
add r10,r0,r14
addi r10,r10,600
%set position counter
mul r12,r0,r0
beginCopy51
%move data via register
lw r9,0(r11)
sw 0(r10),r9
%increment registers
addi r11,r11,4
addi r10,r10,4
addi r12,r12,4
%branch out if done
subi r8,r12,4
bnz r8,beginCopy51

endCopy51
% end copy 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy52

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,188
%read direct value
add r12,r0,r14
addi r12,r12,604
%set position counter
mul r11,r0,r0
beginCopy52
%move data via register
lw r9,0(r8)
sw 0(r12),r9
%increment registers
addi r8,r8,4
addi r12,r12,4
addi r11,r11,4
%branch out if done
subi r10,r11,4
bnz r10,beginCopy52

endCopy52
% end copy 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy53

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,192
%read direct value
add r11,r0,r14
addi r11,r11,608
%set position counter
mul r8,r0,r0
beginCopy53
%move data via register
lw r9,0(r10)
sw 0(r11),r9
%increment registers
addi r10,r10,4
addi r11,r11,4
addi r8,r8,4
%branch out if done
subi r12,r8,4
bnz r12,beginCopy53

endCopy53
% end copy 
addi r14,r14,536
jl r15, fnMatrixconstructor1
subi r14,r14,536
%check if size is zero if yes, leave
addi r11,r0,36
bz r11,endCopy54

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,536
%read direct value
add r8,r0,r14
addi r8,r8,124
%set position counter
mul r10,r0,r0
beginCopy54
%move data via register
lw r9,0(r12)
sw 0(r8),r9
%increment registers
addi r12,r12,4
addi r8,r8,4
addi r10,r10,4
%branch out if done
subi r11,r10,36
bnz r11,beginCopy54

endCopy54
% end copy 
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
sw 196(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,112
lw r9,196(r14)
 add r11,r11,r9
sw 200(r14),r11
% end var offset calculation
% begin intlit storeage
addi r9,r0,0
sw 204(r14), r9
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy55

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,204
lw r9,200(r14)
add r9,r14,r9
%set position counter
mul r12,r0,r0
beginCopy55
%move data via register
lw r10,0(r11)
sw 0(r9),r10
%increment registers
addi r11,r11,4
addi r9,r9,4
addi r12,r12,4
%branch out if done
subi r8,r12,4
bnz r8,beginCopy55

endCopy55
% end assignment 
% begin generating indice offseting
addi r12,r0,1
addi r8,r0,0
sw 208(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,116
lw r10,208(r14)
 add r8,r8,r10
sw 212(r14),r8
% end var offset calculation
% begin intlit storeage
addi r10,r0,0
sw 216(r14), r10
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy56

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,216
lw r10,212(r14)
add r10,r14,r10
%set position counter
mul r11,r0,r0
beginCopy56
%move data via register
lw r12,0(r8)
sw 0(r10),r12
%increment registers
addi r8,r8,4
addi r10,r10,4
addi r11,r11,4
%branch out if done
subi r9,r11,4
bnz r9,beginCopy56

endCopy56
% end assignment 
% begin generating indice offseting
addi r11,r0,1
addi r9,r0,0
sw 220(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,120
lw r12,220(r14)
 add r9,r9,r12
sw 224(r14),r9
% end var offset calculation
% begin intlit storeage
addi r12,r0,0
sw 228(r14), r12
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy57

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,228
lw r12,224(r14)
add r12,r14,r12
%set position counter
mul r8,r0,r0
beginCopy57
%move data via register
lw r11,0(r9)
sw 0(r12),r11
%increment registers
addi r9,r9,4
addi r12,r12,4
addi r8,r8,4
%branch out if done
subi r10,r8,4
bnz r10,beginCopy57

endCopy57
% end assignment 
gowhile1
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
sw 232(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,112
lw r9,232(r14)
 add r11,r11,r9
sw 236(r14),r11
% end var offset calculation
% begin intlit storeage
addi r9,r0,3
sw 240(r14), r9
% done intlit storeage
% begin RELOP op 
lw r12,236(r14)
add r12,r14,r12
lw r9,0(r12)
lw r11,240(r14)
cne r10,r9,r11
sw 244(r14),r10
% end relop op 
lw r8,244(r14)
bz r8,endwhile1
% begin generating indice offseting
addi r12,r0,1
addi r10,r0,0
sw 248(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,116
lw r11,248(r14)
 add r10,r10,r11
sw 252(r14),r10
% end var offset calculation
% begin intlit storeage
addi r11,r0,0
sw 256(r14), r11
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r7,r0,4
bz r7,endCopy58

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,256
lw r11,252(r14)
add r11,r14,r11
%set position counter
mul r9,r0,r0
beginCopy58
%move data via register
lw r12,0(r10)
sw 0(r11),r12
%increment registers
addi r10,r10,4
addi r11,r11,4
addi r9,r9,4
%branch out if done
subi r7,r9,4
bnz r7,beginCopy58

endCopy58
% end assignment 
gowhile2
% begin generating indice offseting
addi r7,r0,1
addi r12,r0,0
sw 260(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,116
lw r10,260(r14)
 add r12,r12,r10
sw 264(r14),r12
% end var offset calculation
% begin intlit storeage
addi r10,r0,3
sw 268(r14), r10
% done intlit storeage
% begin RELOP op 
lw r11,264(r14)
add r11,r14,r11
lw r10,0(r11)
lw r12,268(r14)
cne r7,r10,r12
sw 272(r14),r7
% end relop op 
lw r9,272(r14)
bz r9,endwhile2
% begin generating indice offseting
addi r11,r0,1
addi r7,r0,0
sw 276(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r7,r0,120
lw r12,276(r14)
 add r7,r7,r12
sw 280(r14),r7
% end var offset calculation
% begin intlit storeage
addi r12,r0,0
sw 284(r14), r12
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r6,r0,4
bz r6,endCopy59

%set left and right ptrs
%read direct value
add r7,r0,r14
addi r7,r7,284
lw r12,280(r14)
add r12,r14,r12
%set position counter
mul r10,r0,r0
beginCopy59
%move data via register
lw r11,0(r7)
sw 0(r12),r11
%increment registers
addi r7,r7,4
addi r12,r12,4
addi r10,r10,4
%branch out if done
subi r6,r10,4
bnz r6,beginCopy59

endCopy59
% end assignment 
gowhile3
% begin generating indice offseting
addi r6,r0,1
addi r11,r0,0
sw 288(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,120
lw r7,288(r14)
 add r11,r11,r7
sw 292(r14),r11
% end var offset calculation
% begin intlit storeage
addi r7,r0,3
sw 296(r14), r7
% done intlit storeage
% begin RELOP op 
lw r12,292(r14)
add r12,r14,r12
lw r7,0(r12)
lw r11,296(r14)
cne r6,r7,r11
sw 300(r14),r6
% end relop op 
lw r10,300(r14)
bz r10,endwhile3
% begin generating indice offseting
addi r12,r0,1
addi r6,r0,0
sw 304(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r6,r0,124
lw r11,304(r14)
 add r6,r6,r11
sw 308(r14),r6
% end var offset calculation
%begin dot offsetting
lw r11,308(r14)
addi r11,r11,0
sw 312(r14),r11
%end dot offsetting
% begin generating indice offseting
addi r11,r0,1
addi r6,r0,0
sw 316(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r6,r0,112
lw r12,316(r14)
 add r6,r6,r12
sw 320(r14),r6
% end var offset calculation
% begin generating indice offseting
addi r12,r0,1
addi r6,r0,0
sw 324(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r6,r0,116
lw r11,324(r14)
 add r6,r6,r11
sw 328(r14),r6
% end var offset calculation
% begin generating indice offseting
addi r11,r0,1
addi r6,r0,0
lw r12,328(r14)
add r12,r14,r12
lw r12,0(r12)
muli r7,r11,4
mul r7,r12,r7
add r6,r6,r7
lw r12,320(r14)
add r12,r14,r12
lw r12,0(r12)
muli r7,r11,4
mul r7,r12,r7
muli r7,r7,3
add r6,r6,r7
sw 332(r14),r6
% done generating indice offseting
% begin var offset calculation
lw r12,332(r14)
lw r6,312(r14)
add r6,r6,r12
sw 336(r14),r6
% end var offset calculation
% begin generating indice offseting
sw 340(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r6,r0,40
lw r11,340(r14)
 add r6,r6,r11
sw 344(r14),r6
% end var offset calculation
%begin dot offsetting
lw r11,344(r14)
addi r11,r11,0
sw 348(r14),r11
%end dot offsetting
% begin generating indice offseting
addi r11,r0,1
addi r6,r0,0
sw 352(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r6,r0,112
lw r12,352(r14)
 add r6,r6,r12
sw 356(r14),r6
% end var offset calculation
% begin generating indice offseting
addi r12,r0,1
addi r6,r0,0
sw 360(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r6,r0,120
lw r11,360(r14)
 add r6,r6,r11
sw 364(r14),r6
% end var offset calculation
% begin generating indice offseting
addi r11,r0,1
addi r6,r0,0
lw r12,364(r14)
add r12,r14,r12
lw r12,0(r12)
muli r7,r11,4
mul r7,r12,r7
add r6,r6,r7
lw r12,356(r14)
add r12,r14,r12
lw r12,0(r12)
muli r7,r11,4
mul r7,r12,r7
muli r7,r7,3
add r6,r6,r7
sw 368(r14),r6
% done generating indice offseting
% begin var offset calculation
lw r12,368(r14)
lw r6,348(r14)
add r6,r6,r12
sw 372(r14),r6
% end var offset calculation
% begin generating indice offseting
addi r12,r0,1
addi r6,r0,0
sw 376(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r6,r0,76
lw r11,376(r14)
 add r6,r6,r11
sw 380(r14),r6
% end var offset calculation
%begin dot offsetting
lw r11,380(r14)
addi r11,r11,0
sw 384(r14),r11
%end dot offsetting
% begin generating indice offseting
addi r11,r0,1
addi r6,r0,0
sw 388(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r6,r0,120
lw r12,388(r14)
 add r6,r6,r12
sw 392(r14),r6
% end var offset calculation
% begin generating indice offseting
addi r12,r0,1
addi r6,r0,0
sw 396(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r6,r0,116
lw r11,396(r14)
 add r6,r6,r11
sw 400(r14),r6
% end var offset calculation
% begin generating indice offseting
addi r11,r0,1
addi r6,r0,0
lw r12,400(r14)
add r12,r14,r12
lw r12,0(r12)
muli r7,r11,4
mul r7,r12,r7
add r6,r6,r7
lw r12,392(r14)
add r12,r14,r12
lw r12,0(r12)
muli r7,r11,4
mul r7,r12,r7
muli r7,r7,3
add r6,r6,r7
sw 404(r14),r6
% done generating indice offseting
% begin var offset calculation
lw r12,404(r14)
lw r6,384(r14)
add r6,r6,r12
sw 408(r14),r6
% end var offset calculation
% begin mult op 
lw r7,372(r14)
add r7,r14,r7
lw r12,0(r7)
lw r7,408(r14)
add r7,r14,r7
lw r6,0(r7)
mul r11,r12,r6
sw 412(r14),r11
% end mult op 
% begin generating indice offseting
addi r7,r0,1
addi r11,r0,0
sw 416(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,124
lw r6,416(r14)
 add r11,r11,r6
sw 420(r14),r11
% end var offset calculation
%begin dot offsetting
lw r6,420(r14)
addi r6,r6,0
sw 424(r14),r6
%end dot offsetting
% begin generating indice offseting
addi r6,r0,1
addi r11,r0,0
sw 428(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,112
lw r7,428(r14)
 add r11,r11,r7
sw 432(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r7,r0,1
addi r11,r0,0
sw 436(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,116
lw r6,436(r14)
 add r11,r11,r6
sw 440(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r6,r0,1
addi r11,r0,0
lw r7,440(r14)
add r7,r14,r7
lw r7,0(r7)
muli r12,r6,4
mul r12,r7,r12
add r11,r11,r12
lw r7,432(r14)
add r7,r14,r7
lw r7,0(r7)
muli r12,r6,4
mul r12,r7,r12
muli r12,r12,3
add r11,r11,r12
sw 444(r14),r11
% done generating indice offseting
% begin var offset calculation
lw r7,444(r14)
lw r11,424(r14)
add r11,r11,r7
sw 448(r14),r11
% end var offset calculation
% begin add op 
lw r7,412(r14)
lw r12,448(r14)
add r12,r14,r12
lw r11,0(r12)
add r6,r7,r11
sw 452(r14),r6
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r5,r0,4
bz r5,endCopy60

%set left and right ptrs
%read direct value
add r6,r0,r14
addi r6,r6,452
lw r12,336(r14)
add r12,r14,r12
%set position counter
mul r7,r0,r0
beginCopy60
%move data via register
lw r11,0(r6)
sw 0(r12),r11
%increment registers
addi r6,r6,4
addi r12,r12,4
addi r7,r7,4
%branch out if done
subi r5,r7,4
bnz r5,beginCopy60

endCopy60
% end assignment 
% begin generating indice offseting
addi r7,r0,1
addi r5,r0,0
sw 456(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r5,r0,120
lw r11,456(r14)
 add r5,r5,r11
sw 460(r14),r5
% end var offset calculation
% begin generating indice offseting
addi r11,r0,1
addi r5,r0,0
sw 464(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r5,r0,120
lw r7,464(r14)
 add r5,r5,r7
sw 468(r14),r5
% end var offset calculation
% begin intlit storeage
addi r7,r0,1
sw 472(r14), r7
% done intlit storeage
% begin add op 
lw r6,468(r14)
add r6,r14,r6
lw r7,0(r6)
lw r5,472(r14)
add r11,r7,r5
sw 476(r14),r11
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy61

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,476
lw r6,460(r14)
add r6,r14,r6
%set position counter
mul r7,r0,r0
beginCopy61
%move data via register
lw r5,0(r11)
sw 0(r6),r5
%increment registers
addi r11,r11,4
addi r6,r6,4
addi r7,r7,4
%branch out if done
subi r12,r7,4
bnz r12,beginCopy61

endCopy61
% end assignment 
j gowhile3
endwhile3
% begin generating indice offseting
addi r10,r0,1
addi r7,r0,0
sw 480(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r7,r0,116
lw r12,480(r14)
 add r7,r7,r12
sw 484(r14),r7
% end var offset calculation
% begin generating indice offseting
addi r12,r0,1
addi r7,r0,0
sw 488(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r7,r0,116
lw r10,488(r14)
 add r7,r7,r10
sw 492(r14),r7
% end var offset calculation
% begin intlit storeage
addi r10,r0,1
sw 496(r14), r10
% done intlit storeage
% begin add op 
lw r5,492(r14)
add r5,r14,r5
lw r10,0(r5)
lw r7,496(r14)
add r12,r10,r7
sw 500(r14),r12
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy62

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,500
lw r5,484(r14)
add r5,r14,r5
%set position counter
mul r10,r0,r0
beginCopy62
%move data via register
lw r7,0(r12)
sw 0(r5),r7
%increment registers
addi r12,r12,4
addi r5,r5,4
addi r10,r10,4
%branch out if done
subi r11,r10,4
bnz r11,beginCopy62

endCopy62
% end assignment 
j gowhile2
endwhile2
% begin generating indice offseting
addi r9,r0,1
addi r10,r0,0
sw 504(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,112
lw r11,504(r14)
 add r10,r10,r11
sw 508(r14),r10
% end var offset calculation
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
sw 512(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,112
lw r9,512(r14)
 add r10,r10,r9
sw 516(r14),r10
% end var offset calculation
% begin intlit storeage
addi r9,r0,1
sw 520(r14), r9
% done intlit storeage
% begin add op 
lw r7,516(r14)
add r7,r14,r7
lw r9,0(r7)
lw r10,520(r14)
add r11,r9,r10
sw 524(r14),r11
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy63

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,524
lw r7,508(r14)
add r7,r14,r7
%set position counter
mul r9,r0,r0
beginCopy63
%move data via register
lw r10,0(r11)
sw 0(r7),r10
%increment registers
addi r11,r11,4
addi r7,r7,4
addi r9,r9,4
%branch out if done
subi r12,r9,4
bnz r12,beginCopy63

endCopy63
% end assignment 
j gowhile1
endwhile1
% begin generating indice offseting
addi r8,r0,1
addi r9,r0,0
sw 528(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,124
lw r12,528(r14)
 add r9,r9,r12
sw 532(r14),r9
% end var offset calculation
%check if size is zero if yes, leave
addi r11,r0,36
bz r11,endCopy64

%set left and right ptrs
%set ptr
lw r9,532(r14)
add r9,r14,r9
addi r9,r9,0
%read direct value
add r12,r0,r14
addi r12,r12,0
%set position counter
mul r10,r0,r0
beginCopy64
%move data via register
lw r8,0(r9)
sw 0(r12),r8
%increment registers
addi r9,r9,4
addi r12,r12,4
addi r10,r10,4
%branch out if done
subi r11,r10,36
bnz r11,beginCopy64

endCopy64
% end copy 
lw r15,36(r14)
jr r15 
%funcdef end
%funcdef begin
fnMatrixprint1
sw 0(r14),r15
% begin generating indice offseting
sw 48(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r8,48(r14)
 add r11,r11,r8
sw 52(r14),r11
% end var offset calculation
%begin dot offsetting
lw r8,52(r14)
addi r8,r8,0
sw 56(r14),r8
%end dot offsetting
%check if size is zero if yes, leave
addi r12,r0,36
bz r12,endCopy65

%set left and right ptrs
%set ptr
lw r11,56(r14)
add r11,r14,r11
addi r11,r11,0
%read direct value
add r8,r0,r14
addi r8,r8,216
%set position counter
mul r9,r0,r0
beginCopy65
%move data via register
lw r10,0(r11)
sw 0(r8),r10
%increment registers
addi r11,r11,4
addi r8,r8,4
addi r9,r9,4
%branch out if done
subi r12,r9,36
bnz r12,beginCopy65

endCopy65
% end copy 
addi r14,r14,212
jl r15, fnMatrixTestSelf1
subi r14,r14,212
%check if size is zero if yes, leave
addi r8,r0,0
bz r8,endCopy66

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,212
%read direct value
add r9,r0,r14
addi r9,r9,60
%set position counter
mul r11,r0,r0
beginCopy66
%move data via register
lw r10,0(r12)
sw 0(r9),r10
%increment registers
addi r12,r12,4
addi r9,r9,4
addi r11,r11,4
%branch out if done
subi r8,r11,0
bnz r8,beginCopy66

endCopy66
% end copy 
%begin copy back object
%check if size is zero if yes, leave
addi r9,r0,36
bz r9,endCopy67

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,216
%set ptr
lw r11,56(r14)
add r11,r14,r11
addi r11,r11,0
%set position counter
mul r12,r0,r0
beginCopy67
%move data via register
lw r10,0(r8)
sw 0(r11),r10
%increment registers
addi r8,r8,4
addi r11,r11,4
addi r12,r12,4
%branch out if done
subi r9,r12,36
bnz r9,beginCopy67

endCopy67
% end copy 
% begin generating indice offseting
addi r12,r0,1
addi r9,r0,0
sw 60(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,40
lw r10,60(r14)
 add r9,r9,r10
sw 64(r14),r9
% end var offset calculation
% begin intlit storeage
addi r10,r0,0
sw 68(r14), r10
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy68

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,68
lw r10,64(r14)
add r10,r14,r10
%set position counter
mul r8,r0,r0
beginCopy68
%move data via register
lw r12,0(r9)
sw 0(r10),r12
%increment registers
addi r9,r9,4
addi r10,r10,4
addi r8,r8,4
%branch out if done
subi r11,r8,4
bnz r11,beginCopy68

endCopy68
% end assignment 
% begin generating indice offseting
addi r8,r0,1
addi r11,r0,0
sw 72(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,44
lw r12,72(r14)
 add r11,r11,r12
sw 76(r14),r11
% end var offset calculation
% begin intlit storeage
addi r12,r0,0
sw 80(r14), r12
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy69

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,80
lw r12,76(r14)
add r12,r14,r12
%set position counter
mul r9,r0,r0
beginCopy69
%move data via register
lw r8,0(r11)
sw 0(r12),r8
%increment registers
addi r11,r11,4
addi r12,r12,4
addi r9,r9,4
%branch out if done
subi r10,r9,4
bnz r10,beginCopy69

endCopy69
% end assignment 
gowhile4
% begin generating indice offseting
addi r10,r0,1
addi r8,r0,0
sw 84(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,40
lw r11,84(r14)
 add r8,r8,r11
sw 88(r14),r8
% end var offset calculation
% begin intlit storeage
addi r11,r0,3
sw 92(r14), r11
% done intlit storeage
% begin RELOP op 
lw r12,88(r14)
add r12,r14,r12
lw r11,0(r12)
lw r8,92(r14)
cne r10,r11,r8
sw 96(r14),r10
% end relop op 
lw r9,96(r14)
bz r9,endwhile4
% begin generating indice offseting
addi r12,r0,1
addi r10,r0,0
sw 100(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,44
lw r8,100(r14)
 add r10,r10,r8
sw 104(r14),r10
% end var offset calculation
% begin intlit storeage
addi r8,r0,0
sw 108(r14), r8
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r7,r0,4
bz r7,endCopy70

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,108
lw r8,104(r14)
add r8,r14,r8
%set position counter
mul r11,r0,r0
beginCopy70
%move data via register
lw r12,0(r10)
sw 0(r8),r12
%increment registers
addi r10,r10,4
addi r8,r8,4
addi r11,r11,4
%branch out if done
subi r7,r11,4
bnz r7,beginCopy70

endCopy70
% end assignment 
gowhile5
% begin generating indice offseting
addi r7,r0,1
addi r12,r0,0
sw 112(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,44
lw r10,112(r14)
 add r12,r12,r10
sw 116(r14),r12
% end var offset calculation
% begin intlit storeage
addi r10,r0,3
sw 120(r14), r10
% done intlit storeage
% begin RELOP op 
lw r8,116(r14)
add r8,r14,r8
lw r10,0(r8)
lw r12,120(r14)
cne r7,r10,r12
sw 124(r14),r7
% end relop op 
lw r11,124(r14)
bz r11,endwhile5
% begin generating indice offseting
sw 128(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r7,r0,4
lw r12,128(r14)
 add r7,r7,r12
sw 132(r14),r7
% end var offset calculation
%begin dot offsetting
lw r12,132(r14)
addi r12,r12,0
sw 136(r14),r12
%end dot offsetting
% begin generating indice offseting
addi r12,r0,1
addi r7,r0,0
sw 140(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r7,r0,40
lw r8,140(r14)
 add r7,r7,r8
sw 144(r14),r7
% end var offset calculation
% begin generating indice offseting
addi r8,r0,1
addi r7,r0,0
sw 148(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r7,r0,44
lw r12,148(r14)
 add r7,r7,r12
sw 152(r14),r7
% end var offset calculation
% begin generating indice offseting
addi r12,r0,1
addi r7,r0,0
lw r8,152(r14)
add r8,r14,r8
lw r8,0(r8)
muli r10,r12,4
mul r10,r8,r10
add r7,r7,r10
lw r8,144(r14)
add r8,r14,r8
lw r8,0(r8)
muli r10,r12,4
mul r10,r8,r10
muli r10,r10,3
add r7,r7,r10
sw 156(r14),r7
% done generating indice offseting
% begin var offset calculation
lw r8,156(r14)
lw r7,136(r14)
add r7,r7,r8
sw 160(r14),r7
% end var offset calculation
% begin write 
lw r8,160(r14)
add r8,r14,r8
lw r8,0(r8)
%s move ptr to prevent mem corruption
addi r14,r14,292
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
addi r14,r14,-292
% end write
% begin generating indice offseting
addi r8,r0,1
addi r7,r0,0
sw 164(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r7,r0,44
lw r12,164(r14)
 add r7,r7,r12
sw 168(r14),r7
% end var offset calculation
% begin generating indice offseting
addi r12,r0,1
addi r7,r0,0
sw 172(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r7,r0,44
lw r8,172(r14)
 add r7,r7,r8
sw 176(r14),r7
% end var offset calculation
% begin intlit storeage
addi r8,r0,1
sw 180(r14), r8
% done intlit storeage
% begin add op 
lw r10,176(r14)
add r10,r14,r10
lw r8,0(r10)
lw r7,180(r14)
add r12,r8,r7
sw 184(r14),r12
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r5,r0,4
bz r5,endCopy71

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,184
lw r10,168(r14)
add r10,r14,r10
%set position counter
mul r8,r0,r0
beginCopy71
%move data via register
lw r7,0(r12)
sw 0(r10),r7
%increment registers
addi r12,r12,4
addi r10,r10,4
addi r8,r8,4
%branch out if done
subi r5,r8,4
bnz r5,beginCopy71

endCopy71
% end assignment 
j gowhile5
endwhile5
% begin generating indice offseting
addi r11,r0,1
addi r8,r0,0
sw 188(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,40
lw r5,188(r14)
 add r8,r8,r5
sw 192(r14),r8
% end var offset calculation
% begin generating indice offseting
addi r5,r0,1
addi r8,r0,0
sw 196(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,40
lw r11,196(r14)
 add r8,r8,r11
sw 200(r14),r8
% end var offset calculation
% begin intlit storeage
addi r11,r0,1
sw 204(r14), r11
% done intlit storeage
% begin add op 
lw r7,200(r14)
add r7,r14,r7
lw r11,0(r7)
lw r8,204(r14)
add r5,r11,r8
sw 208(r14),r5
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy72

%set left and right ptrs
%read direct value
add r5,r0,r14
addi r5,r5,208
lw r7,192(r14)
add r7,r14,r7
%set position counter
mul r11,r0,r0
beginCopy72
%move data via register
lw r8,0(r5)
sw 0(r7),r8
%increment registers
addi r5,r5,4
addi r7,r7,4
addi r11,r11,4
%branch out if done
subi r12,r11,4
bnz r12,beginCopy72

endCopy72
% end assignment 
j gowhile4
endwhile4
lw r15,0(r14)
jr r15 
%funcdef end
%funcdef begin
fnMatrixTestSelf1
sw 0(r14),r15
% begin intlit storeage
addi r9,r0,462
sw 40(r14), r9
% done intlit storeage
% begin write 
lw r9,40(r14)
%s move ptr to prevent mem corruption
addi r14,r14,124
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
addi r14,r14,-124
% end write
lw r15,0(r14)
jr r15 
%funcdef end
