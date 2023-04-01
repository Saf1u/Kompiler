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
sw 32(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r10,32(r14)
 add r11,r11,r10
sw 36(r14),r11
% end var offset calculation
% begin intlit storeage
addi r10,r0,0
sw 40(r14), r10
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy1

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,40
lw r10,36(r14)
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
gowhile1
% begin generating indice offseting
addi r8,r0,1
addi r12,r0,0
sw 44(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r11,44(r14)
 add r12,r12,r11
sw 48(r14),r12
% end var offset calculation
% begin intlit storeage
addi r11,r0,5
sw 52(r14), r11
% done intlit storeage
% begin RELOP op 
lw r10,48(r14)
add r10,r14,r10
lw r11,0(r10)
lw r12,52(r14)
cne r8,r11,r12
sw 56(r14),r8
% end relop op 
lw r9,56(r14)
bz r9,endwhile1
% begin generating indice offseting
addi r10,r0,1
addi r8,r0,0
sw 60(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,4
lw r12,60(r14)
 add r8,r8,r12
sw 64(r14),r8
% end var offset calculation
% begin generating indice offseting
addi r12,r0,1
addi r8,r0,0
lw r10,64(r14)
add r10,r14,r10
lw r10,0(r10)
muli r11,r12,4
mul r11,r10,r11
add r8,r8,r11
sw 68(r14),r8
% done generating indice offseting
% begin var offset calculation
addi r8,r0,8
lw r10,68(r14)
 add r8,r8,r10
sw 72(r14),r8
% end var offset calculation
%begin dot offsetting
lw r10,72(r14)
addi r10,r10,0
sw 76(r14),r10
%end dot offsetting
% begin generating indice offseting
addi r10,r0,1
addi r8,r0,0
sw 80(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,4
lw r12,80(r14)
 add r8,r8,r12
sw 84(r14),r8
% end var offset calculation
% begin intlit storeage
addi r12,r0,1
sw 88(r14), r12
% done intlit storeage
% begin add op 
lw r11,84(r14)
add r11,r14,r11
lw r12,0(r11)
lw r8,88(r14)
add r10,r12,r8
sw 92(r14),r10
% end add op 
% begin intlit storeage
addi r11,r0,2
sw 96(r14), r11
% done intlit storeage
% begin mult op 
lw r11,92(r14)
lw r10,96(r14)
mul r8,r11,r10
sw 100(r14),r8
% end mult op 
%check if size is zero if yes, leave
addi r7,r0,4
bz r7,endCopy2

%set left and right ptrs
%set ptr
lw r8,76(r14)
add r8,r14,r8
addi r8,r8,0
%read direct value
add r12,r0,r14
addi r12,r12,224
%set position counter
mul r11,r0,r0
beginCopy2
%move data via register
lw r10,0(r8)
sw 0(r12),r10
%increment registers
addi r8,r8,4
addi r12,r12,4
addi r11,r11,4
%branch out if done
subi r7,r11,4
bnz r7,beginCopy2

endCopy2
% end copy 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy3

%set left and right ptrs
%read direct value
add r7,r0,r14
addi r7,r7,100
%read direct value
add r11,r0,r14
addi r11,r11,228
%set position counter
mul r8,r0,r0
beginCopy3
%move data via register
lw r10,0(r7)
sw 0(r11),r10
%increment registers
addi r7,r7,4
addi r11,r11,4
addi r8,r8,4
%branch out if done
subi r12,r8,4
bnz r12,beginCopy3

endCopy3
% end copy 
addi r14,r14,220
jl r15, fnMansetX1
subi r14,r14,220
%check if size is zero if yes, leave
addi r11,r0,0
bz r11,endCopy4

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,220
%read direct value
add r8,r0,r14
addi r8,r8,104
%set position counter
mul r7,r0,r0
beginCopy4
%move data via register
lw r10,0(r12)
sw 0(r8),r10
%increment registers
addi r12,r12,4
addi r8,r8,4
addi r7,r7,4
%branch out if done
subi r11,r7,0
bnz r11,beginCopy4

endCopy4
% end copy 
%begin copy back object
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy5

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,224
%set ptr
lw r7,76(r14)
add r7,r14,r7
addi r7,r7,0
%set position counter
mul r12,r0,r0
beginCopy5
%move data via register
lw r10,0(r11)
sw 0(r7),r10
%increment registers
addi r11,r11,4
addi r7,r7,4
addi r12,r12,4
%branch out if done
subi r8,r12,4
bnz r8,beginCopy5

endCopy5
% end copy 
% begin generating indice offseting
addi r12,r0,1
addi r8,r0,0
sw 104(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,4
lw r10,104(r14)
 add r8,r8,r10
sw 108(r14),r8
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r8,r0,0
sw 112(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,4
lw r12,112(r14)
 add r8,r8,r12
sw 116(r14),r8
% end var offset calculation
% begin intlit storeage
addi r12,r0,1
sw 120(r14), r12
% done intlit storeage
% begin add op 
lw r11,116(r14)
add r11,r14,r11
lw r12,0(r11)
lw r8,120(r14)
add r10,r12,r8
sw 124(r14),r10
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r7,r0,4
bz r7,endCopy6

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,124
lw r11,108(r14)
add r11,r14,r11
%set position counter
mul r12,r0,r0
beginCopy6
%move data via register
lw r8,0(r10)
sw 0(r11),r8
%increment registers
addi r10,r10,4
addi r11,r11,4
addi r12,r12,4
%branch out if done
subi r7,r12,4
bnz r7,beginCopy6

endCopy6
% end assignment 
j gowhile1
endwhile1
% begin generating indice offseting
addi r9,r0,1
addi r12,r0,0
sw 128(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r7,128(r14)
 add r12,r12,r7
sw 132(r14),r12
% end var offset calculation
% begin intlit storeage
addi r7,r0,0
sw 136(r14), r7
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy7

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,136
lw r7,132(r14)
add r7,r14,r7
%set position counter
mul r8,r0,r0
beginCopy7
%move data via register
lw r9,0(r12)
sw 0(r7),r9
%increment registers
addi r12,r12,4
addi r7,r7,4
addi r8,r8,4
%branch out if done
subi r10,r8,4
bnz r10,beginCopy7

endCopy7
% end assignment 
gowhile2
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
sw 140(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,4
lw r12,140(r14)
 add r9,r9,r12
sw 144(r14),r9
% end var offset calculation
% begin intlit storeage
addi r12,r0,5
sw 148(r14), r12
% done intlit storeage
% begin RELOP op 
lw r7,144(r14)
add r7,r14,r7
lw r12,0(r7)
lw r9,148(r14)
cne r10,r12,r9
sw 152(r14),r10
% end relop op 
lw r8,152(r14)
bz r8,endwhile2
% begin generating indice offseting
addi r7,r0,1
addi r10,r0,0
sw 156(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,28
lw r9,156(r14)
 add r10,r10,r9
sw 160(r14),r10
% end var offset calculation
% begin generating indice offseting
addi r9,r0,1
addi r10,r0,0
sw 164(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,4
lw r7,164(r14)
 add r10,r10,r7
sw 168(r14),r10
% end var offset calculation
% begin generating indice offseting
addi r7,r0,1
addi r10,r0,0
lw r9,168(r14)
add r9,r14,r9
lw r9,0(r9)
muli r12,r7,4
mul r12,r9,r12
add r10,r10,r12
sw 172(r14),r10
% done generating indice offseting
% begin var offset calculation
addi r10,r0,8
lw r9,172(r14)
 add r10,r10,r9
sw 176(r14),r10
% end var offset calculation
%begin dot offsetting
lw r9,176(r14)
addi r9,r9,0
sw 180(r14),r9
%end dot offsetting
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy8

%set left and right ptrs
%set ptr
lw r10,180(r14)
add r10,r14,r10
addi r10,r10,0
%read direct value
add r9,r0,r14
addi r9,r9,228
%set position counter
mul r12,r0,r0
beginCopy8
%move data via register
lw r7,0(r10)
sw 0(r9),r7
%increment registers
addi r10,r10,4
addi r9,r9,4
addi r12,r12,4
%branch out if done
subi r11,r12,4
bnz r11,beginCopy8

endCopy8
% end copy 
addi r14,r14,220
jl r15, fnMangetX1
subi r14,r14,220
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy9

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,220
%read direct value
add r12,r0,r14
addi r12,r12,184
%set position counter
mul r10,r0,r0
beginCopy9
%move data via register
lw r7,0(r11)
sw 0(r12),r7
%increment registers
addi r11,r11,4
addi r12,r12,4
addi r10,r10,4
%branch out if done
subi r9,r10,4
bnz r9,beginCopy9

endCopy9
% end copy 
%begin copy back object
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy10

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,228
%set ptr
lw r10,180(r14)
add r10,r14,r10
addi r10,r10,0
%set position counter
mul r11,r0,r0
beginCopy10
%move data via register
lw r7,0(r9)
sw 0(r10),r7
%increment registers
addi r9,r9,4
addi r10,r10,4
addi r11,r11,4
%branch out if done
subi r12,r11,4
bnz r12,beginCopy10

endCopy10
% end copy 
% begin assignment 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy11

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,184
lw r11,160(r14)
add r11,r14,r11
%set position counter
mul r9,r0,r0
beginCopy11
%move data via register
lw r7,0(r12)
sw 0(r11),r7
%increment registers
addi r12,r12,4
addi r11,r11,4
addi r9,r9,4
%branch out if done
subi r10,r9,4
bnz r10,beginCopy11

endCopy11
% end assignment 
% begin generating indice offseting
addi r9,r0,1
addi r10,r0,0
sw 188(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,28
lw r7,188(r14)
 add r10,r10,r7
sw 192(r14),r10
% end var offset calculation
% begin write 
lw r7,192(r14)
add r7,r14,r7
lw r7,0(r7)
%s move ptr to prevent mem corruption
addi r14,r14,300
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
addi r14,r14,-300
% end write
% begin generating indice offseting
addi r7,r0,1
addi r10,r0,0
sw 196(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,4
lw r9,196(r14)
 add r10,r10,r9
sw 200(r14),r10
% end var offset calculation
% begin generating indice offseting
addi r9,r0,1
addi r10,r0,0
sw 204(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,4
lw r7,204(r14)
 add r10,r10,r7
sw 208(r14),r10
% end var offset calculation
% begin intlit storeage
addi r7,r0,1
sw 212(r14), r7
% done intlit storeage
% begin add op 
lw r12,208(r14)
add r12,r14,r12
lw r7,0(r12)
lw r10,212(r14)
add r9,r7,r10
sw 216(r14),r9
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy12

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,216
lw r12,200(r14)
add r12,r14,r12
%set position counter
mul r7,r0,r0
beginCopy12
%move data via register
lw r10,0(r9)
sw 0(r12),r10
%increment registers
addi r9,r9,4
addi r12,r12,4
addi r7,r7,4
%branch out if done
subi r11,r7,4
bnz r11,beginCopy12

endCopy12
% end assignment 
j gowhile2
endwhile2
hlt
%funcdef begin
fnMansetX1
sw 0(r14),r15
% begin generating indice offseting
addi r8,r0,1
addi r7,r0,0
sw 12(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r7,r0,4
lw r11,12(r14)
 add r7,r7,r11
sw 16(r14),r7
% end var offset calculation
% begin generating indice offseting
addi r11,r0,1
addi r7,r0,0
sw 20(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r7,r0,8
lw r8,20(r14)
 add r7,r7,r8
sw 24(r14),r7
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy13

%set left and right ptrs
%set ptr
lw r7,24(r14)
add r7,r14,r7
lw r8,16(r14)
add r8,r14,r8
%set position counter
mul r10,r0,r0
beginCopy13
%move data via register
lw r11,0(r7)
sw 0(r8),r11
%increment registers
addi r7,r7,4
addi r8,r8,4
addi r10,r10,4
%branch out if done
subi r9,r10,4
bnz r9,beginCopy13

endCopy13
% end assignment 
lw r15,0(r14)
jr r15 
%funcdef end
%funcdef begin
fnMangetX1
sw 4(r14),r15
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
sw 12(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,8
lw r11,12(r14)
 add r9,r9,r11
sw 16(r14),r9
% end var offset calculation
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy14

%set left and right ptrs
%set ptr
lw r9,16(r14)
add r9,r14,r9
addi r9,r9,0
%read direct value
add r11,r0,r14
addi r11,r11,0
%set position counter
mul r7,r0,r0
beginCopy14
%move data via register
lw r10,0(r9)
sw 0(r11),r10
%increment registers
addi r9,r9,4
addi r11,r11,4
addi r7,r7,4
%branch out if done
subi r8,r7,4
bnz r8,beginCopy14

endCopy14
% end copy 
lw r15,4(r14)
jr r15 
%funcdef end
%funcdef begin
fnplay1
sw 0(r14),r15
% begin generating indice offseting
addi r7,r0,1
addi r8,r0,0
sw 28(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,24
lw r10,28(r14)
 add r8,r8,r10
sw 32(r14),r8
% end var offset calculation
% begin intlit storeage
addi r10,r0,0
sw 36(r14), r10
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy15

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,36
lw r10,32(r14)
add r10,r14,r10
%set position counter
mul r9,r0,r0
beginCopy15
%move data via register
lw r7,0(r8)
sw 0(r10),r7
%increment registers
addi r8,r8,4
addi r10,r10,4
addi r9,r9,4
%branch out if done
subi r11,r9,4
bnz r11,beginCopy15

endCopy15
% end assignment 
gowhile3
% begin generating indice offseting
addi r11,r0,1
addi r7,r0,0
sw 40(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r7,r0,24
lw r8,40(r14)
 add r7,r7,r8
sw 44(r14),r7
% end var offset calculation
% begin intlit storeage
addi r8,r0,5
sw 48(r14), r8
% done intlit storeage
% begin RELOP op 
lw r10,44(r14)
add r10,r14,r10
lw r8,0(r10)
lw r7,48(r14)
cne r11,r8,r7
sw 52(r14),r11
% end relop op 
lw r9,52(r14)
bz r9,endwhile3
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
sw 56(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,24
lw r7,56(r14)
 add r11,r11,r7
sw 60(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r7,r0,1
addi r11,r0,0
lw r10,60(r14)
add r10,r14,r10
lw r10,0(r10)
muli r8,r7,4
mul r8,r10,r8
add r11,r11,r8
sw 64(r14),r11
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r10,64(r14)
 add r11,r11,r10
sw 68(r14),r11
% end var offset calculation
%begin dot offsetting
lw r10,68(r14)
addi r10,r10,0
sw 72(r14),r10
%end dot offsetting
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
sw 76(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,24
lw r7,76(r14)
 add r11,r11,r7
sw 80(r14),r11
% end var offset calculation
% begin intlit storeage
addi r7,r0,1
sw 84(r14), r7
% done intlit storeage
% begin add op 
lw r8,80(r14)
add r8,r14,r8
lw r7,0(r8)
lw r11,84(r14)
add r10,r7,r11
sw 88(r14),r10
% end add op 
% begin intlit storeage
addi r8,r0,2
sw 92(r14), r8
% done intlit storeage
% begin mult op 
lw r8,88(r14)
lw r10,92(r14)
mul r11,r8,r10
sw 96(r14),r11
% end mult op 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy16

%set left and right ptrs
%set ptr
lw r11,72(r14)
add r11,r14,r11
addi r11,r11,0
%read direct value
add r7,r0,r14
addi r7,r7,128
%set position counter
mul r8,r0,r0
beginCopy16
%move data via register
lw r10,0(r11)
sw 0(r7),r10
%increment registers
addi r11,r11,4
addi r7,r7,4
addi r8,r8,4
%branch out if done
subi r12,r8,4
bnz r12,beginCopy16

endCopy16
% end copy 
%check if size is zero if yes, leave
addi r7,r0,4
bz r7,endCopy17

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,96
%read direct value
add r8,r0,r14
addi r8,r8,132
%set position counter
mul r11,r0,r0
beginCopy17
%move data via register
lw r10,0(r12)
sw 0(r8),r10
%increment registers
addi r12,r12,4
addi r8,r8,4
addi r11,r11,4
%branch out if done
subi r7,r11,4
bnz r7,beginCopy17

endCopy17
% end copy 
addi r14,r14,124
jl r15, fnMansetX1
subi r14,r14,124
%check if size is zero if yes, leave
addi r8,r0,0
bz r8,endCopy18

%set left and right ptrs
%read direct value
add r7,r0,r14
addi r7,r7,124
%read direct value
add r11,r0,r14
addi r11,r11,100
%set position counter
mul r12,r0,r0
beginCopy18
%move data via register
lw r10,0(r7)
sw 0(r11),r10
%increment registers
addi r7,r7,4
addi r11,r11,4
addi r12,r12,4
%branch out if done
subi r8,r12,0
bnz r8,beginCopy18

endCopy18
% end copy 
%begin copy back object
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy19

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,128
%set ptr
lw r12,72(r14)
add r12,r14,r12
addi r12,r12,0
%set position counter
mul r7,r0,r0
beginCopy19
%move data via register
lw r10,0(r8)
sw 0(r12),r10
%increment registers
addi r8,r8,4
addi r12,r12,4
addi r7,r7,4
%branch out if done
subi r11,r7,4
bnz r11,beginCopy19

endCopy19
% end copy 
% begin generating indice offseting
addi r7,r0,1
addi r11,r0,0
sw 100(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,24
lw r10,100(r14)
 add r11,r11,r10
sw 104(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
sw 108(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,24
lw r7,108(r14)
 add r11,r11,r7
sw 112(r14),r11
% end var offset calculation
% begin intlit storeage
addi r7,r0,1
sw 116(r14), r7
% done intlit storeage
% begin add op 
lw r8,112(r14)
add r8,r14,r8
lw r7,0(r8)
lw r11,116(r14)
add r10,r7,r11
sw 120(r14),r10
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy20

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,120
lw r8,104(r14)
add r8,r14,r8
%set position counter
mul r7,r0,r0
beginCopy20
%move data via register
lw r11,0(r10)
sw 0(r8),r11
%increment registers
addi r10,r10,4
addi r8,r8,4
addi r7,r7,4
%branch out if done
subi r12,r7,4
bnz r12,beginCopy20

endCopy20
% end assignment 
j gowhile3
endwhile3
lw r15,0(r14)
jr r15 
%funcdef end
%funcdef begin
fnwriter1
sw 0(r14),r15
% begin generating indice offseting
addi r9,r0,1
addi r7,r0,0
sw 32(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r7,r0,24
lw r12,32(r14)
 add r7,r7,r12
sw 36(r14),r7
% end var offset calculation
% begin intlit storeage
addi r12,r0,0
sw 40(r14), r12
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy21

%set left and right ptrs
%read direct value
add r7,r0,r14
addi r7,r7,40
lw r12,36(r14)
add r12,r14,r12
%set position counter
mul r11,r0,r0
beginCopy21
%move data via register
lw r9,0(r7)
sw 0(r12),r9
%increment registers
addi r7,r7,4
addi r12,r12,4
addi r11,r11,4
%branch out if done
subi r10,r11,4
bnz r10,beginCopy21

endCopy21
% end assignment 
gowhile4
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
sw 44(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,24
lw r7,44(r14)
 add r9,r9,r7
sw 48(r14),r9
% end var offset calculation
% begin intlit storeage
addi r7,r0,5
sw 52(r14), r7
% done intlit storeage
% begin RELOP op 
lw r12,48(r14)
add r12,r14,r12
lw r7,0(r12)
lw r9,52(r14)
cne r10,r7,r9
sw 56(r14),r10
% end relop op 
lw r11,56(r14)
bz r11,endwhile4
% begin generating indice offseting
addi r12,r0,1
addi r10,r0,0
sw 60(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,28
lw r9,60(r14)
 add r10,r10,r9
sw 64(r14),r10
% end var offset calculation
% begin generating indice offseting
addi r9,r0,1
addi r10,r0,0
sw 68(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,24
lw r12,68(r14)
 add r10,r10,r12
sw 72(r14),r10
% end var offset calculation
% begin generating indice offseting
addi r12,r0,1
addi r10,r0,0
lw r9,72(r14)
add r9,r14,r9
lw r9,0(r9)
muli r7,r12,4
mul r7,r9,r7
add r10,r10,r7
sw 76(r14),r10
% done generating indice offseting
% begin var offset calculation
addi r10,r0,4
lw r9,76(r14)
 add r10,r10,r9
sw 80(r14),r10
% end var offset calculation
%begin dot offsetting
lw r9,80(r14)
addi r9,r9,0
sw 84(r14),r9
%end dot offsetting
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy22

%set left and right ptrs
%set ptr
lw r10,84(r14)
add r10,r14,r10
addi r10,r10,0
%read direct value
add r9,r0,r14
addi r9,r9,132
%set position counter
mul r7,r0,r0
beginCopy22
%move data via register
lw r12,0(r10)
sw 0(r9),r12
%increment registers
addi r10,r10,4
addi r9,r9,4
addi r7,r7,4
%branch out if done
subi r8,r7,4
bnz r8,beginCopy22

endCopy22
% end copy 
addi r14,r14,124
jl r15, fnMangetX1
subi r14,r14,124
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy23

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,124
%read direct value
add r7,r0,r14
addi r7,r7,88
%set position counter
mul r10,r0,r0
beginCopy23
%move data via register
lw r12,0(r8)
sw 0(r7),r12
%increment registers
addi r8,r8,4
addi r7,r7,4
addi r10,r10,4
%branch out if done
subi r9,r10,4
bnz r9,beginCopy23

endCopy23
% end copy 
%begin copy back object
%check if size is zero if yes, leave
addi r7,r0,4
bz r7,endCopy24

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,132
%set ptr
lw r10,84(r14)
add r10,r14,r10
addi r10,r10,0
%set position counter
mul r8,r0,r0
beginCopy24
%move data via register
lw r12,0(r9)
sw 0(r10),r12
%increment registers
addi r9,r9,4
addi r10,r10,4
addi r8,r8,4
%branch out if done
subi r7,r8,4
bnz r7,beginCopy24

endCopy24
% end copy 
% begin assignment 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy25

%set left and right ptrs
%read direct value
add r7,r0,r14
addi r7,r7,88
lw r8,64(r14)
add r8,r14,r8
%set position counter
mul r9,r0,r0
beginCopy25
%move data via register
lw r12,0(r7)
sw 0(r8),r12
%increment registers
addi r7,r7,4
addi r8,r8,4
addi r9,r9,4
%branch out if done
subi r10,r9,4
bnz r10,beginCopy25

endCopy25
% end assignment 
% begin generating indice offseting
addi r9,r0,1
addi r10,r0,0
sw 92(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,28
lw r12,92(r14)
 add r10,r10,r12
sw 96(r14),r10
% end var offset calculation
% begin write 
lw r12,96(r14)
add r12,r14,r12
lw r12,0(r12)
%s move ptr to prevent mem corruption
addi r14,r14,204
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
addi r14,r14,-204
% end write
% begin generating indice offseting
addi r12,r0,1
addi r10,r0,0
sw 100(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,24
lw r9,100(r14)
 add r10,r10,r9
sw 104(r14),r10
% end var offset calculation
% begin generating indice offseting
addi r9,r0,1
addi r10,r0,0
sw 108(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,24
lw r12,108(r14)
 add r10,r10,r12
sw 112(r14),r10
% end var offset calculation
% begin intlit storeage
addi r12,r0,1
sw 116(r14), r12
% done intlit storeage
% begin add op 
lw r7,112(r14)
add r7,r14,r7
lw r12,0(r7)
lw r10,116(r14)
add r9,r12,r10
sw 120(r14),r9
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy26

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,120
lw r7,104(r14)
add r7,r14,r7
%set position counter
mul r12,r0,r0
beginCopy26
%move data via register
lw r10,0(r9)
sw 0(r7),r10
%increment registers
addi r9,r9,4
addi r7,r7,4
addi r12,r12,4
%branch out if done
subi r8,r12,4
bnz r8,beginCopy26

endCopy26
% end assignment 
j gowhile4
endwhile4
lw r15,0(r14)
jr r15 
%funcdef end
