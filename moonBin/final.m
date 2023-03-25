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
addi r11,r12,348
sw 352(r14),r11
% end var offset calculation
% begin intlit storeage
addi r11,r0,1
sw 356(r14), r11
% done intlit storeage
% begin assignment 
lw r11,356(r14)
lw r12,352(r14) 
sw 0(r12),r11
% end assignment 
% begin generating indice offseting
addi r10,r0,0
% done generating indice offseting
% begin var offset calculation
addi r12,r10,348
sw 360(r14),r12
% end var offset calculation
% begin write 
lw r12,360(r14)
lw r12,0(r12)
sw -8(r14),r12
addi r12,r0,buffer
sw -12(r14),r12
jl r15,intstr
sw -8(r14),r13
jl r15,putstr
addi r12,r0,newline
sw -8(r14),r12
jl r15,putstr
% end write
% begin generating indice offseting
addi r12,r0,0
% done generating indice offseting
% begin var offset calculation
addi r10,r12,348
sw 364(r14),r10
% end var offset calculation
% begin intlit storeage
addi r10,r0,1
sw 368(r14), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,93
sw 372(r14), r10
% done intlit storeage
% begin add op 
lw r10,368(r14)
lw r12,372(r14)
add r11,r10,r12
sw 376(r14),r11
% end add op 
% begin intlit storeage
addi r9,r0,1
sw 380(r14), r9
% done intlit storeage
% begin add op 
lw r9,376(r14)
lw r11,380(r14)
add r12,r9,r11
sw 384(r14),r12
% end add op 
% begin intlit storeage
addi r10,r0,10
sw 388(r14), r10
% done intlit storeage
% begin add op 
lw r10,384(r14)
lw r12,388(r14)
add r11,r10,r12
sw 392(r14),r11
% end add op 
% begin intlit storeage
addi r9,r0,9
sw 396(r14), r9
% done intlit storeage
% begin add op 
lw r9,392(r14)
lw r11,396(r14)
add r12,r9,r11
sw 400(r14),r12
% end add op 
% begin intlit storeage
addi r10,r0,33
sw 404(r14), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,2
sw 408(r14), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,2
sw 412(r14), r10
% done intlit storeage
% begin mult op 
lw r10,408(r14)
lw r12,412(r14)
mul r11,r10,r12
sw 416(r14),r11
% end mult op 
% begin add op 
lw r9,404(r14)
lw r11,416(r14)
add r12,r9,r11
sw 420(r14),r12
% end add op 
% begin intlit storeage
addi r10,r0,60
sw 424(r14), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,3
sw 428(r14), r10
% done intlit storeage
% begin mult op 
lw r10,424(r14)
lw r12,428(r14)
div r11,r10,r12
sw 432(r14),r11
% end mult op 
% begin mult op 
lw r9,420(r14)
lw r11,432(r14)
mul r12,r9,r11
sw 436(r14),r12
% end mult op 
% begin add op 
lw r10,400(r14)
lw r12,436(r14)
add r11,r10,r12
sw 440(r14),r11
% end add op 
% begin intlit storeage
addi r9,r0,2
sw 444(r14), r9
% done intlit storeage
% begin mult op 
lw r9,440(r14)
lw r11,444(r14)
div r12,r9,r11
sw 448(r14),r12
% end mult op 
% begin intlit storeage
addi r10,r0,1
sw 452(r14), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,4
sw 456(r14), r10
% done intlit storeage
% begin mult op 
lw r10,452(r14)
lw r12,456(r14)
mul r11,r10,r12
sw 460(r14),r11
% end mult op 
% begin intlit storeage
addi r9,r0,2
sw 464(r14), r9
% done intlit storeage
% begin mult op 
lw r9,460(r14)
lw r11,464(r14)
div r12,r9,r11
sw 468(r14),r12
% end mult op 
% begin intlit storeage
addi r10,r0,9
sw 472(r14), r10
% done intlit storeage
% begin add op 
lw r10,468(r14)
lw r12,472(r14)
add r11,r10,r12
sw 476(r14),r11
% end add op 
% begin add op 
lw r9,448(r14)
lw r11,476(r14)
add r12,r9,r11
sw 480(r14),r12
% end add op 
% begin intlit storeage
addi r10,r0,100
sw 484(r14), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,5
sw 488(r14), r10
% done intlit storeage
% begin mult op 
lw r10,484(r14)
lw r12,488(r14)
mul r11,r10,r12
sw 492(r14),r11
% end mult op 
% begin add op 
lw r9,480(r14)
lw r11,492(r14)
add r12,r9,r11
sw 496(r14),r12
% end add op 
% begin assignment 
lw r10,496(r14)
lw r12,364(r14) 
sw 0(r12),r10
% end assignment 
% begin generating indice offseting
addi r11,r0,0
% done generating indice offseting
% begin var offset calculation
addi r12,r11,348
sw 500(r14),r12
% end var offset calculation
% begin write 
lw r12,500(r14)
lw r12,0(r12)
sw -8(r14),r12
addi r12,r0,buffer
sw -12(r14),r12
jl r15,intstr
sw -8(r14),r13
jl r15,putstr
addi r12,r0,newline
sw -8(r14),r12
jl r15,putstr
% end write
% begin intlit storeage
addi r11,r0,1
sw 504(r14), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,0
sw 508(r14), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,1
sw 512(r14), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,0
sw 516(r14), r11
% done intlit storeage
% begin generating indice offseting
mul r12,r0,r2
addi r11,r0,1
lw r10,516(r14)
muli r9,r11,4
mul r9,r10,r9
add r12,r12,r9
lw r10,512(r14)
muli r9,r11,4
mul r9,r10,r9
muli r9,r9,1
add r12,r12,r9
lw r10,508(r14)
muli r9,r11,4
mul r9,r10,r9
muli r9,r9,1
muli r9,r9,3
add r12,r12,r9
lw r10,504(r14)
muli r9,r11,4
mul r9,r10,r9
muli r9,r9,1
muli r9,r9,3
muli r9,r9,5
add r12,r12,r9
% done generating indice offseting
% begin var offset calculation
addi r10,r12,48
sw 520(r14),r10
% end var offset calculation
% begin generating indice offseting
addi r10,r0,0
% done generating indice offseting
% begin var offset calculation
addi r12,r10,348
sw 524(r14),r12
% end var offset calculation
% begin assignment 
lw r11,524(r14)
lw r12,0(r11)
lw r10,520(r14) 
sw 0(r10),r12
% end assignment 
% begin intlit storeage
addi r10,r0,2
sw 528(r14), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,2
sw 532(r14), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,2
sw 536(r14), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,1
sw 540(r14), r10
% done intlit storeage
% begin generating indice offseting
mul r11,r0,r2
addi r10,r0,1
lw r12,540(r14)
muli r9,r10,4
mul r9,r12,r9
add r11,r11,r9
lw r12,536(r14)
muli r9,r10,4
mul r9,r12,r9
muli r9,r9,1
add r11,r11,r9
lw r12,532(r14)
muli r9,r10,4
mul r9,r12,r9
muli r9,r9,1
muli r9,r9,3
add r11,r11,r9
lw r12,528(r14)
muli r9,r10,4
mul r9,r12,r9
muli r9,r9,1
muli r9,r9,3
muli r9,r9,5
add r11,r11,r9
% done generating indice offseting
% begin var offset calculation
addi r12,r11,48
sw 544(r14),r12
% end var offset calculation
% begin generating indice offseting
addi r12,r0,0
% done generating indice offseting
% begin var offset calculation
addi r11,r12,348
sw 548(r14),r11
% end var offset calculation
% begin intlit storeage
addi r11,r0,2
sw 552(r14), r11
% done intlit storeage
% begin add op 
lw r9,548(r14)
lw r11,0(r9)
lw r12,552(r14)
add r10,r11,r12
sw 556(r14),r10
% end add op 
% begin assignment 
lw r9,556(r14)
lw r10,544(r14) 
sw 0(r10),r9
% end assignment 
% begin intlit storeage
addi r10,r0,1
sw 560(r14), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,0
sw 564(r14), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,1
sw 568(r14), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,0
sw 572(r14), r10
% done intlit storeage
% begin generating indice offseting
mul r12,r0,r2
addi r10,r0,1
lw r9,572(r14)
muli r11,r10,4
mul r11,r9,r11
add r12,r12,r11
lw r9,568(r14)
muli r11,r10,4
mul r11,r9,r11
muli r11,r11,1
add r12,r12,r11
lw r9,564(r14)
muli r11,r10,4
mul r11,r9,r11
muli r11,r11,1
muli r11,r11,3
add r12,r12,r11
lw r9,560(r14)
muli r11,r10,4
mul r11,r9,r11
muli r11,r11,1
muli r11,r11,3
muli r11,r11,5
add r12,r12,r11
% done generating indice offseting
% begin var offset calculation
addi r9,r12,48
sw 576(r14),r9
% end var offset calculation
% begin write 
lw r9,576(r14)
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
% begin intlit storeage
addi r9,r0,0
sw 580(r14), r9
% done intlit storeage
% begin write 
lw r9,580(r14)
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
% begin intlit storeage
addi r12,r0,2
sw 584(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,2
sw 588(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,2
sw 592(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,1
sw 596(r14), r12
% done intlit storeage
% begin generating indice offseting
mul r9,r0,r2
addi r12,r0,1
lw r10,596(r14)
muli r11,r12,4
mul r11,r10,r11
add r9,r9,r11
lw r10,592(r14)
muli r11,r12,4
mul r11,r10,r11
muli r11,r11,1
add r9,r9,r11
lw r10,588(r14)
muli r11,r12,4
mul r11,r10,r11
muli r11,r11,1
muli r11,r11,3
add r9,r9,r11
lw r10,584(r14)
muli r11,r12,4
mul r11,r10,r11
muli r11,r11,1
muli r11,r11,3
muli r11,r11,5
add r9,r9,r11
% done generating indice offseting
% begin var offset calculation
addi r10,r9,48
sw 600(r14),r10
% end var offset calculation
% begin write 
lw r10,600(r14)
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
% begin intlit storeage
addi r10,r0,0
sw 604(r14), r10
% done intlit storeage
% begin write 
lw r10,604(r14)
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
addi r9,r10,348
sw 608(r14),r9
% end var offset calculation
% begin intlit storeage
addi r9,r0,33
sw 612(r14), r9
% done intlit storeage
% begin assignment 
lw r9,612(r14)
lw r10,608(r14) 
sw 0(r10),r9
% end assignment 
% begin generating indice offseting
addi r12,r0,0
% done generating indice offseting
% begin var offset calculation
addi r10,r12,348
sw 616(r14),r10
% end var offset calculation
% begin write 
lw r10,616(r14)
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
% begin intlit storeage
addi r10,r0,0
sw 620(r14), r10
% done intlit storeage
% begin write 
lw r10,620(r14)
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
% begin intlit storeage
addi r12,r0,1
sw 624(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,0
sw 628(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,1
sw 632(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,0
sw 636(r14), r12
% done intlit storeage
% begin generating indice offseting
mul r10,r0,r2
addi r12,r0,1
lw r9,636(r14)
muli r11,r12,4
mul r11,r9,r11
add r10,r10,r11
lw r9,632(r14)
muli r11,r12,4
mul r11,r9,r11
muli r11,r11,1
add r10,r10,r11
lw r9,628(r14)
muli r11,r12,4
mul r11,r9,r11
muli r11,r11,1
muli r11,r11,3
add r10,r10,r11
lw r9,624(r14)
muli r11,r12,4
mul r11,r9,r11
muli r11,r11,1
muli r11,r11,3
muli r11,r11,5
add r10,r10,r11
% done generating indice offseting
% begin var offset calculation
addi r9,r10,48
sw 640(r14),r9
% end var offset calculation
% begin write 
lw r9,640(r14)
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
addi r10,r9,348
sw 644(r14),r10
% end var offset calculation
% begin intlit storeage
addi r10,r0,1
sw 648(r14), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,1
sw 652(r14), r10
% done intlit storeage
% begin add op 
lw r10,648(r14)
lw r9,652(r14)
bnz r10,one1
bnz r9,one1
addi r12,r0,0
j endor1
one1		addi r12,r0,1
endor1 	sw 656(r14),r12
% end add op 
% begin assignment 
lw r11,656(r14)
lw r12,644(r14) 
sw 0(r12),r11
% end assignment 
% begin generating indice offseting
addi r9,r0,0
% done generating indice offseting
% begin var offset calculation
addi r12,r9,348
sw 660(r14),r12
% end var offset calculation
% begin intlit storeage
addi r12,r0,5
sw 664(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,2
sw 668(r14), r12
% done intlit storeage
% begin RELOP op 
lw r12,664(r14)
lw r9,668(r14)
cgt r11,r12,r9
sw 672(r14),r11
% end relop op 
% begin assignment 
lw r10,672(r14)
lw r11,660(r14) 
sw 0(r11),r10
% end assignment 
% begin generating indice offseting
addi r9,r0,0
% done generating indice offseting
% begin var offset calculation
addi r11,r9,348
sw 676(r14),r11
% end var offset calculation
% begin write 
lw r11,676(r14)
lw r11,0(r11)
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
hlt
