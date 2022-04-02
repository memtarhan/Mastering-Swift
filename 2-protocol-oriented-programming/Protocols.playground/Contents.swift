import Foundation

/*
 Why Protocols ?

 - Protocols serve as better abstractions than classes
 - Modeling a system with classes implies inheritance
 - Inheritance is great until it's not

 /// - Inheritance
 - The superclass defines the core functionality
 - Specializing through subclasing
 - A subclass can
    - Rely on the base class's befavior
    - Override/decorate the class functionality

 /// - Inheritance Pitfalls
 - Bloated superclasses
 - No support for value types

 /// - Protocols
 - Any type can conform to multiple protocols
 - Promote granular design
 - Can be adopted by classes and value types
 */

class TaggedDataClass {
    var tag: String
    var data: Data

    init(tag: String, data: Data) {
        self.tag = tag
        self.data = data
    }

    func persist(to url: URL) throws {
        try data.write(to: url)
    }

    convenience init(tag: String, contentsOf url: URL) throws {
        let data = try Data(contentsOf: url)
        self.init(tag: tag, data: data)
    }

    var base64EncodedString: String {
        data.base64EncodedString()
    }
}

// MARK: - SOLID Principles

/*
  - Single Responsibility Principle
 Every class should have responsibility over a single part of the functionality provided bu the software

 TaggedDataClass
 * Holds data along with a unique identifier
 * Stores and loads data from the filesystem
 * Returns Base64-encoded representation

 ! This is against Single Responsibility!!!
 */

class TaggedDataSuperClass {
    var tag: String
    var data: Data

    init(tag: String, data: Data) {
        self.tag = tag
        self.data = data
    }
}

class PersistentTaggedData: TaggedDataSuperClass {
    func persist(to url: URL) throws {
        try data.write(to: url)
    }

    convenience init(tag: String, contentsOf url: URL) throws {
        let data = try Data(contentsOf: url)
        self.init(tag: tag, data: data)
    }
}

class EncodedTaggedData: TaggedDataSuperClass {
    var base64EncodedString: String {
        data.base64EncodedString()
    }
}

/*
 // Inheritance from non-protocol type 'TaggedData'

 struct Tagged: TaggedData {

 }
 */

protocol Taggable {
    var tag: String { get set }
    var data: Data { get set }

    init(tag: String, data: Data)
}

protocol Persistable: Taggable {
    init(tag: String, contentsOf url: URL)

    func persist(to url: URL) throws
}

extension Persistable {
    init(tag: String, contentsOf url: URL) throws {
        let data = try Data(contentsOf: url)
        self.init(tag: tag, data: data)
    }

    func persist(to url: URL) throws {
        try data.write(to: url)
    }
}

protocol Encodable: Taggable {
    var base64EncodedString: String { get }
}

extension Encodable {
    var base64EncodedString: String {
        data.base64EncodedString()
    }
}

class MyTaggedDataClass: Taggable {
    var tag: String
    var data: Data

    required init(tag: String, data: Data) {
        self.tag = tag
        self.data = data
    }
}

struct MyTaggedDataStruct: Persistable, Encodable {
    init(tag: String, data: Data) {
        self.tag = tag
        self.data = data
    }

    init(tag: String, contentsOf url: URL) {
        let data = try! Data(contentsOf: url)
        self.init(tag: tag, data: data)
    }

    var tag: String
    var data: Data
}

let taggedClass = MyTaggedDataClass(tag: "1", data: Data(repeating: 0, count: 1))
let taggedStruct = MyTaggedDataStruct(tag: "1", data: Data(repeating: 0, count: 1))

let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
let url = documentsURL.appendingPathComponent("myData")

try taggedStruct.persist(to: url)
