//
//  UserCardViewModel.swift
//  UserInputForm
//
//  Created by sm-user on 12.11.2017.
//  Copyright © 2017 Studio Mobile. All rights reserved.
//

import UIKit

class UserCardViewModel {
    var dataContext: DataContext
    
    init(dataContext: DataContext) {
        self.dataContext = dataContext
    }
    
    func getUserPropertiesForIndex(index: Int)->(String, String?, String) {
        let user = dataContext.getUsers()[index]
        return (surname: user.surname, name: user.name, birthday: user.birthDate)
    }
}
