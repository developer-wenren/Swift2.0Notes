//: Playground - noun: a place where people can play

import UIKit

//: # Swfit2.0BaseTow

//: ####属性Observer
//: 属性Observer: 使得对属性赋值时,允许在赋值前和赋值后做额外的操作
//: 自动在willSet传入newValue变量,在didSet传入oldValue变量,也自定义变量名
struct Person {
    var name: String {
        willSet {
            print("doSomethingBeforeSet \(newValue)")
        }
        
        didSet(originalName) {
            
            print("doSomethingAfterSet \(originalName)")
        }
    }
}
//: 初始化时不会触发 属性Observer
var me = Person(name: "wrc")
me.name = "wrcj"

//: #### 计算属性: 只有get方法,不存储值,通过计算或者直接返回值
struct Man {
    var name: String
    var age: Int {
        get {
           return 12
        }
    }
    var description: String {
        return "I am man named \(name)"
    }
}

var child = Man(name: "wrcj")
child.age
child.description
//: #### 闭包: 基本写法为 { (参数1:类型, 参数2:类型) -> 返回类型 in return 返回参数 }
//: 函数也是闭包,属于有名字的闭包;
var closure = { (a: Int, b: Int) -> Int in
    return a * b
}
closure(2, 3)
//: 闭包作为参数传入
func caculateTowNums(num1: Int, num2: Int, operation: ((Int, Int) -> Int)){
    let result = operation(num1, num2)
    print(result)
}
caculateTowNums(2, num2: 4, operation: closure)

//: 闭包作为返回值传出
func getClosure() -> ((Int, Int) -> Int){
    
    let closure = { (a: Int, b: Int) -> Int in
        return a * b
    }
    
    return closure
    
}
