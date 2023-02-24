package syntaxanalyzer

var semanticActions map[string]func(*semanticStack)

func init() {
	semanticActions["S1"] = func(ss *semanticStack) {
		ss.Push(&idNode{identifier: ss.mostRecentTokenValue, nodeImplementation: &nodeImplementation{}})
	}
	semanticActions["S2"] = func(ss *semanticStack) {
		ss.Push(&typeNode{typeName: ss.mostRecentTokenValue, nodeImplementation: &nodeImplementation{}})
	}
	semanticActions["S3"] = func(ss *semanticStack) {
		ss.Push(&epsilonNode{nodeImplementation: &nodeImplementation{}})
	}
	semanticActions["S4"] = func(ss *semanticStack) {
		ss.Push(&noSizeNode{nodeImplementation: &nodeImplementation{}})
	}
	semanticActions["S5"] = func(ss *semanticStack) {
		ss.Push(&intLitNode{value: ss.mostRecentTokenValue, nodeImplementation: &nodeImplementation{}})
	}

	semanticActions["S6"] = func(ss *semanticStack) {
		container := make([]node, 0)
		cond := true
		for val := ss.Pop(); cond; val = ss.Pop() {
			switch val.(type) {
			case *epsilonNode:
				cond = false
			default:
				container = append(container, val)
			}
		}
		first:=container[len(container)-1]
		for i:=len(container)-2;i>=0;i--{
			first.MakeSibling(container[i])
		}
		arrNode:=&arraySizeNode{nodeImplementation: &nodeImplementation{}}
		arrNode.AdoptChildren(first)
		ss.Push(arrNode)

	}
	semanticActions["S7"] = func(ss *semanticStack) {
		localVarNode:=&localVarNode{nodeImplementation: &nodeImplementation{}}
		container := make([]node, 0)
		switch v := ss.Pop().(type) {
		case *arraySizeNode:
			container = append(container, v)
		default:
			panic("unexpected node")
		}
		switch v := ss.Pop().(type) {
		case *typeNode:
			container = append(container, v)
		default:
			panic("unexpected node")
		}
		switch v := ss.Pop().(type) {
		case *idNode:
			container = append(container, v)
		default:
			panic("unexpected node")
		}
		first:=container[len(container)-1]
		for i:=len(container)-2;i>=0;i--{
			first.MakeSibling(container[i])
		}
		localVarNode.AdoptChildren(first)
		ss.Push(localVarNode)
	}

}

type semanticStack struct {
	container            []node
	mostRecentTokenValue string
}

func MakeSemanticStack() *semanticStack {
	return &semanticStack{container: make([]node, 0)}
}
func (s *semanticStack) Push(n node) {
	s.container = append(s.container, n)
}

func (s *semanticStack) Pop() node {
	n := s.container[len(s.container)-1]
	s.container = s.container[0 : len(s.container)-1]
	return n
}

type node interface {
	MakeSibling(node)
	getRightSibling() node
	getLeftMostSibling() node
	getParent() node
	setRightSibling(node)
	setLeftSibling(node)
	setParent(node)
	AdoptChildren(node)
}

type nodeImplementation struct {
	parent          node
	leftmostSibling node
	leftmostChild   node
	rightMost       node
	lineNumber      int
}

type idNode struct {
	identifier string
	*nodeImplementation
}

type typeNode struct {
	typeName string
	*nodeImplementation
}

type arraySizeNode struct {
	*nodeImplementation
}
type epsilonNode struct {
	*nodeImplementation
}
type noSizeNode struct {
	*nodeImplementation
}
type localVarNode struct {
	*nodeImplementation
}
type intLitNode struct {
	value string
	*nodeImplementation
}

func (i *nodeImplementation) MakeSibling(y node) {
	var current node = i
	for current.getRightSibling() != nil {
		current = current.getRightSibling()
	}
	y = y.getLeftMostSibling()
	//could be itself
	current.setRightSibling(y)
	y.setLeftSibling(current.getLeftMostSibling())
	y.setParent(current.getParent())
	for y.getRightSibling() != nil {
		y = y.getRightSibling()
		y.setLeftSibling(current.getLeftMostSibling())
		y.setParent(current.getParent())
	}

}
func (i *nodeImplementation) AdoptChildren(y node) {
	if i.leftmostChild != nil {
		i.leftmostChild.MakeSibling(y)
	} else {
		left := y.getLeftMostSibling()
		i.leftmostChild = left
		for left != nil {
			left.setParent(i)
			left = left.getRightSibling()
		}
	}

}

func (i *nodeImplementation) getRightSibling() node {
	return i.rightMost
}
func (i *nodeImplementation) getParent() node {
	return i.parent
}
func (i *nodeImplementation) getLeftMostSibling() node {
	if i.leftmostSibling == nil {
		return i
	}
	return i.leftmostSibling
}

func (i *nodeImplementation) setRightSibling(y node) {
	i.rightMost = y
}
func (i *nodeImplementation) setLeftSibling(y node) {
	i.leftmostSibling = y
}
func (i *nodeImplementation) setParent(y node) {
	i.parent = y
}
