//: Playground - noun: a place where people can play

import UIKit

//: 程序/游戏有时候存在许多状态变量,需要判断并对相应的状态进行不同的操作:通常使用bool,或者Bitmask来区分不同状态; 在Swift2.0 可以OptionSetType协议对象来包装这种有不同状态的数据,并且用简单明了的协议方法来进行状态变量的增加和删除操作`protocol OptionSetType : SetAlgebraType, RawRepresentable`

//: **通过创建一个Struct,遵守OptionSetType协议,创建表示不同状态的静态变量;但其内部是对Bitmask操作的封装,让开发者更加容易使用状态变量**
struct PlayerState: OptionSetType {
    let rawValue: Int
    static let IDEL = PlayerState(rawValue: 1)
    static let ATTACK = PlayerState(rawValue: 1 << 2)
    static let WALK = PlayerState(rawValue: 1 << 3)
    static let HURT = PlayerState(rawValue: 1 << 4)
    static let DIED = PlayerState(rawValue: 1 << 5)
}

struct Player {
    var state:PlayerState = []
    
    mutating func walk() {
        if !state.contains(.WALK) {
            state.subtractInPlace(state)
            state.unionInPlace(.WALK)
        }
    }
    mutating func attack() {
        if !state.contains(.ATTACK) {
            state.subtractInPlace(state)
            state.unionInPlace(.ATTACK)
        }
    }
    func printState() -> String {
        if state.contains(.WALK) {
            return ("player is walking")
        } else if state.contains(.ATTACK) {
            return ("player is attacking")
        } else if (state.contains(.IDEL)) {
            return ("player do nothing")
        }
        
        return ""
    }
}

var player = Player(state: .IDEL)
player.printState()
player.walk()
player.printState()
player.attack()
player.printState()



