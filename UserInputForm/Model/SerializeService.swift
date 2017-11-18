//
//  SerializeService.swift
//  UserInputForm
//
//  Created by sm-user on 10.11.2017.
//  Copyright © 2017 Studio Mobile. All rights reserved.
//

import UIKit

let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
let url = URL(fileURLWithPath: documentsPath + "/users.json")

class SerializeService {
    
    
    func encodeUsers(users: [User]) {
        try! JSONEncoder().encode(users).write(to: url)
    }
    
    func saveImage(image: UIImage, index: Int) {
        let imageURL = URL(fileURLWithPath: documentsPath + "/userImage\(index).jpg")
        try! UIImageJPEGRepresentation(image, 1.0)?.write(to: imageURL)
        print("saved photo \(index)")
    }
    
    func loadImage(index: Int) -> UIImage? {
        let imageURL = URL(fileURLWithPath: documentsPath + "/userImage\(index).jpg")
        return UIImage(contentsOfFile: imageURL.path)
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
