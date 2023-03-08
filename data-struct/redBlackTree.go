package main

import "fmt"

type RedBlackTree struct {
	leftNode  *RedBlackTree
	rightNode *RedBlackTree
	parent    *RedBlackTree
	color     int //0=red 1=black
	val       int
}

var nilnode = &RedBlackTree{color: 1}

func main() {

	rbTree := &RedBlackTree{}
	rbTree.appendNode(5)
	rbTree.appendNode(2)
	rbTree.appendNode(6)
	rbTree.printTree("", 0)
}

func (t *RedBlackTree) appendNode(val int) {
	if t.parent == nil {
		t.color = 1
		t.val = val
		t.leftNode = nil
		t.rightNode = nil
		t.parent = t
		return
	}
	insert(t, val)
}

func insert(t *RedBlackTree, val int) {
	temp := t
	for t != nil {
		temp = t
		if t.val >= val {
			t = t.leftNode
			continue
		}
		if t.val < val {
			t = t.rightNode
			continue
		}
	}

	if temp.val >= val {
		temp.leftNode = &RedBlackTree{val: val, color: 0, leftNode: nil, rightNode: nil, parent: temp.leftNode}
	} else {
		temp.rightNode = &RedBlackTree{val: val, color: 0, leftNode: nil, rightNode: nil, parent: temp.rightNode}
	}
}

func currentNodeCheck() {

}

func balanceAfterInsert() {

}

func rRotate() {

}

func lRotate() {

}

func deletNode() {

}

func newRedBlackTreeNode(left *RedBlackTree, right *RedBlackTree, parent *RedBlackTree, val int, color int) *RedBlackTree {
	return &RedBlackTree{left, right, parent, val, color}
}

func (t *RedBlackTree) printTree(s string, dapath int) {

	d := dapath + 1
	if t == nil {
		return
	}

	fmt.Println(s)
	fmt.Println(t.val)
	t.leftNode.printTree("/", d)
	t.rightNode.printTree("\\", d)

	g
}
