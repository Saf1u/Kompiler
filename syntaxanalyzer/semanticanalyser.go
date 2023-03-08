package syntaxanalyzer

type visitor interface {
	visit(node)
	visitAdd(addNode)
	visitId(idNode)
	visitVisiblity(visibilityNode)
	visitFuncDecl(funcDeclNode)
	visitClassDecl(classDecl)
	visitWrite(writeNode)
	visitReturn(returnNode)
	visitInheritance(inheritanceNode)
	visitStatBlock(statBlockNode)
	visitifStatement(ifStatementNode)
	
}

type tableVisitor struct {
}

func (t *tableVisitor) visit(n node) {

}
func (t *tableVisitor) visitId(n idNode) {

}

func (t *tableVisitor) visitAdd(n addNode) {

}
