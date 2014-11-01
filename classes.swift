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
    var school: String
    
    init(name: String, age: Int){
        self.name = name
        self.age = age
        self.school = "No school"
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
    
    var place: String {
        get {
            return school
        }
        set {
            school = newValue
        }
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

//willSet - don't need to compute property immediately, but need code to run before/after value is assigned. Can be used to assign a value to object when value is assigned to a different object

class NamedShape {
    var numberOfSides = 0
    var shapeName: String
    
    init(name: String){
        self.shapeName = name
    }
    
    func getDesc() -> String{
        return "A \(shapeName) with \(numberOfSides)"
    }
}

class Square: NamedShape {
    var color: String
    
    init(color: String, name: String){
        self.color = color
        super.init(name: name)
        self.numberOfSides = 4
    }
    
    var shade: String {
        get {
            return "This is a shade of \(color)"
        }
        set{
            color = newValue
        }
    }
    
    override func getDesc() -> String {
        return "A \(self.shapeName) of the color \(color) with \(numberOfSides) sides"
    }
}
var sq = Square(color: "Blue", name: "Square")
sq.getDesc()
sq.shade
sq.shade = "Cyan"
sq.shade

class Triangle: NamedShape {
    var color: String
    
    init(color: String, name: String){
        self.color = color
        super.init(name: name)
        self.numberOfSides = 3
    }
    
    var shade: String {
        get {
            return "This is a shade of \(color)"
        }
        set {
            color = newValue
        }
    }
    
    override func getDesc() -> String {
        return "A \(self.shapeName) of the color \(color) with \(numberOfSides) sides"
    }
}
var tr = Triangle(color: "Red", name: "Triangle")
tr.getDesc()

class TriangleAndSquare {
    var triangle: Triangle {
        willSet {
            square.color = newValue.color
        }
    }
    
    var square: Square {
        willSet {
            triangle.color = newValue.color
        }
    }
    
    init(color: String, name: String){
        triangle = Triangle(color: color, name: name)
        square = Square(color: color, name: name)
    }
    

}
var ts = TriangleAndSquare(color: "Green", name: "Shape")
ts.triangle.color
ts.square.color
ts.square = Square(color: "Gray", name: "Square") //setting this value will also change triangle
ts.square.color
/* ----------------------------------------------------------------- */

//in methods of classes, can specify second name for a parameter
class Counter {
    var count: Int = 0
    
    func incrementBy(amount: Int, numberOfTimes times: Int){
        count += amount * times
        //count += amount * numberOfTimes won't work, only used in parameter
    }
}
var count = Counter()
count.incrementBy(2, numberOfTimes: 7)
//count.incrementBy(2, times: 7) declared a name for the parameter, must use it 
/* ----------------------------------------------------------------- */

//can write optional ? before methods and properties 
var optionalSquare: Square? = Square(color: "Yellow", name: "Why")
//var optionalSquare: Square?
let color = optionalSquare?.color //if value is nil, do nothing afer the ?, conveniet for missing values but code still needs to execute.
/* ----------------------------------------------------------------- */





