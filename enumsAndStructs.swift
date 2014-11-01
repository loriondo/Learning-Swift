// Playground - noun: a place where people can play

import UIKit

//enumerations, xcode 6.0 uses .toRaw() and .fromRaw()
enum Rank: Int {
    case Ace = 1, Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    
    func simpleDesc() -> String{
        switch self{
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.toRaw())
        }
    }
    //experiment
    func equalTo(other: Rank) -> Bool {
        if(other.simpleDesc() == self.simpleDesc()){
            return true
        }else{
            return false
        }
    }
}

let one = Rank.Ace.toRaw() //xcode 6.0 does not have rawValue yet, use toRaw() and fromRaw() for 6.0
let queen = Rank.Queen.simpleDesc()
let two = Rank.Two.simpleDesc()

let ace = Rank.Ace
let three = Rank.Three
let result = ace.equalTo(three)

//initlalize enum from raw value, returns nil if rawvalue doesn't exist
if let possibleRank = Rank.fromRaw(12){//works since queen has rawValue 12
    possibleRank.simpleDesc()
}
let possibleRank2 = Rank.fromRaw(32) //nil
/* -------------------------------------------------------- */

//more enum practice
enum Color {
    case Red, Yellow, Blue
    case Green, Orange, Violet
    case Black
    
    func description() -> String {
        switch self {
        case .Red:
            return "red"
        case .Yellow:
            return "yellow"
        case .Blue:
            return "blue"
        case .Green:
            return "green"
        case .Orange:
            return "orange"
        case .Violet:
            return "violet"
        default:
            return "black"
        }
    }
    
    func combineWith(other: Color) -> Color {
        var first = self.description()
        var second = other.description()
        if(first == second){
            return self
        }else if(first == "red" && second == "blue" ||
                 first == "blue" && second == "red"){
            return Violet
        }else if(first == "red" && second == "yellow" ||
            first == "yellow" && second == "red"){
                return Orange
        }else if(first == "yellow" && second == "blue" ||
            first == "blue" && second == "yellow"){
                return Green
        }else {
            return Black
        }
    }
}
var red = Color.Red
var blue = Color.Blue
red.description()
blue.description()
var violet = red.combineWith(blue)
violet.description()
var noColor = violet.combineWith(red)
noColor.description()
// let possibleColor = Color.fromRaw("Green") enum did not declare rawvalue type, so fromRaw not available
/* -------------------------------------------------------- */

//structs - similar behavior to classes, but is passed by value, not like classes which are passed by reference
struct Card {
    var rank: Rank
    var color: Color
    func simpleDescription() -> String {
        return "This card is of rank \(rank.simpleDesc()) which is color \(color.description())"
    }
}
class Card2 {
    var rank: Rank
    var color: Color
    init(rank: Rank, color: Color){
        self.rank = rank
        self.color = color
    }
    func simpleDescription() -> String {
        return "This card is of rank \(rank.simpleDesc()) which is color \(color.description())"
    }
}
var card1 = Card(rank: .Ace, color: .Blue) //struct "initializer" made for me!
card1.simpleDescription()
var card2 = Card2(rank: .Ace, color: .Blue)
card2.simpleDescription() //should return the same as card1
var card1Copy = card1
var card2Copy = card2
card1Copy.rank = .King
card2Copy.rank = .King
card1.simpleDescription() //structs are passed by value, so only the copy
card1Copy.simpleDescription()//was changed. the original is a different instance
card2.simpleDescription()//classes are passed by reference, so changing the copy
card2Copy.simpleDescription()//also changes the object it is referencing
/* -------------------------------------------------------- */

//associated values - different for every member of the enumeration ,opposite of raw values which are shared among all enumeration instances

enum ServerResponse {
    case Result(String, String) //here, String is the associated value
    case Error(String) //the String in Error will be different from Result
    case Transaction(String, Int)
}

let success = ServerResponse.Result("6:00am", "8:09pm")
let failure = ServerResponse.Error("Out of cheese.")
let purchase = ServerResponse.Transaction("Cheese", 10)

//switch success {
//switch failure { //uncomment this, and the switch statement returns the second case
switch purchase {
case let .Result(sunrise, sunset):
    let serverResponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)."
case let .Error(error):
    let serverResponse = "Failure: \(error)"
case let .Transaction(item, amount):
    let serverResponse = "Purchased \(item) for $\(amount)."
}//switch must have as many cases as the enumeration
/* -------------------------------------------------------- */

//closures for fun
//closure expression syntax
/*
{ (parameters) -> return type in
    statements
*/
var numbers = [1, 2, 3, 4, 5]
var numbers2 = numbers.map({
    (number: Int) -> Int in //applies transformation to all elements
    let result = 2 * number
    return result
})
numbers2[0]
numbers2[1]
var numbers3 = numbers.map({number in 2*number})//can use this when we know the return type
numbers3[0]
var wordNumber = numbers.map({
    (number: Int) -> String in
    var result: String
    switch number {
    case 1:
        result = "one"
    case 2:
        result = "two"
    case 3:
        result = "three"
    case 4:
        result = "four"
    default:
        result = "five"
    }
    return result
})
wordNumber[0]
wordNumber[4]
/* -------------------------------------------------------- */
