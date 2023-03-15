package syntaxanalyzer

import (
	"fmt"
	"regexp"
	"strings"
)

const typeSepeator = "|"
const (
	ID               = "id"
	INHERITANCE      = "inheritance"
	VARIABLE         = "variable"
	FUNCDECL         = "funcdecl"
	CLASS            = "class"
	TYPE             = "type"
	VISIBILITY       = "visibility"
	DIMENSIONLIST    = "dimensionList"
	DIMENSION        = "dimension"
	FPARAMLIST       = "fparamList"
	RETURNTYPE       = "returnType"
	FUNCDEF          = "funcdef"
	INTLIT           = "intlit"
	FLOATLIT         = "floatlit"
	INTEGER          = "INTEGER"
	FLOAT            = "FLOAT"
	TYPE_ERR         = "ERR"
	INDEXING_ERR     = "ERRIN"
	ACTIVE_VAR       = "VAR_ENTRY_FOR_A_SCOPE"
	ACTIVE_PARAMETER = "PARAM_ENTRY_FOR_A_SCOPE"
)

/*
functions: X|Y
X possible scope
y possible name

func params
x:[|ni]*
x return type
ni any num of params whre i>=1
*/
const (
	sameDeclarationInScopeError         = "%s %s aready declared:line %d"
	classNotDeclaredError               = "class \"%s\" not declared so function \"%s\" has no class:line %d"
	functionNotDeclaredError            = "function \"%s\" not declared in class \"%s\" :line %d"
	functionOverrloadWarn               = "function \"%s\" is being overloaded:line %d"
	inheritedClassNotDeclaredError      = "class \"%s\" not declared so cannot be inherited:line %d"
	inheritedClassAlreadyInheritedError = "class \"%s\" already inherited:line %d"
	shadowWarn                          = "member \"%s\" is being shadowed:line %d"
	cyclicDependencyError               = "class \"%s\" is being cyclicly inherited:line %d"
	functionNotDefinedError             = "function \"%s\" declared in class \"%s\" not defined:line %d"
	funcParameterShadowed               = "function parameter \"%s\" is being shadowed:line %d"
	varNotDeclaredError                 = "variable  \"%s\" not declared in current scope:line %d"
	invalidIndexType                    = "only integers are valid indexes:line %d"
	typeMismatchError                   = "varaible \"%s\" not used with declared type line:%d"
	cannotAssignError                   = "cannot assign mismatched types line:%d"
	arithmeticError                     = "cannot operate on mismatched types line:%d"
)

var errorBin = map[int][]string{}

func saveErrorNew(lineNum int, err string, args ...any) {
	args = append(args, lineNum)
	err = fmt.Sprintf(err, args...)
	errorBin[lineNum] = append(errorBin[lineNum], err)

}

type visitor interface {
	visit(node)
	visitAdd(*addNode)
	visitId(*idNode)
	visitVisiblity(*visibilityNode)
	visitFuncDecl(*funcDeclNode)
	visitClassDecl(*classDecl)
	visitWrite(*writeNode)
	visitReturn(*returnNode)
	visitInheritance(*inheritanceNode)
	visitStatBlock(*statBlockNode)
	visitifStatement(*ifStatementNode)
	visitWhileStatement(*whileStatementNode)
	visitClassList(*classListNode)
	visitFuncDefList(*funcDefListNode)
	visitFuncDef(*funcDefNode)
	visitProgramBlock(*programBlockNode)
	visitScope(*scopeNode)
	visitType(*typeNode)
	visitReturnType(*returnTypeNode)
	visitParamlist(*paramListNode)
	visitFparamlist(*fparamListNode)
	visitIndiceList(*indiceListNode)
	visitDimList(*dimListNode)
	visitEpsilon(*epsilonNode)
	visitNot(*notNode)
	visitDot(*dotNode)
	visitRelOp(*relOpNode)
	visitLocalVarDecl(*localVarNode)
	visitReadStatement(*readStatementNode)
	visitClassVarDecl(*ClassVarNode)
	visitIntlit(*intLitNode)
	visitFloatLit(*floatNode)
	visitDim(*dimNode)
	visitSign(*signNode)
	visitMult(*multNode)
	visitVar(*varNode)
	visitFuncCall(*functionCall)
	visitProgram(*program)
	visitAssign(*assignStatNode)
	propagateScope(string)
	getGlobalTable() *symbolTable
}
type defaultVisitor struct {
	gloablTable *symbolTable
}

func (v *defaultVisitor) propagateScope(s string) {

}

func (v *defaultVisitor) getGlobalTable() *symbolTable {
	return v.gloablTable
}

// visit provides a mock function with given fields: n*
func (v *defaultVisitor) visit(n node) {
}

// visitAdd provides a mock function with given fields: n*
func (v *defaultVisitor) visitAdd(n *addNode) {

}

