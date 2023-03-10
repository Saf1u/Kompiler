package syntaxanalyzer

import (
	"compiler/lexer"
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
		ss.Push(&idNode{identifier: ss.mostRecentTokenValue.TokenValue, nodeImplementation: &nodeImplementation{table: makeTable(), diagramID: id, lineNumber: ss.mostRecentTokenValue.LineNumber}})
		ss.writeNode(id, fmt.Sprint("Id|", ss.mostRecentTokenValue.TokenValue))

	}
	semanticActions["S2"] = func(ss *semanticStack) {
		id := getNextID()
		ss.Push(&typeNode{typeName: ss.mostRecentTokenValue.TokenValue, nodeImplementation: &nodeImplementation{table: makeTable(), diagramID: id, lineNumber: ss.mostRecentTokenValue.LineNumber}})
		ss.writeNode(id, fmt.Sprint("type|", ss.mostRecentTokenValue.TokenValue))

	}
	semanticActions["S2E"] = func(ss *semanticStack) {
		id := getNextID()
		ss.Push(&returnTypeNode{typeName: ss.mostRecentTokenValue.TokenValue, nodeImplementation: &nodeImplementation{table: makeTable(), diagramID: id, lineNumber: ss.mostRecentTokenValue.LineNumber}})
		ss.writeNode(id, fmt.Sprint("returnType|", ss.mostRecentTokenValue.TokenValue))

	}
	semanticActions["S3"] = func(ss *semanticStack) {
		id := getNextID()
		ss.Push(&epsilonNode{nodeImplementation: &nodeImplementation{table: makeTable(), diagramID: id}})
	}
	semanticActions["S5X"] = func(ss *semanticStack) {
		id := getNextID()
		ss.Push(&dimNode{value: ss.mostRecentTokenValue.TokenValue, nodeImplementation: &nodeImplementation{table: makeTable(), diagramID: id, lineNumber: ss.mostRecentTokenValue.LineNumber}})
		ss.writeNode(id, fmt.Sprint("DimNode|", ss.mostRecentTokenValue.TokenValue))
	}
	semanticActions["S4X"] = func(ss *semanticStack) {
		id := getNextID()
		ss.Push(&dimNode{value: ss.mostRecentTokenValue.TokenValue, nodeImplementation: &nodeImplementation{table: makeTable(), diagramID: id, lineNumber: ss.mostRecentTokenValue.LineNumber}})
		ss.writeNode(id, fmt.Sprint("DimNode|", ""))

	}
	semanticActions["S5"] = func(ss *semanticStack) {
		id := getNextID()
		ss.Push(&intLitNode{value: ss.mostRecentTokenValue.TokenValue, nodeImplementation: &nodeImplementation{table: makeTable(), diagramID: id, lineNumber: ss.mostRecentTokenValue.LineNumber}})
		ss.writeNode(id, fmt.Sprint("IntLit|", ss.mostRecentTokenValue.TokenValue))
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
			container = append(container, &epsilonNode{nodeImplementation: &nodeImplementation{table: makeTable(), diagramID: fmt.Sprint("none", id)}})
		}
		id := getNextID()
		ss.writeNode(id, ("DimList"))
		first := container[len(container)-1]
		for i := len(container) - 2; i >= 0; i-- {
			first.MakeSibling(container[i], first)

		}
		for i := 0; i < len(container); i++ {
			ss.writeEdge(id, container[i].getDiagramID())
		}
		arrNode := &dimListNode{nodeImplementation: &nodeImplementation{table: makeTable(), diagramID: id}}
		arrNode.AdoptChildren(first, arrNode)
		ss.Push(arrNode)

	}
	semanticActions["S7"] = func(ss *semanticStack) {
		id := getNextID()
		ss.writeNode(id, ("localVarDeclNode"))
		localVarNode := &localVarNode{nodeImplementation: &nodeImplementation{table: makeTable(), diagramID: id}}
		container := make([]node, 0)
		switch v := ss.Pop().(type) {
		case *dimListNode:
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
		for i := len(container) - 2; i >= 0; i-- {
			first.MakeSibling(container[i], first)
		}
		for i := 0; i < len(container); i++ {
			ss.writeEdge(id, container[i].getDiagramID())
		}
		localVarNode.AdoptChildren(first, localVarNode)
		ss.Push(localVarNode)
	}
	semanticActions["S8"] = func(ss *semanticStack) {
		id := getNextID()
		dot := &dotNode{nodeImplementation: &nodeImplementation{table: makeTable(), diagramID: id}}
		ss.writeNode(id, ("DotNode"))
		term := ss.Pop()
		termb := ss.Pop()
		termb.MakeSibling(term, termb)
		dot.AdoptChildren(termb, dot)
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
			container = append(container, &epsilonNode{nodeImplementation: &nodeImplementation{table: makeTable(), diagramID: fmt.Sprint("none", id)}})
		}
		id := getNextID()
		ss.writeNode(id, ("IndiceList"))

		first := container[len(container)-1]
		for i := len(container) - 2; i >= 0; i-- {
			first.MakeSibling(container[i], first)
		}
		for i := 0; i < len(container); i++ {
			ss.writeEdge(id, container[i].getDiagramID())
		}
		arrNode := &indiceListNode{nodeImplementation: &nodeImplementation{table: makeTable(), diagramID: id}}
		arrNode.AdoptChildren(first, arrNode)
		ss.Push(arrNode)

	}
	semanticActions["S10"] = func(ss *semanticStack) {
		indiceList := ss.Pop()
		switch v := indiceList.(type) {
		case *indiceListNode:
		default:
			panic(reflect.TypeOf(v))
		}

		idTok := ss.Pop()
		switch v := idTok.(type) {
		case *idNode:
		case *dotNode:
		default:
			fmt.Println(ss.mostRecentTokenValue.TokenValue)
			panic(reflect.TypeOf(v))
		}
		id := getNextID()
		varN := &varNode{nodeImplementation: &nodeImplementation{table: makeTable(), diagramID: id}}
		idTok.MakeSibling(indiceList, idTok)
		varN.AdoptChildren(idTok, varN)
		ss.writeNode(id, ("VarNode"))
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
		funcCall := &functionCall{nodeImplementation: &nodeImplementation{table: makeTable(), diagramID: id}}
		idTok.MakeSibling(indiceList, idTok)
		funcCall.AdoptChildren(idTok, funcCall)
		ss.writeNode(id, ("funcCall"))
		ss.writeEdge(funcCall.getDiagramID(), indiceList.getDiagramID())
		ss.writeEdge(funcCall.getDiagramID(), idTok.getDiagramID())
		ss.Push(funcCall)

	}

	semanticActions["S13"] = func(ss *semanticStack) {
		id := getNextID()
		ss.Push(&floatNode{value: ss.mostRecentTokenValue.TokenValue, nodeImplementation: &nodeImplementation{table: makeTable(), diagramID: id, lineNumber: ss.mostRecentTokenValue.LineNumber}})
		ss.writeNode(id, fmt.Sprint("FloatLit|", ss.mostRecentTokenValue.TokenValue))

	}
	semanticActions["S12"] = func(ss *semanticStack) {

	}
	semanticActions["S14"] = func(ss *semanticStack) {
		factor := ss.Pop()
		id := getNextID()
		ss.writeNode(id, ("NotNode"))
		ss.writeEdge(id, factor.getDiagramID())
		not := &notNode{nodeImplementation: &nodeImplementation{table: makeTable(), diagramID: id}}
		not.AdoptChildren(factor, not)
		ss.Push(not)
	}
	semanticActions["S15"] = func(ss *semanticStack) {
		factor := ss.Pop()
		sign := ss.Pop()
		ss.writeEdge(sign.getDiagramID(), factor.getDiagramID())
		sign.AdoptChildren(factor, sign)
		ss.Push(sign)
	}
	semanticActions["S16"] = func(ss *semanticStack) {
		id := getNextID()
		ss.writeNode(id, fmt.Sprint("SignNode|", ss.mostRecentTokenValue.TokenValue))
		sign := &signNode{value: ss.mostRecentTokenValue.TokenValue, nodeImplementation: &nodeImplementation{table: makeTable(), diagramID: id, lineNumber: ss.mostRecentTokenValue.LineNumber}}
		ss.Push(sign)
	}
	semanticActions["S20"] = func(ss *semanticStack) {
		id := getNextID()
		ss.writeNode(id, fmt.Sprint("addNode|", ss.mostRecentTokenValue.TokenValue))
		add := &addNode{value: ss.mostRecentTokenValue.TokenValue, nodeImplementation: &nodeImplementation{table: makeTable(), diagramID: id, lineNumber: ss.mostRecentTokenValue.LineNumber}}
		ss.Push(add)
	}
	semanticActions["S18"] = func(ss *semanticStack) {
		id := getNextID()
		ss.writeNode(id, fmt.Sprint("multNode|", ss.mostRecentTokenValue.TokenValue))
		mul := &multNode{value: ss.mostRecentTokenValue.TokenValue, nodeImplementation: &nodeImplementation{table: makeTable(), diagramID: id, lineNumber: ss.mostRecentTokenValue.LineNumber}}
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

		termb.MakeSibling(term, termb)
		add.AdoptChildren(termb, add)
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
		termb.MakeSibling(term, termb)
		mult.AdoptChildren(termb, mult)
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
			container = append(container, &epsilonNode{nodeImplementation: &nodeImplementation{table: makeTable(), diagramID: fmt.Sprint("none", id)}})
		}
		id := getNextID()
		ss.writeNode(id, ("AParamListNode"))
		first := container[len(container)-1]
		for i := len(container) - 2; i >= 0; i-- {
			first.MakeSibling(container[i], first)
		}
		for i := 0; i < len(container); i++ {
			ss.writeEdge(id, container[i].getDiagramID())
		}
		paramNode := &paramListNode{nodeImplementation: &nodeImplementation{table: makeTable(), diagramID: id}}
		paramNode.AdoptChildren(first, paramNode)
		ss.Push(paramNode)

	}
	semanticActions["S23"] = func(ss *semanticStack) {
		id := getNextID()
		paramNode := &relOpNode{value: ss.mostRecentTokenValue.TokenValue, nodeImplementation: &nodeImplementation{table: makeTable(), diagramID: id, lineNumber: ss.mostRecentTokenValue.LineNumber}}
		ss.Push(paramNode)
		val := fmt.Sprint("relOpNode|", "neq")
		if ss.mostRecentTokenValue.TokenValue != "<>" {
			val = fmt.Sprint("relOpNode|\\", ss.mostRecentTokenValue.TokenValue)
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
		relexprb.MakeSibling(relexpra, relexprb)
		relNode.AdoptChildren(relexprb, relNode)
		ss.Push(relNode)
		ss.writeEdge(relNode.getDiagramID(), relexpra.getDiagramID())
		ss.writeEdge(relNode.getDiagramID(), relexprb.getDiagramID())
	}
	semanticActions["S25"] = func(ss *semanticStack) {
		id := getNextID()
		paramNode := &readStatementNode{nodeImplementation: &nodeImplementation{table: makeTable(), diagramID: id}}
		ss.Push(paramNode)
		ss.writeNode(id, ("ReadStatementNode"))
	}
	semanticActions["S26"] = func(ss *semanticStack) {
		varNode := ss.Pop()
		readstatNode := ss.Pop()
		switch v := readstatNode.(type) {
		case *readStatementNode:
		default:
			panic(reflect.TypeOf(v))
		}
		readstatNode.AdoptChildren(varNode, readstatNode)
		ss.Push(readstatNode)
		ss.writeEdge(readstatNode.getDiagramID(), varNode.getDiagramID())
	}
	semanticActions["S27"] = func(ss *semanticStack) {
		expr := ss.Pop()
		identifier := ss.Pop()
		id := getNextID()
		assignNode := &assignStatNode{nodeImplementation: &nodeImplementation{table: makeTable(), diagramID: id}}
		ss.writeNode(id, ("assignStat"))
		assignNode.AdoptChildren(identifier, assignNode)
		assignNode.AdoptChildren(expr, assignNode)
		ss.Push(assignNode)
		ss.writeEdge(assignNode.getDiagramID(), expr.getDiagramID())
		ss.writeEdge(assignNode.getDiagramID(), identifier.getDiagramID())
	}
	semanticActions["S28"] = func(ss *semanticStack) {
		indiceList := ss.Pop()
		switch v := indiceList.(type) {
		case *indiceListNode:
		default:
			panic(reflect.TypeOf(v))
		}

		idTok := ss.Pop()

		id := getNextID()
		varN := &varNode{nodeImplementation: &nodeImplementation{table: makeTable(), diagramID: id}}
		indiceList.MakeSibling(idTok, indiceList)
		varN.AdoptChildren(indiceList, varN)
		ss.writeNode(id, ("VarNode"))
		ss.writeEdge(varN.getDiagramID(), indiceList.getDiagramID())
		ss.writeEdge(varN.getDiagramID(), idTok.getDiagramID())
		ss.Push(varN)

	}
	semanticActions["S29"] = func(ss *semanticStack) {
		indiceList := ss.Pop()
		switch v := indiceList.(type) {
		case *paramListNode:
		default:
			panic(reflect.TypeOf(v))
		}

		idTok := ss.Pop()
		id := getNextID()
		funcCall := &functionCall{nodeImplementation: &nodeImplementation{table: makeTable(), diagramID: id}}
		indiceList.MakeSibling(idTok, indiceList)
		funcCall.AdoptChildren(indiceList, funcCall)
		ss.writeNode(id, ("funcCall"))
		ss.writeEdge(funcCall.getDiagramID(), indiceList.getDiagramID())
		ss.writeEdge(funcCall.getDiagramID(), idTok.getDiagramID())
		ss.Push(funcCall)

	}
	semanticActions["S30"] = func(ss *semanticStack) {
		id := getNextID()
		write := &writeNode{nodeImplementation: &nodeImplementation{table: makeTable(), diagramID: id}}
		ss.writeNode(id, ("WriteStatementNode"))
		varNode := ss.Pop()
		write.AdoptChildren(varNode, write)
		ss.Push(write)
		ss.writeEdge(write.getDiagramID(), varNode.getDiagramID())
	}

	semanticActions["S31"] = func(ss *semanticStack) {
		id := getNextID()
		ret := &returnNode{nodeImplementation: &nodeImplementation{table: makeTable(), diagramID: id}}
		ss.writeNode(id, ("ReturnStatementNode"))
		varNode := ss.Pop()
		ret.AdoptChildren(varNode, ret)
		ss.Push(ret)
		ss.writeEdge(ret.getDiagramID(), varNode.getDiagramID())
	}
	semanticActions["S32"] = func(ss *semanticStack) {
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
			container = append(container, &epsilonNode{nodeImplementation: &nodeImplementation{table: makeTable(), diagramID: fmt.Sprint("none", id)}})
		}
		id := getNextID()
		ss.writeNode(id, ("StatBlock"))
		first := container[len(container)-1]
		for i := len(container) - 2; i >= 0; i-- {
			first.MakeSibling(container[i], first)
		}
		for i := 0; i < len(container); i++ {
			ss.writeEdge(id, container[i].getDiagramID())
		}
		paramNode := &statBlockNode{nodeImplementation: &nodeImplementation{table: makeTable(), diagramID: id}}
		paramNode.AdoptChildren(first, paramNode)
		ss.Push(paramNode)
	}
	semanticActions["S33"] = func(ss *semanticStack) {
		id := getNextID()
		ss.writeNode(id, ("IfStat"))
		ifNode := &ifStatementNode{nodeImplementation: &nodeImplementation{table: makeTable(), diagramID: id}}
		statBlocka := ss.Pop()
		statBlockb := ss.Pop()
		relExpr := ss.Pop()
		switch v := statBlocka.(type) {
		case *statBlockNode:
		default:
			panic(reflect.TypeOf(v))
		}
		switch v := statBlockb.(type) {
		case *statBlockNode:
		default:
			panic(reflect.TypeOf(v))
		}
		statBlockb.MakeSibling(statBlocka, statBlockb)
		relExpr.MakeSibling(statBlockb, relExpr)
		ifNode.AdoptChildren(relExpr, ifNode)
		ss.Push(ifNode)
		ss.writeEdge(ifNode.getDiagramID(), statBlocka.getDiagramID())
		ss.writeEdge(ifNode.getDiagramID(), statBlockb.getDiagramID())
		ss.writeEdge(ifNode.getDiagramID(), relExpr.getDiagramID())
	}
	semanticActions["S34"] = func(ss *semanticStack) {
		id := getNextID()
		ss.writeNode(id, ("WhileStat"))
		whileNode := &whileStatementNode{nodeImplementation: &nodeImplementation{table: makeTable(), diagramID: id}}
		statBlocka := ss.Pop()
		relExpr := ss.Pop()
		switch v := statBlocka.(type) {
		case *statBlockNode:
		default:
			panic(reflect.TypeOf(v))
		}
		relExpr.MakeSibling(statBlocka, relExpr)
		whileNode.AdoptChildren(relExpr, whileNode)
		ss.Push(whileNode)
		ss.writeEdge(whileNode.getDiagramID(), statBlocka.getDiagramID())
		ss.writeEdge(whileNode.getDiagramID(), relExpr.getDiagramID())
	}
	semanticActions["S35"] = func(ss *semanticStack) {
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
			container = append(container, &epsilonNode{nodeImplementation: &nodeImplementation{table: makeTable(), diagramID: fmt.Sprint("none", id)}})
		}
		id := getNextID()
		ss.writeNode(id, ("fParamListNode"))
		first := container[len(container)-1]
		for i := len(container) - 2; i >= 0; i-- {
			first.MakeSibling(container[i], first)
		}
		for i := 0; i < len(container); i++ {
			ss.writeEdge(id, container[i].getDiagramID())
		}
		paramNode := &fparamListNode{nodeImplementation: &nodeImplementation{table: makeTable(), diagramID: id}}
		paramNode.AdoptChildren(first, paramNode)
		ss.Push(paramNode)

	}
	semanticActions["S36"] = func(ss *semanticStack) {
		id := getNextID()
		ss.writeNode(id, ("FuncDef"))
		funcNode := &funcDefNode{nodeImplementation: &nodeImplementation{table: makeTable(), diagramID: id}}
		statBlock := ss.Pop()
		typeN := ss.Pop()
		fParams := ss.Pop()
		idTok := ss.Pop()
		scopeTok := ss.Pop()
		switch v := statBlock.(type) {
		case *statBlockNode:
		default:
			panic(reflect.TypeOf(v))
		}
		switch v := typeN.(type) {
		case *returnTypeNode:
		default:
			panic(reflect.TypeOf(v))
		}
		switch v := fParams.(type) {
		case *fparamListNode:
		default:
			panic(reflect.TypeOf(v))
		}
		switch v := idTok.(type) {
		case *idNode:
		default:
			panic(reflect.TypeOf(v))
		}
		switch v := scopeTok.(type) {
		case *idNode:
		default:
			panic(reflect.TypeOf(v))
		}
		var scope node
		if idTok.(*idNode).identifier == "" {
			scope = &scopeNode{nodeImplementation: &nodeImplementation{table: makeTable(), diagramID: idTok.getDiagramID()}}
			idTok = scopeTok
			ss.writeNode(idTok.getDiagramID(), fmt.Sprint("Id|", idTok.(*idNode).identifier))

		} else {
			scope = &scopeNode{nodeImplementation: &nodeImplementation{table: makeTable(), diagramID: scopeTok.getDiagramID()}, identifier: scopeTok.(*idNode).identifier}
			ss.writeNode(scope.getDiagramID(), fmt.Sprint("ScopeNode|", scopeTok.(*idNode).identifier))
		}
		typeN.MakeSibling(statBlock, typeN)
		fParams.MakeSibling(typeN, fParams)
		idTok.MakeSibling(fParams, idTok)
		scope.MakeSibling(idTok, scope)
		funcNode.AdoptChildren(scope, funcNode)
		ss.Push(funcNode)
		ss.writeEdge(funcNode.getDiagramID(), statBlock.getDiagramID())
		ss.writeEdge(funcNode.getDiagramID(), typeN.getDiagramID())
		ss.writeEdge(funcNode.getDiagramID(), fParams.getDiagramID())
		ss.writeEdge(funcNode.getDiagramID(), idTok.getDiagramID())
		ss.writeEdge(funcNode.getDiagramID(), scope.getDiagramID())

	}

	semanticActions["S37"] = func(ss *semanticStack) {
		scopeId := getNextID()
		ss.writeNode(scopeId, fmt.Sprint("Id|", "constructor"))
		scope := &idNode{nodeImplementation: &nodeImplementation{table: makeTable(), diagramID: scopeId}, identifier: "constructor"}
		ss.Push(scope)
	}
	semanticActions["S38"] = func(ss *semanticStack) {
		scopeId := getNextID()
		ss.writeNode(scopeId, ("scopeNode| "))
		scope := &idNode{nodeImplementation: &nodeImplementation{table: makeTable(), diagramID: scopeId}, identifier: ""}
		ss.Push(scope)
	}
	semanticActions["S39"] = func(ss *semanticStack) {
		Id := getNextID()
		ss.writeNode(Id, ("returntype| "))
		typeN := &returnTypeNode{nodeImplementation: &nodeImplementation{table: makeTable(), diagramID: Id}, typeName: ""}
		ss.Push(typeN)
	}
	semanticActions["S40"] = func(ss *semanticStack) {
		id := getNextID()
		ss.Push(&idNode{identifier: ss.mostRecentTokenValue.TokenValue, nodeImplementation: &nodeImplementation{table: makeTable(), diagramID: id, lineNumber: ss.mostRecentTokenValue.LineNumber}})
		//ss.writeNode(id, fmt.Sprint("Id|", ss.mostRecentTokenValue))
	}
	semanticActions["S41"] = func(ss *semanticStack) {
		id := getNextID()
		visibility := ss.mostRecentTokenValue.TokenValue
		if visibility != "private" && visibility != "public" {
			visibility = ""
		}
		ss.Push(&visibilityNode{identifier: visibility, nodeImplementation: &nodeImplementation{table: makeTable(), diagramID: id}})
		ss.writeNode(id, fmt.Sprint("VisibilityNode|", visibility))
	}
	semanticActions["S42"] = func(ss *semanticStack) {
		id := getNextID()
		ss.writeNode(id, ("ClassVarDeclNode"))
		VarNode := &ClassVarNode{nodeImplementation: &nodeImplementation{table: makeTable(), diagramID: id}}
		container := make([]node, 0)
		switch v := ss.Pop().(type) {
		case *dimListNode:
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
		switch v := ss.Pop().(type) {
		case *visibilityNode:
			container = append(container, v)
		default:
			panic("unexpected node")
		}
		first := container[len(container)-1]
		for i := len(container) - 2; i >= 0; i-- {
			first.MakeSibling(container[i], first)
		}
		for i := 0; i < len(container); i++ {
			ss.writeEdge(id, container[i].getDiagramID())
		}
		VarNode.AdoptChildren(first, VarNode)
		ss.Push(VarNode)
	}
	semanticActions["S43"] = func(ss *semanticStack) {
		id := getNextID()
		ss.writeNode(id, ("FuncDecl"))
		funcDecl := &funcDeclNode{nodeImplementation: &nodeImplementation{table: makeTable(), diagramID: id}}
		typeN := ss.Pop()
		fParams := ss.Pop()
		idTok := ss.Pop()
		visibility := ss.Pop()
		switch v := typeN.(type) {
		case *returnTypeNode:
		default:
			panic(reflect.TypeOf(v))
		}
		switch v := fParams.(type) {
		case *fparamListNode:
		default:
			panic(reflect.TypeOf(v))
		}
		switch v := idTok.(type) {
		case *idNode:
		default:
			panic(reflect.TypeOf(v))
		}
		switch v := visibility.(type) {
		case *visibilityNode:
		default:
			panic(reflect.TypeOf(v))
		}
		fParams.MakeSibling(typeN, fParams)
		idTok.MakeSibling(fParams, idTok)
		visibility.MakeSibling(idTok, visibility)
		funcDecl.AdoptChildren(visibility, funcDecl)
		ss.Push(funcDecl)
		ss.writeEdge(funcDecl.getDiagramID(), typeN.getDiagramID())
		ss.writeEdge(funcDecl.getDiagramID(), fParams.getDiagramID())
		ss.writeEdge(funcDecl.getDiagramID(), idTok.getDiagramID())
		ss.writeEdge(funcDecl.getDiagramID(), visibility.getDiagramID())

	}
	semanticActions["S44"] = func(ss *semanticStack) {
		container := make([]node, 0)
		cond := true
		for val := ss.Pop(); cond; {
			switch val.(type) {
			case *epsilonNode:
				cond = false
			case *idNode:

				container = append(container, val)
				val = ss.Pop()
			default:
				panic(reflect.TypeOf(val))
			}
		}
		if len(container) == 0 {
			id := getNextID()
			ss.writeBlank(id)
			container = append(container, &epsilonNode{nodeImplementation: &nodeImplementation{table: makeTable(), diagramID: fmt.Sprint("none", id)}})
		}
		id := getNextID()
		ss.writeNode(id, ("InheritanceNode"))
		first := container[len(container)-1]
		for i := len(container) - 2; i >= 0; i-- {
			first.MakeSibling(container[i], first)
		}
		for i := 0; i < len(container); i++ {
			ss.writeEdge(id, container[i].getDiagramID())
		}
		inhertitNode := &inheritanceNode{nodeImplementation: &nodeImplementation{table: makeTable(), diagramID: id}}
		inhertitNode.AdoptChildren(first, inhertitNode)
		ss.Push(inhertitNode)

	}
	semanticActions["S45"] = func(ss *semanticStack) {
		paramNode := &classMarkerPseudoNode{nodeImplementation: &nodeImplementation{table: makeTable()}}
		ss.Push(paramNode)
	}
	semanticActions["S46"] = func(ss *semanticStack) {
		container := make([]node, 0)
		cond := true
		for val := ss.Pop(); cond; {
			switch val.(type) {
			case *classMarkerPseudoNode:
				cond = false
			case *idNode:

				container = append(container, val)
				val = ss.Pop()
			case *inheritanceNode:

				container = append(container, val)
				val = ss.Pop()
			case *ClassVarNode:

				container = append(container, val)
				val = ss.Pop()
			case *funcDeclNode:

				container = append(container, val)
				val = ss.Pop()
			default:
				panic(reflect.TypeOf(val))
			}
		}
		if len(container) == 0 {
			id := getNextID()
			ss.writeBlank(id)
			container = append(container, &epsilonNode{nodeImplementation: &nodeImplementation{table: makeTable(), diagramID: fmt.Sprint("none", id)}})
		}
		id := getNextID()
		ss.writeNode(id, ("ClassDecl"))
		first := container[len(container)-1]
		for i := len(container) - 2; i >= 0; i-- {
			first.MakeSibling(container[i], first)
		}
		for i := 0; i < len(container); i++ {
			ss.writeEdge(id, container[i].getDiagramID())
		}
		class := &classDecl{nodeImplementation: &nodeImplementation{table: makeTable(), diagramID: id}}
		class.AdoptChildren(first, class)
		ss.Push(class)

	}

	semanticActions["GROUPACTION"] = func(ss *semanticStack) {
		id := getNextID()
		classList := &classListNode{&nodeImplementation{table: makeTable(), diagramID: id}}
		ss.writeNode(id, ("ClassList"))
		id = getNextID()
		funcList := &funcDefListNode{&nodeImplementation{table: makeTable(), diagramID: id}}
		ss.writeNode(id, ("FuncDeflList"))
		id = getNextID()
		progNode := &program{&nodeImplementation{table: makeTable(), diagramID: id}}
		ss.writeNode(id, ("Prog"))
		id = getNextID()
		progBlockNode := &programBlockNode{&nodeImplementation{table: makeTable(), diagramID: id}}
		ss.writeNode(id, ("ProgramBlock"))
		classContainer := []node{}
		functionContainer := []node{}
		for val := ss.Pop(); val != nil; {
			switch val.(type) {
			case *classDecl:
				ss.writeEdge(classList.getDiagramID(), val.getDiagramID())
				classContainer = append(classContainer, val)
				val = ss.Pop()
			case *funcDefNode:
				// panic(reflect.TypeOf(val.getLeftMostChild().getRightSibling()))
				if val.getLeftMostChild().getRightSibling().(*idNode).identifier == "main" {
					ss.writeEdge(progBlockNode.getDiagramID(), val.getDiagramID())
					progBlockNode.AdoptChildren(val, progBlockNode)
				} else {
					ss.writeEdge(funcList.getDiagramID(), val.getDiagramID())
					functionContainer = append(functionContainer, val)
				}
				val = ss.Pop()
			default:
				panic(reflect.TypeOf(val))
			}
		}
		if len(functionContainer) == 0 {
			id := getNextID()
			ss.writeBlank(id)
			functionContainer = append(functionContainer, &epsilonNode{nodeImplementation: &nodeImplementation{table: makeTable(), diagramID: fmt.Sprint("none", id)}})
		}
		if len(classContainer) == 0 {
			id := getNextID()
			ss.writeBlank(id)
			classContainer = append(classContainer, &epsilonNode{nodeImplementation: &nodeImplementation{table: makeTable(), diagramID: fmt.Sprint("none", id)}})
		}
		for i := len(classContainer) - 1; i >= 0; i-- {
			classList.AdoptChildren(classContainer[i], classList)
		}
		for i := len(functionContainer) - 1; i >= 0; i-- {
			funcList.AdoptChildren(functionContainer[i], funcList)
		}
		progNode.AdoptChildren(progBlockNode, progNode)
		progNode.AdoptChildren(funcList, progNode)
		progNode.AdoptChildren(classList, progNode)
		ss.writeEdge(progNode.getDiagramID(), classList.getDiagramID())
		ss.writeEdge(progNode.getDiagramID(), funcList.getDiagramID())
		ss.writeEdge(progNode.getDiagramID(), progBlockNode.getDiagramID())
		ss.Push(progNode)

	}

}

