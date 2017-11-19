import Foundation

class DataContext {
    
    private(set) var users:[User] = []
    
    func addUser(user: User) {
        addUsers(users: [user])
    }
    
    func addUsers(users: [User]) {
        self.users += users
    }
}
