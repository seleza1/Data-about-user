
import UIKit

extension UIViewController {
    func presentSimpleAlert(title: String, message: String?) {

        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "Ok", style: .cancel)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }

    func presentChangeAlert(completion: @escaping (Bool) -> Void) {
        let alertController = UIAlertController(
            title: "Данные были изменены",
            message: "Вы желаете сохранить изменения, в противном случае внесенные правки будут отменены",
            preferredStyle: .alert
        )
        let saveAction = UIAlertAction(title: "Сохранить", style: .default) { _ in
            completion(true)
        }

        let skipAction = UIAlertAction(title: "Пропустить", style: .default) { _ in
            completion(false)
        }
        alertController.addAction(saveAction)
        alertController.addAction(skipAction)
        present(alertController, animated: true)
    }
}
