//: Playground - noun: a place where people can play

import UIKit

protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy:m))
        return lastRandom / m
    }
}
let generator = LinearCongruentialGenerator()
print("Here's a random number: \(generator.random())")
// Prints "Here's a random number: 0.37464991998171"
print("And another one: \(generator.random())")
// Prints "And another one: 0.729023776863283"



protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case off, on
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}
var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()
// lightSwitch is now equal to .on

//
//protocol SomeProtocol {
//    init(someParameter: Int)
//}
//
//class SomeClass: SomeProtocol {
//    // initializer는 required가 필요합니다.
//    required init(someParameter: Int) {
//        // initializer implementation goes here
//    }
//}
//
protocol SomeProtocol {
    func someFunction()
    init()
}

class SomeSuperClass {
    func someFunction() {
        print("someFunction called")
    }
    
    init() {
        
    }
}

class SomeSubClass: SomeSuperClass, SomeProtocol {
    // someFunction은 오류가 발생하지 않습니다.
    // 하지만 initializer는 오류가 발생하는데
    // 문맥적으로 해석하면
    // initializer를 Protocol에 선언하면 override를 요구하는 것입니다.
    
    override required init() {
        
    }
}


protocol FailableInitializer {
    init?(initFail: Bool)
}

class SomeFailableInitClass: FailableInitializer {
//    required init(initFail: Bool) {
//        if initFail {
//            return nil
//        }
//    }
    required init?(initFail: Bool) {
        if initFail {
            print("init failed")
            return nil
        }
    }
    var text = "SomeText"
}

var optionalObj = SomeFailableInitClass(initFail: true)
optionalObj?.text
//optionalObj.text

