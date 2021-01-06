//
//  main.swift
//  SwiftTree
//
//  Created by 김소은 on 2021/01/06.
//

import Foundation


class Node {
    var data: Int
    var left: Node?
    var right: Node?
    
    init(data: Int) {
        self.data = data
    }
}


class BinarySearchTree {
    var root: Node?
    
    func insert(_ data: Int) {
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
    
    func search(from data: Int) -> Bool {
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
}

let BST = BinarySearchTree.init()
BST.insert(20)
BST.insert(15)
BST.insert(30)
BST.insert(12)
BST.insert(16)
BST.insert(35)
BST.insert(37)


print(BST.search(from: 20))
print(BST.search(from: 15))
print(BST.search(from: 12))
print(BST.search(from: 60))
print(BST.search(from: 0))
print(BST.search(from: 100))

