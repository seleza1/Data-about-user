
import UIKit

final class GenderPickerView: UIPickerView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        delegate = self
        dataSource = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GenderPickerView: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        <#code#>
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        <#code#>
    }


}

extension GenderPickerView: UIPickerViewDelegate {
    
}
