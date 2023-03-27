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
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 588(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r10,588(r14)
 add r11,r11,r10
sw 592(r14),r11
% end var offset calculation
% begin intlit storeage
addi r10,r0,100
sw 596(r14), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,200
sw 600(r14), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,100
sw 604(r14), r10
% done intlit storeage
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy1

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,596
%read direct value
add r10,r0,r14
addi r10,r10,1524
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
addi r8,r8,600
%read direct value
add r9,r0,r14
addi r9,r9,1528
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
addi r10,r10,604
%read direct value
add r11,r0,r14
addi r11,r11,1532
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
addi r14,r14,1228
jl r15, fnfunc1
subi r14,r14,1228
%check if size is zero if yes, leave
addi r11,r0,292
bz r11,endCopy4

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,1228
%read direct value
add r8,r0,r14
addi r8,r8,608
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
subi r11,r10,292
bnz r11,beginCopy4

endCopy4
% end copy 
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,292
bz r8,endCopy5

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,608
lw r10,592(r14)
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
subi r8,r9,292
bnz r8,beginCopy5

endCopy5
% end assignment 
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
sw 900(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,296
lw r12,900(r14)
 add r8,r8,r12
sw 904(r14),r8
% end var offset calculation
% begin intlit storeage
addi r12,r0,500
sw 908(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,300
sw 912(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,100
sw 916(r14), r12
% done intlit storeage
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy6

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,908
%read direct value
add r12,r0,r14
addi r12,r12,1524
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
addi r10,r10,912
%read direct value
add r11,r0,r14
addi r11,r11,1528
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
addi r12,r12,916
%read direct value
add r8,r0,r14
addi r8,r8,1532
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
addi r14,r14,1228
jl r15, fnfunc1
subi r14,r14,1228
%check if size is zero if yes, leave
addi r8,r0,292
bz r8,endCopy9

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,1228
%read direct value
add r10,r0,r14
addi r10,r10,920
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
subi r8,r12,292
bnz r8,beginCopy9

endCopy9
% end copy 
% begin assignment 
%check if size is zero if yes, leave
addi r10,r0,292
bz r10,endCopy10

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,920
lw r12,904(r14)
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
subi r10,r11,292
bnz r10,beginCopy10

endCopy10
% end assignment 
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
sw 1212(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,4
lw r9,1212(r14)
 add r10,r10,r9
sw 1216(r14),r10
% end var offset calculation
%check if size is zero if yes, leave
addi r12,r0,292
bz r12,endCopy11

%set left and right ptrs
%set ptr
lw r10,1216(r14)
add r10,r14,r10
%read direct value
add r9,r0,r14
addi r9,r9,1232
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
subi r12,r8,292
bnz r12,beginCopy11

endCopy11
% end copy 
addi r14,r14,1228
jl r15, fnprintman1
subi r14,r14,1228
%check if size is zero if yes, leave
addi r9,r0,0
bz r9,endCopy12

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,1228
%read direct value
add r8,r0,r14
addi r8,r8,1220
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
sw 1220(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,296
lw r11,1220(r14)
 add r9,r9,r11
sw 1224(r14),r9
% end var offset calculation
%check if size is zero if yes, leave
addi r8,r0,292
bz r8,endCopy13

%set left and right ptrs
%set ptr
lw r9,1224(r14)
add r9,r14,r9
%read direct value
add r11,r0,r14
addi r11,r11,1232
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
subi r8,r12,292
bnz r8,beginCopy13

endCopy13
% end copy 
addi r14,r14,1228
jl r15, fnprintman1
subi r14,r14,1228
%check if size is zero if yes, leave
addi r11,r0,0
bz r11,endCopy14

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,1228
%read direct value
add r12,r0,r14
addi r12,r12,1228
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
sw 292(r14),r15
% begin generating indice offseting
addi r9,r0,1
addi r11,r0,0
sw 604(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,308
lw r10,604(r14)
 add r11,r11,r10
sw 608(r14),r11
% end var offset calculation
%begin dot offsetting
lw r10,608(r14)
addi r10,r10,0
sw 612(r14),r10
%end dot offsetting
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
sw 616(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r9,616(r14)
lw r11,612(r14)
add r11,r11,r9
sw 620(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r9,r0,1
addi r11,r0,0
sw 624(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,296
lw r10,624(r14)
 add r11,r11,r10
sw 628(r14),r11
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy15

%set left and right ptrs
%set ptr
lw r11,628(r14)
add r11,r14,r11
lw r10,620(r14)
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
sw 632(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,308
lw r9,632(r14)
 add r12,r12,r9
sw 636(r14),r12
% end var offset calculation
%begin dot offsetting
lw r9,636(r14)
addi r9,r9,4
sw 640(r14),r9
%end dot offsetting
% begin intlit storeage
addi r9,r0,0
sw 644(r14), r9
% done intlit storeage
% begin intlit storeage
addi r9,r0,0
sw 648(r14), r9
% done intlit storeage
% begin generating indice offseting
addi r9,r0,1
addi r12,r0,0
lw r8,648(r14)
muli r11,r9,4
mul r11,r8,r11
add r12,r12,r11
lw r8,644(r14)
muli r11,r9,4
mul r11,r8,r11
muli r11,r11,10
add r12,r12,r11
sw 652(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r8,652(r14)
lw r12,640(r14)
add r12,r12,r8
sw 656(r14),r12
% end var offset calculation
% begin generating indice offseting
addi r8,r0,1
addi r12,r0,0
sw 660(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,304
lw r9,660(r14)
 add r12,r12,r9
sw 664(r14),r12
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy16

%set left and right ptrs
%set ptr
lw r12,664(r14)
add r12,r14,r12
lw r9,656(r14)
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
sw 668(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,308
lw r8,668(r14)
 add r10,r10,r8
sw 672(r14),r10
% end var offset calculation
%begin dot offsetting
lw r8,672(r14)
addi r8,r8,4
sw 676(r14),r8
%end dot offsetting
% begin intlit storeage
addi r8,r0,4
sw 680(r14), r8
% done intlit storeage
% begin intlit storeage
addi r8,r0,5
sw 684(r14), r8
% done intlit storeage
% begin generating indice offseting
addi r8,r0,1
addi r10,r0,0
lw r11,684(r14)
muli r12,r8,4
mul r12,r11,r12
add r10,r10,r12
lw r11,680(r14)
muli r12,r8,4
mul r12,r11,r12
muli r12,r12,10
add r10,r10,r12
sw 688(r14),r10
% done generating indice offseting
% begin var offset calculation
lw r11,688(r14)
lw r10,676(r14)
add r10,r10,r11
sw 692(r14),r10
% end var offset calculation
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
sw 696(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,304
lw r8,696(r14)
 add r10,r10,r8
sw 700(r14),r10
% end var offset calculation
% begin intlit storeage
addi r8,r0,20
sw 704(r14), r8
% done intlit storeage
% begin add op 
lw r12,700(r14)
add r12,r14,r12
lw r8,0(r12)
lw r10,704(r14)
add r11,r8,r10
sw 708(r14),r11
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy17

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,708
lw r12,692(r14)
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
sw 712(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,308
lw r10,712(r14)
 add r9,r9,r10
sw 716(r14),r9
% end var offset calculation
%begin dot offsetting
lw r10,716(r14)
addi r10,r10,4
sw 720(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,4
sw 724(r14), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,9
sw 728(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
lw r8,728(r14)
muli r11,r10,4
mul r11,r8,r11
add r9,r9,r11
lw r8,724(r14)
muli r11,r10,4
mul r11,r8,r11
muli r11,r11,10
add r9,r9,r11
sw 732(r14),r9
% done generating indice offseting
% begin var offset calculation
lw r8,732(r14)
lw r9,720(r14)
add r9,r9,r8
sw 736(r14),r9
% end var offset calculation
% begin generating indice offseting
addi r8,r0,1
addi r9,r0,0
sw 740(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,304
lw r10,740(r14)
 add r9,r9,r10
sw 744(r14),r9
% end var offset calculation
% begin intlit storeage
addi r10,r0,30
sw 748(r14), r10
% done intlit storeage
% begin add op 
lw r11,744(r14)
add r11,r14,r11
lw r10,0(r11)
lw r9,748(r14)
add r8,r10,r9
sw 752(r14),r8
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy18

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,752
lw r11,736(r14)
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
sw 756(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,308
lw r9,756(r14)
 add r12,r12,r9
sw 760(r14),r12
% end var offset calculation
%begin dot offsetting
lw r9,760(r14)
addi r9,r9,204
sw 764(r14),r9
%end dot offsetting
% begin generating indice offseting
addi r9,r0,1
addi r12,r0,0
sw 768(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r10,768(r14)
lw r12,764(r14)
add r12,r12,r10
sw 772(r14),r12
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
sw 776(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,300
lw r9,776(r14)
 add r12,r12,r9
sw 780(r14),r12
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy19

%set left and right ptrs
%set ptr
lw r12,780(r14)
add r12,r14,r12
lw r9,772(r14)
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
sw 784(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,308
lw r10,784(r14)
 add r11,r11,r10
sw 788(r14),r11
% end var offset calculation
%begin dot offsetting
lw r10,788(r14)
addi r10,r10,208
sw 792(r14),r10
%end dot offsetting
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
sw 796(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r8,796(r14)
lw r11,792(r14)
add r11,r11,r8
sw 800(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r8,r0,1
addi r11,r0,0
sw 804(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,296
lw r10,804(r14)
 add r11,r11,r10
sw 808(r14),r11
% end var offset calculation
% begin intlit storeage
addi r10,r0,50
sw 812(r14), r10
% done intlit storeage
% begin add op 
lw r12,808(r14)
add r12,r14,r12
lw r10,0(r12)
lw r11,812(r14)
add r8,r10,r11
sw 816(r14),r8
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy20

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,816
lw r12,800(r14)
add r12,r14,r12
%set position counter
mul r10,r0,r0
beginCopy20
%move data via register
lw r11,0(r8)
sw 0(r12),r11
%increment registers
addi r8,r8,4
addi r12,r12,4
addi r10,r10,4
%branch out if done
subi r9,r10,4
bnz r9,beginCopy20

endCopy20
% end assignment 
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
sw 820(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,600
lw r11,820(r14)
 add r9,r9,r11
sw 824(r14),r9
% end var offset calculation
% begin intlit storeage
addi r11,r0,0
sw 828(r14), r11
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy21

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,828
lw r11,824(r14)
add r11,r14,r11
%set position counter
mul r8,r0,r0
beginCopy21
%move data via register
lw r10,0(r9)
sw 0(r11),r10
%increment registers
addi r9,r9,4
addi r11,r11,4
addi r8,r8,4
%branch out if done
subi r12,r8,4
bnz r12,beginCopy21

endCopy21
% end assignment 
gowhile1
% begin generating indice offseting
addi r12,r0,1
addi r10,r0,0
sw 832(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,600
lw r9,832(r14)
 add r10,r10,r9
sw 836(r14),r10
% end var offset calculation
% begin intlit storeage
addi r9,r0,5
sw 840(r14), r9
% done intlit storeage
% begin RELOP op 
lw r11,836(r14)
add r11,r14,r11
lw r9,0(r11)
lw r10,840(r14)
cne r12,r9,r10
sw 844(r14),r12
% end relop op 
lw r8,844(r14)
bz r8,endwhile1
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 848(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,308
lw r10,848(r14)
 add r12,r12,r10
sw 852(r14),r12
% end var offset calculation
%begin dot offsetting
lw r10,852(r14)
addi r10,r10,252
sw 856(r14),r10
%end dot offsetting
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
sw 860(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,600
lw r11,860(r14)
 add r12,r12,r11
sw 864(r14),r12
% end var offset calculation
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
lw r10,864(r14)
add r10,r14,r10
lw r10,0(r10)
muli r9,r11,4
mul r9,r10,r9
add r12,r12,r9
sw 868(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r10,868(r14)
lw r12,856(r14)
add r12,r12,r10
sw 872(r14),r12
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
sw 876(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,600
lw r11,876(r14)
 add r12,r12,r11
sw 880(r14),r12
% end var offset calculation
% begin intlit storeage
addi r11,r0,10
sw 884(r14), r11
% done intlit storeage
% begin add op 
lw r9,880(r14)
add r9,r14,r9
lw r11,0(r9)
lw r12,884(r14)
add r10,r11,r12
sw 888(r14),r10
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r7,r0,4
bz r7,endCopy22

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,888
lw r9,872(r14)
add r9,r14,r9
%set position counter
mul r11,r0,r0
beginCopy22
%move data via register
lw r12,0(r10)
sw 0(r9),r12
%increment registers
addi r10,r10,4
addi r9,r9,4
addi r11,r11,4
%branch out if done
subi r7,r11,4
bnz r7,beginCopy22

endCopy22
% end assignment 
% begin generating indice offseting
addi r11,r0,1
addi r7,r0,0
sw 892(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r7,r0,600
lw r12,892(r14)
 add r7,r7,r12
sw 896(r14),r7
% end var offset calculation
% begin generating indice offseting
addi r12,r0,1
addi r7,r0,0
sw 900(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r7,r0,600
lw r11,900(r14)
 add r7,r7,r11
sw 904(r14),r7
% end var offset calculation
% begin intlit storeage
addi r11,r0,1
sw 908(r14), r11
% done intlit storeage
% begin add op 
lw r10,904(r14)
add r10,r14,r10
lw r11,0(r10)
lw r7,908(r14)
add r12,r11,r7
sw 912(r14),r12
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy23

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,912
lw r10,896(r14)
add r10,r14,r10
%set position counter
mul r11,r0,r0
beginCopy23
%move data via register
lw r7,0(r12)
sw 0(r10),r7
%increment registers
addi r12,r12,4
addi r10,r10,4
addi r11,r11,4
%branch out if done
subi r9,r11,4
bnz r9,beginCopy23

endCopy23
% end assignment 
j gowhile1
endwhile1
% begin generating indice offseting
addi r8,r0,1
addi r11,r0,0
sw 916(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,600
lw r9,916(r14)
 add r11,r11,r9
sw 920(r14),r11
% end var offset calculation
% begin intlit storeage
addi r9,r0,0
sw 924(r14), r9
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy24

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,924
lw r9,920(r14)
add r9,r14,r9
%set position counter
mul r7,r0,r0
beginCopy24
%move data via register
lw r8,0(r11)
sw 0(r9),r8
%increment registers
addi r11,r11,4
addi r9,r9,4
addi r7,r7,4
%branch out if done
subi r12,r7,4
bnz r12,beginCopy24

endCopy24
% end assignment 
gowhile2
% begin generating indice offseting
addi r12,r0,1
addi r8,r0,0
sw 928(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,600
lw r11,928(r14)
 add r8,r8,r11
sw 932(r14),r8
% end var offset calculation
% begin intlit storeage
addi r11,r0,5
sw 936(r14), r11
% done intlit storeage
% begin RELOP op 
lw r9,932(r14)
add r9,r14,r9
lw r11,0(r9)
lw r8,936(r14)
cne r12,r11,r8
sw 940(r14),r12
% end relop op 
lw r7,940(r14)
bz r7,endwhile2
% begin generating indice offseting
addi r9,r0,1
addi r12,r0,0
sw 944(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,308
lw r8,944(r14)
 add r12,r12,r8
sw 948(r14),r12
% end var offset calculation
%begin dot offsetting
lw r8,948(r14)
addi r8,r8,272
sw 952(r14),r8
%end dot offsetting
% begin generating indice offseting
addi r8,r0,1
addi r12,r0,0
sw 956(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,600
lw r9,956(r14)
 add r12,r12,r9
sw 960(r14),r12
% end var offset calculation
% begin generating indice offseting
addi r9,r0,1
addi r12,r0,0
lw r8,960(r14)
add r8,r14,r8
lw r8,0(r8)
muli r11,r9,4
mul r11,r8,r11
add r12,r12,r11
sw 964(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r8,964(r14)
lw r12,952(r14)
add r12,r12,r8
sw 968(r14),r12
% end var offset calculation
% begin generating indice offseting
addi r8,r0,1
addi r12,r0,0
sw 972(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,600
lw r9,972(r14)
 add r12,r12,r9
sw 976(r14),r12
% end var offset calculation
% begin intlit storeage
addi r9,r0,20
sw 980(r14), r9
% done intlit storeage
% begin add op 
lw r11,976(r14)
add r11,r14,r11
lw r9,0(r11)
lw r12,980(r14)
add r8,r9,r12
sw 984(r14),r8
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy25

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,984
lw r11,968(r14)
add r11,r14,r11
%set position counter
mul r9,r0,r0
beginCopy25
%move data via register
lw r12,0(r8)
sw 0(r11),r12
%increment registers
addi r8,r8,4
addi r11,r11,4
addi r9,r9,4
%branch out if done
subi r10,r9,4
bnz r10,beginCopy25

endCopy25
% end assignment 
% begin generating indice offseting
addi r9,r0,1
addi r10,r0,0
sw 988(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,600
lw r12,988(r14)
 add r10,r10,r12
sw 992(r14),r10
% end var offset calculation
% begin generating indice offseting
addi r12,r0,1
addi r10,r0,0
sw 996(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,600
lw r9,996(r14)
 add r10,r10,r9
sw 1000(r14),r10
% end var offset calculation
% begin intlit storeage
addi r9,r0,1
sw 1004(r14), r9
% done intlit storeage
% begin add op 
lw r8,1000(r14)
add r8,r14,r8
lw r9,0(r8)
lw r10,1004(r14)
add r12,r9,r10
sw 1008(r14),r12
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy26

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,1008
lw r8,992(r14)
add r8,r14,r8
%set position counter
mul r9,r0,r0
beginCopy26
%move data via register
lw r10,0(r12)
sw 0(r8),r10
%increment registers
addi r12,r12,4
addi r8,r8,4
addi r9,r9,4
%branch out if done
subi r11,r9,4
bnz r11,beginCopy26

endCopy26
% end assignment 
j gowhile2
endwhile2
% begin generating indice offseting
addi r7,r0,1
addi r9,r0,0
sw 1012(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,308
lw r11,1012(r14)
 add r9,r9,r11
sw 1016(r14),r9
% end var offset calculation
%check if size is zero if yes, leave
addi r12,r0,292
bz r12,endCopy27

%set left and right ptrs
%set ptr
lw r9,1016(r14)
add r9,r14,r9
%read direct value
add r11,r0,r14
addi r11,r11,0
%set position counter
mul r10,r0,r0
beginCopy27
%move data via register
lw r7,0(r9)
sw 0(r11),r7
%increment registers
addi r9,r9,4
addi r11,r11,4
addi r10,r10,4
%branch out if done
subi r12,r10,292
bnz r12,beginCopy27

endCopy27
% end copy 
lw r15,292(r14)
jr r15 
%funcdef end
%funcdef begin
fnprintman1
sw 0(r14),r15
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
sw 300(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r7,300(r14)
 add r12,r12,r7
sw 304(r14),r12
% end var offset calculation
%begin dot offsetting
lw r7,304(r14)
addi r7,r7,0
sw 308(r14),r7
%end dot offsetting
% begin generating indice offseting
addi r7,r0,1
addi r12,r0,0
sw 312(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r10,312(r14)
lw r12,308(r14)
add r12,r12,r10
sw 316(r14),r12
% end var offset calculation
% begin write 
lw r10,316(r14)
add r10,r14,r10
lw r10,0(r10)
%s move ptr to prevent mem corruption
addi r14,r14,684
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
addi r14,r14,-684
% end write
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
sw 320(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r7,320(r14)
 add r12,r12,r7
sw 324(r14),r12
% end var offset calculation
%begin dot offsetting
lw r7,324(r14)
addi r7,r7,204
sw 328(r14),r7
%end dot offsetting
% begin generating indice offseting
addi r7,r0,1
addi r12,r0,0
sw 332(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r10,332(r14)
lw r12,328(r14)
add r12,r12,r10
sw 336(r14),r12
% end var offset calculation
% begin write 
lw r10,336(r14)
add r10,r14,r10
lw r10,0(r10)
%s move ptr to prevent mem corruption
addi r14,r14,684
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
addi r14,r14,-684
% end write
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
sw 340(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r7,340(r14)
 add r12,r12,r7
sw 344(r14),r12
% end var offset calculation
%begin dot offsetting
lw r7,344(r14)
addi r7,r7,4
sw 348(r14),r7
%end dot offsetting
% begin intlit storeage
addi r7,r0,0
sw 352(r14), r7
% done intlit storeage
% begin intlit storeage
addi r7,r0,0
sw 356(r14), r7
% done intlit storeage
% begin generating indice offseting
addi r7,r0,1
addi r12,r0,0
lw r10,356(r14)
muli r9,r7,4
mul r9,r10,r9
add r12,r12,r9
lw r10,352(r14)
muli r9,r7,4
mul r9,r10,r9
muli r9,r9,10
add r12,r12,r9
sw 360(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r10,360(r14)
lw r12,348(r14)
add r12,r12,r10
sw 364(r14),r12
% end var offset calculation
% begin write 
lw r10,364(r14)
add r10,r14,r10
lw r10,0(r10)
%s move ptr to prevent mem corruption
addi r14,r14,684
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
addi r14,r14,-684
% end write
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
sw 368(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r7,368(r14)
 add r12,r12,r7
sw 372(r14),r12
% end var offset calculation
%begin dot offsetting
lw r7,372(r14)
addi r7,r7,4
sw 376(r14),r7
%end dot offsetting
% begin intlit storeage
addi r7,r0,4
sw 380(r14), r7
% done intlit storeage
% begin intlit storeage
addi r7,r0,5
sw 384(r14), r7
% done intlit storeage
% begin generating indice offseting
addi r7,r0,1
addi r12,r0,0
lw r10,384(r14)
muli r9,r7,4
mul r9,r10,r9
add r12,r12,r9
lw r10,380(r14)
muli r9,r7,4
mul r9,r10,r9
muli r9,r9,10
add r12,r12,r9
sw 388(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r10,388(r14)
lw r12,376(r14)
add r12,r12,r10
sw 392(r14),r12
% end var offset calculation
% begin write 
lw r10,392(r14)
add r10,r14,r10
lw r10,0(r10)
%s move ptr to prevent mem corruption
addi r14,r14,684
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
addi r14,r14,-684
% end write
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
sw 396(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r7,396(r14)
 add r12,r12,r7
sw 400(r14),r12
% end var offset calculation
%begin dot offsetting
lw r7,400(r14)
addi r7,r7,4
sw 404(r14),r7
%end dot offsetting
% begin intlit storeage
addi r7,r0,4
sw 408(r14), r7
% done intlit storeage
% begin intlit storeage
addi r7,r0,9
sw 412(r14), r7
% done intlit storeage
% begin generating indice offseting
addi r7,r0,1
addi r12,r0,0
lw r10,412(r14)
muli r9,r7,4
mul r9,r10,r9
add r12,r12,r9
lw r10,408(r14)
muli r9,r7,4
mul r9,r10,r9
muli r9,r9,10
add r12,r12,r9
sw 416(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r10,416(r14)
lw r12,404(r14)
add r12,r12,r10
sw 420(r14),r12
% end var offset calculation
% begin write 
lw r10,420(r14)
add r10,r14,r10
lw r10,0(r10)
%s move ptr to prevent mem corruption
addi r14,r14,684
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
addi r14,r14,-684
% end write
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
sw 424(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r7,424(r14)
 add r12,r12,r7
sw 428(r14),r12
% end var offset calculation
%begin dot offsetting
lw r7,428(r14)
addi r7,r7,208
sw 432(r14),r7
%end dot offsetting
% begin generating indice offseting
addi r7,r0,1
addi r12,r0,0
sw 436(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r10,436(r14)
lw r12,432(r14)
add r12,r12,r10
sw 440(r14),r12
% end var offset calculation
% begin write 
lw r10,440(r14)
add r10,r14,r10
lw r10,0(r10)
%s move ptr to prevent mem corruption
addi r14,r14,684
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
addi r14,r14,-684
% end write
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
sw 444(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,296
lw r7,444(r14)
 add r12,r12,r7
sw 448(r14),r12
% end var offset calculation
% begin intlit storeage
addi r7,r0,0
sw 452(r14), r7
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy28

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,452
lw r7,448(r14)
add r7,r14,r7
%set position counter
mul r9,r0,r0
beginCopy28
%move data via register
lw r10,0(r12)
sw 0(r7),r10
%increment registers
addi r12,r12,4
addi r7,r7,4
addi r9,r9,4
%branch out if done
subi r11,r9,4
bnz r11,beginCopy28

endCopy28
% end assignment 
gowhile3
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
sw 456(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,296
lw r12,456(r14)
 add r10,r10,r12
sw 460(r14),r10
% end var offset calculation
% begin intlit storeage
addi r12,r0,5
sw 464(r14), r12
% done intlit storeage
% begin RELOP op 
lw r7,460(r14)
add r7,r14,r7
lw r12,0(r7)
lw r10,464(r14)
cne r11,r12,r10
sw 468(r14),r11
% end relop op 
lw r9,468(r14)
bz r9,endwhile3
% begin generating indice offseting
addi r7,r0,1
addi r11,r0,0
sw 472(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r10,472(r14)
 add r11,r11,r10
sw 476(r14),r11
% end var offset calculation
%begin dot offsetting
lw r10,476(r14)
addi r10,r10,252
sw 480(r14),r10
%end dot offsetting
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
sw 484(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,296
lw r7,484(r14)
 add r11,r11,r7
sw 488(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r7,r0,1
addi r11,r0,0
lw r10,488(r14)
add r10,r14,r10
lw r10,0(r10)
muli r12,r7,4
mul r12,r10,r12
add r11,r11,r12
sw 492(r14),r11
% done generating indice offseting
% begin var offset calculation
lw r10,492(r14)
lw r11,480(r14)
add r11,r11,r10
sw 496(r14),r11
% end var offset calculation
% begin write 
lw r10,496(r14)
add r10,r14,r10
lw r10,0(r10)
%s move ptr to prevent mem corruption
addi r14,r14,684
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
addi r14,r14,-684
% end write
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
sw 500(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,296
lw r7,500(r14)
 add r11,r11,r7
sw 504(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r7,r0,1
addi r11,r0,0
sw 508(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,296
lw r10,508(r14)
 add r11,r11,r10
sw 512(r14),r11
% end var offset calculation
% begin intlit storeage
addi r10,r0,1
sw 516(r14), r10
% done intlit storeage
% begin add op 
lw r12,512(r14)
add r12,r14,r12
lw r10,0(r12)
lw r11,516(r14)
add r7,r10,r11
sw 520(r14),r7
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy29

%set left and right ptrs
%read direct value
add r7,r0,r14
addi r7,r7,520
lw r12,504(r14)
add r12,r14,r12
%set position counter
mul r10,r0,r0
beginCopy29
%move data via register
lw r11,0(r7)
sw 0(r12),r11
%increment registers
addi r7,r7,4
addi r12,r12,4
addi r10,r10,4
%branch out if done
subi r8,r10,4
bnz r8,beginCopy29

endCopy29
% end assignment 
j gowhile3
endwhile3
% begin generating indice offseting
addi r9,r0,1
addi r10,r0,0
sw 524(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,296
lw r8,524(r14)
 add r10,r10,r8
sw 528(r14),r10
% end var offset calculation
% begin intlit storeage
addi r8,r0,0
sw 532(r14), r8
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r7,r0,4
bz r7,endCopy30

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,532
lw r8,528(r14)
add r8,r14,r8
%set position counter
mul r11,r0,r0
beginCopy30
%move data via register
lw r9,0(r10)
sw 0(r8),r9
%increment registers
addi r10,r10,4
addi r8,r8,4
addi r11,r11,4
%branch out if done
subi r7,r11,4
bnz r7,beginCopy30

endCopy30
% end assignment 
gowhile4
% begin generating indice offseting
addi r7,r0,1
addi r9,r0,0
sw 536(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,296
lw r10,536(r14)
 add r9,r9,r10
sw 540(r14),r9
% end var offset calculation
% begin intlit storeage
addi r10,r0,5
sw 544(r14), r10
% done intlit storeage
% begin RELOP op 
lw r8,540(r14)
add r8,r14,r8
lw r10,0(r8)
lw r9,544(r14)
cne r7,r10,r9
sw 548(r14),r7
% end relop op 
lw r11,548(r14)
bz r11,endwhile4
% begin generating indice offseting
addi r8,r0,1
addi r7,r0,0
sw 552(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r7,r0,4
lw r9,552(r14)
 add r7,r7,r9
sw 556(r14),r7
% end var offset calculation
%begin dot offsetting
lw r9,556(r14)
addi r9,r9,272
sw 560(r14),r9
%end dot offsetting
% begin generating indice offseting
addi r9,r0,1
addi r7,r0,0
sw 564(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r7,r0,296
lw r8,564(r14)
 add r7,r7,r8
sw 568(r14),r7
% end var offset calculation
% begin generating indice offseting
addi r8,r0,1
addi r7,r0,0
lw r9,568(r14)
add r9,r14,r9
lw r9,0(r9)
muli r10,r8,4
mul r10,r9,r10
add r7,r7,r10
sw 572(r14),r7
% done generating indice offseting
% begin var offset calculation
lw r9,572(r14)
lw r7,560(r14)
add r7,r7,r9
sw 576(r14),r7
% end var offset calculation
% begin write 
lw r9,576(r14)
add r9,r14,r9
lw r9,0(r9)
%s move ptr to prevent mem corruption
addi r14,r14,684
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
addi r14,r14,-684
% end write
% begin generating indice offseting
addi r9,r0,1
addi r7,r0,0
sw 580(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r7,r0,296
lw r8,580(r14)
 add r7,r7,r8
sw 584(r14),r7
% end var offset calculation
% begin generating indice offseting
addi r8,r0,1
addi r7,r0,0
sw 588(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r7,r0,296
lw r9,588(r14)
 add r7,r7,r9
sw 592(r14),r7
% end var offset calculation
% begin intlit storeage
addi r9,r0,1
sw 596(r14), r9
% done intlit storeage
% begin add op 
lw r10,592(r14)
add r10,r14,r10
lw r9,0(r10)
lw r7,596(r14)
add r8,r9,r7
sw 600(r14),r8
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy31

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,600
lw r10,584(r14)
add r10,r14,r10
%set position counter
mul r9,r0,r0
beginCopy31
%move data via register
lw r7,0(r8)
sw 0(r10),r7
%increment registers
addi r8,r8,4
addi r10,r10,4
addi r9,r9,4
%branch out if done
subi r12,r9,4
bnz r12,beginCopy31

endCopy31
% end assignment 
j gowhile4
endwhile4
lw r15,0(r14)
jr r15 
%funcdef end
