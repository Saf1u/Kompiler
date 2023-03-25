buffer               res     200
stackbase            res     2048
newline              db      ,13,10,0
align
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
lw r11,364(r14)
lw r12,360(r14) 
sw 0(r12),r11
% end assignment 
% begin generating indice offseting
addi r10,r0,0
% done generating indice offseting
% begin var offset calculation
addi r12,r10,348
sw 368(r14),r12
% end var offset calculation
% begin intlit storeage
addi r12,r0,1
sw 372(r14), r12
% done intlit storeage
% begin assignment 
lw r12,372(r14)
lw r10,368(r14) 
sw 0(r10),r12
% end assignment 
gowhile1
% begin generating indice offseting
addi r10,r0,0
% done generating indice offseting
% begin var offset calculation
addi r12,r10,348
sw 376(r14),r12
% end var offset calculation
% begin intlit storeage
addi r12,r0,50
sw 380(r14), r12
% done intlit storeage
% begin RELOP op 
lw r8,376(r14)
lw r12,0(r8)
lw r10,380(r14)
clt r9,r12,r10
sw 384(r14),r9
% end relop op 
lw r11,384(r14)
bz r11,endwhile1
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
lw r12,392(r14)
lw r8,0(r12)
lw r9,396(r14)
add r10,r8,r9
sw 400(r14),r10
% end add op 
% begin assignment 
lw r12,400(r14)
lw r10,388(r14) 
sw 0(r10),r12
% end assignment 
% begin generating indice offseting
addi r10,r0,0
% done generating indice offseting
% begin var offset calculation
addi r12,r10,348
sw 404(r14),r12
% end var offset calculation
% begin intlit storeage
addi r12,r0,20
sw 408(r14), r12
% done intlit storeage
% begin RELOP op 
lw r7,404(r14)
lw r12,0(r7)
lw r10,408(r14)
cle r8,r12,r10
sw 412(r14),r8
% end relop op 
lw r9,412(r14)
bz r9,else1
% begin intlit storeage
addi r7,r0,200
sw 416(r14), r7
% done intlit storeage
% begin write 
lw r7,416(r14)
sw -8(r14),r7
addi r7,r0,buffer
sw -12(r14),r7
jl r15,intstr
sw -8(r14),r13
jl r15,putstr
addi r7,r0,newline
sw -8(r14),r7
jl r15,putstr
% end write
j endif1
else1
% begin generating indice offseting
addi r8,r0,0
% done generating indice offseting
% begin var offset calculation
addi r10,r8,348
sw 420(r14),r10
% end var offset calculation
% begin intlit storeage
addi r10,r0,50
sw 424(r14), r10
% done intlit storeage
% begin RELOP op 
lw r6,420(r14)
lw r10,0(r6)
lw r8,424(r14)
ceq r12,r10,r8
sw 428(r14),r12
% end relop op 
lw r7,428(r14)
bz r7,else2
% begin intlit storeage
addi r6,r0,5000
sw 432(r14), r6
% done intlit storeage
% begin write 
lw r6,432(r14)
sw -8(r14),r6
addi r6,r0,buffer
sw -12(r14),r6
jl r15,intstr
sw -8(r14),r13
jl r15,putstr
addi r6,r0,newline
sw -8(r14),r6
jl r15,putstr
% end write
j endif2
else2
% begin generating indice offseting
addi r6,r0,0
% done generating indice offseting
% begin var offset calculation
addi r12,r6,356
sw 436(r14),r12
% end var offset calculation
% begin intlit storeage
addi r12,r0,10
sw 440(r14), r12
% done intlit storeage
% begin assignment 
lw r12,440(r14)
lw r6,436(r14) 
sw 0(r6),r12
% end assignment 
gowhile2
% begin generating indice offseting
addi r6,r0,0
% done generating indice offseting
% begin var offset calculation
addi r12,r6,356
sw 444(r14),r12
% end var offset calculation
% begin intlit storeage
addi r12,r0,100
sw 448(r14), r12
% done intlit storeage
% begin RELOP op 
lw r5,444(r14)
lw r12,0(r5)
lw r6,448(r14)
cne r10,r12,r6
sw 452(r14),r10
% end relop op 
lw r8,452(r14)
bz r8,endwhile2
% begin generating indice offseting
addi r5,r0,0
% done generating indice offseting
% begin var offset calculation
addi r10,r5,356
sw 456(r14),r10
% end var offset calculation
% begin write 
lw r10,456(r14)
lw r10,0(r10)
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
% begin generating indice offseting
addi r10,r0,0
% done generating indice offseting
% begin var offset calculation
addi r5,r10,356
sw 460(r14),r5
% end var offset calculation
% begin generating indice offseting
addi r5,r0,0
% done generating indice offseting
% begin var offset calculation
addi r10,r5,356
sw 464(r14),r10
% end var offset calculation
% begin intlit storeage
addi r10,r0,10
sw 468(r14), r10
% done intlit storeage
% begin add op 
lw r12,464(r14)
lw r10,0(r12)
lw r5,468(r14)
add r6,r10,r5
sw 472(r14),r6
% end add op 
% begin assignment 
lw r12,472(r14)
lw r6,460(r14) 
sw 0(r6),r12
% end assignment 
j gowhile2
endwhile2
endif2
endif1
j gowhile1
endwhile1
hlt
