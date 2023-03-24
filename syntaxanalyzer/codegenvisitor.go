package syntaxanalyzer

import (
	"fmt"
	"strings"
)

type codeGenVisitor struct {
	*defaultVisitor
	scope             string
	varId             string
	destReg           register
	functionScopelink *symbolTable
}

func (v *codeGenVisitor) propagateDestRegister(r register) {
	v.destReg = r
}
func (v *codeGenVisitor) propagateScope(scopeInfo string) {
	v.scope = scopeInfo
}
func (v *codeGenVisitor) propgateScopeLink(s *symbolTable) {
	v.functionScopelink = s
}
func (v *codeGenVisitor) propagateId(s string) {
	v.varId = s
}
func (v *codeGenVisitor) visitProgram(n *program) {
	writeToCode("hlt\n")
}
func (v *codeGenVisitor) visitAdd(n *addNode) {
	op := ""
	switch n.value {
	case "+":
		op = "add"
	case "-":
		op = "sub"
	case "or":
		op = "or"
	default:
	}
	writeToCode("% begin add op \n")
	tagLeft, typeLeftTag, err := getSomeTag(n.getLeftMostChild().getTable())
	if err != nil {
		panic(err)
	}
	tagRight, typeRightTag, err := getSomeTag(n.getLeftMostChild().getRightSibling().getTable())
	if err != nil {
		panic(err)
	}
	selfTag, _, err := getSomeTag(n.getTable())
	if err != nil {
		panic(err)
	}
	registera, err := globalregisterPool.Get()
	if err != nil {
		panic(err)
	}
	registerb, err := globalregisterPool.Get()
	if err != nil {
		panic(err)
	}
	destReg, err := globalregisterPool.Get()
	if err != nil {
		panic(err)
	}
	ptrReg, err := globalregisterPool.Get()
	if err != nil {
		panic(err)
	}
	code := ""
	switch typeLeftTag {
	case TEMP_OFFSET:
		code = fmt.Sprint(code, fmt.Sprintf("lw %s,%s(r0)\n", ptrReg.String(), tagLeft))
		code = fmt.Sprint(code, fmt.Sprintf("lw %s,0(%s)\n", registera.String(), ptrReg.String()))

	default:
		code = fmt.Sprint(code, fmt.Sprintf("lw %s,%s(r0)\n", registera.String(), tagLeft))
	}
	switch typeRightTag {
	case TEMP_OFFSET:
		code = fmt.Sprint(code, fmt.Sprintf("lw %s,%s(r0)\n", ptrReg.String(), tagRight))
		code = fmt.Sprint(code, fmt.Sprintf("lw %s,0(%s)\n", registerb.String(), ptrReg.String()))

	default:
		code = fmt.Sprint(code, fmt.Sprintf("lw %s,%s(r0)\n", registerb.String(), tagRight))
	}

	if op != "or" {
		code = fmt.Sprint(code, fmt.Sprintf("%s %s,%s,%s\n", op, destReg.String(), registera.String(), registerb.String()))
		code = fmt.Sprint(code, fmt.Sprintf("sw %s(r0),%s\n", selfTag, destReg.String()))
	} else {
		branchTagOne := generateNamedTag("one")
		endTag := generateNamedTag("endor")
		code = fmt.Sprint(code, fmt.Sprintf("bnz %s,%s\n", registera.String(), branchTagOne))
		code = fmt.Sprint(code, fmt.Sprintf("bnz %s,%s\n", registerb.String(), branchTagOne))
		code = fmt.Sprint(code, fmt.Sprintf("addi %s,r0,0\n", destReg.String()))
		code = fmt.Sprint(code, fmt.Sprintf("j %s\n", endTag))
		code = fmt.Sprint(code, fmt.Sprintf("%s		addi %s,r0,1\n", branchTagOne, destReg.String()))
		code = fmt.Sprint(code, fmt.Sprintf("%s 	sw %s(r0),%s\n", endTag, selfTag, destReg.String()))
	}
	writeToCode(code)
	globalregisterPool.Put(registera)
	globalregisterPool.Put(registerb)
	globalregisterPool.Put(destReg)
	globalregisterPool.Put(ptrReg)
	writeToCode("% end add op \n")
	//writeToData(fmt.Sprintf("%-20s %-7s %d\n", tag, "res",record.getSize()))

}
func (v *codeGenVisitor) visitNot(n *notNode) {
	writeToCode("% begin not op \n")
	tag, tagType, err := getSomeTag(n.getLeftMostChild().getTable())
	if err != nil {
		panic(err)
	}
	selfTag, _, err := getSomeTag(n.getTable())
	if err != nil {
		panic(err)
	}
	registera, err := globalregisterPool.Get()
	if err != nil {
		panic(err)
	}
	branchTagZero := generateNamedTag("zero")
	endTag := generateNamedTag("endnot")
	ptrReg, err := globalregisterPool.Get()
	if err != nil {
		panic(err)
	}
	code := ""
	switch tagType {
	case TEMP_OFFSET:
		code = fmt.Sprint(code, fmt.Sprintf("lw %s,%s(r0)\n", ptrReg.String(), tag))
		code = fmt.Sprint(code, fmt.Sprintf("lw %s,0(%s)\n", registera.String(), ptrReg.String()))

	default:
		code = fmt.Sprint(code, fmt.Sprintf("lw %s,%s(r0)\n", registera.String(), tag))
	}

	temp := "bz %s,%s\naddi %s,r0,1\nsw %s(r0),%s\nj %s\n%s sw %s(r0),r0\n%s"
	code = fmt.Sprint(code, fmt.Sprintf(temp, registera.String(), branchTagZero, registera.String(), selfTag, registera.String(), endTag, branchTagZero, selfTag, endTag))
	writeToCode(code)
	writeToCode("% end not op \n")
	globalregisterPool.Put(registera)
	globalregisterPool.Put(ptrReg)

}
func (v *codeGenVisitor) visitSign(n *signNode) {
	op := ""
	switch n.value {
	case "+":
		op = "add"
	case "-":
		op = "sub"
	default:
	}
	writeToCode("% begin sign op \n")
	tag, typeTag, err := getSomeTag(n.getLeftMostChild().getTable())
	if err != nil {
		panic(err)
	}

	selfTag, _, err := getSomeTag(n.getTable())
	if err != nil {
		panic(err)
	}
	registera, err := globalregisterPool.Get()
	if err != nil {
		panic(err)
	}

	destReg, err := globalregisterPool.Get()
	if err != nil {
		panic(err)
	}
	ptrReg, err := globalregisterPool.Get()
	if err != nil {
		panic(err)
	}
	code := ""
	switch typeTag {
	case TEMP_OFFSET:
		code = fmt.Sprint(code, fmt.Sprintf("lw %s,%s(r0)\n", ptrReg.String(), tag))
		code = fmt.Sprint(code, fmt.Sprintf("lw %s,0(%s)\n", registera.String(), ptrReg.String()))

	default:
		code = fmt.Sprint(code, fmt.Sprintf("lw %s,%s(r0)\n", registera.String(), tag))
	}
	code = fmt.Sprint(code, fmt.Sprintf("%s %s,r0,%s\n", op, destReg.String(), registera.String()))
	code = fmt.Sprint(code, fmt.Sprintf("sw %s(r0),%s\n", selfTag, destReg.String()))

	writeToCode(code)
	globalregisterPool.Put(registera)
	globalregisterPool.Put(destReg)
	globalregisterPool.Put(ptrReg)
	writeToCode("% end sign op \n")
}

