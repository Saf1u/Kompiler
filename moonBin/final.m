entry
muli r0,r0,0
muli r14,r0,0
addi r14,r0,stackbase
%r14 is stack ptr, stack grows downwards
addi r14,r14,2048
%24kb stack
% begin intlit storeage
addi r12,r0,0
sw literal0(r0), r12
% done intlit storeage
% begin generating indice offseting
addi r12,r0,0
% done generating indice offseting
% begin var offset calculation
addi r11,r12,new_functionhumanconstructorintegerinteger
sw offset0(r0),r11
% end var offset calculation
hlt
                     res     4
                     res     4
zmaininteger[10]     res     4
abcmaininteger[10]   res     40
pbcmaininteger[10]   res     4
literal0             res     4
                     res     24
                     res     4
new_functionhumanconstructorintegerinteger res     24
offset0              res     4
buffer               res     200
stackbase            res     2048
newline              db      ,13,10,0
