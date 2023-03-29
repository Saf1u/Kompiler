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
addi r12,r0,9
sw 376(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,22
sw 380(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,10
sw 384(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,20
sw 388(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,30
sw 392(r14), r12
% done intlit storeage
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy1

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,376
%read direct value
add r12,r0,r14
addi r12,r12,1576
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
addi r8,r8,380
%read direct value
add r9,r0,r14
addi r9,r9,1580
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
addi r12,r12,384
%read direct value
add r11,r0,r14
addi r11,r11,1584
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
addi r9,r9,388
%read direct value
add r8,r0,r14
addi r8,r8,1588
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
addi r11,r11,392
%read direct value
add r12,r0,r14
addi r12,r12,1592
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
addi r14,r14,1200
jl r15, fnmanconstructor1
subi r14,r14,1200
%check if size is zero if yes, leave
addi r12,r0,372
bz r12,endCopy6

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,1200
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
subi r12,r11,372
bnz r12,beginCopy6

endCopy6
% end copy 
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 396(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r10,396(r14)
 add r12,r12,r10
sw 400(r14),r12
% end var offset calculation
%begin dot offsetting
lw r10,400(r14)
addi r10,r10,356
sw 404(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,0
sw 408(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
lw r11,408(r14)
muli r8,r10,4
mul r8,r11,r8
add r12,r12,r8
sw 412(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r11,412(r14)
lw r12,404(r14)
add r12,r12,r11
sw 416(r14),r12
% end var offset calculation
% begin write 
lw r11,416(r14)
add r11,r14,r11
lw r11,0(r11)
%s move ptr to prevent mem corruption
addi r14,r14,1280
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
addi r14,r14,-1280
% end write
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 420(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r10,420(r14)
 add r12,r12,r10
sw 424(r14),r12
% end var offset calculation
%begin dot offsetting
lw r10,424(r14)
sw 428(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,0
sw 432(r14), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,22
sw 436(r14), r10
% done intlit storeage
%check if size is zero if yes, leave
addi r9,r0,16
bz r9,endCopy7

%set left and right ptrs
%set ptr
lw r12,428(r14)
add r12,r14,r12
addi r12,r12,356
%read direct value
add r10,r0,r14
addi r10,r10,1208
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
subi r9,r8,16
bnz r9,beginCopy7

endCopy7
% end copy 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy8

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,432
%read direct value
add r8,r0,r14
addi r8,r8,1224
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
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy9

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,436
%read direct value
add r12,r0,r14
addi r12,r12,1228
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
addi r14,r14,1200
jl r15, fnfanmutatefan1
subi r14,r14,1200
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy10

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,1200
%read direct value
add r9,r0,r14
addi r9,r9,440
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
subi r12,r10,4
bnz r12,beginCopy10

endCopy10
% end copy 
%begin copy back object
%check if size is zero if yes, leave
addi r9,r0,16
bz r9,endCopy11

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,1208
%set ptr
lw r10,428(r14)
add r10,r14,r10
addi r10,r10,356
%set position counter
mul r8,r0,r0
beginCopy11
%move data via register
lw r11,0(r12)
sw 0(r10),r11
%increment registers
addi r12,r12,4
addi r10,r10,4
addi r8,r8,4
%branch out if done
subi r9,r8,16
bnz r9,beginCopy11

endCopy11
% end copy 
% begin generating indice offseting
addi r8,r0,1
addi r9,r0,0
sw 444(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,4
lw r11,444(r14)
 add r9,r9,r11
sw 448(r14),r9
% end var offset calculation
%begin dot offsetting
lw r11,448(r14)
addi r11,r11,356
sw 452(r14),r11
%end dot offsetting
% begin intlit storeage
addi r11,r0,0
sw 456(r14), r11
% done intlit storeage
% begin generating indice offseting
addi r11,r0,1
addi r9,r0,0
lw r8,456(r14)
muli r12,r11,4
mul r12,r8,r12
add r9,r9,r12
sw 460(r14),r9
% done generating indice offseting
% begin var offset calculation
lw r8,460(r14)
lw r9,452(r14)
add r9,r9,r8
sw 464(r14),r9
% end var offset calculation
% begin write 
lw r8,464(r14)
add r8,r14,r8
lw r8,0(r8)
%s move ptr to prevent mem corruption
addi r14,r14,1280
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
addi r14,r14,-1280
% end write
% begin generating indice offseting
addi r8,r0,1
addi r9,r0,0
sw 468(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,4
lw r11,468(r14)
 add r9,r9,r11
sw 472(r14),r9
% end var offset calculation
%begin dot offsetting
lw r11,472(r14)
addi r11,r11,356
sw 476(r14),r11
%end dot offsetting
% begin intlit storeage
addi r11,r0,1
sw 480(r14), r11
% done intlit storeage
% begin generating indice offseting
addi r11,r0,1
addi r9,r0,0
lw r8,480(r14)
muli r12,r11,4
mul r12,r8,r12
add r9,r9,r12
sw 484(r14),r9
% done generating indice offseting
% begin var offset calculation
lw r8,484(r14)
lw r9,476(r14)
add r9,r9,r8
sw 488(r14),r9
% end var offset calculation
% begin write 
lw r8,488(r14)
add r8,r14,r8
lw r8,0(r8)
%s move ptr to prevent mem corruption
addi r14,r14,1280
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
addi r14,r14,-1280
% end write
% begin generating indice offseting
addi r8,r0,1
addi r9,r0,0
sw 492(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,4
lw r11,492(r14)
 add r9,r9,r11
sw 496(r14),r9
% end var offset calculation
%begin dot offsetting
lw r11,496(r14)
sw 500(r14),r11
%end dot offsetting
% begin intlit storeage
addi r11,r0,1
sw 504(r14), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,922
sw 508(r14), r11
% done intlit storeage
%check if size is zero if yes, leave
addi r10,r0,16
bz r10,endCopy12

%set left and right ptrs
%set ptr
lw r9,500(r14)
add r9,r14,r9
addi r9,r9,356
%read direct value
add r11,r0,r14
addi r11,r11,1208
%set position counter
mul r12,r0,r0
beginCopy12
%move data via register
lw r8,0(r9)
sw 0(r11),r8
%increment registers
addi r9,r9,4
addi r11,r11,4
addi r12,r12,4
%branch out if done
subi r10,r12,16
bnz r10,beginCopy12

endCopy12
% end copy 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy13

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,504
%read direct value
add r12,r0,r14
addi r12,r12,1224
%set position counter
mul r9,r0,r0
beginCopy13
%move data via register
lw r8,0(r10)
sw 0(r12),r8
%increment registers
addi r10,r10,4
addi r12,r12,4
addi r9,r9,4
%branch out if done
subi r11,r9,4
bnz r11,beginCopy13

endCopy13
% end copy 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy14

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,508
%read direct value
add r9,r0,r14
addi r9,r9,1228
%set position counter
mul r10,r0,r0
beginCopy14
%move data via register
lw r8,0(r11)
sw 0(r9),r8
%increment registers
addi r11,r11,4
addi r9,r9,4
addi r10,r10,4
%branch out if done
subi r12,r10,4
bnz r12,beginCopy14

endCopy14
% end copy 
addi r14,r14,1200
jl r15, fnfanmutatefan1
subi r14,r14,1200
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy15

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,1200
%read direct value
add r10,r0,r14
addi r10,r10,512
%set position counter
mul r11,r0,r0
beginCopy15
%move data via register
lw r8,0(r12)
sw 0(r10),r8
%increment registers
addi r12,r12,4
addi r10,r10,4
addi r11,r11,4
%branch out if done
subi r9,r11,4
bnz r9,beginCopy15

endCopy15
% end copy 
%begin copy back object
%check if size is zero if yes, leave
addi r10,r0,16
bz r10,endCopy16

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,1208
%set ptr
lw r11,500(r14)
add r11,r14,r11
addi r11,r11,356
%set position counter
mul r12,r0,r0
beginCopy16
%move data via register
lw r8,0(r9)
sw 0(r11),r8
%increment registers
addi r9,r9,4
addi r11,r11,4
addi r12,r12,4
%branch out if done
subi r10,r12,16
bnz r10,beginCopy16

endCopy16
% end copy 
% begin generating indice offseting
addi r12,r0,1
addi r10,r0,0
sw 516(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,4
lw r8,516(r14)
 add r10,r10,r8
sw 520(r14),r10
% end var offset calculation
%begin dot offsetting
lw r8,520(r14)
addi r8,r8,356
sw 524(r14),r8
%end dot offsetting
% begin intlit storeage
addi r8,r0,1
sw 528(r14), r8
% done intlit storeage
% begin generating indice offseting
addi r8,r0,1
addi r10,r0,0
lw r12,528(r14)
muli r9,r8,4
mul r9,r12,r9
add r10,r10,r9
sw 532(r14),r10
% done generating indice offseting
% begin var offset calculation
lw r12,532(r14)
lw r10,524(r14)
add r10,r10,r12
sw 536(r14),r10
% end var offset calculation
% begin write 
lw r12,536(r14)
add r12,r14,r12
lw r12,0(r12)
%s move ptr to prevent mem corruption
addi r14,r14,1280
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
addi r14,r14,-1280
% end write
% begin generating indice offseting
addi r12,r0,1
addi r10,r0,0
sw 540(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,4
lw r8,540(r14)
 add r10,r10,r8
sw 544(r14),r10
% end var offset calculation
%begin dot offsetting
lw r8,544(r14)
addi r8,r8,356
sw 548(r14),r8
%end dot offsetting
% begin intlit storeage
addi r8,r0,0
sw 552(r14), r8
% done intlit storeage
% begin generating indice offseting
addi r8,r0,1
addi r10,r0,0
lw r12,552(r14)
muli r9,r8,4
mul r9,r12,r9
add r10,r10,r9
sw 556(r14),r10
% done generating indice offseting
% begin var offset calculation
lw r12,556(r14)
lw r10,548(r14)
add r10,r10,r12
sw 560(r14),r10
% end var offset calculation
% begin write 
lw r12,560(r14)
add r12,r14,r12
lw r12,0(r12)
%s move ptr to prevent mem corruption
addi r14,r14,1280
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
addi r14,r14,-1280
% end write
% begin generating indice offseting
addi r12,r0,1
addi r10,r0,0
sw 564(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,4
lw r8,564(r14)
 add r10,r10,r8
sw 568(r14),r10
% end var offset calculation
%begin dot offsetting
lw r8,568(r14)
sw 572(r14),r8
%end dot offsetting
% begin intlit storeage
addi r8,r0,3
sw 576(r14), r8
% done intlit storeage
% begin intlit storeage
addi r8,r0,322
sw 580(r14), r8
% done intlit storeage
%check if size is zero if yes, leave
addi r11,r0,16
bz r11,endCopy17

%set left and right ptrs
%set ptr
lw r10,572(r14)
add r10,r14,r10
addi r10,r10,356
%read direct value
add r8,r0,r14
addi r8,r8,1208
%set position counter
mul r9,r0,r0
beginCopy17
%move data via register
lw r12,0(r10)
sw 0(r8),r12
%increment registers
addi r10,r10,4
addi r8,r8,4
addi r9,r9,4
%branch out if done
subi r11,r9,16
bnz r11,beginCopy17

endCopy17
% end copy 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy18

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,576
%read direct value
add r9,r0,r14
addi r9,r9,1224
%set position counter
mul r10,r0,r0
beginCopy18
%move data via register
lw r12,0(r11)
sw 0(r9),r12
%increment registers
addi r11,r11,4
addi r9,r9,4
addi r10,r10,4
%branch out if done
subi r8,r10,4
bnz r8,beginCopy18

endCopy18
% end copy 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy19

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,580
%read direct value
add r10,r0,r14
addi r10,r10,1228
%set position counter
mul r11,r0,r0
beginCopy19
%move data via register
lw r12,0(r8)
sw 0(r10),r12
%increment registers
addi r8,r8,4
addi r10,r10,4
addi r11,r11,4
%branch out if done
subi r9,r11,4
bnz r9,beginCopy19

endCopy19
% end copy 
addi r14,r14,1200
jl r15, fnfanmutatefan1
subi r14,r14,1200
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy20

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,1200
%read direct value
add r11,r0,r14
addi r11,r11,584
%set position counter
mul r8,r0,r0
beginCopy20
%move data via register
lw r12,0(r9)
sw 0(r11),r12
%increment registers
addi r9,r9,4
addi r11,r11,4
addi r8,r8,4
%branch out if done
subi r10,r8,4
bnz r10,beginCopy20

endCopy20
% end copy 
%begin copy back object
%check if size is zero if yes, leave
addi r11,r0,16
bz r11,endCopy21

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,1208
%set ptr
lw r8,572(r14)
add r8,r14,r8
addi r8,r8,356
%set position counter
mul r9,r0,r0
beginCopy21
%move data via register
lw r12,0(r10)
sw 0(r8),r12
%increment registers
addi r10,r10,4
addi r8,r8,4
addi r9,r9,4
%branch out if done
subi r11,r9,16
bnz r11,beginCopy21

endCopy21
% end copy 
% begin generating indice offseting
addi r9,r0,1
addi r11,r0,0
sw 588(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r12,588(r14)
 add r11,r11,r12
sw 592(r14),r11
% end var offset calculation
%begin dot offsetting
lw r12,592(r14)
addi r12,r12,356
sw 596(r14),r12
%end dot offsetting
% begin intlit storeage
addi r12,r0,3
sw 600(r14), r12
% done intlit storeage
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
lw r9,600(r14)
muli r10,r12,4
mul r10,r9,r10
add r11,r11,r10
sw 604(r14),r11
% done generating indice offseting
% begin var offset calculation
lw r9,604(r14)
lw r11,596(r14)
add r11,r11,r9
sw 608(r14),r11
% end var offset calculation
% begin write 
lw r9,608(r14)
add r9,r14,r9
lw r9,0(r9)
%s move ptr to prevent mem corruption
addi r14,r14,1280
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
addi r14,r14,-1280
% end write
% begin generating indice offseting
addi r9,r0,1
addi r11,r0,0
sw 612(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r12,612(r14)
 add r11,r11,r12
sw 616(r14),r11
% end var offset calculation
%begin dot offsetting
lw r12,616(r14)
addi r12,r12,356
sw 620(r14),r12
%end dot offsetting
% begin intlit storeage
addi r12,r0,2
sw 624(r14), r12
% done intlit storeage
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
lw r9,624(r14)
muli r10,r12,4
mul r10,r9,r10
add r11,r11,r10
sw 628(r14),r11
% done generating indice offseting
% begin var offset calculation
lw r9,628(r14)
lw r11,620(r14)
add r11,r11,r9
sw 632(r14),r11
% end var offset calculation
% begin write 
lw r9,632(r14)
add r9,r14,r9
lw r9,0(r9)
%s move ptr to prevent mem corruption
addi r14,r14,1280
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
addi r14,r14,-1280
% end write
% begin intlit storeage
addi r9,r0,1
sw 636(r14), r9
% done intlit storeage
% begin sign op 
lw r9,636(r14)
sub r11,r0,r9
sw 640(r14),r11
% end sign op 
% begin write 
lw r12,640(r14)
%s move ptr to prevent mem corruption
addi r14,r14,1280
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
addi r14,r14,-1280
% end write
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 644(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r9,644(r14)
 add r11,r11,r9
sw 648(r14),r11
% end var offset calculation
%begin dot offsetting
lw r9,648(r14)
addi r9,r9,28
sw 652(r14),r9
%end dot offsetting
% begin intlit storeage
addi r9,r0,0
sw 656(r14), r9
% done intlit storeage
% begin generating indice offseting
addi r9,r0,1
addi r11,r0,0
lw r12,656(r14)
muli r10,r9,80
mul r10,r12,r10
add r11,r11,r10
sw 660(r14),r11
% done generating indice offseting
% begin var offset calculation
lw r12,660(r14)
lw r11,652(r14)
add r11,r11,r12
sw 664(r14),r11
% end var offset calculation
%begin dot offsetting
lw r12,664(r14)
addi r12,r12,0
sw 668(r14),r12
%end dot offsetting
% begin intlit storeage
addi r12,r0,0
sw 672(r14), r12
% done intlit storeage
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
lw r9,672(r14)
muli r10,r12,20
mul r10,r9,r10
add r11,r11,r10
sw 676(r14),r11
% done generating indice offseting
% begin var offset calculation
lw r9,676(r14)
lw r11,668(r14)
add r11,r11,r9
sw 680(r14),r11
% end var offset calculation
%begin dot offsetting
lw r9,680(r14)
addi r9,r9,0
sw 684(r14),r9
%end dot offsetting
% begin intlit storeage
addi r9,r0,0
sw 688(r14), r9
% done intlit storeage
% begin generating indice offseting
addi r9,r0,1
addi r11,r0,0
lw r12,688(r14)
muli r10,r9,4
mul r10,r12,r10
add r11,r11,r10
sw 692(r14),r11
% done generating indice offseting
% begin var offset calculation
lw r12,692(r14)
lw r11,684(r14)
add r11,r11,r12
sw 696(r14),r11
% end var offset calculation
% begin write 
lw r12,696(r14)
add r12,r14,r12
lw r12,0(r12)
%s move ptr to prevent mem corruption
addi r14,r14,1280
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
addi r14,r14,-1280
% end write
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 700(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r9,700(r14)
 add r11,r11,r9
sw 704(r14),r11
% end var offset calculation
%begin dot offsetting
lw r9,704(r14)
addi r9,r9,28
sw 708(r14),r9
%end dot offsetting
% begin intlit storeage
addi r9,r0,0
sw 712(r14), r9
% done intlit storeage
% begin generating indice offseting
addi r9,r0,1
addi r11,r0,0
lw r12,712(r14)
muli r10,r9,80
mul r10,r12,r10
add r11,r11,r10
sw 716(r14),r11
% done generating indice offseting
% begin var offset calculation
lw r12,716(r14)
lw r11,708(r14)
add r11,r11,r12
sw 720(r14),r11
% end var offset calculation
%begin dot offsetting
lw r12,720(r14)
sw 724(r14),r12
%end dot offsetting
% begin intlit storeage
addi r12,r0,0
sw 728(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,0
sw 732(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,42
sw 736(r14), r12
% done intlit storeage
%check if size is zero if yes, leave
addi r8,r0,80
bz r8,endCopy22

%set left and right ptrs
%set ptr
lw r11,724(r14)
add r11,r14,r11
addi r11,r11,0
%read direct value
add r12,r0,r14
addi r12,r12,1208
%set position counter
mul r10,r0,r0
beginCopy22
%move data via register
lw r9,0(r11)
sw 0(r12),r9
%increment registers
addi r11,r11,4
addi r12,r12,4
addi r10,r10,4
%branch out if done
subi r8,r10,80
bnz r8,beginCopy22

endCopy22
% end copy 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy23

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,728
%read direct value
add r10,r0,r14
addi r10,r10,1288
%set position counter
mul r11,r0,r0
beginCopy23
%move data via register
lw r9,0(r8)
sw 0(r10),r9
%increment registers
addi r8,r8,4
addi r10,r10,4
addi r11,r11,4
%branch out if done
subi r12,r11,4
bnz r12,beginCopy23

endCopy23
% end copy 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy24

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,732
%read direct value
add r11,r0,r14
addi r11,r11,1292
%set position counter
mul r8,r0,r0
beginCopy24
%move data via register
lw r9,0(r12)
sw 0(r11),r9
%increment registers
addi r12,r12,4
addi r11,r11,4
addi r8,r8,4
%branch out if done
subi r10,r8,4
bnz r10,beginCopy24

endCopy24
% end copy 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy25

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,736
%read direct value
add r8,r0,r14
addi r8,r8,1296
%set position counter
mul r12,r0,r0
beginCopy25
%move data via register
lw r9,0(r10)
sw 0(r8),r9
%increment registers
addi r10,r10,4
addi r8,r8,4
addi r12,r12,4
%branch out if done
subi r11,r12,4
bnz r11,beginCopy25

endCopy25
% end copy 
addi r14,r14,1200
jl r15, fnbossmutateTerm1
subi r14,r14,1200
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy26

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,1200
%read direct value
add r12,r0,r14
addi r12,r12,740
%set position counter
mul r10,r0,r0
beginCopy26
%move data via register
lw r9,0(r11)
sw 0(r12),r9
%increment registers
addi r11,r11,4
addi r12,r12,4
addi r10,r10,4
%branch out if done
subi r8,r10,4
bnz r8,beginCopy26

endCopy26
% end copy 
%begin copy back object
%check if size is zero if yes, leave
addi r12,r0,80
bz r12,endCopy27

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,1208
%set ptr
lw r10,724(r14)
add r10,r14,r10
addi r10,r10,0
%set position counter
mul r11,r0,r0
beginCopy27
%move data via register
lw r9,0(r8)
sw 0(r10),r9
%increment registers
addi r8,r8,4
addi r10,r10,4
addi r11,r11,4
%branch out if done
subi r12,r11,80
bnz r12,beginCopy27

endCopy27
% end copy 
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 744(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r9,744(r14)
 add r12,r12,r9
sw 748(r14),r12
% end var offset calculation
%begin dot offsetting
lw r9,748(r14)
addi r9,r9,28
sw 752(r14),r9
%end dot offsetting
% begin intlit storeage
addi r9,r0,1
sw 756(r14), r9
% done intlit storeage
% begin generating indice offseting
addi r9,r0,1
addi r12,r0,0
lw r11,756(r14)
muli r8,r9,80
mul r8,r11,r8
add r12,r12,r8
sw 760(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r11,760(r14)
lw r12,752(r14)
add r12,r12,r11
sw 764(r14),r12
% end var offset calculation
%begin dot offsetting
lw r11,764(r14)
sw 768(r14),r11
%end dot offsetting
% begin intlit storeage
addi r11,r0,1
sw 772(r14), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,0
sw 776(r14), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,92
sw 780(r14), r11
% done intlit storeage
%check if size is zero if yes, leave
addi r10,r0,80
bz r10,endCopy28

%set left and right ptrs
%set ptr
lw r12,768(r14)
add r12,r14,r12
addi r12,r12,0
%read direct value
add r11,r0,r14
addi r11,r11,1208
%set position counter
mul r8,r0,r0
beginCopy28
%move data via register
lw r9,0(r12)
sw 0(r11),r9
%increment registers
addi r12,r12,4
addi r11,r11,4
addi r8,r8,4
%branch out if done
subi r10,r8,80
bnz r10,beginCopy28

endCopy28
% end copy 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy29

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,772
%read direct value
add r8,r0,r14
addi r8,r8,1288
%set position counter
mul r12,r0,r0
beginCopy29
%move data via register
lw r9,0(r10)
sw 0(r8),r9
%increment registers
addi r10,r10,4
addi r8,r8,4
addi r12,r12,4
%branch out if done
subi r11,r12,4
bnz r11,beginCopy29

endCopy29
% end copy 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy30

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,776
%read direct value
add r12,r0,r14
addi r12,r12,1292
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
subi r8,r10,4
bnz r8,beginCopy30

endCopy30
% end copy 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy31

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,780
%read direct value
add r10,r0,r14
addi r10,r10,1296
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
addi r14,r14,1200
jl r15, fnbossmutateTerm1
subi r14,r14,1200
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy32

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,1200
%read direct value
add r11,r0,r14
addi r11,r11,784
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
%begin copy back object
%check if size is zero if yes, leave
addi r11,r0,80
bz r11,endCopy33

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,1208
%set ptr
lw r8,768(r14)
add r8,r14,r8
addi r8,r8,0
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
subi r11,r12,80
bnz r11,beginCopy33

endCopy33
% end copy 
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 788(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r9,788(r14)
 add r11,r11,r9
sw 792(r14),r11
% end var offset calculation
%begin dot offsetting
lw r9,792(r14)
addi r9,r9,28
sw 796(r14),r9
%end dot offsetting
% begin intlit storeage
addi r9,r0,2
sw 800(r14), r9
% done intlit storeage
% begin generating indice offseting
addi r9,r0,1
addi r11,r0,0
lw r12,800(r14)
muli r10,r9,80
mul r10,r12,r10
add r11,r11,r10
sw 804(r14),r11
% done generating indice offseting
% begin var offset calculation
lw r12,804(r14)
lw r11,796(r14)
add r11,r11,r12
sw 808(r14),r11
% end var offset calculation
%begin dot offsetting
lw r12,808(r14)
sw 812(r14),r12
%end dot offsetting
% begin intlit storeage
addi r12,r0,1
sw 816(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,0
sw 820(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,62
sw 824(r14), r12
% done intlit storeage
%check if size is zero if yes, leave
addi r8,r0,80
bz r8,endCopy34

%set left and right ptrs
%set ptr
lw r11,812(r14)
add r11,r14,r11
addi r11,r11,0
%read direct value
add r12,r0,r14
addi r12,r12,1208
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
subi r8,r10,80
bnz r8,beginCopy34

endCopy34
% end copy 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy35

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,816
%read direct value
add r10,r0,r14
addi r10,r10,1288
%set position counter
mul r11,r0,r0
beginCopy35
%move data via register
lw r9,0(r8)
sw 0(r10),r9
%increment registers
addi r8,r8,4
addi r10,r10,4
addi r11,r11,4
%branch out if done
subi r12,r11,4
bnz r12,beginCopy35

endCopy35
% end copy 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy36

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,820
%read direct value
add r11,r0,r14
addi r11,r11,1292
%set position counter
mul r8,r0,r0
beginCopy36
%move data via register
lw r9,0(r12)
sw 0(r11),r9
%increment registers
addi r12,r12,4
addi r11,r11,4
addi r8,r8,4
%branch out if done
subi r10,r8,4
bnz r10,beginCopy36

endCopy36
% end copy 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy37

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,824
%read direct value
add r8,r0,r14
addi r8,r8,1296
%set position counter
mul r12,r0,r0
beginCopy37
%move data via register
lw r9,0(r10)
sw 0(r8),r9
%increment registers
addi r10,r10,4
addi r8,r8,4
addi r12,r12,4
%branch out if done
subi r11,r12,4
bnz r11,beginCopy37

endCopy37
% end copy 
addi r14,r14,1200
jl r15, fnbossmutateTerm1
subi r14,r14,1200
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy38

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,1200
%read direct value
add r12,r0,r14
addi r12,r12,828
%set position counter
mul r10,r0,r0
beginCopy38
%move data via register
lw r9,0(r11)
sw 0(r12),r9
%increment registers
addi r11,r11,4
addi r12,r12,4
addi r10,r10,4
%branch out if done
subi r8,r10,4
bnz r8,beginCopy38

endCopy38
% end copy 
%begin copy back object
%check if size is zero if yes, leave
addi r12,r0,80
bz r12,endCopy39

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,1208
%set ptr
lw r10,812(r14)
add r10,r14,r10
addi r10,r10,0
%set position counter
mul r11,r0,r0
beginCopy39
%move data via register
lw r9,0(r8)
sw 0(r10),r9
%increment registers
addi r8,r8,4
addi r10,r10,4
addi r11,r11,4
%branch out if done
subi r12,r11,80
bnz r12,beginCopy39

endCopy39
% end copy 
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 832(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r9,832(r14)
 add r12,r12,r9
sw 836(r14),r12
% end var offset calculation
%begin dot offsetting
lw r9,836(r14)
addi r9,r9,28
sw 840(r14),r9
%end dot offsetting
% begin intlit storeage
addi r9,r0,1
sw 844(r14), r9
% done intlit storeage
% begin generating indice offseting
addi r9,r0,1
addi r12,r0,0
lw r11,844(r14)
muli r8,r9,80
mul r8,r11,r8
add r12,r12,r8
sw 848(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r11,848(r14)
lw r12,840(r14)
add r12,r12,r11
sw 852(r14),r12
% end var offset calculation
%begin dot offsetting
lw r11,852(r14)
sw 856(r14),r11
%end dot offsetting
% begin intlit storeage
addi r11,r0,1
sw 860(r14), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,2
sw 864(r14), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,92
sw 868(r14), r11
% done intlit storeage
%check if size is zero if yes, leave
addi r10,r0,80
bz r10,endCopy40

%set left and right ptrs
%set ptr
lw r12,856(r14)
add r12,r14,r12
addi r12,r12,0
%read direct value
add r11,r0,r14
addi r11,r11,1208
%set position counter
mul r8,r0,r0
beginCopy40
%move data via register
lw r9,0(r12)
sw 0(r11),r9
%increment registers
addi r12,r12,4
addi r11,r11,4
addi r8,r8,4
%branch out if done
subi r10,r8,80
bnz r10,beginCopy40

endCopy40
% end copy 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy41

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,860
%read direct value
add r8,r0,r14
addi r8,r8,1288
%set position counter
mul r12,r0,r0
beginCopy41
%move data via register
lw r9,0(r10)
sw 0(r8),r9
%increment registers
addi r10,r10,4
addi r8,r8,4
addi r12,r12,4
%branch out if done
subi r11,r12,4
bnz r11,beginCopy41

endCopy41
% end copy 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy42

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,864
%read direct value
add r12,r0,r14
addi r12,r12,1292
%set position counter
mul r10,r0,r0
beginCopy42
%move data via register
lw r9,0(r11)
sw 0(r12),r9
%increment registers
addi r11,r11,4
addi r12,r12,4
addi r10,r10,4
%branch out if done
subi r8,r10,4
bnz r8,beginCopy42

endCopy42
% end copy 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy43

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,868
%read direct value
add r10,r0,r14
addi r10,r10,1296
%set position counter
mul r11,r0,r0
beginCopy43
%move data via register
lw r9,0(r8)
sw 0(r10),r9
%increment registers
addi r8,r8,4
addi r10,r10,4
addi r11,r11,4
%branch out if done
subi r12,r11,4
bnz r12,beginCopy43

endCopy43
% end copy 
addi r14,r14,1200
jl r15, fnbossmutateTerm1
subi r14,r14,1200
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy44

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,1200
%read direct value
add r11,r0,r14
addi r11,r11,872
%set position counter
mul r8,r0,r0
beginCopy44
%move data via register
lw r9,0(r12)
sw 0(r11),r9
%increment registers
addi r12,r12,4
addi r11,r11,4
addi r8,r8,4
%branch out if done
subi r10,r8,4
bnz r10,beginCopy44

endCopy44
% end copy 
%begin copy back object
%check if size is zero if yes, leave
addi r11,r0,80
bz r11,endCopy45

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,1208
%set ptr
lw r8,856(r14)
add r8,r14,r8
addi r8,r8,0
%set position counter
mul r12,r0,r0
beginCopy45
%move data via register
lw r9,0(r10)
sw 0(r8),r9
%increment registers
addi r10,r10,4
addi r8,r8,4
addi r12,r12,4
%branch out if done
subi r11,r12,80
bnz r11,beginCopy45

endCopy45
% end copy 
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 876(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r9,876(r14)
 add r11,r11,r9
sw 880(r14),r11
% end var offset calculation
%begin dot offsetting
lw r9,880(r14)
addi r9,r9,28
sw 884(r14),r9
%end dot offsetting
% begin intlit storeage
addi r9,r0,2
sw 888(r14), r9
% done intlit storeage
% begin generating indice offseting
addi r9,r0,1
addi r11,r0,0
lw r12,888(r14)
muli r10,r9,80
mul r10,r12,r10
add r11,r11,r10
sw 892(r14),r11
% done generating indice offseting
% begin var offset calculation
lw r12,892(r14)
lw r11,884(r14)
add r11,r11,r12
sw 896(r14),r11
% end var offset calculation
%begin dot offsetting
lw r12,896(r14)
sw 900(r14),r12
%end dot offsetting
% begin intlit storeage
addi r12,r0,2
sw 904(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,3
sw 908(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,162
sw 912(r14), r12
% done intlit storeage
%check if size is zero if yes, leave
addi r8,r0,80
bz r8,endCopy46

%set left and right ptrs
%set ptr
lw r11,900(r14)
add r11,r14,r11
addi r11,r11,0
%read direct value
add r12,r0,r14
addi r12,r12,1208
%set position counter
mul r10,r0,r0
beginCopy46
%move data via register
lw r9,0(r11)
sw 0(r12),r9
%increment registers
addi r11,r11,4
addi r12,r12,4
addi r10,r10,4
%branch out if done
subi r8,r10,80
bnz r8,beginCopy46

endCopy46
% end copy 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy47

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,904
%read direct value
add r10,r0,r14
addi r10,r10,1288
%set position counter
mul r11,r0,r0
beginCopy47
%move data via register
lw r9,0(r8)
sw 0(r10),r9
%increment registers
addi r8,r8,4
addi r10,r10,4
addi r11,r11,4
%branch out if done
subi r12,r11,4
bnz r12,beginCopy47

endCopy47
% end copy 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy48

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,908
%read direct value
add r11,r0,r14
addi r11,r11,1292
%set position counter
mul r8,r0,r0
beginCopy48
%move data via register
lw r9,0(r12)
sw 0(r11),r9
%increment registers
addi r12,r12,4
addi r11,r11,4
addi r8,r8,4
%branch out if done
subi r10,r8,4
bnz r10,beginCopy48

endCopy48
% end copy 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy49

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,912
%read direct value
add r8,r0,r14
addi r8,r8,1296
%set position counter
mul r12,r0,r0
beginCopy49
%move data via register
lw r9,0(r10)
sw 0(r8),r9
%increment registers
addi r10,r10,4
addi r8,r8,4
addi r12,r12,4
%branch out if done
subi r11,r12,4
bnz r11,beginCopy49

endCopy49
% end copy 
addi r14,r14,1200
jl r15, fnbossmutateTerm1
subi r14,r14,1200
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy50

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,1200
%read direct value
add r12,r0,r14
addi r12,r12,916
%set position counter
mul r10,r0,r0
beginCopy50
%move data via register
lw r9,0(r11)
sw 0(r12),r9
%increment registers
addi r11,r11,4
addi r12,r12,4
addi r10,r10,4
%branch out if done
subi r8,r10,4
bnz r8,beginCopy50

endCopy50
% end copy 
%begin copy back object
%check if size is zero if yes, leave
addi r12,r0,80
bz r12,endCopy51

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,1208
%set ptr
lw r10,900(r14)
add r10,r14,r10
addi r10,r10,0
%set position counter
mul r11,r0,r0
beginCopy51
%move data via register
lw r9,0(r8)
sw 0(r10),r9
%increment registers
addi r8,r8,4
addi r10,r10,4
addi r11,r11,4
%branch out if done
subi r12,r11,80
bnz r12,beginCopy51

endCopy51
% end copy 
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 920(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r9,920(r14)
 add r12,r12,r9
sw 924(r14),r12
% end var offset calculation
%begin dot offsetting
lw r9,924(r14)
addi r9,r9,28
sw 928(r14),r9
%end dot offsetting
% begin intlit storeage
addi r9,r0,0
sw 932(r14), r9
% done intlit storeage
% begin generating indice offseting
addi r9,r0,1
addi r12,r0,0
lw r11,932(r14)
muli r8,r9,80
mul r8,r11,r8
add r12,r12,r8
sw 936(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r11,936(r14)
lw r12,928(r14)
add r12,r12,r11
sw 940(r14),r12
% end var offset calculation
%begin dot offsetting
lw r11,940(r14)
addi r11,r11,0
sw 944(r14),r11
%end dot offsetting
% begin intlit storeage
addi r11,r0,0
sw 948(r14), r11
% done intlit storeage
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
lw r9,948(r14)
muli r8,r11,20
mul r8,r9,r8
add r12,r12,r8
sw 952(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r9,952(r14)
lw r12,944(r14)
add r12,r12,r9
sw 956(r14),r12
% end var offset calculation
%begin dot offsetting
lw r9,956(r14)
addi r9,r9,0
sw 960(r14),r9
%end dot offsetting
% begin intlit storeage
addi r9,r0,0
sw 964(r14), r9
% done intlit storeage
% begin generating indice offseting
addi r9,r0,1
addi r12,r0,0
lw r11,964(r14)
muli r8,r9,4
mul r8,r11,r8
add r12,r12,r8
sw 968(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r11,968(r14)
lw r12,960(r14)
add r12,r12,r11
sw 972(r14),r12
% end var offset calculation
% begin write 
lw r11,972(r14)
add r11,r14,r11
lw r11,0(r11)
%s move ptr to prevent mem corruption
addi r14,r14,1280
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
addi r14,r14,-1280
% end write
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 976(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r9,976(r14)
 add r12,r12,r9
sw 980(r14),r12
% end var offset calculation
%begin dot offsetting
lw r9,980(r14)
addi r9,r9,28
sw 984(r14),r9
%end dot offsetting
% begin intlit storeage
addi r9,r0,1
sw 988(r14), r9
% done intlit storeage
% begin generating indice offseting
addi r9,r0,1
addi r12,r0,0
lw r11,988(r14)
muli r8,r9,80
mul r8,r11,r8
add r12,r12,r8
sw 992(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r11,992(r14)
lw r12,984(r14)
add r12,r12,r11
sw 996(r14),r12
% end var offset calculation
%begin dot offsetting
lw r11,996(r14)
addi r11,r11,0
sw 1000(r14),r11
%end dot offsetting
% begin intlit storeage
addi r11,r0,1
sw 1004(r14), r11
% done intlit storeage
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
lw r9,1004(r14)
muli r8,r11,20
mul r8,r9,r8
add r12,r12,r8
sw 1008(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r9,1008(r14)
lw r12,1000(r14)
add r12,r12,r9
sw 1012(r14),r12
% end var offset calculation
%begin dot offsetting
lw r9,1012(r14)
addi r9,r9,0
sw 1016(r14),r9
%end dot offsetting
% begin intlit storeage
addi r9,r0,0
sw 1020(r14), r9
% done intlit storeage
% begin generating indice offseting
addi r9,r0,1
addi r12,r0,0
lw r11,1020(r14)
muli r8,r9,4
mul r8,r11,r8
add r12,r12,r8
sw 1024(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r11,1024(r14)
lw r12,1016(r14)
add r12,r12,r11
sw 1028(r14),r12
% end var offset calculation
% begin write 
lw r11,1028(r14)
add r11,r14,r11
lw r11,0(r11)
%s move ptr to prevent mem corruption
addi r14,r14,1280
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
addi r14,r14,-1280
% end write
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 1032(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r9,1032(r14)
 add r12,r12,r9
sw 1036(r14),r12
% end var offset calculation
%begin dot offsetting
lw r9,1036(r14)
addi r9,r9,28
sw 1040(r14),r9
%end dot offsetting
% begin intlit storeage
addi r9,r0,2
sw 1044(r14), r9
% done intlit storeage
% begin generating indice offseting
addi r9,r0,1
addi r12,r0,0
lw r11,1044(r14)
muli r8,r9,80
mul r8,r11,r8
add r12,r12,r8
sw 1048(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r11,1048(r14)
lw r12,1040(r14)
add r12,r12,r11
sw 1052(r14),r12
% end var offset calculation
%begin dot offsetting
lw r11,1052(r14)
addi r11,r11,0
sw 1056(r14),r11
%end dot offsetting
% begin intlit storeage
addi r11,r0,1
sw 1060(r14), r11
% done intlit storeage
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
lw r9,1060(r14)
muli r8,r11,20
mul r8,r9,r8
add r12,r12,r8
sw 1064(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r9,1064(r14)
lw r12,1056(r14)
add r12,r12,r9
sw 1068(r14),r12
% end var offset calculation
%begin dot offsetting
lw r9,1068(r14)
addi r9,r9,0
sw 1072(r14),r9
%end dot offsetting
% begin intlit storeage
addi r9,r0,0
sw 1076(r14), r9
% done intlit storeage
% begin generating indice offseting
addi r9,r0,1
addi r12,r0,0
lw r11,1076(r14)
muli r8,r9,4
mul r8,r11,r8
add r12,r12,r8
sw 1080(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r11,1080(r14)
lw r12,1072(r14)
add r12,r12,r11
sw 1084(r14),r12
% end var offset calculation
% begin write 
lw r11,1084(r14)
add r11,r14,r11
lw r11,0(r11)
%s move ptr to prevent mem corruption
addi r14,r14,1280
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
addi r14,r14,-1280
% end write
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 1088(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r9,1088(r14)
 add r12,r12,r9
sw 1092(r14),r12
% end var offset calculation
%begin dot offsetting
lw r9,1092(r14)
addi r9,r9,28
sw 1096(r14),r9
%end dot offsetting
% begin intlit storeage
addi r9,r0,1
sw 1100(r14), r9
% done intlit storeage
% begin generating indice offseting
addi r9,r0,1
addi r12,r0,0
lw r11,1100(r14)
muli r8,r9,80
mul r8,r11,r8
add r12,r12,r8
sw 1104(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r11,1104(r14)
lw r12,1096(r14)
add r12,r12,r11
sw 1108(r14),r12
% end var offset calculation
%begin dot offsetting
lw r11,1108(r14)
addi r11,r11,0
sw 1112(r14),r11
%end dot offsetting
% begin intlit storeage
addi r11,r0,1
sw 1116(r14), r11
% done intlit storeage
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
lw r9,1116(r14)
muli r8,r11,20
mul r8,r9,r8
add r12,r12,r8
sw 1120(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r9,1120(r14)
lw r12,1112(r14)
add r12,r12,r9
sw 1124(r14),r12
% end var offset calculation
%begin dot offsetting
lw r9,1124(r14)
addi r9,r9,0
sw 1128(r14),r9
%end dot offsetting
% begin intlit storeage
addi r9,r0,2
sw 1132(r14), r9
% done intlit storeage
% begin generating indice offseting
addi r9,r0,1
addi r12,r0,0
lw r11,1132(r14)
muli r8,r9,4
mul r8,r11,r8
add r12,r12,r8
sw 1136(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r11,1136(r14)
lw r12,1128(r14)
add r12,r12,r11
sw 1140(r14),r12
% end var offset calculation
% begin write 
lw r11,1140(r14)
add r11,r14,r11
lw r11,0(r11)
%s move ptr to prevent mem corruption
addi r14,r14,1280
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
addi r14,r14,-1280
% end write
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 1144(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r9,1144(r14)
 add r12,r12,r9
sw 1148(r14),r12
% end var offset calculation
%begin dot offsetting
lw r9,1148(r14)
addi r9,r9,28
sw 1152(r14),r9
%end dot offsetting
% begin intlit storeage
addi r9,r0,2
sw 1156(r14), r9
% done intlit storeage
% begin generating indice offseting
addi r9,r0,1
addi r12,r0,0
lw r11,1156(r14)
muli r8,r9,80
mul r8,r11,r8
add r12,r12,r8
sw 1160(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r11,1160(r14)
lw r12,1152(r14)
add r12,r12,r11
sw 1164(r14),r12
% end var offset calculation
%begin dot offsetting
lw r11,1164(r14)
addi r11,r11,0
sw 1168(r14),r11
%end dot offsetting
% begin intlit storeage
addi r11,r0,2
sw 1172(r14), r11
% done intlit storeage
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
lw r9,1172(r14)
muli r8,r11,20
mul r8,r9,r8
add r12,r12,r8
sw 1176(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r9,1176(r14)
lw r12,1168(r14)
add r12,r12,r9
sw 1180(r14),r12
% end var offset calculation
%begin dot offsetting
lw r9,1180(r14)
addi r9,r9,0
sw 1184(r14),r9
%end dot offsetting
% begin intlit storeage
addi r9,r0,3
sw 1188(r14), r9
% done intlit storeage
% begin generating indice offseting
addi r9,r0,1
addi r12,r0,0
lw r11,1188(r14)
muli r8,r9,4
mul r8,r11,r8
add r12,r12,r8
sw 1192(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r11,1192(r14)
lw r12,1184(r14)
add r12,r12,r11
sw 1196(r14),r12
% end var offset calculation
% begin write 
lw r11,1196(r14)
add r11,r14,r11
lw r11,0(r11)
%s move ptr to prevent mem corruption
addi r14,r14,1280
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
addi r14,r14,-1280
% end write
hlt
%funcdef begin
fnbossmutateTerm1
sw 4(r14),r15
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 100(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,88
lw r9,100(r14)
 add r12,r12,r9
sw 104(r14),r12
% end var offset calculation
% begin generating indice offseting
addi r9,r0,1
addi r12,r0,0
lw r11,104(r14)
add r11,r14,r11
lw r11,0(r11)
muli r8,r9,20
mul r8,r11,r8
add r12,r12,r8
sw 108(r14),r12
% done generating indice offseting
% begin var offset calculation
addi r12,r0,8
lw r11,108(r14)
 add r12,r12,r11
sw 112(r14),r12
% end var offset calculation
%begin dot offsetting
lw r11,112(r14)
sw 116(r14),r11
%end dot offsetting
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 120(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,92
lw r9,120(r14)
 add r12,r12,r9
sw 124(r14),r12
% end var offset calculation
% begin generating indice offseting
addi r9,r0,1
addi r12,r0,0
sw 128(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,96
lw r11,128(r14)
 add r12,r12,r11
sw 132(r14),r12
% end var offset calculation
%check if size is zero if yes, leave
addi r10,r0,20
bz r10,endCopy52

%set left and right ptrs
%set ptr
lw r12,116(r14)
add r12,r14,r12
addi r12,r12,0
%read direct value
add r11,r0,r14
addi r11,r11,152
%set position counter
mul r8,r0,r0
beginCopy52
%move data via register
lw r9,0(r12)
sw 0(r11),r9
%increment registers
addi r12,r12,4
addi r11,r11,4
addi r8,r8,4
%branch out if done
subi r10,r8,20
bnz r10,beginCopy52

endCopy52
% end copy 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy53

%set left and right ptrs
%set ptr
lw r10,124(r14)
add r10,r14,r10
addi r10,r10,0
%read direct value
add r8,r0,r14
addi r8,r8,172
%set position counter
mul r12,r0,r0
beginCopy53
%move data via register
lw r9,0(r10)
sw 0(r8),r9
%increment registers
addi r10,r10,4
addi r8,r8,4
addi r12,r12,4
%branch out if done
subi r11,r12,4
bnz r11,beginCopy53

endCopy53
% end copy 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy54

%set left and right ptrs
%set ptr
lw r11,132(r14)
add r11,r14,r11
addi r11,r11,0
%read direct value
add r12,r0,r14
addi r12,r12,176
%set position counter
mul r10,r0,r0
beginCopy54
%move data via register
lw r9,0(r11)
sw 0(r12),r9
%increment registers
addi r11,r11,4
addi r12,r12,4
addi r10,r10,4
%branch out if done
subi r8,r10,4
bnz r8,beginCopy54

endCopy54
% end copy 
addi r14,r14,144
jl r15, fntermsmutateRun1
subi r14,r14,144
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy55

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,144
%read direct value
add r10,r0,r14
addi r10,r10,136
%set position counter
mul r11,r0,r0
beginCopy55
%move data via register
lw r9,0(r8)
sw 0(r10),r9
%increment registers
addi r8,r8,4
addi r10,r10,4
addi r11,r11,4
%branch out if done
subi r12,r11,4
bnz r12,beginCopy55

endCopy55
% end copy 
%begin copy back object
%check if size is zero if yes, leave
addi r10,r0,20
bz r10,endCopy56

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,152
%set ptr
lw r11,116(r14)
add r11,r14,r11
addi r11,r11,0
%set position counter
mul r8,r0,r0
beginCopy56
%move data via register
lw r9,0(r12)
sw 0(r11),r9
%increment registers
addi r12,r12,4
addi r11,r11,4
addi r8,r8,4
%branch out if done
subi r10,r8,20
bnz r10,beginCopy56

endCopy56
% end copy 
% begin intlit storeage
addi r8,r0,0
sw 140(r14), r8
% done intlit storeage
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy57

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,140
%read direct value
add r8,r0,r14
addi r8,r8,0
%set position counter
mul r12,r0,r0
beginCopy57
%move data via register
lw r9,0(r10)
sw 0(r8),r9
%increment registers
addi r10,r10,4
addi r8,r8,4
addi r12,r12,4
%branch out if done
subi r11,r12,4
bnz r11,beginCopy57

endCopy57
% end copy 
lw r15,4(r14)
jr r15 
%funcdef end
%funcdef begin
fntermsmutateRun1
sw 4(r14),r15
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 36(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,28
lw r9,36(r14)
 add r11,r11,r9
sw 40(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r9,r0,1
addi r11,r0,0
lw r12,40(r14)
add r12,r14,r12
lw r12,0(r12)
muli r10,r9,4
mul r10,r12,r10
add r11,r11,r10
sw 44(r14),r11
% done generating indice offseting
% begin var offset calculation
addi r11,r0,8
lw r12,44(r14)
 add r11,r11,r12
sw 48(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 52(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,32
lw r9,52(r14)
 add r11,r11,r9
sw 56(r14),r11
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy58

%set left and right ptrs
%set ptr
lw r11,56(r14)
add r11,r14,r11
lw r9,48(r14)
add r9,r14,r9
%set position counter
mul r10,r0,r0
beginCopy58
%move data via register
lw r12,0(r11)
sw 0(r9),r12
%increment registers
addi r11,r11,4
addi r9,r9,4
addi r10,r10,4
%branch out if done
subi r8,r10,4
bnz r8,beginCopy58

endCopy58
% end assignment 
% begin intlit storeage
addi r10,r0,0
sw 60(r14), r10
% done intlit storeage
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy59

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,60
%read direct value
add r10,r0,r14
addi r10,r10,0
%set position counter
mul r11,r0,r0
beginCopy59
%move data via register
lw r12,0(r8)
sw 0(r10),r12
%increment registers
addi r8,r8,4
addi r10,r10,4
addi r11,r11,4
%branch out if done
subi r9,r11,4
bnz r9,beginCopy59

endCopy59
% end copy 
lw r15,4(r14)
jr r15 
%funcdef end
%funcdef begin
fnmanmutateH1
sw 4(r14),r15
% begin generating indice offseting
addi r11,r0,1
addi r9,r0,0
sw 384(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,12
lw r12,384(r14)
 add r9,r9,r12
sw 388(r14),r9
% end var offset calculation
% begin generating indice offseting
addi r12,r0,1
addi r9,r0,0
sw 392(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,380
lw r11,392(r14)
 add r9,r9,r11
sw 396(r14),r9
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy60

%set left and right ptrs
%set ptr
lw r9,396(r14)
add r9,r14,r9
lw r11,388(r14)
add r11,r14,r11
%set position counter
mul r8,r0,r0
beginCopy60
%move data via register
lw r12,0(r9)
sw 0(r11),r12
%increment registers
addi r9,r9,4
addi r11,r11,4
addi r8,r8,4
%branch out if done
subi r10,r8,4
bnz r10,beginCopy60

endCopy60
% end assignment 
% begin generating indice offseting
addi r8,r0,1
addi r10,r0,0
sw 400(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,12
lw r12,400(r14)
 add r10,r10,r12
sw 404(r14),r10
% end var offset calculation
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy61

%set left and right ptrs
%set ptr
lw r10,404(r14)
add r10,r14,r10
addi r10,r10,0
%read direct value
add r12,r0,r14
addi r12,r12,0
%set position counter
mul r9,r0,r0
beginCopy61
%move data via register
lw r8,0(r10)
sw 0(r12),r8
%increment registers
addi r10,r10,4
addi r12,r12,4
addi r9,r9,4
%branch out if done
subi r11,r9,4
bnz r11,beginCopy61

endCopy61
% end copy 
lw r15,4(r14)
jr r15 
%funcdef end
%funcdef begin
fnmanmutateX1
sw 4(r14),r15
% begin generating indice offseting
addi r9,r0,1
addi r11,r0,0
sw 384(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,8
lw r8,384(r14)
 add r11,r11,r8
sw 388(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r8,r0,1
addi r11,r0,0
sw 392(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,380
lw r9,392(r14)
 add r11,r11,r9
sw 396(r14),r11
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy62

%set left and right ptrs
%set ptr
lw r11,396(r14)
add r11,r14,r11
lw r9,388(r14)
add r9,r14,r9
%set position counter
mul r10,r0,r0
beginCopy62
%move data via register
lw r8,0(r11)
sw 0(r9),r8
%increment registers
addi r11,r11,4
addi r9,r9,4
addi r10,r10,4
%branch out if done
subi r12,r10,4
bnz r12,beginCopy62

endCopy62
% end assignment 
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
sw 400(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,8
lw r8,400(r14)
 add r12,r12,r8
sw 404(r14),r12
% end var offset calculation
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy63

%set left and right ptrs
%set ptr
lw r12,404(r14)
add r12,r14,r12
addi r12,r12,0
%read direct value
add r8,r0,r14
addi r8,r8,0
%set position counter
mul r11,r0,r0
beginCopy63
%move data via register
lw r10,0(r12)
sw 0(r8),r10
%increment registers
addi r12,r12,4
addi r8,r8,4
addi r11,r11,4
%branch out if done
subi r9,r11,4
bnz r9,beginCopy63

endCopy63
% end copy 
lw r15,4(r14)
jr r15 
%funcdef end
%funcdef begin
fnmanmutateAmount1
sw 4(r14),r15
% begin generating indice offseting
addi r11,r0,1
addi r9,r0,0
sw 392(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,388
lw r10,392(r14)
 add r9,r9,r10
sw 396(r14),r9
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
sw 400(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,380
lw r11,400(r14)
 add r9,r9,r11
sw 404(r14),r9
% end var offset calculation
% begin generating indice offseting
addi r11,r0,1
addi r9,r0,0
lw r10,404(r14)
add r10,r14,r10
lw r10,0(r10)
muli r12,r11,4
mul r12,r10,r12
add r9,r9,r12
sw 408(r14),r9
% done generating indice offseting
% begin var offset calculation
addi r9,r0,16
lw r10,408(r14)
 add r9,r9,r10
sw 412(r14),r9
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy64

%set left and right ptrs
%set ptr
lw r9,412(r14)
add r9,r14,r9
lw r10,396(r14)
add r10,r14,r10
%set position counter
mul r12,r0,r0
beginCopy64
%move data via register
lw r11,0(r9)
sw 0(r10),r11
%increment registers
addi r9,r9,4
addi r10,r10,4
addi r12,r12,4
%branch out if done
subi r8,r12,4
bnz r8,beginCopy64

endCopy64
% end assignment 
% begin generating indice offseting
addi r12,r0,1
addi r8,r0,0
sw 416(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,380
lw r11,416(r14)
 add r8,r8,r11
sw 420(r14),r8
% end var offset calculation
% begin generating indice offseting
addi r11,r0,1
addi r8,r0,0
lw r12,420(r14)
add r12,r14,r12
lw r12,0(r12)
muli r9,r11,4
mul r9,r12,r9
add r8,r8,r9
sw 424(r14),r8
% done generating indice offseting
% begin var offset calculation
addi r8,r0,16
lw r12,424(r14)
 add r8,r8,r12
sw 428(r14),r8
% end var offset calculation
% begin generating indice offseting
addi r12,r0,1
addi r8,r0,0
sw 432(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,384
lw r11,432(r14)
 add r8,r8,r11
sw 436(r14),r8
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy65

%set left and right ptrs
%set ptr
lw r8,436(r14)
add r8,r14,r8
lw r11,428(r14)
add r11,r14,r11
%set position counter
mul r9,r0,r0
beginCopy65
%move data via register
lw r12,0(r8)
sw 0(r11),r12
%increment registers
addi r8,r8,4
addi r11,r11,4
addi r9,r9,4
%branch out if done
subi r10,r9,4
bnz r10,beginCopy65

endCopy65
% end assignment 
% begin generating indice offseting
addi r9,r0,1
addi r10,r0,0
sw 440(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,388
lw r12,440(r14)
 add r10,r10,r12
sw 444(r14),r10
% end var offset calculation
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy66

%set left and right ptrs
%set ptr
lw r10,444(r14)
add r10,r14,r10
addi r10,r10,0
%read direct value
add r12,r0,r14
addi r12,r12,0
%set position counter
mul r8,r0,r0
beginCopy66
%move data via register
lw r9,0(r10)
sw 0(r12),r9
%increment registers
addi r10,r10,4
addi r12,r12,4
addi r8,r8,4
%branch out if done
subi r11,r8,4
bnz r11,beginCopy66

endCopy66
% end copy 
lw r15,4(r14)
jr r15 
%funcdef end
%funcdef begin
fnfanmutatefan1
sw 4(r14),r15
% begin generating indice offseting
addi r8,r0,1
addi r11,r0,0
sw 36(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,32
lw r9,36(r14)
 add r11,r11,r9
sw 40(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r9,r0,1
addi r11,r0,0
sw 44(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,24
lw r8,44(r14)
 add r11,r11,r8
sw 48(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r8,r0,1
addi r11,r0,0
lw r9,48(r14)
add r9,r14,r9
lw r9,0(r9)
muli r10,r8,4
mul r10,r9,r10
add r11,r11,r10
sw 52(r14),r11
% done generating indice offseting
% begin var offset calculation
addi r11,r0,8
lw r9,52(r14)
 add r11,r11,r9
sw 56(r14),r11
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy67

%set left and right ptrs
%set ptr
lw r11,56(r14)
add r11,r14,r11
lw r9,40(r14)
add r9,r14,r9
%set position counter
mul r10,r0,r0
beginCopy67
%move data via register
lw r8,0(r11)
sw 0(r9),r8
%increment registers
addi r11,r11,4
addi r9,r9,4
addi r10,r10,4
%branch out if done
subi r12,r10,4
bnz r12,beginCopy67

endCopy67
% end assignment 
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
sw 60(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,24
lw r8,60(r14)
 add r12,r12,r8
sw 64(r14),r12
% end var offset calculation
% begin generating indice offseting
addi r8,r0,1
addi r12,r0,0
lw r10,64(r14)
add r10,r14,r10
lw r10,0(r10)
muli r11,r8,4
mul r11,r10,r11
add r12,r12,r11
sw 68(r14),r12
% done generating indice offseting
% begin var offset calculation
addi r12,r0,8
lw r10,68(r14)
 add r12,r12,r10
sw 72(r14),r12
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
sw 76(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,28
lw r8,76(r14)
 add r12,r12,r8
sw 80(r14),r12
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy68

%set left and right ptrs
%set ptr
lw r12,80(r14)
add r12,r14,r12
lw r8,72(r14)
add r8,r14,r8
%set position counter
mul r11,r0,r0
beginCopy68
%move data via register
lw r10,0(r12)
sw 0(r8),r10
%increment registers
addi r12,r12,4
addi r8,r8,4
addi r11,r11,4
%branch out if done
subi r9,r11,4
bnz r9,beginCopy68

endCopy68
% end assignment 
% begin generating indice offseting
addi r11,r0,1
addi r9,r0,0
sw 84(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,32
lw r10,84(r14)
 add r9,r9,r10
sw 88(r14),r9
% end var offset calculation
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy69

%set left and right ptrs
%set ptr
lw r9,88(r14)
add r9,r14,r9
addi r9,r9,0
%read direct value
add r10,r0,r14
addi r10,r10,0
%set position counter
mul r12,r0,r0
beginCopy69
%move data via register
lw r11,0(r9)
sw 0(r10),r11
%increment registers
addi r9,r9,4
addi r10,r10,4
addi r12,r12,4
%branch out if done
subi r8,r12,4
bnz r8,beginCopy69

endCopy69
% end copy 
lw r15,4(r14)
jr r15 
%funcdef end
%funcdef begin
fnmanconstructor1
sw 372(r14),r15
% begin generating indice offseting
addi r12,r0,1
addi r8,r0,0
sw 768(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,396
lw r11,768(r14)
 add r8,r8,r11
sw 772(r14),r8
% end var offset calculation
%begin dot offsetting
lw r11,772(r14)
addi r11,r11,0
sw 776(r14),r11
%end dot offsetting
% begin generating indice offseting
addi r11,r0,1
addi r8,r0,0
sw 780(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r12,780(r14)
lw r8,776(r14)
add r8,r8,r12
sw 784(r14),r8
% end var offset calculation
% begin generating indice offseting
addi r12,r0,1
addi r8,r0,0
sw 788(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,376
lw r11,788(r14)
 add r8,r8,r11
sw 792(r14),r8
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy70

%set left and right ptrs
%set ptr
lw r8,792(r14)
add r8,r14,r8
lw r11,784(r14)
add r11,r14,r11
%set position counter
mul r9,r0,r0
beginCopy70
%move data via register
lw r12,0(r8)
sw 0(r11),r12
%increment registers
addi r8,r8,4
addi r11,r11,4
addi r9,r9,4
%branch out if done
subi r10,r9,4
bnz r10,beginCopy70

endCopy70
% end assignment 
% begin generating indice offseting
addi r9,r0,1
addi r10,r0,0
sw 796(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,396
lw r12,796(r14)
 add r10,r10,r12
sw 800(r14),r10
% end var offset calculation
%begin dot offsetting
lw r12,800(r14)
addi r12,r12,4
sw 804(r14),r12
%end dot offsetting
% begin generating indice offseting
addi r12,r0,1
addi r10,r0,0
sw 808(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r9,808(r14)
lw r10,804(r14)
add r10,r10,r9
sw 812(r14),r10
% end var offset calculation
% begin generating indice offseting
addi r9,r0,1
addi r10,r0,0
sw 816(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,380
lw r12,816(r14)
 add r10,r10,r12
sw 820(r14),r10
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy71

%set left and right ptrs
%set ptr
lw r10,820(r14)
add r10,r14,r10
lw r12,812(r14)
add r12,r14,r12
%set position counter
mul r8,r0,r0
beginCopy71
%move data via register
lw r9,0(r10)
sw 0(r12),r9
%increment registers
addi r10,r10,4
addi r12,r12,4
addi r8,r8,4
%branch out if done
subi r11,r8,4
bnz r11,beginCopy71

endCopy71
% end assignment 
% begin generating indice offseting
addi r8,r0,1
addi r11,r0,0
sw 824(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,396
lw r9,824(r14)
 add r11,r11,r9
sw 828(r14),r11
% end var offset calculation
%begin dot offsetting
lw r9,828(r14)
addi r9,r9,8
sw 832(r14),r9
%end dot offsetting
% begin intlit storeage
addi r9,r0,0
sw 836(r14), r9
% done intlit storeage
% begin generating indice offseting
addi r9,r0,1
addi r11,r0,0
lw r8,836(r14)
muli r10,r9,4
mul r10,r8,r10
add r11,r11,r10
sw 840(r14),r11
% done generating indice offseting
% begin var offset calculation
lw r8,840(r14)
lw r11,832(r14)
add r11,r11,r8
sw 844(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r8,r0,1
addi r11,r0,0
sw 848(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,384
lw r9,848(r14)
 add r11,r11,r9
sw 852(r14),r11
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy72

%set left and right ptrs
%set ptr
lw r11,852(r14)
add r11,r14,r11
lw r9,844(r14)
add r9,r14,r9
%set position counter
mul r10,r0,r0
beginCopy72
%move data via register
lw r8,0(r11)
sw 0(r9),r8
%increment registers
addi r11,r11,4
addi r9,r9,4
addi r10,r10,4
%branch out if done
subi r12,r10,4
bnz r12,beginCopy72

endCopy72
% end assignment 
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
sw 856(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,396
lw r8,856(r14)
 add r12,r12,r8
sw 860(r14),r12
% end var offset calculation
%begin dot offsetting
lw r8,860(r14)
addi r8,r8,8
sw 864(r14),r8
%end dot offsetting
% begin intlit storeage
addi r8,r0,1
sw 868(r14), r8
% done intlit storeage
% begin generating indice offseting
addi r8,r0,1
addi r12,r0,0
lw r10,868(r14)
muli r11,r8,4
mul r11,r10,r11
add r12,r12,r11
sw 872(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r10,872(r14)
lw r12,864(r14)
add r12,r12,r10
sw 876(r14),r12
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
sw 880(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,388
lw r8,880(r14)
 add r12,r12,r8
sw 884(r14),r12
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy73

%set left and right ptrs
%set ptr
lw r12,884(r14)
add r12,r14,r12
lw r8,876(r14)
add r8,r14,r8
%set position counter
mul r11,r0,r0
beginCopy73
%move data via register
lw r10,0(r12)
sw 0(r8),r10
%increment registers
addi r12,r12,4
addi r8,r8,4
addi r11,r11,4
%branch out if done
subi r9,r11,4
bnz r9,beginCopy73

endCopy73
% end assignment 
% begin generating indice offseting
addi r11,r0,1
addi r9,r0,0
sw 888(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,396
lw r10,888(r14)
 add r9,r9,r10
sw 892(r14),r9
% end var offset calculation
%begin dot offsetting
lw r10,892(r14)
addi r10,r10,8
sw 896(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,2
sw 900(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
lw r11,900(r14)
muli r12,r10,4
mul r12,r11,r12
add r9,r9,r12
sw 904(r14),r9
% done generating indice offseting
% begin var offset calculation
lw r11,904(r14)
lw r9,896(r14)
add r9,r9,r11
sw 908(r14),r9
% end var offset calculation
% begin generating indice offseting
addi r11,r0,1
addi r9,r0,0
sw 912(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,392
lw r10,912(r14)
 add r9,r9,r10
sw 916(r14),r9
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy74

%set left and right ptrs
%set ptr
lw r9,916(r14)
add r9,r14,r9
lw r10,908(r14)
add r10,r14,r10
%set position counter
mul r12,r0,r0
beginCopy74
%move data via register
lw r11,0(r9)
sw 0(r10),r11
%increment registers
addi r9,r9,4
addi r10,r10,4
addi r12,r12,4
%branch out if done
subi r8,r12,4
bnz r8,beginCopy74

endCopy74
% end assignment 
% begin generating indice offseting
addi r12,r0,1
addi r8,r0,0
sw 920(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,396
lw r11,920(r14)
 add r8,r8,r11
sw 924(r14),r8
% end var offset calculation
%begin dot offsetting
lw r11,924(r14)
addi r11,r11,8
sw 928(r14),r11
%end dot offsetting
% begin intlit storeage
addi r11,r0,3
sw 932(r14), r11
% done intlit storeage
% begin generating indice offseting
addi r11,r0,1
addi r8,r0,0
lw r12,932(r14)
muli r9,r11,4
mul r9,r12,r9
add r8,r8,r9
sw 936(r14),r8
% done generating indice offseting
% begin var offset calculation
lw r12,936(r14)
lw r8,928(r14)
add r8,r8,r12
sw 940(r14),r8
% end var offset calculation
% begin generating indice offseting
addi r12,r0,1
addi r8,r0,0
sw 944(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,392
lw r11,944(r14)
 add r8,r8,r11
sw 948(r14),r8
% end var offset calculation
% begin intlit storeage
addi r11,r0,10
sw 952(r14), r11
% done intlit storeage
% begin add op 
lw r9,948(r14)
add r9,r14,r9
lw r11,0(r9)
lw r8,952(r14)
add r12,r11,r8
sw 956(r14),r12
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy75

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,956
lw r9,940(r14)
add r9,r14,r9
%set position counter
mul r11,r0,r0
beginCopy75
%move data via register
lw r8,0(r12)
sw 0(r9),r8
%increment registers
addi r12,r12,4
addi r9,r9,4
addi r11,r11,4
%branch out if done
subi r10,r11,4
bnz r10,beginCopy75

endCopy75
% end assignment 
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
sw 960(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,396
lw r8,960(r14)
 add r10,r10,r8
sw 964(r14),r10
% end var offset calculation
%begin dot offsetting
lw r8,964(r14)
addi r8,r8,8
sw 968(r14),r8
%end dot offsetting
% begin intlit storeage
addi r8,r0,4
sw 972(r14), r8
% done intlit storeage
% begin generating indice offseting
addi r8,r0,1
addi r10,r0,0
lw r11,972(r14)
muli r12,r8,4
mul r12,r11,r12
add r10,r10,r12
sw 976(r14),r10
% done generating indice offseting
% begin var offset calculation
lw r11,976(r14)
lw r10,968(r14)
add r10,r10,r11
sw 980(r14),r10
% end var offset calculation
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
sw 984(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,392
lw r8,984(r14)
 add r10,r10,r8
sw 988(r14),r10
% end var offset calculation
% begin intlit storeage
addi r8,r0,20
sw 992(r14), r8
% done intlit storeage
% begin add op 
lw r12,988(r14)
add r12,r14,r12
lw r8,0(r12)
lw r10,992(r14)
add r11,r8,r10
sw 996(r14),r11
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy76

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,996
lw r12,980(r14)
add r12,r14,r12
%set position counter
mul r8,r0,r0
beginCopy76
%move data via register
lw r10,0(r11)
sw 0(r12),r10
%increment registers
addi r11,r11,4
addi r12,r12,4
addi r8,r8,4
%branch out if done
subi r9,r8,4
bnz r9,beginCopy76

endCopy76
% end assignment 
% begin generating indice offseting
addi r8,r0,1
addi r9,r0,0
sw 1000(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,396
lw r10,1000(r14)
 add r9,r9,r10
sw 1004(r14),r9
% end var offset calculation
%check if size is zero if yes, leave
addi r12,r0,372
bz r12,endCopy77

%set left and right ptrs
%set ptr
lw r9,1004(r14)
add r9,r14,r9
addi r9,r9,0
%read direct value
add r10,r0,r14
addi r10,r10,0
%set position counter
mul r11,r0,r0
beginCopy77
%move data via register
lw r8,0(r9)
sw 0(r10),r8
%increment registers
addi r9,r9,4
addi r10,r10,4
addi r11,r11,4
%branch out if done
subi r12,r11,372
bnz r12,beginCopy77

endCopy77
% end copy 
lw r15,372(r14)
jr r15 
%funcdef end
