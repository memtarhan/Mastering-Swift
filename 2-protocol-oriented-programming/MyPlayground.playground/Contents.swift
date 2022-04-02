import Foundation

/*
 If it's AnyObject (Taggable protocol), it cannot be adopted by value types.
 */

protocol ValueAndReferenceAdoptable {
    var id: String { get set }

    mutating func updateId(with id: String) -> Bool
}

protocol ReferenceAdoptable: AnyObject {
    var id: String { get set }

    func updateId(with id: String) -> Bool
}

struct ValueType: ValueAndReferenceAdoptable {
    var name: String
    var id: String

    mutating func updateId(with id: String) -> Bool {
        self.id = id
        return false
    }
}

class ReferenceType: ReferenceAdoptable {
    var name: String = ""
    var id: String = ""

    func updateId(with id: String) -> Bool {
        self.id = id
        return true
    }
}

protocol Taggable {
    var tag: String { get set }
    var data: Data { get }

    static var counter: Int { get }

    /*
     If it modifies any instance it should be 'mutating'
     If it's 'mutating', it allows value types to adapt to the protocol
     */
    mutating func update(data: Data) -> Bool

    static func icrementCounter()

    init(tag: String, data: Data)
}

struct TaggedData: Taggable {
    var tag: String
    var data: Data

    static var counter: Int = 0

    mutating func update(data: Data) -> Bool {
        self.data = data
        return true
    }

    static func icrementCounter() {
        counter += 1
    }

    init(tag: String, data: Data) {
        self.tag = tag
        self.data = data
    }
}
