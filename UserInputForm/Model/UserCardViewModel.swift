//
//  UserCardViewModel.swift
//  UserInputForm
//
//  Created by sm-user on 12.11.2017.
//  Copyright © 2017 Studio Mobile. All rights reserved.
//

import UIKit

class UserCardViewModel {
    let dataContext: DataContext
    let storageService: StorageService
    
    init(dataContext: DataContext, storageService: StorageService) {
        self.dataContext = dataContext
        self.storageService = storageService
    }
    
    func loadImage(index: Int) -> UIImage? {
        return storageService.loadImage(index: index)
    }
    
    func getUserPropertiesForIndex(index: Int)->(String, String?, String) {
        let user = dataContext.users[index]
        return (surname: user.surname, name: user.name, birthday: user.birthDate)
    }
}
