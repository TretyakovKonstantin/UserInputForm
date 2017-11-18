import UIKit

class ViewModel {
    let dataContext: DataContext
    let serializeService: SerializeService
    
    init(dataContext: DataContext, serializeService: SerializeService) {
        self.dataContext = dataContext
        self.serializeService = serializeService
    }
    
    func getUser(index: Int) -> User {
        return getUsers()[index]
    }
    
    func getUsers() -> [User] {
        return dataContext.getUsers()
    }
    
    func saveImage(image: UIImage) {
        serializeService.saveImage(image: image, index: getUsersCount())
    }
    
    func loadImage(index: Int) -> UIImage? {
        return serializeService.loadImage(index: index)
    }
    
    func addData(user: User) {
        dataContext.addUser(user: user)
    }
    
    func getUsersCount() ->Int {
        return dataContext.getUsers().count
    }
    
    func saveData() {
        serializeService.encodeUsers(users: dataContext.getUsers())
    }
    
    func loadData() {
        dataContext.addUsers(users: serializeService.decodeUsers())
    }
}

