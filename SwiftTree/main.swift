//
//  main.swift
//  SwiftTree
//
//  Created by 김소은 on 2021/01/06.
//

import Foundation


class Node<T: Comparable> {
    var data: T
    var left: Node?
    var right: Node?
    
    init(data: T) {
        self.data = data
    }
}


class BinarySearchTree<T: Comparable> {
    var root: Node<T>?
    
    func insert(_ data: T) {
        guard let root = self.root else {
            return self.root = Node.init(data: data)
        }
        
        var currentNode = root
        while true {
            if currentNode.data > data {
                guard let nextNode = currentNode.left else {
                    return currentNode.left = Node.init(data: data)
                }
                currentNode = nextNode
            } else {
                guard let nextNode = currentNode.right else {
                    return currentNode.right = Node.init(data: data)
                }
                currentNode = nextNode
            }
        }
    }
    
    func search(from data: T) -> Bool {
        if root == nil { return false }
        
        var currentNode = root
        while let node = currentNode {
            if node.data == data {
                return true
            }
            if node.data > data {
                currentNode = node.left
            } else {
                currentNode = node.right
            }
        }
        return false
    }
    
    func drawDiagram() {
        print(diagram(for: self.root))
    }

    private func diagram(for node: Node<T>?,
                         _ top: String = "",
                         _ root: String = "",
                         _ bottom: String = "") -> String {
        guard let node = node else {
            return root + "nil\n"
        }
        if node.left == nil && node.right == nil {
            return root + "\(node.data)\n"
        }
        return diagram(for: node.right, top + " ", top + "┌──", top + "│ ")
            + root + "\(node.data)\n"
            + diagram(for: node.left, bottom + "│ ", bottom + "└──", bottom + " ")
    }
}

let BST = BinarySearchTree<Int>()
BST.insert(20)
BST.insert(15)
BST.insert(30)
BST.insert(12)
BST.insert(16)
BST.insert(35)
BST.insert(37)

BST.drawDiagram()

print(BST.search(from: 20))
print(BST.search(from: 15))
print(BST.search(from: 12))
print(BST.search(from: 60))
print(BST.search(from: 0))
print(BST.search(from: 100))


