
import UIKit

final class MainTableViewCell: UITableViewCell {

    private let nameLabel: UILabel = {
        let label = UILabel()


        return label
    }()

    static var idMainTableViewCell = "idMainTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        addView(nameLabel)

    }
}

