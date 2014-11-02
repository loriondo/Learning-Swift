// Playground - noun: a place where people can play

import UIKit

//generics
func repeat<Item>(item: Item, times: Int) -> [Item] { //returns generic type
    var result = [Item]()
    for i in 0..<times {
        result.append(item)
    }
    return result
}

repeat("knock", 4)
repeat(27, 3)

func display<Item>(item: Item, times: Int) -> String {
    var result: String = "\(item)"
    for i in 1 ... times {
        result += "\(item)"
    }
    return result
}
display("no", 3)
display(27, 3)
/* ----------------------------------- */
//can make generic forms of methods, classes, optional values, etc
enum OptionalValue<T> {
    case None
    case Some(T)
}
var possibleInteger: OptionalValue<Int> = .None
possibleInteger = .Some(200)
var possibleString: OptionalValue<String> = .None
possibleString = .Some("Hello")
/* ----------------------------------- */
//where keyword
//specifies list of requirements, in this case, two types. don't need to know what this example does, just focus on 'where'
func anyCommonElements <T, U where T: SequenceType, U: SequenceType, T.Generator.Element: Equatable, T.Generator.Element == U.Generator.Element > (lhs: T, rhs: U) -> Bool {
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}
anyCommonElements([1, 2, 3], [3])

//modify code to return array of elements that are in both sequences
func anyCommonElementsArray <T, U where T: SequenceType, U: SequenceType, T.Generator.Element: Equatable, T.Generator.Element == U.Generator.Element > (lhs: T, rhs: U) -> [T.Generator.Element] {
    var common = Array<T.Generator.Element>()
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                common.append(lhsItem)
            }
        }
    }
    return common
}
anyCommonElementsArray([1,2,3],[2,3])
anyCommonElementsArray("hello", "goodbye") //accepts any type of sequence
//anyCommonElementsArray(12345, 345) //not a sequence type, doesn't work
/* ----------------------------------- */

/* Swift Tour Complete! On to more practice. */

