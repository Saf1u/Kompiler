entry
muli r0,r0,0
muli r14,r0,0
addi r14,r0,stackbase
%r14 is stack ptr, stack grows downwards or upwards
%24kb stack
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 24(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r10,24(r14)
 add r11,r11,r10
sw 28(r14),r11
% end var offset calculation
%begin dot offsetting
lw r10,28(r14)
addi r10,r10,16
sw 32(r14),r10
%end dot offsetting
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
sw 36(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r12,36(r14)
lw r11,32(r14)
add r11,r11,r12
sw 40(r14),r11
% end var offset calculation
% begin intlit storeage
addi r12,r0,0
sw 44(r14), r12
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy1

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,44
lw r12,40(r14)
add r12,r14,r12
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
% end assignment 
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
sw 48(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,4
lw r10,48(r14)
 add r8,r8,r10
sw 52(r14),r8
% end var offset calculation
%begin dot offsetting
lw r10,52(r14)
addi r10,r10,16
sw 56(r14),r10
%end dot offsetting
% begin generating indice offseting
addi r10,r0,1
addi r8,r0,0
sw 60(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r9,60(r14)
lw r8,56(r14)
add r8,r8,r9
sw 64(r14),r8
% end var offset calculation
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
sw 68(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,4
lw r10,68(r14)
 add r8,r8,r10
sw 72(r14),r8
% end var offset calculation
%begin dot offsetting
lw r10,72(r14)
addi r10,r10,16
sw 76(r14),r10
%end dot offsetting
% begin generating indice offseting
addi r10,r0,1
addi r8,r0,0
sw 80(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r9,80(r14)
lw r8,76(r14)
add r8,r8,r9
sw 84(r14),r8
% end var offset calculation
% begin intlit storeage
addi r9,r0,1
sw 88(r14), r9
% done intlit storeage
% begin add op 
lw r11,84(r14)
add r11,r14,r11
lw r9,0(r11)
lw r8,88(r14)
add r10,r9,r8
sw 92(r14),r10
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy2

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,92
lw r11,64(r14)
add r11,r14,r11
%set position counter
mul r9,r0,r0
beginCopy2
%move data via register
lw r8,0(r10)
sw 0(r11),r8
%increment registers
addi r10,r10,4
addi r11,r11,4
addi r9,r9,4
%branch out if done
subi r12,r9,4
bnz r12,beginCopy2

endCopy2
% end assignment 
% begin generating indice offseting
addi r9,r0,1
addi r12,r0,0
sw 96(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r8,96(r14)
 add r12,r12,r8
sw 100(r14),r12
% end var offset calculation
%begin dot offsetting
lw r8,100(r14)
addi r8,r8,16
sw 104(r14),r8
%end dot offsetting
% begin generating indice offseting
addi r8,r0,1
addi r12,r0,0
sw 108(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r9,108(r14)
lw r12,104(r14)
add r12,r12,r9
sw 112(r14),r12
% end var offset calculation
% begin generating indice offseting
addi r9,r0,1
addi r12,r0,0
sw 116(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r8,116(r14)
 add r12,r12,r8
sw 120(r14),r12
% end var offset calculation
%begin dot offsetting
lw r8,120(r14)
addi r8,r8,16
sw 124(r14),r8
%end dot offsetting
% begin generating indice offseting
addi r8,r0,1
addi r12,r0,0
sw 128(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r9,128(r14)
lw r12,124(r14)
add r12,r12,r9
sw 132(r14),r12
% end var offset calculation
% begin intlit storeage
addi r9,r0,1
sw 136(r14), r9
% done intlit storeage
% begin add op 
lw r10,132(r14)
add r10,r14,r10
lw r9,0(r10)
lw r12,136(r14)
add r8,r9,r12
sw 140(r14),r8
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy3

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,140
lw r10,112(r14)
add r10,r14,r10
%set position counter
mul r9,r0,r0
beginCopy3
%move data via register
lw r12,0(r8)
sw 0(r10),r12
%increment registers
addi r8,r8,4
addi r10,r10,4
addi r9,r9,4
%branch out if done
subi r11,r9,4
bnz r11,beginCopy3

endCopy3
% end assignment 
% begin generating indice offseting
addi r9,r0,1
addi r11,r0,0
sw 144(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r12,144(r14)
 add r11,r11,r12
sw 148(r14),r11
% end var offset calculation
%begin dot offsetting
lw r12,148(r14)
addi r12,r12,16
sw 152(r14),r12
%end dot offsetting
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 156(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r9,156(r14)
lw r11,152(r14)
add r11,r11,r9
sw 160(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r9,r0,1
addi r11,r0,0
sw 164(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r12,164(r14)
 add r11,r11,r12
sw 168(r14),r11
% end var offset calculation
%begin dot offsetting
lw r12,168(r14)
addi r12,r12,16
sw 172(r14),r12
%end dot offsetting
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 176(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r9,176(r14)
lw r11,172(r14)
add r11,r11,r9
sw 180(r14),r11
% end var offset calculation
% begin intlit storeage
addi r9,r0,1
sw 184(r14), r9
% done intlit storeage
% begin add op 
lw r8,180(r14)
add r8,r14,r8
lw r9,0(r8)
lw r11,184(r14)
add r12,r9,r11
sw 188(r14),r12
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy4

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,188
lw r8,160(r14)
add r8,r14,r8
%set position counter
mul r9,r0,r0
beginCopy4
%move data via register
lw r11,0(r12)
sw 0(r8),r11
%increment registers
addi r12,r12,4
addi r8,r8,4
addi r9,r9,4
%branch out if done
subi r10,r9,4
bnz r10,beginCopy4

endCopy4
% end assignment 
% begin generating indice offseting
addi r9,r0,1
addi r10,r0,0
sw 192(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,4
lw r11,192(r14)
 add r10,r10,r11
sw 196(r14),r10
% end var offset calculation
%begin dot offsetting
lw r11,196(r14)
addi r11,r11,16
sw 200(r14),r11
%end dot offsetting
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
sw 204(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r9,204(r14)
lw r10,200(r14)
add r10,r10,r9
sw 208(r14),r10
% end var offset calculation
% begin write 
lw r9,208(r14)
add r9,r14,r9
lw r9,0(r9)
%s move ptr to prevent mem corruption
addi r14,r14,928
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
addi r14,r14,-928
% end write
% begin generating indice offseting
addi r9,r0,1
addi r10,r0,0
sw 212(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,4
lw r11,212(r14)
 add r10,r10,r11
sw 216(r14),r10
% end var offset calculation
%begin dot offsetting
lw r11,216(r14)
addi r11,r11,0
sw 220(r14),r11
%end dot offsetting
% begin intlit storeage
addi r11,r0,3
sw 224(r14), r11
% done intlit storeage
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
lw r9,224(r14)
muli r12,r11,4
mul r12,r9,r12
add r10,r10,r12
sw 228(r14),r10
% done generating indice offseting
% begin var offset calculation
lw r9,228(r14)
lw r10,220(r14)
add r10,r10,r9
sw 232(r14),r10
% end var offset calculation
%begin dot offsetting
lw r9,232(r14)
addi r9,r9,0
sw 236(r14),r9
%end dot offsetting
% begin generating indice offseting
addi r9,r0,1
addi r10,r0,0
sw 240(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r11,240(r14)
lw r10,236(r14)
add r10,r10,r11
sw 244(r14),r10
% end var offset calculation
% begin intlit storeage
addi r11,r0,0
sw 248(r14), r11
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy5

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,248
lw r11,244(r14)
add r11,r14,r11
%set position counter
mul r12,r0,r0
beginCopy5
%move data via register
lw r9,0(r10)
sw 0(r11),r9
%increment registers
addi r10,r10,4
addi r11,r11,4
addi r12,r12,4
%branch out if done
subi r8,r12,4
bnz r8,beginCopy5

endCopy5
% end assignment 
% begin generating indice offseting
addi r12,r0,1
addi r8,r0,0
sw 252(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,4
lw r9,252(r14)
 add r8,r8,r9
sw 256(r14),r8
% end var offset calculation
%begin dot offsetting
lw r9,256(r14)
addi r9,r9,0
sw 260(r14),r9
%end dot offsetting
% begin intlit storeage
addi r9,r0,3
sw 264(r14), r9
% done intlit storeage
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
lw r12,264(r14)
muli r10,r9,4
mul r10,r12,r10
add r8,r8,r10
sw 268(r14),r8
% done generating indice offseting
% begin var offset calculation
lw r12,268(r14)
lw r8,260(r14)
add r8,r8,r12
sw 272(r14),r8
% end var offset calculation
%begin dot offsetting
lw r12,272(r14)
addi r12,r12,0
sw 276(r14),r12
%end dot offsetting
% begin generating indice offseting
addi r12,r0,1
addi r8,r0,0
sw 280(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r9,280(r14)
lw r8,276(r14)
add r8,r8,r9
sw 284(r14),r8
% end var offset calculation
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
sw 288(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,4
lw r12,288(r14)
 add r8,r8,r12
sw 292(r14),r8
% end var offset calculation
%begin dot offsetting
lw r12,292(r14)
addi r12,r12,0
sw 296(r14),r12
%end dot offsetting
% begin intlit storeage
addi r12,r0,3
sw 300(r14), r12
% done intlit storeage
% begin generating indice offseting
addi r12,r0,1
addi r8,r0,0
lw r9,300(r14)
muli r10,r12,4
mul r10,r9,r10
add r8,r8,r10
sw 304(r14),r8
% done generating indice offseting
% begin var offset calculation
lw r9,304(r14)
lw r8,296(r14)
add r8,r8,r9
sw 308(r14),r8
% end var offset calculation
%begin dot offsetting
lw r9,308(r14)
addi r9,r9,0
sw 312(r14),r9
%end dot offsetting
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
sw 316(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r12,316(r14)
lw r8,312(r14)
add r8,r8,r12
sw 320(r14),r8
% end var offset calculation
% begin intlit storeage
addi r12,r0,1
sw 324(r14), r12
% done intlit storeage
% begin add op 
lw r10,320(r14)
add r10,r14,r10
lw r12,0(r10)
lw r8,324(r14)
add r9,r12,r8
sw 328(r14),r9
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy6

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,328
lw r10,284(r14)
add r10,r14,r10
%set position counter
mul r12,r0,r0
beginCopy6
%move data via register
lw r8,0(r9)
sw 0(r10),r8
%increment registers
addi r9,r9,4
addi r10,r10,4
addi r12,r12,4
%branch out if done
subi r11,r12,4
bnz r11,beginCopy6

endCopy6
% end assignment 
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 332(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r8,332(r14)
 add r11,r11,r8
sw 336(r14),r11
% end var offset calculation
%begin dot offsetting
lw r8,336(r14)
addi r8,r8,0
sw 340(r14),r8
%end dot offsetting
% begin intlit storeage
addi r8,r0,3
sw 344(r14), r8
% done intlit storeage
% begin generating indice offseting
addi r8,r0,1
addi r11,r0,0
lw r12,344(r14)
muli r9,r8,4
mul r9,r12,r9
add r11,r11,r9
sw 348(r14),r11
% done generating indice offseting
% begin var offset calculation
lw r12,348(r14)
lw r11,340(r14)
add r11,r11,r12
sw 352(r14),r11
% end var offset calculation
%begin dot offsetting
lw r12,352(r14)
addi r12,r12,0
sw 356(r14),r12
%end dot offsetting
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 360(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r8,360(r14)
lw r11,356(r14)
add r11,r11,r8
sw 364(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r8,r0,1
addi r11,r0,0
sw 368(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r12,368(r14)
 add r11,r11,r12
sw 372(r14),r11
% end var offset calculation
%begin dot offsetting
lw r12,372(r14)
addi r12,r12,0
sw 376(r14),r12
%end dot offsetting
% begin intlit storeage
addi r12,r0,3
sw 380(r14), r12
% done intlit storeage
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
lw r8,380(r14)
muli r9,r12,4
mul r9,r8,r9
add r11,r11,r9
sw 384(r14),r11
% done generating indice offseting
% begin var offset calculation
lw r8,384(r14)
lw r11,376(r14)
add r11,r11,r8
sw 388(r14),r11
% end var offset calculation
%begin dot offsetting
lw r8,388(r14)
addi r8,r8,0
sw 392(r14),r8
%end dot offsetting
% begin generating indice offseting
addi r8,r0,1
addi r11,r0,0
sw 396(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r12,396(r14)
lw r11,392(r14)
add r11,r11,r12
sw 400(r14),r11
% end var offset calculation
% begin intlit storeage
addi r12,r0,1
sw 404(r14), r12
% done intlit storeage
% begin add op 
lw r9,400(r14)
add r9,r14,r9
lw r12,0(r9)
lw r11,404(r14)
add r8,r12,r11
sw 408(r14),r8
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy7

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,408
lw r9,364(r14)
add r9,r14,r9
%set position counter
mul r12,r0,r0
beginCopy7
%move data via register
lw r11,0(r8)
sw 0(r9),r11
%increment registers
addi r8,r8,4
addi r9,r9,4
addi r12,r12,4
%branch out if done
subi r10,r12,4
bnz r10,beginCopy7

endCopy7
% end assignment 
% begin generating indice offseting
addi r12,r0,1
addi r10,r0,0
sw 412(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,4
lw r11,412(r14)
 add r10,r10,r11
sw 416(r14),r10
% end var offset calculation
%begin dot offsetting
lw r11,416(r14)
addi r11,r11,0
sw 420(r14),r11
%end dot offsetting
% begin intlit storeage
addi r11,r0,3
sw 424(r14), r11
% done intlit storeage
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
lw r12,424(r14)
muli r8,r11,4
mul r8,r12,r8
add r10,r10,r8
sw 428(r14),r10
% done generating indice offseting
% begin var offset calculation
lw r12,428(r14)
lw r10,420(r14)
add r10,r10,r12
sw 432(r14),r10
% end var offset calculation
%begin dot offsetting
lw r12,432(r14)
addi r12,r12,0
sw 436(r14),r12
%end dot offsetting
% begin generating indice offseting
addi r12,r0,1
addi r10,r0,0
sw 440(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r11,440(r14)
lw r10,436(r14)
add r10,r10,r11
sw 444(r14),r10
% end var offset calculation
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
sw 448(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,4
lw r12,448(r14)
 add r10,r10,r12
sw 452(r14),r10
% end var offset calculation
%begin dot offsetting
lw r12,452(r14)
addi r12,r12,0
sw 456(r14),r12
%end dot offsetting
% begin intlit storeage
addi r12,r0,3
sw 460(r14), r12
% done intlit storeage
% begin generating indice offseting
addi r12,r0,1
addi r10,r0,0
lw r11,460(r14)
muli r8,r12,4
mul r8,r11,r8
add r10,r10,r8
sw 464(r14),r10
% done generating indice offseting
% begin var offset calculation
lw r11,464(r14)
lw r10,456(r14)
add r10,r10,r11
sw 468(r14),r10
% end var offset calculation
%begin dot offsetting
lw r11,468(r14)
addi r11,r11,0
sw 472(r14),r11
%end dot offsetting
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
sw 476(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r12,476(r14)
lw r10,472(r14)
add r10,r10,r12
sw 480(r14),r10
% end var offset calculation
% begin intlit storeage
addi r12,r0,1
sw 484(r14), r12
% done intlit storeage
% begin add op 
lw r8,480(r14)
add r8,r14,r8
lw r12,0(r8)
lw r10,484(r14)
add r11,r12,r10
sw 488(r14),r11
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy8

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,488
lw r8,444(r14)
add r8,r14,r8
%set position counter
mul r12,r0,r0
beginCopy8
%move data via register
lw r10,0(r11)
sw 0(r8),r10
%increment registers
addi r11,r11,4
addi r8,r8,4
addi r12,r12,4
%branch out if done
subi r9,r12,4
bnz r9,beginCopy8

endCopy8
% end assignment 
% begin generating indice offseting
addi r12,r0,1
addi r9,r0,0
sw 492(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,4
lw r10,492(r14)
 add r9,r9,r10
sw 496(r14),r9
% end var offset calculation
%begin dot offsetting
lw r10,496(r14)
addi r10,r10,0
sw 500(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,3
sw 504(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
lw r12,504(r14)
muli r11,r10,4
mul r11,r12,r11
add r9,r9,r11
sw 508(r14),r9
% done generating indice offseting
% begin var offset calculation
lw r12,508(r14)
lw r9,500(r14)
add r9,r9,r12
sw 512(r14),r9
% end var offset calculation
%begin dot offsetting
lw r12,512(r14)
addi r12,r12,0
sw 516(r14),r12
%end dot offsetting
% begin generating indice offseting
addi r12,r0,1
addi r9,r0,0
sw 520(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r10,520(r14)
lw r9,516(r14)
add r9,r9,r10
sw 524(r14),r9
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
sw 528(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,4
lw r12,528(r14)
 add r9,r9,r12
sw 532(r14),r9
% end var offset calculation
%begin dot offsetting
lw r12,532(r14)
addi r12,r12,0
sw 536(r14),r12
%end dot offsetting
% begin intlit storeage
addi r12,r0,3
sw 540(r14), r12
% done intlit storeage
% begin generating indice offseting
addi r12,r0,1
addi r9,r0,0
lw r10,540(r14)
muli r11,r12,4
mul r11,r10,r11
add r9,r9,r11
sw 544(r14),r9
% done generating indice offseting
% begin var offset calculation
lw r10,544(r14)
lw r9,536(r14)
add r9,r9,r10
sw 548(r14),r9
% end var offset calculation
%begin dot offsetting
lw r10,548(r14)
addi r10,r10,0
sw 552(r14),r10
%end dot offsetting
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
sw 556(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r12,556(r14)
lw r9,552(r14)
add r9,r9,r12
sw 560(r14),r9
% end var offset calculation
% begin intlit storeage
addi r12,r0,1
sw 564(r14), r12
% done intlit storeage
% begin add op 
lw r11,560(r14)
add r11,r14,r11
lw r12,0(r11)
lw r9,564(r14)
add r10,r12,r9
sw 568(r14),r10
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy9

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,568
lw r11,524(r14)
add r11,r14,r11
%set position counter
mul r12,r0,r0
beginCopy9
%move data via register
lw r9,0(r10)
sw 0(r11),r9
%increment registers
addi r10,r10,4
addi r11,r11,4
addi r12,r12,4
%branch out if done
subi r8,r12,4
bnz r8,beginCopy9

endCopy9
% end assignment 
% begin generating indice offseting
addi r12,r0,1
addi r8,r0,0
sw 572(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,4
lw r9,572(r14)
 add r8,r8,r9
sw 576(r14),r8
% end var offset calculation
%begin dot offsetting
lw r9,576(r14)
addi r9,r9,0
sw 580(r14),r9
%end dot offsetting
% begin intlit storeage
addi r9,r0,3
sw 584(r14), r9
% done intlit storeage
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
lw r12,584(r14)
muli r10,r9,4
mul r10,r12,r10
add r8,r8,r10
sw 588(r14),r8
% done generating indice offseting
% begin var offset calculation
lw r12,588(r14)
lw r8,580(r14)
add r8,r8,r12
sw 592(r14),r8
% end var offset calculation
%begin dot offsetting
lw r12,592(r14)
addi r12,r12,0
sw 596(r14),r12
%end dot offsetting
% begin generating indice offseting
addi r12,r0,1
addi r8,r0,0
sw 600(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r9,600(r14)
lw r8,596(r14)
add r8,r8,r9
sw 604(r14),r8
% end var offset calculation
% begin write 
lw r9,604(r14)
add r9,r14,r9
lw r9,0(r9)
%s move ptr to prevent mem corruption
addi r14,r14,928
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
addi r14,r14,-928
% end write
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
sw 608(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,4
lw r12,608(r14)
 add r8,r8,r12
sw 612(r14),r8
% end var offset calculation
%begin dot offsetting
lw r12,612(r14)
addi r12,r12,0
sw 616(r14),r12
%end dot offsetting
% begin intlit storeage
addi r12,r0,3
sw 620(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,2
sw 624(r14), r12
% done intlit storeage
% begin mult op 
lw r12,620(r14)
lw r8,624(r14)
mul r9,r12,r8
sw 628(r14),r9
% end mult op 
% begin intlit storeage
addi r10,r0,3
sw 632(r14), r10
% done intlit storeage
% begin add op 
lw r10,628(r14)
lw r9,632(r14)
add r8,r10,r9
sw 636(r14),r8
% end add op 
% begin intlit storeage
addi r12,r0,3
sw 640(r14), r12
% done intlit storeage
% begin mult op 
lw r12,636(r14)
lw r8,640(r14)
div r9,r12,r8
sw 644(r14),r9
% end mult op 
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
lw r8,644(r14)
muli r12,r10,4
mul r12,r8,r12
add r9,r9,r12
sw 648(r14),r9
% done generating indice offseting
% begin var offset calculation
lw r8,648(r14)
lw r9,616(r14)
add r9,r9,r8
sw 652(r14),r9
% end var offset calculation
%begin dot offsetting
lw r8,652(r14)
addi r8,r8,0
sw 656(r14),r8
%end dot offsetting
% begin generating indice offseting
addi r8,r0,1
addi r9,r0,0
sw 660(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r10,660(r14)
lw r9,656(r14)
add r9,r9,r10
sw 664(r14),r9
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
sw 668(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,4
lw r8,668(r14)
 add r9,r9,r8
sw 672(r14),r9
% end var offset calculation
%begin dot offsetting
lw r8,672(r14)
addi r8,r8,16
sw 676(r14),r8
%end dot offsetting
% begin generating indice offseting
addi r8,r0,1
addi r9,r0,0
sw 680(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r10,680(r14)
lw r9,676(r14)
add r9,r9,r10
sw 684(r14),r9
% end var offset calculation
% begin add op 
lw r12,664(r14)
add r12,r14,r12
lw r10,0(r12)
lw r12,684(r14)
add r12,r14,r12
lw r9,0(r12)
add r8,r10,r9
sw 688(r14),r8
% end add op 
addi r14,r14,848
jl r15, fnnuma1
subi r14,r14,848
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy10

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,848
%read direct value
add r12,r0,r14
addi r12,r12,692
%set position counter
mul r10,r0,r0
beginCopy10
%move data via register
lw r9,0(r8)
sw 0(r12),r9
%increment registers
addi r8,r8,4
addi r12,r12,4
addi r10,r10,4
%branch out if done
subi r11,r10,4
bnz r11,beginCopy10

endCopy10
% end copy 
% begin add op 
lw r10,688(r14)
lw r11,692(r14)
add r9,r10,r11
sw 696(r14),r9
% end add op 
% begin intlit storeage
addi r8,r0,35
sw 700(r14), r8
% done intlit storeage
% begin intlit storeage
addi r8,r0,2
sw 704(r14), r8
% done intlit storeage
% begin mult op 
lw r8,700(r14)
lw r9,704(r14)
mul r11,r8,r9
sw 708(r14),r11
% end mult op 
% begin intlit storeage
addi r10,r0,10
sw 712(r14), r10
% done intlit storeage
% begin mult op 
lw r10,708(r14)
lw r11,712(r14)
div r9,r10,r11
sw 716(r14),r9
% end mult op 
% begin add op 
lw r8,696(r14)
lw r9,716(r14)
add r11,r8,r9
sw 720(r14),r11
% end add op 
% begin write 
lw r10,720(r14)
%s move ptr to prevent mem corruption
addi r14,r14,928
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
addi r14,r14,-928
% end write
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
sw 724(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r9,724(r14)
 add r11,r11,r9
sw 728(r14),r11
% end var offset calculation
%begin dot offsetting
lw r9,728(r14)
addi r9,r9,0
sw 732(r14),r9
%end dot offsetting
% begin intlit storeage
addi r9,r0,3
sw 736(r14), r9
% done intlit storeage
% begin intlit storeage
addi r9,r0,2
sw 740(r14), r9
% done intlit storeage
% begin mult op 
lw r9,736(r14)
lw r11,740(r14)
mul r10,r9,r11
sw 744(r14),r10
% end mult op 
% begin intlit storeage
addi r8,r0,3
sw 748(r14), r8
% done intlit storeage
% begin add op 
lw r8,744(r14)
lw r10,748(r14)
add r11,r8,r10
sw 752(r14),r11
% end add op 
% begin intlit storeage
addi r9,r0,3
sw 756(r14), r9
% done intlit storeage
% begin mult op 
lw r9,752(r14)
lw r11,756(r14)
div r10,r9,r11
sw 760(r14),r10
% end mult op 
% begin generating indice offseting
addi r8,r0,1
addi r10,r0,0
lw r11,760(r14)
muli r9,r8,4
mul r9,r11,r9
add r10,r10,r9
sw 764(r14),r10
% done generating indice offseting
% begin var offset calculation
lw r11,764(r14)
lw r10,732(r14)
add r10,r10,r11
sw 768(r14),r10
% end var offset calculation
%begin dot offsetting
lw r11,768(r14)
addi r11,r11,0
sw 772(r14),r11
%end dot offsetting
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
sw 776(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r8,776(r14)
lw r10,772(r14)
add r10,r10,r8
sw 780(r14),r10
% end var offset calculation
% begin generating indice offseting
addi r8,r0,1
addi r10,r0,0
sw 784(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,4
lw r11,784(r14)
 add r10,r10,r11
sw 788(r14),r10
% end var offset calculation
%begin dot offsetting
lw r11,788(r14)
addi r11,r11,16
sw 792(r14),r11
%end dot offsetting
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
sw 796(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r8,796(r14)
lw r10,792(r14)
add r10,r10,r8
sw 800(r14),r10
% end var offset calculation
% begin add op 
lw r9,780(r14)
add r9,r14,r9
lw r8,0(r9)
lw r9,800(r14)
add r9,r14,r9
lw r10,0(r9)
add r11,r8,r10
sw 804(r14),r11
% end add op 
addi r14,r14,848
jl r15, fnnuma1
subi r14,r14,848
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy11

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,848
%read direct value
add r9,r0,r14
addi r9,r9,808
%set position counter
mul r8,r0,r0
beginCopy11
%move data via register
lw r10,0(r11)
sw 0(r9),r10
%increment registers
addi r11,r11,4
addi r9,r9,4
addi r8,r8,4
%branch out if done
subi r12,r8,4
bnz r12,beginCopy11

endCopy11
% end copy 
% begin add op 
lw r8,804(r14)
lw r12,808(r14)
add r10,r8,r12
sw 812(r14),r10
% end add op 
% begin intlit storeage
addi r11,r0,35
sw 816(r14), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,2
sw 820(r14), r11
% done intlit storeage
% begin mult op 
lw r11,816(r14)
lw r10,820(r14)
mul r12,r11,r10
sw 824(r14),r12
% end mult op 
% begin intlit storeage
addi r8,r0,10
sw 828(r14), r8
% done intlit storeage
% begin mult op 
lw r8,824(r14)
lw r12,828(r14)
div r10,r8,r12
sw 832(r14),r10
% end mult op 
% begin add op 
lw r11,812(r14)
lw r10,832(r14)
add r12,r11,r10
sw 836(r14),r12
% end add op 
% begin intlit storeage
addi r8,r0,0
sw 840(r14), r8
% done intlit storeage
% begin mult op 
lw r8,836(r14)
lw r12,840(r14)
bz r8,zero1
bz r12,zero1
addi r10,r0,1
j endand1
zero1		addi r10,r0,0
endand1 	sw 844(r14),r10
% end mult op 
% begin write 
lw r11,844(r14)
%s move ptr to prevent mem corruption
addi r14,r14,928
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
addi r14,r14,-928
% end write
hlt
%funcdef begin
fnnuma1
sw 4(r14),r15
% begin intlit storeage
addi r11,r0,1
sw 8(r14), r11
% done intlit storeage
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy12

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,8
%read direct value
add r11,r0,r14
addi r11,r11,0
%set position counter
mul r8,r0,r0
beginCopy12
%move data via register
lw r12,0(r10)
sw 0(r11),r12
%increment registers
addi r10,r10,4
addi r11,r11,4
addi r8,r8,4
%branch out if done
subi r9,r8,4
bnz r9,beginCopy12

endCopy12
% end copy 
lw r15,4(r14)
jr r15 
%funcdef end
