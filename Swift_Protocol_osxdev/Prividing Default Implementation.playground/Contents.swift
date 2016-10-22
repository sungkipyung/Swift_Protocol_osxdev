//: Playground - noun: a place where people can play

import UIKit

//protocol TextRepresentable {
//    var textualDescription: String { get }
//}

protocol PrettyTextRepresentable: TextRepresentable {
    var prettyTextualDescription: String { get }
}

extension PrettyTextRepresentable {
    var prettyTextualDescription: String {
        return textualDescription
    }
}

protocol TextRepresentable {
    var textualDescription: String { get }
}

extension Collection where Iterator.Element: TextRepresentable {
    var textualDescription: String {
        let itemsAsText = self.map { $0.textualDescription }
        return "[" + itemsAsText.joined(separator: ", ") + "]"
    }
}

class Person: TextRepresentable {
    internal var textualDescription: String {
        return "My name is \(name)"
    }

    var name: String
    
    init(name: String) {
        self.name = name
    }
}

var peoples: [Person] = [Person(name: "Tom"), Person(name: "Bob")]
//var peoples: [TextRepresentable] = [Person(name: "Tom"), Person(name: "Bob")]
let result = peoples.textualDescription
print(result)
// "[My name is Tom, My name is Bob]"