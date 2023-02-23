package syntaxanalyzer

type node interface {
	makeSibling(node)
	adoptChild(node)
	nextSibling() node
	addRightSibling(node)
	addParent(node)
}
