//
//  SerializeService.swift
//  UserInputForm
//
//  Created by sm-user on 10.11.2017.
//  Copyright © 2017 Studio Mobile. All rights reserved.
//

import Foundation

let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
let url = URL(fileURLWithPath: documentsPath + "/users.json")

class SerializeService {
    
    
    func encodeUsers(users: [User]) {
        try! JSONEncoder().encode(users).write(to: url)
    }
    
    func decodeUsers()->[User] {
        do {
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode([User].self, from: data)
        } catch {
            print("Can't load the data from JSON file.")
        }
        return []
    }
}