// visitClassDecl provides a mock function with given fields: n*
func (v *defaultVisitor) visitClassDecl(n *classDecl) {

}

// visitClassList provides a mock function with given fields: n*
func (v *defaultVisitor) visitClassList(n *classListNode) {

}

// visitClassVarDecl provides a mock function with given fields: n*
func (v *defaultVisitor) visitClassVarDecl(n *ClassVarNode) {

}

// visitDim provides a mock function with given fields: n*
func (v *defaultVisitor) visitDim(n *dimNode) {

}

// visitDimList provides a mock function with given fields: n*
func (v *defaultVisitor) visitDimList(n *dimListNode) {

}

// visitDot provides a mock function with given fields: n*
func (v *defaultVisitor) visitDot(n *dotNode) {

}

// visitEpsilon provides a mock function with given fields: n*
func (v *defaultVisitor) visitEpsilon(n *epsilonNode) {

}

// visitFloatLit provides a mock function with given fields: n*
func (v *defaultVisitor) visitFloatLit(n *floatNode) {

}

// visitFparamlist provides a mock function with given fields: n*
func (v *defaultVisitor) visitFparamlist(n *fparamListNode) {

}

// visitFuncCall provides a mock function with given fields: n*
func (v *defaultVisitor) visitFuncCall(n *functionCall) {

}

// visitFuncDecl provides a mock function with given fields: n*
func (v *defaultVisitor) visitFuncDecl(n *funcDeclNode) {

}

// visitFuncDef provides a mock function with given fields: n*
func (v *defaultVisitor) visitFuncDef(n *funcDefNode) {

}

// visitFuncDefList provides a mock function with given fields: n*
func (v *defaultVisitor) visitFuncDefList(n *funcDefListNode) {

}

// visitId provides a mock function with given fields: n*
func (v *defaultVisitor) visitId(n *idNode) {

}

// visitIndiceList provides a mock function with given fields: n*
func (v *defaultVisitor) visitIndiceList(n *indiceListNode) {

}

// visitInheritance provides a mock function with given fields: n*
func (v *defaultVisitor) visitInheritance(n *inheritanceNode) {

}

// visitIntlit provides a mock function with given fields: n*
func (v *defaultVisitor) visitIntlit(n *intLitNode) {

}

// visitLocalVarDecl provides a mock function with given fields: n*
func (v *defaultVisitor) visitLocalVarDecl(n *localVarNode) {

}

// visitMult provides a mock function with given fields: n*
func (v *defaultVisitor) visitMult(n *multNode) {

}

// visitNot provides a mock function with given fields: n*
func (v *defaultVisitor) visitNot(n *notNode) {

}

// visitParamlist provides a mock function with given fields: n*
func (v *defaultVisitor) visitParamlist(n *paramListNode) {

}

// visitProgramBlock provides a mock function with given fields: n*
func (v *defaultVisitor) visitProgramBlock(n *programBlockNode) {

}

// visitReadStatement provides a mock function with given fields: n*
func (v *defaultVisitor) visitReadStatement(n *readStatementNode) {

}

// visitRelOp provides a mock function with given fields: n*
func (v *defaultVisitor) visitRelOp(n *relOpNode) {

}

// visitReturn provides a mock function with given fields: n*
func (v *defaultVisitor) visitReturn(n *returnNode) {

}

// visitReturnType provides a mock function with given fields: n*
func (v *defaultVisitor) visitReturnType(n *returnTypeNode) {

}

// visitScope provides a mock function with given fields: n*
func (v *defaultVisitor) visitScope(n *scopeNode) {

}

// visitSign provides a mock function with given fields: n*
func (v *defaultVisitor) visitSign(n *signNode) {

}

// visitStatBlock provides a mock function with given fields: n*
func (v *defaultVisitor) visitStatBlock(n *statBlockNode) {

}

// visitType provides a mock function with given fields: n*
func (v *defaultVisitor) visitType(n *typeNode) {

}

// visitVar provides a mock function with given fields: n*
func (v *defaultVisitor) visitVar(n *varNode) {

}

// visitVisiblity provides a mock function with given fields: n*
func (v *defaultVisitor) visitVisiblity(n *visibilityNode) {

}

// visitWhileStatement provides a mock function with given fields: n*
func (v *defaultVisitor) visitWhileStatement(n *whileStatementNode) {

}

// visitWrite provides a mock function with given fields: n*
func (v *defaultVisitor) visitWrite(n *writeNode) {

}

// visitifStatement provides a mock function with given fields: n*
func (v *defaultVisitor) visitifStatement(n *ifStatementNode) {

}

func (v *defaultVisitor) visitAssign(n *assignStatNode) {

}
func (v *defaultVisitor) visitProgram(n *program) {
	fmt.Println("------")
	for _, line := range errorBin {
		for _, e := range line {
			fmt.Println(e)
		}
	}
}

