//: [Previous](@previous)

import Foundation

final class Unowned<T:AnyObject>{
    unowned let value:T
    
    init(_ value:T) {
        self.value = value
    }
}

do{
    
    CelestialBody("Trent")
    //CelestialBody("Maryn")
}


class Star:CelestialBody{
    var planets:[Unowned<Planet>]
    
    
    init(_ name:String, planets:[Planet]) {
        self.planets = planets.map{Unowned<Planet>($0)}
        super.init(name)
        
        self.planets.forEach{$0.value.system = self}
    }
}


class Planet:CelestialBody{
    
    //weak var  system:Star?
    var system:Star?
    
    
     
}


do{let names = ["Mercury", "Venus", "Mars", "Jupiter"]

let planets = names.map{Planet($0)}

let sun = Star("Sun", planets: planets)
 print(sun)}



