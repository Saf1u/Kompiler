         org   103
nsideinteger         res     4
psideinteger         res     1621
zsideinteger         res     40
xsideinteger         res     72
ysideinteger         res     4
literal8             res     4
literal9             res     4
literal10            res     4
tempVar6             res     4
literal11            res     4
tempVar7             res     4
literal12            res     4
literal13            res     4
tempVar8             res     4
literal14            res     4
tempVar9             res     4
tempVar10            res     4
literal15            res     4
tempVar11            res     4
nsidefloatinteger    res     4
psidefloatinteger    res     1621
nEevaluatefloat      res     4
pEevaluatefloat      res     1621
literal24            res     4
nmain                res     4
zmain                res     40
xmain                res     72
ymain                res     4
literal0             res     4
literal1             res     4
literal2             res     4
tempVar0             res     4
literal3             res     4
tempVar1             res     4
literal4             res     4
literal5             res     4
tempVar2             res     4
literal6             res     4
tempVar3             res     4
tempVar4             res     4
literal7             res     4
tempVar5             res     4
nsidefloat           res     4
psidefloat           res     1621
zsidefloat           res     40
xsidefloat           res     72
ysidefloat           res     4
literal16            res     4
literal17            res     4
literal18            res     4
tempVar12            res     4
literal19            res     4
tempVar13            res     4
literal20            res     4
literal21            res     4
tempVar14            res     4
literal22            res     4
tempVar15            res     4
tempVar16            res     4
literal23            res     4
tempVar17            res     4
nEevaluateinteger    res     4
pEevaluateinteger    res     1621
literal25            res     4

 message db    "Hello, world!", 13, 10, 0
         org   1217
         align
         entry                  % Start here
         add   r2,r0,r0
         lb   r7,pEevaluateinteger(r0)
 pri     lb    r3,message(r2)   % Get next char
         ceqi  r4,r3,0
         bnz    r4,pr2          % Finished if zero
         putc   r3
         addi   r2,r2,1
         j      pri             % Go for next char
pr2     hlt

