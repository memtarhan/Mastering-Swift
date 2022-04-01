import PlaygroundSupport
import UIKit

class Colors {
    var index = 0
    private let names = ["red", "green", "blue", "purple"]
    private let colors = [UIColor.red, .green, .blue, .purple]

    func getName(_ index: Int) -> String {
        return names[index % names.count]
    }

    func getColor(_ index: Int) -> UIColor {
        return colors[index % colors.count]
    }

    var allNames: [String] { names }
    var count: Int { names.count }
}

class ViewController: UIViewController, ColorChooserDelegate {
    var count = 0
    var colors = Colors()
    let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 44))

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = colors.getColor(count)

        button.setTitle("Color Choice", for: .normal)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 22
        button.center = view.center
        button.addTarget(self, action: #selector(changeColor(sender:)), for: .touchUpInside)
        view.addSubview(button)
    }

    @IBAction func changeColor(sender: UIButton) {
        let destination = ColorChooserViewController()
        destination.currentColor = count
        destination.delegate = self
        present(destination, animated: true)
    }

    func colorChooser(didChooseColor color: Int) {
        count = color
        view.backgroundColor = colors.getColor(count)
    }
}

class ColorChooserViewController: UIViewController {
    var colors = Colors()
    var currentColor = 0

    weak var delegate: ColorChooserDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        let chooser = UISegmentedControl(items: colors.allNames)
        chooser.frame = CGRect(x: 20, y: 0, width: view.frame.width - 40, height: 44)
        chooser.addTarget(self, action: #selector(choose(_:)), for: .valueChanged)
        chooser.tintColor = .black
        view.addSubview(chooser)

        view.backgroundColor = colors.getColor(currentColor)
    }

    @objc func choose(_ sender: UISegmentedControl) {
        currentColor = sender.selectedSegmentIndex
        let color = colors.getColor(currentColor)
        view.backgroundColor = color

        delegate?.colorChooser(didChooseColor: currentColor)

        dismiss(animated: true) {
            self.delegate = nil
        }
    }
}

protocol ColorChooserDelegate: AnyObject {
    func colorChooser(didChooseColor color: Int)
}

PlaygroundPage.current.liveView = ViewController()