type typeCheckVisitor struct {
	*defaultVisitor
	scope string
}

func (v *typeCheckVisitor) propagateScope(scopeInfo string) {
	v.scope = scopeInfo
}

func (v *typeCheckVisitor) visitAdd(n *addNode) {
	leftop := n.getLeftMostChild()
	rightop := leftop.getRightSibling()
	typeLeftOp := leftop.getTable().getSingleEntry().getType()
	typeRightOp := rightop.getTable().getSingleEntry().getType()
	var rec *symbolTableRecord
	if !typeLeftOp.equal(typeRightOp) {
		saveErrorNew(n.getLineNumber(), arithmeticError)
		rec = newRecord(TYPE_ERR, TYPE_ERR, "", n.getLineNumber(), newTypeRecord(TYPE_ERR), nil)

	} else {
		rec = newRecord(typeLeftOp.typeInfo, typeLeftOp.typeInfo, "", n.getLineNumber(), newTypeRecord(typeLeftOp.typeInfo), nil)
	}
	n.getTable().addRecord(rec)
}

func (v *typeCheckVisitor) visitMult(n *multNode) {
	leftop := n.getLeftMostChild()
	rightop := leftop.getRightSibling()
	typeLeftOp := leftop.getTable().getSingleEntry().getType()
	typeRightOp := rightop.getTable().getSingleEntry().getType()
	var rec *symbolTableRecord
	if !typeLeftOp.equal(typeRightOp) {
		saveErrorNew(n.getLineNumber(), arithmeticError)
		rec = newRecord(TYPE_ERR, TYPE_ERR, "", n.getLineNumber(), newTypeRecord(TYPE_ERR), nil)

	} else {
		rec = newRecord(typeLeftOp.String(), typeLeftOp.String(), "", n.getLineNumber(), newTypeRecord(typeLeftOp.String()), nil)
	}
	n.getTable().addRecord(rec)
}

func (v *typeCheckVisitor) visitIntlit(n *intLitNode) {
	intRec := newRecord(INTLIT, INTLIT, "", n.getLineNumber(), newTypeRecord(INTLIT), nil)
	n.getTable().addRecord(intRec)
}

func (v *typeCheckVisitor) visitFloatLit(n *floatNode) {
	floatRec := newRecord(FLOATLIT, FLOATLIT, "", n.getLineNumber(), newTypeRecord(FLOATLIT), nil)
	n.getTable().addRecord(floatRec)
}
func (v *typeCheckVisitor) visitNot(n *notNode) {
	leftop := n.getLeftMostChild().getTable().getSingleEntry().getType().String()
	n.getTable().addRecord(newRecord(leftop, leftop, "", n.getLineNumber(), newTypeRecord(leftop), nil))

}
func (v *typeCheckVisitor) visitSign(n *signNode) {
	leftop := n.getLeftMostChild().getTable().getSingleEntry().getType().String()
	n.getTable().addRecord(newRecord(leftop, leftop, "", n.getLineNumber(), newTypeRecord(leftop), nil))

}
func (v *typeCheckVisitor) visitAssign(n *assignStatNode) {
	leftOp := n.getLeftMostChild().getSingleEntry()
	rightOp := n.getLeftMostChild().getRightSibling().getSingleEntry()
	if !(leftOp.getType().typeInfo != TYPE_ERR && rightOp.getType().typeInfo != TYPE_ERR && leftOp.getType().typeInfo == rightOp.getType().typeInfo) {
		saveErrorNew(n.getLineNumber(), cannotAssignError)
	}

}
func (v *typeCheckVisitor) visitVar(n *varNode) {
	lookupInfo := strings.Split(v.scope, "~")
	scope := v.getGlobalTable().getEntry(
		map[int]interface{}{
			FILTER_TYPE: newTypeRecord(lookupInfo[1]),
			FILTER_NAME: lookupInfo[0],
		},
	)

	left := n.getLeftMostChild().getSingleEntry()
	indiceList := n.getLeftMostChild().getRightSibling().getTable().getEntry(
		map[int]interface{}{
			FILTER_NAME: "list",
		},
	)
	if left.getType().typeInfo == TYPE_ERR || indiceList == nil {
		n.getTable().addRecord(newRecord(TYPE_ERR, TYPE_ERR, "", n.getLineNumber(), newTypeRecord(TYPE_ERR), nil))
		return
	}
	identifier := left.getName()
	typeInfoId := left.getType().typeInfo
	isMethod := false
	class := strings.Split(lookupInfo[0], typeSepeator)[0]
	if class != "" {
		isMethod = true
	}
	entry := scope.getLink().getEntry(
		map[int]interface{}{
			FILTER_NAME: identifier,
		},
	)
	if !isMethod && entry == nil {
		saveErrorNew(n.getLineNumber(), varNotDeclaredError, identifier)
		n.getTable().addRecord(newRecord(TYPE_ERR, TYPE_ERR, "", n.getLineNumber(), newTypeRecord(TYPE_ERR), nil))
		return
	}
	if entry == nil {
		classTable := v.getGlobalTable().getEntry(
			map[int]interface{}{
				FILTER_NAME: class,
				FILTER_KIND: CLASS,
			},
		).getLink()
		entry = recursivelySearchForId(classTable, identifier)
	}
	if entry == nil {
		saveErrorNew(n.getLineNumber(), varNotDeclaredError, identifier)
		n.getTable().addRecord(newRecord(TYPE_ERR, TYPE_ERR, "", n.getLineNumber(), newTypeRecord(TYPE_ERR), nil))
		return
	}
	typeEntry := entry.getType().typeInfo

	if typeInfoId != "" {
		typeInfoId = fmt.Sprint("^", typeInfoId, indiceList.getType().typeInfo)
	} else {
		typeInfoId = fmt.Sprint("^[a-zA-Z]*", indiceList.getType().typeInfo)
	}
	if ok, _ := regexp.MatchString(typeInfoId, typeEntry); !ok {
		saveErrorNew(n.getLineNumber(), typeMismatchError, identifier)
		n.getTable().addRecord(newRecord(TYPE_ERR, TYPE_ERR, "", n.getLineNumber(), newTypeRecord(TYPE_ERR), nil))
		return
	}
	index := strings.IndexRune(typeEntry, '[')
	basetype := ""
	if index != -1 {
		basetype = typeEntry[0:index]
	} else {
		basetype = typeEntry
	}
	n.getTable().addRecord(newRecord("type", "type", "", n.getLineNumber(), newTypeRecord(basetype), nil))

}
func recursivelySearchForId(classTable *symbolTable, identifier string) *symbolTableRecord {

	record := classTable.getEntry(
		map[int]interface{}{
			FILTER_NAME: identifier,
			FILTER_KIND: VARIABLE,
		},
	)
	if record != nil {
		return record
	}
	inheritedClasses := classTable.getEntries(
		map[int]interface{}{
			FILTER_KIND: CLASS,
		},
	)
	for _, class := range inheritedClasses {
		record := recursivelySearchForId(class.getLink(), identifier)
		if record != nil {
			return record
		}
	}
	return nil
}