type semanticStack struct {
	container            []node
	mostRecentTokenValue lexer.Token
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
	if len(s.container) == 0 {
		return nil
	}
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
	MakeSibling(node, node)
	getRightSibling() node
	getLeftMostSibling(node) node
	getLeftMostChild() node
	getParent() node
	setRightSibling(node)
	setLeftSibling(node)
	setParent(node)
	AdoptChildren(node, node)
	getDiagramID() string
	Accept(visitor)
	getSingleEntry() *symbolTableRecord
	getTable() *symbolTable
}

type symbolTable struct {
	records map[string]*symbolTableRecord
	keys    []string
}

func (s *symbolTable) addRecord(record *symbolTableRecord) {
	s.records[record.name] = record
	s.keys = append(s.keys, record.name)
}
func (s *symbolTable) getSingleEntry() *symbolTableRecord {
	var record *symbolTableRecord
	for _, r := range s.records {
		record = r
		break
	}
	return record

}
func (s *symbolTable) getEntry(name string) *symbolTableRecord {
	return s.records[name]
}
func (s *symbolTable) exist(name string) bool {
	_, ok := s.records[name]
	return ok
}
func (s *symbolTable) existWithKind(name string, kind string) bool {
	if !s.exist(name) {
		return false
	} else {
		return s.records[name].kind == kind
	}

}
func (s *symbolTable) getRecords() []*symbolTableRecord {
	records := make([]*symbolTableRecord, 0)
	for _, key := range s.keys {
		records = append(records, s.records[key])
	}
	return records
}

