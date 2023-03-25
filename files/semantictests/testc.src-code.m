entry
muli r0,r0,0
muli r14,r0,0
addi r14,r0,stackbase
%r14 is stack ptr, stack grows downwards or upwards
%24kb stack
% begin generating indice offseting
addi r12,r0,0
% done generating indice offseting
% begin var offset calculation
addi r11,r12,352
sw 360(r14),r11
% end var offset calculation
% begin intlit storeage
addi r11,r0,0
sw 364(r14), r11
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r7,r0,4
bz r7,endCopy1

%set left and right ptrs
%read direct value address
add r10,r0,r14
addi r10,r10,364
lw r12,360(r14)
%set position counter
mul r8,r0,r0
beginCopy1
%move data via register
lb r9,0(r10)
sb 0(r12),r9
%increment registers
addi r10,r10,1
addi r12,r12,1
addi r8,r8,1
%branch out if done
subi r7,r8,4
bnz r7,beginCopy1

endCopy1
% end assignment 
% begin generating indice offseting
addi r8,r0,0
% done generating indice offseting
% begin var offset calculation
addi r7,r8,348
sw 368(r14),r7
% end var offset calculation
% begin intlit storeage
addi r7,r0,1
sw 372(r14), r7
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy2

%set left and right ptrs
%read direct value address
add r9,r0,r14
addi r9,r9,372
lw r8,368(r14)
%set position counter
mul r12,r0,r0
beginCopy2
%move data via register
lb r10,0(r9)
sb 0(r8),r10
%increment registers
addi r9,r9,1
addi r8,r8,1
addi r12,r12,1
%branch out if done
subi r11,r12,4
bnz r11,beginCopy2

endCopy2
% end assignment 
gowhile1
% begin generating indice offseting
addi r11,r0,0
% done generating indice offseting
% begin var offset calculation
addi r10,r11,348
sw 376(r14),r10
% end var offset calculation
% begin intlit storeage
addi r10,r0,50
sw 380(r14), r10
% done intlit storeage
% begin RELOP op 
lw r8,376(r14)
lw r10,0(r8)
lw r11,380(r14)
clt r9,r10,r11
sw 384(r14),r9
% end relop op 
lw r12,384(r14)
bz r12,endwhile1
% begin generating indice offseting
addi r8,r0,0
% done generating indice offseting
% begin var offset calculation
addi r9,r8,348
sw 388(r14),r9
% end var offset calculation
% begin generating indice offseting
addi r9,r0,0
% done generating indice offseting
% begin var offset calculation
addi r8,r9,348
sw 392(r14),r8
% end var offset calculation
% begin intlit storeage
addi r8,r0,1
sw 396(r14), r8
% done intlit storeage
% begin add op 
lw r10,392(r14)
lw r8,0(r10)
lw r9,396(r14)
add r11,r8,r9
sw 400(r14),r11
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r6,r0,4
bz r6,endCopy3

%set left and right ptrs
%read direct value address
add r9,r0,r14
addi r9,r9,400
lw r11,388(r14)
%set position counter
mul r7,r0,r0
beginCopy3
%move data via register
lb r8,0(r9)
sb 0(r11),r8
%increment registers
addi r9,r9,1
addi r11,r11,1
addi r7,r7,1
%branch out if done
subi r6,r7,4
bnz r6,beginCopy3

