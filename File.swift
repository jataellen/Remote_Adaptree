//
//  File.swift
//  AdapTree2
//
//  Created by Jata MacCabe on 2018-11-22.
//  Copyright © 2018 swilso12. All rights reserved.
//

import Foundation
//---------------------
// This file is a mess, I know.
// but this is all the code
//for the quiz
//  @J-Money
//----------------------






//----------------------------------
//This is my Linked List class.
//--------------------------------



public class LinkedList<T> {
    fileprivate var head: Node<T>?
    public var tail: Node<T>?
    
    public var isEmpty: Bool {
        return head == nil
    }
    public var first: Node<T>? {
        return head
    }
    
    public func append(value: T) {
        let newNode = Node(value: value)
        if let tailNode = tail {
            newNode.previous = tailNode
            tailNode.next = newNode
        } else {
            head = newNode
        }
        tail = newNode
    }
    
    public var last: Node<T>? {
        return tail
    }
    
    public func nodeAt(index: Int) -> Node<T>? {
        // 1
        if index >= 0 {
            var node = head
            var i = index
            // 2
            while node != nil {
                if i == 0 { return node }
                i -= 1
                node = node!.next
            }
        }
        // 3
        return nil
    }
}



//----------------------------------
//This is my Node class.
//--------------------------------



public class Node<T> {
    
    public var value: T
    
    init(value: T) {
        self.value = value
    }
    
    var next: Node?
    
    weak var previous: Node?
    
}




//-------------------------------
//This is my quiz class
//-----------------------


public class Quiz{
    
    public var newList = LinkedList<Int>()
    public var count = 0
    private var test = true
    
    
    init(value: LinkedList<Int>) {
        self.newList = value
    }
    
    public func register(value: Int){
        newList.append(value: value)
        count = count + 1
    }
    
    public func back(value: Int){
        count = count - 1
        newList.tail = newList.nodeAt(index: count)
        
    }
    
    public func equals(value: Quiz) -> Bool{
        test = true
        let tempNode = newList.first
        
        let  tempNode2 = value.newList.first
        while ((tempNode?.next) != nil) {
            if tempNode?.value != tempNode2?.value {
                test = false
            }
        }
        if ((tempNode2?.next) != nil) {
            test = false
        }
        return test
    }
}


//-------------------------------
//This is my MyStands class
//
//This will hold an array of Quizzes
//-----------------------


public class MyStands{
    
    public var List = [Quiz]()
    private var count = 0
    private var temp = [Quiz]()
    private var tempC = 0
    private var test = true
    private var name = ""
    
    init(value: Quiz, value2: String) {
        List = [Quiz]()
        name = value2
        self.List.append(value)
    }
    
    public func add(value: Quiz){
        List.append(value)
        count = count + 1
    }
    
    public func delete(value: Quiz){
        tempC = 0
        for _ in List {
            if List[tempC].equals(value: value) {
                break
            }
            tempC = tempC+1
        }
        if List[tempC].equals(value: value) {
            List.remove(at: tempC)
            count = count - 1
        }
    }
    public func equals(value: MyStands) -> Bool{
        test = true
        let cursor = 0
        while (cursor < count) {
            if !(List[cursor].equals(value: value.List[cursor])) {
                test = false
            }
        }
        if (count != value.count) {
            test = false
        }
        return test
    }
    
}

//-------------------------------
//This is my MyForest class
//
//This will hold an array of Stands
//-----------------------

public class MyForest{
    
    public var sList = [MyStands]()
    private var scount = 0
    private var stemp = [MyStands]()
    private var stempC = 0
    private var sname = ""
    
    public func add(value: MyStands, value2: String){
        sList.append(value)
        sname = value2
        scount = scount + 1
    }
    
    public func delete(value: MyStands){
        stempC = 0
        for _ in sList {
            if sList[stempC].equals(value: value) {
                break
            }
            stempC = stempC+1
        }
        if sList[stempC].equals(value: value) {
            sList.remove(at: stempC)
            scount = scount - 1
        }
    }
}
//------------------------

//The Questions class is to string the questions

//----------------------
public class Questions{
    
    private var name = "Empty"
    private var A1 = "Empty"
    private var A2 = "Empty"
    private var A3 = "Empty"
    private var A4 = "Empty"
    
    init(Name: String, A11: String, A22: String, A33: String, A44: String) {
        name=Name
        A1=A11
        A2=A22
        A3=A33
        A4=A44
    }
    
    public func change(Name: String, A11: String, A22: String, A33: String, A44: String){
        name=Name
        A1=A11
        A2=A22
        A3=A33
        A4=A44
        
    }
    
    public func getName() -> String{
        return name
    }
    
    public func getA1() -> String{
        return A1
    }
    
    public func getA2() -> String{
        return A2
    }
    
    public func getA3() -> String{
        return A3
    }
    
    public func getA4() -> String{
        return A4
    }
    
}

