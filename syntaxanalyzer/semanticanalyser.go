package syntaxanalyzer

import (
	"compiler/configmap"
	"fmt"
	"io"
	"os"
	"reflect"
	"regexp"
	"strconv"
	"strings"
)

const typeSepeator = "|"
const (
	REG0  = register("r0")
	REG1  = register("r1")
	REG2  = register("r2")
	REG3  = register("r3")
	REG4  = register("r4")
	REG5  = register("r5")
	REG6  = register("r6")
	REG7  = register("r7")
	REG8  = register("r8")
	REG9  = register("r9")
	REG10 = register("r10")
	REG11 = register("r11")
	REG12 = register("r12")
	REG13 = register("r13")
	REG14 = register("r14")
	REG15 = register("r15")
)
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
	INTLIT           = "integer"
	FLOATLIT         = "float"
	INTEGER          = "integer"
	FLOAT            = "float"
	TYPE_ERR         = "ERR"
	INDEXING_ERR     = "ERRIN"
	ACTIVE_VAR       = "VAR_ENTRY_FOR_A_SCOPE"
	ACTIVE_PARAMETER = "PARAM_ENTRY_FOR_A_SCOPE"
	TEMP_VAR         = "tempvar"
	TEMP_LIT         = "templit"
	MOON_CODE        = "code"
	TEMP_OFFSET      = "offset"
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
	sameDeclarationInScopeError               = "ERROR:%s \"%s\" aready declared:line %d"
	classNotDeclaredError                     = "ERROR:class \"%s\" not declared so function \"%s\" has no class:line %d"
	functionNotDeclaredError                  = "ERROR:function \"%s\" not declared in class \"%s\" :line %d"
	functionOverrloadWarn                     = "WARNING:function \"%s\" is being overloaded:line %d"
	inheritedClassNotDeclaredError            = "ERROR:class \"%s\" not declared so cannot be inherited:line %d"
	inheritedClassAlreadyInheritedError       = "ERROR:class \"%s\" already inherited:line %d"
	shadowWarn                                = "WARNING:member \"%s\" is being shadowed:line %d"
	overrideWarn                              = "WARNING:member \"%s\" is being overriden:line %d"
	cyclicDependencyError                     = "ERROR:class \"%s\" is being cyclicly inherited:line %d"
	functionNotDefinedError                   = "ERROR:function \"%s\" declared in class \"%s\" not defined:line %d"
	funcParameterShadowed                     = "WARNING:function parameter \"%s\" is being shadowed:line %d"
	varNotDeclaredError                       = "ERROR:variable  \"%s\" not declared in current scope:line %d"
	invalidIndexType                          = "ERROR:only integers are valid indexes:line %d"
	typeMismatchError                         = "ERROR:varaible \"%s\" not used with declared type line:%d"
	cannotAssignError                         = "ERROR:cannot assign mismatched types line:%d"
	arithmeticError                           = "ERROR:cannot operate on mismatched types line:%d"
	undeclaredClassError                      = "ERROR:accessing member of undeclared class \"%s\" line:%d"
	noOperationsAllowedOnArrays               = "ERROR:operations not allowed on array types line:%d"
	functionNotDeclaredWithSignatureError     = "ERROR:function \"%s\" not declared in class \"%s\" with such signature :line %d"
	functionNotDeclaredWithSignatureErrorFree = "ERROR:function \"%s\" not declared with such signature  :line %d"
)

var (
	patterns         = []string{`(\[),*`, `(\]),*`, `(\\\[)\\]`, `(\|)`}
	replacements     = []string{`\[`, `\]`, `\[[0-9]*\]`, `\|`}
	tempId       int = 0
	offsetId     int = 0
	litId        int = 0
	errorBin         = map[int][]string{}
	indexes          = []int{}
	sizes            = map[string]int{
		"integer": 4,
		TYPE_ERR:  0,
	}
	tags               = map[string]int{}
	registers          = []register{REG1, REG2, REG3, REG4, REG5, REG6, REG7, REG8, REG9, REG10, REG11, REG12}
	globalregisterPool *registerPool
	outDataFile        io.Writer
	outCodeFile        io.Writer
)

func generateNamedTag(s string) string {
	tags[s]++
	return fmt.Sprint(s, tags[s])
}

func init() {
	globalregisterPool = newPool()
	for _, reg := range registers {
		globalregisterPool.Put(reg)
	}
	file := configmap.Get("file").(string)
	dataFileName := fmt.Sprint(fmt.Sprint(file, "-", "data"), ".m")
	codeFileName := fmt.Sprint(fmt.Sprint(file, "-", "code"), ".m")
	var err error
	outDataFile, err = os.OpenFile(dataFileName, os.O_TRUNC|os.O_CREATE|os.O_RDWR, 0755)
	if err != nil {
		panic(err)
	}
	outCodeFile, err = os.OpenFile(codeFileName, os.O_TRUNC|os.O_CREATE|os.O_RDWR, 0755)
	if err != nil {
		panic(err)
	}
}

func writeToCode(s string) {
	outCodeFile.Write([]byte(s))
}
func writeToData(s string) {
	outDataFile.Write([]byte(s))
}

