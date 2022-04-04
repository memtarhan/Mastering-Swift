import Foundation

// MARK: - Defining Functions

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
