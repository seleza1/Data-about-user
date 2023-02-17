
import UIKit

final class PickerViewTableViewCell: UITableViewCell {

    static var idPickerViewCell = "idPickerViewCell"

    private let nameLabel = UILabel()
    private let genderTextField = GenderTextField()
    private let genderPickerView = GenderPickerView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setConstraints()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        selectionStyle = .none
        nameLabel.font = Resources.Fonts.avenirNextRegular(with: 16)
        addView(nameLabel)
        genderTextField.inputView = genderPickerView
        contentView.addView(genderTextField)
        genderPickerView.genderDelegate = self
    }

    public func configure(name: String, value: String) {
        nameLabel.text = name
        genderTextField.text = value
    }
}

extension PickerViewTableViewCell: GenderPickerViewProtocol {
    func didSelect(row: Int) {
        genderTextField.text = Resources.Gender.allCases[row].rawValue
        genderTextField.resignFirstResponder()
    }
}

extension PickerViewTableViewCell {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            nameLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.35),

            genderTextField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            genderTextField.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 10),
            genderTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            genderTextField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
            

        ])
    }
}