type register string

func (p register) String() string {
	return string(p)
}

type registerPool []register

func newPool() *registerPool {
	x := make([]register, 0)
	regPool := registerPool(x)
	return &regPool

}
func (p *registerPool) Get() (register, error) {
	if len(*p) == 0 {
		return "", fmt.Errorf("no registers")
	}
	reg := (*p)[len(*p)-1]
	*p = (*p)[0 : len(*p)-1]
	return reg, nil
}
func (p *registerPool) Put(r register) {
	*p = append(*p, r)
}

func isLiteral(s string) bool {
	return s[0:7] == "literal"
}

func getUniqueTempTag() string {
	tag := fmt.Sprint("tempVar", tempId)
	tempId++
	return tag
}
func getUniqueOffsetTag() string {
	tag := fmt.Sprint("offset", offsetId)
	offsetId++
	return tag
}
func getUniqueLitTag() string {
	tag := fmt.Sprint("literal", litId)
	litId++
	return tag
}
func getUniqueNameTag(name string, typeInfo string) string {
	if index := strings.IndexRune(typeInfo, ':'); index != -1 {
		typeInfo = typeInfo[index+1:]
	}
	tag := fmt.Sprint(name, typeInfo)
	tag = strings.ReplaceAll(tag, "|", "")
	return tag
}

func setSize(typeName string, size int) {
	sizes[typeName] = size
}
func sizeOf(typeName string) (int, error) {
	if size, ok := sizes[typeName]; ok {
		return size, nil
	}
	return 0, fmt.Errorf("value size not yet calculated")
}
func getBaseType(typeInfo string) string {
	index := strings.IndexRune(typeInfo, '[')
	if index == -1 {
		return typeInfo
	}
	return typeInfo[:index]
}
func delemitSizes(x string) []string {
	index := strings.IndexRune(x, '[')
	if index == -1 {
		return []string{}
	}
	x = x[index:]
	x = strings.ReplaceAll(x, "][", "|")
	x = strings.ReplaceAll(x, "]", "|")
	x = strings.ReplaceAll(x, "[", "|")
	z := (strings.Split(x, "|"))
	z = z[1:]
	z = z[:len(z)-1]
	return z
}
func getDimensions(typeInfo string) int {
	accumulator := 1
	index := strings.IndexRune(typeInfo, '[')
	if index == -1 {
		return accumulator
	}
	typeInfo = typeInfo[index:]
	typeInfo = strings.ReplaceAll(typeInfo, "][", "|")
	typeInfo = strings.ReplaceAll(typeInfo, "]", "|")
	typeInfo = strings.ReplaceAll(typeInfo, "[", "|")
	nums := (strings.Split(typeInfo, "|"))
	for _, num := range nums {
		if num != "" {
			intRep, err := strconv.Atoi(num)
			if err != nil {
				panic("should not happen")
			}
			accumulator = accumulator * intRep
		}
	}
	return accumulator
}
func CalculateClassSize(className string, symbTable *symbolTable) int {
	inheritedClassesSizes := 0
	dataMemberSizes := 0
	classEntry := symbTable.getEntry(map[int]interface{}{FILTER_KIND: CLASS, FILTER_NAME: className})
	if classEntry == nil {
		return 0
	}
	classTable := classEntry.getLink()
	names := classTable.getEntry(map[int]interface{}{FILTER_KIND: "inheritance"}).getName()
	listOfInheritedClasses := strings.Split(names, typeSepeator)
	for _, class := range listOfInheritedClasses {
		if class != "" {
			size, err := sizeOf(class)
			if err != nil {
				size = CalculateClassSize(class, symbTable)
			}
			inheritedClassesSizes = inheritedClassesSizes + size
		}
	}
	records := classTable.getRecords()
	for i, record := range records {
		typeInfo := record.getName()
		if record.getKind() == VARIABLE {
			typeInfo = record.getType().String()
		}

		if record.getKind() == VARIABLE || record.getKind() == CLASS {
			baseType := getBaseType(typeInfo)
			size := 0
			if _, err := sizeOf(baseType); err != nil {
				size = CalculateClassSize(baseType, symbTable)
			} else {
				size, _ = sizeOf(baseType)
			}
			size = size * getDimensions(typeInfo)
			record.setSize(size)
			if i == 0 {
				record.setOffset(0)
			} else {
				record.setOffset((-records[i-1].getSize()) + (records[i-1].getOffset()))
			}
			if record.getKind() == VARIABLE {
				dataMemberSizes = dataMemberSizes + size
			}
		}

	}
	classTotalSize := dataMemberSizes + inheritedClassesSizes
	setSize(className, classTotalSize)
	return classTotalSize

}

func saveError(lineNum int, err string, args ...any) {
	args = append(args, lineNum)
	err = fmt.Sprintf(err, args...)
	if _, ok := errorBin[lineNum]; !ok {
		indexes = append(indexes, lineNum)
	}
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
	propgateScopeLink(*symbolTable)
	propagateId(string)
	propagateDestRegister(register)
	getGlobalTable() *symbolTable
}
type defaultVisitor struct {
	gloablTable *symbolTable
}