func makeTable() *symbolTable {
	return &symbolTable{make(map[string]*symbolTableRecord), make([]string, 0)}
}

// read-only record except link
type symbolTableRecord struct {
	name       string
	kind       string
	visibility string
	typeEntry  *typeRecord
	link       *symbolTable
}

func newRecord(name string, kind string, visibility string, typeEntry *typeRecord, ref *symbolTable) *symbolTableRecord {
	return &symbolTableRecord{name, kind, visibility, typeEntry, ref}
}

func (s *symbolTableRecord) getName() string {
	return s.name
}
func (s *symbolTableRecord) getKind() string {
	return s.kind
}
func (s *symbolTableRecord) getType() *typeRecord {
	return s.typeEntry
}
func (s *symbolTableRecord) getLink() *symbolTable {
	return s.link
}
func (s *symbolTableRecord) getVisibility() string {
	return s.visibility
}
func (s *symbolTableRecord) SetNameEntry(name string) {
	s.name = name
}
func (s *symbolTableRecord) SetTablelink(link *symbolTable) {
	s.link = link
}
func (s *symbolTableRecord) SetKindEntry(kind string) {
	s.kind = kind
}
func (s *symbolTableRecord) SetTypeEntry(typeRec *typeRecord) {
	s.typeEntry = typeRec
}
func (s *symbolTableRecord) SetVisibilityEntry(visibility string) {
	s.visibility = visibility
}