func (v *typeCheckVisitor) visitIndiceList(n *indiceListNode) {
	child := n.getLeftMostChild()
	indices := ""
	for child != nil {
		switch child.(type) {
		case *epsilonNode:
		default:
			if child.getTable().getSingleEntry().getType().String() != INTLIT {
				n.getTable().addRecord(newRecord(TYPE_ERR, TYPE_ERR, "", n.getLineNumber(), newTypeRecord(TYPE_ERR), nil))
				saveErrorNew(n.getLineNumber(), invalidIndexType)
				return
			}
			indices = fmt.Sprint(indices, "\\[[^\\]]*\\]")

		}
		child = child.getRightSibling()
	}

	indices = fmt.Sprint(indices, "$")

	n.getTable().addRecord(newRecord("list", "sqrbrackets", "", n.getLineNumber(), newTypeRecord(indices), nil))

}

type declarationVisitor struct {
	*defaultVisitor
}
type inheritVisitor struct {
	*defaultVisitor
}

func (v *declarationVisitor) visitProgram(n *program) {
	entries := v.gloablTable.getRecords()
	for _, entry := range entries {
		if entry.getKind() == FUNCDEF {
			name := entry.getName()
			parts := strings.Split(name, typeSepeator)
			if parts[0] != "" {
				class := v.getGlobalTable().getEntryByName(parts[0])
				if class == nil {
					saveErrorNew(entry.getLine(), classNotDeclaredError, parts[0], parts[1])
				} else {
					function := class.getLink().getEntry(

						map[int]interface{}{
							FILTER_NAME: parts[1],
							FILTER_KIND: FUNCDECL,
							FILTER_TYPE: entry.getType(),
						},
					)
					if function == nil {
						saveErrorNew(entry.getLine(), functionNotDeclaredError, parts[1], parts[0])
					}
				}

			}

		}
	}
	v.getGlobalTable().print(10)
	for _, line := range errorBin {
		for _, e := range line {
			fmt.Println(e)
		}
	}

}

