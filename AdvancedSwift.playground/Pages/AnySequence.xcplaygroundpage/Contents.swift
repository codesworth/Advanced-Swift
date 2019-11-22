//: [Previous](@previous)

import Foundation


func infiniteSequence(value:Int)-> UnfoldSequence<Int,(Int?, Bool)>{
    return sequence(first: value) {_ in return value}
}

func infinite(value:Int) -> AnySequence<Int>{
    return AnySequence{
        return sequence(first: value){_ in return value}
    }
}


func infinite(val:Int)->AnySequence<Int>{
    return AnySequence<Int>{AnyIterator<Int>{val}}
}

let elements = ["A", "B", "C", "D"]

for (index,first) in elements.enumerated(){
    for second in elements.dropFirst(index + 1){
        print(first, second)
    }
}

public extension Collection{
    func pairs()-> AnySequence<(Element,Element)>{
        guard var index1 = index(startIndex, offsetBy: 0, limitedBy: endIndex), var index2 = index(startIndex, offsetBy: 1, limitedBy: endIndex) else{
            return AnySequence{EmptyCollection.Iterator()}
        }
        
        return AnySequence{
            AnyIterator{
                if index1 >= self.endIndex || index2 >= self.endIndex{return nil}
                defer{
                    index2 = self.index(after: index2)
                    if index2 >= self.endIndex{
                        index1 = self.index(after: index1)
                        index2 = self.index(after: index1)
                    }
                    
                }
                return (self[index1], self[index2])
            }
        }
    }
}

print("________")

for (first, second) in elements.pairs(){
    print(first, second)
}
