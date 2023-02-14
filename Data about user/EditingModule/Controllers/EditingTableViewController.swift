import UIKit

final class EditingTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        tableView.register(TextViewTableViewCell.self, forCellReuseIdentifier: TextViewTableViewCell.idTextViewCell)
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
    }

    @objc func editingTapped() {
        print("da")
    }


}

extension EditingTableViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TextViewTableViewCell.idTextViewCell, for: indexPath) as? TextViewTableViewCell
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

extension EditingTableViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.row == 1 ? UITableView.automaticDimension : 44
    }
}