type typeRecord struct {
	typeInfo string
}

func newTypeRecord(typeInfo string) *typeRecord {
	return &typeRecord{typeInfo: typeInfo}
}

func (t *typeRecord) equal(typeIn *typeRecord) bool {
	return t.typeInfo == typeIn.typeInfo
}
func (t *typeRecord) Type() string {
	return t.typeInfo
}
func (t *typeRecord) String() string {
	return t.typeInfo
}

type nodeImplementation struct {
	parent          node
	leftmostSibling node
	leftmostChild   node
	rightMost       node
	lineNumber      int
	table           *symbolTable
	diagramID       string
}

type assignStatNode struct {
	*nodeImplementation
}

func (i *assignStatNode) Accept(v visitor) {
	n := i.getLeftMostChild()
	for n != nil {
		n.Accept(v)
		n = n.getRightSibling()
	}
	v.visitAssign(i)
}

type program struct {
	*nodeImplementation
}

func (i *program) Accept(v visitor) {
	n := i.getLeftMostChild()
	for n != nil {
		n.Accept(v)
		n = n.getRightSibling()
	}
	v.visitProgram(i)
}

type classMarkerPseudoNode struct {
	*nodeImplementation
}
type visibilityNode struct {
	identifier string
	*nodeImplementation
}