endCopy3
% end assignment 
% begin generating indice offseting
addi r6,r0,0
% done generating indice offseting
% begin var offset calculation
addi r8,r6,348
sw 404(r14),r8
% end var offset calculation
% begin intlit storeage
addi r8,r0,20
sw 408(r14), r8
% done intlit storeage
% begin RELOP op 
lw r11,404(r14)
lw r8,0(r11)
lw r6,408(r14)
cle r9,r8,r6
sw 412(r14),r9
% end relop op 
lw r7,412(r14)
bz r7,else1
% begin intlit storeage
addi r11,r0,200
sw 416(r14), r11
% done intlit storeage
% begin write 
lw r11,416(r14)
sw -8(r14),r11
addi r11,r0,buffer
sw -12(r14),r11
jl r15,intstr
sw -8(r14),r13
jl r15,putstr
addi r11,r0,newline
sw -8(r14),r11
jl r15,putstr
% end write
j endif1
else1
% begin generating indice offseting
addi r9,r0,0
% done generating indice offseting
% begin var offset calculation
addi r6,r9,348
sw 420(r14),r6
% end var offset calculation
% begin intlit storeage
addi r6,r0,50
sw 424(r14), r6
% done intlit storeage
% begin RELOP op 
lw r10,420(r14)
lw r6,0(r10)
lw r9,424(r14)
ceq r8,r6,r9
sw 428(r14),r8
% end relop op 
lw r11,428(r14)
bz r11,else2
% begin intlit storeage
addi r10,r0,5000
sw 432(r14), r10
% done intlit storeage
% begin write 
lw r10,432(r14)
sw -8(r14),r10
addi r10,r0,buffer
sw -12(r14),r10
jl r15,intstr
sw -8(r14),r13
jl r15,putstr
addi r10,r0,newline
sw -8(r14),r10
jl r15,putstr
% end write
j endif2
else2
% begin generating indice offseting
addi r10,r0,0
% done generating indice offseting
% begin var offset calculation
addi r8,r10,356
sw 436(r14),r8
% end var offset calculation
% begin intlit storeage
addi r8,r0,10
sw 440(r14), r8
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r4,r0,4
bz r4,endCopy4

%set left and right ptrs
%read direct value address
add r9,r0,r14
addi r9,r9,440
lw r10,436(r14)
%set position counter
mul r5,r0,r0
beginCopy4
%move data via register
lb r6,0(r9)
sb 0(r10),r6
%increment registers
addi r9,r9,1
addi r10,r10,1
addi r5,r5,1
%branch out if done
subi r4,r5,4
bnz r4,beginCopy4

endCopy4
% end assignment 
gowhile2
% begin generating indice offseting
addi r4,r0,0
% done generating indice offseting
% begin var offset calculation
addi r6,r4,356
sw 444(r14),r6
% end var offset calculation
% begin intlit storeage
addi r6,r0,100
sw 448(r14), r6
% done intlit storeage
% begin RELOP op 
lw r10,444(r14)
lw r6,0(r10)
lw r4,448(r14)
cne r9,r6,r4
sw 452(r14),r9
% end relop op 
lw r5,452(r14)
bz r5,endwhile2
% begin generating indice offseting
addi r10,r0,0
% done generating indice offseting
% begin var offset calculation
addi r9,r10,356
sw 456(r14),r9
% end var offset calculation
% begin write 
lw r9,456(r14)
lw r9,0(r9)
sw -8(r14),r9
addi r9,r0,buffer
sw -12(r14),r9
jl r15,intstr
sw -8(r14),r13
jl r15,putstr
addi r9,r0,newline
sw -8(r14),r9
jl r15,putstr
% end write
% begin generating indice offseting
addi r9,r0,0
% done generating indice offseting
% begin var offset calculation
addi r10,r9,356
sw 460(r14),r10
% end var offset calculation
% begin generating indice offseting
addi r10,r0,0
% done generating indice offseting
% begin var offset calculation
addi r9,r10,356
sw 464(r14),r9
% end var offset calculation
% begin intlit storeage
addi r9,r0,10
sw 468(r14), r9
% done intlit storeage
% begin add op 
lw r6,464(r14)
lw r9,0(r6)
lw r10,468(r14)
add r4,r9,r10
sw 472(r14),r4
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r3,r0,4
bz r3,endCopy5

%set left and right ptrs
%read direct value address
add r10,r0,r14
addi r10,r10,472
lw r4,460(r14)
%set position counter
mul r8,r0,r0
beginCopy5
%move data via register
lb r9,0(r10)
sb 0(r4),r9
%increment registers
addi r10,r10,1
addi r4,r4,1
addi r8,r8,1
%branch out if done
subi r3,r8,4
bnz r3,beginCopy5

endCopy5
% end assignment 
j gowhile2
endwhile2
endif2
endif1
j gowhile1
endwhile1
hlt
