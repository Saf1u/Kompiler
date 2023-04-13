entry
muli r0,r0,0
muli r14,r0,0
addi r14,r0,stackbase
%r14 is stack ptr, stack grows downwards or upwards
%24kb stack
% begin intlit storeage
addi r12,r0,1
sw 1628(r14), r12
% done intlit storeage
% begin generating indice offseting
addi r12,r0,1
addi r11,r0,0
lw r10,1628(r14)
muli r9,r12,540
mul r9,r10,r9
add r11,r11,r9
sw 1632(r14),r11
% done generating indice offseting
% begin var offset calculation
addi r11,r0,544
lw r10,1632(r14)
 add r11,r11,r10
sw 1636(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
sw 1640(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r12,1640(r14)
 add r11,r11,r12
sw 1644(r14),r11
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,540
bz r8,endCopy1

%set left and right ptrs
%set ptr
lw r11,1644(r14)
add r11,r14,r11
lw r12,1636(r14)
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
subi r8,r9,540
bnz r8,beginCopy1

endCopy1
% end assignment 
% begin intlit storeage
addi r9,r0,1
sw 1648(r14), r9
% done intlit storeage
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
lw r10,1648(r14)
muli r11,r9,540
mul r11,r10,r11
add r8,r8,r11
sw 1652(r14),r8
% done generating indice offseting
% begin var offset calculation
addi r8,r0,544
lw r10,1652(r14)
 add r8,r8,r10
sw 1656(r14),r8
% end var offset calculation
%begin dot offsetting
lw r10,1656(r14)
addi r10,r10,0
sw 1660(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,10
sw 1664(r14), r10
% done intlit storeage
%check if size is zero if yes, leave
addi r12,r0,532
bz r12,endCopy2

%set left and right ptrs
%set ptr
lw r8,1660(r14)
add r8,r14,r8
addi r8,r8,4
%read direct value
add r10,r0,r14
addi r10,r10,2008
%set position counter
mul r11,r0,r0
beginCopy2
%move data via register
lw r9,0(r8)
sw 0(r10),r9
%increment registers
addi r8,r8,4
addi r10,r10,4
addi r11,r11,4
%branch out if done
subi r12,r11,532
bnz r12,beginCopy2

endCopy2
% end copy 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy3

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,1664
%read direct value
add r11,r0,r14
addi r11,r11,2540
%set position counter
mul r8,r0,r0
beginCopy3
%move data via register
lw r9,0(r12)
sw 0(r11),r9
%increment registers
addi r12,r12,4
addi r11,r11,4
addi r8,r8,4
%branch out if done
subi r10,r8,4
bnz r10,beginCopy3

endCopy3
% end copy 
addi r14,r14,2004
jl r15, fnvehiclesetTires1
subi r14,r14,2004
%check if size is zero if yes, leave
addi r11,r0,0
bz r11,endCopy4

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,2004
%read direct value
add r8,r0,r14
addi r8,r8,1668
%set position counter
mul r12,r0,r0
beginCopy4
%move data via register
lw r9,0(r10)
sw 0(r8),r9
%increment registers
addi r10,r10,4
addi r8,r8,4
addi r12,r12,4
%branch out if done
subi r11,r12,0
bnz r11,beginCopy4

endCopy4
% end copy 
%begin copy back object
%check if size is zero if yes, leave
addi r8,r0,532
bz r8,endCopy5

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,2008
%set ptr
lw r12,1660(r14)
add r12,r14,r12
addi r12,r12,4
%set position counter
mul r10,r0,r0
beginCopy5
%move data via register
lw r9,0(r11)
sw 0(r12),r9
%increment registers
addi r11,r11,4
addi r12,r12,4
addi r10,r10,4
%branch out if done
subi r8,r10,532
bnz r8,beginCopy5

endCopy5
% end copy 
% begin intlit storeage
addi r10,r0,1
sw 1668(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r8,r0,0
lw r9,1668(r14)
muli r11,r10,540
mul r11,r9,r11
add r8,r8,r11
sw 1672(r14),r8
% done generating indice offseting
% begin var offset calculation
addi r8,r0,544
lw r9,1672(r14)
 add r8,r8,r9
sw 1676(r14),r8
% end var offset calculation
%begin dot offsetting
lw r9,1676(r14)
addi r9,r9,12
sw 1680(r14),r9
%end dot offsetting
% begin intlit storeage
addi r9,r0,200
sw 1684(r14), r9
% done intlit storeage
% begin intlit storeage
addi r9,r0,198
sw 1688(r14), r9
% done intlit storeage
% begin add op 
lw r9,1684(r14)
lw r8,1688(r14)
sub r10,r9,r8
sw 1692(r14),r10
% end add op 
% begin intlit storeage
addi r11,r0,1
sw 1696(r14), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,2
sw 1700(r14), r11
% done intlit storeage
% begin mult op 
lw r11,1696(r14)
lw r10,1700(r14)
mul r8,r11,r10
sw 1704(r14),r8
% end mult op 
% begin add op 
lw r9,1692(r14)
lw r8,1704(r14)
add r10,r9,r8
sw 1708(r14),r10
% end add op 
% begin intlit storeage
addi r11,r0,3
sw 1712(r14), r11
% done intlit storeage
% begin add op 
lw r11,1708(r14)
lw r10,1712(r14)
sub r8,r11,r10
sw 1716(r14),r8
% end add op 
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
lw r10,1716(r14)
muli r11,r9,4
mul r11,r10,r11
add r8,r8,r11
sw 1720(r14),r8
% done generating indice offseting
% begin var offset calculation
lw r10,1720(r14)
lw r8,1680(r14)
add r8,r8,r10
sw 1724(r14),r8
% end var offset calculation
% begin read 
%s move ptr to prevent mem corruption
addi r14,r14,2084
addi r10,r0,buffer
sw -8(r14),r10
jl r15,getstr
jl r15,strint
%s move ptr to og location 
addi r14,r14,-2084
lw r10,1724(r14)
add r10,r14,r10
sw 0(r10),r13
% end read
% begin intlit storeage
addi r10,r0,1
sw 1728(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r8,r0,0
lw r9,1728(r14)
muli r11,r10,540
mul r11,r9,r11
add r8,r8,r11
sw 1732(r14),r8
% done generating indice offseting
% begin var offset calculation
addi r8,r0,544
lw r9,1732(r14)
 add r8,r8,r9
sw 1736(r14),r8
% end var offset calculation
%begin dot offsetting
lw r9,1736(r14)
addi r9,r9,532
sw 1740(r14),r9
%end dot offsetting
% begin intlit storeage
addi r9,r0,0
sw 1744(r14), r9
% done intlit storeage
% begin intlit storeage
addi r9,r0,1
sw 1748(r14), r9
% done intlit storeage
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
lw r10,1748(r14)
muli r11,r9,4
mul r11,r10,r11
add r8,r8,r11
lw r10,1744(r14)
muli r11,r9,4
mul r11,r10,r11
muli r11,r11,1
add r8,r8,r11
sw 1752(r14),r8
% done generating indice offseting
% begin var offset calculation
lw r10,1752(r14)
lw r8,1740(r14)
add r8,r8,r10
sw 1756(r14),r8
% end var offset calculation
% begin read 
%s move ptr to prevent mem corruption
addi r14,r14,2084
addi r10,r0,buffer
sw -8(r14),r10
jl r15,getstr
jl r15,strint
%s move ptr to og location 
addi r14,r14,-2084
lw r10,1756(r14)
add r10,r14,r10
sw 0(r10),r13
% end read
% begin intlit storeage
addi r10,r0,1
sw 1760(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r8,r0,0
lw r9,1760(r14)
muli r11,r10,540
mul r11,r9,r11
add r8,r8,r11
sw 1764(r14),r8
% done generating indice offseting
% begin var offset calculation
addi r8,r0,544
lw r9,1764(r14)
 add r8,r8,r9
sw 1768(r14),r8
% end var offset calculation
%begin dot offsetting
lw r9,1768(r14)
addi r9,r9,0
sw 1772(r14),r9
%end dot offsetting
%check if size is zero if yes, leave
addi r12,r0,532
bz r12,endCopy6

%set left and right ptrs
%set ptr
lw r8,1772(r14)
add r8,r14,r8
addi r8,r8,4
%read direct value
add r9,r0,r14
addi r9,r9,2012
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
subi r12,r11,532
bnz r12,beginCopy6

endCopy6
% end copy 
addi r14,r14,2004
jl r15, fnvehiclegetTires1
subi r14,r14,2004
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy7

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,2004
%read direct value
add r11,r0,r14
addi r11,r11,1776
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
%begin copy back object
%check if size is zero if yes, leave
addi r11,r0,532
bz r11,endCopy8

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,2012
%set ptr
lw r8,1772(r14)
add r8,r14,r8
addi r8,r8,4
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
subi r11,r12,532
bnz r11,beginCopy8

endCopy8
% end copy 
% begin write 
lw r12,1776(r14)
%s move ptr to prevent mem corruption
addi r14,r14,2084
sw -8(r14),r12
addi r12,r0,buffer
sw -12(r14),r12
jl r15,intstr
sw -8(r14),r13
jl r15,putstr
addi r12,r0,newline
sw -8(r14),r12
jl r15,putstr
%s move ptr to og location 
addi r14,r14,-2084
% end write
% begin intlit storeage
addi r12,r0,10
sw 1780(r14), r12
% done intlit storeage
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy9

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,1780
%read direct value
add r12,r0,r14
addi r12,r12,2012
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
addi r14,r14,2004
jl r15, fncomplexArithmetic1
subi r14,r14,2004
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy10

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,2004
%read direct value
add r9,r0,r14
addi r9,r9,1784
%set position counter
mul r11,r0,r0
beginCopy10
%move data via register
lw r10,0(r8)
sw 0(r9),r10
%increment registers
addi r8,r8,4
addi r9,r9,4
addi r11,r11,4
%branch out if done
subi r12,r11,4
bnz r12,beginCopy10

endCopy10
% end copy 
% begin intlit storeage
addi r11,r0,200
sw 1788(r14), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,2
sw 1792(r14), r11
% done intlit storeage
% begin mult op 
lw r11,1788(r14)
lw r12,1792(r14)
div r10,r11,r12
sw 1796(r14),r10
% end mult op 
% begin add op 
lw r8,1784(r14)
lw r10,1796(r14)
add r12,r8,r10
sw 1800(r14),r12
% end add op 
% begin intlit storeage
addi r11,r0,1
sw 1804(r14), r11
% done intlit storeage
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
lw r10,1804(r14)
muli r8,r11,540
mul r8,r10,r8
add r12,r12,r8
sw 1808(r14),r12
% done generating indice offseting
% begin var offset calculation
addi r12,r0,544
lw r10,1808(r14)
 add r12,r12,r10
sw 1812(r14),r12
% end var offset calculation
%begin dot offsetting
lw r10,1812(r14)
addi r10,r10,12
sw 1816(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,1
sw 1820(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
lw r11,1820(r14)
muli r8,r10,4
mul r8,r11,r8
add r12,r12,r8
sw 1824(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r11,1824(r14)
lw r12,1816(r14)
add r12,r12,r11
sw 1828(r14),r12
% end var offset calculation
% begin add op 
lw r11,1800(r14)
lw r8,1828(r14)
add r8,r14,r8
lw r12,0(r8)
add r10,r11,r12
sw 1832(r14),r10
% end add op 
% begin intlit storeage
addi r8,r0,1
sw 1836(r14), r8
% done intlit storeage
% begin generating indice offseting
addi r8,r0,1
addi r10,r0,0
lw r12,1836(r14)
muli r11,r8,540
mul r11,r12,r11
add r10,r10,r11
sw 1840(r14),r10
% done generating indice offseting
% begin var offset calculation
addi r10,r0,544
lw r12,1840(r14)
 add r10,r10,r12
sw 1844(r14),r10
% end var offset calculation
%begin dot offsetting
lw r12,1844(r14)
addi r12,r12,532
sw 1848(r14),r12
%end dot offsetting
% begin intlit storeage
addi r12,r0,0
sw 1852(r14), r12
% done intlit storeage
% begin intlit storeage
addi r12,r0,1
sw 1856(r14), r12
% done intlit storeage
% begin generating indice offseting
addi r12,r0,1
addi r10,r0,0
lw r8,1856(r14)
muli r11,r12,4
mul r11,r8,r11
add r10,r10,r11
lw r8,1852(r14)
muli r11,r12,4
mul r11,r8,r11
muli r11,r11,1
add r10,r10,r11
sw 1860(r14),r10
% done generating indice offseting
% begin var offset calculation
lw r8,1860(r14)
lw r10,1848(r14)
add r10,r10,r8
sw 1864(r14),r10
% end var offset calculation
% begin add op 
lw r8,1832(r14)
lw r11,1864(r14)
add r11,r14,r11
lw r10,0(r11)
add r12,r8,r10
sw 1868(r14),r12
% end add op 
% begin write 
lw r11,1868(r14)
%s move ptr to prevent mem corruption
addi r14,r14,2084
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
addi r14,r14,-2084
% end write
% begin intlit storeage
addi r11,r0,1
sw 1872(r14), r11
% done intlit storeage
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
lw r10,1872(r14)
muli r8,r11,540
mul r8,r10,r8
add r12,r12,r8
sw 1876(r14),r12
% done generating indice offseting
% begin var offset calculation
addi r12,r0,544
lw r10,1876(r14)
 add r12,r12,r10
sw 1880(r14),r12
% end var offset calculation
%begin dot offsetting
lw r10,1880(r14)
addi r10,r10,32
sw 1884(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,0
sw 1888(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
lw r11,1888(r14)
muli r8,r10,500
mul r8,r11,r8
add r12,r12,r8
sw 1892(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r11,1892(r14)
lw r12,1884(r14)
add r12,r12,r11
sw 1896(r14),r12
% end var offset calculation
%begin dot offsetting
lw r11,1896(r14)
addi r11,r11,0
sw 1900(r14),r11
%end dot offsetting
% begin intlit storeage
addi r11,r0,1
sw 1904(r14), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,2
sw 1908(r14), r11
% done intlit storeage
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
lw r10,1908(r14)
muli r8,r11,20
mul r8,r10,r8
add r12,r12,r8
lw r10,1904(r14)
muli r8,r11,20
mul r8,r10,r8
muli r8,r8,5
add r12,r12,r8
sw 1912(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r10,1912(r14)
lw r12,1900(r14)
add r12,r12,r10
sw 1916(r14),r12
% end var offset calculation
%begin dot offsetting
lw r10,1916(r14)
addi r10,r10,0
sw 1920(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,0
sw 1924(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r12,r0,0
lw r11,1924(r14)
muli r8,r10,4
mul r8,r11,r8
add r12,r12,r8
sw 1928(r14),r12
% done generating indice offseting
% begin var offset calculation
lw r11,1928(r14)
lw r12,1920(r14)
add r12,r12,r11
sw 1932(r14),r12
% end var offset calculation
% begin intlit storeage
addi r11,r0,101
sw 1936(r14), r11
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy11

%set left and right ptrs
%read direct value
add r12,r0,r14
addi r12,r12,1936
lw r11,1932(r14)
add r11,r14,r11
%set position counter
mul r8,r0,r0
beginCopy11
%move data via register
lw r10,0(r12)
sw 0(r11),r10
%increment registers
addi r12,r12,4
addi r11,r11,4
addi r8,r8,4
%branch out if done
subi r9,r8,4
bnz r9,beginCopy11

endCopy11
% end assignment 
% begin intlit storeage
addi r8,r0,1
sw 1940(r14), r8
% done intlit storeage
% begin generating indice offseting
addi r8,r0,1
addi r9,r0,0
lw r10,1940(r14)
muli r12,r8,540
mul r12,r10,r12
add r9,r9,r12
sw 1944(r14),r9
% done generating indice offseting
% begin var offset calculation
addi r9,r0,544
lw r10,1944(r14)
 add r9,r9,r10
sw 1948(r14),r9
% end var offset calculation
%begin dot offsetting
lw r10,1948(r14)
addi r10,r10,32
sw 1952(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,0
sw 1956(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
lw r8,1956(r14)
muli r12,r10,500
mul r12,r8,r12
add r9,r9,r12
sw 1960(r14),r9
% done generating indice offseting
% begin var offset calculation
lw r8,1960(r14)
lw r9,1952(r14)
add r9,r9,r8
sw 1964(r14),r9
% end var offset calculation
%begin dot offsetting
lw r8,1964(r14)
addi r8,r8,0
sw 1968(r14),r8
%end dot offsetting
% begin intlit storeage
addi r8,r0,1
sw 1972(r14), r8
% done intlit storeage
% begin intlit storeage
addi r8,r0,2
sw 1976(r14), r8
% done intlit storeage
% begin generating indice offseting
addi r8,r0,1
addi r9,r0,0
lw r10,1976(r14)
muli r12,r8,20
mul r12,r10,r12
add r9,r9,r12
lw r10,1972(r14)
muli r12,r8,20
mul r12,r10,r12
muli r12,r12,5
add r9,r9,r12
sw 1980(r14),r9
% done generating indice offseting
% begin var offset calculation
lw r10,1980(r14)
lw r9,1968(r14)
add r9,r9,r10
sw 1984(r14),r9
% end var offset calculation
%begin dot offsetting
lw r10,1984(r14)
addi r10,r10,0
sw 1988(r14),r10
%end dot offsetting
% begin intlit storeage
addi r10,r0,0
sw 1992(r14), r10
% done intlit storeage
% begin generating indice offseting
addi r10,r0,1
addi r9,r0,0
lw r8,1992(r14)
muli r12,r10,4
mul r12,r8,r12
add r9,r9,r12
sw 1996(r14),r9
% done generating indice offseting
% begin var offset calculation
lw r8,1996(r14)
lw r9,1988(r14)
add r9,r9,r8
sw 2000(r14),r9
% end var offset calculation
% begin write 
lw r8,2000(r14)
add r8,r14,r8
lw r8,0(r8)
%s move ptr to prevent mem corruption
addi r14,r14,2084
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
addi r14,r14,-2084
% end write
addi r14,r14,2004
jl r15, fnconditional1
subi r14,r14,2004
%check if size is zero if yes, leave
addi r11,r0,0
bz r11,endCopy12

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,2004
%read direct value
add r8,r0,r14
addi r8,r8,2004
%set position counter
mul r12,r0,r0
beginCopy12
%move data via register
lw r10,0(r9)
sw 0(r8),r10
%increment registers
addi r9,r9,4
addi r8,r8,4
addi r12,r12,4
%branch out if done
subi r11,r12,0
bnz r11,beginCopy12

endCopy12
% end copy 
addi r14,r14,2004
jl r15, fnloop1
subi r14,r14,2004
%check if size is zero if yes, leave
addi r8,r0,0
bz r8,endCopy13

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,2004
%read direct value
add r12,r0,r14
addi r12,r12,2004
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
subi r8,r9,0
bnz r8,beginCopy13

endCopy13
% end copy 
hlt
%funcdef begin
fnvehiclegetTires1
sw 4(r14),r15
% begin generating indice offseting
sw 540(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,8
lw r10,540(r14)
 add r8,r8,r10
sw 544(r14),r8
% end var offset calculation
%begin dot offsetting
lw r10,544(r14)
addi r10,r10,0
sw 548(r14),r10
%end dot offsetting
% begin generating indice offseting
addi r10,r0,1
addi r8,r0,0
sw 552(r14),r0
% done generating indice offseting
% begin var offset calculation
lw r9,552(r14)
lw r8,548(r14)
add r8,r8,r9
sw 556(r14),r8
% end var offset calculation
% begin intlit storeage
addi r9,r0,4
sw 560(r14), r9
% done intlit storeage
% begin add op 
lw r11,556(r14)
add r11,r14,r11
lw r9,0(r11)
lw r8,560(r14)
add r10,r9,r8
sw 564(r14),r10
% end add op 
%check if size is zero if yes, leave
addi r12,r0,4
bz r12,endCopy14

%set left and right ptrs
%read direct value
add r10,r0,r14
addi r10,r10,564
%read direct value
add r11,r0,r14
addi r11,r11,0
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
% end copy 
lw r15,4(r14)
jr r15 
%funcdef end
%funcdef begin
fnvehiclesetTires1
sw 0(r14),r15
% begin generating indice offseting
addi r9,r0,1
addi r12,r0,0
sw 540(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r8,540(r14)
 add r12,r12,r8
sw 544(r14),r12
% end var offset calculation
% begin generating indice offseting
addi r8,r0,1
addi r12,r0,0
sw 548(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,536
lw r9,548(r14)
 add r12,r12,r9
sw 552(r14),r12
% end var offset calculation
% begin assignment 
%check if size is zero if yes, leave
addi r11,r0,4
bz r11,endCopy15

%set left and right ptrs
%set ptr
lw r12,552(r14)
add r12,r14,r12
lw r9,544(r14)
add r9,r14,r9
%set position counter
mul r10,r0,r0
beginCopy15
%move data via register
lw r8,0(r12)
sw 0(r9),r8
%increment registers
addi r12,r12,4
addi r9,r9,4
addi r10,r10,4
%branch out if done
subi r11,r10,4
bnz r11,beginCopy15

endCopy15
% end assignment 
lw r15,0(r14)
jr r15 
%funcdef end
%funcdef begin
fncomplexArithmetic1
sw 4(r14),r15
% begin generating indice offseting
addi r10,r0,1
addi r11,r0,0
sw 12(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,8
lw r8,12(r14)
 add r11,r11,r8
sw 16(r14),r11
% end var offset calculation
% begin intlit storeage
addi r8,r0,4
sw 20(r14), r8
% done intlit storeage
% begin intlit storeage
addi r8,r0,6
sw 24(r14), r8
% done intlit storeage
% begin add op 
lw r8,20(r14)
lw r11,24(r14)
add r10,r8,r11
sw 28(r14),r10
% end add op 
% begin mult op 
lw r8,16(r14)
add r8,r14,r8
lw r12,0(r8)
lw r10,28(r14)
mul r11,r12,r10
sw 32(r14),r11
% end mult op 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy16

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,32
%read direct value
add r8,r0,r14
addi r8,r8,0
%set position counter
mul r12,r0,r0
beginCopy16
%move data via register
lw r10,0(r11)
sw 0(r8),r10
%increment registers
addi r11,r11,4
addi r8,r8,4
addi r12,r12,4
%branch out if done
subi r9,r12,4
bnz r9,beginCopy16

endCopy16
% end copy 
lw r15,4(r14)
jr r15 
%funcdef end
%funcdef begin
fnconditional1
sw 0(r14),r15
% begin intlit storeage
addi r9,r0,1
sw 4(r14), r9
% done intlit storeage
% begin intlit storeage
addi r9,r0,1
sw 8(r14), r9
% done intlit storeage
% begin RELOP op 
lw r9,4(r14)
lw r10,8(r14)
cgt r11,r9,r10
sw 12(r14),r11
% end relop op 
lw r12,12(r14)
bz r12,else1
% begin intlit storeage
addi r8,r0,100
sw 16(r14), r8
% done intlit storeage
% begin write 
lw r8,16(r14)
%s move ptr to prevent mem corruption
addi r14,r14,136
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
addi r14,r14,-136
% end write
j endif1
else1
% begin intlit storeage
addi r8,r0,200
sw 20(r14), r8
% done intlit storeage
% begin write 
lw r8,20(r14)
%s move ptr to prevent mem corruption
addi r14,r14,136
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
addi r14,r14,-136
% end write
endif1
% begin intlit storeage
addi r8,r0,10
sw 24(r14), r8
% done intlit storeage
%check if size is zero if yes, leave
addi r7,r0,4
bz r7,endCopy17

%set left and right ptrs
%read direct value
add r11,r0,r14
addi r11,r11,24
%read direct value
add r8,r0,r14
addi r8,r8,64
%set position counter
mul r9,r0,r0
beginCopy17
%move data via register
lw r10,0(r11)
sw 0(r8),r10
%increment registers
addi r11,r11,4
addi r8,r8,4
addi r9,r9,4
%branch out if done
subi r7,r9,4
bnz r7,beginCopy17

endCopy17
% end copy 
addi r14,r14,56
jl r15, fncomplexArithmetic1
subi r14,r14,56
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy18

%set left and right ptrs
%read direct value
add r7,r0,r14
addi r7,r7,56
%read direct value
add r9,r0,r14
addi r9,r9,28
%set position counter
mul r11,r0,r0
beginCopy18
%move data via register
lw r10,0(r7)
sw 0(r9),r10
%increment registers
addi r7,r7,4
addi r9,r9,4
addi r11,r11,4
%branch out if done
subi r8,r11,4
bnz r8,beginCopy18

endCopy18
% end copy 
% begin intlit storeage
addi r11,r0,200
sw 32(r14), r11
% done intlit storeage
% begin intlit storeage
addi r11,r0,100
sw 36(r14), r11
% done intlit storeage
% begin add op 
lw r11,32(r14)
lw r8,36(r14)
sub r10,r11,r8
sw 40(r14),r10
% end add op 
% begin RELOP op 
lw r7,28(r14)
lw r10,40(r14)
cge r8,r7,r10
sw 44(r14),r8
% end relop op 
lw r12,44(r14)
bz r12,else2
% begin intlit storeage
addi r11,r0,100
sw 48(r14), r11
% done intlit storeage
% begin write 
lw r11,48(r14)
%s move ptr to prevent mem corruption
addi r14,r14,136
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
addi r14,r14,-136
% end write
j endif2
else2
% begin intlit storeage
addi r11,r0,200
sw 52(r14), r11
% done intlit storeage
% begin write 
lw r11,52(r14)
%s move ptr to prevent mem corruption
addi r14,r14,136
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
addi r14,r14,-136
% end write
endif2
lw r15,0(r14)
jr r15 
%funcdef end
%funcdef begin
fnloop1
sw 0(r14),r15
gowhile1
% begin generating indice offseting
addi r11,r0,1
addi r8,r0,0
sw 8(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,4
lw r10,8(r14)
 add r8,r8,r10
sw 12(r14),r8
% end var offset calculation
% begin intlit storeage
addi r10,r0,20
sw 16(r14), r10
% done intlit storeage
% begin RELOP op 
lw r7,12(r14)
add r7,r14,r7
lw r10,0(r7)
lw r8,16(r14)
cle r11,r10,r8
sw 20(r14),r11
% end relop op 
lw r12,20(r14)
bz r12,endwhile1
% begin generating indice offseting
addi r7,r0,1
addi r11,r0,0
sw 24(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r8,24(r14)
 add r11,r11,r8
sw 28(r14),r11
% end var offset calculation
% begin generating indice offseting
addi r8,r0,1
addi r11,r0,0
sw 32(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r11,r0,4
lw r7,32(r14)
 add r11,r11,r7
sw 36(r14),r11
% end var offset calculation
% begin intlit storeage
addi r7,r0,1
sw 40(r14), r7
% done intlit storeage
% begin add op 
lw r10,36(r14)
add r10,r14,r10
lw r7,0(r10)
lw r11,40(r14)
add r8,r7,r11
sw 44(r14),r8
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r9,r0,4
bz r9,endCopy19

%set left and right ptrs
%read direct value
add r8,r0,r14
addi r8,r8,44
lw r10,28(r14)
add r10,r14,r10
%set position counter
mul r7,r0,r0
beginCopy19
%move data via register
lw r11,0(r8)
sw 0(r10),r11
%increment registers
addi r8,r8,4
addi r10,r10,4
addi r7,r7,4
%branch out if done
subi r9,r7,4
bnz r9,beginCopy19

endCopy19
% end assignment 
j gowhile1
endwhile1
% begin generating indice offseting
addi r12,r0,1
addi r7,r0,0
sw 48(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r7,r0,4
lw r9,48(r14)
 add r7,r7,r9
sw 52(r14),r7
% end var offset calculation
% begin write 
lw r9,52(r14)
add r9,r14,r9
lw r9,0(r9)
%s move ptr to prevent mem corruption
addi r14,r14,196
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
addi r14,r14,-196
% end write
% begin generating indice offseting
addi r9,r0,1
addi r7,r0,0
sw 56(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r7,r0,4
lw r12,56(r14)
 add r7,r7,r12
sw 60(r14),r7
% end var offset calculation
% begin intlit storeage
addi r12,r0,0
sw 64(r14), r12
% done intlit storeage
% begin assignment 
%check if size is zero if yes, leave
addi r8,r0,4
bz r8,endCopy20

%set left and right ptrs
%read direct value
add r7,r0,r14
addi r7,r7,64
lw r12,60(r14)
add r12,r14,r12
%set position counter
mul r11,r0,r0
beginCopy20
%move data via register
lw r9,0(r7)
sw 0(r12),r9
%increment registers
addi r7,r7,4
addi r12,r12,4
addi r11,r11,4
%branch out if done
subi r8,r11,4
bnz r8,beginCopy20

endCopy20
% end assignment 
gowhile2
% begin generating indice offseting
addi r8,r0,1
addi r9,r0,0
sw 68(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r9,r0,4
lw r7,68(r14)
 add r9,r9,r7
sw 72(r14),r9
% end var offset calculation
% begin intlit storeage
addi r7,r0,20
sw 76(r14), r7
% done intlit storeage
% begin RELOP op 
lw r12,72(r14)
add r12,r14,r12
lw r7,0(r12)
lw r9,76(r14)
cle r8,r7,r9
sw 80(r14),r8
% end relop op 
lw r11,80(r14)
bz r11,endwhile2
% begin generating indice offseting
addi r12,r0,1
addi r8,r0,0
sw 84(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,4
lw r9,84(r14)
 add r8,r8,r9
sw 88(r14),r8
% end var offset calculation
% begin generating indice offseting
addi r9,r0,1
addi r8,r0,0
sw 92(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r8,r0,4
lw r12,92(r14)
 add r8,r8,r12
sw 96(r14),r8
% end var offset calculation
% begin intlit storeage
addi r12,r0,1
sw 100(r14), r12
% done intlit storeage
% begin add op 
lw r7,96(r14)
add r7,r14,r7
lw r12,0(r7)
lw r8,100(r14)
add r9,r12,r8
sw 104(r14),r9
% end add op 
% begin assignment 
%check if size is zero if yes, leave
addi r10,r0,4
bz r10,endCopy21

%set left and right ptrs
%read direct value
add r9,r0,r14
addi r9,r9,104
lw r7,88(r14)
add r7,r14,r7
%set position counter
mul r12,r0,r0
beginCopy21
%move data via register
lw r8,0(r9)
sw 0(r7),r8
%increment registers
addi r9,r9,4
addi r7,r7,4
addi r12,r12,4
%branch out if done
subi r10,r12,4
bnz r10,beginCopy21

endCopy21
% end assignment 
j gowhile2
endwhile2
% begin generating indice offseting
addi r11,r0,1
addi r12,r0,0
sw 108(r14),r0
% done generating indice offseting
% begin var offset calculation
addi r12,r0,4
lw r10,108(r14)
 add r12,r12,r10
sw 112(r14),r12
% end var offset calculation
% begin write 
lw r10,112(r14)
add r10,r14,r10
lw r10,0(r10)
%s move ptr to prevent mem corruption
addi r14,r14,196
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
addi r14,r14,-196
% end write
lw r15,0(r14)
jr r15 
%funcdef end
