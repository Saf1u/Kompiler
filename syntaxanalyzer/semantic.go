package syntaxanalyzer

import (
	"fmt"
	"os"
	"reflect"
	"strconv"
)

var globalIDPool int = 0

func getNextID() string {
	next := globalIDPool
	globalIDPool++
	return strconv.Itoa(next)
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
		if len(container) == 0 {
			id := getNextID()
			ss.writeBlank(id)
			container = append(container, &epsilonNode{nodeImplementation: &nodeImplementation{diagramID: fmt.Sprint("none", id)}})
		}
		id := getNextID()
		ss.writeNode(id, ("ArraySizeNode"))
		first := container[len(container)-1]
		ss.writeEdge(id, first.getDiagramID())
		for i := len(container) - 2; i >= 0; i-- {
			first.MakeSibling(container[i])
			ss.writeEdge(id, container[i].getDiagramID())
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
		case *paramListNode:
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
		ss.writeEdge(id, first.getDiagramID())
		for i := len(container) - 2; i >= 0; i-- {
			first.MakeSibling(container[i])
			ss.writeEdge(id, container[i].getDiagramID())
		}
		localVarNode.AdoptChildren(first)
		ss.Push(localVarNode)
	}
	semanticActions["S8"] = func(ss *semanticStack) {
		id := getNextID()
		dot:=&dotNode{ nodeImplementation: &nodeImplementation{diagramID: id}}
		ss.writeNode(id, fmt.Sprint("DotNode|"))
		term := ss.Pop()
		termb := ss.Pop()
		termb.MakeSibling(term)
		dot.AdoptChildren(termb)
		ss.Push(dot)
		ss.writeEdge(dot.getDiagramID(), term.getDiagramID())
		ss.writeEdge(dot.getDiagramID(), termb.getDiagramID())
	}
	semanticActions["S9"] = func(ss *semanticStack) {
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
		if len(container) == 0 {
			id := getNextID()
			ss.writeBlank(id)
			container = append(container, &epsilonNode{nodeImplementation: &nodeImplementation{diagramID: fmt.Sprint("none", id)}})
		}
		id := getNextID()
		ss.writeNode(id, ("ArraySizeNode"))
		first := container[len(container)-1]
		ss.writeEdge(id, first.getDiagramID())
		for i := len(container) - 2; i >= 0; i-- {
			first.MakeSibling(container[i])
			ss.writeEdge(id, container[i].getDiagramID())
		}
		arrNode := &arraySizeNode{nodeImplementation: &nodeImplementation{diagramID: id}}
		arrNode.AdoptChildren(first)
		ss.Push(arrNode)

	}
	semanticActions["S10"] = func(ss *semanticStack) {
		indiceList := ss.Pop()
		switch v := indiceList.(type) {
		case *arraySizeNode:
		default:
			panic(reflect.TypeOf(v))
		}

		idTok := ss.Pop()
		switch v := idTok.(type) {
		case *idNode:
		default:
			panic(reflect.TypeOf(v))
		}
		id := getNextID()
		varN:=&varNode{ nodeImplementation: &nodeImplementation{diagramID: id}}
		indiceList.MakeSibling(idTok)
		varN.AdoptChildren(indiceList)
		ss.writeNode(id, fmt.Sprint("VarNode|"))
		ss.writeEdge(varN.getDiagramID(), indiceList.getDiagramID())
		ss.writeEdge(varN.getDiagramID(), idTok.getDiagramID())
		ss.Push(varN)

	}
	semanticActions["S11"] = func(ss *semanticStack) {
		indiceList := ss.Pop()
		switch v := indiceList.(type) {
		case *paramListNode:
		default:
			panic(reflect.TypeOf(v))
		}

		idTok := ss.Pop()
		switch v := idTok.(type) {
		case *idNode:
		default:
			panic(reflect.TypeOf(v))
		}
		id := getNextID()
		funcCall:=&functionCall{ nodeImplementation: &nodeImplementation{diagramID: id}}
		indiceList.MakeSibling(idTok)
		funcCall.AdoptChildren(indiceList)
		ss.writeNode(id, fmt.Sprint("funcCall|"))
		ss.writeEdge(funcCall.getDiagramID(), indiceList.getDiagramID())
		ss.writeEdge(funcCall.getDiagramID(), idTok.getDiagramID())
		ss.Push(funcCall)

	}

	semanticActions["S13"] = func(ss *semanticStack) {
		id := getNextID()
		ss.Push(&floatNode{value: ss.mostRecentTokenValue, nodeImplementation: &nodeImplementation{diagramID: id}})
		ss.writeNode(id, fmt.Sprint("FloatLit|", ss.mostRecentTokenValue))

	}
	semanticActions["S12"] = func(ss *semanticStack) {

	}
	semanticActions["S14"] = func(ss *semanticStack) {
		factor := ss.Pop()
		id := getNextID()
		ss.writeNode(id, fmt.Sprint("NotNode|"))
		ss.writeEdge(id, factor.getDiagramID())
		not := &notNode{nodeImplementation: &nodeImplementation{diagramID: id}}
		not.AdoptChildren(factor)
		ss.Push(not)
	}
	semanticActions["S15"] = func(ss *semanticStack) {
		factor := ss.Pop()
		sign := ss.Pop()
		ss.writeEdge(sign.getDiagramID(), factor.getDiagramID())
		sign.AdoptChildren(factor)
		ss.Push(sign)
	}
	semanticActions["S16"] = func(ss *semanticStack) {
		id := getNextID()
		ss.writeNode(id, fmt.Sprint("SignNode|", ss.mostRecentTokenValue))
		sign := &signNode{value: ss.mostRecentTokenValue, nodeImplementation: &nodeImplementation{diagramID: id}}
		ss.Push(sign)
	}
	semanticActions["S20"] = func(ss *semanticStack) {
		id := getNextID()
		ss.writeNode(id, fmt.Sprint("addNode|", ss.mostRecentTokenValue))
		add := &addNode{value: ss.mostRecentTokenValue, nodeImplementation: &nodeImplementation{diagramID: id}}
		ss.Push(add)
	}
	semanticActions["S18"] = func(ss *semanticStack) {
		id := getNextID()
		ss.writeNode(id, fmt.Sprint("multNode|", ss.mostRecentTokenValue))
		mul := &multNode{value: ss.mostRecentTokenValue, nodeImplementation: &nodeImplementation{diagramID: id}}
		ss.Push(mul)
	}
	semanticActions["S21"] = func(ss *semanticStack) {
		term := ss.Pop()
		add := ss.Pop()
		termb := ss.Pop()
		switch v := add.(type) {
		case *addNode:
		default:
			panic(reflect.TypeOf(v))
		}
		
		termb.MakeSibling(term)
		add.AdoptChildren(termb)
		ss.Push(add)
		ss.writeEdge(add.getDiagramID(), term.getDiagramID())
		ss.writeEdge(add.getDiagramID(), termb.getDiagramID())
		

	}
	semanticActions["S19"] = func(ss *semanticStack) {
		term := ss.Pop()
		mult := ss.Pop()
		termb := ss.Pop()
		switch v := mult.(type) {
		case *multNode:
		default:
			panic(reflect.TypeOf(v))
		}
		termb.MakeSibling(term)
		mult.AdoptChildren(termb)
		ss.Push(mult)
		ss.writeEdge(mult.getDiagramID(), term.getDiagramID())
		ss.writeEdge(mult.getDiagramID(), termb.getDiagramID())
		

	}

	semanticActions["S22"] = func(ss *semanticStack) {
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
		if len(container) == 0 {
			id := getNextID()
			ss.writeBlank(id)
			container = append(container, &epsilonNode{nodeImplementation: &nodeImplementation{diagramID: fmt.Sprint("none", id)}})
		}
		id := getNextID()
		ss.writeNode(id, ("ParamListNode"))
		first := container[len(container)-1]
		ss.writeEdge(id, first.getDiagramID())
		for i := len(container) - 2; i >= 0; i-- {
			first.MakeSibling(container[i])
			ss.writeEdge(id, container[i].getDiagramID())
		}
		paramNode := &paramListNode{nodeImplementation: &nodeImplementation{diagramID: id}}
		paramNode.AdoptChildren(first)
		ss.Push(paramNode)

	}
	semanticActions["S23"] = func(ss *semanticStack) {
		id := getNextID()
		paramNode := &relOpNode{value: ss.mostRecentTokenValue,nodeImplementation: &nodeImplementation{diagramID: id}}
		ss.Push(paramNode)
		val:=fmt.Sprint("relOpNode|", "neq")
		if ss.mostRecentTokenValue!="<>"{
		val=fmt.Sprint("relOpNode|\\", ss.mostRecentTokenValue)
		}
		ss.writeNode(id, val)
	}
	semanticActions["S24"] = func(ss *semanticStack) {
		relexpra := ss.Pop()
		relNode := ss.Pop()
		relexprb := ss.Pop()
		switch v := relNode.(type) {
		case *relOpNode:
		default:
			panic(reflect.TypeOf(v))
		}
		relexprb.MakeSibling(relexpra)
		relNode.AdoptChildren(relexprb)
		ss.Push(relNode)
		ss.writeEdge(relNode.getDiagramID(), relexpra.getDiagramID())
		ss.writeEdge(relNode.getDiagramID(), relexprb.getDiagramID())
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
	file.WriteString(" node [fontname=Sans];charset=\"UTF-8\" splines=true splines=spline rankdir =LR ordering=\"out\"\n")
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
func (s *semanticStack) writeNode(id string, info string) {
	s.dotFile.WriteString(fmt.Sprintf("%s[label=\"%s\"];\n", id, info))
}
func (s *semanticStack) writeBlank(id string) {
	s.dotFile.WriteString(fmt.Sprintf("none%s[shape=\"%s\"];\n", id, "point"))
}
func (s *semanticStack) writeEdge(idParent string, idChild string) {
	s.dotFile.WriteString(fmt.Sprintf("%s->%s;\n", idParent, idChild))
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
	getDiagramID() string
}

type nodeImplementation struct {
	parent          node
	leftmostSibling node
	leftmostChild   node
	rightMost       node
	lineNumber      int
	diagramID       string
}

type idNode struct {
	identifier string
	*nodeImplementation
}

type typeNode struct {
	typeName string
	*nodeImplementation
}
type paramListNode struct {
	*nodeImplementation
}
type arraySizeNode struct {
	*nodeImplementation
}
type epsilonNode struct {
	*nodeImplementation
}
type notNode struct {
	*nodeImplementation
}
type dotNode struct {
	*nodeImplementation
}
type relOpNode struct {
	*nodeImplementation
	value string
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
type floatNode struct {
	value string
	*nodeImplementation
}
type addNode struct {
	value string
	*nodeImplementation
}
type signNode struct {
	value string
	*nodeImplementation
}
type multNode struct {
	value string
	*nodeImplementation
}
type functionCall struct {
	value string
	*nodeImplementation
}
type varNode struct {
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
func (i *nodeImplementation) getDiagramID() string {
	return i.diagramID
}
