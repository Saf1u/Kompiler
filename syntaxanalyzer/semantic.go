package syntaxanalyzer

import (
	"fmt"
	"os"
	"reflect"
)

var globalIDPool int = 0

func getNextID() int {
	next := globalIDPool
	globalIDPool++
	return next
}

var semanticActions map[string]func(*semanticStack)

func init() {
	semanticActions = make(map[string]func(*semanticStack))
	semanticActions["S1"] = func(ss *semanticStack) {
		id := getNextID()
		ss.Push(&idNode{identifier: ss.mostRecentTokenValue, nodeImplementation: &nodeImplementation{diagramID: id}})
		ss.writeNode(id, fmt.Sprint("Id|", ss.mostRecentTokenValue))

	}
	semanticActions["S2"] = func(ss *semanticStack) {
		id := getNextID()
		ss.Push(&typeNode{typeName: ss.mostRecentTokenValue, nodeImplementation: &nodeImplementation{diagramID: id}})
		ss.writeNode(id, fmt.Sprint("type|", ss.mostRecentTokenValue))

	}
	semanticActions["S3"] = func(ss *semanticStack) {
		id := getNextID()
		ss.Push(&epsilonNode{nodeImplementation: &nodeImplementation{diagramID: id}})
	}
	semanticActions["S4"] = func(ss *semanticStack) {
		id := getNextID()
		ss.Push(&noSizeNode{nodeImplementation: &nodeImplementation{diagramID: id}})
		ss.writeNode(id, "NoSize|")

	}
	semanticActions["S5"] = func(ss *semanticStack) {
		id := getNextID()
		ss.Push(&intLitNode{value: ss.mostRecentTokenValue, nodeImplementation: &nodeImplementation{diagramID: id}})
		ss.writeNode(id, fmt.Sprint("IntLit|", ss.mostRecentTokenValue))
	}

	semanticActions["S6"] = func(ss *semanticStack) {
		container := make([]node, 0)
		cond := true
		for val := ss.Pop(); cond; {
			switch val.(type) {
			case *epsilonNode:
				cond = false
			default:
				container = append(container, val)
				val = ss.Pop()
			}
		}
		id := getNextID()
		ss.writeNode(id, ("ArraySizeNode"))
		first := container[len(container)-1]
		ss.writeEdge(id,first.getDiagramID())
		for i := len(container) - 2; i >= 0; i-- {
			first.MakeSibling(container[i])
			ss.writeEdge(id,container[i].getDiagramID())
		}
		arrNode := &arraySizeNode{nodeImplementation: &nodeImplementation{diagramID: id}}
		arrNode.AdoptChildren(first)
		ss.Push(arrNode)

	}
	semanticActions["S7"] = func(ss *semanticStack) {
		id := getNextID()
		ss.writeNode(id, ("localVarNode"))
		localVarNode := &localVarNode{nodeImplementation: &nodeImplementation{diagramID: id}}
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
			panic(reflect.TypeOf(v))
		}
		switch v := ss.Pop().(type) {
		case *idNode:
			container = append(container, v)
		default:
			panic("unexpected node")
		}
		first := container[len(container)-1]
		ss.writeEdge(id,first.getDiagramID())
		for i := len(container) - 2; i >= 0; i-- {
			first.MakeSibling(container[i])
			ss.writeEdge(id,container[i].getDiagramID())
		}
		localVarNode.AdoptChildren(first)
		ss.Push(localVarNode)
	}

}

type semanticStack struct {
	container            []node
	mostRecentTokenValue string
	dotFile              *os.File
}

func MakeSemanticStack(file *os.File) *semanticStack {
	file.WriteString("digraph AST {\n")
	file.WriteString("node [shape=record];\n")
	file.WriteString(" node [fontname=Sans];charset=\"UTF-8\" splines=true splines=spline rankdir =LR\n")
	return &semanticStack{container: make([]node, 0), dotFile: file}
}
func (s *semanticStack) Push(n node) {
	s.container = append(s.container, n)
}

func (s *semanticStack) Pop() node {
	n := s.container[len(s.container)-1]
	s.container = s.container[0 : len(s.container)-1]
	return n
}
func (s *semanticStack) writeNode(id int, info string) {
	s.dotFile.WriteString(fmt.Sprintf("%d[label=\"%s\"];\n", id, info))
}
func (s *semanticStack) writeEdge(idParent int, idChild int) {
	s.dotFile.WriteString(fmt.Sprintf("%d->%d;\n", idParent, idChild))
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
	getDiagramID() int
}

type nodeImplementation struct {
	parent          node
	leftmostSibling node
	leftmostChild   node
	rightMost       node
	lineNumber      int
	diagramID       int
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
func (i *nodeImplementation) getDiagramID() int {
	return i.diagramID
}
