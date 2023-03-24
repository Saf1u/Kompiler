entry
muli r0,r0,0
muli r14,r0,0
addi r14,r0,stackbase
%r14 is stack ptr, stack grows downwards
addi r14,r14,2048
%24kb stack
% begin intlit storeage
addi r11,r0,1
sw literal0(r0), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,0
sw literal1(r0), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,1
sw literal2(r0), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,0
sw literal3(r0), r11
% done intlit storeage
% begin generating indice offseting
mul r12,r0,r2
addi r11,r0,1
lw r10,literal3(r0)
muli r9,r11,4
mul r9,r10,r9
add r12,r12,r9
lw r10,literal2(r0)
muli r9,r11,4
mul r9,r10,r9
muli r9,r9,1
add r12,r12,r9
lw r10,literal1(r0)
muli r9,r11,4
mul r9,r10,r9
muli r9,r9,1
muli r9,r9,3
add r12,r12,r9
lw r10,literal0(r0)
muli r9,r11,4
mul r9,r10,r9
muli r9,r9,1
muli r9,r9,3
muli r9,r9,5
add r12,r12,r9
% done generating indice offseting
% begin var offset calculation
addi r10,r12,pmain
sw offset0(r0),r10
% end var offset calculation
% begin intlit storeage
addi r10,r0,210
sw literal4(r0), r10
% done intlit storeage
% begin assignment 
lw r10,literal4(r0)
 lw r12,offset0(r0) 
sw 0(r12),r10
% end assignment 
% begin intlit storeage
addi r10,r0,3
sw literal5(r0), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,1
sw literal6(r0), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,0
sw literal7(r0), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,1
sw literal8(r0), r10
% done intlit storeage
% begin generating indice offseting
mul r12,r0,r2
addi r10,r0,1
lw r11,literal8(r0)
muli r9,r10,4
mul r9,r11,r9
add r12,r12,r9
lw r11,literal7(r0)
muli r9,r10,4
mul r9,r11,r9
muli r9,r9,1
add r12,r12,r9
lw r11,literal6(r0)
muli r9,r10,4
mul r9,r11,r9
muli r9,r9,1
muli r9,r9,3
add r12,r12,r9
lw r11,literal5(r0)
muli r9,r10,4
mul r9,r11,r9
muli r9,r9,1
muli r9,r9,3
muli r9,r9,5
add r12,r12,r9
% done generating indice offseting
% begin var offset calculation
addi r11,r12,pmain
sw offset1(r0),r11
% end var offset calculation
% begin intlit storeage
addi r11,r0,980
sw literal9(r0), r11
% done intlit storeage
% begin assignment 
lw r11,literal9(r0)
 lw r12,offset1(r0) 
sw 0(r12),r11
% end assignment 
% begin intlit storeage
addi r11,r0,2
sw literal10(r0), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,2
sw literal11(r0), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,1
sw literal12(r0), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,0
sw literal13(r0), r11
% done intlit storeage
% begin generating indice offseting
mul r12,r0,r2
addi r11,r0,1
lw r10,literal13(r0)
muli r9,r11,4
mul r9,r10,r9
add r12,r12,r9
lw r10,literal12(r0)
muli r9,r11,4
mul r9,r10,r9
muli r9,r9,1
add r12,r12,r9
lw r10,literal11(r0)
muli r9,r11,4
mul r9,r10,r9
muli r9,r9,1
muli r9,r9,3
add r12,r12,r9
lw r10,literal10(r0)
muli r9,r11,4
mul r9,r10,r9
muli r9,r9,1
muli r9,r9,3
muli r9,r9,5
add r12,r12,r9
% done generating indice offseting
% begin var offset calculation
addi r10,r12,pmain
sw offset2(r0),r10
% end var offset calculation
% begin intlit storeage
addi r10,r0,720
sw literal14(r0), r10
% done intlit storeage
% begin assignment 
lw r10,literal14(r0)
 lw r12,offset2(r0) 
