entry
muli r0,r0,0
muli r14,r0,0
addi r14,r0,stackbase
%r14 is stack ptr, stack grows downwards or upwards
%24kb stack
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 36(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,8
lw r10,36(r14)
 add r11,r11,r10
sw 40(r14),r11
% end var offset calculation
% begin intlit storeage
addi r10,r0,10
sw 44(r14), r10
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy1

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,44
lw r10,40(r14)
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
sw 48(r14), r9
% done intlit storeage
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
lw r12,48(r14)
muli r11,r9,4
mul r11,r12,r11
add r8,r8,r11
sw 52(r14),r8
% done generating indice offseting
% begin var offset calculation
addi r8,r0,12
lw r12,52(r14)
 add r8,r8,r12
sw 56(r14),r8
% end var offset calculation
% begin generating indice offseting
addi r12,r0,1
addi r8,r0,0
sw 60(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,8
lw r9,60(r14)
 add r8,r8,r9
sw 64(r14),r8
% end var offset calculation
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy2

%set left and right ptrs
%set ptr
lw r8,64(r14)
add r8,r14,r8
addi r8,r8,0
%read direct value
add r9,r0,r14
addi r9,r9,276
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
addi r14,r14,268
jl r15, fnfactorial1
subi r14,r14,268
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy3

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,268
%read direct value
add r11,r0,r14
addi r11,r11,68
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
% begin assignment 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy4

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,68
lw r8,56(r14)
add r8,r14,r8
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
subi r11,r10,4
bnz r11,beginCopy4

endCopy4
% end assignment 
% begin intlit storeage
addi r10,r0,1
sw 72(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
lw r12,72(r14)
muli r9,r10,4
mul r9,r12,r9
add r11,r11,r9
sw 76(r14),r11
% done generating indice offseting
% begin var offset calculation
addi r11,r0,12
lw r12,76(r14)
 add r11,r11,r12
sw 80(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 84(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,8
lw r10,84(r14)
 add r11,r11,r10
sw 88(r14),r11
% end var offset calculation
% begin intlit storeage
addi r10,r0,1
sw 92(r14), r10
% done intlit storeage
% begin add op 
lw r9,88(r14)
add r9,r14,r9
lw r10,0(r9)
lw r11,92(r14)
add r12,r10,r11
sw 96(r14),r12
% end add op 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy5

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,96
%read direct value
add r9,r0,r14
addi r9,r9,276
%set position counter
mul r10,r0,r0
beginCopy5
%move data via register
lw r11,0(r12)
sw 0(r9),r11
%increment registers
addi r12,r12,4
addi r9,r9,4
addi r10,r10,4
%branch out if done
subi r8,r10,4
bnz r8,beginCopy5

endCopy5
% end copy 
addi r14,r14,268
jl r15, fnfactorial1
subi r14,r14,268
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy6

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,268
%read direct value
add r10,r0,r14
addi r10,r10,100
%set position counter
mul r12,r0,r0
beginCopy6
%move data via register
lw r11,0(r8)
sw 0(r10),r11
%increment registers
addi r8,r8,4
addi r10,r10,4
addi r12,r12,4
%branch out if done
subi r9,r12,4
bnz r9,beginCopy6

endCopy6
% end copy 
% begin assignment 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy7

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,100
lw r12,80(r14)
add r12,r14,r12
%set position counter
mul r8,r0,r0
beginCopy7
%move data via register
lw r11,0(r9)
sw 0(r12),r11
%increment registers
addi r9,r9,4
addi r12,r12,4
addi r8,r8,4
%branch out if done
subi r10,r8,4
bnz r10,beginCopy7

endCopy7
% end assignment 
% begin intlit storeage
addi r8,r0,2
sw 104(r14), r8
% done intlit storeage
% begin generating indice offseting
addi r8,r0,1
addi r10,r0,0
lw r11,104(r14)
muli r9,r8,4
mul r9,r11,r9
add r10,r10,r9
sw 108(r14),r10
% done generating indice offseting
% begin var offset calculation
addi r10,r0,12
lw r11,108(r14)
 add r10,r10,r11
sw 112(r14),r10
% end var offset calculation
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
sw 116(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,8
lw r8,116(r14)
 add r10,r10,r8
sw 120(r14),r10
% end var offset calculation
% begin intlit storeage
addi r8,r0,2
sw 124(r14), r8
% done intlit storeage
% begin add op 
lw r9,120(r14)
add r9,r14,r9
lw r8,0(r9)
lw r10,124(r14)
add r11,r8,r10
sw 128(r14),r11
% end add op 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy8

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,128
%read direct value
add r9,r0,r14
addi r9,r9,276
%set position counter
mul r8,r0,r0
beginCopy8
%move data via register
lw r10,0(r11)
sw 0(r9),r10
%increment registers
addi r11,r11,4
addi r9,r9,4
addi r8,r8,4
%branch out if done
subi r12,r8,4
bnz r12,beginCopy8

endCopy8
% end copy 
addi r14,r14,268
jl r15, fnfactorial1
subi r14,r14,268
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy9

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,268
%read direct value
add r8,r0,r14
addi r8,r8,132
%set position counter
mul r11,r0,r0
beginCopy9
%move data via register
lw r10,0(r12)
sw 0(r8),r10
%increment registers
addi r12,r12,4
addi r8,r8,4
addi r11,r11,4
%branch out if done
subi r9,r11,4
bnz r9,beginCopy9

endCopy9
% end copy 
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy10

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,132
lw r11,112(r14)
add r11,r14,r11
%set position counter
mul r12,r0,r0
beginCopy10
%move data via register
lw r10,0(r9)
sw 0(r11),r10
%increment registers
addi r9,r9,4
addi r11,r11,4
addi r12,r12,4
%branch out if done
subi r8,r12,4
bnz r8,beginCopy10

endCopy10
% end assignment 
% begin intlit storeage
addi r12,r0,3
sw 136(r14), r12
% done intlit storeage
% begin generating indice offseting
addi r12,r0,1
addi r8,r0,0
lw r10,136(r14)
muli r9,r12,4
mul r9,r10,r9
add r8,r8,r9
sw 140(r14),r8
% done generating indice offseting
% begin var offset calculation
addi r8,r0,12
lw r10,140(r14)
 add r8,r8,r10
sw 144(r14),r8
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r8,r0,0
sw 148(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,8
lw r12,148(r14)
 add r8,r8,r12
sw 152(r14),r8
% end var offset calculation
% begin intlit storeage
addi r12,r0,3
sw 156(r14), r12
% done intlit storeage
% begin add op 
lw r9,152(r14)
add r9,r14,r9
lw r12,0(r9)
lw r8,156(r14)
add r10,r12,r8
sw 160(r14),r10
% end add op 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy11

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,160
%read direct value
add r9,r0,r14
addi r9,r9,276
%set position counter
mul r12,r0,r0
beginCopy11
%move data via register
lw r8,0(r10)
sw 0(r9),r8
%increment registers
addi r10,r10,4
addi r9,r9,4
addi r12,r12,4
%branch out if done
subi r11,r12,4
bnz r11,beginCopy11

endCopy11
% end copy 
addi r14,r14,268
jl r15, fnfactorial1
subi r14,r14,268
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy12

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,268
%read direct value
add r12,r0,r14
addi r12,r12,164
%set position counter
mul r10,r0,r0
beginCopy12
%move data via register
lw r8,0(r11)
sw 0(r12),r8
%increment registers
addi r11,r11,4
addi r12,r12,4
addi r10,r10,4
%branch out if done
subi r9,r10,4
bnz r9,beginCopy12

endCopy12
% end copy 
% begin assignment 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy13

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,164
lw r10,144(r14)
add r10,r14,r10
%set position counter
mul r11,r0,r0
beginCopy13
%move data via register
lw r8,0(r9)
sw 0(r10),r8
%increment registers
addi r9,r9,4
addi r10,r10,4
addi r11,r11,4
%branch out if done
subi r12,r11,4
bnz r12,beginCopy13

endCopy13
% end assignment 
% begin intlit storeage
addi r11,r0,4
sw 168(r14), r11
% done intlit storeage
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
lw r8,168(r14)
muli r9,r11,4
mul r9,r8,r9
add r12,r12,r9
sw 172(r14),r12
% done generating indice offseting
% begin var offset calculation
addi r12,r0,12
lw r8,172(r14)
 add r12,r12,r8
sw 176(r14),r12
% end var offset calculation
% begin generating indice offseting
addi r8,r0,1
addi r12,r0,0
sw 180(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,8
lw r11,180(r14)
 add r12,r12,r11
sw 184(r14),r12
% end var offset calculation
% begin intlit storeage
addi r11,r0,4
sw 188(r14), r11
% done intlit storeage
% begin add op 
lw r9,184(r14)
add r9,r14,r9
lw r11,0(r9)
lw r12,188(r14)
add r8,r11,r12
sw 192(r14),r8
% end add op 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy14

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,192
%read direct value
add r9,r0,r14
addi r9,r9,276
%set position counter
mul r11,r0,r0
beginCopy14
%move data via register
lw r12,0(r8)
sw 0(r9),r12
%increment registers
addi r8,r8,4
addi r9,r9,4
addi r11,r11,4
%branch out if done
subi r10,r11,4
bnz r10,beginCopy14

endCopy14
% end copy 
addi r14,r14,268
jl r15, fnfactorial1
subi r14,r14,268
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy15

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,268
%read direct value
add r11,r0,r14
addi r11,r11,196
%set position counter
mul r8,r0,r0
beginCopy15
%move data via register
lw r12,0(r10)
sw 0(r11),r12
%increment registers
addi r10,r10,4
addi r11,r11,4
addi r8,r8,4
%branch out if done
subi r9,r8,4
bnz r9,beginCopy15

endCopy15
% end copy 
% begin assignment 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy16

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,196
lw r8,176(r14)
add r8,r14,r8
%set position counter
mul r10,r0,r0
beginCopy16
%move data via register
lw r12,0(r9)
sw 0(r8),r12
%increment registers
addi r9,r9,4
addi r8,r8,4
addi r10,r10,4
%branch out if done
subi r11,r10,4
bnz r11,beginCopy16

endCopy16
% end assignment 
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
sw 200(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,32
lw r12,200(r14)
 add r11,r11,r12
sw 204(r14),r11
% end var offset calculation
% begin intlit storeage
addi r12,r0,0
sw 208(r14), r12
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy17

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,208
lw r12,204(r14)
add r12,r14,r12
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
% end assignment 
gowhile1
% begin generating indice offseting
addi r8,r0,1
addi r10,r0,0
sw 212(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,32
lw r11,212(r14)
 add r10,r10,r11
sw 216(r14),r10
% end var offset calculation
% begin intlit storeage
addi r11,r0,5
sw 220(r14), r11
% done intlit storeage
% begin RELOP op 
lw r12,216(r14)
add r12,r14,r12
lw r11,0(r12)
lw r10,220(r14)
cne r8,r11,r10
sw 224(r14),r8
% end relop op 
lw r9,224(r14)
bz r9,endwhile1
% begin generating indice offseting
addi r12,r0,1
addi r8,r0,0
sw 228(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,32
lw r10,228(r14)
 add r8,r8,r10
sw 232(r14),r8
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r8,r0,0
lw r12,232(r14)
add r12,r14,r12
lw r12,0(r12)
muli r11,r10,4
mul r11,r12,r11
add r8,r8,r11
sw 236(r14),r8
% done generating indice offseting
% begin var offset calculation
addi r8,r0,12
lw r12,236(r14)
 add r8,r8,r12
sw 240(r14),r8
% end var offset calculation
% begin write 
lw r12,240(r14)
add r12,r14,r12
lw r12,0(r12)
%s move ptr to prevent mem corruption
addi r14,r14,348
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
addi r14,r14,-348
% end write
% begin generating indice offseting
addi r12,r0,1
addi r8,r0,0
sw 244(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,32
lw r10,244(r14)
 add r8,r8,r10
sw 248(r14),r8
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r8,r0,0
sw 252(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,32
lw r12,252(r14)
 add r8,r8,r12
sw 256(r14),r8
% end var offset calculation
% begin intlit storeage
addi r12,r0,1
sw 260(r14), r12
% done intlit storeage
% begin add op 
lw r11,256(r14)
add r11,r14,r11
lw r12,0(r11)
lw r8,260(r14)
add r10,r12,r8
sw 264(r14),r10
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r7,r0,4
bz r7,endCopy18

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,264
lw r11,248(r14)
add r11,r14,r11
%set position counter
mul r12,r0,r0
beginCopy18
%move data via register
lw r8,0(r10)
sw 0(r11),r8
%increment registers
addi r10,r10,4
addi r11,r11,4
addi r12,r12,4
%branch out if done
subi r7,r12,4
bnz r7,beginCopy18

endCopy18
% end assignment 
j gowhile1
endwhile1
hlt
%funcdef begin
fnfactorial1
sw 4(r14),r15
% begin generating indice offseting
addi r12,r0,1
addi r7,r0,0
sw 12(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r7,r0,8
lw r8,12(r14)
 add r7,r7,r8
sw 16(r14),r7
% end var offset calculation
% begin intlit storeage
addi r8,r0,0
sw 20(r14), r8
% done intlit storeage
% begin RELOP op 
lw r10,16(r14)
add r10,r14,r10
lw r8,0(r10)
lw r7,20(r14)
ceq r12,r8,r7
sw 24(r14),r12
% end relop op 
lw r9,24(r14)
bz r9,else1
% begin intlit storeage
addi r10,r0,1
sw 28(r14), r10
% done intlit storeage
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy19

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,28
%read direct value
add r10,r0,r14
addi r10,r10,0
%set position counter
mul r8,r0,r0
beginCopy19
%move data via register
lw r7,0(r12)
sw 0(r10),r7
%increment registers
addi r12,r12,4
addi r10,r10,4
addi r8,r8,4
%branch out if done
subi r11,r8,4
bnz r11,beginCopy19

endCopy19
% end copy 
j endif1
else1
% begin generating indice offseting
addi r8,r0,1
addi r11,r0,0
sw 32(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,8
lw r7,32(r14)
 add r11,r11,r7
sw 36(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r7,r0,1
addi r11,r0,0
sw 40(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,8
lw r8,40(r14)
 add r11,r11,r8
sw 44(r14),r11
% end var offset calculation
% begin intlit storeage
addi r8,r0,1
sw 48(r14), r8
% done intlit storeage
% begin add op 
lw r12,44(r14)
add r12,r14,r12
lw r8,0(r12)
lw r11,48(r14)
sub r7,r8,r11
sw 52(r14),r7
% end add op 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy20

%set left and right ptrs
%read direct value
add r7,r0,r14
addi r7,r7,52
%read direct value
add r12,r0,r14
addi r12,r12,72
%set position counter
mul r8,r0,r0
beginCopy20
%move data via register
lw r11,0(r7)
sw 0(r12),r11
%increment registers
addi r7,r7,4
addi r12,r12,4
addi r8,r8,4
%branch out if done
subi r10,r8,4
bnz r10,beginCopy20

endCopy20
% end copy 
addi r14,r14,64
jl r15, fnfactorial1
subi r14,r14,64
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy21

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,64
%read direct value
add r8,r0,r14
addi r8,r8,56
%set position counter
mul r7,r0,r0
beginCopy21
%move data via register
lw r11,0(r10)
sw 0(r8),r11
%increment registers
addi r10,r10,4
addi r8,r8,4
addi r7,r7,4
%branch out if done
subi r12,r7,4
bnz r12,beginCopy21

endCopy21
% end copy 
% begin mult op 
lw r10,36(r14)
add r10,r14,r10
lw r7,0(r10)
lw r12,56(r14)
mul r11,r7,r12
sw 60(r14),r11
% end mult op 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy22

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,60
%read direct value
add r10,r0,r14
addi r10,r10,0
%set position counter
mul r7,r0,r0
beginCopy22
%move data via register
lw r12,0(r11)
sw 0(r10),r12
%increment registers
addi r11,r11,4
addi r10,r10,4
addi r7,r7,4
%branch out if done
subi r8,r7,4
bnz r8,beginCopy22

endCopy22
% end copy 
endif1
lw r15,4(r14)
jr r15 
%funcdef end