func (v *defaultVisitor) propagateDestRegister(r register) {

}

func (v *defaultVisitor) propagateScope(s string) {

}
func (v *defaultVisitor) propagateId(s string) {

}
func (v *defaultVisitor) propgateScopeLink(s *symbolTable) {

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
		saveError(n.getLineNumber(), arithmeticError)
		rec = newRecord(TYPE_ERR, TYPE_ERR, "", n.getLineNumber(), newTypeRecord(TYPE_ERR), nil)
		n.getTable().addRecord(rec)
		return

	}
	if strings.ContainsRune(typeLeftOp.String(), '[') || strings.ContainsRune(typeRightOp.String(), '[') {
		saveError(n.getLineNumber(), noOperationsAllowedOnArrays)
		rec := newRecord(TYPE_ERR, TYPE_ERR, "", n.getLineNumber(), newTypeRecord(TYPE_ERR), nil)
		n.getTable().addRecord(rec)
		return

	}
	rec = newRecord(typeLeftOp.String(), typeLeftOp.String(), "", n.getLineNumber(), newTypeRecord(typeLeftOp.String()), nil)

	n.getTable().addRecord(rec)
}
func (v *typeCheckVisitor) visitParamlist(n *paramListNode) {
	left := n.getLeftMostChild()
	typeInfo := ""
	for left != nil {
		switch left.(type) {
		case *epsilonNode:
		default:
			typeInfo = fmt.Sprint(typeInfo, typeSepeator, left.getSingleEntry().getType().String())
		}
		left = left.getRightSibling()
	}
	n.getTable().addRecord(newRecord("paramaters", "parameters", "", n.getLineNumber(), newTypeRecord(typeInfo), nil))
}

func matchVariableArraysCompare(parameterType string, parameterList string) bool {
	parameterType = fmt.Sprint("^", parameterType, "$")
	for i, pattern := range patterns {
		regex := regexp.MustCompile(pattern)
		parameterType = regex.ReplaceAllString(parameterType, replacements[i])
	}
	ok, err := regexp.MatchString(parameterType, parameterList)
	if err != nil {
		panic(err)
	}
	return ok
}
func basicCompare(parameterType string, parameterList string) bool {
	return parameterList == parameterType
}

func searchForFunction(name string, globaltable *symbolTable, paramterList string, compare func(string, string) bool) (*symbolTableRecord, string) {
	entries := globaltable.getEntries(map[int]interface{}{FILTER_NAME: name, FILTER_KIND: FUNCDEF})
	var calledFunction *symbolTableRecord
	var returnType string
	if len(entries) == 0 {
		return nil, returnType
	}
	for _, function := range entries {
		funcType := function.getType().String()
		index := strings.IndexRune(funcType, ':')
		returnType = funcType[0:index]
		parameterType := funcType[index+1:]
		if compare(parameterType, paramterList) {
			calledFunction = function
			break
		}
	}
	return calledFunction, returnType

}
func recursivelySearchForFunction(classTable *symbolTable, identifier string, paramterList string, compare func(string, string) bool) (*symbolTableRecord, string) {
	entries := classTable.getEntries(
		map[int]interface{}{
			FILTER_NAME: identifier,
			FILTER_KIND: FUNCDECL,
		},
	)
	var calledFunction *symbolTableRecord
	var returnType string
	if len(entries) != 0 {

		for _, function := range entries {
			funcType := function.getType().String()
			index := strings.IndexRune(funcType, ':')
			returnType = funcType[0:index]
			parameterType := funcType[index+1:]
			if compare(parameterType, paramterList) {
				calledFunction = function
				return calledFunction, returnType
			}
		}

	}
	inheritedClasses := classTable.getEntries(
		map[int]interface{}{
			FILTER_KIND: CLASS,
		},
	)
	for _, class := range inheritedClasses {
		record, returnType := recursivelySearchForFunction(class.getLink(), identifier, paramterList, compare)
		if record != nil {
			return record, returnType
		}
	}
	return nil, ""
}