sw 0(r12),r10
% end assignment 
% begin intlit storeage
addi r10,r0,1
sw literal15(r0), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,3
sw literal16(r0), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,2
sw literal17(r0), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,1
sw literal18(r0), r10
% done intlit storeage
% begin generating indice offseting
mul r12,r0,r2
addi r10,r0,1
lw r11,literal18(r0)
muli r9,r10,4
mul r9,r11,r9
add r12,r12,r9
lw r11,literal17(r0)
muli r9,r10,4
mul r9,r11,r9
muli r9,r9,1
add r12,r12,r9
lw r11,literal16(r0)
muli r9,r10,4
mul r9,r11,r9
muli r9,r9,1
muli r9,r9,3
add r12,r12,r9
lw r11,literal15(r0)
muli r9,r10,4
mul r9,r11,r9
muli r9,r9,1
muli r9,r9,3
muli r9,r9,5
add r12,r12,r9
% done generating indice offseting
% begin var offset calculation
addi r11,r12,pmain
sw offset3(r0),r11
% end var offset calculation
% begin intlit storeage
addi r11,r0,910
sw literal19(r0), r11
% done intlit storeage
% begin assignment 
lw r11,literal19(r0)
 lw r12,offset3(r0) 
sw 0(r12),r11
% end assignment 
% begin intlit storeage
addi r11,r0,3
sw literal20(r0), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,4
sw literal21(r0), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,3
sw literal22(r0), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,0
sw literal23(r0), r11
% done intlit storeage
% begin generating indice offseting
mul r12,r0,r2
addi r11,r0,1
lw r10,literal23(r0)
muli r9,r11,4
mul r9,r10,r9
add r12,r12,r9
lw r10,literal22(r0)
muli r9,r11,4
mul r9,r10,r9
muli r9,r9,1
add r12,r12,r9
lw r10,literal21(r0)
muli r9,r11,4
mul r9,r10,r9
muli r9,r9,1
muli r9,r9,3
add r12,r12,r9
lw r10,literal20(r0)
muli r9,r11,4
mul r9,r10,r9
muli r9,r9,1
muli r9,r9,3
muli r9,r9,5
add r12,r12,r9
% done generating indice offseting
% begin var offset calculation
addi r10,r12,pmain
sw offset4(r0),r10
% end var offset calculation
% begin intlit storeage
addi r10,r0,120
sw literal24(r0), r10
% done intlit storeage
% begin assignment 
lw r10,literal24(r0)
 lw r12,offset4(r0) 
