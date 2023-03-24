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
addi r11,r0,1
sw literal0(r0), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,93
sw literal1(r0), r11
% done intlit storeage
% begin add op 
lw r12,literal1(r0)
lw r11,literal0(r0)
add r10,r11,r12
sw tempVar0(r0),r10
% begin intlit storeage
addi r10,r0,1
sw literal2(r0), r10
% done intlit storeage
% begin add op 
lw r12,literal2(r0)
lw r10,tempVar0(r0)
add r11,r10,r12
sw tempVar1(r0),r11
% begin intlit storeage
addi r11,r0,10
sw literal3(r0), r11
% done intlit storeage
% begin add op 
lw r12,literal3(r0)
lw r11,tempVar1(r0)
add r10,r11,r12
sw tempVar2(r0),r10
% begin intlit storeage
addi r10,r0,9
sw literal4(r0), r10
% done intlit storeage
% begin add op 
lw r12,literal4(r0)
lw r10,tempVar2(r0)
add r11,r10,r12
sw tempVar3(r0),r11
% begin intlit storeage
addi r11,r0,33
sw literal5(r0), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,2
sw literal6(r0), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,2
sw literal7(r0), r11
% done intlit storeage
% begin mult op 
lw r12,literal7(r0)
lw r11,literal6(r0)
mul r10,r11,r12
sw tempVar4(r0),r10
% begin add op 
lw r12,tempVar4(r0)
lw r10,literal5(r0)
add r11,r10,r12
sw tempVar5(r0),r11
% begin intlit storeage
addi r11,r0,60
sw literal8(r0), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,3
sw literal9(r0), r11
% done intlit storeage
% begin mult op 
lw r12,literal9(r0)
lw r11,literal8(r0)
div r10,r11,r12
sw tempVar6(r0),r10
% begin mult op 
lw r12,tempVar6(r0)
lw r10,tempVar5(r0)
mul r11,r10,r12
sw tempVar7(r0),r11
% begin add op 
lw r12,tempVar7(r0)
lw r11,tempVar3(r0)
add r10,r11,r12
sw tempVar8(r0),r10
% begin intlit storeage
addi r10,r0,2
sw literal10(r0), r10
% done intlit storeage
% begin mult op 
lw r12,literal10(r0)
lw r10,tempVar8(r0)
div r11,r10,r12
sw tempVar9(r0),r11
% begin intlit storeage
addi r11,r0,1
sw literal11(r0), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,4
sw literal12(r0), r11
% done intlit storeage
% begin mult op 
lw r12,literal12(r0)
lw r11,literal11(r0)
mul r10,r11,r12
sw tempVar10(r0),r10
% begin intlit storeage
addi r10,r0,2
sw literal13(r0), r10
% done intlit storeage
% begin mult op 
lw r12,literal13(r0)
lw r10,tempVar10(r0)
div r11,r10,r12
sw tempVar11(r0),r11
% begin intlit storeage
addi r11,r0,9
sw literal14(r0), r11
% done intlit storeage
% begin add op 
lw r12,literal14(r0)
lw r11,tempVar11(r0)
add r10,r11,r12
sw tempVar12(r0),r10
% begin add op 
lw r12,tempVar12(r0)
lw r10,tempVar9(r0)
add r11,r10,r12
sw tempVar13(r0),r11
% begin intlit storeage
addi r11,r0,100
sw literal15(r0), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,5
sw literal16(r0), r11
% done intlit storeage
% begin mult op 
lw r12,literal16(r0)
lw r11,literal15(r0)
mul r10,r11,r12
sw tempVar14(r0),r10
% begin add op 
lw r12,tempVar14(r0)
lw r10,tempVar13(r0)
add r11,r10,r12
sw tempVar15(r0),r11
% begin assignment 
lw r11,tempVar15(r0)
lw r12,offset0(r0) 
sw 0(r12),r11
% end assignment 
% begin generating indice offseting
addi r10,r0,0
% done generating indice offseting
% begin var offset calculation
addi r12,r10,zmain
sw offset1(r0),r12
% end var offset calculation
% begin intlit storeage
addi r12,r0,232
sw literal17(r0), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,332
sw literal18(r0), r12
% done intlit storeage
% begin add op 
lw r10,literal18(r0)
lw r12,literal17(r0)
bnz r12,one1
bnz r10,one1
addi r11,r0,0
j endor1
one1		addi r11,r0,1
endor1 	sw tempVar16(r0),r11
% begin assignment 
lw r11,tempVar16(r0)
lw r10,offset1(r0) 
sw 0(r10),r11
% end assignment 
% begin generating indice offseting
addi r12,r0,0
% done generating indice offseting
% begin var offset calculation
addi r10,r12,zmain
sw offset2(r0),r10
% end var offset calculation
% begin write 
lw r10,offset2(r0)
lw r10,0(r10)
sw -8(r14),r10
addi r10,r0,buffer
sw -12(r14),r10
jl r15,intstr
sw -8(r14),r13
jl r15,putstr
% end write
hlt
zmain                res     4
offset0              res     4
literal0             res     4
literal1             res     4
tempVar0             res     4
literal2             res     4
tempVar1             res     4
literal3             res     4
tempVar2             res     4
literal4             res     4
tempVar3             res     4
literal5             res     4
literal6             res     4
literal7             res     4
tempVar4             res     4
tempVar5             res     4
literal8             res     4
literal9             res     4
tempVar6             res     4
tempVar7             res     4
tempVar8             res     4
literal10            res     4
tempVar9             res     4
literal11            res     4
literal12            res     4
tempVar10            res     4
literal13            res     4
tempVar11            res     4
literal14            res     4
tempVar12            res     4
tempVar13            res     4
literal15            res     4
literal16            res     4
tempVar14            res     4
tempVar15            res     4
offset1              res     4
literal17            res     4
literal18            res     4
tempVar16            res     4
offset2              res     4
buffer               res     200
stackbase            res     2048