func (v *typeCheckVisitor) visitMult(n *multNode) {
	leftop := n.getLeftMostChild()
	rightop := leftop.getRightSibling()
	typeLeftOp := leftop.getTable().getSingleEntry().getType()
	typeRightOp := rightop.getTable().getSingleEntry().getType()
	var rec *symbolTableRecord
	if !typeLeftOp.equal(typeRightOp) {
		saveError(n.getLineNumber(), arithmeticError)
		rec = newRecord(TYPE_ERR, TYPE_ERR, "", n.getLineNumber(), newTypeRecord(TYPE_ERR), nil)
		n.getTable().addRecord(rec)
		return

	}
	if strings.ContainsRune(typeLeftOp.String(), '[') || strings.ContainsRune(typeRightOp.String(), '[') {
		saveError(n.getLineNumber(), noOperationsAllowedOnArrays)
		rec := newRecord(TYPE_ERR, TYPE_ERR, "", n.getLineNumber(), newTypeRecord(TYPE_ERR), nil)
		n.getTable().addRecord(rec)
		return

	}
	rec = newRecord(typeLeftOp.String(), typeLeftOp.String(), "", n.getLineNumber(), newTypeRecord(typeLeftOp.String()), nil)

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
	if strings.ContainsRune(leftop, '[') {
		saveError(n.getLineNumber(), noOperationsAllowedOnArrays)
		rec := newRecord(TYPE_ERR, TYPE_ERR, "", n.getLineNumber(), newTypeRecord(TYPE_ERR), nil)
		n.getTable().addRecord(rec)
		return

	}
	n.getTable().addRecord(newRecord(leftop, leftop, "", n.getLineNumber(), newTypeRecord(leftop), nil))

}
func (v *typeCheckVisitor) visitSign(n *signNode) {
	leftop := n.getLeftMostChild().getTable().getSingleEntry().getType().String()
	if strings.ContainsRune(leftop, '[') {
		saveError(n.getLineNumber(), noOperationsAllowedOnArrays)
		rec := newRecord(TYPE_ERR, TYPE_ERR, "", n.getLineNumber(), newTypeRecord(TYPE_ERR), nil)
		n.getTable().addRecord(rec)
		return

	}
	n.getTable().addRecord(newRecord(leftop, leftop, "", n.getLineNumber(), newTypeRecord(leftop), nil))

}
func (v *typeCheckVisitor) visitAssign(n *assignStatNode) {
	leftOp := n.getLeftMostChild().getSingleEntry()
	rightOp := n.getLeftMostChild().getRightSibling().getSingleEntry()
	if !(leftOp.getType().String() != TYPE_ERR && rightOp.getType().String() != TYPE_ERR && leftOp.getType().String() == rightOp.getType().String()) {
		saveError(n.getLineNumber(), cannotAssignError)
	}
	if strings.ContainsRune(leftOp.getType().String(), '[') || strings.ContainsRune(rightOp.getType().String(), '[') {
		saveError(n.getLineNumber(), noOperationsAllowedOnArrays)
		rec := newRecord(TYPE_ERR, TYPE_ERR, "", n.getLineNumber(), newTypeRecord(TYPE_ERR), nil)
		n.getTable().addRecord(rec)
		return

	}

}
func (v *typeCheckVisitor) visitRelOp(n *relOpNode) {
	leftOp := n.getLeftMostChild().getSingleEntry()
	rightOp := n.getLeftMostChild().getRightSibling().getSingleEntry()
	if !(leftOp.getType().String() != TYPE_ERR && rightOp.getType().String() != TYPE_ERR && leftOp.getType().String() == rightOp.getType().String()) {
		cannotCompareError := "ERROR:cannot compare types line:%d"
		saveError(n.getLineNumber(), cannotCompareError)
	}
	if strings.ContainsRune(leftOp.getType().String(), '[') || strings.ContainsRune(rightOp.getType().String(), '[') {
		saveError(n.getLineNumber(), noOperationsAllowedOnArrays)
		rec := newRecord(TYPE_ERR, TYPE_ERR, "", n.getLineNumber(), newTypeRecord(TYPE_ERR), nil)
		n.getTable().addRecord(rec)
		return

	}

}
func (v *typeCheckVisitor) visitFuncCall(n *functionCall) {
	paramterList := n.getLeftMostChild().getRightSibling().getSingleEntry().getType().String()

	switch n.getLeftMostChild().(type) {
	case *idNode:
		scope := v.scope
		function := strings.Split(scope, "~")[0]
		functionName := strings.Split(function, "|")
		id := n.getLeftMostChild().(*idNode).identifier
		//check class scope since in mrthod for function
		if functionName[0] != "" {
			//methodLookup := fmt.Sprint(functionName[0], typeSepeator, id)
			c := v.getGlobalTable().getEntry(map[int]interface{}{FILTER_KIND: CLASS, FILTER_NAME: functionName[0]}).getLink()
			if c == nil {
				n.getTable().addRecord(newRecord(TYPE_ERR, TYPE_ERR, "", n.getLineNumber(), newTypeRecord(TYPE_ERR), nil))
				return
			}
			function, returnType := recursivelySearchForFunction(c, id, paramterList, basicCompare)
			if function != nil {
				n.getTable().addRecord(newRecord("return", "return", "", n.getLineNumber(), newTypeRecord(returnType), nil))
				return
			}
			function, returnType = recursivelySearchForFunction(c, id, paramterList, matchVariableArraysCompare)
			if function != nil {
				n.getTable().addRecord(newRecord("return", "return", "", n.getLineNumber(), newTypeRecord(returnType), nil))
				return
			}
		}
		//check global scioe if not found for free function
		functionLookup := fmt.Sprint(typeSepeator, id)
		possibleFunction, returnType := searchForFunction(functionLookup, v.getGlobalTable(), paramterList, basicCompare)
		if possibleFunction != nil {
			n.getTable().addRecord(newRecord(id, "return", "", n.getLineNumber(), newTypeRecord(returnType), nil))
			return

		}
		possibleFunction, returnType = searchForFunction(functionLookup, v.getGlobalTable(), paramterList, matchVariableArraysCompare)
		if possibleFunction != nil {
			n.getTable().addRecord(newRecord(id, "return", "", n.getLineNumber(), newTypeRecord(returnType), nil))
			return

		}

		saveError(n.getLineNumber(), functionNotDeclaredWithSignatureErrorFree, id)
		n.getTable().addRecord(newRecord(TYPE_ERR, TYPE_ERR, "", n.getLineNumber(), newTypeRecord(TYPE_ERR), nil))
		return

	case *dotNode:
		varType := n.getLeftMostChild().getSingleEntry().getType().String()
		if varType == TYPE_ERR {
			n.getTable().addRecord(newRecord(TYPE_ERR, TYPE_ERR, "", n.getLineNumber(), newTypeRecord(TYPE_ERR), nil))
			return
		}

		id := n.getLeftMostChild().getSingleEntry().getName()
		//methodName := fmt.Sprint(varType, typeSepeator, id)
		c := v.getGlobalTable().getEntry(map[int]interface{}{FILTER_KIND: CLASS, FILTER_NAME: varType}).getLink()
		if c == nil {
			n.getTable().addRecord(newRecord(TYPE_ERR, TYPE_ERR, "", n.getLineNumber(), newTypeRecord(TYPE_ERR), nil))
			return
		}
		calledFunction, returnType := recursivelySearchForFunction(c, id, paramterList, basicCompare)
		if calledFunction == nil {
			calledFunction, returnType = recursivelySearchForFunction(c, id, paramterList, matchVariableArraysCompare)
		}
		if calledFunction == nil {
			saveError(n.getLineNumber(), functionNotDeclaredWithSignatureError, id, varType)
			n.getTable().addRecord(newRecord(TYPE_ERR, TYPE_ERR, "", n.getLineNumber(), newTypeRecord(TYPE_ERR), nil))
			return
		}
		lookupInfo := strings.Split(v.scope, "~")
		method := lookupInfo[0]
		class := strings.Split(method, typeSepeator)[0]
		//cannot access private member if not in class scope
		if calledFunction.getVisibility() == "private" && class != varType {
			saveError(n.getLineNumber(), "ERROR:cannot access  class \"%s\" member private function \"%s\" outside of class line:%d", varType, id)
			n.getTable().addRecord(newRecord(TYPE_ERR, TYPE_ERR, "", n.getLineNumber(), newTypeRecord(TYPE_ERR), nil))
			return
		}

		n.getTable().addRecord(newRecord(id, "return", "", n.getLineNumber(), newTypeRecord(returnType), nil))
		return

	}
	panic("never reach here!")

}

