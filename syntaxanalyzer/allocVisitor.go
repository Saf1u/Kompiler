package syntaxanalyzer

import (
	"compiler/configmap"
	"fmt"
	"os"
	"sort"
	"strings"
)

const (
	PRINT_BUFFER = "buffer"
	STACK_BASE   = "stackbase"
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
	size, err := sizeOf(typeInfo)
	if err != nil {
		panic("shouldnt happen")
	}
	recordA.setSize(size)
	recordA.setTag(tag)
	n.getTable().addRecord(recordA)
	v.functionScopelink.addRecord(recordA)

}
func (v *memAllocVisitor) visitMult(n *multNode) {
	typeInfo := n.getTable().getSingleEntry().getType().String()
	tag := getUniqueTempTag()
	recordA := newRecord(tag, TEMP_VAR, "", n.getLineNumber(), newTypeRecord(typeInfo), nil)
	size, err := sizeOf(typeInfo)
	if err != nil {
		panic("shouldnt happen")
	}
	recordA.setSize(size)
	recordA.setTag(tag)
	n.getTable().addRecord(recordA)
	v.functionScopelink.addRecord(recordA)

}
func (v *memAllocVisitor) visitRelOp(n *relOpNode) {
	typeInfo := INTEGER
	tag := getUniqueTempTag()
	recordA := newRecord(tag, TEMP_VAR, "", n.getLineNumber(), newTypeRecord(typeInfo), nil)
	size, err := sizeOf(typeInfo)
	if err != nil {
		panic("shouldnt happen")
	}
	recordA.setSize(size)
	recordA.setTag(tag)
	n.getTable().addRecord(recordA)
	v.functionScopelink.addRecord(recordA)

}
func (v *memAllocVisitor) visitIntlit(n *intLitNode) {
	typeInfo := n.getTable().getSingleEntry().getType().String()
	tag := getUniqueLitTag()
	recordA := newRecord(tag, TEMP_LIT, "", n.getLineNumber(), newTypeRecord(typeInfo), nil)
	size, err := sizeOf(typeInfo)
	if err != nil {
		panic("shouldnt happen")
	}
	recordA.setSize(size)
	recordA.setTag(tag)
	n.getTable().addRecord(recordA)
	v.functionScopelink.addRecord(recordA)
}
func (v *memAllocVisitor) visitNot(n *notNode) {
	typeInfo := n.getTable().getSingleEntry().getType().String()
	tag := getUniqueTempTag()
	recordA := newRecord(tag, TEMP_VAR, "", n.getLineNumber(), newTypeRecord(typeInfo), nil)
	size, err := sizeOf(typeInfo)
	if err != nil {
		panic("shouldnt happen")
	}
	recordA.setSize(size)
	recordA.setTag(tag)
	n.getTable().addRecord(recordA)
	v.functionScopelink.addRecord(recordA)

}
func (v *memAllocVisitor) visitSign(n *signNode) {
	typeInfo := n.getTable().getSingleEntry().getType().String()
	tag := getUniqueTempTag()
	recordA := newRecord(tag, TEMP_VAR, "", n.getLineNumber(), newTypeRecord(typeInfo), nil)
	size, err := sizeOf(typeInfo)
	if err != nil {
		panic("shouldnt happen")
	}
	recordA.setSize(size)
	recordA.setTag(tag)
	n.getTable().addRecord(recordA)
	v.functionScopelink.addRecord(recordA)

}
func (v *memAllocVisitor) visitVar(n *varNode) {
	typeInfo := n.getTable().getSingleEntry().getType().String()
	tag := getUniqueOffsetTag()
	recordA := newRecord(tag, TEMP_OFFSET, "", n.getLineNumber(), newTypeRecord(typeInfo), nil)
	size, err := sizeOf("integer")
	if err != nil {
		panic("shouldnt happen")
	}
	recordA.setSize(size)
	recordA.setTag(tag)
	n.getTable().addRecord(recordA)
	v.functionScopelink.addRecord(recordA)

}
func (v *memAllocVisitor) visitDot(n *dotNode) {
	switch n.getParent().(type) {
	case *varNode:
		typeInfo := n.getParent().getTable().getSingleEntry().getType().String()
		tag := getUniqueOffsetTag()
		recordA := newRecord(tag, TEMP_OFFSET, "", n.getLineNumber(), newTypeRecord(typeInfo), nil)
		size, err := sizeOf("integer")
		if err != nil {
			panic("shouldnt happen")
		}
		recordA.setSize(size)
		recordA.setTag(tag)
		n.getTable().addRecord(recordA)
		v.functionScopelink.addRecord(recordA)
	default:
		panic("not yet implemented functions")
	}

}

