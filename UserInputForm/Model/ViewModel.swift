//
//  ViewModel.swift
//  UserInputForm
//
//  Created by sm-user on 10.11.2017.
//  Copyright © 2017 Studio Mobile. All rights reserved.
//

import Foundation
private var dataContext = DataContext()
private var serializeService = SerializeService()

class ViewModel {
    func getData(index: Int) -> User {
        return dataContext.getUsers()[index]
    }
    
    func getData() -> [User] {
        return dataContext.getUsers()
    }
    
    func addData(user: User) {
        dataContext.addUser(user: user)
    }
    
    func getDataCount() ->Int {
        return dataContext.getUsers().count
    }
    
    func serializeData() {
        serializeService.encodeUsers(users: dataContext.getUsers())
    }
    
    func deserializeData() {
        dataContext.addUsers(users: serializeService.decodeUsers())
    }
}

