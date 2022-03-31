import PlaygroundSupport
import UIKit

class Colors {
    var index = 0
    private let names = ["red", "green", "blue", "purple"]
    private let colors = [UIColor.red, .green, .blue, .purple]

    func getName(_ index: Int) -> String {
        return names[index]
    }

    func getColor(_ index: Int) -> UIColor {
        return colors[index]
    }

    var count: Int {
        return names.count
    }
}

class ViewController: UIViewController {
    var count = 0
    var colors = Colors()
    let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 44))

    override func viewDidLoad() {
        super.viewDidLoad()

        let index = count % colors.count
        view.backgroundColor = colors.getColor(index)

        button.setTitle("Color Choice", for: .normal)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 22
        button.center = view.center
        button.addTarget(self, action: #selector(changeColor(sender:)), for: .touchUpInside)
        view.addSubview(button)
    }

    @IBAction func changeColor(sender: UIButton) {
        count += 1
        let index = count % colors.count

        view.backgroundColor = colors.getColor(index)
    }
}

PlaygroundPage.current.liveView = ViewController()