func (i *visibilityNode) Accept(v visitor) {
	n := i.getLeftMostChild()
	for n != nil {
		n.Accept(v)
		n = n.getRightSibling()
	}
	v.visitVisiblity(i)
}

type funcDeclNode struct {
	*nodeImplementation
}

func (i *funcDeclNode) Accept(v visitor) {
	n := i.getLeftMostChild()
	for n != nil {
		n.Accept(v)
		n = n.getRightSibling()
	}
	v.visitFuncDecl(i)
}

type classDecl struct {
	*nodeImplementation
}

func (i *classDecl) Accept(v visitor) {
	n := i.getLeftMostChild()
	for n != nil {
		n.Accept(v)
		n = n.getRightSibling()
	}
	v.visitClassDecl(i)
}

type writeNode struct {
	*nodeImplementation
}

func (i *writeNode) Accept(v visitor) {
	n := i.getLeftMostChild()
	for n != nil {
		n.Accept(v)
		n = n.getRightSibling()
	}
	v.visitWrite(i)
}

type returnNode struct {
	*nodeImplementation
}

func (i *returnNode) Accept(v visitor) {
	n := i.getLeftMostChild()
	for n != nil {
		n.Accept(v)
		n = n.getRightSibling()
	}
	v.visitReturn(i)
}

