//
//  DataContext.swift
//  UserInputForm
//
//  Created by sm-user on 10.11.2017.
//  Copyright © 2017 Studio Mobile. All rights reserved.
//

import Foundation

class DataContext {
    
    private var users:[User] = []
    
    func getUsers()->[User] {
        return users
    }
    
    func addUser(user: User) {
        users += [user]
    }
    
    func addUsers(users: [User]) {
        self.users += users
    }
}
