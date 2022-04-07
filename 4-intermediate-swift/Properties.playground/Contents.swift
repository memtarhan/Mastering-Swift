import Foundation

// MARK: - Properties

/*

 * Store or compute a value on an enum, struct or class
 * Simplify complexity to a single name
 */

struct Person {
    let id: String
    var name = "Name"
    var age = 25
}

var person = Person(id: "id=1", name: "Lucas", age: 27)
person.name
person.age

person.name = "New name"
person.age = 21

struct Cube {
    var side: Double = 1.0 {
        willSet {
            print("willSet: \(side) -> \(newValue)")
        } didSet {
            print("didSet: \(oldValue) -> \(side)")
        }
    }

    var surfaceArea: Double {
        side * side * 6
    }

    var volume: Double {
        side * side * side
    }
}

var cube = Cube()
cube.surfaceArea
cube.volume

cube.side = 2
cube.surfaceArea
cube.volume
