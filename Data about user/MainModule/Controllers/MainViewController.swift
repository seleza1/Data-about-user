
import UIKit

final class MainViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.idMainTableViewCell)
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
        print("da")
    }


}

extension MainViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.idMainTableViewCell, for: indexPath) as? MainTableViewCell else {
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

extension MainViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.row == 1 ? UITableView.automaticDimension : 44
    }
}