func (v *codeGenVisitor) visitMult(n *multNode) {
	op := ""
	switch n.value {
	case "*":
		op = "mul"
	case "/":
		op = "div"
	case "and":
		op = "and"
	default:
	}
	writeToCode("% begin mult op \n")
	tagLeft, typeLeftTag, err := getSomeTag(n.getLeftMostChild().getTable())
	if err != nil {
		panic(err)
	}
	tagRight, typeRightTag, err := getSomeTag(n.getLeftMostChild().getRightSibling().getTable())
	if err != nil {
		panic(err)
	}
	selfTag, _, err := getSomeTag(n.getTable())
	if err != nil {
		panic(err)
	}
	registera, err := globalregisterPool.Get()
	if err != nil {
		panic(err)
	}
	registerb, err := globalregisterPool.Get()
	if err != nil {
		panic(err)
	}
	destReg, err := globalregisterPool.Get()
	if err != nil {
		panic(err)
	}
	ptrReg, err := globalregisterPool.Get()
	if err != nil {
		panic(err)
	}
	code := ""
	switch typeLeftTag {
	case TEMP_OFFSET:
		code = fmt.Sprint(code, fmt.Sprintf("lw %s,%s(r0)\n", ptrReg.String(), tagLeft))
		code = fmt.Sprint(code, fmt.Sprintf("lw %s,0(%s)\n", registera.String(), ptrReg.String()))

	default:
		code = fmt.Sprint(code, fmt.Sprintf("lw %s,%s(r0)\n", registera.String(), tagLeft))
	}
	switch typeRightTag {
	case TEMP_OFFSET:
		code = fmt.Sprint(code, fmt.Sprintf("lw %s,%s(r0)\n", ptrReg.String(), tagRight))
		code = fmt.Sprint(code, fmt.Sprintf("lw %s,0(%s)\n", registerb.String(), ptrReg.String()))

	default:
		code = fmt.Sprint(code, fmt.Sprintf("lw %s,%s(r0)\n", registerb.String(), tagRight))
	}
	if op != "and" {
		code = fmt.Sprint(code, fmt.Sprintf("%s %s,%s,%s\n", op, destReg.String(), registera.String(), registerb.String()))
		code = fmt.Sprint(code, fmt.Sprintf("sw %s(r0),%s\n", selfTag, destReg.String()))
	} else {
		branchTagZero := generateNamedTag("zero")
		endTag := generateNamedTag("endand")
		code = fmt.Sprint(code, fmt.Sprintf("bz %s,%s\n", registera.String(), branchTagZero))
		code = fmt.Sprint(code, fmt.Sprintf("bz %s,%s\n", registerb.String(), branchTagZero))
		code = fmt.Sprint(code, fmt.Sprintf("addi %s,r0,1\n", destReg.String()))
		code = fmt.Sprint(code, fmt.Sprintf("j %s\n", endTag))
		code = fmt.Sprint(code, fmt.Sprintf("%s		addi %s,r0,0\n", branchTagZero, destReg.String()))
		code = fmt.Sprint(code, fmt.Sprintf("%s 	sw %s(r0),%s\n", endTag, selfTag, destReg.String()))
	}
	writeToCode(code)
	globalregisterPool.Put(registera)
	globalregisterPool.Put(registerb)
	globalregisterPool.Put(destReg)
	globalregisterPool.Put(ptrReg)
	writeToCode("% end mult op \n")
	//writeToData(fmt.Sprintf("%-20s %-7s %d\n", tag, "res",record.getSize()))

}

