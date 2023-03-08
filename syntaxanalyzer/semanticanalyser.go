package syntaxanalyzer

import "fmt"

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
}
type defaultVisitor struct {
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

type tableVisitor struct {
	*defaultVisitor
}

func NewTableVisitor() *tableVisitor {
	return &tableVisitor{&defaultVisitor{}}
}

// visit provides a mock function with given fields: n*
func (v *tableVisitor) visit(n node) {
}

// visitAdd provides a mock function with given fields: n*
func (v *tableVisitor) visitAdd(n *addNode) {
	fmt.Println("in add")
}

// visitClassDecl provides a mock function with given fields: n*
func (v *tableVisitor) visitClassDecl(n *classDecl) {
	fmt.Println("in classdecl")
}

// visitClassList provides a mock function with given fields: n*
func (v *tableVisitor) visitClassList(n *classListNode) {
	fmt.Println("in list")

}

// visitClassVarDecl provides a mock function with given fields: n*
func (v *tableVisitor) visitClassVarDecl(n *ClassVarNode) {
	fmt.Println("in classvardecl")

}

// visitDim provides a mock function with given fields: n*
func (v *tableVisitor) visitDim(n *dimNode) {
	fmt.Println("in dim")
}

// visitDimList provides a mock function with given fields: n*
func (v *tableVisitor) visitDimList(n *dimListNode) {
	fmt.Println("in dimlist")
}

// visitDot provides a mock function with given fields: n*
func (v *tableVisitor) visitDot(n *dotNode) {
	fmt.Println("in dot")

}

// visitEpsilon provides a mock function with given fields: n*
func (v *tableVisitor) visitEpsilon(n *epsilonNode) {
	fmt.Println("in epsilon")

}

// visitFloatLit provides a mock function with given fields: n*
func (v *tableVisitor) visitFloatLit(n *floatNode) {
	fmt.Println("in float")

}

// visitFparamlist provides a mock function with given fields: n*
func (v *tableVisitor) visitFparamlist(n *fparamListNode) {
	fmt.Println("in fparam")

}

// visitFuncCall provides a mock function with given fields: n*
func (v *tableVisitor) visitFuncCall(n *functionCall) {
	fmt.Println("in funccall")

}

// visitFuncDecl provides a mock function with given fields: n*
func (v *tableVisitor) visitFuncDecl(n *funcDeclNode) {
	fmt.Println("in funcdecl")

}

// visitFuncDef provides a mock function with given fields: n*
func (v *tableVisitor) visitFuncDef(n *funcDefNode) {
	fmt.Println("in funcdef")

}

// visitFuncDefList provides a mock function with given fields: n*
func (v *tableVisitor) visitFuncDefList(n *funcDefListNode) {
	fmt.Println("in funcdeflist")

}

// visitId provides a mock function with given fields: n*
func (v *tableVisitor) visitId(n *idNode) {
	fmt.Println("in id")

}

// visitIndiceList provides a mock function with given fields: n*
func (v *tableVisitor) visitIndiceList(n *indiceListNode) {
	fmt.Println("in ind list")

}

// visitInheritance provides a mock function with given fields: n*
func (v *tableVisitor) visitInheritance(n *inheritanceNode) {
	fmt.Println("in inherit")

}

// visitIntlit provides a mock function with given fields: n*
func (v *tableVisitor) visitIntlit(n *intLitNode) {
	fmt.Println("in int")

}

// visitLocalVarDecl provides a mock function with given fields: n*
func (v *tableVisitor) visitLocalVarDecl(n *localVarNode) {
	fmt.Println("in localdecl")

}

// visitMult provides a mock function with given fields: n*
func (v *tableVisitor) visitMult(n *multNode) {
	fmt.Println("in mult")

}

// visitNot provides a mock function with given fields: n*
func (v *tableVisitor) visitNot(n *notNode) {
	fmt.Println("in not")

}

// visitParamlist provides a mock function with given fields: n*
func (v *tableVisitor) visitParamlist(n *paramListNode) {
	fmt.Println("in param")
}

// visitProgramBlock provides a mock function with given fields: n*
func (v *tableVisitor) visitProgramBlock(n *programBlockNode) {
	fmt.Println("in progblock")

}

// visitReadStatement provides a mock function with given fields: n*
func (v *tableVisitor) visitReadStatement(n *readStatementNode) {
	fmt.Println("in add")

}

// visitRelOp provides a mock function with given fields: n*
func (v *tableVisitor) visitRelOp(n *relOpNode) {
	fmt.Println("in relop")

}

// visitReturn provides a mock function with given fields: n*
func (v *tableVisitor) visitReturn(n *returnNode) {
	fmt.Println("in return")

}

// visitReturnType provides a mock function with given fields: n*
func (v *tableVisitor) visitReturnType(n *returnTypeNode) {
	fmt.Println("in return type")

}

// visitScope provides a mock function with given fields: n*
func (v *tableVisitor) visitScope(n *scopeNode) {
	fmt.Println("in scope")

}

// visitSign provides a mock function with given fields: n*
func (v *tableVisitor) visitSign(n *signNode) {
	fmt.Println("in sign")

}

// visitStatBlock provides a mock function with given fields: n*
func (v *tableVisitor) visitStatBlock(n *statBlockNode) {
	fmt.Println("in statblock")

}

// visitType provides a mock function with given fields: n*
func (v *tableVisitor) visitType(n *typeNode) {
	fmt.Println("in type")

}

// visitVar provides a mock function with given fields: n*
func (v *tableVisitor) visitVar(n *varNode) {
	fmt.Println("in var")

}

// visitVisiblity provides a mock function with given fields: n*
func (v *tableVisitor) visitVisiblity(n *visibilityNode) {
	fmt.Println("in visibility")

}

// visitWhileStatement provides a mock function with given fields: n*
func (v *tableVisitor) visitWhileStatement(n *whileStatementNode) {
	fmt.Println("in while")

}

// visitWrite provides a mock function with given fields: n*
func (v *tableVisitor) visitWrite(n *writeNode) {
	fmt.Println("in write")

}

// visitifStatement provides a mock function with given fields: n*
func (v *tableVisitor) visitifStatement(n *ifStatementNode) {
	fmt.Println("in if")

}

func (v *tableVisitor) visitAssign(n *assignStatNode) {
	fmt.Println("in assign")
}
func (v *tableVisitor) visitProgram(n *program) {
	fmt.Println("in program")
}
