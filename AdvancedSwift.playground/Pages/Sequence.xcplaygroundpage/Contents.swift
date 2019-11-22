

import Foundation


///Sequence basics



struct InfiniteIterator:IteratorProtocol{
    let value:Int
    
    mutating func next() -> Int? {
        return value
    }
}

var iterator = InfiniteIterator(value:5)
iterator.next()
iterator.next()
iterator.next()


struct InfiniteSequence:Sequence{
    let value:Int
    
    func makeIterator() -> InfiniteIterator {
        return InfiniteIterator(value: value)
    }
}

//Get first 5 values in sequence

let infinite = InfiniteSequence(value: 24)

for value in infinite.prefix(5){
    print(value)
}