func (v *typeCheckVisitor) visitDot(n *dotNode) {
	leftop := n.getLeftMostChild()
	rightop := leftop.getRightSibling()

	typeLeftOp := leftop.getTable().getSingleEntry().getType().String()
	if typeLeftOp == TYPE_ERR {
		rec := newRecord(TYPE_ERR, TYPE_ERR, "", n.getLineNumber(), newTypeRecord(TYPE_ERR), nil)
		n.getTable().addRecord(rec)
		return
	}
	scope := v.getGlobalTable().getEntry(
		map[int]interface{}{
			FILTER_KIND: CLASS,
			FILTER_NAME: typeLeftOp,
		},
	)
	if scope == nil {
		saveError(n.getLineNumber(), "ERROR:class \"%s\" does not exist line:%d", typeLeftOp)
		rec := newRecord(TYPE_ERR, TYPE_ERR, "", n.getLineNumber(), newTypeRecord(TYPE_ERR), nil)
		n.getTable().addRecord(rec)
		return
	}
	identifier := rightop.(*idNode).identifier
	rec := newRecord(identifier, "", "", n.getLineNumber(), newTypeRecord(typeLeftOp), nil)
	n.getTable().addRecord(rec)

}
func (v *typeCheckVisitor) visitVar(n *varNode) {
	lookupInfo := strings.Split(v.scope, "~")
	if len(lookupInfo) == 1 {
		n.getTable().addRecord(newRecord(n.getLeftMostChild().getSingleEntry().getName(), TYPE_ERR, "", n.getLineNumber(), newTypeRecord(TYPE_ERR), nil))
		return
	}
	var scope *symbolTableRecord
	//look in function scope
	scope = v.getGlobalTable().getEntry(
		map[int]interface{}{
			FILTER_TYPE: newTypeRecord(lookupInfo[1]),
			FILTER_NAME: lookupInfo[0],
		},
	)

	isDot := false
	if reflect.TypeOf(n.getLeftMostChild()).String() == "*syntaxanalyzer.dotNode" {
		scope = v.getGlobalTable().getEntry(
			map[int]interface{}{
				FILTER_KIND: CLASS,
				FILTER_NAME: n.getLeftMostChild().getSingleEntry().getType().String(),
			},
		)
		isDot = true
		if scope == nil {
			saveError(n.getLineNumber(), "ERROR:could not find class \"%s\" line:%d", n.getLeftMostChild().getSingleEntry().getType().String())
			n.getTable().addRecord(newRecord(n.getLeftMostChild().getSingleEntry().getType().String(), TYPE_ERR, "", n.getLineNumber(), newTypeRecord(TYPE_ERR), nil))
			return

		}
	}

	left := n.getLeftMostChild().getSingleEntry()
	indiceList := n.getLeftMostChild().getRightSibling().getTable().getEntry(
		map[int]interface{}{
			FILTER_NAME: "list",
		},
	)
	identifier := left.getName()
	if left.getType().String() == TYPE_ERR || indiceList == nil {
		n.getTable().addRecord(newRecord(identifier, TYPE_ERR, "", n.getLineNumber(), newTypeRecord(TYPE_ERR), nil))
		return
	}
	if !isDot && identifier == "self" {
		callScope := v.scope
		function := strings.Split(callScope, "~")[0]
		functionName := strings.Split(function, typeSepeator)
		isDotParent := false
		switch n.getParent().(type) {
		case *dotNode:
			isDotParent = true

		}
		if functionName[0] != "" && isDotParent {
			n.getTable().addRecord(newRecord("self", "", "", n.getLineNumber(), newTypeRecord(functionName[0]), nil))
			return
		}
	}

	typeInfoId := left.getType().String()
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
	if entry == nil && isDot {
		entry = recursivelySearchForId(scope.getLink(), identifier)
	}

	if !isMethod && entry == nil || isDot && entry == nil {
		saveError(n.getLineNumber(), varNotDeclaredError, identifier)
		n.getTable().addRecord(newRecord(identifier, TYPE_ERR, "", n.getLineNumber(), newTypeRecord(TYPE_ERR), nil))
		return
	}
	//was checking scope it was called in, if a method scope it searches inheritance heirarchy
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
		saveError(n.getLineNumber(), varNotDeclaredError, identifier)
		n.getTable().addRecord(newRecord(identifier, TYPE_ERR, "", n.getLineNumber(), newTypeRecord(TYPE_ERR), nil))
		return
	}
	//only allow private access in scope
	if isDot && entry.getVisibility() == "private" && class != left.getType().String() {
		saveError(n.getLineNumber(), "ERROR:cannot access private class \"%s\" member variable \"%s\" outside of class line:%d", left.getType().String(), identifier)
		n.getTable().addRecord(newRecord(TYPE_ERR, TYPE_ERR, "", n.getLineNumber(), newTypeRecord(TYPE_ERR), nil))
		return
	}
	typeEntry := entry.getType().String()
	actualIndexCount := 0
	for _, char := range typeEntry {
		if char == '[' {
			actualIndexCount++
		}
	}
	usedIndexCount, err := strconv.Atoi(indiceList.getType().String())
	if err != nil {
		panic(err)
	}

	if actualIndexCount-usedIndexCount < 0 {
		saveError(n.getLineNumber(), "ERROR:varaible \"%s\" not used with proper array indexes line:%d", identifier)
		n.getTable().addRecord(newRecord(identifier, TYPE_ERR, "", n.getLineNumber(), newTypeRecord(TYPE_ERR), nil))
		return
	}
	index := strings.IndexRune(typeEntry, '[')
	arrayPart := ""
	basetype := ""
	if index != -1 {
		basetype = typeEntry[0:index]
		arrayPart = typeEntry[index:]
	} else {
		basetype = typeEntry
	}
	if isDot {
		typeInfoId = ""
	}
	if typeInfoId != "" {
		if basetype != typeInfoId {
			saveError(n.getLineNumber(), typeMismatchError, identifier)
			n.getTable().addRecord(newRecord(identifier, TYPE_ERR, "", n.getLineNumber(), newTypeRecord(TYPE_ERR), nil))
			return
		}
	} else {
		typeInfoId = basetype
	}

	indexToAdd := actualIndexCount - usedIndexCount
	if indexToAdd != 0 {
		switch n.getParent().(type) {
		case *paramListNode:
			if usedIndexCount != 0 {
				saveError(n.getLineNumber(), "ERROR:array for \"%s\" must be fully indexed or not as a parameter:%d", identifier)
				n.getTable().addRecord(newRecord(identifier, TYPE_ERR, "", n.getLineNumber(), newTypeRecord(TYPE_ERR), nil))
				return
			}
			typeInfoId = fmt.Sprint(typeInfoId, arrayPart)

			n.getTable().addRecord(newRecord(identifier, "type", "", n.getLineNumber(), newTypeRecord(typeInfoId), nil))

		default:
			saveError(n.getLineNumber(), "ERROR:array for \"%s\" must be fully indexed if not a parameter line:%d", identifier)
			n.getTable().addRecord(newRecord(identifier, TYPE_ERR, "", n.getLineNumber(), newTypeRecord(TYPE_ERR), nil))
			return
		}

	} else {
		n.getTable().addRecord(newRecord(identifier, "type", "", n.getLineNumber(), newTypeRecord(typeInfoId), nil))
	}

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
func (v *typeCheckVisitor) visitReturn(n *returnNode) {

	names := strings.Split(v.scope, "~")
	if len(names) == 1 {
		return
	}
	functionType := names[1]
	functionName := names[0]
	typeInfo := n.getLeftMostChild().getSingleEntry().getType().String()
	if typeInfo == TYPE_ERR {
		saveError(n.getLineNumber(), "ERROR:erronous return type:%d")
		return
	}
	index := strings.IndexRune(functionType, ':')
	returnType := functionType[:index]
	parts := strings.Split(functionName, typeSepeator)
	if strings.ToLower(parts[1]) == "constructor" {
		if typeInfo != parts[0] {
			saveError(n.getLineNumber(), "ERROR:wrong return type:%d")
			return
		}
		return
	}
	if returnType == "void" {
		return
	}
	if returnType != typeInfo {
		saveError(n.getLineNumber(), "ERROR:wrong return type:%d")
	}

}
func (v *classSizeCalculator) visitProgram(n *program) {

	gloablTale := v.getGlobalTable()
	classRecords := gloablTale.getEntries(map[int]interface{}{
		FILTER_KIND: CLASS,
	})
	for _, classRecord := range classRecords {
		size := CalculateClassSize(classRecord.getName(), gloablTale)
		classRecord.setSize(size)
		classRecord.setOffset(-size)
	}

}

