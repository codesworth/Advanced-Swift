//: [Previous](@previous)

import Foundation


enum Result<Success, Failure:Error>{
    case success(Success)
    case failure(Failure)
    
    func get()throws -> Success{
        switch self {
        case .success(let x):
            return x
        case .failure(let err):
            throw err
        }
    }
    
    func map<NewSuccess>(_ transform:(Success) -> (NewSuccess)) -> Result<NewSuccess, Failure>{
        switch self {
        case .success(let success):
            return .success(transform(success))
        case .failure(let err):
            return .failure(err)
        }
    }
}


enum MathError:Error{
    case divisionByZero
}

func divide(_ a:Double, _ b:Double) -> Result<Double,MathError> {
    guard b != 0 else{
        return .failure(MathError.divisionByZero)
    }
    
    return .success(a / b)
}
divide(10, 0)
 divide(10, 2)


