//: [Previous](@previous)

import Foundation

struct Pair<Element>{
    
    var first:Element
    var second:Element
}


extension Pair{
    
    var flipped:Pair{
        return Pair(first:second, second:first)
    }
}


extension Pair:Equatable where Element:Equatable{
    
}


extension Pair:Comparable where Element:Comparable{
    static func < (lhs: Pair<Element>, rhs: Pair<Element>) -> Bool {
        return lhs.first < rhs.first
    }
}


protocol Orderable{
    associatedtype Element
    
    func min()->Element
    func max() -> Element
    func sorted() -> Self
}


extension Pair:Orderable where Element:Comparable{
    func min() -> Element {
        return Swift.min(first, second)
    }
    
    func max() -> Element {
        return Swift.max(first, second)
    }
    
    func sorted() -> Pair<Element> {
        return first < second ? self : flipped
    }
    
    
}