func (v *typeCheckVisitor) visitIndiceList(n *indiceListNode) {
	child := n.getLeftMostChild()
	counter := 0
	for child != nil {
		switch child.(type) {
		case *epsilonNode:
		default:
			if child.getTable().getSingleEntry().getType().String() != INTLIT {
				n.getTable().addRecord(newRecord(TYPE_ERR, TYPE_ERR, "", n.getLineNumber(), newTypeRecord(TYPE_ERR), nil))
				saveError(n.getLineNumber(), invalidIndexType)
				return
			}
			counter++

		}
		child = child.getRightSibling()
	}

	n.getTable().addRecord(newRecord("list", "sqrbrackets", "", n.getLineNumber(), newTypeRecord(fmt.Sprint(counter)), nil))

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
			if parts[0] == "" {
				continue
			}
			class := v.getGlobalTable().getEntry(map[int]interface{}{FILTER_NAME: parts[0]})
			if class == nil {
				saveError(entry.getLine(), classNotDeclaredError, parts[0], parts[1])
			} else {
				function := class.getLink().getEntry(map[int]interface{}{FILTER_NAME: parts[1], FILTER_KIND: FUNCDECL, FILTER_TYPE: entry.getType()})
				if function == nil {
					saveError(entry.getLine(), functionNotDeclaredError, parts[1], parts[0])
				}
			}

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
				saveError(n.getLineNumber(), inheritedClassNotDeclaredError, inheritedClass)
				continue
			}

			entry := n.getTable().getEntry(
				map[int]interface{}{
					FILTER_NAME: inheritedClass,
					FILTER_KIND: CLASS,
				})
			if entry != nil {
				saveError(n.getLineNumber(), inheritedClassAlreadyInheritedError, inheritedClass)
				continue
			}
			inheritedClassTable := class.getLink()
			if inheritedClassTable == n.getTable() {
				saveError(n.getLineNumber(), cyclicDependencyError, inheritedClass)
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
				saveError(n.getLineNumber(), cyclicDependencyError, inheritedClass)

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
	class := v.getGlobalTable().getEntry(
		map[int]interface{}{
			FILTER_LINK: table,
		},
	)
	if class == nil {
		return
	}
	className := class.getName()

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
				saveError(record.getLine(), functionNotDefinedError, record.getName(), className)
			} else {
				record.SetTablelink(entry.getLink())
				entry.SetVisibilityEntry(record.getVisibility())
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

			if !currentClassRecords.exist(record.getName(), record.getKind(), record.getType()) {
				continue
			}
			switch record.getKind() {
			case VARIABLE:
				entry := currentClassRecords.getEntry(map[int]interface{}{FILTER_NAME: record.getName(), FILTER_KIND: record.getKind()})
				saveError(entry.getLine(), shadowWarn, entry.getName())
			case FUNCDECL:
				entry := currentClassRecords.getEntry(map[int]interface{}{FILTER_NAME: record.getName(), FILTER_KIND: record.getKind()})
				saveError(entry.getLine(), overrideWarn, entry.getName())
			}

		}
	}
}

