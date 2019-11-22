//: [Previous](@previous)

import Foundation


let random = Array(1...15).shuffled()

let evens = random.lazy.filter {$0.isMultiple(of: 2)}
print(type(of: evens))
print(evens)

let threePlus1 = evens.map{$0 + 1}.prefix(3)
print(type(of: threePlus1))
threePlus1.forEach{print($0)}

struct FizzBuzz:RandomAccessCollection{
    private let Fizz = "Fizz"
    private let Buzz = "Buzz"
    private let FizzBuzz = "FizzBuzz"
    typealias Index = Int
    
    let range:ClosedRange<Int>
    var startIndex: Int{
        return range.lowerBound
    }
    
    var endIndex: Int{
        return range.upperBound
    }
    
    
//    func index(after i: Int) -> Int {
//        print("Increment in index:after", i + 1)
//        return i + 1
//    }
//
//    func index(before i: Int) -> Int {
//        return i - 1
//    }
    
    subscript(position: Int) -> String {
        precondition(indices.contains(position), "Out of Range")
        
        switch(position.isMultiple(of: 3), position.isMultiple(of: 5)){
        case (false, false):
            return String(describing: position)
        case (true,false):
            return Fizz
        case (false, true):
            return Buzz
        case (true,true):
            return FizzBuzz
        }
    }
}


//for value in FizzBuzz().reversed().prefix(5){
//    print(value)
//}


for val in FizzBuzz(range: 30...245).prefix(40){
    print(val)
}
