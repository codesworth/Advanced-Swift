

import Foundation


let array = Array(0...99)

let all = array[...]
let some = array[30...]

func computeSum<S:Sequence>(value:S)->S.Element where S.Element:Numeric{
    
    return value.reduce(0) { $0 + $1}
}

computeSum(value: some)

var hello = "Hello, 🌍"

if let range = hello.range(of: "🌍"){
    hello.replaceSubrange(range, with: "🌞!!!")
}

print(hello)

