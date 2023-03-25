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
	_, typeLeftTag, offsetTagLeftStack, _, _, err := getSomeTag(n.getLeftMostChild().getTable())
	if err != nil {
		panic(err)
	}
	_, typeRightTag, offsetTagRightStack, _, _, err := getSomeTag(n.getLeftMostChild().getRightSibling().getTable())
	if err != nil {
		panic(err)
	}
	_, _, offsetSelfStack, _, _, err := getSomeTag(n.getTable())
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
		code = fmt.Sprint(code, fmt.Sprintf("lw %s,%d(r14)\n", ptrReg.String(), offsetTagLeftStack))
		code = fmt.Sprint(code, fmt.Sprintf("lw %s,0(%s)\n", registera.String(), ptrReg.String()))

	default:
		code = fmt.Sprint(code, fmt.Sprintf("lw %s,%d(r14)\n", registera.String(), offsetTagLeftStack))
	}
	switch typeRightTag {
	case TEMP_OFFSET:
		code = fmt.Sprint(code, fmt.Sprintf("lw %s,%d(r14)\n", ptrReg.String(), offsetTagRightStack))
		code = fmt.Sprint(code, fmt.Sprintf("lw %s,0(%s)\n", registerb.String(), ptrReg.String()))

	default:
		code = fmt.Sprint(code, fmt.Sprintf("lw %s,%d(r14)\n", registerb.String(), offsetTagRightStack))

	}

	if op != "or" {
		code = fmt.Sprint(code, fmt.Sprintf("%s %s,%s,%s\n", op, destReg.String(), registera.String(), registerb.String()))
		code = fmt.Sprint(code, fmt.Sprintf("sw %d(r14),%s\n", offsetSelfStack, destReg.String()))
	} else {
		branchTagOne := generateNamedTag("one")
		endTag := generateNamedTag("endor")
		code = fmt.Sprint(code, fmt.Sprintf("bnz %s,%s\n", registera.String(), branchTagOne))
		code = fmt.Sprint(code, fmt.Sprintf("bnz %s,%s\n", registerb.String(), branchTagOne))
		code = fmt.Sprint(code, fmt.Sprintf("addi %s,r0,0\n", destReg.String()))
		code = fmt.Sprint(code, fmt.Sprintf("j %s\n", endTag))
		code = fmt.Sprint(code, fmt.Sprintf("%s		addi %s,r0,1\n", branchTagOne, destReg.String()))
		code = fmt.Sprint(code, fmt.Sprintf("%s 	sw %d(r14),%s\n", endTag, offsetSelfStack, destReg.String()))
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
	_, tagType, tagOffset, _, _, err := getSomeTag(n.getLeftMostChild().getTable())
	if err != nil {
		panic(err)
	}
	_, _, selfTagOffset, _, _, err := getSomeTag(n.getTable())
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
		code = fmt.Sprint(code, fmt.Sprintf("lw %s,%d(r14)\n", ptrReg.String(), tagOffset))
		code = fmt.Sprint(code, fmt.Sprintf("lw %s,0(%s)\n", registera.String(), ptrReg.String()))

	default:
		code = fmt.Sprint(code, fmt.Sprintf("lw %s,%d(r14)\n", registera.String(), tagOffset))
	}

	temp := "bnz %s,%s\naddi %s,r0,1\nsw %d(r14),%s\nj %s\n%s sw %d(r14),r0\n%s"
	code = fmt.Sprint(code, fmt.Sprintf(temp, registera.String(), branchTagZero, registera.String(), selfTagOffset, registera.String(), endTag, branchTagZero, selfTagOffset, endTag))
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
	_, typeTag, tagOffset, _, _, err := getSomeTag(n.getLeftMostChild().getTable())
	if err != nil {
		panic(err)
	}

	_, _, selfTagOffset, _, _, err := getSomeTag(n.getTable())
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
		code = fmt.Sprint(code, fmt.Sprintf("lw %s,%d(r14)\n", ptrReg.String(), tagOffset))
		code = fmt.Sprint(code, fmt.Sprintf("lw %s,0(%s)\n", registera.String(), ptrReg.String()))

	default:
		code = fmt.Sprint(code, fmt.Sprintf("lw %s,%d(r14)\n", registera.String(), tagOffset))
	}
	code = fmt.Sprint(code, fmt.Sprintf("%s %s,r0,%s\n", op, destReg.String(), registera.String()))
	code = fmt.Sprint(code, fmt.Sprintf("sw %d(r14),%s\n", selfTagOffset, destReg.String()))

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
	_, typeLeftTag, offsetTagLeftStack, _, _, err := getSomeTag(n.getLeftMostChild().getTable())
	if err != nil {
		panic(err)
	}
	_, typeRightTag, offsetTagRightStack, _, _, err := getSomeTag(n.getLeftMostChild().getRightSibling().getTable())
	if err != nil {
		panic(err)
	}
	_, _, offsetSelfStack, _, _, err := getSomeTag(n.getTable())
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
		code = fmt.Sprint(code, fmt.Sprintf("lw %s,%d(r14)\n", ptrReg.String(), offsetTagLeftStack))
		code = fmt.Sprint(code, fmt.Sprintf("lw %s,0(%s)\n", registera.String(), ptrReg.String()))

	default:
		code = fmt.Sprint(code, fmt.Sprintf("lw %s,%d(r14)\n", registera.String(), offsetTagLeftStack))
	}
	switch typeRightTag {
	case TEMP_OFFSET:
		code = fmt.Sprint(code, fmt.Sprintf("lw %s,%d(r14)\n", ptrReg.String(), offsetTagRightStack))
		code = fmt.Sprint(code, fmt.Sprintf("lw %s,0(%s)\n", registerb.String(), ptrReg.String()))

	default:
		code = fmt.Sprint(code, fmt.Sprintf("lw %s,%d(r14)\n", registerb.String(), offsetTagRightStack))
	}
	if op != "and" {
		code = fmt.Sprint(code, fmt.Sprintf("%s %s,%s,%s\n", op, destReg.String(), registera.String(), registerb.String()))
		code = fmt.Sprint(code, fmt.Sprintf("sw %d(r14),%s\n", offsetSelfStack, destReg.String()))
	} else {
		branchTagZero := generateNamedTag("zero")
		endTag := generateNamedTag("endand")
		code = fmt.Sprint(code, fmt.Sprintf("bz %s,%s\n", registera.String(), branchTagZero))
		code = fmt.Sprint(code, fmt.Sprintf("bz %s,%s\n", registerb.String(), branchTagZero))
		code = fmt.Sprint(code, fmt.Sprintf("addi %s,r0,1\n", destReg.String()))
		code = fmt.Sprint(code, fmt.Sprintf("j %s\n", endTag))
		code = fmt.Sprint(code, fmt.Sprintf("%s		addi %s,r0,0\n", branchTagZero, destReg.String()))
		code = fmt.Sprint(code, fmt.Sprintf("%s 	sw %d(r14),%s\n", endTag, offsetSelfStack, destReg.String()))
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
	_, typeLeftTag, tagLeftOffset, _, _, err := getSomeTag(n.getLeftMostChild().getTable())
	if err != nil {
		panic(err)
	}
	_, typeRightTag, tagRightOffset, _, _, err := getSomeTag(n.getLeftMostChild().getRightSibling().getTable())
	if err != nil {
		panic(err)
	}
	_, _, selfTagOffset, _, _, err := getSomeTag(n.getTable())
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
		code = fmt.Sprint(code, fmt.Sprintf("lw %s,%d(r14)\n", ptrReg.String(), tagLeftOffset))
		code = fmt.Sprint(code, fmt.Sprintf("lw %s,0(%s)\n", registera.String(), ptrReg.String()))

	default:
		code = fmt.Sprint(code, fmt.Sprintf("lw %s,%d(r14)\n", registera.String(), tagLeftOffset))
	}
	switch typeRightTag {
	case TEMP_OFFSET:
		code = fmt.Sprint(code, fmt.Sprintf("lw %s,%d(r14)\n", ptrReg.String(), tagRightOffset))
		code = fmt.Sprint(code, fmt.Sprintf("lw %s,0(%s)\n", registerb.String(), ptrReg.String()))

	default:
		code = fmt.Sprint(code, fmt.Sprintf("lw %s,%d(r14)\n", registerb.String(), tagRightOffset))
	}

	code = fmt.Sprint(code, fmt.Sprintf("%s %s,%s,%s\n", op, destReg.String(), registera.String(), registerb.String()))
	code = fmt.Sprint(code, fmt.Sprintf("sw %d(r14),%s\n", selfTagOffset, destReg.String()))

	writeToCode(code)
	globalregisterPool.Put(registera)
	globalregisterPool.Put(registerb)
	globalregisterPool.Put(destReg)
	globalregisterPool.Put(ptrReg)
	writeToCode("% end relop op \n")
	//writeToData(fmt.Sprintf("%-20s %-7s %d\n", tag, "res",record.getSize()))

}
func (v *codeGenVisitor) visitIntlit(n *intLitNode) {
	_, _, offsetTagStack, _, _, err := getSomeTag(n.getTable())
	if err != nil {
		panic("shouldnt happen")
	}
	val := n.value
	reg, err := globalregisterPool.Get()
	if err != nil {
		panic(err)
	}
	writeToCode("% begin intlit storeage\n")
	code := "addi %s,r0,%s\nsw %d(r14), %s\n"
	code = fmt.Sprintf(code, reg.String(), val, offsetTagStack, reg.String())
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
		switch n.getParent().getLeftMostChild().(type) {
		case *idNode:
			fmt.Println("not defined var")
			return
		case *dotNode:
			records := n.getParent().getLeftMostChild().getTable().getRecords()
			id := n.getParent().getLeftMostChild().getLeftMostChild().getRightSibling().getSingleEntry().name
			for _, record := range records {
				if record.getKind() != TEMP_OFFSET {
					className := record.getType().String()
					classTable := v.getGlobalTable().getEntry(map[int]interface{}{FILTER_KIND: CLASS, FILTER_NAME: className})
					if classTable == nil {
						fmt.Println("class not defined var")
						return
					}
					entry = classTable.getLink().getEntry(map[int]interface{}{FILTER_KIND: VARIABLE, FILTER_NAME: id})
					if entry == nil {
						fmt.Println(" not defined var")
						return
					}

				}
			}
		default:
			panic("odd")

		}

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
	tags := []int{}
	for indiceIterator != nil {
		switch indiceIterator.(type) {
		case *epsilonNode:
		default:
			_, _, tagOffsetSize, _, _, err := getSomeTag(indiceIterator.getTable())
			if err != nil {
				panic(err)
			}
			tags = append(tags, tagOffsetSize)
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
		temp := "lw %s,%d(r14)\n"
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
	_, _, offsetTagLeftStack, _, _, err := getSomeTag(n.getLeftMostChild().getTable())
	if err != nil {
		panic(err)
	}
	_, tagType, offsetTagRightStack, _, conType, err := getSomeTag(n.getLeftMostChild().getRightSibling().getTable())
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
	copyReg, err := globalregisterPool.Get()
	if err != nil {
		panic(err)
	}
	indexReg, err := globalregisterPool.Get()
	if err != nil {
		panic(err)
	}
	branchReg, err := globalregisterPool.Get()
	if err != nil {
		panic(err)
	}
	conType = getBaseType(conType)
	size, err := sizeOf(conType)
	if err != nil {
		panic(err)
	}
	beginCopyTag := generateNamedTag("beginCopy") + "\n"
	endCopyTag := generateNamedTag("endCopy") + "\n"

	code := ""

	code = fmt.Sprint(code, "%check if size is zero if yes, leave\n")
	code = fmt.Sprint(code, fmt.Sprintf("addi %s,r0,%d\n", branchReg.String(), size))
	code = fmt.Sprint(code, fmt.Sprintf("bz %s,%s\n", branchReg.String(), endCopyTag))
	code = fmt.Sprint(code, "%set left and right ptrs\n")
	if tagType == TEMP_OFFSET {
		code = fmt.Sprint(code, "%set ptr\n")
		code = fmt.Sprint(code, fmt.Sprintf("lw %s,%d(r14)\n", ptrReg.String(), offsetTagRightStack))
	} else {
		code = fmt.Sprint(code, "%read direct value address\n")
		code = fmt.Sprint(code, fmt.Sprintf("add %s,r0,r14\n", ptrReg.String()))
		code = fmt.Sprint(code, fmt.Sprintf("addi %s,%s,%d\n", ptrReg.String(), ptrReg.String(), offsetTagRightStack))
	}
	code = fmt.Sprint(code, fmt.Sprintf("lw %s,%d(r14)\n", registerb.String(), offsetTagLeftStack))
	code = fmt.Sprint(code, "%set position counter\n")
	code = fmt.Sprint(code, fmt.Sprintf("mul %s,r0,r0\n", indexReg.String()))
	code = fmt.Sprint(code, beginCopyTag)
	code = fmt.Sprint(code, "%move data via register\n")
	code = fmt.Sprint(code, fmt.Sprintf("lb %s,0(%s)\n", copyReg.String(), ptrReg.String()))
	code = fmt.Sprint(code, fmt.Sprintf("sb 0(%s),%s\n", registerb.String(), copyReg.String()))
	code = fmt.Sprint(code, "%increment registers\n")
	code = fmt.Sprint(code, fmt.Sprintf("addi %s,%s,1\n", ptrReg.String(), ptrReg))
	code = fmt.Sprint(code, fmt.Sprintf("addi %s,%s,1\n", registerb.String(), registerb))
	code = fmt.Sprint(code, fmt.Sprintf("addi %s,%s,1\n", indexReg.String(), indexReg))
	code = fmt.Sprint(code, "%branch out if done\n")
	code = fmt.Sprint(code, fmt.Sprintf("subi %s,%s,%d\n", branchReg.String(), indexReg.String(), size))
	code = fmt.Sprint(code, fmt.Sprintf("bnz %s,%s\n", branchReg.String(), beginCopyTag))
	code = fmt.Sprint(code, endCopyTag)
	globalregisterPool.Put(register)
	globalregisterPool.Put(registerb)
	globalregisterPool.Put(ptrReg)
	globalregisterPool.Put(copyReg)
	globalregisterPool.Put(branchReg)
	globalregisterPool.Put(indexReg)
	writeToCode(code)
	writeToCode("% end assignment \n")

}

func (v *codeGenVisitor) visitVar(n *varNode) {
	writeToCode("% begin var offset calculation\n")
	tagleftOffsetSize := 0
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
			tagleftOffsetSize = 900
		} else {
			tagleftOffsetSize = entry.getOffset()
		}

	default:
		_, _, t, _, _, err := getSomeTag(n.getLeftMostChild().getTable())
		if err != nil {
			panic(err)
		}
		tagleftOffsetSize = t

	}
	_, _, varTagOffsetSize, _, _, err := getSomeTag(n.getTable())
	if err != nil {
		panic(err)
	}
	tempReg, err := globalregisterPool.Get()
	if err != nil {
		panic(err)
	}
	code := "addi %s,%s,%d\nsw %d(r14),%s\n"
	code = fmt.Sprintf(code, tempReg.String(), v.destReg, tagleftOffsetSize,
		varTagOffsetSize, tempReg.String())
	writeToCode(code)

	globalregisterPool.Put(v.destReg)
	globalregisterPool.Put(tempReg)
	writeToCode("% end var offset calculation\n")
}

