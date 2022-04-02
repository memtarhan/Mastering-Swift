import Foundation

// MARK: - Understanding polymorphism

protocol Shape {
    var area: Double { get }
}

struct Square: Shape {
    let side: Double

    var area: Double {
        side * side
    }
}

struct Rectangle: Shape {
    let widht: Double
    let height: Double

    var area: Double {
        widht * height
    }
}

struct Rhombus: Shape {
    let d1: Double
    let d2: Double

    var area: Double {
        (d1 * d2) / 2
    }
}

struct Circle: Shape {
    let radius: Double

    var area: Double {
        .pi * radius * radius
    }
}

var shape: Shape
shape = Rectangle(widht: 20, height: 10)
print(shape.area)

shape = Circle(radius: 10)
print(shape.area)

shape = Rhombus(d1: 4, d2: 6)
print(shape.area)

var shapes: [Shape] = []

let square = Square(side: 5)
shapes.append(square)

let rectangle = Rectangle(widht: 10, height: 5)
shapes.append(rectangle)

let circle = Circle(radius: 3)
shapes.append(circle)

shapes.forEach { shape in
    print("area of \(shape) is \(shape.area)")
}
