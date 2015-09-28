//: Playground - noun: a place where people can play

import UIKit

//: # Swift2.0's ErrorHandling**

//: #### 自定义的错误类型 声明成enum, 并且遵从ErrorType协议; 利用枚举的关联值可以获取更多关于错误的信息
enum MYErrorType: ErrorType {
    case DataWrong
    case TimeWrong
    case OtherWrong(code: Int)
}

/*: #### 在指定条件下 使用throw 关键字 + Error类型 ,其函数名括号后追加 throws关键字,表示调用该函数时必须使用try来错误处理*/

var wrongType = 0
func doSomething () throws {

    if wrongType == 1 {
        throw MYErrorType.DataWrong
    }
    
    if wrongType == 2 {
        throw MYErrorType.OtherWrong(code: 404)
    }
    
    print("done")

}

//: **对于含throws关键字的声明的函数在调用时必须要有try关键字, 可以在try后加!,表示不throw错误,常用于初始化时,明确知道不会出现Error的情况下使用**

//doSomething() // 编译不通过
try! doSomething()

/*: #### do代码块中 对可能throw的函数 使用try 关键字,抛Error时try后面的语句将不会执行; Error处理使用 catch 关键字,后面紧跟错误类型,执行错误处理代码快*/
do {
    try doSomething()
    
} catch MYErrorType.OtherWrong(let code) {
    print("other wrong with code: \(code)")
}
