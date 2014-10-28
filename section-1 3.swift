// Playground - noun: a place where people can play

import UIKit

//class declaration
class Shape {
    var numberOfSides = 0
    let polygon = true
    var col: String?
    
    init(col: String){
        self.col = col
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    
    func setNumSides(n:Int) {
        numberOfSides = n
    }
    
    func type(condition: String) -> String {
        if (numberOfSides < 2) {
            return "Not a legal shape, but a line."
        }else {
            return "The shape is \(condition)"
        }
    }
    
    func shapeChecker() -> String {
        if(numberOfSides == 3){
            return "Triangle"
        }else if(numberOfSides == 4){
            return "Square"
        }else if(numberOfSides == 5){
            return "Pentagon"
        }else{
            return "Try hard"
        }
    }
    
    func setColor(color: String) {
        col = color
    }
    
    func setColor(color: String, condition: String -> Bool) -> String {
        if(condition(color)){
            return "Color is already \(color), no changes made."
        }else{
            col = color
            return "Color succesfully changed to \(color)."
        }
    }
    
    func isColor(color: String) -> Bool {
        var match = false
        if let hue = col {
            if(hue == color){
                match = true
            }
        }
        return match
    }

}

var square = Shape(col: "white")
square.setNumSides(3)
square.simpleDescription()
square.type(square.shapeChecker())
//square.setColor("blue")
square.isColor("blue")
square.setColor("white", square.isColor)
square.setColor("blue", square.isColor)
/* ----------------------------------------------------------------- */

//creating subclasses
class Person {
    var name: String
    var age: Int
    
    init(name: String, age: Int){
        self.name = name
        self.age = age
    }
    
    func getName() -> String {
        return self.name
    }
    
    func getAge() -> Int {
        return self.age
    }
    
    func greeting() -> String {
        return "Hi, my name is \(self.name) and I'm \(age) years old."
    }
}

class Student: Person {
    var college: String
    var gradeLevel: String
    
    init(name: String, age: Int, college: String, gradeLevel: String){
        self.college = college
        self.gradeLevel = gradeLevel
        super.init(name: name, age: age)
    }
    
    var modifyCollege: String{ //variable that can act like a getter or a setter
        get {
            return college
        }
        set {
            college = newValue
        }
    }
    
    func modifyGradeLevel () -> String {
        return self.gradeLevel
    }
    
    override func greeting() -> String {
        return "I'm \(name) and am \(age) years old. Currently a \(gradeLevel) at \(college)."
    }
}

var mike = Person(name: "Mike", age: 21)
mike.greeting()
mike.getAge()

var lou = Student(name: "Lou", age: 21, college: "UGA", gradeLevel: "Senior")
lou.getAge()
lou.modifyCollege
lou.greeting()
lou.modifyCollege = "AGU"
lou.greeting()

/* ----------------------------------------------------------------- */