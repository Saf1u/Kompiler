entry
muli r0,r0,0
muli r14,r0,0
addi r14,r0,stackbase
%r14 is stack ptr, stack grows downwards
addi r14,r14,2048
%24kb stack
% begin generating indice offseting
addi r12,r0,0
% done generating indice offseting
% begin var offset calculation
addi r11,r12,zmain
sw offset0(r0),r11
% end var offset calculation
% begin intlit storeage
addi r11,r0,112
sw literal0(r0), r11
% done intlit storeage
% begin assignment 
lw r11,literal0(r0)
lw r12,offset0(r0) 
sw 0(r12),r11
% end assignment 
% begin intlit storeage
addi r12,r0,1
sw literal1(r0), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,0
sw literal2(r0), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,1
sw literal3(r0), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,0
sw literal4(r0), r12
% done intlit storeage
% begin generating indice offseting
mul r10,r0,r2
addi r12,r0,1
lw r11,literal4(r0)
muli r9,r12,4
mul r9,r11,r9
add r10,r10,r9
lw r11,literal3(r0)
muli r9,r12,4
mul r9,r11,r9
muli r9,r9,1
add r10,r10,r9
lw r11,literal2(r0)
muli r9,r12,4
mul r9,r11,r9
muli r9,r9,1
muli r9,r9,3
add r10,r10,r9
lw r11,literal1(r0)
muli r9,r12,4
mul r9,r11,r9
muli r9,r9,1
muli r9,r9,3
muli r9,r9,5
add r10,r10,r9
% done generating indice offseting
% begin var offset calculation
addi r11,r10,pmain
sw offset1(r0),r11
% end var offset calculation
% begin intlit storeage
addi r11,r0,12
sw literal5(r0), r11
% done intlit storeage
% begin assignment 
lw r11,literal5(r0)
lw r10,offset1(r0) 
sw 0(r10),r11
% end assignment 
% begin intlit storeage
addi r10,r0,3
sw literal6(r0), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,1
sw literal7(r0), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,0
sw literal8(r0), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,1
sw literal9(r0), r10
% done intlit storeage
% begin generating indice offseting
mul r12,r0,r2
addi r10,r0,1
lw r11,literal9(r0)
muli r9,r10,4
mul r9,r11,r9
add r12,r12,r9
lw r11,literal8(r0)
muli r9,r10,4
mul r9,r11,r9
muli r9,r9,1
add r12,r12,r9
lw r11,literal7(r0)
muli r9,r10,4
mul r9,r11,r9
muli r9,r9,1
muli r9,r9,3
add r12,r12,r9
lw r11,literal6(r0)
muli r9,r10,4
mul r9,r11,r9
muli r9,r9,1
muli r9,r9,3
muli r9,r9,5
add r12,r12,r9
% done generating indice offseting
% begin var offset calculation
addi r11,r12,pmain
sw offset2(r0),r11
% end var offset calculation
% begin intlit storeage
addi r11,r0,13
sw literal10(r0), r11
% done intlit storeage
% begin assignment 
lw r11,literal10(r0)
lw r12,offset2(r0) 
sw 0(r12),r11
% end assignment 
% begin intlit storeage
addi r12,r0,2
sw literal11(r0), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,2
sw literal12(r0), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,1
sw literal13(r0), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,0
sw literal14(r0), r12
% done intlit storeage
% begin generating indice offseting
mul r10,r0,r2
addi r12,r0,1
lw r11,literal14(r0)
muli r9,r12,4
mul r9,r11,r9
add r10,r10,r9
lw r11,literal13(r0)
muli r9,r12,4
mul r9,r11,r9
muli r9,r9,1
add r10,r10,r9
lw r11,literal12(r0)
muli r9,r12,4
mul r9,r11,r9
muli r9,r9,1
muli r9,r9,3
add r10,r10,r9
lw r11,literal11(r0)
muli r9,r12,4
mul r9,r11,r9
muli r9,r9,1
muli r9,r9,3
muli r9,r9,5
add r10,r10,r9
% done generating indice offseting
% begin var offset calculation
addi r11,r10,pmain
sw offset3(r0),r11
% end var offset calculation
% begin intlit storeage
addi r11,r0,14
sw literal15(r0), r11
% done intlit storeage
% begin assignment 
lw r11,literal15(r0)
lw r10,offset3(r0) 
sw 0(r10),r11
% end assignment 
% begin intlit storeage
addi r10,r0,1
sw literal16(r0), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,3
sw literal17(r0), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,2
sw literal18(r0), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,1
sw literal19(r0), r10
% done intlit storeage
% begin generating indice offseting
mul r12,r0,r2
addi r10,r0,1
lw r11,literal19(r0)
muli r9,r10,4
mul r9,r11,r9
add r12,r12,r9
lw r11,literal18(r0)
muli r9,r10,4
mul r9,r11,r9
muli r9,r9,1
add r12,r12,r9
lw r11,literal17(r0)
muli r9,r10,4
mul r9,r11,r9
muli r9,r9,1
muli r9,r9,3
add r12,r12,r9
lw r11,literal16(r0)
muli r9,r10,4
mul r9,r11,r9
muli r9,r9,1
muli r9,r9,3
muli r9,r9,5
add r12,r12,r9
% done generating indice offseting
% begin var offset calculation
addi r11,r12,pmain
sw offset4(r0),r11
% end var offset calculation
% begin intlit storeage
addi r11,r0,15
sw literal20(r0), r11
% done intlit storeage
% begin assignment 
lw r11,literal20(r0)
lw r12,offset4(r0) 
sw 0(r12),r11
% end assignment 
% begin intlit storeage
addi r12,r0,3
sw literal21(r0), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,4
sw literal22(r0), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,3
sw literal23(r0), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,0
sw literal24(r0), r12
% done intlit storeage
% begin generating indice offseting
mul r10,r0,r2
addi r12,r0,1
lw r11,literal24(r0)
muli r9,r12,4
mul r9,r11,r9
add r10,r10,r9
lw r11,literal23(r0)
muli r9,r12,4
mul r9,r11,r9
muli r9,r9,1
add r10,r10,r9
lw r11,literal22(r0)
muli r9,r12,4
mul r9,r11,r9
muli r9,r9,1
muli r9,r9,3
add r10,r10,r9
lw r11,literal21(r0)
muli r9,r12,4
mul r9,r11,r9
muli r9,r9,1
muli r9,r9,3
muli r9,r9,5
add r10,r10,r9
% done generating indice offseting
% begin var offset calculation
addi r11,r10,pmain
sw offset5(r0),r11
% end var offset calculation
% begin intlit storeage
addi r11,r0,16
sw literal25(r0), r11
% done intlit storeage
% begin assignment 
lw r11,literal25(r0)
lw r10,offset5(r0) 
sw 0(r10),r11
% end assignment 
% begin intlit storeage
addi r10,r0,1
sw literal26(r0), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,0
sw literal27(r0), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,1
sw literal28(r0), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,0
sw literal29(r0), r10
% done intlit storeage
% begin generating indice offseting
mul r12,r0,r2
addi r10,r0,1
lw r11,literal29(r0)
muli r9,r10,4
mul r9,r11,r9
add r12,r12,r9
lw r11,literal28(r0)
muli r9,r10,4
mul r9,r11,r9
muli r9,r9,1
add r12,r12,r9
lw r11,literal27(r0)
muli r9,r10,4
mul r9,r11,r9
muli r9,r9,1
muli r9,r9,3
add r12,r12,r9
lw r11,literal26(r0)
muli r9,r10,4
mul r9,r11,r9
muli r9,r9,1
muli r9,r9,3
muli r9,r9,5
add r12,r12,r9
% done generating indice offseting
% begin var offset calculation
addi r11,r12,pmain
sw offset6(r0),r11
% end var offset calculation
% begin write 
lw r11,offset6(r0)
lw r11,0(r11)
sw -8(r14),r11
addi r11,r0,buffer
sw -12(r14),r11
jl r15,intstr
sw -8(r14),r13
jl r15,putstr
% end write
% begin intlit storeage
addi r12,r0,3
sw literal30(r0), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,1
sw literal31(r0), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,0
sw literal32(r0), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,1
sw literal33(r0), r12
% done intlit storeage
% begin generating indice offseting
mul r11,r0,r2
addi r12,r0,1
lw r10,literal33(r0)
muli r9,r12,4
mul r9,r10,r9
add r11,r11,r9
lw r10,literal32(r0)
muli r9,r12,4
mul r9,r10,r9
muli r9,r9,1
add r11,r11,r9
lw r10,literal31(r0)
muli r9,r12,4
mul r9,r10,r9
muli r9,r9,1
muli r9,r9,3
add r11,r11,r9
lw r10,literal30(r0)
muli r9,r12,4
mul r9,r10,r9
muli r9,r9,1
muli r9,r9,3
muli r9,r9,5
add r11,r11,r9
% done generating indice offseting
% begin var offset calculation
addi r10,r11,pmain
sw offset7(r0),r10
% end var offset calculation
% begin write 
lw r10,offset7(r0)
lw r10,0(r10)
sw -8(r14),r10
addi r10,r0,buffer
sw -12(r14),r10
jl r15,intstr
sw -8(r14),r13
jl r15,putstr
% end write
% begin intlit storeage
addi r11,r0,2
sw literal34(r0), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,2
sw literal35(r0), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,1
sw literal36(r0), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,0
sw literal37(r0), r11
% done intlit storeage
% begin generating indice offseting
mul r10,r0,r2
addi r11,r0,1
lw r12,literal37(r0)
muli r9,r11,4
mul r9,r12,r9
add r10,r10,r9
lw r12,literal36(r0)
muli r9,r11,4
mul r9,r12,r9
muli r9,r9,1
add r10,r10,r9
lw r12,literal35(r0)
muli r9,r11,4
mul r9,r12,r9
muli r9,r9,1
muli r9,r9,3
add r10,r10,r9
lw r12,literal34(r0)
muli r9,r11,4
mul r9,r12,r9
muli r9,r9,1
muli r9,r9,3
muli r9,r9,5
add r10,r10,r9
% done generating indice offseting
% begin var offset calculation
addi r12,r10,pmain
sw offset8(r0),r12
% end var offset calculation
% begin write 
lw r12,offset8(r0)
lw r12,0(r12)
sw -8(r14),r12
addi r12,r0,buffer
sw -12(r14),r12
jl r15,intstr
sw -8(r14),r13
jl r15,putstr
% end write
% begin intlit storeage
addi r10,r0,1
sw literal38(r0), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,3
sw literal39(r0), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,2
sw literal40(r0), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,1
sw literal41(r0), r10
% done intlit storeage
% begin generating indice offseting
mul r12,r0,r2
addi r10,r0,1
lw r11,literal41(r0)
muli r9,r10,4
mul r9,r11,r9
add r12,r12,r9
lw r11,literal40(r0)
muli r9,r10,4
mul r9,r11,r9
muli r9,r9,1
add r12,r12,r9
lw r11,literal39(r0)
muli r9,r10,4
mul r9,r11,r9
muli r9,r9,1
muli r9,r9,3
add r12,r12,r9
lw r11,literal38(r0)
muli r9,r10,4
mul r9,r11,r9
muli r9,r9,1
muli r9,r9,3
muli r9,r9,5
add r12,r12,r9
% done generating indice offseting
% begin var offset calculation
addi r11,r12,pmain
sw offset9(r0),r11
% end var offset calculation
% begin write 
lw r11,offset9(r0)
lw r11,0(r11)
sw -8(r14),r11
addi r11,r0,buffer
sw -12(r14),r11
jl r15,intstr
sw -8(r14),r13
jl r15,putstr
% end write
% begin intlit storeage
addi r12,r0,3
sw literal42(r0), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,4
sw literal43(r0), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,3
sw literal44(r0), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,0
sw literal45(r0), r12
% done intlit storeage
% begin generating indice offseting
mul r11,r0,r2
addi r12,r0,1
lw r10,literal45(r0)
muli r9,r12,4
mul r9,r10,r9
add r11,r11,r9
lw r10,literal44(r0)
muli r9,r12,4
mul r9,r10,r9
muli r9,r9,1
add r11,r11,r9
lw r10,literal43(r0)
muli r9,r12,4
mul r9,r10,r9
muli r9,r9,1
muli r9,r9,3
add r11,r11,r9
lw r10,literal42(r0)
muli r9,r12,4
mul r9,r10,r9
muli r9,r9,1
muli r9,r9,3
muli r9,r9,5
add r11,r11,r9
% done generating indice offseting
% begin var offset calculation
addi r10,r11,pmain
sw offset10(r0),r10
% end var offset calculation
% begin write 
lw r10,offset10(r0)
lw r10,0(r10)
sw -8(r14),r10
addi r10,r0,buffer
sw -12(r14),r10
jl r15,intstr
sw -8(r14),r13
jl r15,putstr
% end write
hlt
