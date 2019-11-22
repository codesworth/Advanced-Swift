import Foundation


open class CelestialBody{
    public var name:String
    
    
    public init(_ name:String){
        self.name = name
        print("🐣 Initialized \(name)")
    }
    
    deinit {
        print("💀 Deinitialized \(name)")
    }
}
