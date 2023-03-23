package syntaxanalyzer

import (
	"compiler/configmap"
	"fmt"
	"os"
	"sort"
	"strings"
)

type memAllocVisitor struct {
	*defaultVisitor
	scope             string
	functionScopelink *symbolTable
}

func (v *memAllocVisitor) propagateScope(scopeInfo string) {
	v.scope = scopeInfo
}
func (v *memAllocVisitor) propgateScopeLink(s *symbolTable) {
	v.functionScopelink = s
}
func (v *memAllocVisitor) visitAdd(n *addNode) {
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

}
func (v *memAllocVisitor) visitMult(n *multNode) {
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

}
func (v *memAllocVisitor) visitIntlit(n *intLitNode) {
	typeInfo := n.getTable().getSingleEntry().getType().String()
	tag := getUniqueLitTag()
	recordA := newRecord(tag, TEMP_LIT, "", n.getLineNumber(), newTypeRecord(typeInfo), nil)
	recordB := newRecord(tag, TEMP_LIT, "", n.getLineNumber(), newTypeRecord(typeInfo), nil)
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
}
func (v *memAllocVisitor) visitNot(n *notNode) {
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

}
func (v *memAllocVisitor) visitSign(n *signNode) {
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

}
func (v *memAllocVisitor) visitVar(n *varNode) {
	typeInfo := n.getTable().getSingleEntry().getType().String()
	tag := getUniqueOffsetTag()
	recordA := newRecord(tag, TEMP_OFFSET, "", n.getLineNumber(), newTypeRecord(typeInfo), nil)
	recordB := newRecord(tag, TEMP_OFFSET, "", n.getLineNumber(), newTypeRecord(typeInfo), nil)
	size, err := sizeOf("integer")
	if err != nil {
		panic("shouldnt happen")
	}
	recordA.setSize(size)
	recordB.setSize(size)
	recordA.setTag(tag)
	recordB.setTag(tag)
	n.getTable().addRecord(recordA)
	v.functionScopelink.addRecord(recordB)

}
func (v *memAllocVisitor) visitDot(n *dotNode) {
	switch n.getParent().(type) {
	case *varNode:
		typeInfo := n.getTable().getSingleEntry().getType().String()
		if typeInfo != TYPE_ERR {
			class := v.getGlobalTable().getEntry(
				map[int]interface{}{
					FILTER_KIND: CLASS,
					FILTER_NAME: typeInfo,
				},
			)
			if class == nil {
				panic("never happens")
			}
			variable := class.getLink().getEntry(map[int]interface{}{
				FILTER_KIND: VARIABLE,
				FILTER_NAME: n.getLeftMostChild().getRightSibling().(*idNode).identifier,
			})
			if variable == nil {
				typeInfo = TYPE_ERR
			} else {
				typeInfo = getBaseType(variable.getType().String())
			}
		}
		tag := getUniqueOffsetTag()
		recordA := newRecord(tag, TEMP_OFFSET, "", n.getLineNumber(), newTypeRecord(typeInfo), nil)
		recordB := newRecord(tag, TEMP_OFFSET, "", n.getLineNumber(), newTypeRecord(typeInfo), nil)
		size, err := sizeOf("integer")
		if err != nil {
			panic("shouldnt happen")
		}
		recordA.setSize(size)
		recordB.setSize(size)
		recordA.setTag(tag)
		recordB.setTag(tag)
		n.getTable().addRecord(recordA)
		v.functionScopelink.addRecord(recordB)
	}

}

func (v *memAllocVisitor) visitLocalVarDecl(n *localVarNode) {
	names := strings.Split(v.scope, "~")
	typeInfo := n.getTable().getSingleEntry().getType().String()
	name := n.getTable().getSingleEntry().getName()
	tag := getUniqueNameTag(fmt.Sprint(name, names[0]), names[1])
	entry := v.functionScopelink.getEntry(
		map[int]interface{}{
			FILTER_KIND: VARIABLE,
			FILTER_NAME: name,
		},
	)
	if entry == nil {
		fmt.Println("is it a parameter.....?")
		if v.functionScopelink.getEntry(map[int]interface{}{FILTER_KIND: "parameter", FILTER_NAME: name}) == nil {
			panic("can not happen")
		} else {
			return
		}
	}
	entry.setTag(tag)
	baseType := getBaseType(typeInfo)
	size, err := sizeOf(baseType)
	if err != nil {
		panic("shouldnt happen")
	}
	size = size * getDimensions(typeInfo)
	entry.setSize(size)

}

func (v *memAllocVisitor) visitProgram(n *program) {
	definitions := v.getGlobalTable().getEntries(
		map[int]interface{}{
			FILTER_KIND: FUNCDEF,
		},
	)
	for _, definition := range definitions {
		records := definition.getLink().getRecords()
		for _, record := range records {
			if record.getKind() != "parameter" {
				tag := strings.TrimSpace(record.getTag())
				writeToData(fmt.Sprintf("%-20s %-7s %d\n", tag, "res", record.getSize()))
			}
		}
	}

	file := configmap.Get("file").(string)
	errorFile := fmt.Sprint(file, ".outsemanticerrors")
	symbolTableFile := fmt.Sprint(file, ".symbolTable")
	errFile, err := os.OpenFile(errorFile, os.O_TRUNC|os.O_CREATE|os.O_RDWR, 0755)
	if err != nil {
		panic(err)
	}
	symbolTable, err := os.OpenFile(symbolTableFile, os.O_TRUNC|os.O_CREATE|os.O_RDWR, 0755)
	if err != nil {
		panic(err)
	}
	sort.Slice(indexes, func(i, j int) bool {
		return indexes[i] < indexes[j]
	})

	for _, line := range indexes {
		errors := errorBin[line]
		for _, error := range errors {
			errFile.WriteString(error)
			errFile.WriteString("\n")
		}
	}
	old := os.Stdout
	os.Stdout = symbolTable
	v.getGlobalTable().print(10)
	os.Stdout = old
}

func (v *memAllocVisitor) visitFuncDef(n *funcDefNode) {
	globalTableLink := v.getGlobalTable().getEntry(
		map[int]interface{}{
			FILTER_LINK: n.getTable(),
		},
	)
	if globalTableLink == nil {
		panic("something went wrong")
	}
	records := n.getTable().getRecords()

	for i, record := range records {
		if record.getKind() == "parameter" {
			continue
			//for now....
		}
		if i == 0 {
			record.setOffset(0)
		} else {
			record.setOffset((-records[i-1].getSize()) + (records[i-1].getOffset()))
		}
		if i == len(records)-1 {
			offset := record.getOffset() + (-record.getSize())
			globalTableLink.setOffset(offset)
			globalTableLink.setSize(-offset)

		}
	}
}