func (v *codeGenVisitor) visitRelOp(n *relOpNode) {
	op := ""
	switch n.value {
	case "==":
		op = "ceq"
	case "<=":
		op = "cle"
	case ">=":
		op = "cge"
	case "<>":
		op = "cne"
	case "<":
		op = "clt"
	case ">":
		op = "cgt"
	default:
	}
	writeToCode("% begin RELOP op \n")
	tagLeft, typeLeftTag, err := getSomeTag(n.getLeftMostChild().getTable())
	if err != nil {
		panic(err)
	}
	tagRight, typeRightTag, err := getSomeTag(n.getLeftMostChild().getRightSibling().getTable())
	if err != nil {
		panic(err)
	}
	selfTag, _, err := getSomeTag(n.getTable())
	if err != nil {
		panic(err)
	}
	registera, err := globalregisterPool.Get()
	if err != nil {
		panic(err)
	}
	registerb, err := globalregisterPool.Get()
	if err != nil {
		panic(err)
	}
	destReg, err := globalregisterPool.Get()
	if err != nil {
		panic(err)
	}
	ptrReg, err := globalregisterPool.Get()
	if err != nil {
		panic(err)
	}
	code := ""
	switch typeLeftTag {
	case TEMP_OFFSET:
		code = fmt.Sprint(code, fmt.Sprintf("lw %s,%s(r0)\n", ptrReg.String(), tagLeft))
		code = fmt.Sprint(code, fmt.Sprintf("lw %s,0(%s)\n", registera.String(), ptrReg.String()))

	default:
		code = fmt.Sprint(code, fmt.Sprintf("lw %s,%s(r0)\n", registera.String(), tagLeft))
	}
	switch typeRightTag {
	case TEMP_OFFSET:
		code = fmt.Sprint(code, fmt.Sprintf("lw %s,%s(r0)\n", ptrReg.String(), tagRight))
		code = fmt.Sprint(code, fmt.Sprintf("lw %s,0(%s)\n", registerb.String(), ptrReg.String()))

	default:
		code = fmt.Sprint(code, fmt.Sprintf("lw %s,%s(r0)\n", registerb.String(), tagRight))
	}

	code = fmt.Sprint(code, fmt.Sprintf("%s %s,%s,%s\n", op, destReg.String(), registera.String(), registerb.String()))
	code = fmt.Sprint(code, fmt.Sprintf("sw %s(r0),%s\n", selfTag, destReg.String()))

	writeToCode(code)
	globalregisterPool.Put(registera)
	globalregisterPool.Put(registerb)
	globalregisterPool.Put(destReg)
	globalregisterPool.Put(ptrReg)
	writeToCode("% end relop op \n")
	//writeToData(fmt.Sprintf("%-20s %-7s %d\n", tag, "res",record.getSize()))

}
func (v *codeGenVisitor) visitIntlit(n *intLitNode) {
	entry := n.getTable().getEntry(
		map[int]interface{}{
			FILTER_KIND: TEMP_LIT,
		},
	)
	if entry == nil {
		panic("shouldnt happen")
	}
	tag := entry.getTag()
	val := n.value
	reg, err := globalregisterPool.Get()
	if err != nil {
		panic(err)
	}
	writeToCode("% begin intlit storeage\n")
	code := "addi %s,r0,%s\nsw %s(r0), %s\n"
	code = fmt.Sprintf(code, reg.String(), val, tag, reg.String())
	writeToCode(code)
	writeToCode("% done intlit storeage\n")
	globalregisterPool.Put(reg)
}