type inheritanceNode struct {
	*nodeImplementation
}

func (i *inheritanceNode) Accept(v visitor) {
	n := i.getLeftMostChild()
	for n != nil {
		n.Accept(v)
		n = n.getRightSibling()
	}
	v.visitInheritance(i)
}

type statBlockNode struct {
	*nodeImplementation
}

func (i *statBlockNode) Accept(v visitor) {
	n := i.getLeftMostChild()
	for n != nil {
		n.Accept(v)
		n = n.getRightSibling()
	}
	v.visitStatBlock(i)
}

type ifStatementNode struct {
	*nodeImplementation
}

func (i *ifStatementNode) Accept(v visitor) {
	n := i.getLeftMostChild()
	for n != nil {
		n.Accept(v)
		n = n.getRightSibling()
	}
	v.visitifStatement(i)
}

type whileStatementNode struct {
	*nodeImplementation
}

func (i *whileStatementNode) Accept(v visitor) {
	n := i.getLeftMostChild()
	for n != nil {
		n.Accept(v)
		n = n.getRightSibling()
	}
	v.visitWhileStatement(i)
}

type classListNode struct {
	*nodeImplementation
}

func (i *classListNode) Accept(v visitor) {
	n := i.getLeftMostChild()
	for n != nil {
		n.Accept(v)
		n = n.getRightSibling()
	}
	v.visitClassList(i)
}

