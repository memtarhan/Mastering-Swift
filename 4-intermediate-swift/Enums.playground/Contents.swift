import Foundation

// MARK: - Enumerations

enum Product {
    case laptop
    case desktop
    case phone
}

let product = Product.phone

var result: String
switch product {
case .laptop:
    result = "Laptop!"
case .desktop:
    result = "Desktop"
case .phone:
    result = "Phone"
}

result

enum Product2: CaseIterable {
    case laptop
    case desktop
    case phone
}

let products = Product2.allCases

enum Suit: String {
    case heart = "♥️"
    case diamond
    case club
    case spade
}

Suit.club.rawValue

// MARK: - Enum: Associated Values

enum Card {
    case regular(Int, Suit)
    case joker
}

let card = Card.regular(5, .heart)
switch card {
case let .regular(number, suit):
    result = "We have a \(number) of \(suit.rawValue)"
case .joker:
    result = "We have a joker"
}

result
