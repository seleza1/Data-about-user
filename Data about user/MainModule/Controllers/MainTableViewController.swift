
import UIKit

final class MainTableViewController: UITableViewController {

    private var userModel = UserModel()
    private var valueArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        getUserModel()
        setValueArray()

        tableView.register(MainTableViewCell.self )
    }

    private func setupView() {
        title = "Просмотр"
        view.backgroundColor = .white

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Редактировать",
            style: .plain,
            target: self,
            action: #selector(editingTapped)
        )
    }

    @objc func editingTapped() {
        let editingVC = EditingViewController(userModel)
        navigationController?.pushViewController(editingVC, animated: true)
    }

    private func getUserModel() {
        userModel = UserDefaultsHelper.getUserModel()
    }

    private func saveEditModel(model: UserModel) {
        UserDefaultsHelper.saveUserValue(Resources.NameFields.firstName.rawValue, model.firstName)
        UserDefaultsHelper.saveUserValue(Resources.NameFields.secondName.rawValue, model.secondName)
        UserDefaultsHelper.saveUserValue(Resources.NameFields.thirdName.rawValue, model.thirdName)
        UserDefaultsHelper.saveUserValue(Resources.NameFields.birthday.rawValue, model.birthday)
        UserDefaultsHelper.saveUserValue(Resources.NameFields.gender.rawValue, model.gender)

    }

    public func changeUserModel(model: UserModel) {
        saveEditModel(model: model)
        userModel = model
        setValueArray()
        tableView.reloadData()
    }
}

extension MainTableViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(MainTableViewCell.self) else {
            return UITableViewCell()
        }
        let nameFields = Resources.NameFields.allCases[indexPath.row].rawValue
        let value = valueArray[indexPath.row]
        cell.configure(name: nameFields, value: value )

        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Resources.NameFields.allCases.count
    }

    public func setValueArray(_ array: [String]) {
        valueArray = array
    }

    public func getValueArray() -> [String] {
        var valueArray = [String]()

        for key in Resources.NameFields.allCases {
            let value = UserDefaultsHelper.getUserValue(key.rawValue)
            valueArray.append(value)
        }
        return valueArray
    }

    private func setValueArray() {
        let valueArray = getValueArray()
        setValueArray(valueArray)
        tableView.reloadData()
    }
}

extension MainTableViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.row == 1 ? UITableView.automaticDimension : 44
    }
}

