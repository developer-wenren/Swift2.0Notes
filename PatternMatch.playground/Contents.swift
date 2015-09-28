//: Playground - noun: a place where people can play

import UIKit


//: # Swift2.0的模式匹配
//: Where 用法 基本使用来条件限定
var num: Int? = 8
func getNum() -> Int {
    guard let num = num where num < 10 else {
        return -1 // 对大于10的数字 输出 -1
    }
    
    return num
    
}
getNum()

//: for与case结合,遍历对限定where条件的变量直接进行操作,省略switch样式的代码
let nums = [1,3,12,4,44,55,19]
for case let num in nums where num < 10 {
    print(num)
}
//: if与case 结合, 再用where进行额外条件限定
if case let num2 =  nums[5] where num2 >= 10 {
    print(num2) 
}
//: 还可以针对枚举类型变量的模式匹配,获取关联值,进行额外判断和操作
enum Job {
    case Teacher(time: Int)
    case Cooker(time: Int)
    case Programer(time: Int)
}

let myJob:Job = Job.Programer(time: 2)
if case let .Programer(time) = myJob  where time > 1 {
    print("we need Programer's time > 1 like you")
} else {
    print("you dont have engouch time for Programer")
}
