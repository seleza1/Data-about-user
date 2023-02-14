
import UIKit

final class GenderTextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        placeholder = "Введите данные"
        textAlignment = .right
        font = Resources.Fonts.avenirNextRegular(with: 16)
    }
}
