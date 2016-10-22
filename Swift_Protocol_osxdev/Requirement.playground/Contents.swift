//: Playground - noun: a place where people can play

import UIKit

protocol SomeProtocol {
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int { get }
}

// 흠 문제는 없어보입니다!
class ImplementSomeProtocol: SomeProtocol {
    internal var mustBeSettable: Int = 0
    internal var doesNotNeedToBeSettable: Int = 0
}

// 호기심 발동!
// Settable하지 않게 만들면 어떻게 될까요?
//class DoseNotFollowRequirements: SomeProtocol {
//    private(set) internal var mustBeSettable: Int = 0
//    
//    
//    private(set) internal var doesNotNeedToBeSettable: Int = 0
//}

// static property를 가지는게 조건이네요
protocol AnotherProtocol {
    static var someTypeProperty: Int { get set }
}

class FollowStaticPropertyRequirement: AnotherProtocol {
    internal var someTypeProperty: Int = 0
    
    //    internal static var someTypeProperty: Int = 0
}