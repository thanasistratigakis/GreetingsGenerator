//: [Next](@next)
/*:
 
 ### Challenges
 
 Write the following functions: 
 
 1. `makeAllUppercase` that takes an array of `String`s and returns an array of `String`s; all the strings in the returned array should only contain uppercase characters
 2. `convertAllToString` that takes an array of `Int`s and returns an array of `String`s where every `Int` was transformed to a `String`
 3. `keepOnlyOdds` that takes an array of `Int`s and returns an array of `Int`s that only has odd numbers
 4. `startingWithA` that takes an array of `String`s and returns an array of `String`s that only contains `String`s that start with the (uppercase) letter `A`
 5. `computeProduct` that takes an array of `Int`s and returns a single `Int` that is the product of all the elements in the array
 6. `concatenateAll` that takes an array of `String`s and returns a `String` that is concatenates all the elements in the array
 
 */

func makeAllUppercase(lowercaseStrings:[String]) -> [String] {
    var uppercaseStrings: [String] = []
    uppercaseStrings = lowercaseStrings.map { $0.uppercased() }
    return uppercaseStrings
}

func makeAllUppercase(lowercaseInts:[Int]) -> [String] {
    var uppercaseStrings: [String] = []
    uppercaseStrings = lowercaseInts.map { String($0) }
    return uppercaseStrings
}

func keepOnlyOdds(allInts: [Int]) -> [Int] {
    var oddInts: [Int] = []
    oddInts = allInts.filter { $0 % 2 == 1 }
    return oddInts
}

func startingWithA(strings: [String]) -> [String] {
    var stringsWithA: [String] = []
    stringsWithA = strings.filter { $0.characters.first == "A" }
    return stringsWithA
}

func computeProduct(ints: [Int]) -> Int {
    var product: Int = 0
    product = ints.reduce(0) { $0 + $1 }
    return product
}

func concatenateAll(strings: [String]) -> String {
    var concatenatedString: String = ""
    concatenatedString = strings.reduce("") { $0 + $1 }
    return concatenatedString
}

let myStringArray = ["one", "two", "three"]
let myIntArray = [1, 2, 3, 4, 5, 6, 7, 8]
let myStrings = ["Aword","not a word","a doesntcount", "Aye, nice", "Anothaone"]


makeAllUppercase(lowercaseStrings: myStringArray)
makeAllUppercase(lowercaseInts: myIntArray)
keepOnlyOdds(allInts: myIntArray)
startingWithA(strings: myStrings)
computeProduct(ints: myIntArray)
concatenateAll(strings: myStringArray)

