import UIKit

final class EditingViewController: UITableViewController {

    private let editingTableView = EditingTableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        

    }

    private func setupView() {
        title = "Редактировать"
        view.backgroundColor = .white
        view.addView(editingTableView)

        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Сохранить",
            style: .plain,
            target: self,
            action: #selector(editingTapped)
        )
    }

    @objc func editingTapped() {
        print("da")
    }
}
