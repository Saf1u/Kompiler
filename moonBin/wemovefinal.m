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
addi r12,r0,1
addi r11,r0,0
sw 816(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,804
lw r10,816(r14)
 add r11,r11,r10
sw 820(r14),r11
% end var offset calculation
% begin intlit storeage
addi r10,r0,0
sw 824(r14), r10
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy1

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,824
lw r10,820(r14)
add r10,r14,r10
%set position counter
mul r9,r0,r0
beginCopy1
%move data via register
lw r12,0(r11)
sw 0(r10),r12
%increment registers
addi r11,r11,4
addi r10,r10,4
addi r9,r9,4
%branch out if done
subi r8,r9,4
bnz r8,beginCopy1

endCopy1
% end assignment 
gowhile1
% begin generating indice offseting
addi r8,r0,1
addi r12,r0,0
sw 828(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,804
lw r11,828(r14)
 add r12,r12,r11
sw 832(r14),r12
% end var offset calculation
% begin intlit storeage
addi r11,r0,10
sw 836(r14), r11
% done intlit storeage
% begin RELOP op 
lw r10,832(r14)
add r10,r14,r10
lw r11,0(r10)
lw r12,836(r14)
cne r8,r11,r12
sw 840(r14),r8
% end relop op 
lw r9,840(r14)
bz r9,endwhile1
% begin generating indice offseting
addi r10,r0,1
addi r8,r0,0
sw 844(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,808
lw r12,844(r14)
 add r8,r8,r12
sw 848(r14),r8
% end var offset calculation
% begin intlit storeage
addi r12,r0,0
sw 852(r14), r12
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r7,r0,4
bz r7,endCopy2

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,852
lw r12,848(r14)
add r12,r14,r12
%set position counter
mul r11,r0,r0
beginCopy2
%move data via register
lw r10,0(r8)
sw 0(r12),r10
%increment registers
addi r8,r8,4
addi r12,r12,4
addi r11,r11,4
%branch out if done
subi r7,r11,4
bnz r7,beginCopy2

endCopy2
% end assignment 
gowhile2
% begin generating indice offseting
addi r7,r0,1
addi r10,r0,0
sw 856(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,808
lw r8,856(r14)
 add r10,r10,r8
sw 860(r14),r10
% end var offset calculation
% begin intlit storeage
addi r8,r0,10
sw 864(r14), r8
% done intlit storeage
% begin RELOP op 
lw r12,860(r14)
add r12,r14,r12
lw r8,0(r12)
lw r10,864(r14)
cne r7,r8,r10
sw 868(r14),r7
% end relop op 
lw r11,868(r14)
bz r11,endwhile2
% begin generating indice offseting
addi r12,r0,1
addi r7,r0,0
sw 872(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r7,r0,804
lw r10,872(r14)
 add r7,r7,r10
sw 876(r14),r7
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r7,r0,0
sw 880(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r7,r0,808
lw r12,880(r14)
 add r7,r7,r12
sw 884(r14),r7
% end var offset calculation
% begin generating indice offseting
addi r12,r0,1
addi r7,r0,0
lw r10,884(r14)
add r10,r14,r10
lw r10,0(r10)
muli r8,r12,4
mul r8,r10,r8
add r7,r7,r8
lw r10,876(r14)
add r10,r14,r10
lw r10,0(r10)
muli r8,r12,4
mul r8,r10,r8
muli r8,r8,10
add r7,r7,r8
sw 888(r14),r7
% done generating indice offseting
% begin var offset calculation
addi r7,r0,404
lw r10,888(r14)
 add r7,r7,r10
sw 892(r14),r7
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r7,r0,0
sw 896(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r7,r0,808
lw r12,896(r14)
 add r7,r7,r12
sw 900(r14),r7
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r6,r0,4
bz r6,endCopy3

%set left and right ptrs
%set ptr
lw r7,900(r14)
add r7,r14,r7
lw r12,892(r14)
add r12,r14,r12
%set position counter
mul r8,r0,r0
beginCopy3
%move data via register
lw r10,0(r7)
sw 0(r12),r10
%increment registers
addi r7,r7,4
addi r12,r12,4
addi r8,r8,4
%branch out if done
subi r6,r8,4
bnz r6,beginCopy3

endCopy3
% end assignment 
% begin generating indice offseting
addi r8,r0,1
addi r6,r0,0
sw 904(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r6,r0,808
lw r10,904(r14)
 add r6,r6,r10
sw 908(r14),r6
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r6,r0,0
sw 912(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r6,r0,808
lw r8,912(r14)
 add r6,r6,r8
sw 916(r14),r6
% end var offset calculation
% begin intlit storeage
addi r8,r0,1
sw 920(r14), r8
% done intlit storeage
% begin add op 
lw r7,916(r14)
add r7,r14,r7
lw r8,0(r7)
lw r6,920(r14)
add r10,r8,r6
sw 924(r14),r10
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy4

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,924
lw r7,908(r14)
add r7,r14,r7
%set position counter
mul r8,r0,r0
beginCopy4
%move data via register
lw r6,0(r10)
sw 0(r7),r6
%increment registers
addi r10,r10,4
addi r7,r7,4
addi r8,r8,4
%branch out if done
subi r12,r8,4
bnz r12,beginCopy4

endCopy4
% end assignment 
j gowhile2
endwhile2
% begin generating indice offseting
addi r11,r0,1
addi r8,r0,0
sw 928(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,804
lw r12,928(r14)
 add r8,r8,r12
sw 932(r14),r8
% end var offset calculation
% begin generating indice offseting
addi r12,r0,1
addi r8,r0,0
sw 936(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,804
lw r11,936(r14)
 add r8,r8,r11
sw 940(r14),r8
% end var offset calculation
% begin intlit storeage
addi r11,r0,1
sw 944(r14), r11
% done intlit storeage
% begin add op 
lw r6,940(r14)
add r6,r14,r6
lw r11,0(r6)
lw r8,944(r14)
add r12,r11,r8
sw 948(r14),r12
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy5

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,948
lw r6,932(r14)
add r6,r14,r6
%set position counter
mul r11,r0,r0
beginCopy5
%move data via register
lw r8,0(r12)
sw 0(r6),r8
%increment registers
addi r12,r12,4
addi r6,r6,4
addi r11,r11,4
%branch out if done
subi r10,r11,4
bnz r10,beginCopy5

endCopy5
% end assignment 
j gowhile1
endwhile1
% begin intlit storeage
addi r9,r0,10
sw 952(r14), r9
% done intlit storeage
% begin generating indice offseting
addi r9,r0,1
addi r11,r0,0
sw 968(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,804
lw r10,968(r14)
 add r11,r11,r10
sw 972(r14),r11
% end var offset calculation
% begin intlit storeage
addi r10,r0,0
sw 976(r14), r10
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy6

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,976
lw r10,972(r14)
add r10,r14,r10
%set position counter
mul r8,r0,r0
beginCopy6
%move data via register
lw r9,0(r11)
sw 0(r10),r9
%increment registers
addi r11,r11,4
addi r10,r10,4
addi r8,r8,4
%branch out if done
subi r12,r8,4
bnz r12,beginCopy6

endCopy6
% end assignment 
% begin generating indice offseting
addi r8,r0,1
addi r12,r0,0
sw 980(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,812
lw r9,980(r14)
 add r12,r12,r9
sw 984(r14),r12
% end var offset calculation
% begin intlit storeage
addi r9,r0,1
sw 988(r14), r9
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy7

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,988
lw r9,984(r14)
add r9,r14,r9
%set position counter
mul r11,r0,r0
beginCopy7
%move data via register
lw r8,0(r12)
sw 0(r9),r8
%increment registers
addi r12,r12,4
addi r9,r9,4
addi r11,r11,4
%branch out if done
subi r10,r11,4
bnz r10,beginCopy7

endCopy7
% end assignment 
gowhile3
% begin generating indice offseting
addi r10,r0,1
addi r8,r0,0
sw 992(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,804
lw r12,992(r14)
 add r8,r8,r12
sw 996(r14),r8
% end var offset calculation
% begin intlit storeage
addi r12,r0,10
sw 1000(r14), r12
% done intlit storeage
% begin RELOP op 
lw r9,996(r14)
add r9,r14,r9
lw r12,0(r9)
lw r8,1000(r14)
cne r10,r12,r8
sw 1004(r14),r10
% end relop op 
lw r11,1004(r14)
bz r11,endwhile3
% begin generating indice offseting
addi r9,r0,1
addi r10,r0,0
sw 1008(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,808
lw r8,1008(r14)
 add r10,r10,r8
sw 1012(r14),r10
% end var offset calculation
% begin intlit storeage
addi r8,r0,0
sw 1016(r14), r8
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r6,r0,4
bz r6,endCopy8

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,1016
lw r8,1012(r14)
add r8,r14,r8
%set position counter
mul r12,r0,r0
beginCopy8
%move data via register
lw r9,0(r10)
sw 0(r8),r9
%increment registers
addi r10,r10,4
addi r8,r8,4
addi r12,r12,4
%branch out if done
subi r6,r12,4
bnz r6,beginCopy8

endCopy8
% end assignment 
gowhile4
% begin generating indice offseting
addi r6,r0,1
addi r9,r0,0
sw 1020(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,808
lw r10,1020(r14)
 add r9,r9,r10
sw 1024(r14),r9
% end var offset calculation
% begin intlit storeage
addi r10,r0,10
sw 1028(r14), r10
% done intlit storeage
% begin RELOP op 
lw r8,1024(r14)
add r8,r14,r8
lw r10,0(r8)
lw r9,1028(r14)
cne r6,r10,r9
sw 1032(r14),r6
% end relop op 
lw r12,1032(r14)
bz r12,endwhile4
% begin generating indice offseting
addi r8,r0,1
addi r6,r0,0
sw 1036(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r6,r0,804
lw r9,1036(r14)
 add r6,r6,r9
sw 1040(r14),r6
% end var offset calculation
% begin generating indice offseting
addi r9,r0,1
addi r6,r0,0
sw 1044(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r6,r0,808
lw r8,1044(r14)
 add r6,r6,r8
sw 1048(r14),r6
% end var offset calculation
% begin generating indice offseting
addi r8,r0,1
addi r6,r0,0
lw r9,1048(r14)
add r9,r14,r9
lw r9,0(r9)
muli r10,r8,4
mul r10,r9,r10
add r6,r6,r10
lw r9,1040(r14)
add r9,r14,r9
lw r9,0(r9)
muli r10,r8,4
mul r10,r9,r10
muli r10,r10,10
add r6,r6,r10
sw 1052(r14),r6
% done generating indice offseting
% begin var offset calculation
addi r6,r0,404
lw r9,1052(r14)
 add r6,r6,r9
sw 1056(r14),r6
% end var offset calculation
% begin generating indice offseting
addi r9,r0,1
addi r6,r0,0
sw 1060(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r6,r0,804
lw r8,1060(r14)
 add r6,r6,r8
sw 1064(r14),r6
% end var offset calculation
% begin generating indice offseting
addi r8,r0,1
addi r6,r0,0
sw 1068(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r6,r0,808
lw r9,1068(r14)
 add r6,r6,r9
sw 1072(r14),r6
% end var offset calculation
% begin generating indice offseting
addi r9,r0,1
addi r6,r0,0
lw r8,1072(r14)
add r8,r14,r8
lw r8,0(r8)
muli r10,r9,4
mul r10,r8,r10
add r6,r6,r10
lw r8,1064(r14)
add r8,r14,r8
lw r8,0(r8)
muli r10,r9,4
mul r10,r8,r10
muli r10,r10,10
add r6,r6,r10
sw 1076(r14),r6
% done generating indice offseting
% begin var offset calculation
addi r6,r0,404
lw r8,1076(r14)
 add r6,r6,r8
sw 1080(r14),r6
% end var offset calculation
% begin intlit storeage
addi r8,r0,10
sw 1084(r14), r8
% done intlit storeage
% begin generating indice offseting
addi r8,r0,1
addi r6,r0,0
sw 1088(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r6,r0,804
lw r9,1088(r14)
 add r6,r6,r9
sw 1092(r14),r6
% end var offset calculation
% begin mult op 
lw r9,1084(r14)
lw r10,1092(r14)
add r10,r14,r10
lw r6,0(r10)
mul r8,r9,r6
sw 1096(r14),r8
% end mult op 
% begin add op 
lw r9,1080(r14)
add r9,r14,r9
lw r10,0(r9)
lw r8,1096(r14)
add r6,r10,r8
sw 1100(r14),r6
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r7,r0,4
bz r7,endCopy9

%set left and right ptrs
%read direct value
add r6,r0,r14
addi r6,r6,1100
lw r9,1056(r14)
add r9,r14,r9
%set position counter
mul r10,r0,r0
beginCopy9
%move data via register
lw r8,0(r6)
sw 0(r9),r8
%increment registers
addi r6,r6,4
addi r9,r9,4
addi r10,r10,4
%branch out if done
subi r7,r10,4
bnz r7,beginCopy9

endCopy9
% end assignment 
% begin generating indice offseting
addi r10,r0,1
addi r7,r0,0
sw 1104(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r7,r0,808
lw r8,1104(r14)
 add r7,r7,r8
sw 1108(r14),r7
% end var offset calculation
% begin generating indice offseting
addi r8,r0,1
addi r7,r0,0
sw 1112(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r7,r0,808
lw r10,1112(r14)
 add r7,r7,r10
sw 1116(r14),r7
% end var offset calculation
% begin intlit storeage
addi r10,r0,1
sw 1120(r14), r10
% done intlit storeage
% begin add op 
lw r6,1116(r14)
add r6,r14,r6
lw r10,0(r6)
lw r7,1120(r14)
add r8,r10,r7
sw 1124(r14),r8
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy10

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,1124
lw r6,1108(r14)
add r6,r14,r6
%set position counter
mul r10,r0,r0
beginCopy10
%move data via register
lw r7,0(r8)
sw 0(r6),r7
%increment registers
addi r8,r8,4
addi r6,r6,4
addi r10,r10,4
%branch out if done
subi r9,r10,4
bnz r9,beginCopy10

endCopy10
% end assignment 
j gowhile4
endwhile4
% begin generating indice offseting
addi r12,r0,1
addi r10,r0,0
sw 1128(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,804
lw r9,1128(r14)
 add r10,r10,r9
sw 1132(r14),r10
% end var offset calculation
% begin generating indice offseting
addi r9,r0,1
addi r10,r0,0
sw 1136(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,804
lw r12,1136(r14)
 add r10,r10,r12
sw 1140(r14),r10
% end var offset calculation
% begin intlit storeage
addi r12,r0,1
sw 1144(r14), r12
% done intlit storeage
% begin add op 
lw r7,1140(r14)
add r7,r14,r7
lw r12,0(r7)
lw r10,1144(r14)
add r9,r12,r10
sw 1148(r14),r9
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy11

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,1148
lw r7,1132(r14)
add r7,r14,r7
%set position counter
mul r12,r0,r0
beginCopy11
%move data via register
lw r10,0(r9)
sw 0(r7),r10
%increment registers
addi r9,r9,4
addi r7,r7,4
addi r12,r12,4
%branch out if done
subi r8,r12,4
bnz r8,beginCopy11

endCopy11
% end assignment 
j gowhile3
endwhile3
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 1152(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,804
lw r8,1152(r14)
 add r12,r12,r8
sw 1156(r14),r12
% end var offset calculation
% begin intlit storeage
addi r8,r0,0
sw 1160(r14), r8
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy12

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,1160
lw r8,1156(r14)
add r8,r14,r8
%set position counter
mul r10,r0,r0
beginCopy12
%move data via register
lw r11,0(r12)
sw 0(r8),r11
%increment registers
addi r12,r12,4
addi r8,r8,4
addi r10,r10,4
%branch out if done
subi r9,r10,4
bnz r9,beginCopy12

endCopy12
% end assignment 
gowhile5
% begin generating indice offseting
addi r9,r0,1
addi r11,r0,0
sw 1164(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,804
lw r12,1164(r14)
 add r11,r11,r12
sw 1168(r14),r11
% end var offset calculation
% begin intlit storeage
addi r12,r0,10
sw 1172(r14), r12
% done intlit storeage
% begin RELOP op 
lw r8,1168(r14)
add r8,r14,r8
lw r12,0(r8)
lw r11,1172(r14)
cne r9,r12,r11
sw 1176(r14),r9
% end relop op 
lw r10,1176(r14)
bz r10,endwhile5
% begin generating indice offseting
addi r8,r0,1
addi r9,r0,0
sw 1180(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,808
lw r11,1180(r14)
 add r9,r9,r11
sw 1184(r14),r9
% end var offset calculation
% begin intlit storeage
addi r11,r0,0
sw 1188(r14), r11
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r7,r0,4
bz r7,endCopy13

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,1188
lw r11,1184(r14)
add r11,r14,r11
%set position counter
mul r12,r0,r0
beginCopy13
%move data via register
lw r8,0(r9)
sw 0(r11),r8
%increment registers
addi r9,r9,4
addi r11,r11,4
addi r12,r12,4
%branch out if done
subi r7,r12,4
bnz r7,beginCopy13

endCopy13
% end assignment 
gowhile6
% begin generating indice offseting
addi r7,r0,1
addi r8,r0,0
sw 1192(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,808
lw r9,1192(r14)
 add r8,r8,r9
sw 1196(r14),r8
% end var offset calculation
% begin intlit storeage
addi r9,r0,10
sw 1200(r14), r9
% done intlit storeage
% begin RELOP op 
lw r11,1196(r14)
add r11,r14,r11
lw r9,0(r11)
lw r8,1200(r14)
cne r7,r9,r8
sw 1204(r14),r7
% end relop op 
lw r12,1204(r14)
bz r12,endwhile6
% begin generating indice offseting
addi r11,r0,1
addi r7,r0,0
sw 1208(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r7,r0,804
lw r8,1208(r14)
 add r7,r7,r8
sw 1212(r14),r7
% end var offset calculation
% begin generating indice offseting
addi r8,r0,1
addi r7,r0,0
sw 1216(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r7,r0,808
lw r11,1216(r14)
 add r7,r7,r11
sw 1220(r14),r7
% end var offset calculation
% begin generating indice offseting
addi r11,r0,1
addi r7,r0,0
lw r8,1220(r14)
add r8,r14,r8
lw r8,0(r8)
muli r9,r11,4
mul r9,r8,r9
add r7,r7,r9
lw r8,1212(r14)
add r8,r14,r8
lw r8,0(r8)
muli r9,r11,4
mul r9,r8,r9
muli r9,r9,10
add r7,r7,r9
sw 1224(r14),r7
% done generating indice offseting
% begin var offset calculation
addi r7,r0,404
lw r8,1224(r14)
 add r7,r7,r8
sw 1228(r14),r7
% end var offset calculation
% begin write 
lw r8,1228(r14)
add r8,r14,r8
lw r8,0(r8)
%s move ptr to prevent mem corruption
addi r14,r14,1360
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
addi r14,r14,-1360
% end write
% begin generating indice offseting
addi r8,r0,1
addi r7,r0,0
sw 1232(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r7,r0,808
lw r11,1232(r14)
 add r7,r7,r11
sw 1236(r14),r7
% end var offset calculation
% begin generating indice offseting
addi r11,r0,1
addi r7,r0,0
sw 1240(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r7,r0,808
lw r8,1240(r14)
 add r7,r7,r8
sw 1244(r14),r7
% end var offset calculation
% begin intlit storeage
addi r8,r0,1
sw 1248(r14), r8
% done intlit storeage
% begin add op 
lw r9,1244(r14)
add r9,r14,r9
lw r8,0(r9)
lw r7,1248(r14)
add r11,r8,r7
sw 1252(r14),r11
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r6,r0,4
bz r6,endCopy14

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,1252
lw r9,1236(r14)
add r9,r14,r9
%set position counter
mul r8,r0,r0
beginCopy14
%move data via register
lw r7,0(r11)
sw 0(r9),r7
%increment registers
addi r11,r11,4
addi r9,r9,4
addi r8,r8,4
%branch out if done
subi r6,r8,4
bnz r6,beginCopy14

endCopy14
% end assignment 
j gowhile6
endwhile6
% begin generating indice offseting
addi r12,r0,1
addi r8,r0,0
sw 1256(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,804
lw r6,1256(r14)
 add r8,r8,r6
sw 1260(r14),r8
% end var offset calculation
% begin generating indice offseting
addi r6,r0,1
addi r8,r0,0
sw 1264(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,804
lw r12,1264(r14)
 add r8,r8,r12
sw 1268(r14),r8
% end var offset calculation
% begin intlit storeage
addi r12,r0,1
sw 1272(r14), r12
% done intlit storeage
% begin add op 
lw r7,1268(r14)
add r7,r14,r7
lw r12,0(r7)
lw r8,1272(r14)
add r6,r12,r8
sw 1276(r14),r6
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy15

%set left and right ptrs
%read direct value
add r6,r0,r14
addi r6,r6,1276
lw r7,1260(r14)
add r7,r14,r7
%set position counter
mul r12,r0,r0
beginCopy15
%move data via register
lw r8,0(r6)
sw 0(r7),r8
%increment registers
addi r6,r6,4
addi r7,r7,4
addi r12,r12,4
%branch out if done
subi r11,r12,4
bnz r11,beginCopy15

endCopy15
% end assignment 
j gowhile5
endwhile5
hlt
%funcdef begin
fnside6
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
sw 24(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,20
lw r11,24(r14)
 add r12,r12,r11
sw 28(r14),r12
% end var offset calculation
% begin intlit storeage
addi r11,r0,123
sw 32(r14), r11
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r6,r0,4
bz r6,endCopy16

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,32
lw r11,28(r14)
add r11,r14,r11
%set position counter
mul r8,r0,r0
beginCopy16
%move data via register
lw r10,0(r12)
sw 0(r11),r10
%increment registers
addi r12,r12,4
addi r11,r11,4
addi r8,r8,4
%branch out if done
subi r6,r8,4
bnz r6,beginCopy16

endCopy16
% end assignment 
% begin generating indice offseting
addi r8,r0,1
addi r6,r0,0
sw 36(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r6,r0,20
lw r10,36(r14)
 add r6,r6,r10
sw 40(r14),r6
% end var offset calculation
% begin write 
lw r10,40(r14)
add r10,r14,r10
lw r10,0(r10)
%s move ptr to prevent mem corruption
addi r14,r14,124
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
addi r14,r14,-124
% end write
%funcdef end
