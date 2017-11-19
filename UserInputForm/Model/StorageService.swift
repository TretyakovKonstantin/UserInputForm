import UIKit

let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
let url = URL(fileURLWithPath: documentsPath)
let usersURL = url.appendingPathComponent("/users.json")

class StorageService {
    
    func saveImage(image: UIImage, index: Int) {
        let imageURL = URL(fileURLWithPath: documentsPath).appendingPathComponent("/userImage\(index).jpg")
        try! UIImageJPEGRepresentation(image, 1.0)?.write(to: imageURL)
        print("saved photo \(index)")
    }
    
    func loadImage(index: Int) -> UIImage? {
        let imageURL = URL(fileURLWithPath: documentsPath).appendingPathComponent("/userImage\(index).jpg")
        return UIImage(contentsOfFile: imageURL.path)
    }
    
    func encodeUsers(users: [User]) {
        try! JSONEncoder().encode(users).write(to: usersURL)
    }
    
    func decodeUsers()->[User] {
        do {
            let data = try Data(contentsOf: usersURL)
            return try JSONDecoder().decode([User].self, from: data)
        } catch {
            print("Can't load the data from JSON file.")
        }
        return []
    }
}
