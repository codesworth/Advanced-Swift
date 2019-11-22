//: [Previous](@previous)

import Foundation


var value = 0

let show = {
    print(value)
}

show()

value = 10

show()

let show2 = { [value] in
    print(value)
}

value = 11

show2()

class Cat{
    
    func speak(){
        print("Meoww")
    }
}
