import Foundation

// MARK: A Generic Stack

/*
 Sequential container that provides a last-in, first-out access to its elements

 * New items get pushed onto the top of the stack
 * Access most recently added element using peek() or pop()

 */

public protocol StackProtocol {
    associatedtype E

    mutating func push(_ item: E)
    mutating func pop() -> E?
    func peek() -> E?

    var count: Int { get }
    var isEmpty: Bool { get }
}

public struct Stack<T>: StackProtocol {
    private var storage = [T]()

    public mutating func push(_ item: T) {
        storage.append(item)
    }

    public mutating func pop() -> T? {
        storage.popLast()
    }

    public func peek() -> T? {
        storage.last
    }

    public var count: Int { storage.count }
    public var isEmpty: Bool { storage.isEmpty }
}


var stack = Stack<String>()
stack.push("A")
stack.push("B")
stack.push("C")

stack.peek()
stack.pop()

stack.count
stack.isEmpty

stack.pop()
stack.pop()
