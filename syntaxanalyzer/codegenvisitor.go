package syntaxanalyzer

import (
	"fmt"
	"strings"
)

type codeGenVisitor struct {
	*defaultVisitor
	scope             string
	varId             string
	functionScopelink *symbolTable
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
	code :=
		`addi %s,r0,%s
	     sw %s(r0), %s`
	code = fmt.Sprintf(code, reg.String(), val, tag, reg.String())
	recordA := newRecord("code", MOON_CODE, "", n.getLineNumber(), newTypeRecord(""), nil)
	recordA.setCode(code)
	globalregisterPool.Put(reg)
}

func (v *codeGenVisitor) visitIndiceList(n *indiceListNode) {
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
	destReg, err := globalregisterPool.Get()
	if err != nil {
		panic(err)
	}
	// code :=
	// 	`addi %s,r0,%s
	//  sw %s(r0), %s`
	// code = fmt.Sprintf(code, reg.String(), val, tag, reg.String())
	recordA := newRecord("code", MOON_CODE, "", n.getLineNumber(), newTypeRecord(""), nil)
	if index == -1 {
		code := `
		mul %s,r0,r2
		addi %s,r0,0`
		code = fmt.Sprintf(code, destReg.String(), destReg.String())
		recordA.setCode(code)
		return
	}

	//fixedSize := typeInfo[index:]

}
