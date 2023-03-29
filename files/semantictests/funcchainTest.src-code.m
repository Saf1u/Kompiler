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
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
sw 24(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r12,24(r14)
 add r11,r11,r12
sw 28(r14),r11
% end var offset calculation
%begin dot offsetting
lw r12,28(r14)
addi r12,r12,0
sw 32(r14),r12
%end dot offsetting
%check if size is zero if yes, leave
addi r8,r0,0
bz r8,endCopy1

%set left and right ptrs
%set ptr
lw r11,32(r14)
add r11,r14,r11
addi r11,r11,0
%read direct value
add r12,r0,r14
addi r12,r12,368
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
addi r14,r14,364
jl r15, fnmanleg1
subi r14,r14,364
%check if size is zero if yes, leave
addi r12,r0,0
bz r12,endCopy2

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,364
%read direct value
add r9,r0,r14
addi r9,r9,36
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
addi r12,r12,368
%set ptr
lw r11,32(r14)
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
addi r8,r0,36
addi r8,r8,0
sw 36(r14),r8
%check if size is zero if yes, leave
addi r7,r0,0
bz r7,endCopy4

%set left and right ptrs
%set ptr
lw r10,36(r14)
add r10,r14,r10
addi r10,r10,0
%read direct value
add r9,r0,r14
addi r9,r9,392
%set position counter
mul r11,r0,r0
beginCopy4
%move data via register
lw r12,0(r10)
sw 0(r9),r12
%increment registers
addi r10,r10,4
addi r9,r9,4
addi r11,r11,4
%branch out if done
subi r7,r11,0
bnz r7,beginCopy4

endCopy4
% end copy 
addi r14,r14,364
jl r15, fnlegendwar1
subi r14,r14,364
%check if size is zero if yes, leave
addi r9,r0,24
bz r9,endCopy5

%set left and right ptrs
%read direct value
add r7,r0,r14
addi r7,r7,364
%read direct value
add r11,r0,r14
addi r11,r11,40
%set position counter
mul r10,r0,r0
beginCopy5
%move data via register
lw r12,0(r7)
sw 0(r11),r12
%increment registers
addi r7,r7,4
addi r11,r11,4
addi r10,r10,4
%branch out if done
subi r9,r10,24
bnz r9,beginCopy5

endCopy5
% end copy 
%begin copy back object
%check if size is zero if yes, leave
addi r11,r0,0
bz r11,endCopy6

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,392
%set ptr
lw r10,36(r14)
add r10,r14,r10
addi r10,r10,0
%set position counter
mul r7,r0,r0
beginCopy6
%move data via register
lw r12,0(r9)
sw 0(r10),r12
%increment registers
addi r9,r9,4
addi r10,r10,4
addi r7,r7,4
%branch out if done
subi r11,r7,0
bnz r11,beginCopy6

endCopy6
% end copy 
addi r7,r0,40
addi r7,r7,0
sw 64(r14),r7
% begin intlit storeage
addi r11,r0,0
sw 68(r14), r11
% done intlit storeage
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
lw r9,68(r14)
muli r10,r11,4
mul r10,r9,r10
add r12,r12,r10
sw 72(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r9,72(r14)
lw r12,64(r14)
add r12,r12,r9
sw 76(r14),r12
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r6,r0,4
bz r6,endCopy7

%set left and right ptrs
%set ptr
lw r12,76(r14)
add r12,r14,r12
lw r9,20(r14)
add r9,r14,r9
%set position counter
mul r10,r0,r0
beginCopy7
%move data via register
lw r11,0(r12)
sw 0(r9),r11
%increment registers
addi r12,r12,4
addi r9,r9,4
addi r10,r10,4
%branch out if done
subi r6,r10,4
bnz r6,beginCopy7

endCopy7
% end assignment 
% begin generating indice offseting
addi r10,r0,1
addi r6,r0,0
sw 80(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r6,r0,8
lw r11,80(r14)
 add r6,r6,r11
sw 84(r14),r6
% end var offset calculation
% begin generating indice offseting
addi r11,r0,1
addi r6,r0,0
sw 88(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r6,r0,4
lw r10,88(r14)
 add r6,r6,r10
sw 92(r14),r6
% end var offset calculation
%begin dot offsetting
lw r10,92(r14)
addi r10,r10,0
sw 96(r14),r10
%end dot offsetting
%check if size is zero if yes, leave
addi r9,r0,0
bz r9,endCopy8

%set left and right ptrs
%set ptr
lw r6,96(r14)
add r6,r14,r6
addi r6,r6,0
%read direct value
add r10,r0,r14
addi r10,r10,368
%set position counter
mul r12,r0,r0
beginCopy8
%move data via register
lw r11,0(r6)
sw 0(r10),r11
%increment registers
addi r6,r6,4
addi r10,r10,4
addi r12,r12,4
%branch out if done
subi r9,r12,0
bnz r9,beginCopy8

endCopy8
% end copy 
addi r14,r14,364
jl r15, fnmanleg1
subi r14,r14,364
%check if size is zero if yes, leave
addi r10,r0,0
bz r10,endCopy9

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,364
%read direct value
add r12,r0,r14
addi r12,r12,100
%set position counter
mul r6,r0,r0
beginCopy9
%move data via register
lw r11,0(r9)
sw 0(r12),r11
%increment registers
addi r9,r9,4
addi r12,r12,4
addi r6,r6,4
%branch out if done
subi r10,r6,0
bnz r10,beginCopy9

endCopy9
% end copy 
%begin copy back object
%check if size is zero if yes, leave
addi r12,r0,0
bz r12,endCopy10

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,368
%set ptr
lw r6,96(r14)
add r6,r14,r6
addi r6,r6,0
%set position counter
mul r9,r0,r0
beginCopy10
%move data via register
lw r11,0(r10)
sw 0(r6),r11
%increment registers
addi r10,r10,4
addi r6,r6,4
addi r9,r9,4
%branch out if done
subi r12,r9,0
bnz r12,beginCopy10

endCopy10
% end copy 
addi r9,r0,100
addi r9,r9,0
sw 100(r14),r9
%check if size is zero if yes, leave
addi r5,r0,0
bz r5,endCopy11

%set left and right ptrs
%set ptr
lw r11,100(r14)
add r11,r14,r11
addi r11,r11,0
%read direct value
add r12,r0,r14
addi r12,r12,392
%set position counter
mul r6,r0,r0
beginCopy11
%move data via register
lw r10,0(r11)
sw 0(r12),r10
%increment registers
addi r11,r11,4
addi r12,r12,4
addi r6,r6,4
%branch out if done
subi r5,r6,0
bnz r5,beginCopy11

endCopy11
% end copy 
addi r14,r14,364
jl r15, fnlegendwar1
subi r14,r14,364
%check if size is zero if yes, leave
addi r12,r0,24
bz r12,endCopy12

%set left and right ptrs
%read direct value
add r5,r0,r14
addi r5,r5,364
%read direct value
add r6,r0,r14
addi r6,r6,104
%set position counter
mul r11,r0,r0
beginCopy12
%move data via register
lw r10,0(r5)
sw 0(r6),r10
%increment registers
addi r5,r5,4
addi r6,r6,4
addi r11,r11,4
%branch out if done
subi r12,r11,24
bnz r12,beginCopy12

endCopy12
% end copy 
%begin copy back object
%check if size is zero if yes, leave
addi r6,r0,0
bz r6,endCopy13

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,392
%set ptr
lw r11,100(r14)
add r11,r14,r11
addi r11,r11,0
%set position counter
mul r5,r0,r0
beginCopy13
%move data via register
lw r10,0(r12)
sw 0(r11),r10
%increment registers
addi r12,r12,4
addi r11,r11,4
addi r5,r5,4
%branch out if done
subi r6,r5,0
bnz r6,beginCopy13

endCopy13
% end copy 
addi r5,r0,104
addi r5,r5,0
sw 128(r14),r5
% begin intlit storeage
addi r6,r0,1
sw 132(r14), r6
% done intlit storeage
% begin generating indice offseting
addi r6,r0,1
addi r10,r0,0
lw r12,132(r14)
muli r11,r6,4
mul r11,r12,r11
add r10,r10,r11
sw 136(r14),r10
% done generating indice offseting
% begin var offset calculation
lw r12,136(r14)
lw r10,128(r14)
add r10,r10,r12
sw 140(r14),r10
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r4,r0,4
bz r4,endCopy14

%set left and right ptrs
%set ptr
lw r10,140(r14)
add r10,r14,r10
lw r12,84(r14)
add r12,r14,r12
%set position counter
mul r11,r0,r0
beginCopy14
%move data via register
lw r6,0(r10)
sw 0(r12),r6
%increment registers
addi r10,r10,4
addi r12,r12,4
addi r11,r11,4
%branch out if done
subi r4,r11,4
bnz r4,beginCopy14

endCopy14
% end assignment 
% begin generating indice offseting
addi r11,r0,1
addi r4,r0,0
sw 144(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r4,r0,12
lw r6,144(r14)
 add r4,r4,r6
sw 148(r14),r4
% end var offset calculation
% begin generating indice offseting
addi r6,r0,1
addi r4,r0,0
sw 152(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r4,r0,4
lw r11,152(r14)
 add r4,r4,r11
sw 156(r14),r4
% end var offset calculation
%begin dot offsetting
lw r11,156(r14)
addi r11,r11,0
sw 160(r14),r11
%end dot offsetting
%check if size is zero if yes, leave
addi r12,r0,0
bz r12,endCopy15

%set left and right ptrs
%set ptr
lw r4,160(r14)
add r4,r14,r4
addi r4,r4,0
%read direct value
add r11,r0,r14
addi r11,r11,368
%set position counter
mul r10,r0,r0
beginCopy15
%move data via register
lw r6,0(r4)
sw 0(r11),r6
%increment registers
addi r4,r4,4
addi r11,r11,4
addi r10,r10,4
%branch out if done
subi r12,r10,0
bnz r12,beginCopy15

endCopy15
% end copy 
addi r14,r14,364
jl r15, fnmanleg1
subi r14,r14,364
%check if size is zero if yes, leave
addi r11,r0,0
bz r11,endCopy16

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,364
%read direct value
add r10,r0,r14
addi r10,r10,164
%set position counter
mul r4,r0,r0
beginCopy16
%move data via register
lw r6,0(r12)
sw 0(r10),r6
%increment registers
addi r12,r12,4
addi r10,r10,4
addi r4,r4,4
%branch out if done
subi r11,r4,0
bnz r11,beginCopy16

endCopy16
% end copy 
%begin copy back object
%check if size is zero if yes, leave
addi r10,r0,0
bz r10,endCopy17

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,368
%set ptr
lw r4,160(r14)
add r4,r14,r4
addi r4,r4,0
%set position counter
mul r12,r0,r0
beginCopy17
%move data via register
lw r6,0(r11)
sw 0(r4),r6
%increment registers
addi r11,r11,4
addi r4,r4,4
addi r12,r12,4
%branch out if done
subi r10,r12,0
bnz r10,beginCopy17

endCopy17
% end copy 
addi r12,r0,164
addi r12,r12,0
sw 164(r14),r12
%check if size is zero if yes, leave
addi r3,r0,0
bz r3,endCopy18

%set left and right ptrs
%set ptr
lw r6,164(r14)
add r6,r14,r6
addi r6,r6,0
%read direct value
add r10,r0,r14
addi r10,r10,392
%set position counter
mul r4,r0,r0
beginCopy18
%move data via register
lw r11,0(r6)
sw 0(r10),r11
%increment registers
addi r6,r6,4
addi r10,r10,4
addi r4,r4,4
%branch out if done
subi r3,r4,0
bnz r3,beginCopy18

endCopy18
% end copy 
addi r14,r14,364
jl r15, fnlegendwar1
subi r14,r14,364
%check if size is zero if yes, leave
addi r10,r0,24
bz r10,endCopy19

%set left and right ptrs
%read direct value
add r3,r0,r14
addi r3,r3,364
%read direct value
add r4,r0,r14
addi r4,r4,168
%set position counter
mul r6,r0,r0
beginCopy19
%move data via register
lw r11,0(r3)
sw 0(r4),r11
%increment registers
addi r3,r3,4
addi r4,r4,4
addi r6,r6,4
%branch out if done
subi r10,r6,24
bnz r10,beginCopy19

endCopy19
% end copy 
%begin copy back object
%check if size is zero if yes, leave
addi r4,r0,0
bz r4,endCopy20

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,392
%set ptr
lw r6,164(r14)
add r6,r14,r6
addi r6,r6,0
%set position counter
mul r3,r0,r0
beginCopy20
%move data via register
lw r11,0(r10)
sw 0(r6),r11
%increment registers
addi r10,r10,4
addi r6,r6,4
addi r3,r3,4
%branch out if done
subi r4,r3,0
bnz r4,beginCopy20

endCopy20
% end copy 
addi r3,r0,168
addi r3,r3,0
sw 192(r14),r3
% begin intlit storeage
addi r4,r0,2
sw 196(r14), r4
% done intlit storeage
% begin generating indice offseting
addi r4,r0,1
addi r11,r0,0
lw r10,196(r14)
muli r6,r4,4
mul r6,r10,r6
add r11,r11,r6
sw 200(r14),r11
% done generating indice offseting
% begin var offset calculation
lw r10,200(r14)
lw r11,192(r14)
add r11,r11,r10
sw 204(r14),r11
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r2,r0,4
bz r2,endCopy21

%set left and right ptrs
%set ptr
lw r11,204(r14)
add r11,r14,r11
lw r10,148(r14)
add r10,r14,r10
%set position counter
mul r6,r0,r0
beginCopy21
%move data via register
lw r4,0(r11)
sw 0(r10),r4
%increment registers
addi r11,r11,4
addi r10,r10,4
addi r6,r6,4
%branch out if done
subi r2,r6,4
bnz r2,beginCopy21

endCopy21
% end assignment 
% begin generating indice offseting
addi r6,r0,1
addi r2,r0,0
sw 208(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r2,r0,4
lw r4,208(r14)
 add r2,r2,r4
sw 212(r14),r2
% end var offset calculation
%begin dot offsetting
lw r4,212(r14)
addi r4,r4,0
sw 216(r14),r4
%end dot offsetting
% begin generating indice offseting
addi r4,r0,1
addi r2,r0,0
sw 220(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r6,220(r14)
lw r2,216(r14)
add r2,r2,r6
sw 224(r14),r2
% end var offset calculation
% begin intlit storeage
addi r6,r0,22
sw 228(r14), r6
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy22

%set left and right ptrs
%read direct value
add r2,r0,r14
addi r2,r2,228
lw r6,224(r14)
add r6,r14,r6
%set position counter
mul r11,r0,r0
beginCopy22
%move data via register
lw r4,0(r2)
sw 0(r6),r4
%increment registers
addi r2,r2,4
addi r6,r6,4
addi r11,r11,4
%branch out if done
subi r10,r11,4
bnz r10,beginCopy22

endCopy22
% end assignment 
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
sw 232(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,8
lw r4,232(r14)
 add r10,r10,r4
sw 236(r14),r10
% end var offset calculation
%begin dot offsetting
lw r4,236(r14)
addi r4,r4,0
sw 240(r14),r4
%end dot offsetting
% begin generating indice offseting
addi r4,r0,1
addi r10,r0,0
sw 244(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r11,244(r14)
lw r10,240(r14)
add r10,r10,r11
sw 248(r14),r10
% end var offset calculation
% begin intlit storeage
addi r11,r0,42
sw 252(r14), r11
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r6,r0,4
bz r6,endCopy23

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,252
lw r11,248(r14)
add r11,r14,r11
%set position counter
mul r2,r0,r0
beginCopy23
%move data via register
lw r4,0(r10)
sw 0(r11),r4
%increment registers
addi r10,r10,4
addi r11,r11,4
addi r2,r2,4
%branch out if done
subi r6,r2,4
bnz r6,beginCopy23

endCopy23
% end assignment 
% begin generating indice offseting
addi r2,r0,1
addi r6,r0,0
sw 256(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r6,r0,12
lw r4,256(r14)
 add r6,r6,r4
sw 260(r14),r6
% end var offset calculation
%begin dot offsetting
lw r4,260(r14)
addi r4,r4,0
sw 264(r14),r4
%end dot offsetting
% begin generating indice offseting
addi r4,r0,1
addi r6,r0,0
sw 268(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r2,268(r14)
lw r6,264(r14)
add r6,r6,r2
sw 272(r14),r6
% end var offset calculation
% begin intlit storeage
addi r2,r0,32
sw 276(r14), r2
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy24

%set left and right ptrs
%read direct value
add r6,r0,r14
addi r6,r6,276
lw r2,272(r14)
add r2,r14,r2
%set position counter
mul r10,r0,r0
beginCopy24
%move data via register
lw r4,0(r6)
sw 0(r2),r4
%increment registers
addi r6,r6,4
addi r2,r2,4
addi r10,r10,4
%branch out if done
subi r11,r10,4
bnz r11,beginCopy24

endCopy24
% end assignment 
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
sw 280(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r4,280(r14)
 add r11,r11,r4
sw 284(r14),r11
% end var offset calculation
%begin dot offsetting
lw r4,284(r14)
addi r4,r4,0
sw 288(r14),r4
%end dot offsetting
%check if size is zero if yes, leave
addi r2,r0,4
bz r2,endCopy25

%set left and right ptrs
%set ptr
lw r11,288(r14)
add r11,r14,r11
addi r11,r11,0
%read direct value
add r4,r0,r14
addi r4,r4,368
%set position counter
mul r6,r0,r0
beginCopy25
%move data via register
lw r10,0(r11)
sw 0(r4),r10
%increment registers
addi r11,r11,4
addi r4,r4,4
addi r6,r6,4
%branch out if done
subi r2,r6,4
bnz r2,beginCopy25

endCopy25
% end copy 
addi r14,r14,364
jl r15, fnweaponincPower1
subi r14,r14,364
%check if size is zero if yes, leave
addi r4,r0,0
bz r4,endCopy26

%set left and right ptrs
%read direct value
add r2,r0,r14
addi r2,r2,364
%read direct value
add r6,r0,r14
addi r6,r6,292
%set position counter
mul r11,r0,r0
beginCopy26
%move data via register
lw r10,0(r2)
sw 0(r6),r10
%increment registers
addi r2,r2,4
addi r6,r6,4
addi r11,r11,4
%branch out if done
subi r4,r11,0
bnz r4,beginCopy26

endCopy26
% end copy 
%begin copy back object
%check if size is zero if yes, leave
addi r6,r0,4
bz r6,endCopy27

%set left and right ptrs
%read direct value
add r4,r0,r14
addi r4,r4,368
%set ptr
lw r11,288(r14)
add r11,r14,r11
addi r11,r11,0
%set position counter
mul r2,r0,r0
beginCopy27
%move data via register
lw r10,0(r4)
sw 0(r11),r10
%increment registers
addi r4,r4,4
addi r11,r11,4
addi r2,r2,4
%branch out if done
subi r6,r2,4
bnz r6,beginCopy27

endCopy27
% end copy 
% begin generating indice offseting
addi r2,r0,1
addi r6,r0,0
sw 292(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r6,r0,8
lw r10,292(r14)
 add r6,r6,r10
sw 296(r14),r6
% end var offset calculation
%begin dot offsetting
lw r10,296(r14)
addi r10,r10,0
sw 300(r14),r10
%end dot offsetting
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy28

%set left and right ptrs
%set ptr
lw r6,300(r14)
add r6,r14,r6
addi r6,r6,0
%read direct value
add r10,r0,r14
addi r10,r10,368
%set position counter
mul r4,r0,r0
beginCopy28
%move data via register
lw r2,0(r6)
sw 0(r10),r2
%increment registers
addi r6,r6,4
addi r10,r10,4
addi r4,r4,4
%branch out if done
subi r11,r4,4
bnz r11,beginCopy28

endCopy28
% end copy 
addi r14,r14,364
jl r15, fnweaponincPower1
subi r14,r14,364
%check if size is zero if yes, leave
addi r10,r0,0
bz r10,endCopy29

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,364
%read direct value
add r4,r0,r14
addi r4,r4,304
%set position counter
mul r6,r0,r0
beginCopy29
%move data via register
lw r2,0(r11)
sw 0(r4),r2
%increment registers
addi r11,r11,4
addi r4,r4,4
addi r6,r6,4
%branch out if done
subi r10,r6,0
bnz r10,beginCopy29

endCopy29
% end copy 
%begin copy back object
%check if size is zero if yes, leave
addi r4,r0,4
bz r4,endCopy30

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,368
%set ptr
lw r6,300(r14)
add r6,r14,r6
addi r6,r6,0
%set position counter
mul r11,r0,r0
beginCopy30
%move data via register
lw r2,0(r10)
sw 0(r6),r2
%increment registers
addi r10,r10,4
addi r6,r6,4
addi r11,r11,4
%branch out if done
subi r4,r11,4
bnz r4,beginCopy30

endCopy30
% end copy 
% begin generating indice offseting
addi r11,r0,1
addi r4,r0,0
sw 304(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r4,r0,12
lw r2,304(r14)
 add r4,r4,r2
sw 308(r14),r4
% end var offset calculation
%begin dot offsetting
lw r2,308(r14)
addi r2,r2,0
sw 312(r14),r2
%end dot offsetting
%check if size is zero if yes, leave
addi r6,r0,4
bz r6,endCopy31

%set left and right ptrs
%set ptr
lw r4,312(r14)
add r4,r14,r4
addi r4,r4,0
%read direct value
add r2,r0,r14
addi r2,r2,368
%set position counter
mul r10,r0,r0
beginCopy31
%move data via register
lw r11,0(r4)
sw 0(r2),r11
%increment registers
addi r4,r4,4
addi r2,r2,4
addi r10,r10,4
%branch out if done
subi r6,r10,4
bnz r6,beginCopy31

endCopy31
% end copy 
addi r14,r14,364
jl r15, fnweaponincPower1
subi r14,r14,364
%check if size is zero if yes, leave
addi r2,r0,0
bz r2,endCopy32

%set left and right ptrs
%read direct value
add r6,r0,r14
addi r6,r6,364
%read direct value
add r10,r0,r14
addi r10,r10,316
%set position counter
mul r4,r0,r0
beginCopy32
%move data via register
lw r11,0(r6)
sw 0(r10),r11
%increment registers
addi r6,r6,4
addi r10,r10,4
addi r4,r4,4
%branch out if done
subi r2,r4,0
bnz r2,beginCopy32

endCopy32
% end copy 
%begin copy back object
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy33

%set left and right ptrs
%read direct value
add r2,r0,r14
addi r2,r2,368
%set ptr
lw r4,312(r14)
add r4,r14,r4
addi r4,r4,0
%set position counter
mul r6,r0,r0
beginCopy33
%move data via register
lw r11,0(r2)
sw 0(r4),r11
%increment registers
addi r2,r2,4
addi r4,r4,4
addi r6,r6,4
%branch out if done
subi r10,r6,4
bnz r10,beginCopy33

endCopy33
% end copy 
% begin generating indice offseting
addi r6,r0,1
addi r10,r0,0
sw 316(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,4
lw r11,316(r14)
 add r10,r10,r11
sw 320(r14),r10
% end var offset calculation
%begin dot offsetting
lw r11,320(r14)
addi r11,r11,0
sw 324(r14),r11
%end dot offsetting
%check if size is zero if yes, leave
addi r4,r0,4
bz r4,endCopy34

%set left and right ptrs
%set ptr
lw r10,324(r14)
add r10,r14,r10
addi r10,r10,0
%read direct value
add r11,r0,r14
addi r11,r11,372
%set position counter
mul r2,r0,r0
beginCopy34
%move data via register
lw r6,0(r10)
sw 0(r11),r6
%increment registers
addi r10,r10,4
addi r11,r11,4
addi r2,r2,4
%branch out if done
subi r4,r2,4
bnz r4,beginCopy34

endCopy34
% end copy 
addi r14,r14,364
jl r15, fnweapongetPowerLevel1
subi r14,r14,364
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy35

%set left and right ptrs
%read direct value
add r4,r0,r14
addi r4,r4,364
%read direct value
add r2,r0,r14
addi r2,r2,328
%set position counter
mul r10,r0,r0
beginCopy35
%move data via register
lw r6,0(r4)
sw 0(r2),r6
%increment registers
addi r4,r4,4
addi r2,r2,4
addi r10,r10,4
%branch out if done
subi r11,r10,4
bnz r11,beginCopy35

endCopy35
% end copy 
%begin copy back object
%check if size is zero if yes, leave
addi r2,r0,4
bz r2,endCopy36

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,372
%set ptr
lw r10,324(r14)
add r10,r14,r10
addi r10,r10,0
%set position counter
mul r4,r0,r0
beginCopy36
%move data via register
lw r6,0(r11)
sw 0(r10),r6
%increment registers
addi r11,r11,4
addi r10,r10,4
addi r4,r4,4
%branch out if done
subi r2,r4,4
bnz r2,beginCopy36

endCopy36
% end copy 
% begin write 
lw r4,328(r14)
%s move ptr to prevent mem corruption
addi r14,r14,444
sw -8(r14),r4
addi r4,r0,buffer
sw -12(r14),r4
jl r15,intstr
sw -8(r14),r13
jl r15,putstr
addi r4,r0,newline
sw -8(r14),r4
jl r15,putstr
%s move ptr to og location 
addi r14,r14,-444
% end write
% begin generating indice offseting
addi r4,r0,1
addi r2,r0,0
sw 332(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r2,r0,8
lw r6,332(r14)
 add r2,r2,r6
sw 336(r14),r2
% end var offset calculation
%begin dot offsetting
lw r6,336(r14)
addi r6,r6,0
sw 340(r14),r6
%end dot offsetting
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy37

%set left and right ptrs
%set ptr
lw r2,340(r14)
add r2,r14,r2
addi r2,r2,0
%read direct value
add r6,r0,r14
addi r6,r6,372
%set position counter
mul r11,r0,r0
beginCopy37
%move data via register
lw r4,0(r2)
sw 0(r6),r4
%increment registers
addi r2,r2,4
addi r6,r6,4
addi r11,r11,4
%branch out if done
subi r10,r11,4
bnz r10,beginCopy37

endCopy37
% end copy 
addi r14,r14,364
jl r15, fnweapongetPowerLevel1
subi r14,r14,364
%check if size is zero if yes, leave
addi r6,r0,4
bz r6,endCopy38

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,364
%read direct value
add r11,r0,r14
addi r11,r11,344
%set position counter
mul r2,r0,r0
beginCopy38
%move data via register
lw r4,0(r10)
sw 0(r11),r4
%increment registers
addi r10,r10,4
addi r11,r11,4
addi r2,r2,4
%branch out if done
subi r6,r2,4
bnz r6,beginCopy38

endCopy38
% end copy 
%begin copy back object
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy39

%set left and right ptrs
%read direct value
add r6,r0,r14
addi r6,r6,372
%set ptr
lw r2,340(r14)
add r2,r14,r2
addi r2,r2,0
%set position counter
mul r10,r0,r0
beginCopy39
%move data via register
lw r4,0(r6)
sw 0(r2),r4
%increment registers
addi r6,r6,4
addi r2,r2,4
addi r10,r10,4
%branch out if done
subi r11,r10,4
bnz r11,beginCopy39

endCopy39
% end copy 
% begin write 
lw r10,344(r14)
%s move ptr to prevent mem corruption
addi r14,r14,444
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
addi r14,r14,-444
% end write
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
sw 348(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,12
lw r4,348(r14)
 add r11,r11,r4
sw 352(r14),r11
% end var offset calculation
%begin dot offsetting
lw r4,352(r14)
addi r4,r4,0
sw 356(r14),r4
%end dot offsetting
%check if size is zero if yes, leave
addi r2,r0,4
bz r2,endCopy40

%set left and right ptrs
%set ptr
lw r11,356(r14)
add r11,r14,r11
addi r11,r11,0
%read direct value
add r4,r0,r14
addi r4,r4,372
%set position counter
mul r6,r0,r0
beginCopy40
%move data via register
lw r10,0(r11)
sw 0(r4),r10
%increment registers
addi r11,r11,4
addi r4,r4,4
addi r6,r6,4
%branch out if done
subi r2,r6,4
bnz r2,beginCopy40

endCopy40
% end copy 
addi r14,r14,364
jl r15, fnweapongetPowerLevel1
subi r14,r14,364
%check if size is zero if yes, leave
addi r4,r0,4
bz r4,endCopy41

%set left and right ptrs
%read direct value
add r2,r0,r14
addi r2,r2,364
%read direct value
add r6,r0,r14
addi r6,r6,360
%set position counter
mul r11,r0,r0
beginCopy41
%move data via register
lw r10,0(r2)
sw 0(r6),r10
%increment registers
addi r2,r2,4
addi r6,r6,4
addi r11,r11,4
%branch out if done
subi r4,r11,4
bnz r4,beginCopy41

endCopy41
% end copy 
%begin copy back object
%check if size is zero if yes, leave
addi r6,r0,4
bz r6,endCopy42

%set left and right ptrs
%read direct value
add r4,r0,r14
addi r4,r4,372
%set ptr
lw r11,356(r14)
add r11,r14,r11
addi r11,r11,0
%set position counter
mul r2,r0,r0
beginCopy42
%move data via register
lw r10,0(r4)
sw 0(r11),r10
%increment registers
addi r4,r4,4
addi r11,r11,4
addi r2,r2,4
%branch out if done
subi r6,r2,4
bnz r6,beginCopy42

endCopy42
% end copy 
% begin write 
lw r2,360(r14)
%s move ptr to prevent mem corruption
addi r14,r14,444
sw -8(r14),r2
addi r2,r0,buffer
sw -12(r14),r2
jl r15,intstr
sw -8(r14),r13
jl r15,putstr
addi r2,r0,newline
sw -8(r14),r2
jl r15,putstr
%s move ptr to og location 
addi r14,r14,-444
% end write
hlt
%funcdef begin
fnmanleg1
sw 0(r14),r15
% begin generating indice offseting
addi r2,r0,1
addi r6,r0,0
sw 4(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r6,r0,4
lw r10,4(r14)
 add r6,r6,r10
sw 8(r14),r6
% end var offset calculation
%check if size is zero if yes, leave
addi r11,r0,0
bz r11,endCopy43

%set left and right ptrs
%set ptr
lw r6,8(r14)
add r6,r14,r6
addi r6,r6,0
%read direct value
add r10,r0,r14
addi r10,r10,0
%set position counter
mul r4,r0,r0
beginCopy43
%move data via register
lw r2,0(r6)
sw 0(r10),r2
%increment registers
addi r6,r6,4
addi r10,r10,4
addi r4,r4,4
%branch out if done
subi r11,r4,0
bnz r11,beginCopy43

endCopy43
% end copy 
lw r15,0(r14)
jr r15 
%funcdef end
%funcdef begin
fnwarriorset1
sw 0(r14),r15
% begin generating indice offseting
addi r4,r0,1
addi r11,r0,0
sw 36(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,28
lw r2,36(r14)
 add r11,r11,r2
sw 40(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r2,r0,1
addi r11,r0,0
lw r4,40(r14)
add r4,r14,r4
lw r4,0(r4)
muli r6,r2,4
mul r6,r4,r6
add r11,r11,r6
sw 44(r14),r11
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r4,44(r14)
 add r11,r11,r4
sw 48(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r4,r0,1
addi r11,r0,0
sw 52(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,32
lw r2,52(r14)
 add r11,r11,r2
sw 56(r14),r11
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy44

%set left and right ptrs
%set ptr
lw r11,56(r14)
add r11,r14,r11
lw r2,48(r14)
add r2,r14,r2
%set position counter
mul r6,r0,r0
beginCopy44
%move data via register
lw r4,0(r11)
sw 0(r2),r4
%increment registers
addi r11,r11,4
addi r2,r2,4
addi r6,r6,4
%branch out if done
subi r10,r6,4
bnz r10,beginCopy44

endCopy44
% end assignment 
lw r15,0(r14)
jr r15 
%funcdef end
%funcdef begin
fnwarriorgetZ1
sw 4(r14),r15
% begin generating indice offseting
addi r6,r0,1
addi r10,r0,0
sw 32(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,28
lw r4,32(r14)
 add r10,r10,r4
sw 36(r14),r10
% end var offset calculation
%check if size is zero if yes, leave
addi r2,r0,4
bz r2,endCopy45

%set left and right ptrs
%set ptr
lw r10,36(r14)
add r10,r14,r10
addi r10,r10,0
%read direct value
add r4,r0,r14
addi r4,r4,0
%set position counter
mul r11,r0,r0
beginCopy45
%move data via register
lw r6,0(r10)
sw 0(r4),r6
%increment registers
addi r10,r10,4
addi r4,r4,4
addi r11,r11,4
%branch out if done
subi r2,r11,4
bnz r2,beginCopy45

endCopy45
% end copy 
lw r15,4(r14)
jr r15 
%funcdef end
%funcdef begin
fnweaponconstructor1
sw 4(r14),r15
% begin generating indice offseting
addi r11,r0,1
addi r2,r0,0
sw 16(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r2,r0,12
lw r6,16(r14)
 add r2,r2,r6
sw 20(r14),r2
% end var offset calculation
%begin dot offsetting
lw r6,20(r14)
addi r6,r6,0
sw 24(r14),r6
%end dot offsetting
% begin generating indice offseting
addi r6,r0,1
addi r2,r0,0
sw 28(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r11,28(r14)
lw r2,24(r14)
add r2,r2,r11
sw 32(r14),r2
% end var offset calculation
% begin generating indice offseting
addi r11,r0,1
addi r2,r0,0
sw 36(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r2,r0,8
lw r6,36(r14)
 add r2,r2,r6
sw 40(r14),r2
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r4,r0,4
bz r4,endCopy46

%set left and right ptrs
%set ptr
lw r2,40(r14)
add r2,r14,r2
lw r6,32(r14)
add r6,r14,r6
%set position counter
mul r10,r0,r0
beginCopy46
%move data via register
lw r11,0(r2)
sw 0(r6),r11
%increment registers
addi r2,r2,4
addi r6,r6,4
addi r10,r10,4
%branch out if done
subi r4,r10,4
bnz r4,beginCopy46

endCopy46
% end assignment 
% begin generating indice offseting
addi r10,r0,1
addi r4,r0,0
sw 44(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r4,r0,12
lw r11,44(r14)
 add r4,r4,r11
sw 48(r14),r4
% end var offset calculation
%check if size is zero if yes, leave
addi r6,r0,4
bz r6,endCopy47

%set left and right ptrs
%set ptr
lw r4,48(r14)
add r4,r14,r4
addi r4,r4,0
%read direct value
add r11,r0,r14
addi r11,r11,0
%set position counter
mul r2,r0,r0
beginCopy47
%move data via register
lw r10,0(r4)
sw 0(r11),r10
%increment registers
addi r4,r4,4
addi r11,r11,4
addi r2,r2,4
%branch out if done
subi r6,r2,4
bnz r6,beginCopy47

endCopy47
% end copy 
lw r15,4(r14)
jr r15 
%funcdef end
%funcdef begin
fnweapongetPowerLevel1
sw 4(r14),r15
% begin generating indice offseting
addi r2,r0,1
addi r6,r0,0
sw 12(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r6,r0,8
lw r10,12(r14)
 add r6,r6,r10
sw 16(r14),r6
% end var offset calculation
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy48

%set left and right ptrs
%set ptr
lw r6,16(r14)
add r6,r14,r6
addi r6,r6,0
%read direct value
add r10,r0,r14
addi r10,r10,0
%set position counter
mul r4,r0,r0
beginCopy48
%move data via register
lw r2,0(r6)
sw 0(r10),r2
%increment registers
addi r6,r6,4
addi r10,r10,4
addi r4,r4,4
%branch out if done
subi r11,r4,4
bnz r11,beginCopy48

endCopy48
% end copy 
lw r15,4(r14)
jr r15 
%funcdef end
%funcdef begin
fnweaponincPower1
sw 0(r14),r15
% begin generating indice offseting
addi r4,r0,1
addi r11,r0,0
sw 8(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r2,8(r14)
 add r11,r11,r2
sw 12(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r2,r0,1
addi r11,r0,0
sw 16(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r4,16(r14)
 add r11,r11,r4
sw 20(r14),r11
% end var offset calculation
% begin intlit storeage
addi r4,r0,1
sw 24(r14), r4
% done intlit storeage
% begin add op 
lw r6,20(r14)
add r6,r14,r6
lw r4,0(r6)
lw r11,24(r14)
add r2,r4,r11
sw 28(r14),r2
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy49

%set left and right ptrs
%read direct value
add r2,r0,r14
addi r2,r2,28
lw r6,12(r14)
add r6,r14,r6
%set position counter
mul r4,r0,r0
beginCopy49
%move data via register
lw r11,0(r2)
sw 0(r6),r11
%increment registers
addi r2,r2,4
addi r6,r6,4
addi r4,r4,4
%branch out if done
subi r10,r4,4
bnz r10,beginCopy49

endCopy49
% end assignment 
lw r15,0(r14)
jr r15 
%funcdef end
%funcdef begin
fnlegendwar1
sw 24(r14),r15
% begin generating indice offseting
addi r4,r0,1
addi r10,r0,0
sw 64(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,28
lw r11,64(r14)
 add r10,r10,r11
sw 68(r14),r10
% end var offset calculation
%begin dot offsetting
lw r11,68(r14)
addi r11,r11,20
sw 72(r14),r11
%end dot offsetting
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
sw 76(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r4,76(r14)
lw r10,72(r14)
add r10,r10,r4
sw 80(r14),r10
% end var offset calculation
% begin intlit storeage
addi r4,r0,212
sw 84(r14), r4
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r6,r0,4
bz r6,endCopy50

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,84
lw r4,80(r14)
add r4,r14,r4
%set position counter
mul r2,r0,r0
beginCopy50
%move data via register
lw r11,0(r10)
sw 0(r4),r11
%increment registers
addi r10,r10,4
addi r4,r4,4
addi r2,r2,4
%branch out if done
subi r6,r2,4
bnz r6,beginCopy50

endCopy50
% end assignment 
% begin intlit storeage
addi r2,r0,10
sw 88(r14), r2
% done intlit storeage
%check if size is zero if yes, leave
addi r4,r0,4
bz r4,endCopy51

%set left and right ptrs
%read direct value
add r6,r0,r14
addi r6,r6,88
%read direct value
add r2,r0,r14
addi r2,r2,188
%set position counter
mul r10,r0,r0
beginCopy51
%move data via register
lw r11,0(r6)
sw 0(r2),r11
%increment registers
addi r6,r6,4
addi r2,r2,4
addi r10,r10,4
%branch out if done
subi r4,r10,4
bnz r4,beginCopy51

endCopy51
% end copy 
addi r14,r14,180
jl r15, fnweaponconstructor1
subi r14,r14,180
%check if size is zero if yes, leave
addi r2,r0,4
bz r2,endCopy52

%set left and right ptrs
%read direct value
add r4,r0,r14
addi r4,r4,180
%read direct value
add r10,r0,r14
addi r10,r10,52
%set position counter
mul r6,r0,r0
beginCopy52
%move data via register
lw r11,0(r4)
sw 0(r10),r11
%increment registers
addi r4,r4,4
addi r10,r10,4
addi r6,r6,4
%branch out if done
subi r2,r6,4
bnz r2,beginCopy52

endCopy52
% end copy 
% begin intlit storeage
addi r6,r0,40
sw 92(r14), r6
% done intlit storeage
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy53

%set left and right ptrs
%read direct value
add r2,r0,r14
addi r2,r2,92
%read direct value
add r6,r0,r14
addi r6,r6,188
%set position counter
mul r4,r0,r0
beginCopy53
%move data via register
lw r11,0(r2)
sw 0(r6),r11
%increment registers
addi r2,r2,4
addi r6,r6,4
addi r4,r4,4
%branch out if done
subi r10,r4,4
bnz r10,beginCopy53

endCopy53
% end copy 
addi r14,r14,180
jl r15, fnweaponconstructor1
subi r14,r14,180
%check if size is zero if yes, leave
addi r6,r0,4
bz r6,endCopy54

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,180
%read direct value
add r4,r0,r14
addi r4,r4,56
%set position counter
mul r2,r0,r0
beginCopy54
%move data via register
lw r11,0(r10)
sw 0(r4),r11
%increment registers
addi r10,r10,4
addi r4,r4,4
addi r2,r2,4
%branch out if done
subi r6,r2,4
bnz r6,beginCopy54

endCopy54
% end copy 
% begin intlit storeage
addi r2,r0,50
sw 96(r14), r2
% done intlit storeage
%check if size is zero if yes, leave
addi r4,r0,4
bz r4,endCopy55

%set left and right ptrs
%read direct value
add r6,r0,r14
addi r6,r6,96
%read direct value
add r2,r0,r14
addi r2,r2,188
%set position counter
mul r10,r0,r0
beginCopy55
%move data via register
lw r11,0(r6)
sw 0(r2),r11
%increment registers
addi r6,r6,4
addi r2,r2,4
addi r10,r10,4
%branch out if done
subi r4,r10,4
bnz r4,beginCopy55

endCopy55
% end copy 
addi r14,r14,180
jl r15, fnweaponconstructor1
subi r14,r14,180
%check if size is zero if yes, leave
addi r2,r0,4
bz r2,endCopy56

%set left and right ptrs
%read direct value
add r4,r0,r14
addi r4,r4,180
%read direct value
add r10,r0,r14
addi r10,r10,60
%set position counter
mul r6,r0,r0
beginCopy56
%move data via register
lw r11,0(r4)
sw 0(r10),r11
%increment registers
addi r4,r4,4
addi r10,r10,4
addi r6,r6,4
%branch out if done
subi r2,r6,4
bnz r2,beginCopy56

endCopy56
% end copy 
% begin generating indice offseting
addi r6,r0,1
addi r2,r0,0
sw 100(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r2,r0,28
lw r11,100(r14)
 add r2,r2,r11
sw 104(r14),r2
% end var offset calculation
%begin dot offsetting
lw r11,104(r14)
addi r11,r11,0
sw 108(r14),r11
%end dot offsetting
% begin intlit storeage
addi r11,r0,0
sw 112(r14), r11
% done intlit storeage
% begin generating indice offseting
addi r11,r0,1
addi r2,r0,0
sw 116(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r2,r0,52
lw r6,116(r14)
 add r2,r2,r6
sw 120(r14),r2
% end var offset calculation
%check if size is zero if yes, leave
addi r10,r0,24
bz r10,endCopy57

%set left and right ptrs
%set ptr
lw r2,108(r14)
add r2,r14,r2
addi r2,r2,0
%read direct value
add r6,r0,r14
addi r6,r6,184
%set position counter
mul r4,r0,r0
beginCopy57
%move data via register
lw r11,0(r2)
sw 0(r6),r11
%increment registers
addi r2,r2,4
addi r6,r6,4
addi r4,r4,4
%branch out if done
subi r10,r4,24
bnz r10,beginCopy57

endCopy57
% end copy 
%check if size is zero if yes, leave
addi r6,r0,4
bz r6,endCopy58

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,112
%read direct value
add r4,r0,r14
addi r4,r4,208
%set position counter
mul r2,r0,r0
beginCopy58
%move data via register
lw r11,0(r10)
sw 0(r4),r11
%increment registers
addi r10,r10,4
addi r4,r4,4
addi r2,r2,4
%branch out if done
subi r6,r2,4
bnz r6,beginCopy58

endCopy58
% end copy 
%check if size is zero if yes, leave
addi r4,r0,4
bz r4,endCopy59

%set left and right ptrs
%set ptr
lw r6,120(r14)
add r6,r14,r6
addi r6,r6,0
%read direct value
add r2,r0,r14
addi r2,r2,212
%set position counter
mul r10,r0,r0
beginCopy59
%move data via register
lw r11,0(r6)
sw 0(r2),r11
%increment registers
addi r6,r6,4
addi r2,r2,4
addi r10,r10,4
%branch out if done
subi r4,r10,4
bnz r4,beginCopy59

endCopy59
% end copy 
addi r14,r14,180
jl r15, fnwarriorset1
subi r14,r14,180
%check if size is zero if yes, leave
addi r2,r0,0
bz r2,endCopy60

%set left and right ptrs
%read direct value
add r4,r0,r14
addi r4,r4,180
%read direct value
add r10,r0,r14
addi r10,r10,124
%set position counter
mul r6,r0,r0
beginCopy60
%move data via register
lw r11,0(r4)
sw 0(r10),r11
%increment registers
addi r4,r4,4
addi r10,r10,4
addi r6,r6,4
%branch out if done
subi r2,r6,0
bnz r2,beginCopy60

endCopy60
% end copy 
%begin copy back object
%check if size is zero if yes, leave
addi r10,r0,24
bz r10,endCopy61

%set left and right ptrs
%read direct value
add r2,r0,r14
addi r2,r2,184
%set ptr
lw r6,108(r14)
add r6,r14,r6
addi r6,r6,0
%set position counter
mul r4,r0,r0
beginCopy61
%move data via register
lw r11,0(r2)
sw 0(r6),r11
%increment registers
addi r2,r2,4
addi r6,r6,4
addi r4,r4,4
%branch out if done
subi r10,r4,24
bnz r10,beginCopy61

endCopy61
% end copy 
% begin generating indice offseting
addi r4,r0,1
addi r10,r0,0
sw 124(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,28
lw r11,124(r14)
 add r10,r10,r11
sw 128(r14),r10
% end var offset calculation
%begin dot offsetting
lw r11,128(r14)
addi r11,r11,0
sw 132(r14),r11
%end dot offsetting
% begin intlit storeage
addi r11,r0,1
sw 136(r14), r11
% done intlit storeage
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
sw 140(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,56
lw r4,140(r14)
 add r10,r10,r4
sw 144(r14),r10
% end var offset calculation
%check if size is zero if yes, leave
addi r6,r0,24
bz r6,endCopy62

%set left and right ptrs
%set ptr
lw r10,132(r14)
add r10,r14,r10
addi r10,r10,0
%read direct value
add r4,r0,r14
addi r4,r4,184
%set position counter
mul r2,r0,r0
beginCopy62
%move data via register
lw r11,0(r10)
sw 0(r4),r11
%increment registers
addi r10,r10,4
addi r4,r4,4
addi r2,r2,4
%branch out if done
subi r6,r2,24
bnz r6,beginCopy62

endCopy62
% end copy 
%check if size is zero if yes, leave
addi r4,r0,4
bz r4,endCopy63

%set left and right ptrs
%read direct value
add r6,r0,r14
addi r6,r6,136
%read direct value
add r2,r0,r14
addi r2,r2,208
%set position counter
mul r10,r0,r0
beginCopy63
%move data via register
lw r11,0(r6)
sw 0(r2),r11
%increment registers
addi r6,r6,4
addi r2,r2,4
addi r10,r10,4
%branch out if done
subi r4,r10,4
bnz r4,beginCopy63

endCopy63
% end copy 
%check if size is zero if yes, leave
addi r2,r0,4
bz r2,endCopy64

%set left and right ptrs
%set ptr
lw r4,144(r14)
add r4,r14,r4
addi r4,r4,0
%read direct value
add r10,r0,r14
addi r10,r10,212
%set position counter
mul r6,r0,r0
beginCopy64
%move data via register
lw r11,0(r4)
sw 0(r10),r11
%increment registers
addi r4,r4,4
addi r10,r10,4
addi r6,r6,4
%branch out if done
subi r2,r6,4
bnz r2,beginCopy64

endCopy64
% end copy 
addi r14,r14,180
jl r15, fnwarriorset1
subi r14,r14,180
%check if size is zero if yes, leave
addi r10,r0,0
bz r10,endCopy65

%set left and right ptrs
%read direct value
add r2,r0,r14
addi r2,r2,180
%read direct value
add r6,r0,r14
addi r6,r6,148
%set position counter
mul r4,r0,r0
beginCopy65
%move data via register
lw r11,0(r2)
sw 0(r6),r11
%increment registers
addi r2,r2,4
addi r6,r6,4
addi r4,r4,4
%branch out if done
subi r10,r4,0
bnz r10,beginCopy65

endCopy65
% end copy 
%begin copy back object
%check if size is zero if yes, leave
addi r6,r0,24
bz r6,endCopy66

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,184
%set ptr
lw r4,132(r14)
add r4,r14,r4
addi r4,r4,0
%set position counter
mul r2,r0,r0
beginCopy66
%move data via register
lw r11,0(r10)
sw 0(r4),r11
%increment registers
addi r10,r10,4
addi r4,r4,4
addi r2,r2,4
%branch out if done
subi r6,r2,24
bnz r6,beginCopy66

endCopy66
% end copy 
% begin generating indice offseting
addi r2,r0,1
addi r6,r0,0
sw 148(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r6,r0,28
lw r11,148(r14)
 add r6,r6,r11
sw 152(r14),r6
% end var offset calculation
%begin dot offsetting
lw r11,152(r14)
addi r11,r11,0
sw 156(r14),r11
%end dot offsetting
% begin intlit storeage
addi r11,r0,2
sw 160(r14), r11
% done intlit storeage
% begin generating indice offseting
addi r11,r0,1
addi r6,r0,0
sw 164(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r6,r0,60
lw r2,164(r14)
 add r6,r6,r2
sw 168(r14),r6
% end var offset calculation
%check if size is zero if yes, leave
addi r4,r0,24
bz r4,endCopy67

%set left and right ptrs
%set ptr
lw r6,156(r14)
add r6,r14,r6
addi r6,r6,0
%read direct value
add r2,r0,r14
addi r2,r2,184
%set position counter
mul r10,r0,r0
beginCopy67
%move data via register
lw r11,0(r6)
sw 0(r2),r11
%increment registers
addi r6,r6,4
addi r2,r2,4
addi r10,r10,4
%branch out if done
subi r4,r10,24
bnz r4,beginCopy67

endCopy67
% end copy 
%check if size is zero if yes, leave
addi r2,r0,4
bz r2,endCopy68

%set left and right ptrs
%read direct value
add r4,r0,r14
addi r4,r4,160
%read direct value
add r10,r0,r14
addi r10,r10,208
%set position counter
mul r6,r0,r0
beginCopy68
%move data via register
lw r11,0(r4)
sw 0(r10),r11
%increment registers
addi r4,r4,4
addi r10,r10,4
addi r6,r6,4
%branch out if done
subi r2,r6,4
bnz r2,beginCopy68

endCopy68
% end copy 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy69

%set left and right ptrs
%set ptr
lw r2,168(r14)
add r2,r14,r2
addi r2,r2,0
%read direct value
add r6,r0,r14
addi r6,r6,212
%set position counter
mul r4,r0,r0
beginCopy69
%move data via register
lw r11,0(r2)
sw 0(r6),r11
%increment registers
addi r2,r2,4
addi r6,r6,4
addi r4,r4,4
%branch out if done
subi r10,r4,4
bnz r10,beginCopy69

endCopy69
% end copy 
addi r14,r14,180
jl r15, fnwarriorset1
subi r14,r14,180
%check if size is zero if yes, leave
addi r6,r0,0
bz r6,endCopy70

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,180
%read direct value
add r4,r0,r14
addi r4,r4,172
%set position counter
mul r2,r0,r0
beginCopy70
%move data via register
lw r11,0(r10)
sw 0(r4),r11
%increment registers
addi r10,r10,4
addi r4,r4,4
addi r2,r2,4
%branch out if done
subi r6,r2,0
bnz r6,beginCopy70

endCopy70
% end copy 
%begin copy back object
%check if size is zero if yes, leave
addi r4,r0,24
bz r4,endCopy71

%set left and right ptrs
%read direct value
add r6,r0,r14
addi r6,r6,184
%set ptr
lw r2,156(r14)
add r2,r14,r2
addi r2,r2,0
%set position counter
mul r10,r0,r0
beginCopy71
%move data via register
lw r11,0(r6)
sw 0(r2),r11
%increment registers
addi r6,r6,4
addi r2,r2,4
addi r10,r10,4
%branch out if done
subi r4,r10,24
bnz r4,beginCopy71

endCopy71
% end copy 
% begin generating indice offseting
addi r10,r0,1
addi r4,r0,0
sw 172(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r4,r0,28
lw r11,172(r14)
 add r4,r4,r11
sw 176(r14),r4
% end var offset calculation
%check if size is zero if yes, leave
addi r2,r0,24
bz r2,endCopy72

%set left and right ptrs
%set ptr
lw r4,176(r14)
add r4,r14,r4
addi r4,r4,0
%read direct value
add r11,r0,r14
addi r11,r11,0
%set position counter
mul r6,r0,r0
beginCopy72
%move data via register
lw r10,0(r4)
sw 0(r11),r10
%increment registers
addi r4,r4,4
addi r11,r11,4
addi r6,r6,4
%branch out if done
subi r2,r6,24
bnz r2,beginCopy72

endCopy72
% end copy 
lw r15,24(r14)
jr r15 
%funcdef end
