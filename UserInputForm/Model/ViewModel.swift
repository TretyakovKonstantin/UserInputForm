import UIKit

class ViewModel {
    let dataContext: DataContext
    let storageService: StorageService
    
    init(dataContext: DataContext, storageService: StorageService) {
        self.dataContext = dataContext
        self.storageService = storageService
    }
    
    func getUser(index: Int) -> User {
        return getUsers()[index]
    }
    
    func getUsers() -> [User] {
        return dataContext.users
    }
    
    func saveImage(image: UIImage) {
        storageService.saveImage(image: image, index: getUsersCount())
    }
    
    func loadImage(index: Int) -> UIImage? {
        return storageService.loadImage(index: index)
    }
    
    func addUser(user: User) {
        dataContext.addUser(user: user)
    }
    
    func getUsersCount() ->Int {
        return dataContext.users.count
    }
    
    func saveData() {
        storageService.encodeUsers(users: dataContext.users)
    }
    
    func loadData() {
        dataContext.addUsers(users: storageService.decodeUsers())
    }
}

