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
gowhile1
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
sw 48(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,44
lw r9,48(r14)
 add r10,r10,r9
sw 52(r14),r10
% end var offset calculation
% begin intlit storeage
addi r9,r0,5
sw 56(r14), r9
% done intlit storeage
% begin RELOP op 
lw r8,52(r14)
add r8,r14,r8
lw r9,0(r8)
lw r10,56(r14)
cne r11,r9,r10
sw 60(r14),r11
% end relop op 
lw r12,60(r14)
bz r12,endwhile1
% begin generating indice offseting
addi r8,r0,1
addi r11,r0,0
sw 64(r14),r0
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
addi r11,r0,44
lw r8,76(r14)
 add r11,r11,r8
sw 80(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r8,r0,1
addi r11,r0,0
lw r10,80(r14)
add r10,r14,r10
lw r10,0(r10)
muli r9,r8,8
mul r9,r10,r9
add r11,r11,r9
sw 84(r14),r11
% done generating indice offseting
% begin var offset calculation
lw r10,84(r14)
lw r11,72(r14)
add r11,r11,r10
sw 88(r14),r11
% end var offset calculation
%begin dot offsetting
lw r10,88(r14)
addi r10,r10,0
sw 92(r14),r10
%end dot offsetting
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
sw 96(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r8,96(r14)
lw r11,92(r14)
add r11,r11,r8
sw 100(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r8,r0,1
addi r11,r0,0
sw 104(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,44
lw r10,104(r14)
 add r11,r11,r10
sw 108(r14),r11
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r7,r0,4
bz r7,endCopy1

%set left and right ptrs
%set ptr
lw r11,108(r14)
add r11,r14,r11
lw r10,100(r14)
add r10,r14,r10
%set position counter
mul r9,r0,r0
beginCopy1
%move data via register
lw r8,0(r11)
sw 0(r10),r8
%increment registers
addi r11,r11,4
addi r10,r10,4
addi r9,r9,4
%branch out if done
subi r7,r9,4
bnz r7,beginCopy1

endCopy1
% end assignment 
% begin generating indice offseting
addi r9,r0,1
addi r7,r0,0
sw 112(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r7,r0,44
lw r8,112(r14)
 add r7,r7,r8
sw 116(r14),r7
% end var offset calculation
% begin generating indice offseting
addi r8,r0,1
addi r7,r0,0
sw 120(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r7,r0,44
lw r9,120(r14)
 add r7,r7,r9
sw 124(r14),r7
% end var offset calculation
% begin intlit storeage
addi r9,r0,1
sw 128(r14), r9
% done intlit storeage
% begin add op 
lw r11,124(r14)
add r11,r14,r11
lw r9,0(r11)
lw r7,128(r14)
add r8,r9,r7
sw 132(r14),r8
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy2

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,132
lw r11,116(r14)
add r11,r14,r11
%set position counter
mul r9,r0,r0
beginCopy2
%move data via register
lw r7,0(r8)
sw 0(r11),r7
%increment registers
addi r8,r8,4
addi r11,r11,4
addi r9,r9,4
%branch out if done
subi r10,r9,4
bnz r10,beginCopy2

endCopy2
% end assignment 
% begin generating indice offseting
addi r9,r0,1
addi r10,r0,0
sw 136(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,4
lw r7,136(r14)
 add r10,r10,r7
sw 140(r14),r10
% end var offset calculation
%begin dot offsetting
lw r7,140(r14)
addi r7,r7,0
sw 144(r14),r7
%end dot offsetting
% begin generating indice offseting
addi r7,r0,1
addi r10,r0,0
sw 148(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,44
lw r9,148(r14)
 add r10,r10,r9
sw 152(r14),r10
% end var offset calculation
% begin generating indice offseting
addi r9,r0,1
addi r10,r0,0
lw r7,152(r14)
add r7,r14,r7
lw r7,0(r7)
muli r8,r9,8
mul r8,r7,r8
add r10,r10,r8
sw 156(r14),r10
% done generating indice offseting
% begin var offset calculation
lw r7,156(r14)
lw r10,144(r14)
add r10,r10,r7
sw 160(r14),r10
% end var offset calculation
%begin dot offsetting
lw r7,160(r14)
addi r7,r7,4
sw 164(r14),r7
%end dot offsetting
% begin generating indice offseting
addi r7,r0,1
addi r10,r0,0
sw 168(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r9,168(r14)
lw r10,164(r14)
add r10,r10,r9
sw 172(r14),r10
% end var offset calculation
% begin generating indice offseting
addi r9,r0,1
addi r10,r0,0
sw 176(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,44
lw r7,176(r14)
 add r10,r10,r7
sw 180(r14),r10
% end var offset calculation
% begin intlit storeage
addi r7,r0,2
sw 184(r14), r7
% done intlit storeage
% begin mult op 
lw r8,180(r14)
add r8,r14,r8
lw r7,0(r8)
lw r10,184(r14)
mul r9,r7,r10
sw 188(r14),r9
% end mult op 
% begin assignment 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy3

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,188
lw r8,172(r14)
add r8,r14,r8
%set position counter
mul r7,r0,r0
beginCopy3
%move data via register
lw r10,0(r9)
sw 0(r8),r10
%increment registers
addi r9,r9,4
addi r8,r8,4
addi r7,r7,4
%branch out if done
subi r11,r7,4
bnz r11,beginCopy3

endCopy3
% end assignment 
j gowhile1
endwhile1
% begin generating indice offseting
addi r12,r0,1
addi r7,r0,0
sw 192(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r7,r0,44
lw r11,192(r14)
 add r7,r7,r11
sw 196(r14),r7
% end var offset calculation
% begin intlit storeage
addi r11,r0,0
sw 200(r14), r11
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy4

%set left and right ptrs
%read direct value
add r7,r0,r14
addi r7,r7,200
lw r11,196(r14)
add r11,r14,r11
%set position counter
mul r10,r0,r0
beginCopy4
%move data via register
lw r12,0(r7)
sw 0(r11),r12
%increment registers
addi r7,r7,4
addi r11,r11,4
addi r10,r10,4
%branch out if done
subi r9,r10,4
bnz r9,beginCopy4

endCopy4
% end assignment 
gowhile2
% begin generating indice offseting
addi r9,r0,1
addi r12,r0,0
sw 204(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,44
lw r7,204(r14)
 add r12,r12,r7
sw 208(r14),r12
% end var offset calculation
% begin intlit storeage
addi r7,r0,5
sw 212(r14), r7
% done intlit storeage
% begin RELOP op 
lw r11,208(r14)
add r11,r14,r11
lw r7,0(r11)
lw r12,212(r14)
cne r9,r7,r12
sw 216(r14),r9
% end relop op 
lw r10,216(r14)
bz r10,endwhile2
% begin generating indice offseting
addi r11,r0,1
addi r9,r0,0
sw 220(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,4
lw r12,220(r14)
 add r9,r9,r12
sw 224(r14),r9
% end var offset calculation
%begin dot offsetting
lw r12,224(r14)
addi r12,r12,0
sw 228(r14),r12
%end dot offsetting
% begin generating indice offseting
addi r12,r0,1
addi r9,r0,0
sw 232(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,44
lw r11,232(r14)
 add r9,r9,r11
sw 236(r14),r9
% end var offset calculation
% begin generating indice offseting
addi r11,r0,1
addi r9,r0,0
lw r12,236(r14)
add r12,r14,r12
lw r12,0(r12)
muli r7,r11,8
mul r7,r12,r7
add r9,r9,r7
sw 240(r14),r9
% done generating indice offseting
% begin var offset calculation
lw r12,240(r14)
lw r9,228(r14)
add r9,r9,r12
sw 244(r14),r9
% end var offset calculation
%begin dot offsetting
lw r12,244(r14)
addi r12,r12,0
sw 248(r14),r12
%end dot offsetting
% begin generating indice offseting
addi r12,r0,1
addi r9,r0,0
sw 252(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r11,252(r14)
lw r9,248(r14)
add r9,r9,r11
sw 256(r14),r9
% end var offset calculation
% begin write 
lw r11,256(r14)
add r11,r14,r11
lw r11,0(r11)
%s move ptr to prevent mem corruption
addi r14,r14,456
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
addi r14,r14,-456
% end write
% begin generating indice offseting
addi r11,r0,1
addi r9,r0,0
sw 260(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,44
lw r12,260(r14)
 add r9,r9,r12
sw 264(r14),r9
% end var offset calculation
% begin generating indice offseting
addi r12,r0,1
addi r9,r0,0
sw 268(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,44
lw r11,268(r14)
 add r9,r9,r11
sw 272(r14),r9
% end var offset calculation
% begin intlit storeage
addi r11,r0,1
sw 276(r14), r11
% done intlit storeage
% begin add op 
lw r7,272(r14)
add r7,r14,r7
lw r11,0(r7)
lw r9,276(r14)
add r12,r11,r9
sw 280(r14),r12
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy5

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,280
lw r7,264(r14)
add r7,r14,r7
%set position counter
mul r11,r0,r0
beginCopy5
%move data via register
lw r9,0(r12)
sw 0(r7),r9
%increment registers
addi r12,r12,4
addi r7,r7,4
addi r11,r11,4
%branch out if done
subi r8,r11,4
bnz r8,beginCopy5

endCopy5
% end assignment 
j gowhile2
endwhile2
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
sw 284(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,44
lw r8,284(r14)
 add r11,r11,r8
sw 288(r14),r11
% end var offset calculation
% begin intlit storeage
addi r8,r0,0
sw 292(r14), r8
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy6

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,292
lw r8,288(r14)
add r8,r14,r8
%set position counter
mul r9,r0,r0
beginCopy6
%move data via register
lw r10,0(r11)
sw 0(r8),r10
%increment registers
addi r11,r11,4
addi r8,r8,4
addi r9,r9,4
%branch out if done
subi r12,r9,4
bnz r12,beginCopy6

endCopy6
% end assignment 
gowhile3
% begin generating indice offseting
addi r12,r0,1
addi r10,r0,0
sw 296(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,44
lw r11,296(r14)
 add r10,r10,r11
sw 300(r14),r10
% end var offset calculation
% begin intlit storeage
addi r11,r0,5
sw 304(r14), r11
% done intlit storeage
% begin RELOP op 
lw r8,300(r14)
add r8,r14,r8
lw r11,0(r8)
lw r10,304(r14)
cne r12,r11,r10
sw 308(r14),r12
% end relop op 
lw r9,308(r14)
bz r9,endwhile3
% begin generating indice offseting
addi r8,r0,1
addi r12,r0,0
sw 312(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r10,312(r14)
 add r12,r12,r10
sw 316(r14),r12
% end var offset calculation
%begin dot offsetting
lw r10,316(r14)
addi r10,r10,0
sw 320(r14),r10
%end dot offsetting
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
sw 324(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,44
lw r8,324(r14)
 add r12,r12,r8
sw 328(r14),r12
% end var offset calculation
% begin generating indice offseting
addi r8,r0,1
addi r12,r0,0
lw r10,328(r14)
add r10,r14,r10
lw r10,0(r10)
muli r11,r8,8
mul r11,r10,r11
add r12,r12,r11
sw 332(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r10,332(r14)
lw r12,320(r14)
add r12,r12,r10
sw 336(r14),r12
% end var offset calculation
%begin dot offsetting
lw r10,336(r14)
addi r10,r10,4
sw 340(r14),r10
%end dot offsetting
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
sw 344(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r8,344(r14)
lw r12,340(r14)
add r12,r12,r8
sw 348(r14),r12
% end var offset calculation
% begin write 
lw r8,348(r14)
add r8,r14,r8
lw r8,0(r8)
%s move ptr to prevent mem corruption
addi r14,r14,456
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
addi r14,r14,-456
% end write
% begin generating indice offseting
addi r8,r0,1
addi r12,r0,0
sw 352(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,44
lw r10,352(r14)
 add r12,r12,r10
sw 356(r14),r12
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
sw 360(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,44
lw r8,360(r14)
 add r12,r12,r8
sw 364(r14),r12
% end var offset calculation
% begin intlit storeage
addi r8,r0,1
sw 368(r14), r8
% done intlit storeage
% begin add op 
lw r11,364(r14)
add r11,r14,r11
lw r8,0(r11)
lw r12,368(r14)
add r10,r8,r12
sw 372(r14),r10
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r7,r0,4
bz r7,endCopy7

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,372
lw r11,356(r14)
add r11,r14,r11
%set position counter
mul r8,r0,r0
beginCopy7
%move data via register
lw r12,0(r10)
sw 0(r11),r12
%increment registers
addi r10,r10,4
addi r11,r11,4
addi r8,r8,4
%branch out if done
subi r7,r8,4
bnz r7,beginCopy7

endCopy7
% end assignment 
j gowhile3
endwhile3
hlt