func (v *inheritVisitor) visitClassDecl(n *classDecl) {
	entry := n.getTable().getEntry(
		map[int]interface{}{
			FILTER_KIND: INHERITANCE,
		},
	).getName()

	inheritanceList := strings.Split(entry, typeSepeator)
	for _, inheritedClass := range inheritanceList {
		if inheritedClass != "" {
			class := v.getGlobalTable().getEntry(
				map[int]interface{}{
					FILTER_NAME: inheritedClass,
				},
			)
			if class == nil {
				saveErrorNew(n.getLineNumber(), inheritedClassNotDeclaredError, inheritedClass)
				continue
			}

			entry := n.getTable().getEntry(
				map[int]interface{}{
					FILTER_NAME: inheritedClass,
					FILTER_KIND: CLASS,
				})
			if entry != nil {
				saveErrorNew(n.getLineNumber(), inheritedClassAlreadyInheritedError, inheritedClass)
				continue
			}
			inheritedClassTable := class.getLink()
			if inheritedClassTable == n.getTable() {
				saveErrorNew(n.getLineNumber(), cyclicDependencyError, inheritedClass)
				continue
			}
			check := map[string]bool{
				inheritedClass: true,
			}
			switch cyclicChecker(v.getGlobalTable(), inheritedClass, n.getTable(), check) {

			case false:
				inheritedClass := newRecord(inheritedClass, "class", "", n.getLineNumber(), nil, inheritedClassTable)
				n.getTable().addRecord(inheritedClass)
			case true:
				saveErrorNew(n.getLineNumber(), cyclicDependencyError, inheritedClass)

			}

		}
	}

}

func cyclicChecker(gloablTable *symbolTable, starter string, classToFind *symbolTable, visited map[string]bool) bool {

	class := gloablTable.getEntry(
		map[int]interface{}{
			FILTER_NAME: starter,
		},
	)
	entry := class.getLink().getEntry(
		map[int]interface{}{
			FILTER_KIND: INHERITANCE,
		},
	).getName()

	inheritanceList := strings.Split(entry, typeSepeator)
	for _, inheritedClass := range inheritanceList {
		if inheritedClass == "" {
			continue
		}
		class := gloablTable.getEntry(map[int]interface{}{FILTER_NAME: inheritedClass})
		if class == nil {
			continue
		}
		if class.getLink() == classToFind {
			return true
		} else {
			if _, ok := visited[inheritedClass]; !ok && cyclicChecker(gloablTable, inheritedClass, classToFind, visited) {
				return true
			}
		}

	}

	return false

}

func (v *declarationVisitor) visitClassDecl(n *classDecl) {
	table := n.getTable()
	className := v.getGlobalTable().getEntry(
		map[int]interface{}{
			FILTER_LINK: table,
		},
	).getName()

	marker := make(map[*symbolTable]bool)
	for _, record := range table.getRecords() {
		if record.getKind() == CLASS {
			recursiveInheritanceShadowCheck(table, record.getLink(), marker, v.getGlobalTable())

		}
		if record.getKind() == FUNCDECL {
			entry := v.getGlobalTable().getEntry(
				map[int]interface{}{
					FILTER_NAME: fmt.Sprint(className, typeSepeator, record.getName()),
					FILTER_KIND: FUNCDEF,
					FILTER_TYPE: record.getType(),
				},
			)
			if entry == nil {
				saveErrorNew(record.getLine(), functionNotDefinedError, record.getName(), className)
			} else {
				record.SetTablelink(entry.getLink())
			}

		}

	}

}

func recursiveInheritanceShadowCheck(currentClassRecords *symbolTable, inheritedClassTable *symbolTable, marker map[*symbolTable]bool, globalTable *symbolTable) {
	if _, ok := marker[inheritedClassTable]; ok {
		return
	}

	marker[inheritedClassTable] = true
	for _, record := range inheritedClassTable.getRecords() {
		switch record.getKind() {
		case CLASS:
			recursiveInheritanceShadowCheck(currentClassRecords, record.getLink(), marker, globalTable)
		default:

			if currentClassRecords.exist(record.getName(), record.getKind(), record.getType()) {
				switch record.getKind() {
				case VARIABLE, FUNCDECL:
					entry := currentClassRecords.getEntry(map[int]interface{}{FILTER_NAME: record.getName(), FILTER_KIND: record.getKind()})
					saveErrorNew(entry.getLine(), shadowWarn, entry.getName())
				}
			}

		}
	}
}

type tableVisitor struct {
	*defaultVisitor
}

func NewTableVisitor() []visitor {
	gloablTable := makeTable()
	visitors := make([]visitor, 0)
	visitors = append(visitors, &tableVisitor{&defaultVisitor{gloablTable: gloablTable}})
	visitors = append(visitors, &inheritVisitor{&defaultVisitor{gloablTable: gloablTable}})
	visitors = append(visitors, &declarationVisitor{&defaultVisitor{gloablTable: gloablTable}})
	visitors = append(visitors, &typeCheckVisitor{&defaultVisitor{gloablTable: gloablTable}, ""})
	return visitors
}

// visit provides a mock function with given fields: n*
func (v *tableVisitor) visit(n node) {
}

