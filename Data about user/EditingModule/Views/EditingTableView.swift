
import UIKit

final class EditingTableView: UITableView {

    private var userModel = UserModel()

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)

        register(TextViewTableViewCell.self)
        register(DatePickerTableViewCell.self)
        register(PickerViewTableViewCell.self)

        delegate = self
        dataSource = self

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func setUserModel(_ model: UserModel) {
        userModel = model

    }
}

extension EditingTableView: UITableViewDataSource {
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let nameFields = Resources.NameFields.allCases[indexPath.row].rawValue

        switch indexPath.row {
        case 0...2:
            guard let cell = self.dequeueReusableCell(TextViewTableViewCell.self) else {
                return UITableViewCell()
            }
            cell.nameTextViewDelegate = self

            switch indexPath.row {
            case 0: cell.configure(name: nameFields, scrollEnabled: true, value: userModel.firstName)
            case 1: cell.configure(name: nameFields, scrollEnabled: false, value: userModel.secondName)
            default:
                cell.configure(name: nameFields, scrollEnabled: true, value: userModel.thirdName)
            }
            return cell
        case 3:
            guard let cell = self.dequeueReusableCell(DatePickerTableViewCell.self) else {
                return UITableViewCell()
            }
                cell.configure(name: nameFields)
            return cell
        case 4:
            guard let cell = self.dequeueReusableCell(PickerViewTableViewCell.self) else {
                return UITableViewCell()
            }
                cell.configure(name: nameFields)
            return cell
        default:
            return UITableViewCell()
        }
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Resources.NameFields.allCases.count
    }
}

extension EditingTableView: UITableViewDelegate {
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.row == 1 ? UITableView.automaticDimension : 44
    }
}

extension EditingTableView: NameTextViewProtocol {
    func changeSize() {
        beginUpdates()
        endUpdates()
    }
}