func (v *memAllocVisitor) visitLocalVarDecl(n *localVarNode) {
	switch n.getParent().getParent().(type) {
	case *funcDeclNode:
	default:
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
			if entry = v.functionScopelink.getEntry(map[int]interface{}{FILTER_KIND: "parameter", FILTER_NAME: name}); entry == nil {
				funcName := v.getGlobalTable().getEntry(map[int]interface{}{FILTER_LINK: v.functionScopelink}).getName()
				fmt.Println(funcName)
				fmt.Println(name)
				return
			}
		}
		entry.setTag(tag)
		baseType := getBaseType(typeInfo)
		size, err := sizeOf(baseType)
		if err != nil {
			size = 0
		}
		size = size * getDimensions(typeInfo)
		entry.setSize(size)
	}

}

func (v *memAllocVisitor) visitProgram(n *program) {
	// definitions := v.getGlobalTable().getEntries(
	// 	map[int]interface{}{
	// 		FILTER_KIND: FUNCDEF,
	// 	},
	// )
	//for _, definition := range definitions {
	// records := definition.getLink().getRecords()
	// for _, record := range records {
	// 	if record.getKind() != "parameter" {
	// 		tag := strings.TrimSpace(record.getTag())
	// 		writeToData(fmt.Sprintf("%-20s %-7s %d\n", tag, "res", record.getSize()))
	// 	}
	// }
	//}
	writeToData(fmt.Sprintf("%-20s %-7s %d\n", PRINT_BUFFER, "res", 200))
	//200 CHAR BUFFER
	writeToData(fmt.Sprintf("%-20s %-7s %d\n", STACK_BASE, "res", 2048))
	writeToData(fmt.Sprintf("%-20s %-7s %s,%d,%d,%d\n", "newline", "db", "", 13, 10, 0))
	writeToData("align\n")

	//2KB STACK

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
		if i == 0 {
			record.setOffset(0)
		} else {
			record.setOffset((records[i-1].getSize()) + (records[i-1].getOffset()))
		}
		if i == len(records)-1 {
			offset := record.getOffset() + (record.getSize())
			globalTableLink.setOffset(offset)
			globalTableLink.setSize(offset)

		}
	}
}
func (v *memAllocVisitor) visitReturnType(n *returnTypeNode) {
	switch n.getParent().(type) {
	case *funcDefNode:
		funcName := v.getGlobalTable().getEntry(map[int]interface{}{FILTER_LINK: v.functionScopelink}).getName()
		nameParts := strings.Split(funcName, "|")
		name := n.getTable().getSingleEntry().getName()
		index := strings.IndexRune(name, ':')
		name = name[:index]
		generateSelfRef := false
		className := ""
		retType := name
		if retType == "" {
			if nameParts[0] != "" {
				retType = nameParts[0]
			} else {
				retType = TYPE_ERR
			}
		}
		if nameParts[1] != "constructor" && nameParts[0] != "" {
			generateSelfRef = true
			className = nameParts[0]
		}
		baseType := getBaseType(retType)
		size, err := sizeOf(baseType)
		if err != nil {
			size = 0
		}
		size = size * getDimensions(retType)
		tag := generateNamedTag("return")
		regTag := generateNamedTag("returnAddress")
		recordA := newRecord(tag, TEMP_VAR, "", n.getLineNumber(), newTypeRecord(retType), nil)
		recordA.setSize(size)
		recordA.setTag(tag)
		regToJumpTo := newRecord(regTag, TEMP_OFFSET, "", n.getLineNumber(), newTypeRecord("ptr"), nil)
		regToJumpTo.setTag(regTag)
		ptrSize, err := sizeOf("ptr")
		if err != nil {
			panic(err)
		}
		if generateSelfRef {
			selfRef := generateNamedTag("self")
			self := newRecord(selfRef, TEMP_OFFSET, "", n.getLineNumber(), newTypeRecord(className), nil)
			ptrSize, _ := sizeOf("ptr")
			self.setTag(selfRef)
			self.setSize(ptrSize)
			v.functionScopelink.addtoStart(self)
		}
		regToJumpTo.setSize(ptrSize)
		v.functionScopelink.addtoStart(regToJumpTo)

		v.functionScopelink.addtoStart(recordA)
		n.getTable().addRecord(recordA)
	}

}
