//: Playground - noun: a place where people can play

import UIKit

//protocol CounterDataSource {
//    optional func increment(forCount count: Int) -> Int
//    optional var fixedIncrement: Int { get }
//}

//protocol CounterDataSource {
//    optional func increment(forCount count: Int) -> Int
//    optional var fixedIncrement: Int { get }
//}

//protocol CounterDataSource {
//    @objc optional func increment(forCount count: Int) -> Int
//    @objc optional var fixedIncrement: Int { get }
//}

@objc protocol CounterDataSource {
    @objc optional func increment(forCount count: Int) -> Int
    @objc optional var fixedIncrement: Int { get }
}

class Counter {
    var count = 0
    var dataSource: CounterDataSource?
    
    func increment() {
        // increment? 는 Optional chaining이 적용된 것을 볼 수 있습니다.
        // increment protocol은 optional method 거든요
        
        if let amount = dataSource?.increment?(forCount: count) {
            count += amount
        } else if let amount = dataSource?.fixedIncrement {
            count += amount
        }
    }
}

//class ThreeSource: NSObject, CounterDataSource {
//    let fixedIncrement = 3
//    // increment() was implemented
//}

class ThreeSource: CounterDataSource {
    let fixedIncrement = 3
    // increment() was implemented
}

var counter = Counter()
counter.dataSource = ThreeSource()
for _ in 1...4 {
    counter.increment()
    print(counter.count)
}
// 3
// 6
// 9
// 12


//class TowardsZeroSource: CounterDataSource {
@objc class TowardsZeroSource: NSObject, CounterDataSource {
    @objc func increment(forCount count: Int) -> Int {
        if count == 0 {
            return 0
        } else if count < 0 {
            return 1
        } else {
            return -1
        }
    }
}

counter.count = -4
counter.dataSource = TowardsZeroSource()
for _ in 1...5 {
    counter.increment()
    print(counter.count)
}

//TowardsZeroSource().perform(#selector(<#T##@objc method#>)
