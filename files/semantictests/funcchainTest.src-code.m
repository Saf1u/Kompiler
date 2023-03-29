entry
muli r0,r0,0
muli r14,r0,0
addi r14,r0,stackbase
%r14 is stack ptr, stack grows downwards or upwards
%24kb stack
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
sw 12(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r10,12(r14)
 add r11,r11,r10
sw 16(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
sw 20(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r12,20(r14)
 add r11,r11,r12
sw 24(r14),r11
% end var offset calculation
%begin dot offsetting
addi r12,r0,24
sw 28(r14),r12
%end dot offsetting
%check if size is zero if yes, leave
addi r8,r0,0
bz r8,endCopy1

%set left and right ptrs
%set ptr
lw r11,28(r14)
add r11,r14,r11
addi r11,r11,0
%read direct value
add r12,r0,r14
addi r12,r12,112
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
subi r8,r9,0
bnz r8,beginCopy1

endCopy1
% end copy 
addi r14,r14,108
jl r15, fnmanleg1
subi r14,r14,108
%check if size is zero if yes, leave
addi r12,r0,0
bz r12,endCopy2

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,108
%read direct value
add r9,r0,r14
addi r9,r9,32
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
subi r12,r11,0
bnz r12,beginCopy2

endCopy2
% end copy 
%begin copy back object
%check if size is zero if yes, leave
addi r9,r0,0
bz r9,endCopy3

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,112
%set ptr
lw r11,28(r14)
add r11,r14,r11
addi r11,r11,0
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
subi r9,r8,0
bnz r9,beginCopy3

endCopy3
% end copy 
%begin dot offsetting
addi r8,r0,32
sw 32(r14),r8
%end dot offsetting
%check if size is zero if yes, leave
addi r11,r0,0
bz r11,endCopy4

%set left and right ptrs
%set ptr
lw r9,32(r14)
add r9,r14,r9
addi r9,r9,0
%read direct value
add r8,r0,r14
addi r8,r8,116
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
subi r11,r12,0
bnz r11,beginCopy4

endCopy4
% end copy 
addi r14,r14,108
jl r15, fnlegendwar1
subi r14,r14,108
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy5

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,108
%read direct value
add r12,r0,r14
addi r12,r12,36
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
% end copy 
%begin copy back object
%check if size is zero if yes, leave
addi r12,r0,0
bz r12,endCopy6

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,116
%set ptr
lw r9,32(r14)
add r9,r14,r9
addi r9,r9,0
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
subi r12,r11,0
bnz r12,beginCopy6

endCopy6
% end copy 
%begin dot offsetting
lw r11,36(r14)
addi r11,r11,0
sw 40(r14),r11
%end dot offsetting
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 44(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r10,44(r14)
lw r12,40(r14)
add r12,r12,r10
sw 48(r14),r12
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy7

%set left and right ptrs
%set ptr
lw r12,48(r14)
add r12,r14,r12
lw r10,16(r14)
add r10,r14,r10
%set position counter
mul r8,r0,r0
beginCopy7
%move data via register
lw r11,0(r12)
sw 0(r10),r11
%increment registers
addi r12,r12,4
addi r10,r10,4
addi r8,r8,4
%branch out if done
subi r9,r8,4
bnz r9,beginCopy7

endCopy7
% end assignment 
% begin generating indice offseting
addi r8,r0,1
addi r9,r0,0
sw 52(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,8
lw r11,52(r14)
 add r9,r9,r11
sw 56(r14),r9
% end var offset calculation
% begin generating indice offseting
addi r11,r0,1
addi r9,r0,0
sw 60(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,4
lw r8,60(r14)
 add r9,r9,r8
sw 64(r14),r9
% end var offset calculation
%begin dot offsetting
addi r8,r0,64
sw 68(r14),r8
%end dot offsetting
%check if size is zero if yes, leave
addi r10,r0,0
bz r10,endCopy8

%set left and right ptrs
%set ptr
lw r9,68(r14)
add r9,r14,r9
addi r9,r9,0
%read direct value
add r8,r0,r14
addi r8,r8,112
%set position counter
mul r12,r0,r0
beginCopy8
%move data via register
lw r11,0(r9)
sw 0(r8),r11
%increment registers
addi r9,r9,4
addi r8,r8,4
addi r12,r12,4
%branch out if done
subi r10,r12,0
bnz r10,beginCopy8

endCopy8
% end copy 
addi r14,r14,108
jl r15, fnmanleg1
subi r14,r14,108
%check if size is zero if yes, leave
addi r8,r0,0
bz r8,endCopy9

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,108
%read direct value
add r12,r0,r14
addi r12,r12,72
%set position counter
mul r9,r0,r0
beginCopy9
%move data via register
lw r11,0(r10)
sw 0(r12),r11
%increment registers
addi r10,r10,4
addi r12,r12,4
addi r9,r9,4
%branch out if done
subi r8,r9,0
bnz r8,beginCopy9

endCopy9
% end copy 
%begin copy back object
%check if size is zero if yes, leave
addi r12,r0,0
bz r12,endCopy10

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,112
%set ptr
lw r9,68(r14)
add r9,r14,r9
addi r9,r9,0
%set position counter
mul r10,r0,r0
beginCopy10
%move data via register
lw r11,0(r8)
sw 0(r9),r11
%increment registers
addi r8,r8,4
addi r9,r9,4
addi r10,r10,4
%branch out if done
subi r12,r10,0
bnz r12,beginCopy10

endCopy10
% end copy 
%begin dot offsetting
addi r10,r0,72
sw 72(r14),r10
%end dot offsetting
%check if size is zero if yes, leave
addi r9,r0,0
bz r9,endCopy11

%set left and right ptrs
%set ptr
lw r12,72(r14)
add r12,r14,r12
addi r12,r12,0
%read direct value
add r10,r0,r14
addi r10,r10,116
%set position counter
mul r8,r0,r0
beginCopy11
%move data via register
lw r11,0(r12)
sw 0(r10),r11
%increment registers
addi r12,r12,4
addi r10,r10,4
addi r8,r8,4
%branch out if done
subi r9,r8,0
bnz r9,beginCopy11

endCopy11
% end copy 
addi r14,r14,108
jl r15, fnlegendwar1
subi r14,r14,108
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy12

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,108
%read direct value
add r8,r0,r14
addi r8,r8,76
%set position counter
mul r12,r0,r0
beginCopy12
%move data via register
lw r11,0(r9)
sw 0(r8),r11
%increment registers
addi r9,r9,4
addi r8,r8,4
addi r12,r12,4
%branch out if done
subi r10,r12,4
bnz r10,beginCopy12

endCopy12
% end copy 
%begin copy back object
%check if size is zero if yes, leave
addi r8,r0,0
bz r8,endCopy13

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,116
%set ptr
lw r12,72(r14)
add r12,r14,r12
addi r12,r12,0
%set position counter
mul r9,r0,r0
beginCopy13
%move data via register
lw r11,0(r10)
sw 0(r12),r11
%increment registers
addi r10,r10,4
addi r12,r12,4
addi r9,r9,4
%branch out if done
subi r8,r9,0
bnz r8,beginCopy13

endCopy13
% end copy 
% begin assignment 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy14

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,76
lw r9,56(r14)
add r9,r14,r9
%set position counter
mul r10,r0,r0
beginCopy14
%move data via register
lw r11,0(r8)
sw 0(r9),r11
%increment registers
addi r8,r8,4
addi r9,r9,4
addi r10,r10,4
%branch out if done
subi r12,r10,4
bnz r12,beginCopy14

endCopy14
% end assignment 
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
sw 80(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,8
lw r11,80(r14)
 add r12,r12,r11
sw 84(r14),r12
% end var offset calculation
%begin dot offsetting
lw r11,84(r14)
addi r11,r11,0
sw 88(r14),r11
%end dot offsetting
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 92(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r10,92(r14)
lw r12,88(r14)
add r12,r12,r10
sw 96(r14),r12
% end var offset calculation
% begin write 
lw r10,96(r14)
add r10,r14,r10
lw r10,0(r10)
%s move ptr to prevent mem corruption
addi r14,r14,188
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
addi r14,r14,-188
% end write
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
sw 100(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r11,100(r14)
 add r12,r12,r11
sw 104(r14),r12
% end var offset calculation
% begin write 
lw r11,104(r14)
add r11,r14,r11
lw r11,0(r11)
%s move ptr to prevent mem corruption
addi r14,r14,188
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
addi r14,r14,-188
% end write
hlt
%funcdef begin
fnmanleg1
sw 0(r14),r15
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 4(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r10,4(r14)
 add r12,r12,r10
sw 8(r14),r12
% end var offset calculation
%check if size is zero if yes, leave
addi r9,r0,0
bz r9,endCopy15

%set left and right ptrs
%set ptr
lw r12,8(r14)
add r12,r14,r12
addi r12,r12,0
%read direct value
add r10,r0,r14
addi r10,r10,0
%set position counter
mul r8,r0,r0
beginCopy15
%move data via register
lw r11,0(r12)
sw 0(r10),r11
%increment registers
addi r12,r12,4
addi r10,r10,4
addi r8,r8,4
%branch out if done
subi r9,r8,0
bnz r9,beginCopy15

endCopy15
% end copy 
lw r15,0(r14)
jr r15 
%funcdef end
%funcdef begin
fnwarriorgetZ1
sw 4(r14),r15
% begin generating indice offseting
addi r8,r0,1
addi r9,r0,0
sw 12(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,8
lw r11,12(r14)
 add r9,r9,r11
sw 16(r14),r9
% end var offset calculation
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy16

%set left and right ptrs
%set ptr
lw r9,16(r14)
add r9,r14,r9
addi r9,r9,0
%read direct value
add r11,r0,r14
addi r11,r11,0
%set position counter
mul r12,r0,r0
beginCopy16
%move data via register
lw r8,0(r9)
sw 0(r11),r8
%increment registers
addi r9,r9,4
addi r11,r11,4
addi r12,r12,4
%branch out if done
subi r10,r12,4
bnz r10,beginCopy16

endCopy16
% end copy 
lw r15,4(r14)
jr r15 
%funcdef end
%funcdef begin
fnlegendwar1
sw 4(r14),r15
% begin generating indice offseting
addi r12,r0,1
addi r10,r0,0
sw 12(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r10,r0,8
lw r8,12(r14)
 add r10,r10,r8
sw 16(r14),r10
% end var offset calculation
%begin dot offsetting
lw r8,16(r14)
addi r8,r8,0
sw 20(r14),r8
%end dot offsetting
% begin generating indice offseting
addi r8,r0,1
addi r10,r0,0
sw 24(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r12,24(r14)
lw r10,20(r14)
add r10,r10,r12
sw 28(r14),r10
% end var offset calculation
% begin intlit storeage
addi r12,r0,212
sw 32(r14), r12
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy17

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,32
lw r12,28(r14)
add r12,r14,r12
%set position counter
mul r9,r0,r0
beginCopy17
%move data via register
lw r8,0(r10)
sw 0(r12),r8
%increment registers
addi r10,r10,4
addi r12,r12,4
addi r9,r9,4
%branch out if done
subi r11,r9,4
bnz r11,beginCopy17

endCopy17
% end assignment 
% begin generating indice offseting
addi r9,r0,1
addi r11,r0,0
sw 36(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,8
lw r8,36(r14)
 add r11,r11,r8
sw 40(r14),r11
% end var offset calculation
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy18

%set left and right ptrs
%set ptr
lw r11,40(r14)
add r11,r14,r11
addi r11,r11,0
%read direct value
add r8,r0,r14
addi r8,r8,0
%set position counter
mul r10,r0,r0
beginCopy18
%move data via register
lw r9,0(r11)
sw 0(r8),r9
%increment registers
addi r11,r11,4
addi r8,r8,4
addi r10,r10,4
%branch out if done
subi r12,r10,4
bnz r12,beginCopy18

endCopy18
% end copy 
lw r15,4(r14)
jr r15 
%funcdef end
