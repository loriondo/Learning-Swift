// Playground - noun: a place where people can play

import UIKit

//protocol declaration
protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}
/* ------------------------------------ */

//classes, enums, and structs can adopt protocols
//similar to a Java interface 

//remember, classes are pass by reference
class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "Simple class implenting a protocol."
    var property: Int = 1
    
    //must override function defined in protocol
    func adjust() {
        simpleDescription += " Now 100% adjusted."
    }
    
    //function must return the same type, otherwise will not
    //satisfy the protocol
    func adjust() -> Int {
        return 27
    }
}

//structures are pass by value
struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "Simple structure with a protocol."
    var property: Int = 1
    
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
    
    /*func normalAdjust() {
        simpleDescription = " Now 100% adjusted."
    }*/ //structs must have mutating funcs to modify the structure
}

//enums are a bit different, need an extra method to implement the protocol
enum SimpleEnum: ExampleProtocol {
    case Base, Adjusted
    
    var simpleDescription: String { get {
        return self.getDescription()
        }
    }
    
    func getDescription() -> String {
        switch (self) {
        case Base:
            return "Simple enumeration implementing a protocol."
        case Adjusted:
            return "No"
        }
    }
    
    mutating func adjust() { //see comment above in SimpleStructure
        self = SimpleEnum.Adjusted
    }
}
/* ------------------------------------ */

//practice wiih protocols
protocol Shape {
    var color: String { get }
    var shape: String { get }
    
    mutating func simpleDescription()->String
}

class SimpleShape: Shape {
    var color: String
    var shape: String
    
    init(color: String, shape: String){
        self.color = color
        self.shape = shape
    }
    
    func simpleDescription() -> String {
        return "This \(shape) is the color \(color)."
    }
}

enum ShapeEnum: Shape {
    case Square, Triangle, Circle
    
    var color: String { get {
            return self.getColor()
        }
    }
    
    var shape: String { get {
            return self.getShape()
        }
    }
    
    func getShape() -> String {
        switch (self) {
        case Square:
            return "square"
        case Triangle:
            return "triangle"
        case Circle:
            return "circle"
        }
    }
    
    func getColor() -> String {
       return "blue"
    }
    
    mutating func simpleDescription() -> String {
        return "This \(shape) is the color \(color)."
    }
}
/* ------------------------------------ */

//extensions, add functionality (such as prototype conformance) to existing type 
extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number is \(self)"
    }
    
    mutating func adjust() {
        self += 10
    }
}
var two: Int = 2
two.simpleDescription //we have added functionality to an existing type! cool stuff
two.adjust()
two.simpleDescription

//practice
extension Double {
    var simpleDescription: String {
        return "The number is \(self)"
    }
    
    mutating func abs () -> Double {
        if(self < 0){
            return self * -1
        }else{
            return self
        }
    }
    
    mutating func floor() -> Double {
        var a: Int = Int(self)
        var b: Double = Double(a)
        return b
    }
    
    mutating func cieling() -> Double {
        var a: Int = Int(self + 1)
        var b: Double = Double(a)
        return b
    }
    
}
var d: Double = 2.2
d.floor()
d.abs()
d.cieling()
/* ------------------------------------ */

//can use protocol name like type, make collection of different types of objects that conform to a protocol
var a = SimpleClass()
var protocolValue: ExampleProtocol = a
protocolValue.simpleDescription
//protocolValue.anotherProperty() //error here, not defined
var b = SimpleStructure()
protocolValue = b //the var protocolValue can take any object that uses the protocol
protocolValue.simpleDescription

var c = "Hi"
//protocolValue = c //this doesn't work since String does not follow the protocol we defined
/* ------------------------------------ */
