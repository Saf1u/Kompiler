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
sw 1172(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r10,1172(r14)
 add r11,r11,r10
sw 1176(r14),r11
% end var offset calculation
% begin intlit storeage
addi r10,r0,100
sw 1180(r14), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,200
sw 1184(r14), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,100
sw 1188(r14), r10
% done intlit storeage
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy1

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,1180
%read direct value
add r10,r0,r14
addi r10,r10,2140
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
addi r8,r8,1184
%read direct value
add r9,r0,r14
addi r9,r9,2144
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
addi r10,r10,1188
%read direct value
add r11,r0,r14
addi r11,r11,2148
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
addi r14,r14,1844
jl r15, fnfunc1
subi r14,r14,1844
%check if size is zero if yes, leave
addi r11,r0,292
bz r11,endCopy4

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,1844
%read direct value
add r8,r0,r14
addi r8,r8,1192
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
addi r11,r11,1192
lw r10,1176(r14)
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
sw 1484(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,296
lw r12,1484(r14)
 add r8,r8,r12
sw 1488(r14),r8
% end var offset calculation
% begin intlit storeage
addi r12,r0,500
sw 1492(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,300
sw 1496(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,100
sw 1500(r14), r12
% done intlit storeage
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy6

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,1492
%read direct value
add r12,r0,r14
addi r12,r12,2140
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
addi r10,r10,1496
%read direct value
add r11,r0,r14
addi r11,r11,2144
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
addi r12,r12,1500
%read direct value
add r8,r0,r14
addi r8,r8,2148
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
addi r14,r14,1844
jl r15, fnfunc1
subi r14,r14,1844
%check if size is zero if yes, leave
addi r8,r0,292
bz r8,endCopy9

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,1844
%read direct value
add r10,r0,r14
addi r10,r10,1504
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
addi r8,r8,1504
lw r12,1488(r14)
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
% begin intlit storeage
addi r11,r0,0
sw 1796(r14), r11
% done intlit storeage
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
lw r9,1796(r14)
muli r8,r11,292
mul r8,r9,r8
add r10,r10,r8
sw 1800(r14),r10
% done generating indice offseting
% begin var offset calculation
addi r10,r0,588
lw r9,1800(r14)
 add r10,r10,r9
sw 1804(r14),r10
% end var offset calculation
% begin generating indice offseting
addi r9,r0,1
addi r10,r0,0
sw 1808(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,4
lw r11,1808(r14)
 add r10,r10,r11
sw 1812(r14),r10
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r12,r0,292
bz r12,endCopy11

%set left and right ptrs
%set ptr
lw r10,1812(r14)
add r10,r14,r10
lw r11,1804(r14)
add r11,r14,r11
%set position counter
mul r8,r0,r0
beginCopy11
%move data via register
lw r9,0(r10)
sw 0(r11),r9
%increment registers
addi r10,r10,4
addi r11,r11,4
addi r8,r8,4
%branch out if done
subi r12,r8,292
bnz r12,beginCopy11

endCopy11
% end assignment 
% begin intlit storeage
addi r8,r0,1
sw 1816(r14), r8
% done intlit storeage
% begin generating indice offseting
addi r8,r0,1
addi r12,r0,0
lw r9,1816(r14)
muli r10,r8,292
mul r10,r9,r10
add r12,r12,r10
sw 1820(r14),r12
% done generating indice offseting
% begin var offset calculation
addi r12,r0,588
lw r9,1820(r14)
 add r12,r12,r9
sw 1824(r14),r12
% end var offset calculation
% begin generating indice offseting
addi r9,r0,1
addi r12,r0,0
sw 1828(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,296
lw r8,1828(r14)
 add r12,r12,r8
sw 1832(r14),r12
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r11,r0,292
bz r11,endCopy12

%set left and right ptrs
%set ptr
lw r12,1832(r14)
add r12,r14,r12
lw r8,1824(r14)
add r8,r14,r8
%set position counter
mul r10,r0,r0
beginCopy12
%move data via register
lw r9,0(r12)
sw 0(r8),r9
%increment registers
addi r12,r12,4
addi r8,r8,4
addi r10,r10,4
%branch out if done
subi r11,r10,292
bnz r11,beginCopy12

endCopy12
% end assignment 
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
sw 1836(r14),r11
% done generating indice offseting
% begin var offset calculation
addi r11,r0,588
lw r9,1836(r14)
 add r11,r11,r9
sw 1840(r14),r11
% end var offset calculation
%check if size is zero if yes, leave
addi r8,r0,584
bz r8,endCopy13

%set left and right ptrs
%set ptr
lw r11,1840(r14)
add r11,r14,r11
addi r11,r11,0
%read direct value
add r9,r0,r14
addi r9,r9,1848
%set position counter
mul r12,r0,r0
beginCopy13
%move data via register
lw r10,0(r11)
sw 0(r9),r10
%increment registers
addi r11,r11,4
addi r9,r9,4
addi r12,r12,4
%branch out if done
subi r8,r12,584
bnz r8,beginCopy13

endCopy13
% end copy 
addi r14,r14,1844
jl r15, fnprintmen1
subi r14,r14,1844
%check if size is zero if yes, leave
addi r9,r0,0
bz r9,endCopy14

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,1844
%read direct value
add r12,r0,r14
addi r12,r12,1844
%set position counter
mul r11,r0,r0
beginCopy14
%move data via register
lw r10,0(r8)
sw 0(r12),r10
%increment registers
addi r8,r8,4
addi r12,r12,4
addi r11,r11,4
%branch out if done
subi r9,r11,0
bnz r9,beginCopy14

endCopy14
% end copy 
hlt
%funcdef begin
fnfunc1
sw 292(r14),r15
% begin generating indice offseting
addi r11,r0,1
addi r9,r0,0
sw 604(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,308
lw r10,604(r14)
 add r9,r9,r10
sw 608(r14),r9
% end var offset calculation
%begin dot offsetting
lw r10,608(r14)
addi r10,r10,0
sw 612(r14),r10
%end dot offsetting
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
sw 616(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r11,616(r14)
lw r9,612(r14)
add r9,r9,r11
sw 620(r14),r9
% end var offset calculation
% begin generating indice offseting
addi r11,r0,1
addi r9,r0,0
sw 624(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,296
lw r10,624(r14)
 add r9,r9,r10
sw 628(r14),r9
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy15

%set left and right ptrs
%set ptr
lw r9,628(r14)
add r9,r14,r9
lw r10,620(r14)
add r10,r14,r10
%set position counter
mul r8,r0,r0
beginCopy15
%move data via register
lw r11,0(r9)
sw 0(r10),r11
%increment registers
addi r9,r9,4
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
lw r11,632(r14)
 add r12,r12,r11
sw 636(r14),r12
% end var offset calculation
%begin dot offsetting
lw r11,636(r14)
addi r11,r11,4
sw 640(r14),r11
%end dot offsetting
% begin intlit storeage
addi r11,r0,0
sw 644(r14), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,0
sw 648(r14), r11
% done intlit storeage
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
lw r8,648(r14)
muli r9,r11,4
mul r9,r8,r9
add r12,r12,r9
lw r8,644(r14)
muli r9,r11,4
mul r9,r8,r9
muli r9,r9,10
add r12,r12,r9
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
lw r11,660(r14)
 add r12,r12,r11
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
lw r11,656(r14)
add r11,r14,r11
%set position counter
mul r9,r0,r0
beginCopy16
%move data via register
lw r8,0(r12)
sw 0(r11),r8
%increment registers
addi r12,r12,4
addi r11,r11,4
addi r9,r9,4
%branch out if done
subi r10,r9,4
bnz r10,beginCopy16

endCopy16
% end assignment 
% begin generating indice offseting
addi r9,r0,1
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
lw r9,684(r14)
muli r12,r8,4
mul r12,r9,r12
add r10,r10,r12
lw r9,680(r14)
muli r12,r8,4
mul r12,r9,r12
muli r12,r12,10
add r10,r10,r12
sw 688(r14),r10
% done generating indice offseting
% begin var offset calculation
lw r9,688(r14)
lw r10,676(r14)
add r10,r10,r9
sw 692(r14),r10
% end var offset calculation
% begin generating indice offseting
addi r9,r0,1
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
add r9,r8,r10
sw 708(r14),r9
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy17

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,708
lw r12,692(r14)
add r12,r14,r12
%set position counter
mul r8,r0,r0
beginCopy17
%move data via register
lw r10,0(r9)
sw 0(r12),r10
%increment registers
addi r9,r9,4
addi r12,r12,4
addi r8,r8,4
%branch out if done
subi r11,r8,4
bnz r11,beginCopy17

endCopy17
% end assignment 
% begin generating indice offseting
addi r8,r0,1
addi r11,r0,0
sw 712(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,308
lw r10,712(r14)
 add r11,r11,r10
sw 716(r14),r11
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
addi r11,r0,0
lw r8,728(r14)
muli r9,r10,4
mul r9,r8,r9
add r11,r11,r9
lw r8,724(r14)
muli r9,r10,4
mul r9,r8,r9
muli r9,r9,10
add r11,r11,r9
sw 732(r14),r11
% done generating indice offseting
% begin var offset calculation
lw r8,732(r14)
lw r11,720(r14)
add r11,r11,r8
sw 736(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r8,r0,1
addi r11,r0,0
sw 740(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,304
lw r10,740(r14)
 add r11,r11,r10
sw 744(r14),r11
% end var offset calculation
% begin intlit storeage
addi r10,r0,30
sw 748(r14), r10
% done intlit storeage
% begin add op 
lw r9,744(r14)
add r9,r14,r9
lw r10,0(r9)
lw r11,748(r14)
add r8,r10,r11
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
lw r9,736(r14)
add r9,r14,r9
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
% end assignment 
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
sw 756(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,308
lw r11,756(r14)
 add r12,r12,r11
sw 760(r14),r12
% end var offset calculation
%begin dot offsetting
lw r11,760(r14)
addi r11,r11,204
sw 764(r14),r11
%end dot offsetting
% begin generating indice offseting
addi r11,r0,1
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
lw r11,776(r14)
 add r12,r12,r11
sw 780(r14),r12
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy19

%set left and right ptrs
%set ptr
lw r12,780(r14)
add r12,r14,r12
lw r11,772(r14)
add r11,r14,r11
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
% end assignment 
% begin generating indice offseting
addi r8,r0,1
addi r9,r0,0
sw 784(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,308
lw r10,784(r14)
 add r9,r9,r10
sw 788(r14),r9
% end var offset calculation
%begin dot offsetting
lw r10,788(r14)
addi r10,r10,208
sw 792(r14),r10
%end dot offsetting
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
sw 796(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r8,796(r14)
lw r9,792(r14)
add r9,r9,r8
sw 800(r14),r9
% end var offset calculation
% begin generating indice offseting
addi r8,r0,1
addi r9,r0,0
sw 804(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,296
lw r10,804(r14)
 add r9,r9,r10
sw 808(r14),r9
% end var offset calculation
% begin intlit storeage
addi r10,r0,50
sw 812(r14), r10
% done intlit storeage
% begin add op 
lw r12,808(r14)
add r12,r14,r12
lw r10,0(r12)
lw r9,812(r14)
add r8,r10,r9
sw 816(r14),r8
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy20

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
lw r9,0(r8)
sw 0(r12),r9
%increment registers
addi r8,r8,4
addi r12,r12,4
addi r10,r10,4
%branch out if done
subi r11,r10,4
bnz r11,beginCopy20

endCopy20
% end assignment 
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
sw 820(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,600
lw r9,820(r14)
 add r11,r11,r9
sw 824(r14),r11
% end var offset calculation
% begin intlit storeage
addi r9,r0,0
sw 828(r14), r9
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy21

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,828
lw r9,824(r14)
add r9,r14,r9
%set position counter
mul r8,r0,r0
beginCopy21
%move data via register
lw r10,0(r11)
sw 0(r9),r10
%increment registers
addi r11,r11,4
addi r9,r9,4
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
lw r11,832(r14)
 add r10,r10,r11
sw 836(r14),r10
% end var offset calculation
% begin intlit storeage
addi r11,r0,5
sw 840(r14), r11
% done intlit storeage
% begin RELOP op 
lw r9,836(r14)
add r9,r14,r9
lw r11,0(r9)
lw r10,840(r14)
cne r12,r11,r10
sw 844(r14),r12
% end relop op 
lw r8,844(r14)
bz r8,endwhile1
% begin generating indice offseting
addi r9,r0,1
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
lw r9,860(r14)
 add r12,r12,r9
sw 864(r14),r12
% end var offset calculation
% begin generating indice offseting
addi r9,r0,1
addi r12,r0,0
lw r10,864(r14)
add r10,r14,r10
lw r10,0(r10)
muli r11,r9,4
mul r11,r10,r11
add r12,r12,r11
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
lw r9,876(r14)
 add r12,r12,r9
sw 880(r14),r12
% end var offset calculation
% begin intlit storeage
addi r9,r0,10
sw 884(r14), r9
% done intlit storeage
% begin add op 
lw r11,880(r14)
add r11,r14,r11
lw r9,0(r11)
lw r12,884(r14)
add r10,r9,r12
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
lw r11,872(r14)
add r11,r14,r11
%set position counter
mul r9,r0,r0
beginCopy22
%move data via register
lw r12,0(r10)
sw 0(r11),r12
%increment registers
addi r10,r10,4
addi r11,r11,4
addi r9,r9,4
%branch out if done
subi r7,r9,4
bnz r7,beginCopy22

endCopy22
% end assignment 
% begin generating indice offseting
addi r9,r0,1
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
lw r9,900(r14)
 add r7,r7,r9
sw 904(r14),r7
% end var offset calculation
% begin intlit storeage
addi r9,r0,1
sw 908(r14), r9
% done intlit storeage
% begin add op 
lw r10,904(r14)
add r10,r14,r10
lw r9,0(r10)
lw r7,908(r14)
add r12,r9,r7
sw 912(r14),r12
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy23

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,912
lw r10,896(r14)
add r10,r14,r10
%set position counter
mul r9,r0,r0
beginCopy23
%move data via register
lw r7,0(r12)
sw 0(r10),r7
%increment registers
addi r12,r12,4
addi r10,r10,4
addi r9,r9,4
%branch out if done
subi r11,r9,4
bnz r11,beginCopy23

endCopy23
% end assignment 
j gowhile1
endwhile1
% begin generating indice offseting
addi r8,r0,1
addi r9,r0,0
sw 916(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,600
lw r11,916(r14)
 add r9,r9,r11
sw 920(r14),r9
% end var offset calculation
% begin intlit storeage
addi r11,r0,0
sw 924(r14), r11
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy24

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,924
lw r11,920(r14)
add r11,r14,r11
%set position counter
mul r7,r0,r0
beginCopy24
%move data via register
lw r8,0(r9)
sw 0(r11),r8
%increment registers
addi r9,r9,4
addi r11,r11,4
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
lw r9,928(r14)
 add r8,r8,r9
sw 932(r14),r8
% end var offset calculation
% begin intlit storeage
addi r9,r0,5
sw 936(r14), r9
% done intlit storeage
% begin RELOP op 
lw r11,932(r14)
add r11,r14,r11
lw r9,0(r11)
lw r8,936(r14)
cne r12,r9,r8
sw 940(r14),r12
% end relop op 
lw r7,940(r14)
bz r7,endwhile2
% begin generating indice offseting
addi r11,r0,1
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
lw r11,956(r14)
 add r12,r12,r11
sw 960(r14),r12
% end var offset calculation
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
lw r8,960(r14)
add r8,r14,r8
lw r8,0(r8)
muli r9,r11,4
mul r9,r8,r9
add r12,r12,r9
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
lw r11,972(r14)
 add r12,r12,r11
sw 976(r14),r12
% end var offset calculation
% begin intlit storeage
addi r11,r0,20
sw 980(r14), r11
% done intlit storeage
% begin add op 
lw r9,976(r14)
add r9,r14,r9
lw r11,0(r9)
lw r12,980(r14)
add r8,r11,r12
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
lw r9,968(r14)
add r9,r14,r9
%set position counter
mul r11,r0,r0
beginCopy25
%move data via register
lw r12,0(r8)
sw 0(r9),r12
%increment registers
addi r8,r8,4
addi r9,r9,4
addi r11,r11,4
%branch out if done
subi r10,r11,4
bnz r10,beginCopy25

endCopy25
% end assignment 
% begin generating indice offseting
addi r11,r0,1
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
lw r11,996(r14)
 add r10,r10,r11
sw 1000(r14),r10
% end var offset calculation
% begin intlit storeage
addi r11,r0,1
sw 1004(r14), r11
% done intlit storeage
% begin add op 
lw r8,1000(r14)
add r8,r14,r8
lw r11,0(r8)
lw r10,1004(r14)
add r12,r11,r10
sw 1008(r14),r12
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy26

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,1008
lw r8,992(r14)
add r8,r14,r8
%set position counter
mul r11,r0,r0
beginCopy26
%move data via register
lw r10,0(r12)
sw 0(r8),r10
%increment registers
addi r12,r12,4
addi r8,r8,4
addi r11,r11,4
%branch out if done
subi r9,r11,4
bnz r9,beginCopy26

endCopy26
% end assignment 
j gowhile2
endwhile2
% begin generating indice offseting
addi r7,r0,1
addi r11,r0,0
sw 1012(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,308
lw r9,1012(r14)
 add r11,r11,r9
sw 1016(r14),r11
% end var offset calculation
%check if size is zero if yes, leave
addi r12,r0,292
bz r12,endCopy27

%set left and right ptrs
%set ptr
lw r11,1016(r14)
add r11,r14,r11
addi r11,r11,0
%read direct value
add r9,r0,r14
addi r9,r9,0
%set position counter
mul r10,r0,r0
beginCopy27
%move data via register
lw r7,0(r11)
sw 0(r9),r7
%increment registers
addi r11,r11,4
addi r9,r9,4
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
fnprintmen1
sw 0(r14),r15
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
sw 596(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,588
lw r7,596(r14)
 add r12,r12,r7
sw 600(r14),r12
% end var offset calculation
% begin intlit storeage
addi r7,r0,0
sw 604(r14), r7
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy28

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,604
lw r7,600(r14)
add r7,r14,r7
%set position counter
mul r11,r0,r0
beginCopy28
%move data via register
lw r10,0(r12)
sw 0(r7),r10
%increment registers
addi r12,r12,4
addi r7,r7,4
addi r11,r11,4
%branch out if done
subi r9,r11,4
bnz r9,beginCopy28

endCopy28
% end assignment 
gowhile3
% begin generating indice offseting
addi r9,r0,1
addi r10,r0,0
sw 608(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,588
lw r12,608(r14)
 add r10,r10,r12
sw 612(r14),r10
% end var offset calculation
% begin intlit storeage
addi r12,r0,2
sw 616(r14), r12
% done intlit storeage
% begin RELOP op 
lw r7,612(r14)
add r7,r14,r7
lw r12,0(r7)
lw r10,616(r14)
cne r9,r12,r10
sw 620(r14),r9
% end relop op 
lw r11,620(r14)
bz r11,endwhile3
% begin generating indice offseting
addi r7,r0,1
addi r9,r0,0
sw 624(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,588
lw r10,624(r14)
 add r9,r9,r10
sw 628(r14),r9
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
lw r7,628(r14)
add r7,r14,r7
lw r7,0(r7)
muli r12,r10,292
mul r12,r7,r12
add r9,r9,r12
sw 632(r14),r9
% done generating indice offseting
% begin var offset calculation
addi r9,r0,4
lw r7,632(r14)
 add r9,r9,r7
sw 636(r14),r9
% end var offset calculation
%begin dot offsetting
lw r7,636(r14)
addi r7,r7,0
sw 640(r14),r7
%end dot offsetting
% begin generating indice offseting
addi r7,r0,1
addi r9,r0,0
sw 644(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r10,644(r14)
lw r9,640(r14)
add r9,r9,r10
sw 648(r14),r9
% end var offset calculation
% begin write 
lw r10,648(r14)
add r10,r14,r10
lw r10,0(r10)
%s move ptr to prevent mem corruption
addi r14,r14,1096
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
addi r14,r14,-1096
% end write
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
sw 652(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,588
lw r7,652(r14)
 add r9,r9,r7
sw 656(r14),r9
% end var offset calculation
% begin generating indice offseting
addi r7,r0,1
addi r9,r0,0
lw r10,656(r14)
add r10,r14,r10
lw r10,0(r10)
muli r12,r7,292
mul r12,r10,r12
add r9,r9,r12
sw 660(r14),r9
% done generating indice offseting
% begin var offset calculation
addi r9,r0,4
lw r10,660(r14)
 add r9,r9,r10
sw 664(r14),r9
% end var offset calculation
%begin dot offsetting
lw r10,664(r14)
addi r10,r10,204
sw 668(r14),r10
%end dot offsetting
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
sw 672(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r7,672(r14)
lw r9,668(r14)
add r9,r9,r7
sw 676(r14),r9
% end var offset calculation
% begin write 
lw r7,676(r14)
add r7,r14,r7
lw r7,0(r7)
%s move ptr to prevent mem corruption
addi r14,r14,1096
sw -8(r14),r7
addi r7,r0,buffer
sw -12(r14),r7
jl r15,intstr
sw -8(r14),r13
jl r15,putstr
addi r7,r0,newline
sw -8(r14),r7
jl r15,putstr
%s move ptr to og location 
addi r14,r14,-1096
% end write
% begin generating indice offseting
addi r7,r0,1
addi r9,r0,0
sw 680(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,588
lw r10,680(r14)
 add r9,r9,r10
sw 684(r14),r9
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
lw r7,684(r14)
add r7,r14,r7
lw r7,0(r7)
muli r12,r10,292
mul r12,r7,r12
add r9,r9,r12
sw 688(r14),r9
% done generating indice offseting
% begin var offset calculation
addi r9,r0,4
lw r7,688(r14)
 add r9,r9,r7
sw 692(r14),r9
% end var offset calculation
%begin dot offsetting
lw r7,692(r14)
addi r7,r7,4
sw 696(r14),r7
%end dot offsetting
% begin intlit storeage
addi r7,r0,0
sw 700(r14), r7
% done intlit storeage
% begin intlit storeage
addi r7,r0,0
sw 704(r14), r7
% done intlit storeage
% begin generating indice offseting
addi r7,r0,1
addi r9,r0,0
lw r10,704(r14)
muli r12,r7,4
mul r12,r10,r12
add r9,r9,r12
lw r10,700(r14)
muli r12,r7,4
mul r12,r10,r12
muli r12,r12,10
add r9,r9,r12
sw 708(r14),r9
% done generating indice offseting
% begin var offset calculation
lw r10,708(r14)
lw r9,696(r14)
add r9,r9,r10
sw 712(r14),r9
% end var offset calculation
% begin write 
lw r10,712(r14)
add r10,r14,r10
lw r10,0(r10)
%s move ptr to prevent mem corruption
addi r14,r14,1096
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
addi r14,r14,-1096
% end write
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
sw 716(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,588
lw r7,716(r14)
 add r9,r9,r7
sw 720(r14),r9
% end var offset calculation
% begin generating indice offseting
addi r7,r0,1
addi r9,r0,0
lw r10,720(r14)
add r10,r14,r10
lw r10,0(r10)
muli r12,r7,292
mul r12,r10,r12
add r9,r9,r12
sw 724(r14),r9
% done generating indice offseting
% begin var offset calculation
addi r9,r0,4
lw r10,724(r14)
 add r9,r9,r10
sw 728(r14),r9
% end var offset calculation
%begin dot offsetting
lw r10,728(r14)
addi r10,r10,4
sw 732(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,4
sw 736(r14), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,5
sw 740(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
lw r7,740(r14)
muli r12,r10,4
mul r12,r7,r12
add r9,r9,r12
lw r7,736(r14)
muli r12,r10,4
mul r12,r7,r12
muli r12,r12,10
add r9,r9,r12
sw 744(r14),r9
% done generating indice offseting
% begin var offset calculation
lw r7,744(r14)
lw r9,732(r14)
add r9,r9,r7
sw 748(r14),r9
% end var offset calculation
% begin write 
lw r7,748(r14)
add r7,r14,r7
lw r7,0(r7)
%s move ptr to prevent mem corruption
addi r14,r14,1096
sw -8(r14),r7
addi r7,r0,buffer
sw -12(r14),r7
jl r15,intstr
sw -8(r14),r13
jl r15,putstr
addi r7,r0,newline
sw -8(r14),r7
jl r15,putstr
%s move ptr to og location 
addi r14,r14,-1096
% end write
% begin generating indice offseting
addi r7,r0,1
addi r9,r0,0
sw 752(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,588
lw r10,752(r14)
 add r9,r9,r10
sw 756(r14),r9
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
lw r7,756(r14)
add r7,r14,r7
lw r7,0(r7)
muli r12,r10,292
mul r12,r7,r12
add r9,r9,r12
sw 760(r14),r9
% done generating indice offseting
% begin var offset calculation
addi r9,r0,4
lw r7,760(r14)
 add r9,r9,r7
sw 764(r14),r9
% end var offset calculation
%begin dot offsetting
lw r7,764(r14)
addi r7,r7,4
sw 768(r14),r7
%end dot offsetting
% begin intlit storeage
addi r7,r0,4
sw 772(r14), r7
% done intlit storeage
% begin intlit storeage
addi r7,r0,9
sw 776(r14), r7
% done intlit storeage
% begin generating indice offseting
addi r7,r0,1
addi r9,r0,0
lw r10,776(r14)
muli r12,r7,4
mul r12,r10,r12
add r9,r9,r12
lw r10,772(r14)
muli r12,r7,4
mul r12,r10,r12
muli r12,r12,10
add r9,r9,r12
sw 780(r14),r9
% done generating indice offseting
% begin var offset calculation
lw r10,780(r14)
lw r9,768(r14)
add r9,r9,r10
sw 784(r14),r9
% end var offset calculation
% begin write 
lw r10,784(r14)
add r10,r14,r10
lw r10,0(r10)
%s move ptr to prevent mem corruption
addi r14,r14,1096
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
addi r14,r14,-1096
% end write
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
sw 788(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,588
lw r7,788(r14)
 add r9,r9,r7
sw 792(r14),r9
% end var offset calculation
% begin generating indice offseting
addi r7,r0,1
addi r9,r0,0
lw r10,792(r14)
add r10,r14,r10
lw r10,0(r10)
muli r12,r7,292
mul r12,r10,r12
add r9,r9,r12
sw 796(r14),r9
% done generating indice offseting
% begin var offset calculation
addi r9,r0,4
lw r10,796(r14)
 add r9,r9,r10
sw 800(r14),r9
% end var offset calculation
%begin dot offsetting
lw r10,800(r14)
addi r10,r10,208
sw 804(r14),r10
%end dot offsetting
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
sw 808(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r7,808(r14)
lw r9,804(r14)
add r9,r9,r7
sw 812(r14),r9
% end var offset calculation
% begin write 
lw r7,812(r14)
add r7,r14,r7
lw r7,0(r7)
%s move ptr to prevent mem corruption
addi r14,r14,1096
sw -8(r14),r7
addi r7,r0,buffer
sw -12(r14),r7
jl r15,intstr
sw -8(r14),r13
jl r15,putstr
addi r7,r0,newline
sw -8(r14),r7
jl r15,putstr
%s move ptr to og location 
addi r14,r14,-1096
% end write
% begin generating indice offseting
addi r7,r0,1
addi r9,r0,0
sw 816(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,592
lw r10,816(r14)
 add r9,r9,r10
sw 820(r14),r9
% end var offset calculation
% begin intlit storeage
addi r10,r0,0
sw 824(r14), r10
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy29

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,824
lw r10,820(r14)
add r10,r14,r10
%set position counter
mul r12,r0,r0
beginCopy29
%move data via register
lw r7,0(r9)
sw 0(r10),r7
%increment registers
addi r9,r9,4
addi r10,r10,4
addi r12,r12,4
%branch out if done
subi r8,r12,4
bnz r8,beginCopy29

endCopy29
% end assignment 
gowhile4
% begin generating indice offseting
addi r8,r0,1
addi r7,r0,0
sw 828(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r7,r0,592
lw r9,828(r14)
 add r7,r7,r9
sw 832(r14),r7
% end var offset calculation
% begin intlit storeage
addi r9,r0,5
sw 836(r14), r9
% done intlit storeage
% begin RELOP op 
lw r10,832(r14)
add r10,r14,r10
lw r9,0(r10)
lw r7,836(r14)
cne r8,r9,r7
sw 840(r14),r8
% end relop op 
lw r12,840(r14)
bz r12,endwhile4
% begin generating indice offseting
addi r10,r0,1
addi r8,r0,0
sw 844(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,588
lw r7,844(r14)
 add r8,r8,r7
sw 848(r14),r8
% end var offset calculation
% begin generating indice offseting
addi r7,r0,1
addi r8,r0,0
lw r10,848(r14)
add r10,r14,r10
lw r10,0(r10)
muli r9,r7,292
mul r9,r10,r9
add r8,r8,r9
sw 852(r14),r8
% done generating indice offseting
% begin var offset calculation
addi r8,r0,4
lw r10,852(r14)
 add r8,r8,r10
sw 856(r14),r8
% end var offset calculation
%begin dot offsetting
lw r10,856(r14)
addi r10,r10,252
sw 860(r14),r10
%end dot offsetting
% begin generating indice offseting
addi r10,r0,1
addi r8,r0,0
sw 864(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,592
lw r7,864(r14)
 add r8,r8,r7
sw 868(r14),r8
% end var offset calculation
% begin generating indice offseting
addi r7,r0,1
addi r8,r0,0
lw r10,868(r14)
add r10,r14,r10
lw r10,0(r10)
muli r9,r7,4
mul r9,r10,r9
add r8,r8,r9
sw 872(r14),r8
% done generating indice offseting
% begin var offset calculation
lw r10,872(r14)
lw r8,860(r14)
add r8,r8,r10
sw 876(r14),r8
% end var offset calculation
% begin write 
lw r10,876(r14)
add r10,r14,r10
lw r10,0(r10)
%s move ptr to prevent mem corruption
addi r14,r14,1096
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
addi r14,r14,-1096
% end write
% begin generating indice offseting
addi r10,r0,1
addi r8,r0,0
sw 880(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,592
lw r7,880(r14)
 add r8,r8,r7
sw 884(r14),r8
% end var offset calculation
% begin generating indice offseting
addi r7,r0,1
addi r8,r0,0
sw 888(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,592
lw r10,888(r14)
 add r8,r8,r10
sw 892(r14),r8
% end var offset calculation
% begin intlit storeage
addi r10,r0,1
sw 896(r14), r10
% done intlit storeage
% begin add op 
lw r9,892(r14)
add r9,r14,r9
lw r10,0(r9)
lw r8,896(r14)
add r7,r10,r8
sw 900(r14),r7
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r6,r0,4
bz r6,endCopy30

%set left and right ptrs
%read direct value
add r7,r0,r14
addi r7,r7,900
lw r9,884(r14)
add r9,r14,r9
%set position counter
mul r10,r0,r0
beginCopy30
%move data via register
lw r8,0(r7)
sw 0(r9),r8
%increment registers
addi r7,r7,4
addi r9,r9,4
addi r10,r10,4
%branch out if done
subi r6,r10,4
bnz r6,beginCopy30

endCopy30
% end assignment 
j gowhile4
endwhile4
% begin generating indice offseting
addi r12,r0,1
addi r10,r0,0
sw 904(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,592
lw r6,904(r14)
 add r10,r10,r6
sw 908(r14),r10
% end var offset calculation
% begin intlit storeage
addi r6,r0,0
sw 912(r14), r6
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r7,r0,4
bz r7,endCopy31

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,912
lw r6,908(r14)
add r6,r14,r6
%set position counter
mul r8,r0,r0
beginCopy31
%move data via register
lw r12,0(r10)
sw 0(r6),r12
%increment registers
addi r10,r10,4
addi r6,r6,4
addi r8,r8,4
%branch out if done
subi r7,r8,4
bnz r7,beginCopy31

endCopy31
% end assignment 
gowhile5
% begin generating indice offseting
addi r7,r0,1
addi r12,r0,0
sw 916(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,592
lw r10,916(r14)
 add r12,r12,r10
sw 920(r14),r12
% end var offset calculation
% begin intlit storeage
addi r10,r0,5
sw 924(r14), r10
% done intlit storeage
% begin RELOP op 
lw r6,920(r14)
add r6,r14,r6
lw r10,0(r6)
lw r12,924(r14)
cne r7,r10,r12
sw 928(r14),r7
% end relop op 
lw r8,928(r14)
bz r8,endwhile5
% begin generating indice offseting
addi r6,r0,1
addi r7,r0,0
sw 932(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r7,r0,588
lw r12,932(r14)
 add r7,r7,r12
sw 936(r14),r7
% end var offset calculation
% begin generating indice offseting
addi r12,r0,1
addi r7,r0,0
lw r6,936(r14)
add r6,r14,r6
lw r6,0(r6)
muli r10,r12,292
mul r10,r6,r10
add r7,r7,r10
sw 940(r14),r7
% done generating indice offseting
% begin var offset calculation
addi r7,r0,4
lw r6,940(r14)
 add r7,r7,r6
sw 944(r14),r7
% end var offset calculation
%begin dot offsetting
lw r6,944(r14)
addi r6,r6,272
sw 948(r14),r6
%end dot offsetting
% begin generating indice offseting
addi r6,r0,1
addi r7,r0,0
sw 952(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r7,r0,592
lw r12,952(r14)
 add r7,r7,r12
sw 956(r14),r7
% end var offset calculation
% begin generating indice offseting
addi r12,r0,1
addi r7,r0,0
lw r6,956(r14)
add r6,r14,r6
lw r6,0(r6)
muli r10,r12,4
mul r10,r6,r10
add r7,r7,r10
sw 960(r14),r7
% done generating indice offseting
% begin var offset calculation
lw r6,960(r14)
lw r7,948(r14)
add r7,r7,r6
sw 964(r14),r7
% end var offset calculation
% begin write 
lw r6,964(r14)
add r6,r14,r6
lw r6,0(r6)
%s move ptr to prevent mem corruption
addi r14,r14,1096
sw -8(r14),r6
addi r6,r0,buffer
sw -12(r14),r6
jl r15,intstr
sw -8(r14),r13
jl r15,putstr
addi r6,r0,newline
sw -8(r14),r6
jl r15,putstr
%s move ptr to og location 
addi r14,r14,-1096
% end write
% begin generating indice offseting
addi r6,r0,1
addi r7,r0,0
sw 968(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r7,r0,592
lw r12,968(r14)
 add r7,r7,r12
sw 972(r14),r7
% end var offset calculation
% begin generating indice offseting
addi r12,r0,1
addi r7,r0,0
sw 976(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r7,r0,592
lw r6,976(r14)
 add r7,r7,r6
sw 980(r14),r7
% end var offset calculation
% begin intlit storeage
addi r6,r0,1
sw 984(r14), r6
% done intlit storeage
% begin add op 
lw r10,980(r14)
add r10,r14,r10
lw r6,0(r10)
lw r7,984(r14)
add r12,r6,r7
sw 988(r14),r12
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy32

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,988
lw r10,972(r14)
add r10,r14,r10
%set position counter
mul r6,r0,r0
beginCopy32
%move data via register
lw r7,0(r12)
sw 0(r10),r7
%increment registers
addi r12,r12,4
addi r10,r10,4
addi r6,r6,4
%branch out if done
subi r9,r6,4
bnz r9,beginCopy32

endCopy32
% end assignment 
j gowhile5
endwhile5
% begin generating indice offseting
addi r8,r0,1
addi r6,r0,0
sw 992(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r6,r0,588
lw r9,992(r14)
 add r6,r6,r9
sw 996(r14),r6
% end var offset calculation
% begin generating indice offseting
addi r9,r0,1
addi r6,r0,0
sw 1000(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r6,r0,588
lw r8,1000(r14)
 add r6,r6,r8
sw 1004(r14),r6
% end var offset calculation
% begin intlit storeage
addi r8,r0,1
sw 1008(r14), r8
% done intlit storeage
% begin add op 
lw r7,1004(r14)
add r7,r14,r7
lw r8,0(r7)
lw r6,1008(r14)
add r9,r8,r6
sw 1012(r14),r9
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy33

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,1012
lw r7,996(r14)
add r7,r14,r7
%set position counter
mul r8,r0,r0
beginCopy33
%move data via register
lw r6,0(r9)
sw 0(r7),r6
%increment registers
addi r9,r9,4
addi r7,r7,4
addi r8,r8,4
%branch out if done
subi r12,r8,4
bnz r12,beginCopy33

endCopy33
% end assignment 
j gowhile3
endwhile3
lw r15,0(r14)
jr r15 
%funcdef end
