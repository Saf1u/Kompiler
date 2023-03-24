entry
muli r0,r0,0
muli r14,r0,0
addi r14,r0,stackbase
%r14 is stack ptr, stack grows downwards
addi r14,r14,2048
%24kb stack
% begin generating indice offseting
addi r11,r0,0
% done generating indice offseting
% begin var offset calculation
addi r10,r11,anObjectmain
sw offset0(r0),r10
% end var offset calculation
% begin generating indice offseting
addi r11,r0,0
% done generating indice offseting
% begin var offset calculation
addi r10,r11,offset1
sw offset2(r0),r10
% end var offset calculation
hlt
anObjectmain         res     536
offset0              res     4
offset1              res     4
offset2              res     4
buffer               res     200
stackbase            res     2048
newline              db      ,13,10,0
