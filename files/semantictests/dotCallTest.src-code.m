entry
muli r0,r0,0
muli r14,r0,0
addi r14,r0,stackbase
%r14 is stack ptr, stack grows downwards or upwards
%24kb stack
% begin intlit storeage
addi r12,r0,2
sw 56(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,3
sw 60(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,10
sw 64(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,20
sw 68(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,30
sw 72(r14), r12
% done intlit storeage
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy1

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,56
%read direct value
add r12,r0,r14
addi r12,r12,236
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
addi r8,r8,60
%read direct value
add r9,r0,r14
addi r9,r9,240
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
addi r12,r12,64
%read direct value
add r11,r0,r14
addi r11,r11,244
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
addi r9,r9,68
%read direct value
add r8,r0,r14
addi r8,r8,248
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
addi r11,r11,72
%read direct value
add r12,r0,r14
addi r12,r12,252
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
addi r14,r14,184
jl r15, fnmanconstructor1
subi r14,r14,184
%check if size is zero if yes, leave
addi r12,r0,48
bz r12,endCopy6

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,184
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
subi r12,r11,48
bnz r12,beginCopy6

endCopy6
% end copy 
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 76(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r10,76(r14)
 add r12,r12,r10
sw 80(r14),r12
% end var offset calculation
%begin dot offsetting
lw r10,80(r14)
addi r10,r10,0
sw 84(r14),r10
%end dot offsetting
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
sw 88(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r11,88(r14)
lw r12,84(r14)
add r12,r12,r11
sw 92(r14),r12
% end var offset calculation
% begin write 
lw r11,92(r14)
add r11,r14,r11
lw r11,0(r11)
%s move ptr to prevent mem corruption
addi r14,r14,264
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
addi r14,r14,-264
% end write
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 96(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r10,96(r14)
 add r12,r12,r10
sw 100(r14),r12
% end var offset calculation
%begin dot offsetting
lw r10,100(r14)
addi r10,r10,4
sw 104(r14),r10
%end dot offsetting
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
sw 108(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r11,108(r14)
lw r12,104(r14)
add r12,r12,r11
sw 112(r14),r12
% end var offset calculation
% begin write 
lw r11,112(r14)
add r11,r14,r11
lw r11,0(r11)
%s move ptr to prevent mem corruption
addi r14,r14,264
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
addi r14,r14,-264
% end write
gowhile1
% begin generating indice offseting
addi r12,r0,1
addi r10,r0,0
sw 116(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,52
lw r8,116(r14)
 add r10,r10,r8
sw 120(r14),r10
% end var offset calculation
% begin intlit storeage
addi r8,r0,10
sw 124(r14), r8
% done intlit storeage
% begin RELOP op 
lw r9,120(r14)
add r9,r14,r9
lw r8,0(r9)
lw r10,124(r14)
cne r12,r8,r10
sw 128(r14),r12
% end relop op 
lw r11,128(r14)
bz r11,endwhile1
% begin generating indice offseting
addi r9,r0,1
addi r12,r0,0
sw 132(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r10,132(r14)
 add r12,r12,r10
sw 136(r14),r12
% end var offset calculation
%begin dot offsetting
lw r10,136(r14)
addi r10,r10,8
sw 140(r14),r10
%end dot offsetting
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
sw 144(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,52
lw r9,144(r14)
 add r12,r12,r9
sw 148(r14),r12
% end var offset calculation
% begin generating indice offseting
addi r9,r0,1
addi r12,r0,0
lw r10,148(r14)
add r10,r14,r10
lw r10,0(r10)
muli r8,r9,4
mul r8,r10,r8
add r12,r12,r8
sw 152(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r10,152(r14)
lw r12,140(r14)
add r12,r12,r10
sw 156(r14),r12
% end var offset calculation
% begin write 
lw r10,156(r14)
add r10,r14,r10
lw r10,0(r10)
%s move ptr to prevent mem corruption
addi r14,r14,264
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
addi r14,r14,-264
% end write
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
sw 160(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,52
lw r9,160(r14)
 add r12,r12,r9
sw 164(r14),r12
% end var offset calculation
% begin generating indice offseting
addi r9,r0,1
addi r12,r0,0
sw 168(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,52
lw r10,168(r14)
 add r12,r12,r10
sw 172(r14),r12
% end var offset calculation
% begin intlit storeage
addi r10,r0,1
sw 176(r14), r10
% done intlit storeage
% begin add op 
lw r8,172(r14)
add r8,r14,r8
lw r10,0(r8)
lw r12,176(r14)
add r9,r10,r12
sw 180(r14),r9
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r7,r0,4
bz r7,endCopy7

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,180
lw r8,164(r14)
add r8,r14,r8
%set position counter
mul r10,r0,r0
beginCopy7
%move data via register
lw r12,0(r9)
sw 0(r8),r12
%increment registers
addi r9,r9,4
addi r8,r8,4
addi r10,r10,4
%branch out if done
subi r7,r10,4
bnz r7,beginCopy7

endCopy7
% end assignment 
j gowhile1
endwhile1
hlt
%funcdef begin
fnmanconstructor1
sw 48(r14),r15
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
sw 120(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,72
lw r7,120(r14)
 add r10,r10,r7
sw 124(r14),r10
% end var offset calculation
%begin dot offsetting
lw r7,124(r14)
addi r7,r7,0
sw 128(r14),r7
%end dot offsetting
% begin generating indice offseting
addi r7,r0,1
addi r10,r0,0
sw 132(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r11,132(r14)
lw r10,128(r14)
add r10,r10,r11
sw 136(r14),r10
% end var offset calculation
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
sw 140(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,52
lw r7,140(r14)
 add r10,r10,r7
sw 144(r14),r10
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy8

%set left and right ptrs
%set ptr
lw r10,144(r14)
add r10,r14,r10
lw r7,136(r14)
add r7,r14,r7
%set position counter
mul r12,r0,r0
beginCopy8
%move data via register
lw r11,0(r10)
sw 0(r7),r11
%increment registers
addi r10,r10,4
addi r7,r7,4
addi r12,r12,4
%branch out if done
subi r9,r12,4
bnz r9,beginCopy8

endCopy8
% end assignment 
% begin generating indice offseting
addi r12,r0,1
addi r9,r0,0
sw 148(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,72
lw r11,148(r14)
 add r9,r9,r11
sw 152(r14),r9
% end var offset calculation
%begin dot offsetting
lw r11,152(r14)
addi r11,r11,4
sw 156(r14),r11
%end dot offsetting
% begin generating indice offseting
addi r11,r0,1
addi r9,r0,0
sw 160(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r12,160(r14)
lw r9,156(r14)
add r9,r9,r12
sw 164(r14),r9
% end var offset calculation
% begin generating indice offseting
addi r12,r0,1
addi r9,r0,0
sw 168(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,56
lw r11,168(r14)
 add r9,r9,r11
sw 172(r14),r9
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r7,r0,4
bz r7,endCopy9

%set left and right ptrs
%set ptr
lw r9,172(r14)
add r9,r14,r9
lw r11,164(r14)
add r11,r14,r11
%set position counter
mul r10,r0,r0
beginCopy9
%move data via register
lw r12,0(r9)
sw 0(r11),r12
%increment registers
addi r9,r9,4
addi r11,r11,4
addi r10,r10,4
%branch out if done
subi r7,r10,4
bnz r7,beginCopy9

endCopy9
% end assignment 
% begin generating indice offseting
addi r10,r0,1
addi r7,r0,0
sw 176(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r7,r0,72
lw r12,176(r14)
 add r7,r7,r12
sw 180(r14),r7
% end var offset calculation
%begin dot offsetting
lw r12,180(r14)
addi r12,r12,8
sw 184(r14),r12
%end dot offsetting
% begin intlit storeage
addi r12,r0,9
sw 188(r14), r12
% done intlit storeage
% begin generating indice offseting
addi r12,r0,1
addi r7,r0,0
lw r10,188(r14)
muli r9,r12,4
mul r9,r10,r9
add r7,r7,r9
sw 192(r14),r7
% done generating indice offseting
% begin var offset calculation
lw r10,192(r14)
lw r7,184(r14)
add r7,r7,r10
sw 196(r14),r7
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r7,r0,0
sw 200(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r7,r0,60
lw r12,200(r14)
 add r7,r7,r12
sw 204(r14),r7
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy10

%set left and right ptrs
%set ptr
lw r7,204(r14)
add r7,r14,r7
lw r12,196(r14)
add r12,r14,r12
%set position counter
mul r9,r0,r0
beginCopy10
%move data via register
lw r10,0(r7)
sw 0(r12),r10
%increment registers
addi r7,r7,4
addi r12,r12,4
addi r9,r9,4
%branch out if done
subi r11,r9,4
bnz r11,beginCopy10

endCopy10
% end assignment 
% begin generating indice offseting
addi r9,r0,1
addi r11,r0,0
sw 208(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,72
lw r10,208(r14)
 add r11,r11,r10
sw 212(r14),r11
% end var offset calculation
%begin dot offsetting
lw r10,212(r14)
addi r10,r10,8
sw 216(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,8
sw 220(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
lw r9,220(r14)
muli r7,r10,4
mul r7,r9,r7
add r11,r11,r7
sw 224(r14),r11
% done generating indice offseting
% begin var offset calculation
lw r9,224(r14)
lw r11,216(r14)
add r11,r11,r9
sw 228(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r9,r0,1
addi r11,r0,0
sw 232(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,64
lw r10,232(r14)
 add r11,r11,r10
sw 236(r14),r11
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy11

%set left and right ptrs
%set ptr
lw r11,236(r14)
add r11,r14,r11
lw r10,228(r14)
add r10,r14,r10
%set position counter
mul r7,r0,r0
beginCopy11
%move data via register
lw r9,0(r11)
sw 0(r10),r9
%increment registers
addi r11,r11,4
addi r10,r10,4
addi r7,r7,4
%branch out if done
subi r12,r7,4
bnz r12,beginCopy11

endCopy11
% end assignment 
% begin generating indice offseting
addi r7,r0,1
addi r12,r0,0
sw 240(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,72
lw r9,240(r14)
 add r12,r12,r9
sw 244(r14),r12
% end var offset calculation
%begin dot offsetting
lw r9,244(r14)
addi r9,r9,8
sw 248(r14),r9
%end dot offsetting
% begin intlit storeage
addi r9,r0,7
sw 252(r14), r9
% done intlit storeage
% begin generating indice offseting
addi r9,r0,1
addi r12,r0,0
lw r7,252(r14)
muli r11,r9,4
mul r11,r7,r11
add r12,r12,r11
sw 256(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r7,256(r14)
lw r12,248(r14)
add r12,r12,r7
sw 260(r14),r12
% end var offset calculation
% begin generating indice offseting
addi r7,r0,1
addi r12,r0,0
sw 264(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,68
lw r9,264(r14)
 add r12,r12,r9
sw 268(r14),r12
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy12

%set left and right ptrs
%set ptr
lw r12,268(r14)
add r12,r14,r12
lw r9,260(r14)
add r9,r14,r9
%set position counter
mul r11,r0,r0
beginCopy12
%move data via register
lw r7,0(r12)
sw 0(r9),r7
%increment registers
addi r12,r12,4
addi r9,r9,4
addi r11,r11,4
%branch out if done
subi r10,r11,4
bnz r10,beginCopy12

endCopy12
% end assignment 
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
sw 272(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,72
lw r7,272(r14)
 add r10,r10,r7
sw 276(r14),r10
% end var offset calculation
%begin dot offsetting
lw r7,276(r14)
addi r7,r7,8
sw 280(r14),r7
%end dot offsetting
% begin intlit storeage
addi r7,r0,6
sw 284(r14), r7
% done intlit storeage
% begin generating indice offseting
addi r7,r0,1
addi r10,r0,0
lw r11,284(r14)
muli r12,r7,4
mul r12,r11,r12
add r10,r10,r12
sw 288(r14),r10
% done generating indice offseting
% begin var offset calculation
lw r11,288(r14)
lw r10,280(r14)
add r10,r10,r11
sw 292(r14),r10
% end var offset calculation
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
sw 296(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,60
lw r7,296(r14)
 add r10,r10,r7
sw 300(r14),r10
% end var offset calculation
% begin intlit storeage
addi r7,r0,10
sw 304(r14), r7
% done intlit storeage
% begin add op 
lw r12,300(r14)
add r12,r14,r12
lw r7,0(r12)
lw r10,304(r14)
add r11,r7,r10
sw 308(r14),r11
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy13

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,308
lw r12,292(r14)
add r12,r14,r12
%set position counter
mul r7,r0,r0
beginCopy13
%move data via register
lw r10,0(r11)
sw 0(r12),r10
%increment registers
addi r11,r11,4
addi r12,r12,4
addi r7,r7,4
%branch out if done
subi r9,r7,4
bnz r9,beginCopy13

endCopy13
% end assignment 
% begin generating indice offseting
addi r7,r0,1
addi r9,r0,0
sw 312(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,72
lw r10,312(r14)
 add r9,r9,r10
sw 316(r14),r9
% end var offset calculation
%begin dot offsetting
lw r10,316(r14)
addi r10,r10,8
sw 320(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,5
sw 324(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
lw r7,324(r14)
muli r11,r10,4
mul r11,r7,r11
add r9,r9,r11
sw 328(r14),r9
% done generating indice offseting
% begin var offset calculation
lw r7,328(r14)
lw r9,320(r14)
add r9,r9,r7
sw 332(r14),r9
% end var offset calculation
% begin generating indice offseting
addi r7,r0,1
addi r9,r0,0
sw 336(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,64
lw r10,336(r14)
 add r9,r9,r10
sw 340(r14),r9
% end var offset calculation
% begin intlit storeage
addi r10,r0,10
sw 344(r14), r10
% done intlit storeage
% begin add op 
lw r11,340(r14)
add r11,r14,r11
lw r10,0(r11)
lw r9,344(r14)
add r7,r10,r9
sw 348(r14),r7
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy14

%set left and right ptrs
%read direct value
add r7,r0,r14
addi r7,r7,348
lw r11,332(r14)
add r11,r14,r11
%set position counter
mul r10,r0,r0
beginCopy14
%move data via register
lw r9,0(r7)
sw 0(r11),r9
%increment registers
addi r7,r7,4
addi r11,r11,4
addi r10,r10,4
%branch out if done
subi r12,r10,4
bnz r12,beginCopy14

endCopy14
% end assignment 
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
sw 352(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,72
lw r9,352(r14)
 add r12,r12,r9
sw 356(r14),r12
% end var offset calculation
%begin dot offsetting
lw r9,356(r14)
addi r9,r9,8
sw 360(r14),r9
%end dot offsetting
% begin intlit storeage
addi r9,r0,4
sw 364(r14), r9
% done intlit storeage
% begin generating indice offseting
addi r9,r0,1
addi r12,r0,0
lw r10,364(r14)
muli r7,r9,4
mul r7,r10,r7
add r12,r12,r7
sw 368(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r10,368(r14)
lw r12,360(r14)
add r12,r12,r10
sw 372(r14),r12
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
sw 376(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,68
lw r9,376(r14)
 add r12,r12,r9
sw 380(r14),r12
% end var offset calculation
% begin intlit storeage
addi r9,r0,10
sw 384(r14), r9
% done intlit storeage
% begin add op 
lw r7,380(r14)
add r7,r14,r7
lw r9,0(r7)
lw r12,384(r14)
add r10,r9,r12
sw 388(r14),r10
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy15

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,388
lw r7,372(r14)
add r7,r14,r7
%set position counter
mul r9,r0,r0
beginCopy15
%move data via register
lw r12,0(r10)
sw 0(r7),r12
%increment registers
addi r10,r10,4
addi r7,r7,4
addi r9,r9,4
%branch out if done
subi r11,r9,4
bnz r11,beginCopy15

endCopy15
% end assignment 
% begin generating indice offseting
addi r9,r0,1
addi r11,r0,0
sw 392(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,72
lw r12,392(r14)
 add r11,r11,r12
sw 396(r14),r11
% end var offset calculation
%check if size is zero if yes, leave
addi r7,r0,48
bz r7,endCopy16

%set left and right ptrs
%set ptr
lw r11,396(r14)
add r11,r14,r11
%read direct value
add r12,r0,r14
addi r12,r12,0
%set position counter
mul r10,r0,r0
beginCopy16
%move data via register
lw r9,0(r11)
sw 0(r12),r9
%increment registers
addi r11,r11,4
addi r12,r12,4
addi r10,r10,4
%branch out if done
subi r7,r10,48
bnz r7,beginCopy16

endCopy16
% end copy 
lw r15,48(r14)
jr r15 
%funcdef end