func getSomeTag(table *symbolTable) (tagname string, tagType string, tagOffset int, tagSize int, concType string, err error) {
	var tagRecord *symbolTableRecord
	typeInfo := ""
	offset := 0
	size := 0
	concreteType := ""
	tagRecord = table.getEntry(map[int]interface{}{FILTER_KIND: TEMP_VAR})
	if tagRecord != nil {
		offset = tagRecord.getOffset()
		size = tagRecord.getSize()
		concreteType = tagRecord.getType().String()
	}
	typeInfo = TEMP_VAR
	if tagRecord == nil {
		tagRecord = table.getEntry(map[int]interface{}{FILTER_KIND: TEMP_LIT})
		typeInfo = TEMP_LIT
		if tagRecord != nil {
			offset = tagRecord.getOffset()
			size = tagRecord.getSize()
			concreteType = tagRecord.getType().String()
		}
	}
	if tagRecord == nil {
		tagRecord = table.getEntry(map[int]interface{}{FILTER_KIND: TEMP_OFFSET})
		typeInfo = TEMP_OFFSET
		if tagRecord != nil {
			offset = tagRecord.getOffset()
			size = tagRecord.getSize()
			concreteType = tagRecord.getType().String()
		}

	}
	if tagRecord == nil {
		return "", "", 0, 0, "", fmt.Errorf("must contain something")
	}
	//fmt.Println(tagRecord.getName(), " ", tagRecord.getTag(), " ", tagRecord.getOffset(), " ", tagRecord.getSize())
	return tagRecord.getTag(), typeInfo, offset, size, concreteType, nil

}

