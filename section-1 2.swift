// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//functions with return types
func greet(name:String, day:String) -> String {
    return "Hello " + name + ", today is " + day
}
greet("Lou", "Monday")

func isPrime(n:Int) -> Bool {
    var divisors = 0
    for i in 1...n {
        if(n % i == 0){
            divisors++
        }
    }
    if(divisors == 2){
        return true
    }else{
        return false
    }
}
isPrime(13)

func fibonacci(n:Int) -> Int{
    if(n <= 1){
        return n
    }
    return fibonacci(n - 1) + fibonacci(n - 2)
}
for i in 0...5{
    fibonacci(i)
}
/* ----------------------------------------- */
//returning tuples, awesome
func calculate(scores: [Int]) -> (min:Int, max:Int, sum:Int){
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        }else if score < min {
            min = score
        }
        sum += score
    }
    
    return (min, max, sum)
}

let stats = calculate([5, 3, 100, 3, 9])
stats.sum
stats.2

func oddOrEven(numbers: [Int]) -> (numEven: Int, numOdd: Int, totalNums: Int){
    var numEven = numbers[0]
    var numOdd = numbers[0]
    var totalNums = numbers[0]
    for number in numbers {
        if(number % 2 == 0){
            numEven++
        }else{
            numOdd++
        }
        totalNums++
    }
    return (numEven, numOdd, totalNums)
}
let numbers = oddOrEven([1, 2, 3, 4, 5, 6, 7])
numbers.numEven
numbers.numOdd
numbers.totalNums
numbers.2
/* ----------------------------------------- */

//collect arguments into array, variable parameter length
func sumOf(numbers:Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
sumOf()
sumOf(3, 3, 3, 3, 3)

func averageOf(numbers:Int...) -> Float {
    var sum = 0
    var numValues = 0
    for number in numbers {
        sum += number
        numValues++
    }
    numbers.capacity
    if(numbers.capacity > 0){
        return Float(sum)/Float(numValues)
    }else{
        return -1
    }
}
averageOf()
averageOf(5, 5, 5, 5)
averageOf(1, 2, 3, 4, 5)
/* ----------------------------------------- */

//nested functions, even cooler 
func returnFifteen() -> Int{
    var outer = 10
    func add() {
        var inner = 5
        outer = outer + inner
    }
    add()
    return outer
}
returnFifteen()

func applyExponent(n: Int, e: Int) -> Int{
    var outer = n
    func mult(){
        outer = outer * n
    }
    for i in 1..<e {
        mult()
    }
    return outer
}
applyExponent(3, 3)
/* ----------------------------------------- */

//function returning a function
func makeIncrementer() -> (Int -> Int){
    func addOne(number:Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(3)

func isEven() -> (Int -> Bool){
    //Function to be returned has Int parameter, returns Bool
    func checkNum(number:Int) -> Bool{
        if(number % 2 == 0){
            return true
        }else{
            return false
        }
    }
    return checkNum
}
var evenyo = isEven()
evenyo(3)
/* ----------------------------------------- */

//function taking another function as parameter 
func hasAnyMatches(list: [Int], condition:Int -> Bool) -> Bool{
    //Function in parameter takes in an Int and returns a Bool
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
func equalTo10(number: Int) -> Bool{
    return number == 10
}
var numlist = [1, 2, 5, 17, 15]
hasAnyMatches(numlist, lessThanTen)
hasAnyMatches(numlist, equalTo10)

func changeValue(val: Int, modifier: Int -> Int) -> Int {
    //function in parameter takes in an int, returns an int
    return modifier(val)
}
func add(val: Int) -> Int {
    return val + 10
}
func subtract(val: Int) -> Int {
    return val - 10
}
func mistake(val: Int) -> String {
    return "This won't work \(val)"
}
changeValue(5, add)
changeValue(5, subtract)
//changeValue(5, mistake) //will not work, wrong return type for parameter function
/* ----------------------------------------- */

//closures
numlist.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})
//closures are essentially like functions, code to call later
//in these two examples, instead of making an Int inside of the map() function,
//we make a closure that returns an Int.
//Essentially a function declared without a name used only at that moment
numlist.map({
    (number: Int) -> Int in
    if(number % 2 != 0){
        return 0
    }else{
        return 3 * number
    }
})
//shortcut, omits parameter type if closure return type already known
let mappedNumbers = numlist.map({number in 3 * number})
mappedNumbers

let sortedNumbers = sorted(numlist) {$0 > $1} // says how to sort the list
sortedNumbers
/* ----------------------------------------- */
