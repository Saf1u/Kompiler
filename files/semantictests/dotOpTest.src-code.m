entry
muli r0,r0,0
muli r14,r0,0
addi r14,r0,stackbase
%r14 is stack ptr, stack grows downwards or upwards
%24kb stack
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 144(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r10,144(r14)
 add r11,r11,r10
sw 148(r14),r11
% end var offset calculation
%begin dot offsetting
lw r10,148(r14)
addi r10,r10,0
sw 152(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,2
sw 156(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
lw r12,156(r14)
muli r9,r10,28
mul r9,r12,r9
add r11,r11,r9
sw 160(r14),r11
% done generating indice offseting
% begin var offset calculation
lw r12,160(r14)
lw r11,152(r14)
add r11,r11,r12
sw 164(r14),r11
% end var offset calculation
%begin dot offsetting
lw r12,164(r14)
addi r12,r12,0
sw 168(r14),r12
%end dot offsetting
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 172(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r10,172(r14)
lw r11,168(r14)
add r11,r11,r10
sw 176(r14),r11
% end var offset calculation
%begin dot offsetting
lw r10,176(r14)
addi r10,r10,8
sw 180(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,0
sw 184(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
lw r12,184(r14)
muli r9,r10,4
mul r9,r12,r9
add r11,r11,r9
sw 188(r14),r11
% done generating indice offseting
% begin var offset calculation
lw r12,188(r14)
lw r11,180(r14)
add r11,r11,r12
sw 192(r14),r11
% end var offset calculation
% begin intlit storeage
addi r12,r0,4
sw 196(r14), r12
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy1

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,196
lw r12,192(r14)
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
sw 200(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,4
lw r10,200(r14)
 add r8,r8,r10
sw 204(r14),r8
% end var offset calculation
%begin dot offsetting
lw r10,204(r14)
addi r10,r10,0
sw 208(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,2
sw 212(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r8,r0,0
lw r9,212(r14)
muli r11,r10,28
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
%begin dot offsetting
lw r9,220(r14)
addi r9,r9,0
sw 224(r14),r9
%end dot offsetting
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
sw 228(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r10,228(r14)
lw r8,224(r14)
add r8,r8,r10
sw 232(r14),r8
% end var offset calculation
%begin dot offsetting
lw r10,232(r14)
addi r10,r10,8
sw 236(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,1
sw 240(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r8,r0,0
lw r9,240(r14)
muli r11,r10,4
mul r11,r9,r11
add r8,r8,r11
sw 244(r14),r8
% done generating indice offseting
% begin var offset calculation
lw r9,244(r14)
lw r8,236(r14)
add r8,r8,r9
sw 248(r14),r8
% end var offset calculation
% begin intlit storeage
addi r9,r0,6
sw 252(r14), r9
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy2

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,252
lw r9,248(r14)
add r9,r14,r9
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
% end assignment 
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 256(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r10,256(r14)
 add r12,r12,r10
sw 260(r14),r12
% end var offset calculation
%begin dot offsetting
lw r10,260(r14)
addi r10,r10,0
sw 264(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,2
sw 268(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
lw r11,268(r14)
muli r8,r10,28
mul r8,r11,r8
add r12,r12,r8
sw 272(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r11,272(r14)
lw r12,264(r14)
add r12,r12,r11
sw 276(r14),r12
% end var offset calculation
%begin dot offsetting
lw r11,276(r14)
addi r11,r11,0
sw 280(r14),r11
%end dot offsetting
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 284(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r10,284(r14)
lw r12,280(r14)
add r12,r12,r10
sw 288(r14),r12
% end var offset calculation
%begin dot offsetting
lw r10,288(r14)
addi r10,r10,8
sw 292(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,2
sw 296(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
lw r11,296(r14)
muli r8,r10,4
mul r8,r11,r8
add r12,r12,r8
sw 300(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r11,300(r14)
lw r12,292(r14)
add r12,r12,r11
sw 304(r14),r12
% end var offset calculation
% begin intlit storeage
addi r11,r0,7
sw 308(r14), r11
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy3

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,308
lw r11,304(r14)
add r11,r14,r11
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
% end assignment 
% begin generating indice offseting
addi r8,r0,1
addi r9,r0,0
sw 312(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,4
lw r10,312(r14)
 add r9,r9,r10
sw 316(r14),r9
% end var offset calculation
%begin dot offsetting
lw r10,316(r14)
addi r10,r10,0
sw 320(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,2
sw 324(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
lw r8,324(r14)
muli r12,r10,28
mul r12,r8,r12
add r9,r9,r12
sw 328(r14),r9
% done generating indice offseting
% begin var offset calculation
lw r8,328(r14)
lw r9,320(r14)
add r9,r9,r8
sw 332(r14),r9
% end var offset calculation
%begin dot offsetting
lw r8,332(r14)
addi r8,r8,0
sw 336(r14),r8
%end dot offsetting
% begin generating indice offseting
addi r8,r0,1
addi r9,r0,0
sw 340(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r10,340(r14)
lw r9,336(r14)
add r9,r9,r10
sw 344(r14),r9
% end var offset calculation
%begin dot offsetting
lw r10,344(r14)
addi r10,r10,8
sw 348(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,3
sw 352(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
lw r8,352(r14)
muli r12,r10,4
mul r12,r8,r12
add r9,r9,r12
sw 356(r14),r9
% done generating indice offseting
% begin var offset calculation
lw r8,356(r14)
lw r9,348(r14)
add r9,r9,r8
sw 360(r14),r9
% end var offset calculation
% begin intlit storeage
addi r8,r0,8
sw 364(r14), r8
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy4

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,364
lw r8,360(r14)
add r8,r14,r8
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
% end assignment 
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 368(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r10,368(r14)
 add r11,r11,r10
sw 372(r14),r11
% end var offset calculation
%begin dot offsetting
lw r10,372(r14)
addi r10,r10,0
sw 376(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,2
sw 380(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
lw r12,380(r14)
muli r9,r10,28
mul r9,r12,r9
add r11,r11,r9
sw 384(r14),r11
% done generating indice offseting
% begin var offset calculation
lw r12,384(r14)
lw r11,376(r14)
add r11,r11,r12
sw 388(r14),r11
% end var offset calculation
%begin dot offsetting
lw r12,388(r14)
addi r12,r12,0
sw 392(r14),r12
%end dot offsetting
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 396(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r10,396(r14)
lw r11,392(r14)
add r11,r11,r10
sw 400(r14),r11
% end var offset calculation
%begin dot offsetting
lw r10,400(r14)
addi r10,r10,8
sw 404(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,4
sw 408(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
lw r12,408(r14)
muli r9,r10,4
mul r9,r12,r9
add r11,r11,r9
sw 412(r14),r11
% done generating indice offseting
% begin var offset calculation
lw r12,412(r14)
lw r11,404(r14)
add r11,r11,r12
sw 416(r14),r11
% end var offset calculation
% begin intlit storeage
addi r12,r0,9
sw 420(r14), r12
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy5

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,420
lw r12,416(r14)
add r12,r14,r12
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
% end assignment 
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
sw 424(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,4
lw r10,424(r14)
 add r8,r8,r10
sw 428(r14),r8
% end var offset calculation
%begin dot offsetting
lw r10,428(r14)
addi r10,r10,0
sw 432(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,2
sw 436(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r8,r0,0
lw r9,436(r14)
muli r11,r10,28
mul r11,r9,r11
add r8,r8,r11
sw 440(r14),r8
% done generating indice offseting
% begin var offset calculation
lw r9,440(r14)
lw r8,432(r14)
add r8,r8,r9
sw 444(r14),r8
% end var offset calculation
%begin dot offsetting
lw r9,444(r14)
addi r9,r9,0
sw 448(r14),r9
%end dot offsetting
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
sw 452(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r10,452(r14)
lw r8,448(r14)
add r8,r8,r10
sw 456(r14),r8
% end var offset calculation
%begin dot offsetting
lw r10,456(r14)
addi r10,r10,4
sw 460(r14),r10
%end dot offsetting
% begin generating indice offseting
addi r10,r0,1
addi r8,r0,0
sw 464(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r9,464(r14)
lw r8,460(r14)
add r8,r8,r9
sw 468(r14),r8
% end var offset calculation
% begin write 
lw r9,468(r14)
add r9,r14,r9
lw r9,0(r9)
%s move ptr to prevent mem corruption
addi r14,r14,1108
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
addi r14,r14,-1108
% end write
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
sw 472(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,4
lw r10,472(r14)
 add r8,r8,r10
sw 476(r14),r8
% end var offset calculation
%begin dot offsetting
lw r10,476(r14)
addi r10,r10,0
sw 480(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,1
sw 484(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r8,r0,0
lw r9,484(r14)
muli r11,r10,28
mul r11,r9,r11
add r8,r8,r11
sw 488(r14),r8
% done generating indice offseting
% begin var offset calculation
lw r9,488(r14)
lw r8,480(r14)
add r8,r8,r9
sw 492(r14),r8
% end var offset calculation
%begin dot offsetting
lw r9,492(r14)
addi r9,r9,0
sw 496(r14),r9
%end dot offsetting
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
sw 500(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r10,500(r14)
lw r8,496(r14)
add r8,r8,r10
sw 504(r14),r8
% end var offset calculation
%begin dot offsetting
lw r10,504(r14)
addi r10,r10,4
sw 508(r14),r10
%end dot offsetting
% begin generating indice offseting
addi r10,r0,1
addi r8,r0,0
sw 512(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r9,512(r14)
lw r8,508(r14)
add r8,r8,r9
sw 516(r14),r8
% end var offset calculation
% begin write 
lw r9,516(r14)
add r9,r14,r9
lw r9,0(r9)
%s move ptr to prevent mem corruption
addi r14,r14,1108
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
addi r14,r14,-1108
% end write
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
sw 520(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,4
lw r10,520(r14)
 add r8,r8,r10
sw 524(r14),r8
% end var offset calculation
%begin dot offsetting
lw r10,524(r14)
addi r10,r10,0
sw 528(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,0
sw 532(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r8,r0,0
lw r9,532(r14)
muli r11,r10,28
mul r11,r9,r11
add r8,r8,r11
sw 536(r14),r8
% done generating indice offseting
% begin var offset calculation
lw r9,536(r14)
lw r8,528(r14)
add r8,r8,r9
sw 540(r14),r8
% end var offset calculation
%begin dot offsetting
lw r9,540(r14)
addi r9,r9,0
sw 544(r14),r9
%end dot offsetting
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
sw 548(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r10,548(r14)
lw r8,544(r14)
add r8,r8,r10
sw 552(r14),r8
% end var offset calculation
%begin dot offsetting
lw r10,552(r14)
addi r10,r10,4
sw 556(r14),r10
%end dot offsetting
% begin generating indice offseting
addi r10,r0,1
addi r8,r0,0
sw 560(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r9,560(r14)
lw r8,556(r14)
add r8,r8,r9
sw 564(r14),r8
% end var offset calculation
% begin write 
lw r9,564(r14)
add r9,r14,r9
lw r9,0(r9)
%s move ptr to prevent mem corruption
addi r14,r14,1108
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
addi r14,r14,-1108
% end write
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
sw 568(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,4
lw r10,568(r14)
 add r8,r8,r10
sw 572(r14),r8
% end var offset calculation
%begin dot offsetting
lw r10,572(r14)
addi r10,r10,0
sw 576(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,3
sw 580(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r8,r0,0
lw r9,580(r14)
muli r11,r10,28
mul r11,r9,r11
add r8,r8,r11
sw 584(r14),r8
% done generating indice offseting
% begin var offset calculation
lw r9,584(r14)
lw r8,576(r14)
add r8,r8,r9
sw 588(r14),r8
% end var offset calculation
%begin dot offsetting
lw r9,588(r14)
addi r9,r9,0
sw 592(r14),r9
%end dot offsetting
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
sw 596(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r10,596(r14)
lw r8,592(r14)
add r8,r8,r10
sw 600(r14),r8
% end var offset calculation
%begin dot offsetting
lw r10,600(r14)
addi r10,r10,4
sw 604(r14),r10
%end dot offsetting
% begin generating indice offseting
addi r10,r0,1
addi r8,r0,0
sw 608(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r9,608(r14)
lw r8,604(r14)
add r8,r8,r9
sw 612(r14),r8
% end var offset calculation
% begin write 
lw r9,612(r14)
add r9,r14,r9
lw r9,0(r9)
%s move ptr to prevent mem corruption
addi r14,r14,1108
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
addi r14,r14,-1108
% end write
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
sw 616(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,4
lw r10,616(r14)
 add r8,r8,r10
sw 620(r14),r8
% end var offset calculation
%begin dot offsetting
lw r10,620(r14)
addi r10,r10,0
sw 624(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,4
sw 628(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r8,r0,0
lw r9,628(r14)
muli r11,r10,28
mul r11,r9,r11
add r8,r8,r11
sw 632(r14),r8
% done generating indice offseting
% begin var offset calculation
lw r9,632(r14)
lw r8,624(r14)
add r8,r8,r9
sw 636(r14),r8
% end var offset calculation
%begin dot offsetting
lw r9,636(r14)
addi r9,r9,0
sw 640(r14),r9
%end dot offsetting
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
sw 644(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r10,644(r14)
lw r8,640(r14)
add r8,r8,r10
sw 648(r14),r8
% end var offset calculation
%begin dot offsetting
lw r10,648(r14)
addi r10,r10,4
sw 652(r14),r10
%end dot offsetting
% begin generating indice offseting
addi r10,r0,1
addi r8,r0,0
sw 656(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r9,656(r14)
lw r8,652(r14)
add r8,r8,r9
sw 660(r14),r8
% end var offset calculation
% begin write 
lw r9,660(r14)
add r9,r14,r9
lw r9,0(r9)
%s move ptr to prevent mem corruption
addi r14,r14,1108
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
addi r14,r14,-1108
% end write
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
sw 664(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,4
lw r10,664(r14)
 add r8,r8,r10
sw 668(r14),r8
% end var offset calculation
%begin dot offsetting
lw r10,668(r14)
addi r10,r10,0
sw 672(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,2
sw 676(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r8,r0,0
lw r9,676(r14)
muli r11,r10,28
mul r11,r9,r11
add r8,r8,r11
sw 680(r14),r8
% done generating indice offseting
% begin var offset calculation
lw r9,680(r14)
lw r8,672(r14)
add r8,r8,r9
sw 684(r14),r8
% end var offset calculation
%begin dot offsetting
lw r9,684(r14)
addi r9,r9,0
sw 688(r14),r9
%end dot offsetting
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
sw 692(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r10,692(r14)
lw r8,688(r14)
add r8,r8,r10
sw 696(r14),r8
% end var offset calculation
%begin dot offsetting
lw r10,696(r14)
addi r10,r10,8
sw 700(r14),r10
%end dot offsetting
% begin generating indice offseting
addi r10,r0,1
addi r8,r0,0
sw 704(r14),r8
% done generating indice offseting
% begin var offset calculation
lw r9,704(r14)
lw r8,700(r14)
add r8,r8,r9
sw 708(r14),r8
% end var offset calculation
%check if size is zero if yes, leave
addi r12,r0,20
bz r12,endCopy6

%set left and right ptrs
%set ptr
lw r8,708(r14)
add r8,r14,r8
addi r8,r8,0
%read direct value
add r9,r0,r14
addi r9,r9,1036
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
subi r12,r11,20
bnz r12,beginCopy6

endCopy6
% end copy 
addi r14,r14,1028
jl r15, fnwriter1
subi r14,r14,1028
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy7

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,1028
%read direct value
add r11,r0,r14
addi r11,r11,712
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
% begin generating indice offseting
addi r8,r0,1
addi r9,r0,0
sw 716(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,4
lw r10,716(r14)
 add r9,r9,r10
sw 720(r14),r9
% end var offset calculation
%begin dot offsetting
lw r10,720(r14)
addi r10,r10,0
sw 724(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,2
sw 728(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
lw r8,728(r14)
muli r12,r10,28
mul r12,r8,r12
add r9,r9,r12
sw 732(r14),r9
% done generating indice offseting
% begin var offset calculation
lw r8,732(r14)
lw r9,724(r14)
add r9,r9,r8
sw 736(r14),r9
% end var offset calculation
%begin dot offsetting
lw r8,736(r14)
addi r8,r8,0
sw 740(r14),r8
%end dot offsetting
% begin generating indice offseting
addi r8,r0,1
addi r9,r0,0
sw 744(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r10,744(r14)
lw r9,740(r14)
add r9,r9,r10
sw 748(r14),r9
% end var offset calculation
%begin dot offsetting
lw r10,748(r14)
addi r10,r10,8
sw 752(r14),r10
%end dot offsetting
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
sw 756(r14),r9
% done generating indice offseting
% begin var offset calculation
lw r8,756(r14)
lw r9,752(r14)
add r9,r9,r8
sw 760(r14),r9
% end var offset calculation
%check if size is zero if yes, leave
addi r11,r0,20
bz r11,endCopy8

%set left and right ptrs
%set ptr
lw r9,760(r14)
add r9,r14,r9
addi r9,r9,0
%read direct value
add r8,r0,r14
addi r8,r8,1036
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
subi r11,r12,20
bnz r11,beginCopy8

endCopy8
% end copy 
addi r14,r14,1028
jl r15, fnwriter1
subi r14,r14,1028
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy9

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,1028
%read direct value
add r12,r0,r14
addi r12,r12,764
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
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
sw 768(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,4
lw r10,768(r14)
 add r8,r8,r10
sw 772(r14),r8
% end var offset calculation
%begin dot offsetting
lw r10,772(r14)
addi r10,r10,0
sw 776(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,1
sw 780(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r8,r0,0
lw r9,780(r14)
muli r11,r10,28
mul r11,r9,r11
add r8,r8,r11
sw 784(r14),r8
% done generating indice offseting
% begin var offset calculation
lw r9,784(r14)
lw r8,776(r14)
add r8,r8,r9
sw 788(r14),r8
% end var offset calculation
%begin dot offsetting
lw r9,788(r14)
addi r9,r9,0
sw 792(r14),r9
%end dot offsetting
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
sw 796(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r10,796(r14)
lw r8,792(r14)
add r8,r8,r10
sw 800(r14),r8
% end var offset calculation
%begin dot offsetting
lw r10,800(r14)
addi r10,r10,8
sw 804(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,0
sw 808(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r8,r0,0
lw r9,808(r14)
muli r11,r10,4
mul r11,r9,r11
add r8,r8,r11
sw 812(r14),r8
% done generating indice offseting
% begin var offset calculation
lw r9,812(r14)
lw r8,804(r14)
add r8,r8,r9
sw 816(r14),r8
% end var offset calculation
% begin write 
lw r9,816(r14)
add r9,r14,r9
lw r9,0(r9)
%s move ptr to prevent mem corruption
addi r14,r14,1108
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
addi r14,r14,-1108
% end write
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
sw 820(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,4
lw r10,820(r14)
 add r8,r8,r10
sw 824(r14),r8
% end var offset calculation
%begin dot offsetting
lw r10,824(r14)
addi r10,r10,0
sw 828(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,1
sw 832(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r8,r0,0
lw r9,832(r14)
muli r11,r10,28
mul r11,r9,r11
add r8,r8,r11
sw 836(r14),r8
% done generating indice offseting
% begin var offset calculation
lw r9,836(r14)
lw r8,828(r14)
add r8,r8,r9
sw 840(r14),r8
% end var offset calculation
%begin dot offsetting
lw r9,840(r14)
addi r9,r9,0
sw 844(r14),r9
%end dot offsetting
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
sw 848(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r10,848(r14)
lw r8,844(r14)
add r8,r8,r10
sw 852(r14),r8
% end var offset calculation
%begin dot offsetting
lw r10,852(r14)
addi r10,r10,8
sw 856(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,1
sw 860(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r8,r0,0
lw r9,860(r14)
muli r11,r10,4
mul r11,r9,r11
add r8,r8,r11
sw 864(r14),r8
% done generating indice offseting
% begin var offset calculation
lw r9,864(r14)
lw r8,856(r14)
add r8,r8,r9
sw 868(r14),r8
% end var offset calculation
% begin write 
lw r9,868(r14)
add r9,r14,r9
lw r9,0(r9)
%s move ptr to prevent mem corruption
addi r14,r14,1108
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
addi r14,r14,-1108
% end write
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
sw 872(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,4
lw r10,872(r14)
 add r8,r8,r10
sw 876(r14),r8
% end var offset calculation
%begin dot offsetting
lw r10,876(r14)
addi r10,r10,0
sw 880(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,1
sw 884(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r8,r0,0
lw r9,884(r14)
muli r11,r10,28
mul r11,r9,r11
add r8,r8,r11
sw 888(r14),r8
% done generating indice offseting
% begin var offset calculation
lw r9,888(r14)
lw r8,880(r14)
add r8,r8,r9
sw 892(r14),r8
% end var offset calculation
%begin dot offsetting
lw r9,892(r14)
addi r9,r9,0
sw 896(r14),r9
%end dot offsetting
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
sw 900(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r10,900(r14)
lw r8,896(r14)
add r8,r8,r10
sw 904(r14),r8
% end var offset calculation
%begin dot offsetting
lw r10,904(r14)
addi r10,r10,8
sw 908(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,2
sw 912(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r8,r0,0
lw r9,912(r14)
muli r11,r10,4
mul r11,r9,r11
add r8,r8,r11
sw 916(r14),r8
% done generating indice offseting
% begin var offset calculation
lw r9,916(r14)
lw r8,908(r14)
add r8,r8,r9
sw 920(r14),r8
% end var offset calculation
% begin write 
lw r9,920(r14)
add r9,r14,r9
lw r9,0(r9)
%s move ptr to prevent mem corruption
addi r14,r14,1108
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
addi r14,r14,-1108
% end write
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
sw 924(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,4
lw r10,924(r14)
 add r8,r8,r10
sw 928(r14),r8
% end var offset calculation
%begin dot offsetting
lw r10,928(r14)
addi r10,r10,0
sw 932(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,1
sw 936(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r8,r0,0
lw r9,936(r14)
muli r11,r10,28
mul r11,r9,r11
add r8,r8,r11
sw 940(r14),r8
% done generating indice offseting
% begin var offset calculation
lw r9,940(r14)
lw r8,932(r14)
add r8,r8,r9
sw 944(r14),r8
% end var offset calculation
%begin dot offsetting
lw r9,944(r14)
addi r9,r9,0
sw 948(r14),r9
%end dot offsetting
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
sw 952(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r10,952(r14)
lw r8,948(r14)
add r8,r8,r10
sw 956(r14),r8
% end var offset calculation
%begin dot offsetting
lw r10,956(r14)
addi r10,r10,8
sw 960(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,3
sw 964(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r8,r0,0
lw r9,964(r14)
muli r11,r10,4
mul r11,r9,r11
add r8,r8,r11
sw 968(r14),r8
% done generating indice offseting
% begin var offset calculation
lw r9,968(r14)
lw r8,960(r14)
add r8,r8,r9
sw 972(r14),r8
% end var offset calculation
% begin write 
lw r9,972(r14)
add r9,r14,r9
lw r9,0(r9)
%s move ptr to prevent mem corruption
addi r14,r14,1108
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
addi r14,r14,-1108
% end write
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
sw 976(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,4
lw r10,976(r14)
 add r8,r8,r10
sw 980(r14),r8
% end var offset calculation
%begin dot offsetting
lw r10,980(r14)
addi r10,r10,0
sw 984(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,1
sw 988(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r8,r0,0
lw r9,988(r14)
muli r11,r10,28
mul r11,r9,r11
add r8,r8,r11
sw 992(r14),r8
% done generating indice offseting
% begin var offset calculation
lw r9,992(r14)
lw r8,984(r14)
add r8,r8,r9
sw 996(r14),r8
% end var offset calculation
%begin dot offsetting
lw r9,996(r14)
addi r9,r9,0
sw 1000(r14),r9
%end dot offsetting
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
sw 1004(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r10,1004(r14)
lw r8,1000(r14)
add r8,r8,r10
sw 1008(r14),r8
% end var offset calculation
%begin dot offsetting
lw r10,1008(r14)
addi r10,r10,8
sw 1012(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,4
sw 1016(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r8,r0,0
lw r9,1016(r14)
muli r11,r10,4
mul r11,r9,r11
add r8,r8,r11
sw 1020(r14),r8
% done generating indice offseting
% begin var offset calculation
lw r9,1020(r14)
lw r8,1012(r14)
add r8,r8,r9
sw 1024(r14),r8
% end var offset calculation
% begin write 
lw r9,1024(r14)
add r9,r14,r9
lw r9,0(r9)
%s move ptr to prevent mem corruption
addi r14,r14,1108
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
addi r14,r14,-1108
% end write
hlt
%funcdef begin
fnwriter1
sw 4(r14),r15
% begin intlit storeage
addi r9,r0,0
sw 28(r14), r9
% done intlit storeage
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
lw r10,28(r14)
muli r11,r9,4
mul r11,r10,r11
add r8,r8,r11
sw 32(r14),r8
% done generating indice offseting
% begin var offset calculation
addi r8,r0,8
lw r10,32(r14)
 add r8,r8,r10
sw 36(r14),r8
% end var offset calculation
% begin intlit storeage
addi r10,r0,0
sw 40(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r8,r0,0
lw r9,40(r14)
muli r11,r10,4
mul r11,r9,r11
add r8,r8,r11
sw 44(r14),r8
% done generating indice offseting
% begin var offset calculation
addi r8,r0,8
lw r9,44(r14)
 add r8,r8,r9
sw 48(r14),r8
% end var offset calculation
% begin intlit storeage
addi r9,r0,1
sw 52(r14), r9
% done intlit storeage
% begin add op 
lw r11,48(r14)
add r11,r14,r11
lw r9,0(r11)
lw r8,52(r14)
add r10,r9,r8
sw 56(r14),r10
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy10

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,56
lw r11,36(r14)
add r11,r14,r11
%set position counter
mul r9,r0,r0
beginCopy10
%move data via register
lw r8,0(r10)
sw 0(r11),r8
%increment registers
addi r10,r10,4
addi r11,r11,4
addi r9,r9,4
%branch out if done
subi r12,r9,4
bnz r12,beginCopy10

endCopy10
% end assignment 
% begin intlit storeage
addi r9,r0,1
sw 60(r14), r9
% done intlit storeage
% begin generating indice offseting
addi r9,r0,1
addi r12,r0,0
lw r8,60(r14)
muli r10,r9,4
mul r10,r8,r10
add r12,r12,r10
sw 64(r14),r12
% done generating indice offseting
% begin var offset calculation
addi r12,r0,8
lw r8,64(r14)
 add r12,r12,r8
sw 68(r14),r12
% end var offset calculation
% begin intlit storeage
addi r8,r0,1
sw 72(r14), r8
% done intlit storeage
% begin generating indice offseting
addi r8,r0,1
addi r12,r0,0
lw r9,72(r14)
muli r10,r8,4
mul r10,r9,r10
add r12,r12,r10
sw 76(r14),r12
% done generating indice offseting
% begin var offset calculation
addi r12,r0,8
lw r9,76(r14)
 add r12,r12,r9
sw 80(r14),r12
% end var offset calculation
% begin intlit storeage
addi r9,r0,1
sw 84(r14), r9
% done intlit storeage
% begin add op 
lw r10,80(r14)
add r10,r14,r10
lw r9,0(r10)
lw r12,84(r14)
add r8,r9,r12
sw 88(r14),r8
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy11

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,88
lw r10,68(r14)
add r10,r14,r10
%set position counter
mul r9,r0,r0
beginCopy11
%move data via register
lw r12,0(r8)
sw 0(r10),r12
%increment registers
addi r8,r8,4
addi r10,r10,4
addi r9,r9,4
%branch out if done
subi r11,r9,4
bnz r11,beginCopy11

endCopy11
% end assignment 
% begin intlit storeage
addi r9,r0,2
sw 92(r14), r9
% done intlit storeage
% begin generating indice offseting
addi r9,r0,1
addi r11,r0,0
lw r12,92(r14)
muli r8,r9,4
mul r8,r12,r8
add r11,r11,r8
sw 96(r14),r11
% done generating indice offseting
% begin var offset calculation
addi r11,r0,8
lw r12,96(r14)
 add r11,r11,r12
sw 100(r14),r11
% end var offset calculation
% begin intlit storeage
addi r12,r0,2
sw 104(r14), r12
% done intlit storeage
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
lw r9,104(r14)
muli r8,r12,4
mul r8,r9,r8
add r11,r11,r8
sw 108(r14),r11
% done generating indice offseting
% begin var offset calculation
addi r11,r0,8
lw r9,108(r14)
 add r11,r11,r9
sw 112(r14),r11
% end var offset calculation
% begin intlit storeage
addi r9,r0,1
sw 116(r14), r9
% done intlit storeage
% begin add op 
lw r8,112(r14)
add r8,r14,r8
lw r9,0(r8)
lw r11,116(r14)
add r12,r9,r11
sw 120(r14),r12
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy12

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,120
lw r8,100(r14)
add r8,r14,r8
%set position counter
mul r9,r0,r0
beginCopy12
%move data via register
lw r11,0(r12)
sw 0(r8),r11
%increment registers
addi r12,r12,4
addi r8,r8,4
addi r9,r9,4
%branch out if done
subi r10,r9,4
bnz r10,beginCopy12

endCopy12
% end assignment 
% begin intlit storeage
addi r9,r0,3
sw 124(r14), r9
% done intlit storeage
% begin generating indice offseting
addi r9,r0,1
addi r10,r0,0
lw r11,124(r14)
muli r12,r9,4
mul r12,r11,r12
add r10,r10,r12
sw 128(r14),r10
% done generating indice offseting
% begin var offset calculation
addi r10,r0,8
lw r11,128(r14)
 add r10,r10,r11
sw 132(r14),r10
% end var offset calculation
% begin intlit storeage
addi r11,r0,3
sw 136(r14), r11
% done intlit storeage
% begin generating indice offseting
addi r11,r0,1
addi r10,r0,0
lw r9,136(r14)
muli r12,r11,4
mul r12,r9,r12
add r10,r10,r12
sw 140(r14),r10
% done generating indice offseting
% begin var offset calculation
addi r10,r0,8
lw r9,140(r14)
 add r10,r10,r9
sw 144(r14),r10
% end var offset calculation
% begin intlit storeage
addi r9,r0,1
sw 148(r14), r9
% done intlit storeage
% begin add op 
lw r12,144(r14)
add r12,r14,r12
lw r9,0(r12)
lw r10,148(r14)
add r11,r9,r10
sw 152(r14),r11
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy13

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,152
lw r12,132(r14)
add r12,r14,r12
%set position counter
mul r9,r0,r0
beginCopy13
%move data via register
lw r10,0(r11)
sw 0(r12),r10
%increment registers
addi r11,r11,4
addi r12,r12,4
addi r9,r9,4
%branch out if done
subi r8,r9,4
bnz r8,beginCopy13

endCopy13
% end assignment 
% begin intlit storeage
addi r9,r0,4
sw 156(r14), r9
% done intlit storeage
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
lw r10,156(r14)
muli r11,r9,4
mul r11,r10,r11
add r8,r8,r11
sw 160(r14),r8
% done generating indice offseting
% begin var offset calculation
addi r8,r0,8
lw r10,160(r14)
 add r8,r8,r10
sw 164(r14),r8
% end var offset calculation
% begin intlit storeage
addi r10,r0,4
sw 168(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r8,r0,0
lw r9,168(r14)
muli r11,r10,4
mul r11,r9,r11
add r8,r8,r11
sw 172(r14),r8
% done generating indice offseting
% begin var offset calculation
addi r8,r0,8
lw r9,172(r14)
 add r8,r8,r9
sw 176(r14),r8
% end var offset calculation
% begin intlit storeage
addi r9,r0,1
sw 180(r14), r9
% done intlit storeage
% begin add op 
lw r11,176(r14)
add r11,r14,r11
lw r9,0(r11)
lw r8,180(r14)
add r10,r9,r8
sw 184(r14),r10
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy14

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,184
lw r11,164(r14)
add r11,r14,r11
%set position counter
mul r9,r0,r0
beginCopy14
%move data via register
lw r8,0(r10)
sw 0(r11),r8
%increment registers
addi r10,r10,4
addi r11,r11,4
addi r9,r9,4
%branch out if done
subi r12,r9,4
bnz r12,beginCopy14

endCopy14
% end assignment 
% begin intlit storeage
addi r9,r0,0
sw 188(r14), r9
% done intlit storeage
% begin generating indice offseting
addi r9,r0,1
addi r12,r0,0
lw r8,188(r14)
muli r10,r9,4
mul r10,r8,r10
add r12,r12,r10
sw 192(r14),r12
% done generating indice offseting
% begin var offset calculation
addi r12,r0,8
lw r8,192(r14)
 add r12,r12,r8
sw 196(r14),r12
% end var offset calculation
% begin write 
lw r8,196(r14)
add r8,r14,r8
lw r8,0(r8)
%s move ptr to prevent mem corruption
addi r14,r14,328
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
addi r14,r14,-328
% end write
% begin intlit storeage
addi r8,r0,1
sw 200(r14), r8
% done intlit storeage
% begin generating indice offseting
addi r8,r0,1
addi r12,r0,0
lw r9,200(r14)
muli r10,r8,4
mul r10,r9,r10
add r12,r12,r10
sw 204(r14),r12
% done generating indice offseting
% begin var offset calculation
addi r12,r0,8
lw r9,204(r14)
 add r12,r12,r9
sw 208(r14),r12
% end var offset calculation
% begin write 
lw r9,208(r14)
add r9,r14,r9
lw r9,0(r9)
%s move ptr to prevent mem corruption
addi r14,r14,328
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
addi r14,r14,-328
% end write
% begin intlit storeage
addi r9,r0,2
sw 212(r14), r9
% done intlit storeage
% begin generating indice offseting
addi r9,r0,1
addi r12,r0,0
lw r8,212(r14)
muli r10,r9,4
mul r10,r8,r10
add r12,r12,r10
sw 216(r14),r12
% done generating indice offseting
% begin var offset calculation
addi r12,r0,8
lw r8,216(r14)
 add r12,r12,r8
sw 220(r14),r12
% end var offset calculation
% begin write 
lw r8,220(r14)
add r8,r14,r8
lw r8,0(r8)
%s move ptr to prevent mem corruption
addi r14,r14,328
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
addi r14,r14,-328
% end write
% begin intlit storeage
addi r8,r0,3
sw 224(r14), r8
% done intlit storeage
% begin generating indice offseting
addi r8,r0,1
addi r12,r0,0
lw r9,224(r14)
muli r10,r8,4
mul r10,r9,r10
add r12,r12,r10
sw 228(r14),r12
% done generating indice offseting
% begin var offset calculation
addi r12,r0,8
lw r9,228(r14)
 add r12,r12,r9
sw 232(r14),r12
% end var offset calculation
% begin write 
lw r9,232(r14)
add r9,r14,r9
lw r9,0(r9)
%s move ptr to prevent mem corruption
addi r14,r14,328
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
addi r14,r14,-328
% end write
% begin intlit storeage
addi r9,r0,4
sw 236(r14), r9
% done intlit storeage
% begin generating indice offseting
addi r9,r0,1
addi r12,r0,0
lw r8,236(r14)
muli r10,r9,4
mul r10,r8,r10
add r12,r12,r10
sw 240(r14),r12
% done generating indice offseting
% begin var offset calculation
addi r12,r0,8
lw r8,240(r14)
 add r12,r12,r8
sw 244(r14),r12
% end var offset calculation
% begin write 
lw r8,244(r14)
add r8,r14,r8
lw r8,0(r8)
%s move ptr to prevent mem corruption
addi r14,r14,328
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
addi r14,r14,-328
% end write
lw r15,4(r14)
jr r15 
%funcdef end
