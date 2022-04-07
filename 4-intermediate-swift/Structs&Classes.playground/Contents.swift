import Foundation

// MARK: - Structs & Classes

/*
 * Combine various data types together
 * Represent more complex concepts
 * Structs are value types(Any change to a copy of an object does not affect the original copy)
 * Classes are reference types(Any change to a copy of an object affects the original copy)
 */

struct Point: CustomStringConvertible {
    var x = 0
    var y = 0

    var description: String { "(\(x), \(y))" }
}

class Student: CustomStringConvertible {
    var name = "Name"
    var grade = 1

    var description: String { "\(name) at \(grade)" }
}

var p1 = Point()
var p2 = p1
p2.x = 4
p2.y = 5

p1
p2

var s1 = Student()
var s2 = s1
s2.name = "X"
s2.grade = 2

s1
s2

