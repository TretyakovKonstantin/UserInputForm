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
    let serializeService: SerializeService
    
    init(dataContext: DataContext, serializeService: SerializeService) {
        self.dataContext = dataContext
        self.serializeService = serializeService
    }
    
    func loadImage(index: Int) -> UIImage? {
        return serializeService.loadImage(index: index)
    }
    
    func getUserPropertiesForIndex(index: Int)->(String, String?, String) {
        let user = dataContext.getUsers()[index]
        return (surname: user.surname, name: user.name, birthday: user.birthDate)
    }
}
