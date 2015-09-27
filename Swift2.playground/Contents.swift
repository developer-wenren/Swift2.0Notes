//: #Playground - noun: a place where people can play
import UIKit

//:# Swift2.0 BaseOne
var sayHi = "Hello, Swift2.0"
//: ##### 元组可以通过索引序号进行访问,基于索引可以通过指定的名字访问让元组可读
var me = ("wrcj", 23, 55.5)
print("My name is \(me.0), age is \(me.1), weigh \(me.2)")
var he = (name: "haha", age: 35, weigh: 60.1)
print("He name is \(he.name), age is \(he.age), weigh \(he.weigh)")

//: ##### repeat循环的使用,只要while的条件为ture就重复
var count = 1
repeat {
    count++
} while count < 10

//: ##### 结合Swift的外部参数,书写高可读性的方法名
func calcuateTotalCostWithBill(bill: Int, withTips tips: Int) -> Int {
    return bill + tips
}
calcuateTotalCostWithBill(20, withTips: 4)

//: ##### 取出的Dictionary的value 是 Optional类型,防止使用不存在的键取值;遍历字典是可以考虑使用元组将key和value一起遍历出来
var info = ["name": "wrcj", "age": 23, "weigh": 55.5]
var name = info["name"]
print(name)
for (key, value) in info {
    print("\(key): \(value)")
}

//: #### let声明 结构体时,结构体内部所有属性(即使内部用var声明)都不可变
struct Computer {
    let cpu: String
    let capacity: String
    var memory: String
}
let mac = Computer(cpu: "i5", capacity: "SSD128G", memory: "8G")
//mac.memory = "16G"    
//error: cannot assign to property: 'mac' is a 'let' constant

//: #### 枚举里只能存在计算属性,常常与Switch结合使用
enum Season {
    case Spring
    case Summer(tempertaure: String?)
    case Fall
    case Winter(tempertaure: String?)

    var description: String {
        switch self {
        case .Spring:
            return "current season is Spring"
        case .Summer(let temp):
            guard let temp2 = temp else {  return "current season is summer" }
            return "current season is summer's tempertaure:\(temp2)C"
        case .Fall:
            return "current season is Fall"
        case .Winter(let temp):
            guard let temp2 = temp else {  return "current season is winter" }
            return "current season is winter tempertaure:\(temp2)C"
        }
    }
}
var summer: Season = .Summer(tempertaure: "33")
summer.description

//: #### guard语法来可选类型进行unwrap处理,结合else 需要返回nil情况必要的值或者错误提醒
var money: Double? = nil
func getMoney() -> String? {
    guard let money = money else {
        return "there is no money"
    }
    return "you got it $\(money)"
}
getMoney()















