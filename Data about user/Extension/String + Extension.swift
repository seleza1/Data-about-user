
import Foundation

extension String {
    func getDateFromString() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.YYYY"
        let date = dateFormatter.date(from: self) ?? Date()
        
        return date
    }
}
