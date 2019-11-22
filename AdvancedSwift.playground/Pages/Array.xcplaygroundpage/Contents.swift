//: [Previous](@previous)

import Foundation
print("Hello")

struct Array2D<Element>:BidirectionalCollection,MutableCollection{
    
    let width, height:Int

    typealias Index = Array2DIndex
    private var storage:[Element]
    
    struct Array2DIndex:Comparable {
        private (set) var x , y : Int
        static func <(lhs:Array2DIndex, rhs:Array2DIndex)-> Bool{
            return lhs.y > rhs.y || (lhs.y == rhs.y && lhs.x > rhs.x)
        }
    }
    
    var startIndex: Index{
        return Array2DIndex(x: 0, y: 0)
    }
    
    var endIndex:Index{
        return Array2DIndex(x: 0, y: height)
    }
    
    func index(before i:Index) -> Index {
        if i.x > 0 {
            return Array2DIndex(x: i.x - 1, y: i.y)
        }
        precondition(i.y > 0)
        return Array2DIndex(x: i.x+1, y: i.y)
    }
    
    
    
    func index(after i: Index) -> Index {
        if i.x < width - 1{
            return Index(x: i.x + 1, y: i.y)
        }
        return Index(x: 0, y: i.y + 1)
    }
    
    init(width:Int, height:Int, repeating value:Element) {
        self.width = width
        self.height = height
        storage = Array(repeating: value, count:width*height)
    }
    
    subscript(x x:Int, y y:Int)->Element{
        get{
            return self[Index(x: x, y: y)]
        }
        set{
            self[Index(x: x, y: y)] = newValue
        }
    }
    
    func inBound(index:Index) -> Bool{
        return (0...width).contains(index.x) && (0...height).contains(index.y)
        
    }
    
    subscript(index:Index) -> Element{
        get{
            precondition(inBound(index: index), "Out of Bounds")
            return storage[index.y*width + index.x]
        }
        set{
            storage[index.x*width + index.y] = newValue
        }
    }
}

extension Array2D{
    func row(y:Int) -> AnySequence<Element>{
        var index = Array2DIndex(x: 0, y: y)
        return AnySequence<Element>{
            AnyIterator{
                guard index.x < self.width else {return nil}
                
                defer{index.x + 1}
                return self[index]
            }
        }
    }
    
    func row(x:Int) -> AnySequence<Element>{
        var index = Array2DIndex(x: x, y: 0)
        return AnySequence<Element>{
            AnyIterator{
                guard index.y < self.height else {return nil}
                
                defer{index.y + 1}
                return self[index]
            }
        }
    }
}

let array = Array2D(width: 4, height: 6, repeating: 100)

print(array)
