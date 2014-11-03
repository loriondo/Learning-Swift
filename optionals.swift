// Playground - noun: a place where people can play

import UIKit

var possibleNumber: String = "123"
var convertedNumber: Int? = possibleNumber.toInt()
var possibleNumber2 = "hello world"
var convertedNumber2 = possibleNumber2.toInt() //toInt() returns nil when input not an int

//forced unwrapping - use when you know optional value is not nil
if convertedNumber != nil {
    println("Converted number = \(convertedNumber!)")
}

if convertedNumber2 != nil {
    println("Converted number = \(convertedNumber2)")
}else {
    println("Could not convert \(possibleNumber2)")
}

//optional binding - find out if optional has value, then assign to temp var
if let actualNumber = possibleNumber.toInt() {
    println("Possible number of \(possibleNumber). Actual number is \(actualNumber)")
}else {
    println("Unable to convert \(possibleNumber)")
}

if let actualNumber = possibleNumber2.toInt() {
    println("This won't work.")
}else {
    println("Could not be converted.")
}

//implicitly unwrapped optionals - use this when YOU KNOW optional will always have value
let possibleString: String? = "An optional string"
let forcedString: String = possibleString! //need to force unwrapping from optional
var assumedString: String! = "An implicitly unwrapped optional string"
let implicitString: String = assumedString //no need for '!', unwrapped for us
assumedString = nil
//assumedString.isEmpty //this will cause an error since we made the string an implicitly unwrapped optional
if let workingString = assumedString {
    println(workingString) //but since it still is an optional, we can use optional binding to check the optional value
}else {
    println("It was nil.")
}

/* --------------------------------------------------- */

//Assertionssss, yessss. Ties nicely with optional values.
//With possibility of optional values, there can be a case where some value is missing and the rest of the program simply cannot continue. TRIGGER ASSERTIONS TO END EXECUTION
    //good for debugging the cuase of the missing value
let age = 3
//let age = -3 //in an app, code would terminate here, playground stops working here
assert(age >= 0, "Person's age cannot be less than zero.")

//var maybeAnInt = "yes" //toInt() would make this return nil, failing the assertion
var maybeAnInt = "21"
var converted = maybeAnInt.toInt()
assert(converted != nil, "maybeAnInt was definitely not an int")

//use assertions when you really need that value, i.e. a function needs value to work
let transaction = "21"
let actualTransaction = transaction.toInt()
func printTransaction(price: Int) -> Int {
    return price
}
assert(actualTransaction != nil)
printTransaction(actualTransaction!) //function needs an int, otherwise will not work
/* --------------------------------------------------- */

/* Note that assertions mainly for debugging - not a replacement for making
    robust code that ensures no optional values are nil :) */

