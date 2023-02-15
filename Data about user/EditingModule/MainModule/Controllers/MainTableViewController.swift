
import UIKit

final class MainTableViewController: UITableViewController {

    private var userModel = UserModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        getUserModel()

        tableView.register(
            MainTableViewCell.self,
            forCellReuseIdentifier: MainTableViewCell.idMainTableViewCell
        )
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


}

extension MainTableViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.idMainTableViewCell, for: indexPath) as? MainTableViewCell
        else {
            return UITableViewCell()
        }
        let nameFields = Resources.NameFields.allCases[indexPath.row].rawValue
        cell.configure(name: nameFields)

        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Resources.NameFields.allCases.count
    }
}

extension MainTableViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.row == 1 ? UITableView.automaticDimension : 44
    }
}