// visitAdd provides a mock function with given fields: n*
func (v *tableVisitor) visitAdd(n *addNode) {

}

// visitClassDecl provides a mock function with given fields: n*
func (v *tableVisitor) visitClassDecl(n *classDecl) {
	left := n.getLeftMostChild()
	id := ""
	for left != nil {
		entry := left.getSingleEntry()
		// n.table.addRecord(entry)
		switch entry.getKind() {
		case ID:
			id = entry.getName()
		case INHERITANCE:
			n.getTable().addRecord(newRecord(entry.getName(), INHERITANCE, "", entry.getLine(), nil, nil))
		case FUNCDECL, VARIABLE:
			if !n.getTable().exist(entry.getName(), entry.getKind(), entry.getType()) {
				if exist := n.getTable().getEntry(map[int]interface{}{
					FILTER_KIND: entry.kind,
					FILTER_NAME: entry.name,
				}); exist != nil {
					saveErrorNew(entry.getLine(), functionOverrloadWarn, entry.getName())
				}
				n.getTable().addRecord(newRecord(entry.getName(), entry.getKind(), entry.getVisibility(), entry.getLine(), entry.getType(), nil))
			} else {
				saveErrorNew(entry.getLine(), sameDeclarationInScopeError, entry.getKind(), entry.getName())
			}
		}
		left = left.getRightSibling()

	}
	class := newRecord(id, CLASS, "", n.getLineNumber(), nil, n.getTable())
	if !v.getGlobalTable().exist(id, class.getKind(), class.getType()) {

		v.getGlobalTable().addRecord(class)
	} else {
		saveErrorNew(class.getLine(), sameDeclarationInScopeError, class.getKind(), class.getName())
	}

}

// visitClassList provides a mock function with given fields: n*
func (v *tableVisitor) visitClassList(n *classListNode) {

}

// visitClassVarDecl provides a mock function with given fields: n*
func (v *tableVisitor) visitClassVarDecl(n *ClassVarNode) {
	classVarEntry := newRecord("", VARIABLE, "", n.getLineNumber(), nil, nil)
	typeInfo := ""
	switch n.getLeftMostChild().(type) {
	case *epsilonNode:
	default:
		left := n.getLeftMostChild()
		for left != nil {
			entry := left.getSingleEntry()
			switch entry.getKind() {
			case VISIBILITY:
				classVarEntry.SetVisibilityEntry(entry.getName())
			case DIMENSIONLIST:
				typeInfo = fmt.Sprint(typeInfo, entry.getName())
			case TYPE:
				typeInfo = fmt.Sprint(entry.getName(), typeInfo)
			case ID:
				classVarEntry.SetNameEntry(entry.getName())

			}

			left = left.getRightSibling()
		}
		typeRec := newTypeRecord(typeInfo)
		classVarEntry.SetTypeEntry(typeRec)
		n.table.addRecord(classVarEntry)

	}

}

// visitDim provides a mock function with given fields: n*
func (v *tableVisitor) visitDim(n *dimNode) {
	dimType := "[]"
	if n.value != "]" {
		//TODO: DANGER!!!
		dimType = fmt.Sprint("[", n.value, "]")
	}
	record := newRecord(dimType, DIMENSION, "", n.getLineNumber(), newTypeRecord(""), nil)
	n.table.addRecord(record)
}

// visitDimList provides a mock function with given fields: n*
func (v *tableVisitor) visitDimList(n *dimListNode) {
	listType := ""
	switch n.getLeftMostChild().(type) {
	case *epsilonNode:
	default:
		left := n.getLeftMostChild()
		for left != nil {
			entry := left.getSingleEntry()
			listType = fmt.Sprint(listType, entry.getName())
			left = left.getRightSibling()
		}

	}
	record := newRecord(listType, DIMENSIONLIST, "", n.getLineNumber(), newTypeRecord(""), nil)
	n.table.addRecord(record)
}

// visitDot provides a mock function with given fields: n*
func (v *tableVisitor) visitDot(n *dotNode) {

}

// visitEpsilon provides a mock function with given fields: n*
func (v *tableVisitor) visitEpsilon(n *epsilonNode) {

}

// visitFloatLit provides a mock function with given fields: n*
func (v *tableVisitor) visitFloatLit(n *floatNode) {

}

// visitFparamlist provides a mock function with given fields: n*
func (v *tableVisitor) visitFparamlist(n *fparamListNode) {
	fParamEntry := newRecord("", FPARAMLIST, "", n.getLineNumber(), nil, nil)
	typeInfo := ""
	switch n.getLeftMostChild().(type) {
	case *epsilonNode:
		n.table.addRecord(fParamEntry)
		return
	default:
		left := n.getLeftMostChild()
		for left != nil {
			entry := left.getSingleEntry()
			typeEntry := entry.getType()
			n.table.addRecord(entry)
			typeInfo = fmt.Sprint(typeInfo, typeSepeator, typeEntry)
			left = left.getRightSibling()

		}

	}
	fParamEntry.SetNameEntry(typeInfo)
	n.table.addRecord(fParamEntry)

}

