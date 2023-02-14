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
        

        switch indexPath.row {
        case 0...2:
            let nameFields = Resources.NameFields.allCases[indexPath.row].rawValue
            cell.nameTextViewDelegate = self
            if indexPath.row == 1 {
                cell.configure(name: nameFields, scrollEnabled: false)
            } else {
                cell.configure(name: nameFields, scrollEnabled: true)

            }

            return cell
        default:
            return UITableViewCell()
        }

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

extension EditingTableViewController: NameTextViewProtocol {
    func changeSize() {
        tableView.beginUpdates()
        tableView.endUpdates()
    }


}
