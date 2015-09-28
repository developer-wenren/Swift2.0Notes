//: Playground - noun: a place where people can play

import UIKit

//: ** defer关键字下的代码块会在函数域结束前的末尾执行, 先会存放在临时的Defer Stack中,按照后进先出执行代码;defer下的代码主要用来实现清理功能; 与ErrorHandling配合使用时,通常放置于函数里面的较前处**
func readMessage () {
    print("start reading")
    defer {
        print("end reading ")
    }
    
    print("write something")
    
    defer {
        print("continue to read")
    }
}
readMessage()
/*
start reading
write something
continue to read
end reading
*/

//: **guard语句,用于获取你想要的数据,然后继续执行, else处理你不想要的情况; guard let 使用可选绑定时,else处理nil的情况; guard语句的else处出直接返回或做错误抛出**
var age = 22
func getAge() {
    
    // age大于10继续执行
    guard age > 10 else {
        return
    }
    
    // age不大于10执行返回
    if age <= 10 {
        return
    }
    
    print("My age is \(age)")
}
getAge()