// visitFuncCall provides a mock function with given fields: n*
func (v *tableVisitor) visitFuncCall(n *functionCall) {

}

// visitFuncDecl provides a mock function with given fields: n*
func (v *tableVisitor) visitFuncDecl(n *funcDeclNode) {
	funcDeclEntry := newRecord("", FUNCDECL, "", n.getLineNumber(), nil, nil)
	typeInfo := ""
	switch n.getLeftMostChild().(type) {
	default:
		left := n.getLeftMostChild()
		for left != nil {
			switch left.(type) {
			case *visibilityNode:
				entry := left.getSingleEntry()
				funcDeclEntry.SetVisibilityEntry(entry.getName())
			case *fparamListNode:
				typeInfo = fmt.Sprint(typeInfo, left.getTable().getEntryByKind(FPARAMLIST).getName())
			case *returnTypeNode:
				entry := left.getSingleEntry()
				typeInfo = fmt.Sprint(entry.getName(), typeInfo)
			case *idNode:
				entry := left.getSingleEntry()
				funcDeclEntry.SetNameEntry(entry.getName())

			}

			left = left.getRightSibling()
		}
		typeRec := newTypeRecord(typeInfo)
		funcDeclEntry.SetTypeEntry(typeRec)
		n.table.addRecord(funcDeclEntry)

	}

}
func (v *tableVisitor) visitVar(n *varNode) {

}

// visitFuncDef provides a mock function with given fields: n*
func (v *tableVisitor) visitFuncDef(n *funcDefNode) {
	funcDefEntry := newRecord("", FUNCDEF, "", n.getLineNumber(), nil, nil)
	scope := ""
	id := ""
	typeInfo := ""
	switch n.getLeftMostChild().(type) {
	default:
		left := n.getLeftMostChild()
		for left != nil {
			switch left.(type) {
			case *statBlockNode:
				records := left.getTable().getRecords()
				for _, record := range records {
					existingRecord := n.getTable().getEntry(
						map[int]interface{}{
							FILTER_NAME: record.getName(),
						},
					)
					if existingRecord != nil {
						saveErrorNew(record.getLine(), sameDeclarationInScopeError, record.getKind(), record.getName())
					} else {
						n.getTable().addRecord(record)
					}

				}
			case *fparamListNode:
				records := left.getTable().getRecords()
				for _, record := range records {
					switch record.getKind() {
					case VARIABLE:
						record.SetKindEntry("parameter")
						n.getTable().addRecord(record)
					case FPARAMLIST:
						typeInfo = fmt.Sprint(typeInfo, record.getName())
					}

				}

			case *returnTypeNode:
				typeInfo = fmt.Sprint(left.getSingleEntry().getName(), typeInfo)
			case *idNode:
				id = left.getTable().getSingleEntry().getName()
			case *scopeNode:
				scope = left.getTable().getSingleEntry().getName()

			}

			left = left.getRightSibling()
		}
		typeRec := newTypeRecord(typeInfo)
		funcDefEntry.SetTypeEntry(typeRec)
		id = fmt.Sprint(scope, typeSepeator, id)
		funcDefEntry.SetNameEntry(id)
		funcDefEntry.SetTablelink(n.getTable())
		if !v.getGlobalTable().exist(id, funcDefEntry.getKind(), funcDefEntry.getType()) {
			v.getGlobalTable().addRecord(funcDefEntry)
		} else {
			saveErrorNew(funcDefEntry.getLine(), sameDeclarationInScopeError, funcDefEntry.getKind(), funcDefEntry.getName())
		}

	}

}

// visitFuncDefList provides a mock function with given fields: n*
func (v *tableVisitor) visitFuncDefList(n *funcDefListNode) {

}

// visitId provides a mock function with given fields: n*
func (v *tableVisitor) visitId(n *idNode) {
	record := newRecord(n.identifier, ID, "", n.getLineNumber(), newTypeRecord(""), nil)
	n.table.addRecord(record)

}

// visitIndiceList provides a mock function with given fields: n*
func (v *tableVisitor) visitIndiceList(n *indiceListNode) {

}

// visitInheritance provides a mock function with given fields: n*
func (v *tableVisitor) visitInheritance(n *inheritanceNode) {
	inheritanceEntry := newRecord("", INHERITANCE, "", n.getLineNumber(), nil, nil)
	typeInfo := ""
	switch n.getLeftMostChild().(type) {
	case *epsilonNode:
		n.table.addRecord(inheritanceEntry)
		return
	default:
		left := n.getLeftMostChild()
		for left != nil {
			entry := left.getSingleEntry()
			class := entry.getName()
			typeInfo = fmt.Sprint(typeInfo, typeSepeator, class)
			left = left.getRightSibling()

		}

	}
	inheritanceEntry.SetNameEntry(typeInfo)
	n.table.addRecord(inheritanceEntry)

}

