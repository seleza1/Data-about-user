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

    }

    @objc func saveTapped() {
        print("da")
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
