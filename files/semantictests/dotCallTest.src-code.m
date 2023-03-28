entry
muli r0,r0,0
muli r14,r0,0
addi r14,r0,stackbase
%r14 is stack ptr, stack grows downwards or upwards
%24kb stack
% begin intlit storeage
addi r12,r0,2
sw 48(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,3
sw 52(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,10
sw 56(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,20
sw 60(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,30
sw 64(r14), r12
% done intlit storeage
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy1

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,48
%read direct value
add r12,r0,r14
addi r12,r12,148
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
addi r8,r8,52
%read direct value
add r9,r0,r14
addi r9,r9,152
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
addi r12,r12,56
%read direct value
add r11,r0,r14
addi r11,r11,156
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
addi r9,r9,60
%read direct value
add r8,r0,r14
addi r8,r8,160
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
addi r11,r11,64
%read direct value
add r12,r0,r14
addi r12,r12,164
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
addi r14,r14,104
jl r15, fnmanconstructor1
subi r14,r14,104
%check if size is zero if yes, leave
addi r12,r0,40
bz r12,endCopy6

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,104
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
subi r12,r11,40
bnz r12,beginCopy6

endCopy6
% end copy 
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 68(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,44
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
addi r12,r0,4
lw r11,76(r14)
 add r12,r12,r11
sw 80(r14),r12
% end var offset calculation
%begin dot offsetting
lw r11,80(r14)
sw 84(r14),r11
%end dot offsetting
% begin intlit storeage
addi r11,r0,5
sw 88(r14), r11
% done intlit storeage
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy7

%set left and right ptrs
%set ptr
lw r12,84(r14)
add r12,r14,r12
addi r12,r12,36
%read direct value
add r11,r0,r14
addi r11,r11,112
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
addi r9,r9,88
%read direct value
add r8,r0,r14
addi r8,r8,116
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
addi r14,r14,104
jl r15, fncanevaluatecan1
subi r14,r14,104
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy9

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,104
%read direct value
add r12,r0,r14
addi r12,r12,92
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
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy10

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,112
%set ptr
lw r9,84(r14)
add r9,r14,r9
addi r9,r9,36
addi r9,r14,0
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
subi r12,r11,4
bnz r12,beginCopy10

endCopy10
% end copy 
% begin assignment 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy11

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,92
lw r11,72(r14)
add r11,r14,r11
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
% end assignment 
% begin generating indice offseting
addi r8,r0,1
addi r9,r0,0
sw 96(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,44
lw r10,96(r14)
 add r9,r9,r10
sw 100(r14),r9
% end var offset calculation
% begin write 
lw r10,100(r14)
add r10,r14,r10
lw r10,0(r10)
%s move ptr to prevent mem corruption
addi r14,r14,184
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
addi r14,r14,-184
% end write
hlt
%funcdef begin
fnmanevaluate1
sw 4(r14),r15
% begin intlit storeage
addi r10,r0,5
sw 52(r14), r10
% done intlit storeage
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy12

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,52
%read direct value
add r10,r0,r14
addi r10,r10,0
%set position counter
mul r12,r0,r0
beginCopy12
%move data via register
lw r8,0(r9)
sw 0(r10),r8
%increment registers
addi r9,r9,4
addi r10,r10,4
addi r12,r12,4
%branch out if done
subi r11,r12,4
bnz r11,beginCopy12

endCopy12
% end copy 
lw r15,4(r14)
jr r15 
%funcdef end
%funcdef begin
fnfanevaluatefan1
sw 4(r14),r15
% begin intlit storeage
addi r12,r0,6
sw 24(r14), r12
% done intlit storeage
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy13

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,24
%read direct value
add r12,r0,r14
addi r12,r12,0
%set position counter
mul r9,r0,r0
beginCopy13
%move data via register
lw r8,0(r11)
sw 0(r12),r8
%increment registers
addi r11,r11,4
addi r12,r12,4
addi r9,r9,4
%branch out if done
subi r10,r9,4
bnz r10,beginCopy13

endCopy13
% end copy 
lw r15,4(r14)
jr r15 
%funcdef end
%funcdef begin
fndanevaluatedan1
sw 4(r14),r15
% begin intlit storeage
addi r9,r0,7
sw 16(r14), r9
% done intlit storeage
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy14

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,16
%read direct value
add r9,r0,r14
addi r9,r9,0
%set position counter
mul r11,r0,r0
beginCopy14
%move data via register
lw r8,0(r10)
sw 0(r9),r8
%increment registers
addi r10,r10,4
addi r9,r9,4
addi r11,r11,4
%branch out if done
subi r12,r11,4
bnz r12,beginCopy14

endCopy14
% end copy 
lw r15,4(r14)
jr r15 
%funcdef end
%funcdef begin
fncanevaluatecan1
sw 4(r14),r15
% begin intlit storeage
addi r11,r0,8
sw 16(r14), r11
% done intlit storeage
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy15

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,16
%read direct value
add r11,r0,r14
addi r11,r11,0
%set position counter
mul r10,r0,r0
beginCopy15
%move data via register
lw r8,0(r12)
sw 0(r11),r8
%increment registers
addi r12,r12,4
addi r11,r11,4
addi r10,r10,4
%branch out if done
subi r9,r10,4
bnz r9,beginCopy15

endCopy15
% end copy 
lw r15,4(r14)
jr r15 
%funcdef end
%funcdef begin
fnmanconstructor1
sw 40(r14),r15
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
sw 104(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,64
lw r8,104(r14)
 add r9,r9,r8
sw 108(r14),r9
% end var offset calculation
%begin dot offsetting
lw r8,108(r14)
addi r8,r8,0
sw 112(r14),r8
%end dot offsetting
% begin generating indice offseting
addi r8,r0,1
addi r9,r0,0
sw 116(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r10,116(r14)
lw r9,112(r14)
add r9,r9,r10
sw 120(r14),r9
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
sw 124(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,44
lw r8,124(r14)
 add r9,r9,r8
sw 128(r14),r9
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy16

%set left and right ptrs
%set ptr
lw r9,128(r14)
add r9,r14,r9
lw r8,120(r14)
add r8,r14,r8
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
% end assignment 
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 132(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,64
lw r10,132(r14)
 add r11,r11,r10
sw 136(r14),r11
% end var offset calculation
%begin dot offsetting
lw r10,136(r14)
addi r10,r10,4
sw 140(r14),r10
%end dot offsetting
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
sw 144(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r12,144(r14)
lw r11,140(r14)
add r11,r11,r12
sw 148(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 152(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,48
lw r10,152(r14)
 add r11,r11,r10
sw 156(r14),r11
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy17

%set left and right ptrs
%set ptr
lw r11,156(r14)
add r11,r14,r11
lw r10,148(r14)
add r10,r14,r10
%set position counter
mul r9,r0,r0
beginCopy17
%move data via register
lw r12,0(r11)
sw 0(r10),r12
%increment registers
addi r11,r11,4
addi r10,r10,4
addi r9,r9,4
%branch out if done
subi r8,r9,4
bnz r8,beginCopy17

endCopy17
% end assignment 
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
sw 160(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,64
lw r12,160(r14)
 add r8,r8,r12
sw 164(r14),r8
% end var offset calculation
%begin dot offsetting
lw r12,164(r14)
addi r12,r12,8
sw 168(r14),r12
%end dot offsetting
% begin intlit storeage
addi r12,r0,0
sw 172(r14), r12
% done intlit storeage
% begin generating indice offseting
addi r12,r0,1
addi r8,r0,0
lw r9,172(r14)
muli r11,r12,4
mul r11,r9,r11
add r8,r8,r11
sw 176(r14),r8
% done generating indice offseting
% begin var offset calculation
lw r9,176(r14)
lw r8,168(r14)
add r8,r8,r9
sw 180(r14),r8
% end var offset calculation
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
sw 184(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,52
lw r12,184(r14)
 add r8,r8,r12
sw 188(r14),r8
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy18

%set left and right ptrs
%set ptr
lw r8,188(r14)
add r8,r14,r8
lw r12,180(r14)
add r12,r14,r12
%set position counter
mul r11,r0,r0
beginCopy18
%move data via register
lw r9,0(r8)
sw 0(r12),r9
%increment registers
addi r8,r8,4
addi r12,r12,4
addi r11,r11,4
%branch out if done
subi r10,r11,4
bnz r10,beginCopy18

endCopy18
% end assignment 
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
sw 192(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,64
lw r9,192(r14)
 add r10,r10,r9
sw 196(r14),r10
% end var offset calculation
%begin dot offsetting
lw r9,196(r14)
addi r9,r9,8
sw 200(r14),r9
%end dot offsetting
% begin intlit storeage
addi r9,r0,1
sw 204(r14), r9
% done intlit storeage
% begin generating indice offseting
addi r9,r0,1
addi r10,r0,0
lw r11,204(r14)
muli r8,r9,4
mul r8,r11,r8
add r10,r10,r8
sw 208(r14),r10
% done generating indice offseting
% begin var offset calculation
lw r11,208(r14)
lw r10,200(r14)
add r10,r10,r11
sw 212(r14),r10
% end var offset calculation
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
sw 216(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,56
lw r9,216(r14)
 add r10,r10,r9
sw 220(r14),r10
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy19

%set left and right ptrs
%set ptr
lw r10,220(r14)
add r10,r14,r10
lw r9,212(r14)
add r9,r14,r9
%set position counter
mul r8,r0,r0
beginCopy19
%move data via register
lw r11,0(r10)
sw 0(r9),r11
%increment registers
addi r10,r10,4
addi r9,r9,4
addi r8,r8,4
%branch out if done
subi r12,r8,4
bnz r12,beginCopy19

endCopy19
% end assignment 
% begin generating indice offseting
addi r8,r0,1
addi r12,r0,0
sw 224(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,64
lw r11,224(r14)
 add r12,r12,r11
sw 228(r14),r12
% end var offset calculation
%begin dot offsetting
lw r11,228(r14)
addi r11,r11,8
sw 232(r14),r11
%end dot offsetting
% begin intlit storeage
addi r11,r0,2
sw 236(r14), r11
% done intlit storeage
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
lw r8,236(r14)
muli r10,r11,4
mul r10,r8,r10
add r12,r12,r10
sw 240(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r8,240(r14)
lw r12,232(r14)
add r12,r12,r8
sw 244(r14),r12
% end var offset calculation
% begin generating indice offseting
addi r8,r0,1
addi r12,r0,0
sw 248(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,60
lw r11,248(r14)
 add r12,r12,r11
sw 252(r14),r12
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy20

%set left and right ptrs
%set ptr
lw r12,252(r14)
add r12,r14,r12
lw r11,244(r14)
add r11,r14,r11
%set position counter
mul r10,r0,r0
beginCopy20
%move data via register
lw r8,0(r12)
sw 0(r11),r8
%increment registers
addi r12,r12,4
addi r11,r11,4
addi r10,r10,4
%branch out if done
subi r9,r10,4
bnz r9,beginCopy20

endCopy20
% end assignment 
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
sw 256(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,64
lw r8,256(r14)
 add r9,r9,r8
sw 260(r14),r9
% end var offset calculation
%begin dot offsetting
lw r8,260(r14)
addi r8,r8,8
sw 264(r14),r8
%end dot offsetting
% begin intlit storeage
addi r8,r0,3
sw 268(r14), r8
% done intlit storeage
% begin generating indice offseting
addi r8,r0,1
addi r9,r0,0
lw r10,268(r14)
muli r12,r8,4
mul r12,r10,r12
add r9,r9,r12
sw 272(r14),r9
% done generating indice offseting
% begin var offset calculation
lw r10,272(r14)
lw r9,264(r14)
add r9,r9,r10
sw 276(r14),r9
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
sw 280(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,52
lw r8,280(r14)
 add r9,r9,r8
sw 284(r14),r9
% end var offset calculation
% begin intlit storeage
addi r8,r0,10
sw 288(r14), r8
% done intlit storeage
% begin add op 
lw r12,284(r14)
add r12,r14,r12
lw r8,0(r12)
lw r9,288(r14)
add r10,r8,r9
sw 292(r14),r10
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy21

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,292
lw r12,276(r14)
add r12,r14,r12
%set position counter
mul r8,r0,r0
beginCopy21
%move data via register
lw r9,0(r10)
sw 0(r12),r9
%increment registers
addi r10,r10,4
addi r12,r12,4
addi r8,r8,4
%branch out if done
subi r11,r8,4
bnz r11,beginCopy21

endCopy21
% end assignment 
% begin generating indice offseting
addi r8,r0,1
addi r11,r0,0
sw 296(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,64
lw r9,296(r14)
 add r11,r11,r9
sw 300(r14),r11
% end var offset calculation
%begin dot offsetting
lw r9,300(r14)
addi r9,r9,8
sw 304(r14),r9
%end dot offsetting
% begin intlit storeage
addi r9,r0,4
sw 308(r14), r9
% done intlit storeage
% begin generating indice offseting
addi r9,r0,1
addi r11,r0,0
lw r8,308(r14)
muli r10,r9,4
mul r10,r8,r10
add r11,r11,r10
sw 312(r14),r11
% done generating indice offseting
% begin var offset calculation
lw r8,312(r14)
lw r11,304(r14)
add r11,r11,r8
sw 316(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r8,r0,1
addi r11,r0,0
sw 320(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,56
lw r9,320(r14)
 add r11,r11,r9
sw 324(r14),r11
% end var offset calculation
% begin intlit storeage
addi r9,r0,10
sw 328(r14), r9
% done intlit storeage
% begin add op 
lw r10,324(r14)
add r10,r14,r10
lw r9,0(r10)
lw r11,328(r14)
add r8,r9,r11
sw 332(r14),r8
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy22

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,332
lw r10,316(r14)
add r10,r14,r10
%set position counter
mul r9,r0,r0
beginCopy22
%move data via register
lw r11,0(r8)
sw 0(r10),r11
%increment registers
addi r8,r8,4
addi r10,r10,4
addi r9,r9,4
%branch out if done
subi r12,r9,4
bnz r12,beginCopy22

endCopy22
% end assignment 
% begin generating indice offseting
addi r9,r0,1
addi r12,r0,0
sw 336(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,64
lw r11,336(r14)
 add r12,r12,r11
sw 340(r14),r12
% end var offset calculation
%check if size is zero if yes, leave
addi r10,r0,40
bz r10,endCopy23

%set left and right ptrs
%set ptr
lw r12,340(r14)
add r12,r14,r12
addi r12,r12,0
%read direct value
add r11,r0,r14
addi r11,r11,0
%set position counter
mul r8,r0,r0
beginCopy23
%move data via register
lw r9,0(r12)
sw 0(r11),r9
%increment registers
addi r12,r12,4
addi r11,r11,4
addi r8,r8,4
%branch out if done
subi r10,r8,40
bnz r10,beginCopy23

endCopy23
% end copy 
lw r15,40(r14)
jr r15 
%funcdef end
%funcdef begin
fnhello1
sw 4(r14),r15
% begin generating indice offseting
addi r8,r0,1
addi r10,r0,0
sw 20(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,8
lw r9,20(r14)
 add r10,r10,r9
sw 24(r14),r10
% end var offset calculation
% begin generating indice offseting
addi r9,r0,1
addi r10,r0,0
sw 28(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,12
lw r8,28(r14)
 add r10,r10,r8
sw 32(r14),r10
% end var offset calculation
% begin add op 
lw r12,24(r14)
add r12,r14,r12
lw r8,0(r12)
lw r12,32(r14)
add r12,r14,r12
lw r10,0(r12)
add r9,r8,r10
sw 36(r14),r9
% end add op 
% begin generating indice offseting
addi r12,r0,1
addi r9,r0,0
sw 40(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,16
lw r10,40(r14)
 add r9,r9,r10
sw 44(r14),r9
% end var offset calculation
% begin add op 
lw r10,36(r14)
lw r8,44(r14)
add r8,r14,r8
lw r9,0(r8)
add r12,r10,r9
sw 48(r14),r12
% end add op 
% begin write 
lw r8,48(r14)
%s move ptr to prevent mem corruption
addi r14,r14,140
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
addi r14,r14,-140
% end write
% begin intlit storeage
addi r8,r0,1
sw 52(r14), r8
% done intlit storeage
% begin sign op 
lw r8,52(r14)
sub r12,r0,r8
sw 56(r14),r12
% end sign op 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy24

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,56
%read direct value
add r9,r0,r14
addi r9,r9,0
%set position counter
mul r10,r0,r0
beginCopy24
%move data via register
lw r8,0(r12)
sw 0(r9),r8
%increment registers
addi r12,r12,4
addi r9,r9,4
addi r10,r10,4
%branch out if done
subi r11,r10,4
bnz r11,beginCopy24

endCopy24
% end copy 
lw r15,4(r14)
jr r15 
%funcdef end
