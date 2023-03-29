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
addi r12,r0,0
sw 124(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,0
sw 128(r14), r12
% done intlit storeage
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
lw r10,128(r14)
muli r9,r12,4
mul r9,r10,r9
add r11,r11,r9
lw r10,124(r14)
muli r9,r12,4
mul r9,r10,r9
muli r9,r9,3
add r11,r11,r9
sw 132(r14),r11
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r10,132(r14)
 add r11,r11,r10
sw 136(r14),r11
% end var offset calculation
% begin intlit storeage
addi r10,r0,10
sw 140(r14), r10
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy1

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,140
lw r10,136(r14)
add r10,r14,r10
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
% end assignment 
% begin intlit storeage
addi r9,r0,0
sw 144(r14), r9
% done intlit storeage
% begin intlit storeage
addi r9,r0,1
sw 148(r14), r9
% done intlit storeage
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
lw r12,148(r14)
muli r11,r9,4
mul r11,r12,r11
add r8,r8,r11
lw r12,144(r14)
muli r11,r9,4
mul r11,r12,r11
muli r11,r11,3
add r8,r8,r11
sw 152(r14),r8
% done generating indice offseting
% begin var offset calculation
addi r8,r0,4
lw r12,152(r14)
 add r8,r8,r12
sw 156(r14),r8
% end var offset calculation
% begin intlit storeage
addi r12,r0,9
sw 160(r14), r12
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy2

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,160
lw r12,156(r14)
add r12,r14,r12
%set position counter
mul r11,r0,r0
beginCopy2
%move data via register
lw r9,0(r8)
sw 0(r12),r9
%increment registers
addi r8,r8,4
addi r12,r12,4
addi r11,r11,4
%branch out if done
subi r10,r11,4
bnz r10,beginCopy2

endCopy2
% end assignment 
% begin intlit storeage
addi r11,r0,0
sw 164(r14), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,2
sw 168(r14), r11
% done intlit storeage
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
lw r9,168(r14)
muli r8,r11,4
mul r8,r9,r8
add r10,r10,r8
lw r9,164(r14)
muli r8,r11,4
mul r8,r9,r8
muli r8,r8,3
add r10,r10,r8
sw 172(r14),r10
% done generating indice offseting
% begin var offset calculation
addi r10,r0,4
lw r9,172(r14)
 add r10,r10,r9
sw 176(r14),r10
% end var offset calculation
% begin intlit storeage
addi r9,r0,4
sw 180(r14), r9
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy3

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,180
lw r9,176(r14)
add r9,r14,r9
%set position counter
mul r8,r0,r0
beginCopy3
%move data via register
lw r11,0(r10)
sw 0(r9),r11
%increment registers
addi r10,r10,4
addi r9,r9,4
addi r8,r8,4
%branch out if done
subi r12,r8,4
bnz r12,beginCopy3

endCopy3
% end assignment 
% begin intlit storeage
addi r8,r0,1
sw 184(r14), r8
% done intlit storeage
% begin intlit storeage
addi r8,r0,0
sw 188(r14), r8
% done intlit storeage
% begin generating indice offseting
addi r8,r0,1
addi r12,r0,0
lw r11,188(r14)
muli r10,r8,4
mul r10,r11,r10
add r12,r12,r10
lw r11,184(r14)
muli r10,r8,4
mul r10,r11,r10
muli r10,r10,3
add r12,r12,r10
sw 192(r14),r12
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r11,192(r14)
 add r12,r12,r11
sw 196(r14),r12
% end var offset calculation
% begin intlit storeage
addi r11,r0,6
sw 200(r14), r11
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy4

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,200
lw r11,196(r14)
add r11,r14,r11
%set position counter
mul r10,r0,r0
beginCopy4
%move data via register
lw r8,0(r12)
sw 0(r11),r8
%increment registers
addi r12,r12,4
addi r11,r11,4
addi r10,r10,4
%branch out if done
subi r9,r10,4
bnz r9,beginCopy4

endCopy4
% end assignment 
% begin intlit storeage
addi r10,r0,1
sw 204(r14), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,1
sw 208(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
lw r8,208(r14)
muli r12,r10,4
mul r12,r8,r12
add r9,r9,r12
lw r8,204(r14)
muli r12,r10,4
mul r12,r8,r12
muli r12,r12,3
add r9,r9,r12
sw 212(r14),r9
% done generating indice offseting
% begin var offset calculation
addi r9,r0,4
lw r8,212(r14)
 add r9,r9,r8
sw 216(r14),r9
% end var offset calculation
% begin intlit storeage
addi r8,r0,71
sw 220(r14), r8
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy5

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,220
lw r8,216(r14)
add r8,r14,r8
%set position counter
mul r12,r0,r0
beginCopy5
%move data via register
lw r10,0(r9)
sw 0(r8),r10
%increment registers
addi r9,r9,4
addi r8,r8,4
addi r12,r12,4
%branch out if done
subi r11,r12,4
bnz r11,beginCopy5

endCopy5
% end assignment 
% begin intlit storeage
addi r12,r0,1
sw 224(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,2
sw 228(r14), r12
% done intlit storeage
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
lw r10,228(r14)
muli r9,r12,4
mul r9,r10,r9
add r11,r11,r9
lw r10,224(r14)
muli r9,r12,4
mul r9,r10,r9
muli r9,r9,3
add r11,r11,r9
sw 232(r14),r11
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r10,232(r14)
 add r11,r11,r10
sw 236(r14),r11
% end var offset calculation
% begin intlit storeage
addi r10,r0,11
sw 240(r14), r10
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy6

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,240
lw r10,236(r14)
add r10,r14,r10
%set position counter
mul r9,r0,r0
beginCopy6
%move data via register
lw r12,0(r11)
sw 0(r10),r12
%increment registers
addi r11,r11,4
addi r10,r10,4
addi r9,r9,4
%branch out if done
subi r8,r9,4
bnz r8,beginCopy6

endCopy6
% end assignment 
% begin intlit storeage
addi r9,r0,2
sw 244(r14), r9
% done intlit storeage
% begin intlit storeage
addi r9,r0,0
sw 248(r14), r9
% done intlit storeage
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
lw r12,248(r14)
muli r11,r9,4
mul r11,r12,r11
add r8,r8,r11
lw r12,244(r14)
muli r11,r9,4
mul r11,r12,r11
muli r11,r11,3
add r8,r8,r11
sw 252(r14),r8
% done generating indice offseting
% begin var offset calculation
addi r8,r0,4
lw r12,252(r14)
 add r8,r8,r12
sw 256(r14),r8
% end var offset calculation
% begin intlit storeage
addi r12,r0,2
sw 260(r14), r12
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy7

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,260
lw r12,256(r14)
add r12,r14,r12
%set position counter
mul r11,r0,r0
beginCopy7
%move data via register
lw r9,0(r8)
sw 0(r12),r9
%increment registers
addi r8,r8,4
addi r12,r12,4
addi r11,r11,4
%branch out if done
subi r10,r11,4
bnz r10,beginCopy7

endCopy7
% end assignment 
% begin intlit storeage
addi r11,r0,2
sw 264(r14), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,1
sw 268(r14), r11
% done intlit storeage
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
lw r9,268(r14)
muli r8,r11,4
mul r8,r9,r8
add r10,r10,r8
lw r9,264(r14)
muli r8,r11,4
mul r8,r9,r8
muli r8,r8,3
add r10,r10,r8
sw 272(r14),r10
% done generating indice offseting
% begin var offset calculation
addi r10,r0,4
lw r9,272(r14)
 add r10,r10,r9
sw 276(r14),r10
% end var offset calculation
% begin intlit storeage
addi r9,r0,4
sw 280(r14), r9
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy8

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,280
lw r9,276(r14)
add r9,r14,r9
%set position counter
mul r8,r0,r0
beginCopy8
%move data via register
lw r11,0(r10)
sw 0(r9),r11
%increment registers
addi r10,r10,4
addi r9,r9,4
addi r8,r8,4
%branch out if done
subi r12,r8,4
bnz r12,beginCopy8

endCopy8
% end assignment 
% begin intlit storeage
addi r8,r0,2
sw 284(r14), r8
% done intlit storeage
% begin intlit storeage
addi r8,r0,2
sw 288(r14), r8
% done intlit storeage
% begin generating indice offseting
addi r8,r0,1
addi r12,r0,0
lw r11,288(r14)
muli r10,r8,4
mul r10,r11,r10
add r12,r12,r10
lw r11,284(r14)
muli r10,r8,4
mul r10,r11,r10
muli r10,r10,3
add r12,r12,r10
sw 292(r14),r12
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r11,292(r14)
 add r12,r12,r11
sw 296(r14),r12
% end var offset calculation
% begin intlit storeage
addi r11,r0,5
sw 300(r14), r11
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy9

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,300
lw r11,296(r14)
add r11,r14,r11
%set position counter
mul r10,r0,r0
beginCopy9
%move data via register
lw r8,0(r12)
sw 0(r11),r8
%increment registers
addi r12,r12,4
addi r11,r11,4
addi r10,r10,4
%branch out if done
subi r9,r10,4
bnz r9,beginCopy9

endCopy9
% end assignment 
% begin intlit storeage
addi r10,r0,0
sw 304(r14), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,0
sw 308(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
lw r8,308(r14)
muli r12,r10,4
mul r12,r8,r12
add r9,r9,r12
lw r8,304(r14)
muli r12,r10,4
mul r12,r8,r12
muli r12,r12,3
add r9,r9,r12
sw 312(r14),r9
% done generating indice offseting
% begin var offset calculation
addi r9,r0,76
lw r8,312(r14)
 add r9,r9,r8
sw 316(r14),r9
% end var offset calculation
% begin intlit storeage
addi r8,r0,1
sw 320(r14), r8
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy10

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,320
lw r8,316(r14)
add r8,r14,r8
%set position counter
mul r12,r0,r0
beginCopy10
%move data via register
lw r10,0(r9)
sw 0(r8),r10
%increment registers
addi r9,r9,4
addi r8,r8,4
addi r12,r12,4
%branch out if done
subi r11,r12,4
bnz r11,beginCopy10

endCopy10
% end assignment 
% begin intlit storeage
addi r12,r0,0
sw 324(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,1
sw 328(r14), r12
% done intlit storeage
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
lw r10,328(r14)
muli r9,r12,4
mul r9,r10,r9
add r11,r11,r9
lw r10,324(r14)
muli r9,r12,4
mul r9,r10,r9
muli r9,r9,3
add r11,r11,r9
sw 332(r14),r11
% done generating indice offseting
% begin var offset calculation
addi r11,r0,76
lw r10,332(r14)
 add r11,r11,r10
sw 336(r14),r11
% end var offset calculation
% begin intlit storeage
addi r10,r0,11
sw 340(r14), r10
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy11

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,340
lw r10,336(r14)
add r10,r14,r10
%set position counter
mul r9,r0,r0
beginCopy11
%move data via register
lw r12,0(r11)
sw 0(r10),r12
%increment registers
addi r11,r11,4
addi r10,r10,4
addi r9,r9,4
%branch out if done
subi r8,r9,4
bnz r8,beginCopy11

endCopy11
% end assignment 
% begin intlit storeage
addi r9,r0,0
sw 344(r14), r9
% done intlit storeage
% begin intlit storeage
addi r9,r0,2
sw 348(r14), r9
% done intlit storeage
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
lw r12,348(r14)
muli r11,r9,4
mul r11,r12,r11
add r8,r8,r11
lw r12,344(r14)
muli r11,r9,4
mul r11,r12,r11
muli r11,r11,3
add r8,r8,r11
sw 352(r14),r8
% done generating indice offseting
% begin var offset calculation
addi r8,r0,76
lw r12,352(r14)
 add r8,r8,r12
sw 356(r14),r8
% end var offset calculation
% begin intlit storeage
addi r12,r0,7
sw 360(r14), r12
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy12

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,360
lw r12,356(r14)
add r12,r14,r12
%set position counter
mul r11,r0,r0
beginCopy12
%move data via register
lw r9,0(r8)
sw 0(r12),r9
%increment registers
addi r8,r8,4
addi r12,r12,4
addi r11,r11,4
%branch out if done
subi r10,r11,4
bnz r10,beginCopy12

endCopy12
% end assignment 
% begin intlit storeage
addi r11,r0,1
sw 364(r14), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,0
sw 368(r14), r11
% done intlit storeage
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
lw r9,368(r14)
muli r8,r11,4
mul r8,r9,r8
add r10,r10,r8
lw r9,364(r14)
muli r8,r11,4
mul r8,r9,r8
muli r8,r8,3
add r10,r10,r8
sw 372(r14),r10
% done generating indice offseting
% begin var offset calculation
addi r10,r0,76
lw r9,372(r14)
 add r10,r10,r9
sw 376(r14),r10
% end var offset calculation
% begin intlit storeage
addi r9,r0,12
sw 380(r14), r9
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy13

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,380
lw r9,376(r14)
add r9,r14,r9
%set position counter
mul r8,r0,r0
beginCopy13
%move data via register
lw r11,0(r10)
sw 0(r9),r11
%increment registers
addi r10,r10,4
addi r9,r9,4
addi r8,r8,4
%branch out if done
subi r12,r8,4
bnz r12,beginCopy13

endCopy13
% end assignment 
% begin intlit storeage
addi r8,r0,1
sw 384(r14), r8
% done intlit storeage
% begin intlit storeage
addi r8,r0,1
sw 388(r14), r8
% done intlit storeage
% begin generating indice offseting
addi r8,r0,1
addi r12,r0,0
lw r11,388(r14)
muli r10,r8,4
mul r10,r11,r10
add r12,r12,r10
lw r11,384(r14)
muli r10,r8,4
mul r10,r11,r10
muli r10,r10,3
add r12,r12,r10
sw 392(r14),r12
% done generating indice offseting
% begin var offset calculation
addi r12,r0,76
lw r11,392(r14)
 add r12,r12,r11
sw 396(r14),r12
% end var offset calculation
% begin intlit storeage
addi r11,r0,42
sw 400(r14), r11
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy14

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,400
lw r11,396(r14)
add r11,r14,r11
%set position counter
mul r10,r0,r0
beginCopy14
%move data via register
lw r8,0(r12)
sw 0(r11),r8
%increment registers
addi r12,r12,4
addi r11,r11,4
addi r10,r10,4
%branch out if done
subi r9,r10,4
bnz r9,beginCopy14

endCopy14
% end assignment 
% begin intlit storeage
addi r10,r0,1
sw 404(r14), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,2
sw 408(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
lw r8,408(r14)
muli r12,r10,4
mul r12,r8,r12
add r9,r9,r12
lw r8,404(r14)
muli r12,r10,4
mul r12,r8,r12
muli r12,r12,3
add r9,r9,r12
sw 412(r14),r9
% done generating indice offseting
% begin var offset calculation
addi r9,r0,76
lw r8,412(r14)
 add r9,r9,r8
sw 416(r14),r9
% end var offset calculation
% begin intlit storeage
addi r8,r0,21
sw 420(r14), r8
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy15

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,420
lw r8,416(r14)
add r8,r14,r8
%set position counter
mul r12,r0,r0
beginCopy15
%move data via register
lw r10,0(r9)
sw 0(r8),r10
%increment registers
addi r9,r9,4
addi r8,r8,4
addi r12,r12,4
%branch out if done
subi r11,r12,4
bnz r11,beginCopy15

endCopy15
% end assignment 
% begin intlit storeage
addi r12,r0,2
sw 424(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,0
sw 428(r14), r12
% done intlit storeage
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
lw r10,428(r14)
muli r9,r12,4
mul r9,r10,r9
add r11,r11,r9
lw r10,424(r14)
muli r9,r12,4
mul r9,r10,r9
muli r9,r9,3
add r11,r11,r9
sw 432(r14),r11
% done generating indice offseting
% begin var offset calculation
addi r11,r0,76
lw r10,432(r14)
 add r11,r11,r10
sw 436(r14),r11
% end var offset calculation
% begin intlit storeage
addi r10,r0,42
sw 440(r14), r10
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy16

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,440
lw r10,436(r14)
add r10,r14,r10
%set position counter
mul r9,r0,r0
beginCopy16
%move data via register
lw r12,0(r11)
sw 0(r10),r12
%increment registers
addi r11,r11,4
addi r10,r10,4
addi r9,r9,4
%branch out if done
subi r8,r9,4
bnz r8,beginCopy16

endCopy16
% end assignment 
% begin intlit storeage
addi r9,r0,2
sw 444(r14), r9
% done intlit storeage
% begin intlit storeage
addi r9,r0,1
sw 448(r14), r9
% done intlit storeage
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
lw r12,448(r14)
muli r11,r9,4
mul r11,r12,r11
add r8,r8,r11
lw r12,444(r14)
muli r11,r9,4
mul r11,r12,r11
muli r11,r11,3
add r8,r8,r11
sw 452(r14),r8
% done generating indice offseting
% begin var offset calculation
addi r8,r0,76
lw r12,452(r14)
 add r8,r8,r12
sw 456(r14),r8
% end var offset calculation
% begin intlit storeage
addi r12,r0,2
sw 460(r14), r12
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy17

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,460
lw r12,456(r14)
add r12,r14,r12
%set position counter
mul r11,r0,r0
beginCopy17
%move data via register
lw r9,0(r8)
sw 0(r12),r9
%increment registers
addi r8,r8,4
addi r12,r12,4
addi r11,r11,4
%branch out if done
subi r10,r11,4
bnz r10,beginCopy17

endCopy17
% end assignment 
% begin intlit storeage
addi r11,r0,2
sw 464(r14), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,2
sw 468(r14), r11
% done intlit storeage
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
lw r9,468(r14)
muli r8,r11,4
mul r8,r9,r8
add r10,r10,r8
lw r9,464(r14)
muli r8,r11,4
mul r8,r9,r8
muli r8,r8,3
add r10,r10,r8
sw 472(r14),r10
% done generating indice offseting
% begin var offset calculation
addi r10,r0,76
lw r9,472(r14)
 add r10,r10,r9
sw 476(r14),r10
% end var offset calculation
% begin intlit storeage
addi r9,r0,4
sw 480(r14), r9
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy18

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,480
lw r9,476(r14)
add r9,r14,r9
%set position counter
mul r8,r0,r0
beginCopy18
%move data via register
lw r11,0(r10)
sw 0(r9),r11
%increment registers
addi r10,r10,4
addi r9,r9,4
addi r8,r8,4
%branch out if done
subi r12,r8,4
bnz r12,beginCopy18

endCopy18
% end assignment 
% begin generating indice offseting
addi r8,r0,1
addi r12,r0,0
sw 484(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,112
lw r11,484(r14)
 add r12,r12,r11
sw 488(r14),r12
% end var offset calculation
% begin intlit storeage
addi r11,r0,0
sw 492(r14), r11
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy19

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,492
lw r11,488(r14)
add r11,r14,r11
%set position counter
mul r10,r0,r0
beginCopy19
%move data via register
lw r8,0(r12)
sw 0(r11),r8
%increment registers
addi r12,r12,4
addi r11,r11,4
addi r10,r10,4
%branch out if done
subi r9,r10,4
bnz r9,beginCopy19

endCopy19
% end assignment 
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
sw 496(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,116
lw r8,496(r14)
 add r9,r9,r8
sw 500(r14),r9
% end var offset calculation
% begin intlit storeage
addi r8,r0,0
sw 504(r14), r8
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy20

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,504
lw r8,500(r14)
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
sw 508(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,120
lw r10,508(r14)
 add r11,r11,r10
sw 512(r14),r11
% end var offset calculation
% begin intlit storeage
addi r10,r0,0
sw 516(r14), r10
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy21

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,516
lw r10,512(r14)
add r10,r14,r10
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
subi r8,r9,4
bnz r8,beginCopy21

endCopy21
% end assignment 
gowhile1
% begin generating indice offseting
addi r8,r0,1
addi r12,r0,0
sw 520(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,112
lw r11,520(r14)
 add r12,r12,r11
sw 524(r14),r12
% end var offset calculation
% begin intlit storeage
addi r11,r0,3
sw 528(r14), r11
% done intlit storeage
% begin RELOP op 
lw r10,524(r14)
add r10,r14,r10
lw r11,0(r10)
lw r12,528(r14)
cne r8,r11,r12
sw 532(r14),r8
% end relop op 
lw r9,532(r14)
bz r9,endwhile1
% begin generating indice offseting
addi r10,r0,1
addi r8,r0,0
sw 536(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,116
lw r12,536(r14)
 add r8,r8,r12
sw 540(r14),r8
% end var offset calculation
% begin intlit storeage
addi r12,r0,0
sw 544(r14), r12
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r7,r0,4
bz r7,endCopy22

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,544
lw r12,540(r14)
add r12,r14,r12
%set position counter
mul r11,r0,r0
beginCopy22
%move data via register
lw r10,0(r8)
sw 0(r12),r10
%increment registers
addi r8,r8,4
addi r12,r12,4
addi r11,r11,4
%branch out if done
subi r7,r11,4
bnz r7,beginCopy22

endCopy22
% end assignment 
gowhile2
% begin generating indice offseting
addi r7,r0,1
addi r10,r0,0
sw 548(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,116
lw r8,548(r14)
 add r10,r10,r8
sw 552(r14),r10
% end var offset calculation
% begin intlit storeage
addi r8,r0,3
sw 556(r14), r8
% done intlit storeage
% begin RELOP op 
lw r12,552(r14)
add r12,r14,r12
lw r8,0(r12)
lw r10,556(r14)
cne r7,r8,r10
sw 560(r14),r7
% end relop op 
lw r11,560(r14)
bz r11,endwhile2
% begin generating indice offseting
addi r12,r0,1
addi r7,r0,0
sw 564(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r7,r0,120
lw r10,564(r14)
 add r7,r7,r10
sw 568(r14),r7
% end var offset calculation
% begin intlit storeage
addi r10,r0,0
sw 572(r14), r10
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r6,r0,4
bz r6,endCopy23

%set left and right ptrs
%read direct value
add r7,r0,r14
addi r7,r7,572
lw r10,568(r14)
add r10,r14,r10
%set position counter
mul r8,r0,r0
beginCopy23
%move data via register
lw r12,0(r7)
sw 0(r10),r12
%increment registers
addi r7,r7,4
addi r10,r10,4
addi r8,r8,4
%branch out if done
subi r6,r8,4
bnz r6,beginCopy23

endCopy23
% end assignment 
gowhile3
% begin generating indice offseting
addi r6,r0,1
addi r12,r0,0
sw 576(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,120
lw r7,576(r14)
 add r12,r12,r7
sw 580(r14),r12
% end var offset calculation
% begin intlit storeage
addi r7,r0,3
sw 584(r14), r7
% done intlit storeage
% begin RELOP op 
lw r10,580(r14)
add r10,r14,r10
lw r7,0(r10)
lw r12,584(r14)
cne r6,r7,r12
sw 588(r14),r6
% end relop op 
lw r8,588(r14)
bz r8,endwhile3
% begin generating indice offseting
addi r10,r0,1
addi r6,r0,0
sw 592(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r6,r0,112
lw r12,592(r14)
 add r6,r6,r12
sw 596(r14),r6
% end var offset calculation
% begin generating indice offseting
addi r12,r0,1
addi r6,r0,0
sw 600(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r6,r0,116
lw r10,600(r14)
 add r6,r6,r10
sw 604(r14),r6
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r6,r0,0
lw r12,604(r14)
add r12,r14,r12
lw r12,0(r12)
muli r7,r10,4
mul r7,r12,r7
add r6,r6,r7
lw r12,596(r14)
add r12,r14,r12
lw r12,0(r12)
muli r7,r10,4
mul r7,r12,r7
muli r7,r7,3
add r6,r6,r7
sw 608(r14),r6
% done generating indice offseting
% begin var offset calculation
addi r6,r0,40
lw r12,608(r14)
 add r6,r6,r12
sw 612(r14),r6
% end var offset calculation
% begin generating indice offseting
addi r12,r0,1
addi r6,r0,0
sw 616(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r6,r0,112
lw r10,616(r14)
 add r6,r6,r10
sw 620(r14),r6
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r6,r0,0
sw 624(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r6,r0,120
lw r12,624(r14)
 add r6,r6,r12
sw 628(r14),r6
% end var offset calculation
% begin generating indice offseting
addi r12,r0,1
addi r6,r0,0
lw r10,628(r14)
add r10,r14,r10
lw r10,0(r10)
muli r7,r12,4
mul r7,r10,r7
add r6,r6,r7
lw r10,620(r14)
add r10,r14,r10
lw r10,0(r10)
muli r7,r12,4
mul r7,r10,r7
muli r7,r7,3
add r6,r6,r7
sw 632(r14),r6
% done generating indice offseting
% begin var offset calculation
addi r6,r0,4
lw r10,632(r14)
 add r6,r6,r10
sw 636(r14),r6
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r6,r0,0
sw 640(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r6,r0,120
lw r12,640(r14)
 add r6,r6,r12
sw 644(r14),r6
% end var offset calculation
% begin generating indice offseting
addi r12,r0,1
addi r6,r0,0
sw 648(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r6,r0,116
lw r10,648(r14)
 add r6,r6,r10
sw 652(r14),r6
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r6,r0,0
lw r12,652(r14)
add r12,r14,r12
lw r12,0(r12)
muli r7,r10,4
mul r7,r12,r7
add r6,r6,r7
lw r12,644(r14)
add r12,r14,r12
lw r12,0(r12)
muli r7,r10,4
mul r7,r12,r7
muli r7,r7,3
add r6,r6,r7
sw 656(r14),r6
% done generating indice offseting
% begin var offset calculation
addi r6,r0,76
lw r12,656(r14)
 add r6,r6,r12
sw 660(r14),r6
% end var offset calculation
% begin mult op 
lw r7,636(r14)
add r7,r14,r7
lw r12,0(r7)
lw r7,660(r14)
add r7,r14,r7
lw r6,0(r7)
mul r10,r12,r6
sw 664(r14),r10
% end mult op 
% begin generating indice offseting
addi r7,r0,1
addi r10,r0,0
sw 668(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,112
lw r6,668(r14)
 add r10,r10,r6
sw 672(r14),r10
% end var offset calculation
% begin generating indice offseting
addi r6,r0,1
addi r10,r0,0
sw 676(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,116
lw r7,676(r14)
 add r10,r10,r7
sw 680(r14),r10
% end var offset calculation
% begin generating indice offseting
addi r7,r0,1
addi r10,r0,0
lw r6,680(r14)
add r6,r14,r6
lw r6,0(r6)
muli r12,r7,4
mul r12,r6,r12
add r10,r10,r12
lw r6,672(r14)
add r6,r14,r6
lw r6,0(r6)
muli r12,r7,4
mul r12,r6,r12
muli r12,r12,3
add r10,r10,r12
sw 684(r14),r10
% done generating indice offseting
% begin var offset calculation
addi r10,r0,40
lw r6,684(r14)
 add r10,r10,r6
sw 688(r14),r10
% end var offset calculation
% begin add op 
lw r6,664(r14)
lw r12,688(r14)
add r12,r14,r12
lw r10,0(r12)
add r7,r6,r10
sw 692(r14),r7
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r5,r0,4
bz r5,endCopy24

%set left and right ptrs
%read direct value
add r7,r0,r14
addi r7,r7,692
lw r12,612(r14)
add r12,r14,r12
%set position counter
mul r6,r0,r0
beginCopy24
%move data via register
lw r10,0(r7)
sw 0(r12),r10
%increment registers
addi r7,r7,4
addi r12,r12,4
addi r6,r6,4
%branch out if done
subi r5,r6,4
bnz r5,beginCopy24

endCopy24
% end assignment 
% begin generating indice offseting
addi r6,r0,1
addi r5,r0,0
sw 696(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r5,r0,120
lw r10,696(r14)
 add r5,r5,r10
sw 700(r14),r5
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r5,r0,0
sw 704(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r5,r0,120
lw r6,704(r14)
 add r5,r5,r6
sw 708(r14),r5
% end var offset calculation
% begin intlit storeage
addi r6,r0,1
sw 712(r14), r6
% done intlit storeage
% begin add op 
lw r7,708(r14)
add r7,r14,r7
lw r6,0(r7)
lw r5,712(r14)
add r10,r6,r5
sw 716(r14),r10
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy25

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,716
lw r7,700(r14)
add r7,r14,r7
%set position counter
mul r6,r0,r0
beginCopy25
%move data via register
lw r5,0(r10)
sw 0(r7),r5
%increment registers
addi r10,r10,4
addi r7,r7,4
addi r6,r6,4
%branch out if done
subi r12,r6,4
bnz r12,beginCopy25

endCopy25
% end assignment 
j gowhile3
endwhile3
% begin generating indice offseting
addi r8,r0,1
addi r6,r0,0
sw 720(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r6,r0,116
lw r12,720(r14)
 add r6,r6,r12
sw 724(r14),r6
% end var offset calculation
% begin generating indice offseting
addi r12,r0,1
addi r6,r0,0
sw 728(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r6,r0,116
lw r8,728(r14)
 add r6,r6,r8
sw 732(r14),r6
% end var offset calculation
% begin intlit storeage
addi r8,r0,1
sw 736(r14), r8
% done intlit storeage
% begin add op 
lw r5,732(r14)
add r5,r14,r5
lw r8,0(r5)
lw r6,736(r14)
add r12,r8,r6
sw 740(r14),r12
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy26

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,740
lw r5,724(r14)
add r5,r14,r5
%set position counter
mul r8,r0,r0
beginCopy26
%move data via register
lw r6,0(r12)
sw 0(r5),r6
%increment registers
addi r12,r12,4
addi r5,r5,4
addi r8,r8,4
%branch out if done
subi r10,r8,4
bnz r10,beginCopy26

endCopy26
% end assignment 
j gowhile2
endwhile2
% begin generating indice offseting
addi r11,r0,1
addi r8,r0,0
sw 744(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,112
lw r10,744(r14)
 add r8,r8,r10
sw 748(r14),r8
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r8,r0,0
sw 752(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,112
lw r11,752(r14)
 add r8,r8,r11
sw 756(r14),r8
% end var offset calculation
% begin intlit storeage
addi r11,r0,1
sw 760(r14), r11
% done intlit storeage
% begin add op 
lw r6,756(r14)
add r6,r14,r6
lw r11,0(r6)
lw r8,760(r14)
add r10,r11,r8
sw 764(r14),r10
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy27

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,764
lw r6,748(r14)
add r6,r14,r6
%set position counter
mul r11,r0,r0
beginCopy27
%move data via register
lw r8,0(r10)
sw 0(r6),r8
%increment registers
addi r10,r10,4
addi r6,r6,4
addi r11,r11,4
%branch out if done
subi r12,r11,4
bnz r12,beginCopy27

endCopy27
% end assignment 
j gowhile1
endwhile1
% begin generating indice offseting
addi r9,r0,1
addi r11,r0,0
sw 768(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,112
lw r12,768(r14)
 add r11,r11,r12
sw 772(r14),r11
% end var offset calculation
% begin intlit storeage
addi r12,r0,0
sw 776(r14), r12
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy28

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,776
lw r12,772(r14)
add r12,r14,r12
%set position counter
mul r8,r0,r0
beginCopy28
%move data via register
lw r9,0(r11)
sw 0(r12),r9
%increment registers
addi r11,r11,4
addi r12,r12,4
addi r8,r8,4
%branch out if done
subi r10,r8,4
bnz r10,beginCopy28

endCopy28
% end assignment 
% begin generating indice offseting
addi r8,r0,1
addi r10,r0,0
sw 780(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,116
lw r9,780(r14)
 add r10,r10,r9
sw 784(r14),r10
% end var offset calculation
% begin intlit storeage
addi r9,r0,0
sw 788(r14), r9
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy29

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,788
lw r9,784(r14)
add r9,r14,r9
%set position counter
mul r11,r0,r0
beginCopy29
%move data via register
lw r8,0(r10)
sw 0(r9),r8
%increment registers
addi r10,r10,4
addi r9,r9,4
addi r11,r11,4
%branch out if done
subi r12,r11,4
bnz r12,beginCopy29

endCopy29
% end assignment 
gowhile4
% begin generating indice offseting
addi r12,r0,1
addi r8,r0,0
sw 792(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,112
lw r10,792(r14)
 add r8,r8,r10
sw 796(r14),r8
% end var offset calculation
% begin intlit storeage
addi r10,r0,3
sw 800(r14), r10
% done intlit storeage
% begin RELOP op 
lw r9,796(r14)
add r9,r14,r9
lw r10,0(r9)
lw r8,800(r14)
cne r12,r10,r8
sw 804(r14),r12
% end relop op 
lw r11,804(r14)
bz r11,endwhile4
% begin generating indice offseting
addi r9,r0,1
addi r12,r0,0
sw 808(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,116
lw r8,808(r14)
 add r12,r12,r8
sw 812(r14),r12
% end var offset calculation
% begin intlit storeage
addi r8,r0,0
sw 816(r14), r8
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r6,r0,4
bz r6,endCopy30

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,816
lw r8,812(r14)
add r8,r14,r8
%set position counter
mul r10,r0,r0
beginCopy30
%move data via register
lw r9,0(r12)
sw 0(r8),r9
%increment registers
addi r12,r12,4
addi r8,r8,4
addi r10,r10,4
%branch out if done
subi r6,r10,4
bnz r6,beginCopy30

endCopy30
% end assignment 
gowhile5
% begin generating indice offseting
addi r6,r0,1
addi r9,r0,0
sw 820(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,116
lw r12,820(r14)
 add r9,r9,r12
sw 824(r14),r9
% end var offset calculation
% begin intlit storeage
addi r12,r0,3
sw 828(r14), r12
% done intlit storeage
% begin RELOP op 
lw r8,824(r14)
add r8,r14,r8
lw r12,0(r8)
lw r9,828(r14)
cne r6,r12,r9
sw 832(r14),r6
% end relop op 
lw r10,832(r14)
bz r10,endwhile5
% begin generating indice offseting
addi r8,r0,1
addi r6,r0,0
sw 836(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r6,r0,112
lw r9,836(r14)
 add r6,r6,r9
sw 840(r14),r6
% end var offset calculation
% begin generating indice offseting
addi r9,r0,1
addi r6,r0,0
sw 844(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r6,r0,116
lw r8,844(r14)
 add r6,r6,r8
sw 848(r14),r6
% end var offset calculation
% begin generating indice offseting
addi r8,r0,1
addi r6,r0,0
lw r9,848(r14)
add r9,r14,r9
lw r9,0(r9)
muli r12,r8,4
mul r12,r9,r12
add r6,r6,r12
lw r9,840(r14)
add r9,r14,r9
lw r9,0(r9)
muli r12,r8,4
mul r12,r9,r12
muli r12,r12,3
add r6,r6,r12
sw 852(r14),r6
% done generating indice offseting
% begin var offset calculation
addi r6,r0,40
lw r9,852(r14)
 add r6,r6,r9
sw 856(r14),r6
% end var offset calculation
% begin write 
lw r9,856(r14)
add r9,r14,r9
lw r9,0(r9)
%s move ptr to prevent mem corruption
addi r14,r14,988
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
addi r14,r14,-988
% end write
% begin generating indice offseting
addi r9,r0,1
addi r6,r0,0
sw 860(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r6,r0,116
lw r8,860(r14)
 add r6,r6,r8
sw 864(r14),r6
% end var offset calculation
% begin generating indice offseting
addi r8,r0,1
addi r6,r0,0
sw 868(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r6,r0,116
lw r9,868(r14)
 add r6,r6,r9
sw 872(r14),r6
% end var offset calculation
% begin intlit storeage
addi r9,r0,1
sw 876(r14), r9
% done intlit storeage
% begin add op 
lw r12,872(r14)
add r12,r14,r12
lw r9,0(r12)
lw r6,876(r14)
add r8,r9,r6
sw 880(r14),r8
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r5,r0,4
bz r5,endCopy31

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,880
lw r12,864(r14)
add r12,r14,r12
%set position counter
mul r9,r0,r0
beginCopy31
%move data via register
lw r6,0(r8)
sw 0(r12),r6
%increment registers
addi r8,r8,4
addi r12,r12,4
addi r9,r9,4
%branch out if done
subi r5,r9,4
bnz r5,beginCopy31

endCopy31
% end assignment 
j gowhile5
endwhile5
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
sw 884(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,112
lw r5,884(r14)
 add r9,r9,r5
sw 888(r14),r9
% end var offset calculation
% begin generating indice offseting
addi r5,r0,1
addi r9,r0,0
sw 892(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,112
lw r10,892(r14)
 add r9,r9,r10
sw 896(r14),r9
% end var offset calculation
% begin intlit storeage
addi r10,r0,1
sw 900(r14), r10
% done intlit storeage
% begin add op 
lw r6,896(r14)
add r6,r14,r6
lw r10,0(r6)
lw r9,900(r14)
add r5,r10,r9
sw 904(r14),r5
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy32

%set left and right ptrs
%read direct value
add r5,r0,r14
addi r5,r5,904
lw r6,888(r14)
add r6,r14,r6
%set position counter
mul r10,r0,r0
beginCopy32
%move data via register
lw r9,0(r5)
sw 0(r6),r9
%increment registers
addi r5,r5,4
addi r6,r6,4
addi r10,r10,4
%branch out if done
subi r8,r10,4
bnz r8,beginCopy32

endCopy32
% end assignment 
j gowhile4
endwhile4
hlt
