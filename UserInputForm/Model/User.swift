import UIKit

class User: Codable {
    var name: String?
    var surname: String
    var birthDate: String
    
    init(surname: String, name: String, birthDate: String) {
        self.name = name
        self.birthDate = birthDate
        self.surname = surname
    }
}