func (v *codeGenVisitor) visitIndiceList(n *indiceListNode) {
	writeToCode("% begin generating indice offseting\n")
	entry := v.functionScopelink.getEntry(
		map[int]interface{}{
			FILTER_KIND: VARIABLE,
			FILTER_NAME: v.varId,
		},
	)
	if entry == nil {
		fmt.Println("not defined var")
		return
	}
	typeInfo := entry.getType().String()
	index := strings.IndexRune(typeInfo, '[')
	destReg := v.destReg
	code := "mul %s,r0,r2\n"
	code = fmt.Sprintf(code, destReg.String())
	if index == -1 {
		code := "addi %s,r0,0\n"
		code = fmt.Sprintf(code, destReg.String())
		writeToCode(code)
		writeToCode("% done generating indice offseting\n")
		return
	}
	indiceIterator := n.getLeftMostChild()
	tags := []string{}
	for indiceIterator != nil {
		switch indiceIterator.(type) {
		case *epsilonNode:
		default:
			tag, _, err := getSomeTag(indiceIterator.getTable())
			if err != nil {
				panic(err)
			}
			tags = append(tags, tag)
		}
		indiceIterator = indiceIterator.getRightSibling()
	}
	codeBlock := code
	regWithOne, err := globalregisterPool.Get()
	if err != nil {
		panic(err)
	}
	regWithTag, err := globalregisterPool.Get()
	if err != nil {
		panic(err)
	}
	codeBlock = fmt.Sprint(codeBlock, fmt.Sprintf("addi %s,r0,1\n", regWithOne.String()))
	baseTypeSize, err := sizeOf(getBaseType(typeInfo))
	if err != nil {
		panic(err)
	}
	regWithRunningMul, err := globalregisterPool.Get()
	if err != nil {
		panic(err)
	}

	dimensions := delemitSizes(typeInfo)
	for x := len(tags) - 1; x >= 0; x-- {
		temp := "lw %s,%s(r0)\n"
		codeBlock = fmt.Sprint(codeBlock, fmt.Sprintf(temp, regWithTag.String(), tags[x]))
		temp = "muli %s,%s,%d\n"
		codeBlock = fmt.Sprint(codeBlock, fmt.Sprintf(temp, regWithRunningMul.String(), regWithOne, baseTypeSize))
		temp = "mul %s,%s,%s\n"
		codeBlock = fmt.Sprint(codeBlock, fmt.Sprintf(temp, regWithRunningMul.String(), regWithTag, regWithRunningMul.String()))
		for p := len(dimensions) - 1; p != x; p-- {
			if p < 0 || p > len(dimensions) {
				break
			}
			dimension := dimensions[p]
			if dimension == "" {
				dimension = "0"
			}
			temp = "muli %s,%s,%s\n"
			codeBlock = fmt.Sprint(codeBlock, fmt.Sprintf(temp, regWithRunningMul.String(), regWithRunningMul.String(), dimension))

		}
		temp = "add %s,%s,%s\n"
		codeBlock = fmt.Sprint(codeBlock, fmt.Sprintf(temp, destReg.String(), destReg.String(), regWithRunningMul.String()))

	}
	globalregisterPool.Put(regWithRunningMul)
	globalregisterPool.Put(regWithOne)
	globalregisterPool.Put(regWithTag)
	writeToCode(codeBlock)
	writeToCode("% done generating indice offseting\n")

}
func (v *codeGenVisitor) visitAssign(n *assignStatNode) {
	writeToCode("% begin assignment \n")
	tagLeft, _, err := getSomeTag(n.getLeftMostChild().getTable())
	if err != nil {
		panic(err)
	}
	tagRight, tagType, err := getSomeTag(n.getLeftMostChild().getRightSibling().getTable())
	if err != nil {
		panic(err)
	}
	register, err := globalregisterPool.Get()
	if err != nil {
		panic(err)
	}
	registerb, err := globalregisterPool.Get()
	if err != nil {
		panic(err)
	}
	ptrReg, err := globalregisterPool.Get()
	if err != nil {
		panic(err)
	}

	// 	% begin assignment
	// lw r11,literal0(r0)
	// sw offset0(r0),r11
	//lw r12,offset2(r0)
	code := ""
	if tagType == TEMP_OFFSET {
		code = fmt.Sprint(code, fmt.Sprintf("lw %s,%s(r0)\n", ptrReg.String(), tagRight))
		code = fmt.Sprint(code, fmt.Sprintf("lw %s,0(%s)\n", register.String(), ptrReg.String()))
	} else {
		code = fmt.Sprint(code, fmt.Sprintf("lw %s,%s(r0)\n", register.String(), tagRight))
	}
	code = fmt.Sprint(code, fmt.Sprintf("lw %s,%s(r0) \nsw 0(%s),%s\n", registerb.String(), tagLeft, registerb.String(), register.String()))
	globalregisterPool.Put(register)
	globalregisterPool.Put(registerb)
	globalregisterPool.Put(ptrReg)
	writeToCode(code)
	writeToCode("% end assignment \n")

}

