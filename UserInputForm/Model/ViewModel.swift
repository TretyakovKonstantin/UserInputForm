//
//  ViewModel.swift
//  UserInputForm
//
//  Created by sm-user on 10.11.2017.
//  Copyright © 2017 Studio Mobile. All rights reserved.
//

import Foundation
private var dataContext = DataContext()

class ViewModel {
    func getData(index: Int)->User {
        return dataContext.getUsers()[index]
    }
    
    func addData(user: User) {
        dataContext.addUser(user: user)
    }
    
    func getDataCount() ->Int {
        return dataContext.getUsers().count
    }
}

