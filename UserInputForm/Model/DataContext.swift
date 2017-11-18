import Foundation

class DataContext {
    
    private var users:[User] = []
    
    func getUsers()->[User] {
        return users
    }
    
    func addUser(user: User) {
        addUsers(users: [user])
    }
    
    func addUsers(users: [User]) {
        self.users += users
    }
}
