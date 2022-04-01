import PlaygroundSupport
import UIKit

class Theme {
    weak var dataSource: ColorChooserDataSource?

    var index = 0

    func getName(_ index: Int) -> String? {
        self.index = index % (dataSource?.numberOfColors() ?? 1)
        return dataSource?.nameOfColor(for: self.index)
    }

    func getColor(_ index: Int) -> UIColor? {
        self.index = index % (dataSource?.numberOfColors() ?? 1)
        return dataSource?.colorOfColor(for: self.index)
    }
}

class ViewController: UIViewController, ColorChooserDelegate, ColorChooserDataSource {
    let theme = Theme()

    var count = 0
    let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 44))

    private let names = ["red", "green", "blue", "purple"]
    private let colors = [UIColor.red, .green, .blue, .purple]

    override func viewDidLoad() {
        super.viewDidLoad()

        theme.dataSource = self

        view.backgroundColor = colorOfColor(for: count)

        button.setTitle("Color Choice", for: .normal)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 22
        button.center = view.center
        button.addTarget(self, action: #selector(changeColor(sender:)), for: .touchUpInside)
        view.addSubview(button)
    }

    deinit {
        theme.dataSource = nil
    }

    @IBAction func changeColor(sender: UIButton) {
        let destination = ColorChooserViewController()
        destination.currentColor = count
        destination.delegate = self
        present(destination, animated: true)
    }

    func colorChooser(didChooseColor color: Int) {
        count = color
        view.backgroundColor = colorOfColor(for: count)
    }

    func numberOfColors() -> Int {
        return names.count
    }

    func nameOfColor(for index: Int) -> String {
        return names[index]
    }

    func colorOfColor(for index: Int) -> UIColor {
        return colors[index]
    }
}

class ColorChooserViewController: UIViewController, ColorChooserDataSource {
    let theme = Theme()

    var currentColor = 0

    private let names = ["red", "green", "blue", "purple"]
    private let colors = [UIColor.red, .green, .blue, .purple]

    weak var delegate: ColorChooserDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        theme.dataSource = self

        let chooser = UISegmentedControl(items: names)
        chooser.frame = CGRect(x: 20, y: 0, width: view.frame.width - 40, height: 44)
        chooser.addTarget(self, action: #selector(choose(_:)), for: .valueChanged)
        chooser.tintColor = .black
        view.addSubview(chooser)

        view.backgroundColor = colorOfColor(for: currentColor)
    }

    deinit {
        theme.dataSource = nil
    }

    @objc func choose(_ sender: UISegmentedControl) {
        currentColor = sender.selectedSegmentIndex
        let color = colorOfColor(for: currentColor)
        view.backgroundColor = color

        delegate?.colorChooser(didChooseColor: currentColor)

        dismiss(animated: true) {
            self.delegate = nil
        }
    }

    func numberOfColors() -> Int {
        return names.count
    }

    func nameOfColor(for index: Int) -> String {
        return names[index]
    }

    func colorOfColor(for index: Int) -> UIColor {
        return colors[index]
    }
}

protocol ColorChooserDelegate: AnyObject {
    func colorChooser(didChooseColor color: Int)
}

protocol ColorChooserDataSource: AnyObject {
    func numberOfColors() -> Int
    func nameOfColor(for index: Int) -> String
    func colorOfColor(for index: Int) -> UIColor
}

PlaygroundPage.current.liveView = ViewController()