type funcDefListNode struct {
	*nodeImplementation
}

func (i *funcDefListNode) Accept(v visitor) {
	n := i.getLeftMostChild()
	for n != nil {
		n.Accept(v)
		n = n.getRightSibling()
	}
	v.visitFuncDefList(i)
}

type funcDefNode struct {
	*nodeImplementation
}

func (i *funcDefNode) Accept(v visitor) {
	n := i.getLeftMostChild()
	for n != nil {
		n.Accept(v)
		n = n.getRightSibling()
	}
	v.visitFuncDef(i)
}

type programBlockNode struct {
	*nodeImplementation
}

func (i *programBlockNode) Accept(v visitor) {
	n := i.getLeftMostChild()
	for n != nil {
		n.Accept(v)
		n = n.getRightSibling()
	}
	v.visitProgramBlock(i)
}

type idNode struct {
	identifier string
	*nodeImplementation
}

func (i *idNode) Accept(v visitor) {
	n := i.getLeftMostChild()
	for n != nil {
		n.Accept(v)
		n = n.getRightSibling()
	}
	v.visitId(i)
}

type scopeNode struct {
	identifier string
	*nodeImplementation
}

func (i *scopeNode) Accept(v visitor) {
	n := i.getLeftMostChild()
	for n != nil {
		n.Accept(v)
		n = n.getRightSibling()
	}
	v.visitScope(i)
}

type typeNode struct {
	typeName string
	*nodeImplementation
}

func (i *typeNode) Accept(v visitor) {
	n := i.getLeftMostChild()
	for n != nil {
		n.Accept(v)
		n = n.getRightSibling()
	}
	v.visitType(i)
}

type returnTypeNode struct {
	typeName string
	*nodeImplementation
}

func (i *returnTypeNode) Accept(v visitor) {
	n := i.getLeftMostChild()
	for n != nil {
		n.Accept(v)
		n = n.getRightSibling()
	}
	v.visitReturnType(i)
}

type paramListNode struct {
	*nodeImplementation
}

func (i *paramListNode) Accept(v visitor) {
	n := i.getLeftMostChild()
	for n != nil {
		n.Accept(v)
		n = n.getRightSibling()
	}
	v.visitParamlist(i)
}

type fparamListNode struct {
	*nodeImplementation
}

func (i *fparamListNode) Accept(v visitor) {
	n := i.getLeftMostChild()
	for n != nil {
		n.Accept(v)
		n = n.getRightSibling()
	}
	v.visitFparamlist(i)
}

type dimListNode struct {
	*nodeImplementation
}

func (i *dimListNode) Accept(v visitor) {
	n := i.getLeftMostChild()
	for n != nil {
		n.Accept(v)
		n = n.getRightSibling()
	}
	v.visitDimList(i)
}

type indiceListNode struct {
	*nodeImplementation
}

