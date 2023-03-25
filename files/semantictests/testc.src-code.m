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
sw 356(r14),r11
% end var offset calculation
% begin intlit storeage
addi r11,r0,1
sw 360(r14), r11
% done intlit storeage
% begin assignment 
lw r11,360(r14)
lw r12,356(r14) 
sw 0(r12),r11
% end assignment 
% begin generating indice offseting
addi r10,r0,0
% done generating indice offseting
% begin var offset calculation
addi r12,r10,348
sw 364(r14),r12
% end var offset calculation
% begin write 
lw r12,364(r14)
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
sw 368(r14),r10
% end var offset calculation
% begin intlit storeage
addi r10,r0,1
sw 372(r14), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,93
sw 376(r14), r10
% done intlit storeage
% begin add op 
lw r10,372(r14)
lw r12,376(r14)
add r11,r10,r12
sw 380(r14),r11
% end add op 
% begin intlit storeage
addi r9,r0,1
sw 384(r14), r9
% done intlit storeage
% begin add op 
lw r9,380(r14)
lw r11,384(r14)
add r12,r9,r11
sw 388(r14),r12
% end add op 
% begin intlit storeage
addi r10,r0,10
sw 392(r14), r10
% done intlit storeage
% begin add op 
lw r10,388(r14)
lw r12,392(r14)
add r11,r10,r12
sw 396(r14),r11
% end add op 
% begin intlit storeage
addi r9,r0,9
sw 400(r14), r9
% done intlit storeage
% begin add op 
lw r9,396(r14)
lw r11,400(r14)
add r12,r9,r11
sw 404(r14),r12
% end add op 
% begin intlit storeage
addi r10,r0,33
sw 408(r14), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,2
sw 412(r14), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,2
sw 416(r14), r10
% done intlit storeage
% begin mult op 
lw r10,412(r14)
lw r12,416(r14)
mul r11,r10,r12
sw 420(r14),r11
% end mult op 
% begin add op 
lw r9,408(r14)
lw r11,420(r14)
add r12,r9,r11
sw 424(r14),r12
% end add op 
% begin intlit storeage
addi r10,r0,60
sw 428(r14), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,3
sw 432(r14), r10
% done intlit storeage
% begin mult op 
lw r10,428(r14)
lw r12,432(r14)
div r11,r10,r12
sw 436(r14),r11
% end mult op 
% begin mult op 
lw r9,424(r14)
lw r11,436(r14)
mul r12,r9,r11
sw 440(r14),r12
% end mult op 
% begin add op 
lw r10,404(r14)
lw r12,440(r14)
add r11,r10,r12
sw 444(r14),r11
% end add op 
% begin intlit storeage
addi r9,r0,2
sw 448(r14), r9
% done intlit storeage
% begin mult op 
lw r9,444(r14)
lw r11,448(r14)
div r12,r9,r11
sw 452(r14),r12
% end mult op 
% begin intlit storeage
addi r10,r0,1
sw 456(r14), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,4
sw 460(r14), r10
% done intlit storeage
% begin mult op 
lw r10,456(r14)
lw r12,460(r14)
mul r11,r10,r12
sw 464(r14),r11
% end mult op 
% begin intlit storeage
addi r9,r0,2
sw 468(r14), r9
% done intlit storeage
% begin mult op 
lw r9,464(r14)
lw r11,468(r14)
div r12,r9,r11
sw 472(r14),r12
% end mult op 
% begin intlit storeage
addi r10,r0,9
sw 476(r14), r10
% done intlit storeage
% begin add op 
lw r10,472(r14)
lw r12,476(r14)
add r11,r10,r12
sw 480(r14),r11
% end add op 
% begin add op 
lw r9,452(r14)
lw r11,480(r14)
add r12,r9,r11
sw 484(r14),r12
% end add op 
% begin intlit storeage
addi r10,r0,100
sw 488(r14), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,5
sw 492(r14), r10
% done intlit storeage
% begin mult op 
lw r10,488(r14)
lw r12,492(r14)
mul r11,r10,r12
sw 496(r14),r11
% end mult op 
% begin add op 
lw r9,484(r14)
lw r11,496(r14)
add r12,r9,r11
sw 500(r14),r12
% end add op 
% begin assignment 
lw r10,500(r14)
lw r12,368(r14) 
sw 0(r12),r10
% end assignment 
% begin generating indice offseting
addi r11,r0,0
% done generating indice offseting
% begin var offset calculation
addi r12,r11,348
sw 504(r14),r12
% end var offset calculation
% begin write 
lw r12,504(r14)
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
sw 508(r14), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,0
sw 512(r14), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,1
sw 516(r14), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,0
sw 520(r14), r11
% done intlit storeage
% begin generating indice offseting
mul r12,r0,r2
addi r11,r0,1
lw r10,520(r14)
muli r9,r11,4
mul r9,r10,r9
add r12,r12,r9
lw r10,516(r14)
muli r9,r11,4
mul r9,r10,r9
muli r9,r9,1
add r12,r12,r9
lw r10,512(r14)
muli r9,r11,4
mul r9,r10,r9
muli r9,r9,1
muli r9,r9,3
add r12,r12,r9
lw r10,508(r14)
muli r9,r11,4
mul r9,r10,r9
muli r9,r9,1
muli r9,r9,3
muli r9,r9,5
add r12,r12,r9
% done generating indice offseting
% begin var offset calculation
addi r10,r12,48
sw 524(r14),r10
% end var offset calculation
% begin generating indice offseting
addi r10,r0,0
% done generating indice offseting
% begin var offset calculation
addi r12,r10,348
sw 528(r14),r12
% end var offset calculation
% begin assignment 
lw r11,528(r14)
lw r12,0(r11)
lw r10,524(r14) 
sw 0(r10),r12
% end assignment 
% begin intlit storeage
addi r10,r0,2
sw 532(r14), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,2
sw 536(r14), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,2
sw 540(r14), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,1
sw 544(r14), r10
% done intlit storeage
% begin generating indice offseting
mul r11,r0,r2
addi r10,r0,1
lw r12,544(r14)
muli r9,r10,4
mul r9,r12,r9
add r11,r11,r9
lw r12,540(r14)
muli r9,r10,4
mul r9,r12,r9
muli r9,r9,1
add r11,r11,r9
lw r12,536(r14)
muli r9,r10,4
mul r9,r12,r9
muli r9,r9,1
muli r9,r9,3
add r11,r11,r9
lw r12,532(r14)
muli r9,r10,4
mul r9,r12,r9
muli r9,r9,1
muli r9,r9,3
muli r9,r9,5
add r11,r11,r9
% done generating indice offseting
% begin var offset calculation
addi r12,r11,48
sw 548(r14),r12
% end var offset calculation
% begin generating indice offseting
addi r12,r0,0
% done generating indice offseting
% begin var offset calculation
addi r11,r12,348
sw 552(r14),r11
% end var offset calculation
% begin intlit storeage
addi r11,r0,2
sw 556(r14), r11
% done intlit storeage
% begin add op 
lw r9,552(r14)
lw r11,0(r9)
lw r12,556(r14)
add r10,r11,r12
sw 560(r14),r10
% end add op 
% begin assignment 
lw r9,560(r14)
lw r10,548(r14) 
sw 0(r10),r9
% end assignment 
% begin intlit storeage
addi r10,r0,1
sw 564(r14), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,0
sw 568(r14), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,1
sw 572(r14), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,0
sw 576(r14), r10
% done intlit storeage
% begin generating indice offseting
mul r12,r0,r2
addi r10,r0,1
lw r9,576(r14)
muli r11,r10,4
mul r11,r9,r11
add r12,r12,r11
lw r9,572(r14)
muli r11,r10,4
mul r11,r9,r11
muli r11,r11,1
add r12,r12,r11
lw r9,568(r14)
muli r11,r10,4
mul r11,r9,r11
muli r11,r11,1
muli r11,r11,3
add r12,r12,r11
lw r9,564(r14)
muli r11,r10,4
mul r11,r9,r11
muli r11,r11,1
muli r11,r11,3
muli r11,r11,5
add r12,r12,r11
% done generating indice offseting
% begin var offset calculation
addi r9,r12,48
sw 580(r14),r9
% end var offset calculation
% begin write 
lw r9,580(r14)
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
sw 584(r14), r9
% done intlit storeage
% begin write 
lw r9,584(r14)
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
sw 588(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,2
sw 592(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,2
sw 596(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,1
sw 600(r14), r12
% done intlit storeage
% begin generating indice offseting
mul r9,r0,r2
addi r12,r0,1
lw r10,600(r14)
muli r11,r12,4
mul r11,r10,r11
add r9,r9,r11
lw r10,596(r14)
muli r11,r12,4
mul r11,r10,r11
muli r11,r11,1
add r9,r9,r11
lw r10,592(r14)
muli r11,r12,4
mul r11,r10,r11
muli r11,r11,1
muli r11,r11,3
add r9,r9,r11
lw r10,588(r14)
muli r11,r12,4
mul r11,r10,r11
muli r11,r11,1
muli r11,r11,3
muli r11,r11,5
add r9,r9,r11
% done generating indice offseting
% begin var offset calculation
addi r10,r9,48
sw 604(r14),r10
% end var offset calculation
% begin write 
lw r10,604(r14)
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
sw 608(r14), r10
% done intlit storeage
% begin write 
lw r10,608(r14)
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
sw 612(r14),r9
% end var offset calculation
% begin intlit storeage
addi r9,r0,33
sw 616(r14), r9
% done intlit storeage
% begin assignment 
lw r9,616(r14)
lw r10,612(r14) 
sw 0(r10),r9
% end assignment 
% begin generating indice offseting
addi r12,r0,0
% done generating indice offseting
% begin var offset calculation
addi r10,r12,348
sw 620(r14),r10
% end var offset calculation
% begin write 
lw r10,620(r14)
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
sw 624(r14), r10
% done intlit storeage
% begin write 
lw r10,624(r14)
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
sw 628(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,0
sw 632(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,1
sw 636(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,0
sw 640(r14), r12
% done intlit storeage
% begin generating indice offseting
mul r10,r0,r2
addi r12,r0,1
lw r9,640(r14)
muli r11,r12,4
mul r11,r9,r11
add r10,r10,r11
lw r9,636(r14)
muli r11,r12,4
mul r11,r9,r11
muli r11,r11,1
add r10,r10,r11
lw r9,632(r14)
muli r11,r12,4
mul r11,r9,r11
muli r11,r11,1
muli r11,r11,3
add r10,r10,r11
lw r9,628(r14)
muli r11,r12,4
mul r11,r9,r11
muli r11,r11,1
muli r11,r11,3
muli r11,r11,5
add r10,r10,r11
% done generating indice offseting
% begin var offset calculation
addi r9,r10,48
sw 644(r14),r9
% end var offset calculation
% begin write 
lw r9,644(r14)
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
sw 648(r14),r10
% end var offset calculation
% begin intlit storeage
addi r10,r0,1
sw 652(r14), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,1
sw 656(r14), r10
% done intlit storeage
% begin add op 
lw r10,652(r14)
lw r9,656(r14)
bnz r10,one1
bnz r9,one1
addi r12,r0,0
j endor1
one1		addi r12,r0,1
endor1 	sw 660(r14),r12
% end add op 
% begin assignment 
lw r11,660(r14)
lw r12,648(r14) 
sw 0(r12),r11
% end assignment 
% begin generating indice offseting
addi r9,r0,0
% done generating indice offseting
% begin var offset calculation
addi r12,r9,348
sw 664(r14),r12
% end var offset calculation
% begin intlit storeage
addi r12,r0,1
sw 668(r14), r12
% done intlit storeage
% begin assignment 
lw r12,668(r14)
lw r9,664(r14) 
sw 0(r9),r12
% end assignment 
% begin generating indice offseting
addi r11,r0,0
% done generating indice offseting
% begin var offset calculation
addi r9,r11,352
sw 672(r14),r9
% end var offset calculation
% begin intlit storeage
addi r9,r0,0
sw 676(r14), r9
% done intlit storeage
% begin assignment 
lw r9,676(r14)
lw r11,672(r14) 
sw 0(r11),r9
% end assignment 
gowhile1
% begin generating indice offseting
addi r11,r0,0
% done generating indice offseting
% begin var offset calculation
addi r9,r11,348
sw 680(r14),r9
% end var offset calculation
% begin intlit storeage
addi r9,r0,12
sw 684(r14), r9
% done intlit storeage
% begin RELOP op 
lw r8,680(r14)
lw r9,0(r8)
lw r11,684(r14)
clt r10,r9,r11
sw 688(r14),r10
% end relop op 
lw r12,688(r14)
bz r12,endwhile1
% begin generating indice offseting
addi r8,r0,0
% done generating indice offseting
% begin var offset calculation
addi r10,r8,352
sw 692(r14),r10
% end var offset calculation
% begin generating indice offseting
addi r10,r0,0
% done generating indice offseting
% begin var offset calculation
addi r8,r10,352
sw 696(r14),r8
% end var offset calculation
% begin generating indice offseting
addi r8,r0,0
% done generating indice offseting
% begin var offset calculation
addi r10,r8,348
sw 700(r14),r10
% end var offset calculation
% begin add op 
lw r9,696(r14)
lw r10,0(r9)
lw r9,700(r14)
lw r8,0(r9)
add r11,r10,r8
sw 704(r14),r11
% end add op 
% begin assignment 
lw r9,704(r14)
lw r11,692(r14) 
sw 0(r11),r9
% end assignment 
% begin generating indice offseting
addi r8,r0,0
% done generating indice offseting
% begin var offset calculation
addi r11,r8,348
sw 708(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r11,r0,0
% done generating indice offseting
% begin var offset calculation
addi r8,r11,348
sw 712(r14),r8
% end var offset calculation
% begin intlit storeage
addi r8,r0,1
sw 716(r14), r8
% done intlit storeage
% begin add op 
lw r10,712(r14)
lw r8,0(r10)
lw r11,716(r14)
add r9,r8,r11
sw 720(r14),r9
% end add op 
% begin assignment 
lw r10,720(r14)
lw r9,708(r14) 
sw 0(r9),r10
% end assignment 
j gowhile1
endwhile1
% begin generating indice offseting
addi r12,r0,0
% done generating indice offseting
% begin var offset calculation
addi r11,r12,352
sw 724(r14),r11
% end var offset calculation
% begin write 
lw r11,724(r14)
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
