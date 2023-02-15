
import UIKit

extension UIBarButtonItem {
    static func createCustomButton(ViewController: UIViewController, selector: Selector) -> UIBarButtonItem {

        let button = UIButton(type: .system)
        button.setTitle("Назад", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17)
        button.tintColor = .systemBlue
        button.addTarget(ViewController, action: selector, for: .touchUpInside)

        let barItem = UIBarButtonItem(customView: button)
        return barItem
    }
}