func (i *indiceListNode) Accept(v visitor) {
	n := i.getLeftMostChild()
	for n != nil {
		n.Accept(v)
		n = n.getRightSibling()
	}
	v.visitIndiceList(i)
}

type epsilonNode struct {
	*nodeImplementation
}

func (i *epsilonNode) Accept(v visitor) {

	n := i.getLeftMostChild()
	for n != nil {
		n.Accept(v)
		n = n.getRightSibling()
	}
	v.visitEpsilon(i)
}

type notNode struct {
	*nodeImplementation
}

func (i *notNode) Accept(v visitor) {
	n := i.getLeftMostChild()
	for n != nil {
		n.Accept(v)
		n = n.getRightSibling()
	}
	v.visitNot(i)
}

type dotNode struct {
	*nodeImplementation
}

func (i *dotNode) Accept(v visitor) {
	n := i.getLeftMostChild()
	for n != nil {
		n.Accept(v)
		n = n.getRightSibling()
	}
	v.visitDot(i)
}

type relOpNode struct {
	*nodeImplementation
	value string
}

func (i *relOpNode) Accept(v visitor) {
	n := i.getLeftMostChild()
	for n != nil {
		n.Accept(v)
		n = n.getRightSibling()
	}
	v.visitRelOp(i)
}

type readStatementNode struct {
	*nodeImplementation
}

func (i *readStatementNode) Accept(v visitor) {
	n := i.getLeftMostChild()
	for n != nil {
		n.Accept(v)
		n = n.getRightSibling()
	}
	v.visitReadStatement(i)
}

type localVarNode struct {
	*nodeImplementation
}

func (i *localVarNode) Accept(v visitor) {
	n := i.getLeftMostChild()
	for n != nil {
		n.Accept(v)
		n = n.getRightSibling()
	}
	v.visitLocalVarDecl(i)
}

type ClassVarNode struct {
	*nodeImplementation
}

func (i *ClassVarNode) Accept(v visitor) {
	n := i.getLeftMostChild()
	for n != nil {
		n.Accept(v)
		n = n.getRightSibling()
	}
	v.visitClassVarDecl(i)
}

type intLitNode struct {
	value string
	*nodeImplementation
}

func (i *intLitNode) Accept(v visitor) {
	n := i.getLeftMostChild()
	for n != nil {
		n.Accept(v)
		n = n.getRightSibling()
	}
	v.visitIntlit(i)
}

type dimNode struct {
	value string
	*nodeImplementation
}

func (i *dimNode) Accept(v visitor) {
	n := i.getLeftMostChild()
	for n != nil {
		n.Accept(v)
		n = n.getRightSibling()
	}
	v.visitDim(i)
}

type floatNode struct {
	value string
	*nodeImplementation
}

func (i *floatNode) Accept(v visitor) {
	n := i.getLeftMostChild()
	for n != nil {
		n.Accept(v)
		n = n.getRightSibling()
	}
	v.visitFloatLit(i)
}

type addNode struct {
	value string
	*nodeImplementation
}

func (i *addNode) Accept(v visitor) {
	n := i.getLeftMostChild()
	for n != nil {
		n.Accept(v)
		n = n.getRightSibling()
	}
	v.visitAdd(i)
}

type signNode struct {
	value string
	*nodeImplementation
}

func (i *signNode) Accept(v visitor) {
	n := i.getLeftMostChild()
	for n != nil {
		n.Accept(v)
		n = n.getRightSibling()
	}
	v.visitSign(i)
}

type multNode struct {
	value string
	*nodeImplementation
}

func (i *multNode) Accept(v visitor) {
	n := i.getLeftMostChild()
	for n != nil {
		n.Accept(v)
		n = n.getRightSibling()
	}
	v.visitMult(i)
}

type functionCall struct {
	*nodeImplementation
}

func (i *functionCall) Accept(v visitor) {
	n := i.getLeftMostChild()
	for n != nil {
		n.Accept(v)
		n = n.getRightSibling()
	}
	v.visitFuncCall(i)
}

type varNode struct {
	*nodeImplementation
}

func (i *varNode) Accept(v visitor) {
	n := i.getLeftMostChild()
	for n != nil {
		n.Accept(v)
		n = n.getRightSibling()
	}
	v.visitVar(i)
}

func (i *nodeImplementation) MakeSibling(y node, current node) {
	for current.getRightSibling() != nil {
		current = current.getRightSibling()
	}
	y = y.getLeftMostSibling(y)
	//could be itself
	current.setRightSibling(y)
	y.setLeftSibling(current.getLeftMostSibling(current))
	y.setParent(current.getParent())
	for y.getRightSibling() != nil {
		y = y.getRightSibling()
		y.setLeftSibling(current.getLeftMostSibling(current))
		y.setParent(current.getParent())
	}

}
func (i *nodeImplementation) Accept(v visitor) {

}
func (i *nodeImplementation) AdoptChildren(y node, self node) {
	if i.leftmostChild != nil {
		i.leftmostChild.MakeSibling(y, i.leftmostChild)
	} else {
		left := y.getLeftMostSibling(y)
		i.leftmostChild = left
		for left != nil {
			left.setParent(self)
			left = left.getRightSibling()
		}
	}

}
func (i *nodeImplementation) getSingleEntry() *symbolTableRecord {
	return i.table.getSingleEntry()

}
func (i *nodeImplementation) getTable() *symbolTable {

	return i.table

}

func (i *nodeImplementation) getRightSibling() node {
	return i.rightMost
}
func (i *nodeImplementation) getParent() node {
	return i.parent
}
func (i *nodeImplementation) getLeftMostChild() node {
	return i.leftmostChild
}
func (i *nodeImplementation) getLeftMostSibling(self node) node {
	if i.leftmostSibling == nil {
		return self
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
