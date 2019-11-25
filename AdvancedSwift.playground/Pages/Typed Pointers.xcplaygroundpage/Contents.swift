//: [Previous](@previous)

import Foundation


let count = 2

let pointer = UnsafeMutablePointer<Int>.allocate(capacity: count)

pointer.initialize(repeating: 0, count: count)

defer{
    pointer.deinitialize(count: count)
    pointer.deallocate()
}


pointer.pointee = 0b111111111111
pointer.advanced(by: 1).pointee = 6

pointer.pointee
(pointer+1).pointee

let bufferPointer = UnsafeBufferPointer.init(start: pointer, count: count)

for (offset, byte) in bufferPointer.enumerated(){
    print("Byte: \(byte) offset:\(offset)")
}


//Convert Raw To Typed

let stride = MemoryLayout<Int>.stride
let alignment = MemoryLayout<Int>.alignment

let byteCount = stride * count

let rawPointer = UnsafeMutableRawPointer.allocate(byteCount: byteCount, alignment: alignment)

defer{
    rawPointer.deallocate()
}

let typedPointer = rawPointer.bindMemory(to: Int.self, capacity: count)

typedPointer.initialize(repeating: 0, count: count)

defer{
    typedPointer.deinitialize(count: count)
}



//Getting Bytes

struct SampleStruct{
    let number:Int32
    let flag:Bool
}


var sample = SampleStruct(number: 25, flag: true)

withUnsafeBytes(of: &sample) { bytes  in
    for byte in bytes{
        print(byte)
    }
}


let checksum = withUnsafeBytes(of: &sample) { bytes -> UInt32 in
    return ~bytes.reduce(0, { $0 + numericCast($1)})
}

print(checksum)
