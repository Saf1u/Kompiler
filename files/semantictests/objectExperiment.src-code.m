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
addi r10,r10,1204
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
addi r9,r9,1208
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
addi r11,r11,1212
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
addi r14,r14,908
jl r15, fnfunc1
subi r14,r14,908
%check if size is zero if yes, leave
addi r11,r0,292
bz r11,endCopy4

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,908
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
addi r8,r0,4
lw r12,900(r14)
 add r8,r8,r12
sw 904(r14),r8
% end var offset calculation
%check if size is zero if yes, leave
addi r10,r0,292
bz r10,endCopy6

%set left and right ptrs
%set ptr
lw r8,904(r14)
add r8,r14,r8
%read direct value
add r12,r0,r14
addi r12,r12,912
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
subi r10,r11,292
bnz r10,beginCopy6

endCopy6
% end copy 
addi r14,r14,908
jl r15, fnprintman1
subi r14,r14,908
%check if size is zero if yes, leave
addi r12,r0,0
bz r12,endCopy7

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,908
%read direct value
add r11,r0,r14
addi r11,r11,908
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
subi r12,r8,0
bnz r12,beginCopy7

endCopy7
% end copy 
hlt
%funcdef begin
fnfunc1
sw 292(r14),r15
% begin generating indice offseting
addi r8,r0,1
addi r12,r0,0
sw 604(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,308
lw r9,604(r14)
 add r12,r12,r9
sw 608(r14),r12
% end var offset calculation
%begin dot offsetting
lw r9,608(r14)
addi r9,r9,0
sw 612(r14),r9
%end dot offsetting
% begin generating indice offseting
addi r9,r0,1
addi r12,r0,0
sw 616(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r8,616(r14)
lw r12,612(r14)
add r12,r12,r8
sw 620(r14),r12
% end var offset calculation
% begin generating indice offseting
addi r8,r0,1
addi r12,r0,0
sw 624(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,296
lw r9,624(r14)
 add r12,r12,r9
sw 628(r14),r12
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy8

%set left and right ptrs
%set ptr
lw r12,628(r14)
add r12,r14,r12
lw r9,620(r14)
add r9,r14,r9
%set position counter
mul r10,r0,r0
beginCopy8
%move data via register
lw r8,0(r12)
sw 0(r9),r8
%increment registers
addi r12,r12,4
addi r9,r9,4
addi r10,r10,4
%branch out if done
subi r11,r10,4
bnz r11,beginCopy8

endCopy8
% end assignment 
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
sw 632(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,308
lw r8,632(r14)
 add r11,r11,r8
sw 636(r14),r11
% end var offset calculation
%begin dot offsetting
lw r8,636(r14)
addi r8,r8,4
sw 640(r14),r8
%end dot offsetting
% begin intlit storeage
addi r8,r0,0
sw 644(r14), r8
% done intlit storeage
% begin intlit storeage
addi r8,r0,0
sw 648(r14), r8
% done intlit storeage
% begin generating indice offseting
addi r8,r0,1
addi r11,r0,0
lw r10,648(r14)
muli r12,r8,4
mul r12,r10,r12
add r11,r11,r12
lw r10,644(r14)
muli r12,r8,4
mul r12,r10,r12
muli r12,r12,10
add r11,r11,r12
sw 652(r14),r11
% done generating indice offseting
% begin var offset calculation
lw r10,652(r14)
lw r11,640(r14)
add r11,r11,r10
sw 656(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
sw 660(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,304
lw r8,660(r14)
 add r11,r11,r8
sw 664(r14),r11
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy9

%set left and right ptrs
%set ptr
lw r11,664(r14)
add r11,r14,r11
lw r8,656(r14)
add r8,r14,r8
%set position counter
mul r12,r0,r0
beginCopy9
%move data via register
lw r10,0(r11)
sw 0(r8),r10
%increment registers
addi r11,r11,4
addi r8,r8,4
addi r12,r12,4
%branch out if done
subi r9,r12,4
bnz r9,beginCopy9

endCopy9
% end assignment 
% begin generating indice offseting
addi r12,r0,1
addi r9,r0,0
sw 668(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,308
lw r10,668(r14)
 add r9,r9,r10
sw 672(r14),r9
% end var offset calculation
%begin dot offsetting
lw r10,672(r14)
addi r10,r10,4
sw 676(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,4
sw 680(r14), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,5
sw 684(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
lw r12,684(r14)
muli r11,r10,4
mul r11,r12,r11
add r9,r9,r11
lw r12,680(r14)
muli r11,r10,4
mul r11,r12,r11
muli r11,r11,10
add r9,r9,r11
sw 688(r14),r9
% done generating indice offseting
% begin var offset calculation
lw r12,688(r14)
lw r9,676(r14)
add r9,r9,r12
sw 692(r14),r9
% end var offset calculation
% begin generating indice offseting
addi r12,r0,1
addi r9,r0,0
sw 696(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,304
lw r10,696(r14)
 add r9,r9,r10
sw 700(r14),r9
% end var offset calculation
% begin intlit storeage
addi r10,r0,20
sw 704(r14), r10
% done intlit storeage
% begin add op 
lw r11,700(r14)
add r11,r14,r11
lw r10,0(r11)
lw r9,704(r14)
add r12,r10,r9
sw 708(r14),r12
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy10

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,708
lw r11,692(r14)
add r11,r14,r11
%set position counter
mul r10,r0,r0
beginCopy10
%move data via register
lw r9,0(r12)
sw 0(r11),r9
%increment registers
addi r12,r12,4
addi r11,r11,4
addi r10,r10,4
%branch out if done
subi r8,r10,4
bnz r8,beginCopy10

endCopy10
% end assignment 
% begin generating indice offseting
addi r10,r0,1
addi r8,r0,0
sw 712(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,308
lw r9,712(r14)
 add r8,r8,r9
sw 716(r14),r8
% end var offset calculation
%begin dot offsetting
lw r9,716(r14)
addi r9,r9,4
sw 720(r14),r9
%end dot offsetting
% begin intlit storeage
addi r9,r0,4
sw 724(r14), r9
% done intlit storeage
% begin intlit storeage
addi r9,r0,9
sw 728(r14), r9
% done intlit storeage
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
lw r10,728(r14)
muli r12,r9,4
mul r12,r10,r12
add r8,r8,r12
lw r10,724(r14)
muli r12,r9,4
mul r12,r10,r12
muli r12,r12,10
add r8,r8,r12
sw 732(r14),r8
% done generating indice offseting
% begin var offset calculation
lw r10,732(r14)
lw r8,720(r14)
add r8,r8,r10
sw 736(r14),r8
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r8,r0,0
sw 740(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,304
lw r9,740(r14)
 add r8,r8,r9
sw 744(r14),r8
% end var offset calculation
% begin intlit storeage
addi r9,r0,30
sw 748(r14), r9
% done intlit storeage
% begin add op 
lw r12,744(r14)
add r12,r14,r12
lw r9,0(r12)
lw r8,748(r14)
add r10,r9,r8
sw 752(r14),r10
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy11

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,752
lw r12,736(r14)
add r12,r14,r12
%set position counter
mul r9,r0,r0
beginCopy11
%move data via register
lw r8,0(r10)
sw 0(r12),r8
%increment registers
addi r10,r10,4
addi r12,r12,4
addi r9,r9,4
%branch out if done
subi r11,r9,4
bnz r11,beginCopy11

endCopy11
% end assignment 
% begin generating indice offseting
addi r9,r0,1
addi r11,r0,0
sw 756(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,308
lw r8,756(r14)
 add r11,r11,r8
sw 760(r14),r11
% end var offset calculation
%begin dot offsetting
lw r8,760(r14)
addi r8,r8,204
sw 764(r14),r8
%end dot offsetting
% begin generating indice offseting
addi r8,r0,1
addi r11,r0,0
sw 768(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r9,768(r14)
lw r11,764(r14)
add r11,r11,r9
sw 772(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r9,r0,1
addi r11,r0,0
sw 776(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,300
lw r8,776(r14)
 add r11,r11,r8
sw 780(r14),r11
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy12

%set left and right ptrs
%set ptr
lw r11,780(r14)
add r11,r14,r11
lw r8,772(r14)
add r8,r14,r8
%set position counter
mul r10,r0,r0
beginCopy12
%move data via register
lw r9,0(r11)
sw 0(r8),r9
%increment registers
addi r11,r11,4
addi r8,r8,4
addi r10,r10,4
%branch out if done
subi r12,r10,4
bnz r12,beginCopy12

endCopy12
% end assignment 
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
sw 784(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,308
lw r9,784(r14)
 add r12,r12,r9
sw 788(r14),r12
% end var offset calculation
%begin dot offsetting
lw r9,788(r14)
addi r9,r9,208
sw 792(r14),r9
%end dot offsetting
% begin generating indice offseting
addi r9,r0,1
addi r12,r0,0
sw 796(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r10,796(r14)
lw r12,792(r14)
add r12,r12,r10
sw 800(r14),r12
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
sw 804(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,296
lw r9,804(r14)
 add r12,r12,r9
sw 808(r14),r12
% end var offset calculation
% begin intlit storeage
addi r9,r0,10
sw 812(r14), r9
% done intlit storeage
% begin add op 
lw r11,808(r14)
add r11,r14,r11
lw r9,0(r11)
lw r12,812(r14)
add r10,r9,r12
sw 816(r14),r10
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy13

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,816
lw r11,800(r14)
add r11,r14,r11
%set position counter
mul r9,r0,r0
beginCopy13
%move data via register
lw r12,0(r10)
sw 0(r11),r12
%increment registers
addi r10,r10,4
addi r11,r11,4
addi r9,r9,4
%branch out if done
subi r8,r9,4
bnz r8,beginCopy13

endCopy13
% end assignment 
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
sw 820(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,600
lw r12,820(r14)
 add r8,r8,r12
sw 824(r14),r8
% end var offset calculation
% begin intlit storeage
addi r12,r0,0
sw 828(r14), r12
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy14

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,828
lw r12,824(r14)
add r12,r14,r12
%set position counter
mul r10,r0,r0
beginCopy14
%move data via register
lw r9,0(r8)
sw 0(r12),r9
%increment registers
addi r8,r8,4
addi r12,r12,4
addi r10,r10,4
%branch out if done
subi r11,r10,4
bnz r11,beginCopy14

endCopy14
% end assignment 
gowhile1
% begin generating indice offseting
addi r11,r0,1
addi r9,r0,0
sw 832(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,600
lw r8,832(r14)
 add r9,r9,r8
sw 836(r14),r9
% end var offset calculation
% begin intlit storeage
addi r8,r0,5
sw 840(r14), r8
% done intlit storeage
% begin RELOP op 
lw r12,836(r14)
add r12,r14,r12
lw r8,0(r12)
lw r9,840(r14)
cne r11,r8,r9
sw 844(r14),r11
% end relop op 
lw r10,844(r14)
bz r10,endwhile1
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 848(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,308
lw r9,848(r14)
 add r11,r11,r9
sw 852(r14),r11
% end var offset calculation
%begin dot offsetting
lw r9,852(r14)
addi r9,r9,252
sw 856(r14),r9
%end dot offsetting
% begin generating indice offseting
addi r9,r0,1
addi r11,r0,0
sw 860(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,600
lw r12,860(r14)
 add r11,r11,r12
sw 864(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
lw r9,864(r14)
add r9,r14,r9
lw r9,0(r9)
muli r8,r12,4
mul r8,r9,r8
add r11,r11,r8
sw 868(r14),r11
% done generating indice offseting
% begin var offset calculation
lw r9,868(r14)
lw r11,856(r14)
add r11,r11,r9
sw 872(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r9,r0,1
addi r11,r0,0
sw 876(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,600
lw r12,876(r14)
 add r11,r11,r12
sw 880(r14),r11
% end var offset calculation
% begin intlit storeage
addi r12,r0,10
sw 884(r14), r12
% done intlit storeage
% begin add op 
lw r8,880(r14)
add r8,r14,r8
lw r12,0(r8)
lw r11,884(r14)
add r9,r12,r11
sw 888(r14),r9
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r7,r0,4
bz r7,endCopy15

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,888
lw r8,872(r14)
add r8,r14,r8
%set position counter
mul r12,r0,r0
beginCopy15
%move data via register
lw r11,0(r9)
sw 0(r8),r11
%increment registers
addi r9,r9,4
addi r8,r8,4
addi r12,r12,4
%branch out if done
subi r7,r12,4
bnz r7,beginCopy15

endCopy15
% end assignment 
% begin generating indice offseting
addi r12,r0,1
addi r7,r0,0
sw 892(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r7,r0,600
lw r11,892(r14)
 add r7,r7,r11
sw 896(r14),r7
% end var offset calculation
% begin generating indice offseting
addi r11,r0,1
addi r7,r0,0
sw 900(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r7,r0,600
lw r12,900(r14)
 add r7,r7,r12
sw 904(r14),r7
% end var offset calculation
% begin intlit storeage
addi r12,r0,1
sw 908(r14), r12
% done intlit storeage
% begin add op 
lw r9,904(r14)
add r9,r14,r9
lw r12,0(r9)
lw r7,908(r14)
add r11,r12,r7
sw 912(r14),r11
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy16

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,912
lw r9,896(r14)
add r9,r14,r9
%set position counter
mul r12,r0,r0
beginCopy16
%move data via register
lw r7,0(r11)
sw 0(r9),r7
%increment registers
addi r11,r11,4
addi r9,r9,4
addi r12,r12,4
%branch out if done
subi r8,r12,4
bnz r8,beginCopy16

endCopy16
% end assignment 
j gowhile1
endwhile1
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
sw 916(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,600
lw r8,916(r14)
 add r12,r12,r8
sw 920(r14),r12
% end var offset calculation
% begin intlit storeage
addi r8,r0,0
sw 924(r14), r8
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy17

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,924
lw r8,920(r14)
add r8,r14,r8
%set position counter
mul r7,r0,r0
beginCopy17
%move data via register
lw r10,0(r12)
sw 0(r8),r10
%increment registers
addi r12,r12,4
addi r8,r8,4
addi r7,r7,4
%branch out if done
subi r11,r7,4
bnz r11,beginCopy17

endCopy17
% end assignment 
gowhile2
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
sw 928(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,600
lw r12,928(r14)
 add r10,r10,r12
sw 932(r14),r10
% end var offset calculation
% begin intlit storeage
addi r12,r0,5
sw 936(r14), r12
% done intlit storeage
% begin RELOP op 
lw r8,932(r14)
add r8,r14,r8
lw r12,0(r8)
lw r10,936(r14)
cne r11,r12,r10
sw 940(r14),r11
% end relop op 
lw r7,940(r14)
bz r7,endwhile2
% begin generating indice offseting
addi r8,r0,1
addi r11,r0,0
sw 944(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,308
lw r10,944(r14)
 add r11,r11,r10
sw 948(r14),r11
% end var offset calculation
%begin dot offsetting
lw r10,948(r14)
addi r10,r10,272
sw 952(r14),r10
%end dot offsetting
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
sw 956(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,600
lw r8,956(r14)
 add r11,r11,r8
sw 960(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r8,r0,1
addi r11,r0,0
lw r10,960(r14)
add r10,r14,r10
lw r10,0(r10)
muli r12,r8,4
mul r12,r10,r12
add r11,r11,r12
sw 964(r14),r11
% done generating indice offseting
% begin var offset calculation
lw r10,964(r14)
lw r11,952(r14)
add r11,r11,r10
sw 968(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
sw 972(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,600
lw r8,972(r14)
 add r11,r11,r8
sw 976(r14),r11
% end var offset calculation
% begin intlit storeage
addi r8,r0,20
sw 980(r14), r8
% done intlit storeage
% begin add op 
lw r12,976(r14)
add r12,r14,r12
lw r8,0(r12)
lw r11,980(r14)
add r10,r8,r11
sw 984(r14),r10
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy18

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,984
lw r12,968(r14)
add r12,r14,r12
%set position counter
mul r8,r0,r0
beginCopy18
%move data via register
lw r11,0(r10)
sw 0(r12),r11
%increment registers
addi r10,r10,4
addi r12,r12,4
addi r8,r8,4
%branch out if done
subi r9,r8,4
bnz r9,beginCopy18

endCopy18
% end assignment 
% begin generating indice offseting
addi r8,r0,1
addi r9,r0,0
sw 988(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,600
lw r11,988(r14)
 add r9,r9,r11
sw 992(r14),r9
% end var offset calculation
% begin generating indice offseting
addi r11,r0,1
addi r9,r0,0
sw 996(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,600
lw r8,996(r14)
 add r9,r9,r8
sw 1000(r14),r9
% end var offset calculation
% begin intlit storeage
addi r8,r0,1
sw 1004(r14), r8
% done intlit storeage
% begin add op 
lw r10,1000(r14)
add r10,r14,r10
lw r8,0(r10)
lw r9,1004(r14)
add r11,r8,r9
sw 1008(r14),r11
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy19

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,1008
lw r10,992(r14)
add r10,r14,r10
%set position counter
mul r8,r0,r0
beginCopy19
%move data via register
lw r9,0(r11)
sw 0(r10),r9
%increment registers
addi r11,r11,4
addi r10,r10,4
addi r8,r8,4
%branch out if done
subi r12,r8,4
bnz r12,beginCopy19

endCopy19
% end assignment 
j gowhile2
endwhile2
% begin generating indice offseting
addi r7,r0,1
addi r8,r0,0
sw 1012(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,308
lw r12,1012(r14)
 add r8,r8,r12
sw 1016(r14),r8
% end var offset calculation
%check if size is zero if yes, leave
addi r11,r0,292
bz r11,endCopy20

%set left and right ptrs
%set ptr
lw r8,1016(r14)
add r8,r14,r8
%read direct value
add r12,r0,r14
addi r12,r12,0
%set position counter
mul r9,r0,r0
beginCopy20
%move data via register
lw r7,0(r8)
sw 0(r12),r7
%increment registers
addi r8,r8,4
addi r12,r12,4
addi r9,r9,4
%branch out if done
subi r11,r9,292
bnz r11,beginCopy20

endCopy20
% end copy 
lw r15,292(r14)
jr r15 
%funcdef end
%funcdef begin
fnprintman1
sw 0(r14),r15
% begin generating indice offseting
addi r9,r0,1
addi r11,r0,0
sw 296(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r7,296(r14)
 add r11,r11,r7
sw 300(r14),r11
% end var offset calculation
%begin dot offsetting
lw r7,300(r14)
addi r7,r7,0
sw 304(r14),r7
%end dot offsetting
% begin generating indice offseting
addi r7,r0,1
addi r11,r0,0
sw 308(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r9,308(r14)
lw r11,304(r14)
add r11,r11,r9
sw 312(r14),r11
% end var offset calculation
% begin write 
lw r9,312(r14)
add r9,r14,r9
lw r9,0(r9)
%s move ptr to prevent mem corruption
addi r14,r14,500
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
addi r14,r14,-500
% end write
% begin generating indice offseting
addi r9,r0,1
addi r11,r0,0
sw 316(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r7,316(r14)
 add r11,r11,r7
sw 320(r14),r11
% end var offset calculation
%begin dot offsetting
lw r7,320(r14)
addi r7,r7,204
sw 324(r14),r7
%end dot offsetting
% begin generating indice offseting
addi r7,r0,1
addi r11,r0,0
sw 328(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r9,328(r14)
lw r11,324(r14)
add r11,r11,r9
sw 332(r14),r11
% end var offset calculation
% begin write 
lw r9,332(r14)
add r9,r14,r9
lw r9,0(r9)
%s move ptr to prevent mem corruption
addi r14,r14,500
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
addi r14,r14,-500
% end write
% begin generating indice offseting
addi r9,r0,1
addi r11,r0,0
sw 336(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r7,336(r14)
 add r11,r11,r7
sw 340(r14),r11
% end var offset calculation
%begin dot offsetting
lw r7,340(r14)
addi r7,r7,4
sw 344(r14),r7
%end dot offsetting
% begin intlit storeage
addi r7,r0,0
sw 348(r14), r7
% done intlit storeage
% begin intlit storeage
addi r7,r0,0
sw 352(r14), r7
% done intlit storeage
% begin generating indice offseting
addi r7,r0,1
addi r11,r0,0
lw r9,352(r14)
muli r8,r7,4
mul r8,r9,r8
add r11,r11,r8
lw r9,348(r14)
muli r8,r7,4
mul r8,r9,r8
muli r8,r8,10
add r11,r11,r8
sw 356(r14),r11
% done generating indice offseting
% begin var offset calculation
lw r9,356(r14)
lw r11,344(r14)
add r11,r11,r9
sw 360(r14),r11
% end var offset calculation
% begin write 
lw r9,360(r14)
add r9,r14,r9
lw r9,0(r9)
%s move ptr to prevent mem corruption
addi r14,r14,500
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
addi r14,r14,-500
% end write
% begin generating indice offseting
addi r9,r0,1
addi r11,r0,0
sw 364(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r7,364(r14)
 add r11,r11,r7
sw 368(r14),r11
% end var offset calculation
%begin dot offsetting
lw r7,368(r14)
addi r7,r7,4
sw 372(r14),r7
%end dot offsetting
% begin intlit storeage
addi r7,r0,4
sw 376(r14), r7
% done intlit storeage
% begin intlit storeage
addi r7,r0,5
sw 380(r14), r7
% done intlit storeage
% begin generating indice offseting
addi r7,r0,1
addi r11,r0,0
lw r9,380(r14)
muli r8,r7,4
mul r8,r9,r8
add r11,r11,r8
lw r9,376(r14)
muli r8,r7,4
mul r8,r9,r8
muli r8,r8,10
add r11,r11,r8
sw 384(r14),r11
% done generating indice offseting
% begin var offset calculation
lw r9,384(r14)
lw r11,372(r14)
add r11,r11,r9
sw 388(r14),r11
% end var offset calculation
% begin write 
lw r9,388(r14)
add r9,r14,r9
lw r9,0(r9)
%s move ptr to prevent mem corruption
addi r14,r14,500
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
addi r14,r14,-500
% end write
% begin generating indice offseting
addi r9,r0,1
addi r11,r0,0
sw 392(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r7,392(r14)
 add r11,r11,r7
sw 396(r14),r11
% end var offset calculation
%begin dot offsetting
lw r7,396(r14)
addi r7,r7,4
sw 400(r14),r7
%end dot offsetting
% begin intlit storeage
addi r7,r0,4
sw 404(r14), r7
% done intlit storeage
% begin intlit storeage
addi r7,r0,9
sw 408(r14), r7
% done intlit storeage
% begin generating indice offseting
addi r7,r0,1
addi r11,r0,0
lw r9,408(r14)
muli r8,r7,4
mul r8,r9,r8
add r11,r11,r8
lw r9,404(r14)
muli r8,r7,4
mul r8,r9,r8
muli r8,r8,10
add r11,r11,r8
sw 412(r14),r11
% done generating indice offseting
% begin var offset calculation
lw r9,412(r14)
lw r11,400(r14)
add r11,r11,r9
sw 416(r14),r11
% end var offset calculation
% begin write 
lw r9,416(r14)
add r9,r14,r9
lw r9,0(r9)
%s move ptr to prevent mem corruption
addi r14,r14,500
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
addi r14,r14,-500
% end write
lw r15,0(r14)
jr r15 
%funcdef end
