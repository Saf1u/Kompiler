package syntaxanalyzer

import (
	"fmt"
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
func (v *memAllocVisitor) visitIndiceList(n *indiceListNode) {
	typeInfo := n.getTable().getSingleEntry().getType().String()
	tag := getUniqueOffsetTag()
	recordA := newRecord(tag, TEMP_LIT, "", n.getLineNumber(), newTypeRecord(typeInfo), nil)
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
		n.getTable().print(10)
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
			entry = v.functionScopelink.getEntry(map[int]interface{}{FILTER_KIND: "parameter", FILTER_NAME: name})
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
	writeToData(fmt.Sprintf("%-20s %-7s %d\n", PRINT_BUFFER, "res", 200))
	//200 CHAR BUFFER
	writeToData(fmt.Sprintf("%-20s %-7s %d\n", STACK_BASE, "res", 2048))
	writeToData(fmt.Sprintf("%-20s %-7s %s,%d,%d,%d\n", "newline", "db", "", 13, 10, 0))
	writeToData("align\n")

	//2KB STACK
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

func (v *memAllocVisitor) visitFuncCall(n *functionCall) {
	tag := generateNamedTag("functioncall")
	paramterList := n.getLeftMostChild().getRightSibling().getSingleEntry().getType().String()
	switch n.getLeftMostChild().(type) {
	case *idNode:
		id := fmt.Sprint(typeSepeator, n.getLeftMostChild().(*idNode).identifier)
		possibleFunction, returnType := searchForFunction(id, v.getGlobalTable(), paramterList, basicCompare)
		if possibleFunction == nil {
			possibleFunction, returnType = searchForFunction(id, v.getGlobalTable(), paramterList, matchVariableArraysCompare)
		}
		if possibleFunction == nil {
			recordA := newRecord(tag, TEMP_VAR, "", n.getLineNumber(), newTypeRecord(TYPE_ERR), nil)
			size, _ := sizeOf(TYPE_ERR)
			recordA.setSize(size)
			v.functionScopelink.addRecord(recordA)
			return

		}
		recordA := newRecord(tag, TEMP_VAR, "", n.getLineNumber(), newTypeRecord(returnType), nil)
		baseType := getBaseType(returnType)
		size, err := sizeOf(baseType)
		if err != nil {
			size = 0
		}
		size = size * getDimensions(returnType)
		recordA.setSize(size)
		recordA.setTag(tag)
		v.functionScopelink.addRecord(recordA)
		n.getTable().addRecord(recordA)

	}

}
