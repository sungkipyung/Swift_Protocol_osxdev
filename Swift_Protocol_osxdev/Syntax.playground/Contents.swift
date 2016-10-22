//: Playground - noun: a place where people can play

import UIKit

// 요렇게 쓰면 됩니다.
protocol SomeProtocol {
    // protocol definition goes here
}


//protocol FirstProtocol {
//    
//}
//
//protocol AnotherProtocol {
//    
//}

// 이렇게 여러개를 한꺼번에 붙일 수 있어요.
struct SomeStructure: FirstProtocol, AnotherProtocol {
    // structure definition goes here
}


protocol FirstProtocol {
    
}

protocol AnotherProtocol {
    
}

class SomeSuperclass {
    
}

// 클래스도 되네요!
class SomeClass: SomeSuperclass, FirstProtocol, AnotherProtocol {
    // class definition goes here
}

// enum 도 됩니다!
enum SomeEnum: FirstProtocol, AnotherProtocol {
    case born, to, study
}

// Protocl도 됩니다.!
protocol NewProtocol: FirstProtocol, AnotherProtocol {
    
}

