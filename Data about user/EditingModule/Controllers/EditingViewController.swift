import UIKit

final class EditingViewController: UIViewController {

    private let editingTableView = EditingTableView()
    private var userModel = UserModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setConstraints()
        print(userModel)
    }

    init(_ userModel: UserModel) {
        self.userModel = userModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        title = "Редактировать"
        view.backgroundColor = .white

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Сохранить",
            style: .plain,
            target: self,
            action: #selector(saveTapped)
        )
        view.addView(editingTableView)
        editingTableView.setUserModel(userModel)
        let backBarButtonItem = UIBarButtonItem.createCustomButton(ViewController: self, selector: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = backBarButtonItem

    }

    @objc func saveTapped() {
//        let editUserModel = editingTableView.getUserModel()
//        print(editUserModel == userModel )
        
        if authFields() {
            presentSimpleAlert(title: "Выполнено", message: "ВсЁ ок")
        } else {
            presentSimpleAlert(title: "Ошибка", message: "Заполните ФИО, дата рождения, пол")
        }


    }

    @objc func backButtonTapped() {

        let editUserModel = editingTableView.getUserModel()

        if editUserModel == userModel {
            navigationController?.popViewController(animated: true)
        } else {
            presentChangeAlert { [weak self] value in
                if value {
                    guard let firstVC = self?.navigationController?.viewControllers.first as? MainTableViewController else {
                        return
                    }
                    firstVC.changeUserModel(model: editUserModel)
                    self?.navigationController?.popViewController(animated: true)
                } else {
                    self?.navigationController?.popViewController(animated: false)
                }
            }
        }
    }

    private func authFields() -> Bool {
        if userModel.firstName != "" ||
            userModel.secondName != "" ||
            userModel.birthday != "" ||
            userModel.gender != "" ||
            userModel.gender != "Не указано" {
            return true
        }
        return false
    }
}

extension EditingViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            editingTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            editingTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            editingTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            editingTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}
