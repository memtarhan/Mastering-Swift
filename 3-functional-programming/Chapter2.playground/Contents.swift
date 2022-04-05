import Foundation

// MARK: - Defining functions as variables

let name: String = "Mehmet"
let number: Int = 7

func someFunction() {}
let writeEmailsToDb: ([String]) -> Void

func numberOfCharacters(string: String) -> Int {
    string.count
}

// let characterCount: (String) -> Int = numberOfCharacters
// or
let characterCount: (String) -> Int = { string in
    string.count
}

characterCount(name)

let findAverage: (Float, Float) -> Float = { x, y in
    (x + y) / 2
}

findAverage(99, 189)

let ENVIRONMENT = "development"

func fetchNamesFromDb() -> [String] {
    var names = [String]()
    // Do something magical here
    return names
}

func fetchNamesMock() -> [String] {
    return [
        "Luka",
        "Jokic",
        "Embid",
        "Giannis"]
}

let fetchNames: () -> [String]
if ENVIRONMENT == "development" {
    fetchNames = fetchNamesMock

} else {
    fetchNames = fetchNamesFromDb
}

let names = fetchNames()

// MARK: - Passing functions as arguments

func printUppercased(string: String) {
    print(string.uppercased())
}

printUppercased(string: name)

func someFuntion(anotherFuntion: (String) -> Int) {
}

func someFuntion(anotherFuntion: (Int, Int) -> Void) {
}

func add(x: Int, y: Int) -> Int { x + y }
func substract(x: Int, y: Int) -> Int { x - y }

func combineNumbers(myFunction: (Int, Int) -> Int) -> Int {
    let x = 2
    let y = 3
    return myFunction(x, y)
}

combineNumbers(myFunction: add)
combineNumbers(myFunction: substract)
combineNumbers(myFunction: min)
combineNumbers(myFunction: max)
combineNumbers(myFunction: { x, y in
    2 * x + y
})
