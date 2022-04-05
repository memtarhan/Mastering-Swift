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