// Playground - noun: a place where people can play
// Lou Oriondo - Learning - Swift
// 10/24/14

import UIKit

var str = "Hello, playground"

println(str)

let expFloat:Float = 4 //declare the type to make explicit constant value
let impFloat = 4.0

let label = "The width is"
let width = 94
let labelWidth = label + String(width) //have to make an instance of desired type 

let age:Float = 21
let time:Float = 5

let greeting = "My name is Lou and I am \(age / time) " //can use \() to display values inside a string

//initialize an empty array of strings
var emptyArray = [String]()
//to make a dictionary, the left value is key, right is object
var dictionary = Dictionary<String, Float>(minimumCapacity : 2)

//insert stuff into strings
let sizeCheck = emptyArray.capacity
emptyArray.append("hello")
println(emptyArray[0])
emptyArray[0] = "goodbye"

//insert stuff into dictionary
dictionary["three"] = 4.0
println(dictionary["three"])

//loops
let grades = [70, 80, 90, 100];
var myGrade = 0;
for grade in grades {
    if grade > 80 {
        myGrade += 90
    }else{
        myGrade -= 90
    }
}
println(myGrade)

//working with missing values
var optionalString: String? = "I'm optional"
optionalString == nil

var optionalName: String? = "Lou"
//var optionalName: String? = nil
var greet = "Hello"
if let name = optionalName { //if optional name is not nil, then execute code block
    greet = "Hello " + name
}

//switch statements support any kind of data
var veggieComment:String
let vegetable = "red pepper"
switch vegetable{
case "celery":
    veggieComment = "Add some raisins bro"
case "cucumber", "watercress":
    veggieComment = "Tea sandwhich bro"
case let x where x.hasSuffix("pepper"):
    veggieComment = "That's a spicy " + x
default: //needed to make switch statement exhaustive
    veggieComment = "Everything tastes good in soup."
}
println(veggieComment)

//iterating over elements in a dictionary 
let interestingNumbers = [
    "Prime" : [2, 3, 5, 7, 11, 13],
    "Fibonacci" : [1, 1, 2, 3, 5, 8],
    "Square" : [1, 4, 9, 16, 25]
]
var largest = 0
var kindOfNumber: String = "I don't know"
for(kind, numbers) in interestingNumbers{ //arbitrary order when iterating
    for number in numbers{
        println(number)
        if(number > largest){
            largest = number
            kindOfNumber = kind
        }
    }
}
largest
kindOfNumber


//while loops, easy-peasy
var n = 2
while n < 100 {
    n = n * 2
    println(n)
}
n
//do while will always exectute at least once
var m = 2
do {
    m = m * 2
} while m < 0
m

var numEven:Int = 0
var numOdd:Int = 0
for(var i:Int = 0; i < 100; i++){
    if(i % 2 == 0){
        numEven++
    }else{
        numOdd++
    }
}
numEven
numOdd

//keep an index in a loop, either by ..< 
//using ... instead includes upper value
var firstLoop = 0
for i in 0..<4 {
    firstLoop++
}
firstLoop


var cipher = [
    3 : "What is love.",
    1 : "Baby, don't hurt me.",
    2 : "No more"
]

for(code, message) in cipher{
    message
    code
}


for i in 0..<5 {
    for j in 0..<2{
        i + j
    }
}

var message:String = "much swag"
var response: String
switch message {
case "zero swag":
    response = "You have zero swag."
case let x where x.hasPrefix("much"):
    response = "very swag indeed"
case let x where x.hasSuffix("swag"):
    response = "any amount of swag is good swag"
default:
    response = "no swag bruh"
}
response //breaks at first instance that the case is satisfied


var optionalInt: Int? = 13
for i in 0..<13 {
    if (i % 2 != 0){
        optionalInt = nil
    }
    if let testInt = optionalInt {
        var message = "The int is \(testInt)"
    }
}


