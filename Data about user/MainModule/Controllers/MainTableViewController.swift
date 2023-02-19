
import UIKit

final class MainTableViewController: UITableViewController {

    private var userModel = UserModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        getUserModel()

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
        tableView.reloadData()
    }
}



