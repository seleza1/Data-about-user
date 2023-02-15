import UIKit

final class EditingViewController: UIViewController {

    private let editingTableView = EditingTableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setConstraints()
    }

    private func setupView() {
        title = "Редактировать"
        view.backgroundColor = .white


        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Сохранить",
            style: .plain,
            target: self,
            action: #selector(editingTapped)
        )
        view.addView(editingTableView)

    }

    @objc func editingTapped() {
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