type classSizeCalculator struct {
	*defaultVisitor
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
	visitors = append(visitors, &classSizeCalculator{&defaultVisitor{gloablTable: gloablTable}})
	visitors = append(visitors, &memAllocVisitor{&defaultVisitor{gloablTable: gloablTable}, "", nil})
	visitors = append(visitors, &codeGenVisitor{defaultVisitor: &defaultVisitor{gloablTable: gloablTable}})
	return visitors
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
					saveError(entry.getLine(), functionOverrloadWarn, entry.getName())
				}
				n.getTable().addRecord(newRecord(entry.getName(), entry.getKind(), entry.getVisibility(), entry.getLine(), entry.getType(), nil))
			} else {
				saveError(entry.getLine(), sameDeclarationInScopeError, entry.getKind(), entry.getName())
			}
		}
		left = left.getRightSibling()

	}
	class := newRecord(id, CLASS, "", n.getLineNumber(), nil, n.getTable())
	if !v.getGlobalTable().exist(id, class.getKind(), class.getType()) {

		v.getGlobalTable().addRecord(class)
	} else {
		saveError(class.getLine(), sameDeclarationInScopeError, class.getKind(), class.getName())
	}

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
			if n.table.getEntry(map[int]interface{}{FILTER_NAME: entry.getName()}) == nil {
				typeEntry := entry.getType()
				typeInfo = fmt.Sprint(typeInfo, typeSepeator, typeEntry)
				n.table.addRecord(entry)
			} else {
				saveError(n.getLineNumber(), "ERROR:redeclared argument \"%s\" line:%d", entry.getName())
			}

			left = left.getRightSibling()

		}

	}
	fParamEntry.SetNameEntry(typeInfo)
	n.table.addRecord(fParamEntry)

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
				name := left.getTable().getEntry(map[int]interface{}{FILTER_KIND: FPARAMLIST}).getName()
				typeInfo = fmt.Sprint(typeInfo, name)

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
					existingRecord := n.getTable().getEntry(map[int]interface{}{FILTER_NAME: record.getName()})
					if existingRecord != nil {
						saveError(record.getLine(), sameDeclarationInScopeError, record.getKind(), record.getName())
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
			saveError(funcDefEntry.getLine(), sameDeclarationInScopeError, "function", funcDefEntry.getName()[1:])
		}
		if len(v.getGlobalTable().getEntries(map[int]interface{}{FILTER_NAME: id})) > 1 {
			saveError(funcDefEntry.getLine(), "WARN:function \"%s\" is being overloaded line:%d", funcDefEntry.getName()[1:])
		}

	}

}

