import Foundation



protocol Distribution {
    associatedtype Value
    func sample() -> Value
    func sample(count:Int) -> [Value]
}

extension Distribution{

    func sample(count:Int) -> [Value]{
        return (1...count).map{_ in sample()}
    }
}


struct UniformDistribution:Distribution{
    
    
    
    typealias Value = Int
    var range:ClosedRange<Int>
    
    init(range:ClosedRange<Int>) {
        self.range = range
    }
    
    func sample() -> Int {
        return Int.random(in: range)
    }
}

let d20 = UniformDistribution(range: 1...10)

d20.sample(count: 100)
let times = d20.sample(count: 1000).reduce(0) { result, nxt -> Int in
    if nxt == 10{
        return result + 1
    }
    return result + 0
}


struct NormalDistribution:Distribution{
    typealias Value = Double
    
    var mean, stdDev:Double
    
    private func generateRandomuniforms()-> (Double,Double){
        let u1 = Double.random(in: Double.leastNormalMagnitude..<1.0)
        let u2 = Double.random(in: Double.leastNormalMagnitude..<1.0)
        
        return (u1,u2)
    }
    
    func sample() -> Double {
        let (u1,u2) = generateRandomuniforms()
        let z0 = (-2.0 * log(u1)).squareRoot() * cos(2 * .pi * u2)
        return z0 + stdDev + mean
    }
    
    func sample(count: Int) -> [Double] {
        precondition(count > 0, "Count must be greater than 0")
        var results:[Double] = []
        results.reserveCapacity(count)
        for _ in 1...count / 2{
            let (u1,u2) = generateRandomuniforms()
            let z0 = (-2.0 * log(u1)).squareRoot() * cos(2 * .pi * u2)
            let z1 = (-2.0 * log(u1)).squareRoot() * cos(2 * .pi * u2)
            results.append(z0 + stdDev + mean)
            results.append(z1 + stdDev + mean)
        }
        
        if count % 2 == 1{
            results.append(sample())
        }
        
        return results
    }
}


let iq = NormalDistribution(mean: 100, stdDev: 15)
iq.sample(count: 100)