// visitIntlit provides a mock function with given fields: n*
func (v *tableVisitor) visitIntlit(n *intLitNode) {

}

// visitLocalVarDecl provides a mock function with given fields: n*
func (v *tableVisitor) visitLocalVarDecl(n *localVarNode) {

	localVarEntry := newRecord("", VARIABLE, "", n.getLineNumber(), nil, nil)
	typeInfo := ""
	switch n.getLeftMostChild().(type) {
	case *epsilonNode:
	default:
		left := n.getLeftMostChild()
		for left != nil {
			entry := left.getSingleEntry()
			if entry != nil {
				switch entry.getKind() {
				case DIMENSIONLIST:
					typeInfo = fmt.Sprint(typeInfo, entry.getName())
				case TYPE:
					typeInfo = fmt.Sprint(entry.getName(), typeInfo)
				case ID:
					localVarEntry.SetNameEntry(entry.getName())

				}
			}

			left = left.getRightSibling()
		}
		typeRec := newTypeRecord(typeInfo)
		localVarEntry.SetTypeEntry(typeRec)
		n.table.addRecord(localVarEntry)
	}

}

// visitMult provides a mock function with given fields: n*
func (v *tableVisitor) visitMult(n *multNode) {

}

// visitNot provides a mock function with given fields: n*
func (v *tableVisitor) visitNot(n *notNode) {

}

// visitParamlist provides a mock function with given fields: n*
func (v *tableVisitor) visitParamlist(n *paramListNode) {

}

// visitProgramBlock provides a mock function with given fields: n*
func (v *tableVisitor) visitProgramBlock(n *programBlockNode) {

}

// visitReadStatement provides a mock function with given fields: n*
func (v *tableVisitor) visitReadStatement(n *readStatementNode) {

}

// visitRelOp provides a mock function with given fields: n*
func (v *tableVisitor) visitRelOp(n *relOpNode) {

}

// visitReturn provides a mock function with given fields: n*
func (v *tableVisitor) visitReturn(n *returnNode) {

}

// visitReturnType provides a mock function with given fields: n*
func (v *tableVisitor) visitReturnType(n *returnTypeNode) {
	record := newRecord(n.typeName+":", RETURNTYPE, "", n.getLineNumber(), newTypeRecord(""), nil)
	n.table.addRecord(record)

}

// visitScope provides a mock function with given fields: n*
func (v *tableVisitor) visitScope(n *scopeNode) {
	record := newRecord(n.identifier, "scope", "", n.getLineNumber(), newTypeRecord(""), nil)
	n.table.addRecord(record)

}

// visitSign provides a mock function with given fields: n*
func (v *tableVisitor) visitSign(n *signNode) {

}

// visitStatBlock provides a mock function with given fields: n*
func (v *tableVisitor) visitStatBlock(n *statBlockNode) {

	left := n.getLeftMostChild()
	for left != nil {
		switch left.(type) {
		case *localVarNode:
			record := newRecord(left.getTable().getSingleEntry().getName(), left.getTable().getSingleEntry().getKind(), "", left.getLineNumber(), left.getTable().getSingleEntry().getType(), nil)
			if !n.table.exist(record.getName(), record.getKind(), record.getType()) {
				n.table.addRecord(record)
			} else {
				saveErrorNew(record.getLine(), sameDeclarationInScopeError, record.getKind(), record.getName())
			}
		}
		left = left.getRightSibling()
	}

}

// visitType provides a mock function with given fields: n*
func (v *tableVisitor) visitType(n *typeNode) {
	record := newRecord(n.typeName, TYPE, "", n.getLineNumber(), newTypeRecord(""), nil)
	n.table.addRecord(record)

}

// visitVisiblity provides a mock function with given fields: n*
func (v *tableVisitor) visitVisiblity(n *visibilityNode) {
	record := newRecord(n.identifier, VISIBILITY, "", n.getLineNumber(), newTypeRecord(""), nil)
	n.table.addRecord(record)

}

// visitWhileStatement provides a mock function with given fields: n*
func (v *tableVisitor) visitWhileStatement(n *whileStatementNode) {

}

// visitWrite provides a mock function with given fields: n*
func (v *tableVisitor) visitWrite(n *writeNode) {

}

// visitifStatement provides a mock function with given fields: n*
func (v *tableVisitor) visitifStatement(n *ifStatementNode) {

}

func (v *tableVisitor) visitAssign(n *assignStatNode) {

}
