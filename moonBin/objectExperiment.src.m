buffer               res     200
stackbase            res     2048
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
sw 420(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r10,420(r14)
 add r11,r11,r10
sw 424(r14),r11
% end var offset calculation
% begin intlit storeage
addi r10,r0,100
sw 428(r14), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,200
sw 432(r14), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,100
sw 436(r14), r10
% done intlit storeage
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy1

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,428
%read direct value
add r10,r0,r14
addi r10,r10,1104
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
% end copy 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy2

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,432
%read direct value
add r9,r0,r14
addi r9,r9,1108
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
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy3

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,436
%read direct value
add r11,r0,r14
addi r11,r11,1112
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
subi r9,r8,4
bnz r9,beginCopy3

endCopy3
% end copy 
addi r14,r14,892
jl r15, fnfunc1
subi r14,r14,892
%check if size is zero if yes, leave
addi r11,r0,208
bz r11,endCopy4

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,892
%read direct value
add r8,r0,r14
addi r8,r8,440
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
subi r11,r10,208
bnz r11,beginCopy4

endCopy4
% end copy 
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,208
bz r8,endCopy5

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,440
lw r10,424(r14)
add r10,r14,r10
%set position counter
mul r9,r0,r0
beginCopy5
%move data via register
lw r12,0(r11)
sw 0(r10),r12
%increment registers
addi r11,r11,4
addi r10,r10,4
addi r9,r9,4
%branch out if done
subi r8,r9,208
bnz r8,beginCopy5

endCopy5
% end assignment 
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
sw 648(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,212
lw r12,648(r14)
 add r8,r8,r12
sw 652(r14),r8
% end var offset calculation
% begin intlit storeage
addi r12,r0,500
sw 656(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,300
sw 660(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,100
sw 664(r14), r12
% done intlit storeage
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy6

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,656
%read direct value
add r12,r0,r14
addi r12,r12,1104
%set position counter
mul r11,r0,r0
beginCopy6
%move data via register
lw r9,0(r8)
sw 0(r12),r9
%increment registers
addi r8,r8,4
addi r12,r12,4
addi r11,r11,4
%branch out if done
subi r10,r11,4
bnz r10,beginCopy6

endCopy6
% end copy 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy7

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,660
%read direct value
add r11,r0,r14
addi r11,r11,1108
%set position counter
mul r8,r0,r0
beginCopy7
%move data via register
lw r9,0(r10)
sw 0(r11),r9
%increment registers
addi r10,r10,4
addi r11,r11,4
addi r8,r8,4
%branch out if done
subi r12,r8,4
bnz r12,beginCopy7

endCopy7
% end copy 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy8

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,664
%read direct value
add r8,r0,r14
addi r8,r8,1112
%set position counter
mul r10,r0,r0
beginCopy8
%move data via register
lw r9,0(r12)
sw 0(r8),r9
%increment registers
addi r12,r12,4
addi r8,r8,4
addi r10,r10,4
%branch out if done
subi r11,r10,4
bnz r11,beginCopy8

endCopy8
% end copy 
addi r14,r14,892
jl r15, fnfunc1
subi r14,r14,892
%check if size is zero if yes, leave
addi r8,r0,208
bz r8,endCopy9

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,892
%read direct value
add r10,r0,r14
addi r10,r10,668
%set position counter
mul r12,r0,r0
beginCopy9
%move data via register
lw r9,0(r11)
sw 0(r10),r9
%increment registers
addi r11,r11,4
addi r10,r10,4
addi r12,r12,4
%branch out if done
subi r8,r12,208
bnz r8,beginCopy9

endCopy9
% end copy 
% begin assignment 
%check if size is zero if yes, leave
addi r10,r0,208
bz r10,endCopy10

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,668
lw r12,652(r14)
add r12,r14,r12
%set position counter
mul r11,r0,r0
beginCopy10
%move data via register
lw r9,0(r8)
sw 0(r12),r9
%increment registers
addi r8,r8,4
addi r12,r12,4
addi r11,r11,4
%branch out if done
subi r10,r11,208
bnz r10,beginCopy10

endCopy10
% end assignment 
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
sw 876(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,4
lw r9,876(r14)
 add r10,r10,r9
sw 880(r14),r10
% end var offset calculation
%check if size is zero if yes, leave
addi r12,r0,208
bz r12,endCopy11

%set left and right ptrs
%set ptr
lw r10,880(r14)
add r10,r14,r10
%read direct value
add r9,r0,r14
addi r9,r9,896
%set position counter
mul r8,r0,r0
beginCopy11
%move data via register
lw r11,0(r10)
sw 0(r9),r11
%increment registers
addi r10,r10,4
addi r9,r9,4
addi r8,r8,4
%branch out if done
subi r12,r8,208
bnz r12,beginCopy11

endCopy11
% end copy 
addi r14,r14,892
jl r15, fnprintman1
subi r14,r14,892
%check if size is zero if yes, leave
addi r9,r0,0
bz r9,endCopy12

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,892
%read direct value
add r8,r0,r14
addi r8,r8,884
%set position counter
mul r10,r0,r0
beginCopy12
%move data via register
lw r11,0(r12)
sw 0(r8),r11
%increment registers
addi r12,r12,4
addi r8,r8,4
addi r10,r10,4
%branch out if done
subi r9,r10,0
bnz r9,beginCopy12

endCopy12
% end copy 
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
sw 884(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,212
lw r11,884(r14)
 add r9,r9,r11
sw 888(r14),r9
% end var offset calculation
%check if size is zero if yes, leave
addi r8,r0,208
bz r8,endCopy13

%set left and right ptrs
%set ptr
lw r9,888(r14)
add r9,r14,r9
%read direct value
add r11,r0,r14
addi r11,r11,896
%set position counter
mul r12,r0,r0
beginCopy13
%move data via register
lw r10,0(r9)
sw 0(r11),r10
%increment registers
addi r9,r9,4
addi r11,r11,4
addi r12,r12,4
%branch out if done
subi r8,r12,208
bnz r8,beginCopy13

endCopy13
% end copy 
addi r14,r14,892
jl r15, fnprintman1
subi r14,r14,892
%check if size is zero if yes, leave
addi r11,r0,0
bz r11,endCopy14

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,892
%read direct value
add r12,r0,r14
addi r12,r12,892
%set position counter
mul r9,r0,r0
beginCopy14
%move data via register
lw r10,0(r8)
sw 0(r12),r10
%increment registers
addi r8,r8,4
addi r12,r12,4
addi r9,r9,4
%branch out if done
subi r11,r9,0
bnz r11,beginCopy14

endCopy14
% end copy 
hlt
%funcdef begin
fnfunc1
sw 208(r14),r15
% begin generating indice offseting
addi r9,r0,1
addi r11,r0,0
sw 432(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,224
lw r10,432(r14)
 add r11,r11,r10
sw 436(r14),r11
% end var offset calculation
%begin dot offsetting
lw r10,436(r14)
addi r10,r10,0
sw 440(r14),r10
%end dot offsetting
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
sw 444(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r9,444(r14)
lw r11,440(r14)
add r11,r11,r9
sw 448(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r9,r0,1
addi r11,r0,0
sw 452(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,212
lw r10,452(r14)
 add r11,r11,r10
sw 456(r14),r11
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy15

%set left and right ptrs
%set ptr
lw r11,456(r14)
add r11,r14,r11
lw r10,448(r14)
add r10,r14,r10
%set position counter
mul r8,r0,r0
beginCopy15
%move data via register
lw r9,0(r11)
sw 0(r10),r9
%increment registers
addi r11,r11,4
addi r10,r10,4
addi r8,r8,4
%branch out if done
subi r12,r8,4
bnz r12,beginCopy15

endCopy15
% end assignment 
% begin generating indice offseting
addi r8,r0,1
addi r12,r0,0
sw 460(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,224
lw r9,460(r14)
 add r12,r12,r9
sw 464(r14),r12
% end var offset calculation
%begin dot offsetting
lw r9,464(r14)
addi r9,r9,4
sw 468(r14),r9
%end dot offsetting
% begin intlit storeage
addi r9,r0,0
sw 472(r14), r9
% done intlit storeage
% begin intlit storeage
addi r9,r0,0
sw 476(r14), r9
% done intlit storeage
% begin generating indice offseting
addi r9,r0,1
addi r12,r0,0
lw r8,476(r14)
muli r11,r9,4
mul r11,r8,r11
add r12,r12,r11
lw r8,472(r14)
muli r11,r9,4
mul r11,r8,r11
muli r11,r11,10
add r12,r12,r11
sw 480(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r8,480(r14)
lw r12,468(r14)
add r12,r12,r8
sw 484(r14),r12
% end var offset calculation
% begin generating indice offseting
addi r8,r0,1
addi r12,r0,0
sw 488(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,220
lw r9,488(r14)
 add r12,r12,r9
sw 492(r14),r12
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy16

%set left and right ptrs
%set ptr
lw r12,492(r14)
add r12,r14,r12
lw r9,484(r14)
add r9,r14,r9
%set position counter
mul r11,r0,r0
beginCopy16
%move data via register
lw r8,0(r12)
sw 0(r9),r8
%increment registers
addi r12,r12,4
addi r9,r9,4
addi r11,r11,4
%branch out if done
subi r10,r11,4
bnz r10,beginCopy16

endCopy16
% end assignment 
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
sw 496(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,224
lw r8,496(r14)
 add r10,r10,r8
sw 500(r14),r10
% end var offset calculation
%begin dot offsetting
lw r8,500(r14)
addi r8,r8,4
sw 504(r14),r8
%end dot offsetting
% begin intlit storeage
addi r8,r0,4
sw 508(r14), r8
% done intlit storeage
% begin intlit storeage
addi r8,r0,5
sw 512(r14), r8
% done intlit storeage
% begin generating indice offseting
addi r8,r0,1
addi r10,r0,0
lw r11,512(r14)
muli r12,r8,4
mul r12,r11,r12
add r10,r10,r12
lw r11,508(r14)
muli r12,r8,4
mul r12,r11,r12
muli r12,r12,10
add r10,r10,r12
sw 516(r14),r10
% done generating indice offseting
% begin var offset calculation
lw r11,516(r14)
lw r10,504(r14)
add r10,r10,r11
sw 520(r14),r10
% end var offset calculation
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
sw 524(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,220
lw r8,524(r14)
 add r10,r10,r8
sw 528(r14),r10
% end var offset calculation
% begin intlit storeage
addi r8,r0,20
sw 532(r14), r8
% done intlit storeage
% begin add op 
lw r12,528(r14)
add r12,r14,r12
lw r8,0(r12)
lw r10,532(r14)
add r11,r8,r10
sw 536(r14),r11
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy17

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,536
lw r12,520(r14)
add r12,r14,r12
%set position counter
mul r8,r0,r0
beginCopy17
%move data via register
lw r10,0(r11)
sw 0(r12),r10
%increment registers
addi r11,r11,4
addi r12,r12,4
addi r8,r8,4
%branch out if done
subi r9,r8,4
bnz r9,beginCopy17

endCopy17
% end assignment 
% begin generating indice offseting
addi r8,r0,1
addi r9,r0,0
sw 540(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,224
lw r10,540(r14)
 add r9,r9,r10
sw 544(r14),r9
% end var offset calculation
%begin dot offsetting
lw r10,544(r14)
addi r10,r10,4
sw 548(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,4
sw 552(r14), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,9
sw 556(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
lw r8,556(r14)
muli r11,r10,4
mul r11,r8,r11
add r9,r9,r11
lw r8,552(r14)
muli r11,r10,4
mul r11,r8,r11
muli r11,r11,10
add r9,r9,r11
sw 560(r14),r9
% done generating indice offseting
% begin var offset calculation
lw r8,560(r14)
lw r9,548(r14)
add r9,r9,r8
sw 564(r14),r9
% end var offset calculation
% begin generating indice offseting
addi r8,r0,1
addi r9,r0,0
sw 568(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,220
lw r10,568(r14)
 add r9,r9,r10
sw 572(r14),r9
% end var offset calculation
% begin intlit storeage
addi r10,r0,30
sw 576(r14), r10
% done intlit storeage
% begin add op 
lw r11,572(r14)
add r11,r14,r11
lw r10,0(r11)
lw r9,576(r14)
add r8,r10,r9
sw 580(r14),r8
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy18

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,580
lw r11,564(r14)
add r11,r14,r11
%set position counter
mul r10,r0,r0
beginCopy18
%move data via register
lw r9,0(r8)
sw 0(r11),r9
%increment registers
addi r8,r8,4
addi r11,r11,4
addi r10,r10,4
%branch out if done
subi r12,r10,4
bnz r12,beginCopy18

endCopy18
% end assignment 
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
sw 584(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,224
lw r9,584(r14)
 add r12,r12,r9
sw 588(r14),r12
% end var offset calculation
%begin dot offsetting
lw r9,588(r14)
addi r9,r9,204
sw 592(r14),r9
%end dot offsetting
% begin generating indice offseting
addi r9,r0,1
addi r12,r0,0
sw 596(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r10,596(r14)
lw r12,592(r14)
add r12,r12,r10
sw 600(r14),r12
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
sw 604(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,216
lw r9,604(r14)
 add r12,r12,r9
sw 608(r14),r12
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy19

%set left and right ptrs
%set ptr
lw r12,608(r14)
add r12,r14,r12
lw r9,600(r14)
add r9,r14,r9
%set position counter
mul r8,r0,r0
beginCopy19
%move data via register
lw r10,0(r12)
sw 0(r9),r10
%increment registers
addi r12,r12,4
addi r9,r9,4
addi r8,r8,4
%branch out if done
subi r11,r8,4
bnz r11,beginCopy19

endCopy19
% end assignment 
% begin generating indice offseting
addi r8,r0,1
addi r11,r0,0
sw 612(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,224
lw r10,612(r14)
 add r11,r11,r10
sw 616(r14),r11
% end var offset calculation
%check if size is zero if yes, leave
addi r9,r0,208
bz r9,endCopy20

%set left and right ptrs
%set ptr
lw r11,616(r14)
add r11,r14,r11
%read direct value
add r10,r0,r14
addi r10,r10,0
%set position counter
mul r12,r0,r0
beginCopy20
%move data via register
lw r8,0(r11)
sw 0(r10),r8
%increment registers
addi r11,r11,4
addi r10,r10,4
addi r12,r12,4
%branch out if done
subi r9,r12,208
bnz r9,beginCopy20

endCopy20
% end copy 
lw r15,208(r14)
jr r15 
%funcdef end
%funcdef begin
fnprintman1
sw 0(r14),r15
% begin generating indice offseting
addi r12,r0,1
addi r9,r0,0
sw 212(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,4
lw r8,212(r14)
 add r9,r9,r8
sw 216(r14),r9
% end var offset calculation
%begin dot offsetting
lw r8,216(r14)
addi r8,r8,0
sw 220(r14),r8
%end dot offsetting
% begin generating indice offseting
addi r8,r0,1
addi r9,r0,0
sw 224(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r12,224(r14)
lw r9,220(r14)
add r9,r9,r12
sw 228(r14),r9
% end var offset calculation
% begin write 
lw r12,228(r14)
add r12,r14,r12
lw r12,0(r12)
%s move ptr to prevent mem corruption
addi r14,r14,416
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
addi r14,r14,-416
% end write
% begin generating indice offseting
addi r12,r0,1
addi r9,r0,0
sw 232(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,4
lw r8,232(r14)
 add r9,r9,r8
sw 236(r14),r9
% end var offset calculation
%begin dot offsetting
lw r8,236(r14)
addi r8,r8,204
sw 240(r14),r8
%end dot offsetting
% begin generating indice offseting
addi r8,r0,1
addi r9,r0,0
sw 244(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r12,244(r14)
lw r9,240(r14)
add r9,r9,r12
sw 248(r14),r9
% end var offset calculation
% begin write 
lw r12,248(r14)
add r12,r14,r12
lw r12,0(r12)
%s move ptr to prevent mem corruption
addi r14,r14,416
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
addi r14,r14,-416
% end write
% begin generating indice offseting
addi r12,r0,1
addi r9,r0,0
sw 252(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,4
lw r8,252(r14)
 add r9,r9,r8
sw 256(r14),r9
% end var offset calculation
%begin dot offsetting
lw r8,256(r14)
addi r8,r8,4
sw 260(r14),r8
%end dot offsetting
% begin intlit storeage
addi r8,r0,0
sw 264(r14), r8
% done intlit storeage
% begin intlit storeage
addi r8,r0,0
sw 268(r14), r8
% done intlit storeage
% begin generating indice offseting
addi r8,r0,1
addi r9,r0,0
lw r12,268(r14)
muli r11,r8,4
mul r11,r12,r11
add r9,r9,r11
lw r12,264(r14)
muli r11,r8,4
mul r11,r12,r11
muli r11,r11,10
add r9,r9,r11
sw 272(r14),r9
% done generating indice offseting
% begin var offset calculation
lw r12,272(r14)
lw r9,260(r14)
add r9,r9,r12
sw 276(r14),r9
% end var offset calculation
% begin write 
lw r12,276(r14)
add r12,r14,r12
lw r12,0(r12)
%s move ptr to prevent mem corruption
addi r14,r14,416
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
addi r14,r14,-416
% end write
% begin generating indice offseting
addi r12,r0,1
addi r9,r0,0
sw 280(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,4
lw r8,280(r14)
 add r9,r9,r8
sw 284(r14),r9
% end var offset calculation
%begin dot offsetting
lw r8,284(r14)
addi r8,r8,4
sw 288(r14),r8
%end dot offsetting
% begin intlit storeage
addi r8,r0,4
sw 292(r14), r8
% done intlit storeage
% begin intlit storeage
addi r8,r0,5
sw 296(r14), r8
% done intlit storeage
% begin generating indice offseting
addi r8,r0,1
addi r9,r0,0
lw r12,296(r14)
muli r11,r8,4
mul r11,r12,r11
add r9,r9,r11
lw r12,292(r14)
muli r11,r8,4
mul r11,r12,r11
muli r11,r11,10
add r9,r9,r11
sw 300(r14),r9
% done generating indice offseting
% begin var offset calculation
lw r12,300(r14)
lw r9,288(r14)
add r9,r9,r12
sw 304(r14),r9
% end var offset calculation
% begin write 
lw r12,304(r14)
add r12,r14,r12
lw r12,0(r12)
%s move ptr to prevent mem corruption
addi r14,r14,416
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
addi r14,r14,-416
% end write
% begin generating indice offseting
addi r12,r0,1
addi r9,r0,0
sw 308(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,4
lw r8,308(r14)
 add r9,r9,r8
sw 312(r14),r9
% end var offset calculation
%begin dot offsetting
lw r8,312(r14)
addi r8,r8,4
sw 316(r14),r8
%end dot offsetting
% begin intlit storeage
addi r8,r0,4
sw 320(r14), r8
% done intlit storeage
% begin intlit storeage
addi r8,r0,9
sw 324(r14), r8
% done intlit storeage
% begin generating indice offseting
addi r8,r0,1
addi r9,r0,0
lw r12,324(r14)
muli r11,r8,4
mul r11,r12,r11
add r9,r9,r11
lw r12,320(r14)
muli r11,r8,4
mul r11,r12,r11
muli r11,r11,10
add r9,r9,r11
sw 328(r14),r9
% done generating indice offseting
% begin var offset calculation
lw r12,328(r14)
lw r9,316(r14)
add r9,r9,r12
sw 332(r14),r9
% end var offset calculation
% begin write 
lw r12,332(r14)
add r12,r14,r12
lw r12,0(r12)
%s move ptr to prevent mem corruption
addi r14,r14,416
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
addi r14,r14,-416
% end write
lw r15,0(r14)
jr r15 
%funcdef end
