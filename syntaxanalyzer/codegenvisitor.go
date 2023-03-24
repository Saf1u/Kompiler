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
	typeInfo := n.getTable().getSingleEntry().getType().String()
	tag := getUniqueTempTag()
	recordA := newRecord(tag, TEMP_VAR, "", n.getLineNumber(), newTypeRecord(typeInfo), nil)
	recordB := newRecord(tag, TEMP_VAR, "", n.getLineNumber(), newTypeRecord(typeInfo), nil)
	size, err := sizeOf(typeInfo)
	if err != nil {
		panic("shouldnt happen")
	}
	recordA.setSize(size)
	recordB.setSize(size)
	recordA.setTag(tag)
	recordB.setTag(tag)
	n.getTable().addRecord(recordA)
	v.functionScopelink.addRecord(recordB)
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
	tagRight, _, err := getSomeTag(n.getLeftMostChild().getRightSibling().getTable())
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
	// 	% begin assignment
	// lw r11,literal0(r0)
	// sw offset0(r0),r11
	code := fmt.Sprintf("lw %s,%s(r0)\n lw %s,%s(r0) \nsw 0(%s),%s\n", register.String(), tagRight, registerb.String(), tagLeft, registerb.String(), register.String())
	globalregisterPool.Put(register)
	globalregisterPool.Put(registerb)
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
	writeToCode(code)
	globalregisterPool.Put(locReg)
	writeToCode("% end write\n")

}
