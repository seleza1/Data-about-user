
import UIKit

final class TextViewTableViewCell: UITableViewCell {

    static var idTextViewCell = "idTextViewCell"

    private let nameLabel = UILabel()
    private let nameTextView = NameTextView()

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
        contentView.addView(nameTextView)
    }

    public func configure(name: String) {
        nameLabel.text = name
    }
}

extension TextViewTableViewCell {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            nameLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.35),

            nameTextView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            nameTextView.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 10),
            nameTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            nameTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)
        ])
    }
}