func (v *codeGenVisitor) visitVar(n *varNode) {
	writeToCode("% begin var offset calculation\n")
	tagleft := ""
	switch n.getLeftMostChild().(type) {
	case *idNode:
		id := n.getLeftMostChild().getTable().getSingleEntry().getName()
		entry := v.functionScopelink.getEntry(
			map[int]interface{}{
				FILTER_KIND: VARIABLE,
				FILTER_NAME: id,
			},
		)
		if entry == nil {
			tagleft = "nonesenseTag"
		} else {
			tagleft = entry.getTag()
		}

	default:
		t, _, err := getSomeTag(n.getLeftMostChild().getTable())
		if err != nil {
			panic(err)
		}
		tagleft = t

	}
	varTag, _, err := getSomeTag(n.getTable())
	if err != nil {
		panic(err)
	}
	tempReg, err := globalregisterPool.Get()
	if err != nil {
		panic(err)
	}
	code := "addi %s,%s,%s\nsw %s(r0),%s\n"
	code = fmt.Sprintf(code, tempReg.String(), v.destReg, tagleft,
		varTag, tempReg.String())
	writeToCode(code)

	globalregisterPool.Put(v.destReg)
	globalregisterPool.Put(tempReg)
	writeToCode("% end var offset calculation\n")
}

