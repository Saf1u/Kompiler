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
addi r12,r0,2
sw 64(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,3
sw 68(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,10
sw 72(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,20
sw 76(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,30
sw 80(r14), r12
% done intlit storeage
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy1

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,64
%read direct value
add r12,r0,r14
addi r12,r12,368
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
addi r8,r8,68
%read direct value
add r9,r0,r14
addi r9,r9,372
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
addi r12,r12,72
%read direct value
add r11,r0,r14
addi r11,r11,376
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
addi r9,r9,76
%read direct value
add r8,r0,r14
addi r8,r8,380
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
addi r11,r11,80
%read direct value
add r12,r0,r14
addi r12,r12,384
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
addi r14,r14,336
jl r15, fnmanconstructor1
subi r14,r14,336
%check if size is zero if yes, leave
addi r12,r0,28
bz r12,endCopy6

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,336
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
subi r12,r11,28
bnz r12,beginCopy6

endCopy6
% end copy 
% begin intlit storeage
addi r11,r0,10
sw 84(r14), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,9
sw 88(r14), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,5
sw 92(r14), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,4
sw 96(r14), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,3
sw 100(r14), r11
% done intlit storeage
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy7

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,84
%read direct value
add r11,r0,r14
addi r11,r11,368
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
addi r8,r8,372
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
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy9

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,92
%read direct value
add r12,r0,r14
addi r12,r12,376
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
addi r8,r8,96
%read direct value
add r9,r0,r14
addi r9,r9,380
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
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy11

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,100
%read direct value
add r11,r0,r14
addi r11,r11,384
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
% end copy 
addi r14,r14,336
jl r15, fnmanconstructor1
subi r14,r14,336
%check if size is zero if yes, leave
addi r11,r0,28
bz r11,endCopy12

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,336
%read direct value
add r8,r0,r14
addi r8,r8,32
%set position counter
mul r12,r0,r0
beginCopy12
%move data via register
lw r10,0(r9)
sw 0(r8),r10
%increment registers
addi r9,r9,4
addi r8,r8,4
addi r12,r12,4
%branch out if done
subi r11,r12,28
bnz r11,beginCopy12

endCopy12
% end copy 
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 104(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r10,104(r14)
 add r11,r11,r10
sw 108(r14),r11
% end var offset calculation
%begin dot offsetting
lw r10,108(r14)
addi r10,r10,0
sw 112(r14),r10
%end dot offsetting
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
sw 116(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r12,116(r14)
lw r11,112(r14)
add r11,r11,r12
sw 120(r14),r11
% end var offset calculation
% begin write 
lw r12,120(r14)
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
addi r11,r0,0
sw 124(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r10,124(r14)
 add r11,r11,r10
sw 128(r14),r11
% end var offset calculation
%begin dot offsetting
lw r10,128(r14)
addi r10,r10,4
sw 132(r14),r10
%end dot offsetting
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
sw 136(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r12,136(r14)
lw r11,132(r14)
add r11,r11,r12
sw 140(r14),r11
% end var offset calculation
% begin write 
lw r12,140(r14)
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
gowhile1
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
sw 144(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,60
lw r9,144(r14)
 add r10,r10,r9
sw 148(r14),r10
% end var offset calculation
% begin intlit storeage
addi r9,r0,5
sw 152(r14), r9
% done intlit storeage
% begin RELOP op 
lw r8,148(r14)
add r8,r14,r8
lw r9,0(r8)
lw r10,152(r14)
cne r11,r9,r10
sw 156(r14),r11
% end relop op 
lw r12,156(r14)
bz r12,endwhile1
% begin generating indice offseting
addi r8,r0,1
addi r11,r0,0
sw 160(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r10,160(r14)
 add r11,r11,r10
sw 164(r14),r11
% end var offset calculation
%begin dot offsetting
lw r10,164(r14)
addi r10,r10,8
sw 168(r14),r10
%end dot offsetting
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
sw 172(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,60
lw r8,172(r14)
 add r11,r11,r8
sw 176(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r8,r0,1
addi r11,r0,0
lw r10,176(r14)
add r10,r14,r10
lw r10,0(r10)
muli r9,r8,4
mul r9,r10,r9
add r11,r11,r9
sw 180(r14),r11
% done generating indice offseting
% begin var offset calculation
lw r10,180(r14)
lw r11,168(r14)
add r11,r11,r10
sw 184(r14),r11
% end var offset calculation
% begin write 
lw r10,184(r14)
add r10,r14,r10
lw r10,0(r10)
%s move ptr to prevent mem corruption
addi r14,r14,416
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
addi r14,r14,-416
% end write
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
sw 188(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,60
lw r8,188(r14)
 add r11,r11,r8
sw 192(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r8,r0,1
addi r11,r0,0
sw 196(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,60
lw r10,196(r14)
 add r11,r11,r10
sw 200(r14),r11
% end var offset calculation
% begin intlit storeage
addi r10,r0,1
sw 204(r14), r10
% done intlit storeage
% begin add op 
lw r9,200(r14)
add r9,r14,r9
lw r10,0(r9)
lw r11,204(r14)
add r8,r10,r11
sw 208(r14),r8
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r7,r0,4
bz r7,endCopy13

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,208
lw r9,192(r14)
add r9,r14,r9
%set position counter
mul r10,r0,r0
beginCopy13
%move data via register
lw r11,0(r8)
sw 0(r9),r11
%increment registers
addi r8,r8,4
addi r9,r9,4
addi r10,r10,4
%branch out if done
subi r7,r10,4
bnz r7,beginCopy13

endCopy13
% end assignment 
j gowhile1
endwhile1
% begin generating indice offseting
addi r12,r0,1
addi r10,r0,0
sw 212(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,60
lw r7,212(r14)
 add r10,r10,r7
sw 216(r14),r10
% end var offset calculation
% begin intlit storeage
addi r7,r0,0
sw 220(r14), r7
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy14

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,220
lw r7,216(r14)
add r7,r14,r7
%set position counter
mul r11,r0,r0
beginCopy14
%move data via register
lw r12,0(r10)
sw 0(r7),r12
%increment registers
addi r10,r10,4
addi r7,r7,4
addi r11,r11,4
%branch out if done
subi r8,r11,4
bnz r8,beginCopy14

endCopy14
% end assignment 
% begin intlit storeage
addi r11,r0,0
sw 224(r14), r11
% done intlit storeage
% begin write 
lw r11,224(r14)
%s move ptr to prevent mem corruption
addi r14,r14,416
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
addi r14,r14,-416
% end write
% begin generating indice offseting
addi r11,r0,1
addi r8,r0,0
sw 228(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,32
lw r12,228(r14)
 add r8,r8,r12
sw 232(r14),r8
% end var offset calculation
%begin dot offsetting
lw r12,232(r14)
addi r12,r12,0
sw 236(r14),r12
%end dot offsetting
% begin generating indice offseting
addi r12,r0,1
addi r8,r0,0
sw 240(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r11,240(r14)
lw r8,236(r14)
add r8,r8,r11
sw 244(r14),r8
% end var offset calculation
% begin write 
lw r11,244(r14)
add r11,r14,r11
lw r11,0(r11)
%s move ptr to prevent mem corruption
addi r14,r14,416
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
addi r14,r14,-416
% end write
% begin generating indice offseting
addi r11,r0,1
addi r8,r0,0
sw 248(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,32
lw r12,248(r14)
 add r8,r8,r12
sw 252(r14),r8
% end var offset calculation
%begin dot offsetting
lw r12,252(r14)
addi r12,r12,4
sw 256(r14),r12
%end dot offsetting
% begin generating indice offseting
addi r12,r0,1
addi r8,r0,0
sw 260(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r11,260(r14)
lw r8,256(r14)
add r8,r8,r11
sw 264(r14),r8
% end var offset calculation
% begin write 
lw r11,264(r14)
add r11,r14,r11
lw r11,0(r11)
%s move ptr to prevent mem corruption
addi r14,r14,416
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
addi r14,r14,-416
% end write
gowhile2
% begin generating indice offseting
addi r8,r0,1
addi r12,r0,0
sw 268(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,60
lw r10,268(r14)
 add r12,r12,r10
sw 272(r14),r12
% end var offset calculation
% begin intlit storeage
addi r10,r0,5
sw 276(r14), r10
% done intlit storeage
% begin RELOP op 
lw r7,272(r14)
add r7,r14,r7
lw r10,0(r7)
lw r12,276(r14)
cne r8,r10,r12
sw 280(r14),r8
% end relop op 
lw r11,280(r14)
bz r11,endwhile2
% begin generating indice offseting
addi r7,r0,1
addi r8,r0,0
sw 284(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,32
lw r12,284(r14)
 add r8,r8,r12
sw 288(r14),r8
% end var offset calculation
%begin dot offsetting
lw r12,288(r14)
addi r12,r12,8
sw 292(r14),r12
%end dot offsetting
% begin generating indice offseting
addi r12,r0,1
addi r8,r0,0
sw 296(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,60
lw r7,296(r14)
 add r8,r8,r7
sw 300(r14),r8
% end var offset calculation
% begin generating indice offseting
addi r7,r0,1
addi r8,r0,0
lw r12,300(r14)
add r12,r14,r12
lw r12,0(r12)
muli r10,r7,4
mul r10,r12,r10
add r8,r8,r10
sw 304(r14),r8
% done generating indice offseting
% begin var offset calculation
lw r12,304(r14)
lw r8,292(r14)
add r8,r8,r12
sw 308(r14),r8
% end var offset calculation
% begin write 
lw r12,308(r14)
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
addi r8,r0,0
sw 312(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,60
lw r7,312(r14)
 add r8,r8,r7
sw 316(r14),r8
% end var offset calculation
% begin generating indice offseting
addi r7,r0,1
addi r8,r0,0
sw 320(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,60
lw r12,320(r14)
 add r8,r8,r12
sw 324(r14),r8
% end var offset calculation
% begin intlit storeage
addi r12,r0,1
sw 328(r14), r12
% done intlit storeage
% begin add op 
lw r10,324(r14)
add r10,r14,r10
lw r12,0(r10)
lw r8,328(r14)
add r7,r12,r8
sw 332(r14),r7
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy15

%set left and right ptrs
%read direct value
add r7,r0,r14
addi r7,r7,332
lw r10,316(r14)
add r10,r14,r10
%set position counter
mul r12,r0,r0
beginCopy15
%move data via register
lw r8,0(r7)
sw 0(r10),r8
%increment registers
addi r7,r7,4
addi r10,r10,4
addi r12,r12,4
%branch out if done
subi r9,r12,4
bnz r9,beginCopy15

endCopy15
% end assignment 
j gowhile2
endwhile2
hlt
%funcdef begin
fnmanconstructor1
sw 28(r14),r15
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 80(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,52
lw r9,80(r14)
 add r12,r12,r9
sw 84(r14),r12
% end var offset calculation
%begin dot offsetting
lw r9,84(r14)
addi r9,r9,0
sw 88(r14),r9
%end dot offsetting
% begin generating indice offseting
addi r9,r0,1
addi r12,r0,0
sw 92(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r11,92(r14)
lw r12,88(r14)
add r12,r12,r11
sw 96(r14),r12
% end var offset calculation
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 100(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,32
lw r9,100(r14)
 add r12,r12,r9
sw 104(r14),r12
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r7,r0,4
bz r7,endCopy16

%set left and right ptrs
%set ptr
lw r12,104(r14)
add r12,r14,r12
lw r9,96(r14)
add r9,r14,r9
%set position counter
mul r8,r0,r0
beginCopy16
%move data via register
lw r11,0(r12)
sw 0(r9),r11
%increment registers
addi r12,r12,4
addi r9,r9,4
addi r8,r8,4
%branch out if done
subi r7,r8,4
bnz r7,beginCopy16

endCopy16
% end assignment 
% begin generating indice offseting
addi r8,r0,1
addi r7,r0,0
sw 108(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r7,r0,52
lw r11,108(r14)
 add r7,r7,r11
sw 112(r14),r7
% end var offset calculation
%begin dot offsetting
lw r11,112(r14)
addi r11,r11,4
sw 116(r14),r11
%end dot offsetting
% begin generating indice offseting
addi r11,r0,1
addi r7,r0,0
sw 120(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r8,120(r14)
lw r7,116(r14)
add r7,r7,r8
sw 124(r14),r7
% end var offset calculation
% begin generating indice offseting
addi r8,r0,1
addi r7,r0,0
sw 128(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r7,r0,36
lw r11,128(r14)
 add r7,r7,r11
sw 132(r14),r7
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy17

%set left and right ptrs
%set ptr
lw r7,132(r14)
add r7,r14,r7
lw r11,124(r14)
add r11,r14,r11
%set position counter
mul r12,r0,r0
beginCopy17
%move data via register
lw r8,0(r7)
sw 0(r11),r8
%increment registers
addi r7,r7,4
addi r11,r11,4
addi r12,r12,4
%branch out if done
subi r9,r12,4
bnz r9,beginCopy17

endCopy17
% end assignment 
% begin generating indice offseting
addi r12,r0,1
addi r9,r0,0
sw 136(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,52
lw r8,136(r14)
 add r9,r9,r8
sw 140(r14),r9
% end var offset calculation
%begin dot offsetting
lw r8,140(r14)
addi r8,r8,8
sw 144(r14),r8
%end dot offsetting
% begin intlit storeage
addi r8,r0,0
sw 148(r14), r8
% done intlit storeage
% begin generating indice offseting
addi r8,r0,1
addi r9,r0,0
lw r12,148(r14)
muli r7,r8,4
mul r7,r12,r7
add r9,r9,r7
sw 152(r14),r9
% done generating indice offseting
% begin var offset calculation
lw r12,152(r14)
lw r9,144(r14)
add r9,r9,r12
sw 156(r14),r9
% end var offset calculation
% begin generating indice offseting
addi r12,r0,1
addi r9,r0,0
sw 160(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,40
lw r8,160(r14)
 add r9,r9,r8
sw 164(r14),r9
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy18

%set left and right ptrs
%set ptr
lw r9,164(r14)
add r9,r14,r9
lw r8,156(r14)
add r8,r14,r8
%set position counter
mul r7,r0,r0
beginCopy18
%move data via register
lw r12,0(r9)
sw 0(r8),r12
%increment registers
addi r9,r9,4
addi r8,r8,4
addi r7,r7,4
%branch out if done
subi r11,r7,4
bnz r11,beginCopy18

endCopy18
% end assignment 
% begin generating indice offseting
addi r7,r0,1
addi r11,r0,0
sw 168(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,52
lw r12,168(r14)
 add r11,r11,r12
sw 172(r14),r11
% end var offset calculation
%begin dot offsetting
lw r12,172(r14)
addi r12,r12,8
sw 176(r14),r12
%end dot offsetting
% begin intlit storeage
addi r12,r0,1
sw 180(r14), r12
% done intlit storeage
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
lw r7,180(r14)
muli r9,r12,4
mul r9,r7,r9
add r11,r11,r9
sw 184(r14),r11
% done generating indice offseting
% begin var offset calculation
lw r7,184(r14)
lw r11,176(r14)
add r11,r11,r7
sw 188(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r7,r0,1
addi r11,r0,0
sw 192(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,44
lw r12,192(r14)
 add r11,r11,r12
sw 196(r14),r11
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy19

%set left and right ptrs
%set ptr
lw r11,196(r14)
add r11,r14,r11
lw r12,188(r14)
add r12,r14,r12
%set position counter
mul r9,r0,r0
beginCopy19
%move data via register
lw r7,0(r11)
sw 0(r12),r7
%increment registers
addi r11,r11,4
addi r12,r12,4
addi r9,r9,4
%branch out if done
subi r8,r9,4
bnz r8,beginCopy19

endCopy19
% end assignment 
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
sw 200(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,52
lw r7,200(r14)
 add r8,r8,r7
sw 204(r14),r8
% end var offset calculation
%begin dot offsetting
lw r7,204(r14)
addi r7,r7,8
sw 208(r14),r7
%end dot offsetting
% begin intlit storeage
addi r7,r0,2
sw 212(r14), r7
% done intlit storeage
% begin generating indice offseting
addi r7,r0,1
addi r8,r0,0
lw r9,212(r14)
muli r11,r7,4
mul r11,r9,r11
add r8,r8,r11
sw 216(r14),r8
% done generating indice offseting
% begin var offset calculation
lw r9,216(r14)
lw r8,208(r14)
add r8,r8,r9
sw 220(r14),r8
% end var offset calculation
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
sw 224(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,48
lw r7,224(r14)
 add r8,r8,r7
sw 228(r14),r8
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy20

%set left and right ptrs
%set ptr
lw r8,228(r14)
add r8,r14,r8
lw r7,220(r14)
add r7,r14,r7
%set position counter
mul r11,r0,r0
beginCopy20
%move data via register
lw r9,0(r8)
sw 0(r7),r9
%increment registers
addi r8,r8,4
addi r7,r7,4
addi r11,r11,4
%branch out if done
subi r12,r11,4
bnz r12,beginCopy20

endCopy20
% end assignment 
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 232(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,52
lw r9,232(r14)
 add r12,r12,r9
sw 236(r14),r12
% end var offset calculation
%begin dot offsetting
lw r9,236(r14)
addi r9,r9,8
sw 240(r14),r9
%end dot offsetting
% begin intlit storeage
addi r9,r0,3
sw 244(r14), r9
% done intlit storeage
% begin generating indice offseting
addi r9,r0,1
addi r12,r0,0
lw r11,244(r14)
muli r8,r9,4
mul r8,r11,r8
add r12,r12,r8
sw 248(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r11,248(r14)
lw r12,240(r14)
add r12,r12,r11
sw 252(r14),r12
% end var offset calculation
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 256(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,40
lw r9,256(r14)
 add r12,r12,r9
sw 260(r14),r12
% end var offset calculation
% begin intlit storeage
addi r9,r0,10
sw 264(r14), r9
% done intlit storeage
% begin add op 
lw r8,260(r14)
add r8,r14,r8
lw r9,0(r8)
lw r12,264(r14)
add r11,r9,r12
sw 268(r14),r11
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r7,r0,4
bz r7,endCopy21

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,268
lw r8,252(r14)
add r8,r14,r8
%set position counter
mul r9,r0,r0
beginCopy21
%move data via register
lw r12,0(r11)
sw 0(r8),r12
%increment registers
addi r11,r11,4
addi r8,r8,4
addi r9,r9,4
%branch out if done
subi r7,r9,4
bnz r7,beginCopy21

endCopy21
% end assignment 
% begin generating indice offseting
addi r9,r0,1
addi r7,r0,0
sw 272(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r7,r0,52
lw r12,272(r14)
 add r7,r7,r12
sw 276(r14),r7
% end var offset calculation
%begin dot offsetting
lw r12,276(r14)
addi r12,r12,8
sw 280(r14),r12
%end dot offsetting
% begin intlit storeage
addi r12,r0,4
sw 284(r14), r12
% done intlit storeage
% begin generating indice offseting
addi r12,r0,1
addi r7,r0,0
lw r9,284(r14)
muli r11,r12,4
mul r11,r9,r11
add r7,r7,r11
sw 288(r14),r7
% done generating indice offseting
% begin var offset calculation
lw r9,288(r14)
lw r7,280(r14)
add r7,r7,r9
sw 292(r14),r7
% end var offset calculation
% begin generating indice offseting
addi r9,r0,1
addi r7,r0,0
sw 296(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r7,r0,44
lw r12,296(r14)
 add r7,r7,r12
sw 300(r14),r7
% end var offset calculation
% begin intlit storeage
addi r12,r0,10
sw 304(r14), r12
% done intlit storeage
% begin add op 
lw r11,300(r14)
add r11,r14,r11
lw r12,0(r11)
lw r7,304(r14)
add r9,r12,r7
sw 308(r14),r9
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy22

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,308
lw r11,292(r14)
add r11,r14,r11
%set position counter
mul r12,r0,r0
beginCopy22
%move data via register
lw r7,0(r9)
sw 0(r11),r7
%increment registers
addi r9,r9,4
addi r11,r11,4
addi r12,r12,4
%branch out if done
subi r8,r12,4
bnz r8,beginCopy22

endCopy22
% end assignment 
% begin generating indice offseting
addi r12,r0,1
addi r8,r0,0
sw 312(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,52
lw r7,312(r14)
 add r8,r8,r7
sw 316(r14),r8
% end var offset calculation
%check if size is zero if yes, leave
addi r11,r0,28
bz r11,endCopy23

%set left and right ptrs
%set ptr
lw r8,316(r14)
add r8,r14,r8
%read direct value
add r7,r0,r14
addi r7,r7,0
%set position counter
mul r9,r0,r0
beginCopy23
%move data via register
lw r12,0(r8)
sw 0(r7),r12
%increment registers
addi r8,r8,4
addi r7,r7,4
addi r9,r9,4
%branch out if done
subi r11,r9,28
bnz r11,beginCopy23

endCopy23
% end copy 
lw r15,28(r14)
jr r15 
%funcdef end
