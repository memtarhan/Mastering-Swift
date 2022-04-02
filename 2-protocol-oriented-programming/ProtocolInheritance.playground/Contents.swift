import Foundation

// MARK: - Protocol inheritance

protocol Taggable {
    var tag: String { get }
    var data: Data { get }

    init(tag: String, data: Data)
}

protocol TaggedPersistable: Taggable, CustomStringConvertible, Equatable {
    init(tag: String, contentsOf url: URL) throws

    func persist(to url: URL) throws
}

extension TaggedPersistable {
    init(tag: String, contentsOf url: URL) throws {
        let data = try Data(contentsOf: url)
        self.init(tag: tag, data: data)
    }

    func persist(to url: URL) throws {
        try data.write(to: url)
    }
}

protocol TaggedEncodable: Taggable {
    var base64: String { get }
}

extension TaggedEncodable {
    var base64: String { data.base64EncodedString() }
}

// MARK: - Adopting multiple protocols

struct MyData: TaggedPersistable, TaggedEncodable {
    var tag: String

    var data: Data

    init(tag: String, data: Data) {
        self.tag = tag
        self.data = data
    }
}

extension MyData: CustomStringConvertible {
    var description: String { "MyData\(tag)" }
}

// MARK: - Protocol extensions

struct PersistableData: TaggedPersistable {
    init(tag: String, data: Data) {
        self.tag = tag
        self.data = data
    }

    var tag: String

    var data: Data

    var description: String { "PersistableData\(tag)" }
}

let p = PersistableData(tag: "42", data: Data(repeating: 1, count: 10))
//try p.persist(to: URL(string: "")!)
