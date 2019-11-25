//: [Previous](@previous)

import Foundation

MemoryLayout<Int>.size
MemoryLayout<Int>.alignment
MemoryLayout<Int>.stride


MemoryLayout<Int16>.size
MemoryLayout<Int16>.alignment
MemoryLayout<Int16>.stride


MemoryLayout<Bool>.size
MemoryLayout<Bool>.alignment
MemoryLayout<Bool>.stride

MemoryLayout<Float>.size
MemoryLayout<Float>.alignment
MemoryLayout<Float>.stride

MemoryLayout<Double>.size
MemoryLayout<Double>.alignment
MemoryLayout<Double>.stride

let zero = 0.09

MemoryLayout.size(ofValue: zero)

struct SampleStruct{
    var number:UInt32
    var flag:Bool
}

MemoryLayout<SampleStruct>.size
MemoryLayout<SampleStruct>.alignment
MemoryLayout<SampleStruct>.stride
MemoryLayout.offset(of: \SampleStruct.flag)

let stride = MemoryLayout<Int>.stride
let alignment = MemoryLayout<Int>.alignment
let count = 2

let byteCount = stride * count

let pointer = UnsafeMutableRawPointer.allocate(byteCount: byteCount, alignment: alignment)

defer {
    pointer.deallocate()
}

pointer.storeBytes(of: 0b111111111111, as: Int.self)
pointer.advanced(by: stride).storeBytes(of: 6, as: Int.self)

pointer.load(as: Int.self)
(pointer+stride).load(as: Int.self)

let bufferPointer = UnsafeRawBufferPointer(start: pointer, count: byteCount)

for (offset, byte) in bufferPointer.enumerated(){
    print("Byte: \(byte) offset:\(offset)")
}


