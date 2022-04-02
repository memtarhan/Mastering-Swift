import Darwin
import Foundation

// MARK: - Conforming to protocols via extensions

protocol Encrypting {
    func xor(key: UInt8) -> Self?
}

extension String: Encrypting {
    // ^: xor
    func xor(key: UInt8) -> String? {
        String(bytes: utf8.map { $0 ^ key }, encoding: .utf8)
    }
}

let source = "Hello, Protocols!"
let target = source.xor(key: 42)
print(target ?? "Failed to encode")
print(target?.xor(key: 42) ?? "Failed to decode")