func getSomeTag(table *symbolTable) (string, string, error) {
	var tagRecord *symbolTableRecord
	typeInfo := ""
	tagRecord = table.getEntry(map[int]interface{}{FILTER_KIND: TEMP_VAR})
	typeInfo = TEMP_VAR
	if tagRecord == nil {
		tagRecord = table.getEntry(map[int]interface{}{FILTER_KIND: TEMP_LIT})
		typeInfo = TEMP_LIT
	}
	if tagRecord == nil {
		tagRecord = table.getEntry(map[int]interface{}{FILTER_KIND: TEMP_OFFSET})
		typeInfo = TEMP_OFFSET

	}
	if tagRecord == nil {
		return "", "", fmt.Errorf("must contain something")
	}
	return tagRecord.getTag(), typeInfo, nil

}

func (v *codeGenVisitor) visitWrite(n *writeNode) {
	writeToCode("% begin write \n")
	tag, tagType, err := getSomeTag(n.getLeftMostChild().getTable())
	if err != nil {
		panic(err)
	}
	locReg, err := globalregisterPool.Get()
	if err != nil {
		panic(err)
	}
	code := ""
	if tagType == TEMP_OFFSET {
		code = fmt.Sprint(code, fmt.Sprintf("lw %s,%s(r0)\n", locReg.String(), tag))
		code = fmt.Sprint(code, fmt.Sprintf("lw %s,0(%s)\n", locReg.String(), locReg.String()))

	} else {
		code = fmt.Sprint(code, fmt.Sprintf("lw %s,%s(r0)\n", locReg.String(), tag))
	}
	code = fmt.Sprint(code, fmt.Sprintf("sw -8(r14),%s\n", locReg.String()))
	code = fmt.Sprint(code, fmt.Sprintf("addi %s,r0,%s\n", locReg.String(), PRINT_BUFFER))
	code = fmt.Sprint(code, fmt.Sprintf("sw -12(r14),%s\n", locReg.String()))
	code = fmt.Sprint(code, ("jl r15,intstr\n"))
	code = fmt.Sprint(code, ("sw -8(r14),r13\n"))
	code = fmt.Sprint(code, ("jl r15,putstr\n"))
	//hack nl
	code = fmt.Sprint(code, fmt.Sprintf("addi %s,r0,%s\n", locReg.String(), "newline"))
	code = fmt.Sprint(code, fmt.Sprintf("sw -8(r14),%s\n", locReg.String()))
	code = fmt.Sprint(code, ("jl r15,putstr\n"))
	writeToCode(code)
	globalregisterPool.Put(locReg)
	writeToCode("% end write\n")

}
