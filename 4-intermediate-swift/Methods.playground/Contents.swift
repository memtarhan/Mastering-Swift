import Foundation

class BankAccount {
    var balance: Double = 0

    func deposit(amount: Double) {
        balance += amount
    }

    func withdraw(amount: Double) -> Double {
        let withdrawAmount = min(amount, balance)
        balance -= withdrawAmount
        return withdrawAmount
    }
}

let account = BankAccount()
account.deposit(amount: 100)
account.deposit(amount: 200)
account.withdraw(amount: 150)
account.withdraw(amount: 400)

struct ScoreTracker {
    var score: Int = 0

    mutating func beatBoss() {
        score += 100
    }
}

var tracker = ScoreTracker()
tracker.beatBoss()

enum LightState {
    case red
    case yellow
    case green

    mutating func change() {
        switch self {
        case .red: self = .green
        case .yellow: self = .red
        case .green: self = .yellow
        }
    }
}

var light = LightState.red
light.change()
light.change()
