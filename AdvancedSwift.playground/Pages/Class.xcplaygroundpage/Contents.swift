import Foundation

class Distribution{
    
    func sample() -> Double{
        
        fatalError("Must be overriden")
    }
    
    func sample(count:Int)-> [Double]{
        return (1...count).map{_ in sample()}
    }
}


class UniformDistribution:Distribution{
    
    var range:ClosedRange<Int>
    
    init(range:ClosedRange<Int>) {
        self.range = range
    }
    
    override func sample() -> Double {
        return Double(Int.random(in: range))
    }
}

let d20 = UniformDistribution(range: 1...20)

d20.sample(count: 10)


class GeometryBase{
    
    func area()->Double{
        fatalError("Must overrride")
    }
}

extension GeometryBase{
    
    @objc func perimeter()->Double{
        fatalError("Derived class must implement")
    }
}


class DrawableBase:NSObject{
    
    func draw(){
        fatalError("Derived class must implement")
    }
}