// visitId provides a mock function with given fields: n*
func (v *tableVisitor) visitId(n *idNode) {
	record := newRecord(n.identifier, ID, "", n.getLineNumber(), newTypeRecord(""), nil)
	n.table.addRecord(record)

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
			if entry == nil {
				left = left.getRightSibling()
				continue
			}

			switch entry.getKind() {
			case DIMENSIONLIST:
				typeInfo = fmt.Sprint(typeInfo, entry.getName())
			case TYPE:
				typeInfo = fmt.Sprint(entry.getName(), typeInfo)
			case ID:
				localVarEntry.SetNameEntry(entry.getName())

			}

			left = left.getRightSibling()
		}
		typeRec := newTypeRecord(typeInfo)
		localVarEntry.SetTypeEntry(typeRec)
		n.table.addRecord(localVarEntry)
	}

}
func (v *typeCheckVisitor) visitLocalVarDecl(n *localVarNode) {
	entryName := n.getTable().getSingleEntry().getName()
	entryType := n.getTable().getSingleEntry().getType().String()
	if strings.ContainsRune(entryType, '[') {
		index := strings.IndexRune(entryType, '[')
		entryType = entryType[:index]
	}
	callScope := v.scope
	function := strings.Split(callScope, "~")[0]
	functionName := strings.Split(function, typeSepeator)
	if functionName[0] != "" && entryName == "self" {
		saveError(n.getLineNumber(), "ERROR:warning declaration of self keyword in class line:%d")
		return
	}
	if functionName[0] != "" && len(functionName) == 2 {
		entry := v.gloablTable.getEntry(
			map[int]interface{}{
				FILTER_NAME: functionName[0],
				FILTER_KIND: CLASS,
			},
		)
		if entry != nil {
			if entry.getLink().getEntry(
				map[int]interface{}{
					FILTER_NAME: entryName,
					FILTER_KIND: VARIABLE,
				},
			) != nil {
				saveError(n.getLineNumber(), "Warning:shadowing class member with similar name:%d")
			}
		}

	}
	if entryType == "float" || entryType == "integer" {
		return
	}
	entry := v.gloablTable.getEntry(
		map[int]interface{}{
			FILTER_NAME: entryType,
			FILTER_KIND: CLASS,
		},
	)
	if entry == nil {
		saveError(n.getLineNumber(), "ERROR:class \"%s\" not declared line:%d", entryType)
		return
	}
	name := fmt.Sprint(entry.getName(), typeSepeator, "constructor")
	switch n.getLeftMostChild().(type) {
	case *epsilonNode:
	default:
		left := n.getLeftMostChild()
		for left != nil {
			entry := left.getSingleEntry()
			if entry == nil {
				left = left.getRightSibling()
				continue
			}
			switch entry.getName() {
			case "paramaters":
				typeInfo := entry.getType().typeInfo
				typeInfo = fmt.Sprint(":", typeInfo)
				record := v.getGlobalTable().getEntry(map[int]interface{}{FILTER_KIND: FUNCDEF, FILTER_NAME: name, FILTER_TYPE: newTypeRecord(typeInfo)})
				if record == nil {
					saveError(n.getLineNumber(), "ERROR:constructor not declared for class \"%s\" with such signature:%d", entryType)
					return
				}

			}

			left = left.getRightSibling()
		}
	}

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
				saveError(record.getLine(), sameDeclarationInScopeError, record.getKind(), record.getName())
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
