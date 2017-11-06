import Foundation

class User {
    var name: String?
    var surname: String
    var birthDate: String
    
    init(surname: String, birthDate: String) {
        self.surname = surname
        self.birthDate = birthDate
    }
    
    init(surname: String, name: String, birthDate: String) {
        self.name = name
        self.birthDate = birthDate
        self.surname = surname
    }
}
