import Foundation

class User {
    var name: String
    var surname: String?
    var birthDate: String
    
    init(name: String, birthDate: String) {
        self.name = name
//        let formatter = DateFormatter()
//        formatter.dateFormat = "dd:MM:yy"
//        let someDateTime = formatter.date(from: "2016/10/08 22:31")
        self.birthDate = birthDate
    }
    
    init(name: String, surname: String, birthDate: String) {
        self.name = name
        self.birthDate = birthDate
        self.surname = surname
    }
}
