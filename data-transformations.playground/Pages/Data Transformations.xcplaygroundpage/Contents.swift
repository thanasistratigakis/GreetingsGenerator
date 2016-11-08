//: [Previous](@previous)
/*:
 `map`, `filter` and `reduce` are the most important building blocks in functional programming. In essence, all of them are abstractions over common operations on collections (e.g. arrays):
 
 1. `map` will take each element of a collection and _transform_ it to something else
 2. `filter` will _remove_ certain elements from an array that don't adhere to a given condition
 3. `reduce` _combines_ all the elements of an array and outputs a single value
 
 On this playground page, we will implement our own versions of these functions.
 
 ### Challenges
 
 Write the following functions:
 
 1. `func mapIntsToInts(array: [Int], transform: (Int) -> Int) -> [Int]` that applies the `transform` closure on each element in the input `array`
 2. `func mapIntsToStrings(array: [Int], transform: (Int) -> String) -> [String]` that applies the `transform` closure on each element in the input `array`
 3. `func filterInts(array: [Int], isIncluded: (Int) -> Bool) -> [Int]` that only keeps those elements from the input `array` for which `isIncluded` is `true`
 4. `func filterStrings(array: [String], isIncluded: (String) -> Bool) -> [String]` that only keeps those elements from the input `array` for which `isIncluded` is `true`
 5. `func reduceIntsToInt(array: [Int], initial: Int, combine: (Int, Int) -> Int) -> Int` that reduces all the elements in the input `array` to one single output element of type `Int` by applying the `combine` function to each intermediate result and the current value in the input `array`
 6. `func reduceStringsToStrings(array: [String], initial: String, combine: (String, String) -> String) -> String` that reduces all the elements in the input `array` to one single output element of type `String` by applying the `combine` function to each intermediate result and the current value in the input `array`
 7. `func map<T, U>(array: [T], transform: (T) -> U) -> [U]` that applies the `transform` closure on each element in the input `array`
 8. `func filter<T>(array: [T], isIncluded: (T) -> Bool) -> [T]` that only keeps those elements from the input `array` for which `isIncluded` is `true`
 9. `func reduce<T, U>(array: [T], initial: U, combine: (U, T) -> U) -> U`
 10. recursive versions of `map`, `filter` and `reduce` 😏
 */


func mapIntsToInts(array: [Int], transform: (Int) -> Int) -> [Int] {
    var intArrayToReturn: [Int] = []
    for int in array {
        intArrayToReturn.append((transform(int)))
    }
    return intArrayToReturn
}

func mapIntsToString(array: [Int], transform: (Int) -> String) -> [String] {
    var stringsToReturn: [String] = []
    for int in array {
        stringsToReturn.append(transform(int))
    }
    return stringsToReturn
}

func filterInts(array: [Int], isIncluded: (Int) -> Bool) -> [Int] {
    var intsToReturn: [Int] = []
    for int in array {
        if (isIncluded(int)) {
            intsToReturn.append(int)
        }
    }
    return intsToReturn
}

func filterStrings(array: [String], isIncluded: (String) -> Bool) -> [String] {
    var stringsToReturn: [String] = []
    for string in array {
        if (isIncluded(string)) {
            stringsToReturn.append(string)
        }
    }
    return stringsToReturn
}

func reduceIntsToInt(array: [Int], initial: Int, combine: (Int, Int) -> Int) -> Int {
    var intToReturn: Int = initial
    for int in array {
        intToReturn = combine(intToReturn, int)
    }
    return intToReturn
}

func reduceStringsToStrings(array: [String], initial: String, combine: (String, String) -> String) -> String {
    var stringToReturn: String = initial
    for string in array {
        stringToReturn = combine(stringToReturn, string)
    }
    return stringToReturn
}

func map<T, U>(array: [T], transform: (T) -> U) -> [U] {
    var arrayToReturn: [U] = []
    for item in array {
        arrayToReturn.append((transform(item)))
    }
    return arrayToReturn
}

func reduce<T, U>(array: [T], initial: U, combine: (U, T) -> U) -> U {
    var thingToReturn: U = initial
    for item in array {
        thingToReturn = combine(thingToReturn, item)
    }
    return thingToReturn
}

let myIntArray = [1, 2, 3, 4, 5, 6, 7, 8]
let myStringArray = ["one", "two", "three"]

print(mapIntsToInts(array: myIntArray, transform: { $0 * 2 }))
print(mapIntsToString(array: myIntArray, transform: { String($0 * 2) }))
print(filterInts(array: myIntArray, isIncluded: { $0 % 2 == 1 }))
print(filterStrings(array: myStringArray, isIncluded: { $0.characters.first == "t"}))
print(reduceIntsToInt(array: myIntArray, initial: 0, combine: { $0 + $1 }))
print(reduceStringsToStrings(array: myStringArray, initial: "", combine: { $0 + $1 }))

print(map(array: myIntArray, transform: { $0 * 2 }))
print(reduce(array: myStringArray, initial: "", combine: { $0 + $1 }))
