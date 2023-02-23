package syntaxanalyzer

type node interface {
	makeSibling(node)
	getRightSibling() node
	getLeftMostSibling() node
}

type nodeImplementation struct {
	parent          node
	leftmostSibling node
	leftmostChild   node
	rightMost       node
}

type idNode struct {
	identifier string
	*nodeImplementation
}

func (i *nodeImplementation) makeSibling(y node) {
	var current node = i
	for current.getRightSibling() != nil {
		current = current.getRightSibling()
	}
	y = y.getLeftMostSibling()
	//could be itself

}

func (i *nodeImplementation) getRightSibling() node {
	return i.rightMost
}
func (i *nodeImplementation) getLeftMostSibling() node {
	return i.leftmostSibling
}
