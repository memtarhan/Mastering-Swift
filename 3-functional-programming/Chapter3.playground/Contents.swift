import Foundation

// MARK: Array Functions

let players = ["Luka", "Jokic", "Embid", "Giannis"]

var relations = ["Luka knows Giannis", "Embid knows Jokic"]

// - Old way
for i in 0 ..< players.count {
    for j in i ..< players.count {
        let description = "\(players[i]) knows \(players[j])"
        if !relations.contains(description) {
            relations.append(description)
            print("Found new relationship!")

        } else {
            print("Already know about this one")
        }
    }
}

// - New way (Get rid of indices
/*
 .map
 .filter
 .reduce
 */

// MARK: - .map

/*
 Takes an array and convert to another with specied changes (Return a copy)
 */
let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]

// - Old way
var newNumbers = [Int]()
for number in numbers {
    let newNumber = number * number
    newNumbers.append(newNumber)
}

// - Functional way
func square(x: Int) -> Int { x * x }
let squaredNumbers = numbers.map(square)
let squaredNumbersX = numbers.map { $0 * $0 }
let negativeNumbers = numbers.map { -$0 }
print(negativeNumbers)

// MARK: - .filter

func even(number: Int) -> Bool { number % 2 == 0 }

let evenNumbers = numbers.filter(even)
print(evenNumbers)
let oddNumbers = numbers.filter { $0 % 2 != 0 }
print(oddNumbers)
let oddNumbers2 = numbers.filter { !even(number: $0) }
print(oddNumbers2)

// MARK: - .reduce

/*
 Reduces down to a single value such as sum, average, median, etc.
 */

func reduceSum(sum: Int, element: Int) -> Int { sum + element }
let sum = numbers.reduce(0, reduceSum) // Initial value and function

func reduceProduct(product: Int, element: Int) -> Int { product * element }
let product = numbers.reduce(1, reduceProduct)

// MARK: - Let's combine those functions

let myNumbers = numbers
    .map(square)
    .filter(even)
    .reduce(0, reduceSum)

print(myNumbers)

enum Gender: String, Equatable {
    case male, female, other

    static func == (lhs: Gender, rhs: Gender) -> Bool {
        lhs.rawValue == rhs.rawValue
    }
}

struct Person: CustomStringConvertible {
    var gender: Gender
    var age: Int

    var description: String { "\(age) years old \(gender.rawValue.capitalized)" }
}

let people = [Person(gender: .male, age: 20),
              Person(gender: .other, age: 21),
              Person(gender: .female, age: 22),
              Person(gender: .male, age: 23),
              Person(gender: .female, age: 24),
              Person(gender: .other, age: 25),
              Person(gender: .female, age: 26),
              Person(gender: .male, age: 27),
              Person(gender: .male, age: 28),
              Person(gender: .female, age: 29),
              Person(gender: .other, age: 30),
              Person(gender: .male, age: 31)]

// TODO: This does not work correctly
func avg(x: Double, person: Person) -> Double {
    if x == 0 {
        print("Double(person.age) } = \(Double(person.age))")
        return Double(person.age)
    } else {
        print("(x + Double(person.age)) / 2 = \((x + Double(person.age)) / 2)")
        return (x + Double(person.age)) / 2
    }
}

func isMale(person: Person) -> Bool { person.gender == .male }

// Let's find average age of males
let males = people.filter(isMale)
let avgAge = males.reduce(0, avg)

// MARK: - Partial application

func add(x: Int, y: Int, z: Int) -> Int { x + y + z }
func addX(x: Int) -> (Int, Int) -> Int {
    func addYAndZ(y: Int, z: Int) -> Int {
        return x + y + z
    }
    return addYAndZ
}

let add5 = addX(x: 5)
add5(6, 7)

func addXAndY(x: Int, y: Int) -> (Int) -> Int {
    func addZ(z: Int) -> Int {
        return x + y + z
    }
    
    return addZ
}

let add3And4 = addXAndY(x: 3, y: 4)
add3And4(5)

