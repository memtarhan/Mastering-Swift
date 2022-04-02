import Foundation

// 3 different functions? Nah, that's not good!
// func equals(lhs: Int, rhs: Int) -> Bool {
//    lhs == rhs
// }
//
// func equals(lhs: Double, rhs: Double) -> Bool {
//    lhs == rhs
// }
//
// func equals(lhs: Float, rhs: Float) -> Bool {
//    lhs == rhs
// }
//
// equals(lhs: 10, rhs: 20)
// equals(lhs: 1.2, rhs: 1.2)
//
// let pi: Float = 3.14
// let e: Float = 2.71
//
// equals(lhs: pi, rhs: e)

func equals<T: Equatable>(lhs: T, rhs: T) -> Bool {
    lhs == rhs
}

let pi: Float = 3.14
let e: Float = 2.71

equals(lhs: pi, rhs: e)
equals(lhs: pi, rhs: pi)

let abc = "abc"
let efg = "efg"

equals(lhs: abc, rhs: efg)

let d1 = Data(repeating: 1, count: 10)
let d2 = Data(repeating: 1, count: 10)

equals(lhs: d1, rhs: d2)

// MARK: - Generic Types

// struct StringWrapper {
//    var storage: String
// }
//
// struct IntWrapper {
//    var storage: Int
// }
//
// struct DateWrapper {
//    var storage: Date
// }

// - Generic Struct
struct Wrapper<T: Equatable> {
    var storage: T

    init(_ value: T) {
        storage = value
    }
}

let piWrapped = Wrapper(Double.pi)
// or let piWrapped = Wrapper<Double>(.pi)
let stringWrapped = Wrapper("POP")
let dateWrapped = Wrapper(Date())

// - Generic Protocols
protocol Taggable {
    associatedtype T: Equatable

    var tag: String { get }
    var data: T { get }

    init(tag: String, data: T)
}

struct TaggedDouble: Taggable {
    var tag: String
    var data: Double
}

struct TaggedDate: Taggable {
    var tag: String
    var data: Date
}

let double = TaggedDouble(tag: "1", data: 1.0)
let date = TaggedDate(tag: "2", data: Date())

struct GenericTagged<T: Equatable>: Taggable {
    var tag: String
    var data: T
}

let taggedDouble = GenericTagged<Double>(tag: "pi", data: .pi)
