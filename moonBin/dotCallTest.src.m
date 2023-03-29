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
hlt
%funcdef begin
fnbossmutateTerm1
sw 4(r14),r15
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 100(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,88
lw r10,100(r14)
 add r11,r11,r10
sw 104(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
lw r12,104(r14)
add r12,r14,r12
lw r12,0(r12)
muli r9,r10,20
mul r9,r12,r9
add r11,r11,r9
sw 108(r14),r11
% done generating indice offseting
% begin var offset calculation
addi r11,r0,8
lw r12,108(r14)
 add r11,r11,r12
sw 112(r14),r11
% end var offset calculation
%begin dot offsetting
lw r12,112(r14)
sw 116(r14),r12
%end dot offsetting
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 120(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,92
lw r10,120(r14)
 add r11,r11,r10
sw 124(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
sw 128(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,96
lw r12,128(r14)
 add r11,r11,r12
sw 132(r14),r11
% end var offset calculation
%check if size is zero if yes, leave
addi r8,r0,20
bz r8,endCopy1

%set left and right ptrs
%set ptr
lw r11,116(r14)
add r11,r14,r11
addi r11,r11,0
%read direct value
add r12,r0,r14
addi r12,r12,152
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
subi r8,r9,20
bnz r8,beginCopy1

endCopy1
% end copy 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy2

%set left and right ptrs
%set ptr
lw r8,124(r14)
add r8,r14,r8
addi r8,r8,0
%read direct value
add r9,r0,r14
addi r9,r9,172
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
%set ptr
lw r12,132(r14)
add r12,r14,r12
addi r12,r12,0
%read direct value
add r11,r0,r14
addi r11,r11,176
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
addi r14,r14,144
jl r15, fntermsmutateRun1
subi r14,r14,144
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy4

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,144
%read direct value
add r8,r0,r14
addi r8,r8,136
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
%begin copy back object
%check if size is zero if yes, leave
addi r8,r0,20
bz r8,endCopy5

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,152
%set ptr
lw r12,116(r14)
add r12,r14,r12
addi r12,r12,0
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
% begin intlit storeage
addi r9,r0,0
sw 140(r14), r9
% done intlit storeage
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy6

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,140
%read direct value
add r9,r0,r14
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
subi r12,r11,4
bnz r12,beginCopy6

endCopy6
% end copy 
lw r15,4(r14)
jr r15 
%funcdef end
%funcdef begin
fntermsmutateRun1
sw 4(r14),r15
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 36(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,28
lw r10,36(r14)
 add r12,r12,r10
sw 40(r14),r12
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
lw r11,40(r14)
add r11,r14,r11
lw r11,0(r11)
muli r8,r10,4
mul r8,r11,r8
add r12,r12,r8
sw 44(r14),r12
% done generating indice offseting
% begin var offset calculation
addi r12,r0,8
lw r11,44(r14)
 add r12,r12,r11
sw 48(r14),r12
% end var offset calculation
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 52(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,32
lw r10,52(r14)
 add r12,r12,r10
sw 56(r14),r12
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy7

%set left and right ptrs
%set ptr
lw r12,56(r14)
add r12,r14,r12
lw r10,48(r14)
add r10,r14,r10
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
subi r9,r8,4
bnz r9,beginCopy7

endCopy7
% end assignment 
% begin intlit storeage
addi r8,r0,0
sw 60(r14), r8
% done intlit storeage
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy8

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,60
%read direct value
add r8,r0,r14
addi r8,r8,0
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
lw r15,4(r14)
jr r15 
%funcdef end
%funcdef begin
fnmanmutateH1
sw 4(r14),r15
% begin generating indice offseting
addi r12,r0,1
addi r10,r0,0
sw 384(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,12
lw r11,384(r14)
 add r10,r10,r11
sw 388(r14),r10
% end var offset calculation
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
sw 392(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,380
lw r12,392(r14)
 add r10,r10,r12
sw 396(r14),r10
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy9

%set left and right ptrs
%set ptr
lw r10,396(r14)
add r10,r14,r10
lw r12,388(r14)
add r12,r14,r12
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
% end assignment 
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
sw 400(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,12
lw r11,400(r14)
 add r8,r8,r11
sw 404(r14),r8
% end var offset calculation
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy10

%set left and right ptrs
%set ptr
lw r8,404(r14)
add r8,r14,r8
addi r8,r8,0
%read direct value
add r11,r0,r14
addi r11,r11,0
%set position counter
mul r10,r0,r0
beginCopy10
%move data via register
lw r9,0(r8)
sw 0(r11),r9
%increment registers
addi r8,r8,4
addi r11,r11,4
addi r10,r10,4
%branch out if done
subi r12,r10,4
bnz r12,beginCopy10

endCopy10
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
sw 384(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,8
lw r9,384(r14)
 add r12,r12,r9
sw 388(r14),r12
% end var offset calculation
% begin generating indice offseting
addi r9,r0,1
addi r12,r0,0
sw 392(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,380
lw r10,392(r14)
 add r12,r12,r10
sw 396(r14),r12
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy11

%set left and right ptrs
%set ptr
lw r12,396(r14)
add r12,r14,r12
lw r10,388(r14)
add r10,r14,r10
%set position counter
mul r8,r0,r0
beginCopy11
%move data via register
lw r9,0(r12)
sw 0(r10),r9
%increment registers
addi r12,r12,4
addi r10,r10,4
addi r8,r8,4
%branch out if done
subi r11,r8,4
bnz r11,beginCopy11

endCopy11
% end assignment 
% begin generating indice offseting
addi r8,r0,1
addi r11,r0,0
sw 400(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,8
lw r9,400(r14)
 add r11,r11,r9
sw 404(r14),r11
% end var offset calculation
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy12

%set left and right ptrs
%set ptr
lw r11,404(r14)
add r11,r14,r11
addi r11,r11,0
%read direct value
add r9,r0,r14
addi r9,r9,0
%set position counter
mul r12,r0,r0
beginCopy12
%move data via register
lw r8,0(r11)
sw 0(r9),r8
%increment registers
addi r11,r11,4
addi r9,r9,4
addi r12,r12,4
%branch out if done
subi r10,r12,4
bnz r10,beginCopy12

endCopy12
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
sw 392(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,388
lw r8,392(r14)
 add r10,r10,r8
sw 396(r14),r10
% end var offset calculation
% begin generating indice offseting
addi r8,r0,1
addi r10,r0,0
sw 400(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,380
lw r12,400(r14)
 add r10,r10,r12
sw 404(r14),r10
% end var offset calculation
% begin generating indice offseting
addi r12,r0,1
addi r10,r0,0
lw r8,404(r14)
add r8,r14,r8
lw r8,0(r8)
muli r11,r12,4
mul r11,r8,r11
add r10,r10,r11
sw 408(r14),r10
% done generating indice offseting
% begin var offset calculation
addi r10,r0,16
lw r8,408(r14)
 add r10,r10,r8
sw 412(r14),r10
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy13

%set left and right ptrs
%set ptr
lw r10,412(r14)
add r10,r14,r10
lw r8,396(r14)
add r8,r14,r8
%set position counter
mul r11,r0,r0
beginCopy13
%move data via register
lw r12,0(r10)
sw 0(r8),r12
%increment registers
addi r10,r10,4
addi r8,r8,4
addi r11,r11,4
%branch out if done
subi r9,r11,4
bnz r9,beginCopy13

endCopy13
% end assignment 
% begin generating indice offseting
addi r11,r0,1
addi r9,r0,0
sw 416(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,380
lw r12,416(r14)
 add r9,r9,r12
sw 420(r14),r9
% end var offset calculation
% begin generating indice offseting
addi r12,r0,1
addi r9,r0,0
lw r11,420(r14)
add r11,r14,r11
lw r11,0(r11)
muli r10,r12,4
mul r10,r11,r10
add r9,r9,r10
sw 424(r14),r9
% done generating indice offseting
% begin var offset calculation
addi r9,r0,16
lw r11,424(r14)
 add r9,r9,r11
sw 428(r14),r9
% end var offset calculation
% begin generating indice offseting
addi r11,r0,1
addi r9,r0,0
sw 432(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,384
lw r12,432(r14)
 add r9,r9,r12
sw 436(r14),r9
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy14

%set left and right ptrs
%set ptr
lw r9,436(r14)
add r9,r14,r9
lw r12,428(r14)
add r12,r14,r12
%set position counter
mul r10,r0,r0
beginCopy14
%move data via register
lw r11,0(r9)
sw 0(r12),r11
%increment registers
addi r9,r9,4
addi r12,r12,4
addi r10,r10,4
%branch out if done
subi r8,r10,4
bnz r8,beginCopy14

endCopy14
% end assignment 
% begin generating indice offseting
addi r10,r0,1
addi r8,r0,0
sw 440(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,388
lw r11,440(r14)
 add r8,r8,r11
sw 444(r14),r8
% end var offset calculation
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy15

%set left and right ptrs
%set ptr
lw r8,444(r14)
add r8,r14,r8
addi r8,r8,0
%read direct value
add r11,r0,r14
addi r11,r11,0
%set position counter
mul r9,r0,r0
beginCopy15
%move data via register
lw r10,0(r8)
sw 0(r11),r10
%increment registers
addi r8,r8,4
addi r11,r11,4
addi r9,r9,4
%branch out if done
subi r12,r9,4
bnz r12,beginCopy15

endCopy15
% end copy 
lw r15,4(r14)
jr r15 
%funcdef end
%funcdef begin
fnfanmutatefan1
sw 4(r14),r15
% begin generating indice offseting
addi r9,r0,1
addi r12,r0,0
sw 36(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,32
lw r10,36(r14)
 add r12,r12,r10
sw 40(r14),r12
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
sw 44(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,24
lw r9,44(r14)
 add r12,r12,r9
sw 48(r14),r12
% end var offset calculation
% begin generating indice offseting
addi r9,r0,1
addi r12,r0,0
lw r10,48(r14)
add r10,r14,r10
lw r10,0(r10)
muli r8,r9,4
mul r8,r10,r8
add r12,r12,r8
sw 52(r14),r12
% done generating indice offseting
% begin var offset calculation
addi r12,r0,8
lw r10,52(r14)
 add r12,r12,r10
sw 56(r14),r12
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy16

%set left and right ptrs
%set ptr
lw r12,56(r14)
add r12,r14,r12
lw r10,40(r14)
add r10,r14,r10
%set position counter
mul r8,r0,r0
beginCopy16
%move data via register
lw r9,0(r12)
sw 0(r10),r9
%increment registers
addi r12,r12,4
addi r10,r10,4
addi r8,r8,4
%branch out if done
subi r11,r8,4
bnz r11,beginCopy16

endCopy16
% end assignment 
% begin generating indice offseting
addi r8,r0,1
addi r11,r0,0
sw 60(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,24
lw r9,60(r14)
 add r11,r11,r9
sw 64(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r9,r0,1
addi r11,r0,0
lw r8,64(r14)
add r8,r14,r8
lw r8,0(r8)
muli r12,r9,4
mul r12,r8,r12
add r11,r11,r12
sw 68(r14),r11
% done generating indice offseting
% begin var offset calculation
addi r11,r0,8
lw r8,68(r14)
 add r11,r11,r8
sw 72(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r8,r0,1
addi r11,r0,0
sw 76(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,28
lw r9,76(r14)
 add r11,r11,r9
sw 80(r14),r11
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy17

%set left and right ptrs
%set ptr
lw r11,80(r14)
add r11,r14,r11
lw r9,72(r14)
add r9,r14,r9
%set position counter
mul r12,r0,r0
beginCopy17
%move data via register
lw r8,0(r11)
sw 0(r9),r8
%increment registers
addi r11,r11,4
addi r9,r9,4
addi r12,r12,4
%branch out if done
subi r10,r12,4
bnz r10,beginCopy17

endCopy17
% end assignment 
% begin generating indice offseting
addi r12,r0,1
addi r10,r0,0
sw 84(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,32
lw r8,84(r14)
 add r10,r10,r8
sw 88(r14),r10
% end var offset calculation
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy18

%set left and right ptrs
%set ptr
lw r10,88(r14)
add r10,r14,r10
addi r10,r10,0
%read direct value
add r8,r0,r14
addi r8,r8,0
%set position counter
mul r11,r0,r0
beginCopy18
%move data via register
lw r12,0(r10)
sw 0(r8),r12
%increment registers
addi r10,r10,4
addi r8,r8,4
addi r11,r11,4
%branch out if done
subi r9,r11,4
bnz r9,beginCopy18

endCopy18
% end copy 
lw r15,4(r14)
jr r15 
%funcdef end
%funcdef begin
fnmanconstructor1
sw 372(r14),r15
% begin generating indice offseting
addi r11,r0,1
addi r9,r0,0
sw 768(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,396
lw r12,768(r14)
 add r9,r9,r12
sw 772(r14),r9
% end var offset calculation
%begin dot offsetting
lw r12,772(r14)
addi r12,r12,0
sw 776(r14),r12
%end dot offsetting
% begin generating indice offseting
addi r12,r0,1
addi r9,r0,0
sw 780(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r11,780(r14)
lw r9,776(r14)
add r9,r9,r11
sw 784(r14),r9
% end var offset calculation
% begin generating indice offseting
addi r11,r0,1
addi r9,r0,0
sw 788(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,376
lw r12,788(r14)
 add r9,r9,r12
sw 792(r14),r9
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy19

%set left and right ptrs
%set ptr
lw r9,792(r14)
add r9,r14,r9
lw r12,784(r14)
add r12,r14,r12
%set position counter
mul r10,r0,r0
beginCopy19
%move data via register
lw r11,0(r9)
sw 0(r12),r11
%increment registers
addi r9,r9,4
addi r12,r12,4
addi r10,r10,4
%branch out if done
subi r8,r10,4
bnz r8,beginCopy19

endCopy19
% end assignment 
% begin generating indice offseting
addi r10,r0,1
addi r8,r0,0
sw 796(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,396
lw r11,796(r14)
 add r8,r8,r11
sw 800(r14),r8
% end var offset calculation
%begin dot offsetting
lw r11,800(r14)
addi r11,r11,4
sw 804(r14),r11
%end dot offsetting
% begin generating indice offseting
addi r11,r0,1
addi r8,r0,0
sw 808(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r10,808(r14)
lw r8,804(r14)
add r8,r8,r10
sw 812(r14),r8
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r8,r0,0
sw 816(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,380
lw r11,816(r14)
 add r8,r8,r11
sw 820(r14),r8
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy20

%set left and right ptrs
%set ptr
lw r8,820(r14)
add r8,r14,r8
lw r11,812(r14)
add r11,r14,r11
%set position counter
mul r9,r0,r0
beginCopy20
%move data via register
lw r10,0(r8)
sw 0(r11),r10
%increment registers
addi r8,r8,4
addi r11,r11,4
addi r9,r9,4
%branch out if done
subi r12,r9,4
bnz r12,beginCopy20

endCopy20
% end assignment 
% begin generating indice offseting
addi r9,r0,1
addi r12,r0,0
sw 824(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,396
lw r10,824(r14)
 add r12,r12,r10
sw 828(r14),r12
% end var offset calculation
%begin dot offsetting
lw r10,828(r14)
addi r10,r10,8
sw 832(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,0
sw 836(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
lw r9,836(r14)
muli r8,r10,4
mul r8,r9,r8
add r12,r12,r8
sw 840(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r9,840(r14)
lw r12,832(r14)
add r12,r12,r9
sw 844(r14),r12
% end var offset calculation
% begin generating indice offseting
addi r9,r0,1
addi r12,r0,0
sw 848(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,384
lw r10,848(r14)
 add r12,r12,r10
sw 852(r14),r12
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy21

%set left and right ptrs
%set ptr
lw r12,852(r14)
add r12,r14,r12
lw r10,844(r14)
add r10,r14,r10
%set position counter
mul r8,r0,r0
beginCopy21
%move data via register
lw r9,0(r12)
sw 0(r10),r9
%increment registers
addi r12,r12,4
addi r10,r10,4
addi r8,r8,4
%branch out if done
subi r11,r8,4
bnz r11,beginCopy21

endCopy21
% end assignment 
% begin generating indice offseting
addi r8,r0,1
addi r11,r0,0
sw 856(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,396
lw r9,856(r14)
 add r11,r11,r9
sw 860(r14),r11
% end var offset calculation
%begin dot offsetting
lw r9,860(r14)
addi r9,r9,8
sw 864(r14),r9
%end dot offsetting
% begin intlit storeage
addi r9,r0,1
sw 868(r14), r9
% done intlit storeage
% begin generating indice offseting
addi r9,r0,1
addi r11,r0,0
lw r8,868(r14)
muli r12,r9,4
mul r12,r8,r12
add r11,r11,r12
sw 872(r14),r11
% done generating indice offseting
% begin var offset calculation
lw r8,872(r14)
lw r11,864(r14)
add r11,r11,r8
sw 876(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r8,r0,1
addi r11,r0,0
sw 880(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,388
lw r9,880(r14)
 add r11,r11,r9
sw 884(r14),r11
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy22

%set left and right ptrs
%set ptr
lw r11,884(r14)
add r11,r14,r11
lw r9,876(r14)
add r9,r14,r9
%set position counter
mul r12,r0,r0
beginCopy22
%move data via register
lw r8,0(r11)
sw 0(r9),r8
%increment registers
addi r11,r11,4
addi r9,r9,4
addi r12,r12,4
%branch out if done
subi r10,r12,4
bnz r10,beginCopy22

endCopy22
% end assignment 
% begin generating indice offseting
addi r12,r0,1
addi r10,r0,0
sw 888(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,396
lw r8,888(r14)
 add r10,r10,r8
sw 892(r14),r10
% end var offset calculation
%begin dot offsetting
lw r8,892(r14)
addi r8,r8,8
sw 896(r14),r8
%end dot offsetting
% begin intlit storeage
addi r8,r0,2
sw 900(r14), r8
% done intlit storeage
% begin generating indice offseting
addi r8,r0,1
addi r10,r0,0
lw r12,900(r14)
muli r11,r8,4
mul r11,r12,r11
add r10,r10,r11
sw 904(r14),r10
% done generating indice offseting
% begin var offset calculation
lw r12,904(r14)
lw r10,896(r14)
add r10,r10,r12
sw 908(r14),r10
% end var offset calculation
% begin generating indice offseting
addi r12,r0,1
addi r10,r0,0
sw 912(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,392
lw r8,912(r14)
 add r10,r10,r8
sw 916(r14),r10
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy23

%set left and right ptrs
%set ptr
lw r10,916(r14)
add r10,r14,r10
lw r8,908(r14)
add r8,r14,r8
%set position counter
mul r11,r0,r0
beginCopy23
%move data via register
lw r12,0(r10)
sw 0(r8),r12
%increment registers
addi r10,r10,4
addi r8,r8,4
addi r11,r11,4
%branch out if done
subi r9,r11,4
bnz r9,beginCopy23

endCopy23
% end assignment 
% begin generating indice offseting
addi r11,r0,1
addi r9,r0,0
sw 920(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,396
lw r12,920(r14)
 add r9,r9,r12
sw 924(r14),r9
% end var offset calculation
%begin dot offsetting
lw r12,924(r14)
addi r12,r12,8
sw 928(r14),r12
%end dot offsetting
% begin intlit storeage
addi r12,r0,3
sw 932(r14), r12
% done intlit storeage
% begin generating indice offseting
addi r12,r0,1
addi r9,r0,0
lw r11,932(r14)
muli r10,r12,4
mul r10,r11,r10
add r9,r9,r10
sw 936(r14),r9
% done generating indice offseting
% begin var offset calculation
lw r11,936(r14)
lw r9,928(r14)
add r9,r9,r11
sw 940(r14),r9
% end var offset calculation
% begin generating indice offseting
addi r11,r0,1
addi r9,r0,0
sw 944(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,392
lw r12,944(r14)
 add r9,r9,r12
sw 948(r14),r9
% end var offset calculation
% begin intlit storeage
addi r12,r0,10
sw 952(r14), r12
% done intlit storeage
% begin add op 
lw r10,948(r14)
add r10,r14,r10
lw r12,0(r10)
lw r9,952(r14)
add r11,r12,r9
sw 956(r14),r11
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy24

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,956
lw r10,940(r14)
add r10,r14,r10
%set position counter
mul r12,r0,r0
beginCopy24
%move data via register
lw r9,0(r11)
sw 0(r10),r9
%increment registers
addi r11,r11,4
addi r10,r10,4
addi r12,r12,4
%branch out if done
subi r8,r12,4
bnz r8,beginCopy24

endCopy24
% end assignment 
% begin generating indice offseting
addi r12,r0,1
addi r8,r0,0
sw 960(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,396
lw r9,960(r14)
 add r8,r8,r9
sw 964(r14),r8
% end var offset calculation
%begin dot offsetting
lw r9,964(r14)
addi r9,r9,8
sw 968(r14),r9
%end dot offsetting
% begin intlit storeage
addi r9,r0,4
sw 972(r14), r9
% done intlit storeage
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
lw r12,972(r14)
muli r11,r9,4
mul r11,r12,r11
add r8,r8,r11
sw 976(r14),r8
% done generating indice offseting
% begin var offset calculation
lw r12,976(r14)
lw r8,968(r14)
add r8,r8,r12
sw 980(r14),r8
% end var offset calculation
% begin generating indice offseting
addi r12,r0,1
addi r8,r0,0
sw 984(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,392
lw r9,984(r14)
 add r8,r8,r9
sw 988(r14),r8
% end var offset calculation
% begin intlit storeage
addi r9,r0,20
sw 992(r14), r9
% done intlit storeage
% begin add op 
lw r11,988(r14)
add r11,r14,r11
lw r9,0(r11)
lw r8,992(r14)
add r12,r9,r8
sw 996(r14),r12
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy25

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,996
lw r11,980(r14)
add r11,r14,r11
%set position counter
mul r9,r0,r0
beginCopy25
%move data via register
lw r8,0(r12)
sw 0(r11),r8
%increment registers
addi r12,r12,4
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
sw 1000(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,396
lw r8,1000(r14)
 add r10,r10,r8
sw 1004(r14),r10
% end var offset calculation
%check if size is zero if yes, leave
addi r11,r0,372
bz r11,endCopy26

%set left and right ptrs
%set ptr
lw r10,1004(r14)
add r10,r14,r10
addi r10,r10,0
%read direct value
add r8,r0,r14
addi r8,r8,0
%set position counter
mul r12,r0,r0
beginCopy26
%move data via register
lw r9,0(r10)
sw 0(r8),r9
%increment registers
addi r10,r10,4
addi r8,r8,4
addi r12,r12,4
%branch out if done
subi r11,r12,372
bnz r11,beginCopy26

endCopy26
% end copy 
lw r15,372(r14)
jr r15 
%funcdef end
