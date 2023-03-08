package syntaxanalyzer

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

type tableVisitor struct {
}

// visit provides a mock function with given fields: n*
func (v *tableVisitor) visit(n node) {
}

// visitAdd provides a mock function with given fields: n*
func (v *tableVisitor) visitAdd(n* addNode) {

}

// visitClassDecl provides a mock function with given fields: n*
func (v *tableVisitor) visitClassDecl(n* classDecl) {

}

// visitClassList provides a mock function with given fields: n*
func (v *tableVisitor) visitClassList(n* classListNode) {

}

// visitClassVarDecl provides a mock function with given fields: n*
func (v *tableVisitor) visitClassVarDecl(n* ClassVarNode) {

}

// visitDim provides a mock function with given fields: n*
func (v *tableVisitor) visitDim(n* dimNode) {

}

// visitDimList provides a mock function with given fields: n*
func (v *tableVisitor) visitDimList(n* dimListNode) {

}

// visitDot provides a mock function with given fields: n*
func (v *tableVisitor) visitDot(n* dotNode) {

}

// visitEpsilon provides a mock function with given fields: n*
func (v *tableVisitor) visitEpsilon(n* epsilonNode) {

}

// visitFloatLit provides a mock function with given fields: n*
func (v *tableVisitor) visitFloatLit(n* floatNode) {

}

// visitFparamlist provides a mock function with given fields: n*
func (v *tableVisitor) visitFparamlist(n* fparamListNode) {

}

// visitFuncCall provides a mock function with given fields: n*
func (v *tableVisitor) visitFuncCall(n* functionCall) {

}

// visitFuncDecl provides a mock function with given fields: n*
func (v *tableVisitor) visitFuncDecl(n* funcDeclNode) {

}

// visitFuncDef provides a mock function with given fields: n*
func (v *tableVisitor) visitFuncDef(n* funcDefNode) {

}

// visitFuncDefList provides a mock function with given fields: n*
func (v *tableVisitor) visitFuncDefList(n* funcDefListNode) {

}

// visitId provides a mock function with given fields: n*
func (v *tableVisitor) visitId(n* idNode) {

}

// visitIndiceList provides a mock function with given fields: n*
func (v *tableVisitor) visitIndiceList(n* indiceListNode) {

}

// visitInheritance provides a mock function with given fields: n*
func (v *tableVisitor) visitInheritance(n* inheritanceNode) {

}

// visitIntlit provides a mock function with given fields: n*
func (v *tableVisitor) visitIntlit(n* intLitNode) {

}

// visitLocalVarDecl provides a mock function with given fields: n*
func (v *tableVisitor) visitLocalVarDecl(n* localVarNode) {

}

// visitMult provides a mock function with given fields: n*
func (v *tableVisitor) visitMult(n* multNode) {

}

// visitNot provides a mock function with given fields: n*
func (v *tableVisitor) visitNot(n* notNode) {

}

// visitParamlist provides a mock function with given fields: n*
func (v *tableVisitor) visitParamlist(n* paramListNode) {

}

// visitProgramBlock provides a mock function with given fields: n*
func (v *tableVisitor) visitProgramBlock(n* programBlockNode) {

}

// visitReadStatement provides a mock function with given fields: n*
func (v *tableVisitor) visitReadStatement(n* readStatementNode) {

}

// visitRelOp provides a mock function with given fields: n*
func (v *tableVisitor) visitRelOp(n* relOpNode) {

}

// visitReturn provides a mock function with given fields: n*
func (v *tableVisitor) visitReturn(n* returnNode) {

}

// visitReturnType provides a mock function with given fields: n*
func (v *tableVisitor) visitReturnType(n* returnTypeNode) {

}

// visitScope provides a mock function with given fields: n*
func (v *tableVisitor) visitScope(n* scopeNode) {

}

// visitSign provides a mock function with given fields: n*
func (v *tableVisitor) visitSign(n* signNode) {

}

// visitStatBlock provides a mock function with given fields: n*
func (v *tableVisitor) visitStatBlock(n* statBlockNode) {

}

// visitType provides a mock function with given fields: n*
func (v *tableVisitor) visitType(n* typeNode) {

}

// visitVar provides a mock function with given fields: n*
func (v *tableVisitor) visitVar(n* varNode) {

}

// visitVisiblity provides a mock function with given fields: n*
func (v *tableVisitor) visitVisiblity(n* visibilityNode) {

}

// visitWhileStatement provides a mock function with given fields: n*
func (v *tableVisitor) visitWhileStatement(n* whileStatementNode) {

}

// visitWrite provides a mock function with given fields: n*
func (v *tableVisitor) visitWrite(n* writeNode) {

}

// visitifStatement provides a mock function with given fields: n*
func (v *tableVisitor) visitifStatement(n* ifStatementNode) {

}