sw 0(r12),r10
% end assignment 
% begin intlit storeage
addi r10,r0,1
sw literal25(r0), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,0
sw literal26(r0), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,1
sw literal27(r0), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,0
sw literal28(r0), r10
% done intlit storeage
% begin generating indice offseting
mul r12,r0,r2
addi r10,r0,1
lw r11,literal28(r0)
muli r9,r10,4
mul r9,r11,r9
add r12,r12,r9
lw r11,literal27(r0)
muli r9,r10,4
mul r9,r11,r9
muli r9,r9,1
add r12,r12,r9
lw r11,literal26(r0)
muli r9,r10,4
mul r9,r11,r9
muli r9,r9,1
muli r9,r9,3
add r12,r12,r9
lw r11,literal25(r0)
muli r9,r10,4
mul r9,r11,r9
muli r9,r9,1
muli r9,r9,3
muli r9,r9,5
add r12,r12,r9
% done generating indice offseting
% begin var offset calculation
addi r11,r12,pmain
sw offset5(r0),r11
% end var offset calculation
% begin write 
lw r11,offset5(r0)
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
sw literal29(r0), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,1
sw literal30(r0), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,0
sw literal31(r0), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,1
sw literal32(r0), r12
% done intlit storeage
% begin generating indice offseting
mul r11,r0,r2
addi r12,r0,1
lw r10,literal32(r0)
muli r9,r12,4
mul r9,r10,r9
add r11,r11,r9
lw r10,literal31(r0)
muli r9,r12,4
mul r9,r10,r9
muli r9,r9,1
add r11,r11,r9
lw r10,literal30(r0)
muli r9,r12,4
mul r9,r10,r9
muli r9,r9,1
muli r9,r9,3
add r11,r11,r9
lw r10,literal29(r0)
muli r9,r12,4
mul r9,r10,r9
muli r9,r9,1
muli r9,r9,3
muli r9,r9,5
add r11,r11,r9
% done generating indice offseting
% begin var offset calculation
addi r10,r11,pmain
sw offset6(r0),r10
% end var offset calculation
% begin write 
lw r10,offset6(r0)
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
sw literal33(r0), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,2
sw literal34(r0), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,1
sw literal35(r0), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,0
sw literal36(r0), r11
% done intlit storeage
% begin generating indice offseting
mul r10,r0,r2
addi r11,r0,1
lw r12,literal36(r0)
muli r9,r11,4
mul r9,r12,r9
add r10,r10,r9
lw r12,literal35(r0)
muli r9,r11,4
mul r9,r12,r9
muli r9,r9,1
add r10,r10,r9
lw r12,literal34(r0)
muli r9,r11,4
mul r9,r12,r9
muli r9,r9,1
muli r9,r9,3
add r10,r10,r9
lw r12,literal33(r0)
muli r9,r11,4
mul r9,r12,r9
muli r9,r9,1
muli r9,r9,3
muli r9,r9,5
add r10,r10,r9
% done generating indice offseting
% begin var offset calculation
addi r12,r10,pmain
sw offset7(r0),r12
% end var offset calculation
% begin write 
lw r12,offset7(r0)
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
sw literal37(r0), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,3
sw literal38(r0), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,2
sw literal39(r0), r10
% done intlit storeage
% begin intlit storeage
addi r10,r0,1
sw literal40(r0), r10
% done intlit storeage
% begin generating indice offseting
mul r12,r0,r2
addi r10,r0,1
lw r11,literal40(r0)
muli r9,r10,4
mul r9,r11,r9
add r12,r12,r9
lw r11,literal39(r0)
muli r9,r10,4
mul r9,r11,r9
muli r9,r9,1
add r12,r12,r9
lw r11,literal38(r0)
muli r9,r10,4
mul r9,r11,r9
muli r9,r9,1
muli r9,r9,3
add r12,r12,r9
lw r11,literal37(r0)
muli r9,r10,4
mul r9,r11,r9
muli r9,r9,1
muli r9,r9,3
muli r9,r9,5
add r12,r12,r9
% done generating indice offseting
% begin var offset calculation
addi r11,r12,pmain
sw offset8(r0),r11
% end var offset calculation
% begin write 
lw r11,offset8(r0)
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
sw literal41(r0), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,4
sw literal42(r0), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,3
sw literal43(r0), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,0
sw literal44(r0), r12
% done intlit storeage
% begin generating indice offseting
mul r11,r0,r2
addi r12,r0,1
lw r10,literal44(r0)
muli r9,r12,4
mul r9,r10,r9
add r11,r11,r9
lw r10,literal43(r0)
muli r9,r12,4
mul r9,r10,r9
muli r9,r9,1
add r11,r11,r9
lw r10,literal42(r0)
muli r9,r12,4
mul r9,r10,r9
muli r9,r9,1
muli r9,r9,3
add r11,r11,r9
lw r10,literal41(r0)
muli r9,r12,4
mul r9,r10,r9
muli r9,r9,1
muli r9,r9,3
muli r9,r9,5
add r11,r11,r9
% done generating indice offseting
% begin var offset calculation
addi r10,r11,pmain
sw offset9(r0),r10
% end var offset calculation
% begin write 
lw r10,offset9(r0)
lw r10,0(r10)
sw -8(r14),r10
addi r10,r0,buffer
sw -12(r14),r10
jl r15,intstr
sw -8(r14),r13
jl r15,putstr
% end write
hlt
pmain                res     300
literal0             res     4
literal1             res     4
literal2             res     4
literal3             res     4
offset0              res     4
literal4             res     4
literal5             res     4
literal6             res     4
literal7             res     4
literal8             res     4
offset1              res     4
literal9             res     4
literal10            res     4
literal11            res     4
literal12            res     4
literal13            res     4
offset2              res     4
literal14            res     4
literal15            res     4
literal16            res     4
literal17            res     4
literal18            res     4
offset3              res     4
literal19            res     4
literal20            res     4
literal21            res     4
literal22            res     4
literal23            res     4
offset4              res     4
literal24            res     4
literal25            res     4
literal26            res     4
literal27            res     4
literal28            res     4
offset5              res     4
literal29            res     4
literal30            res     4
literal31            res     4
literal32            res     4
offset6              res     4
literal33            res     4
literal34            res     4
literal35            res     4
literal36            res     4
offset7              res     4
literal37            res     4
literal38            res     4
literal39            res     4
literal40            res     4
offset8              res     4
literal41            res     4
literal42            res     4
literal43            res     4
literal44            res     4
offset9              res     4
buffer               res     200
stackbase            res     2048
