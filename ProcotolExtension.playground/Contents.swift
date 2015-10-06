//: Playground - noun: a place where people can play

import UIKit

//: # Swfit2.0 协议扩展

//: 协议扩展的添加的方法必须要实现,**所有**遵守该协议的对象都能调用.

//: 结构体通过遵守协议,就有类似继承的能力,增加除了自己本身声明的方法, 调用协议扩展出来的方法
//: 可以方便创建可选的协议方法,

protocol Myprotocol {
    var name: String {set get}
    func logMessage()
}
extension Myprotocol  {
    func logMessage2() {
        print("\(name) logMessage2")
    }
}

struct Object: Myprotocol {
    var name = ""
    func logMessage() {
        print("\(name) logMessage")
    }
}
struct Object2: Myprotocol {
    var name = ""
    func logMessage() {
        print("\(name) logMessage")
    }
}

let obj = Object(name: "Object")
obj.logMessage()
obj.logMessage2()
let obj2 = Object2(name: "Object2")
obj2.logMessage()
obj2.logMessage2()

extension Myprotocol {
    func logMessage3() {
        print("\(name) logMessage3")
    }
}
obj.logMessage3()

//: 还可以用where对要扩展的协议对象进一步限定
extension CollectionType where Self.Generator.Element: Comparable {
    
}
