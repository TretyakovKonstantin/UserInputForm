import UIKit

class User: Codable {
    var name: String?
    var surname: String
    var birthDate: String
//    var photo: UIImage
    
//    init(surname: String, birthDate: String) {
//        self.surname = surname
//        self.birthDate = birthDate
//    }
    
    init(surname: String, name: String, birthDate: String) {
        self.name = name
        self.birthDate = birthDate
        self.surname = surname
//        self.photo = photo
    }
}