func (v *codeGenVisitor) visitWrite(n *writeNode) {
	writeToCode("% begin write \n")
	_, tagType, offsetTagStack, _, _, err := getSomeTag(n.getLeftMostChild().getTable())
	if err != nil {
		panic(err)
	}
	locReg, err := globalregisterPool.Get()
	if err != nil {
		panic(err)
	}
	code := ""
	if tagType == TEMP_OFFSET {
		code = fmt.Sprint(code, fmt.Sprintf("lw %s,%d(r14)\n", locReg.String(), offsetTagStack))
		code = fmt.Sprint(code, fmt.Sprintf("lw %s,0(%s)\n", locReg.String(), locReg.String()))

	} else {
		code = fmt.Sprint(code, fmt.Sprintf("lw %s,%d(r14)\n", locReg.String(), offsetTagStack))
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

// func (v *codeGenVisitor) visitDot(n *dotNode) {
// 	tagleft := ""
// 	switch n.getLeftMostChild().(type) {
// 	case *varNode:
// 		id := n.getLeftMostChild().getTable().getSingleEntry().getName()
// 		entry := v.functionScopelink.getEntry(
// 			map[int]interface{}{
// 				FILTER_KIND: VARIABLE,
// 				FILTER_NAME: id,
// 			},
// 		)
// 		if entry == nil {
// 			tagleft = "nonesenseTag"
// 		} else {
// 			tagleft = entry.getTag()
// 		}

// 	default:
// 		panic("never happen")

// 	}
// 	mytag, _, err := getSomeTag(n.getTable())
// 	if err != nil {
// 		panic(err)
// 	}
// 	writeToCode("%begin dot offsetting\n")
// 	switch n.getParent().(type) {
// 	case *varNode:
// 		typeInfo := n.getLeftMostChild().getTable().getSingleEntry().getType().String()
// 		id := n.getLeftMostChild().getRightSibling().getSingleEntry().getName()
// 		class := v.getGlobalTable().getEntry(map[int]interface{}{
// 			FILTER_KIND: CLASS,
// 			FILTER_NAME: typeInfo,
// 		})
// 		if class == nil {
// 			fmt.Println("how?")
// 			os.Exit(1)
// 		}
// 		_, offset, found := recursivelySearchForIdWithOffset(class.getLink(), id)
// 		fmt.Println(-offset)
// 		fmt.Println(found)
// 	}
// 	writeToCode("%end dot offsetting\n")

// }

func recursivelySearchForIdWithOffset(classTable *symbolTable, identifier string) (*symbolTableRecord, int, bool) {
	record := classTable.getEntry(
		map[int]interface{}{
			FILTER_NAME: identifier,
			FILTER_KIND: VARIABLE,
		},
	)
	if record != nil {
		return record, record.getOffset(), true
	}
	inheritedClasses := classTable.getEntries(
		map[int]interface{}{
			FILTER_KIND: CLASS,
		},
	)
	for _, class := range inheritedClasses {
		record, off, found := recursivelySearchForIdWithOffset(class.getLink(), identifier)
		if record != nil {
			return record, class.getOffset() + off, found
		}
	}
	return nil, 0, false
}
