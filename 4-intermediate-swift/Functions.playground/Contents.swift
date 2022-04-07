import Foundation

// MARK: - Defining functions

func sayHello() {
    print("Hello!")
}

sayHello()

func sayGoodbye(to person: String) {
    print("Goodbye \(person)!")
}

sayGoodbye(to: "Mehmet")

func getGoodbyeMessage(for person: String) -> String {
    let message = "Goodbye \(person)!"
    return message
}

let message = getGoodbyeMessage(for: "Mehmet")
print(message)

/// - Returning multiple values
func getError() -> (code: Int, description: String) {
    return(404, "Page Not Found")
}

func getError2() -> (Int, String) {
    return(404, "Page Not Found")
}

let error = getError()
print("Error with code: \(error.code) and description: \(error.description)")

let error2 = getError2()
print("Error with code: \(error2.0) and description: \(error2.1)")
