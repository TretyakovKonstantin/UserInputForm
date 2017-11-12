//
//  UserCardView.swift
//  UserInputForm
//
//  Created by sm-user on 11.11.2017.
//  Copyright © 2017 Studio Mobile. All rights reserved.
//

import UIKit


class UserCardView: UIView {
    
    private var image = UILabel()
    private var nameLabel = UILabel()
    private var surnameLabel = UILabel()
    private var birthdayLabel = UILabel()
   
    override init(frame: CGRect) {
        super.init(frame: frame)
//        if let filePath = Bundle.main.path(forResource: "imageName", ofType: "jpg"), let image = UIImage(contentsOfFile: filePath) {
//            self.image = image
//        }
        addSubview(nameLabel)
        addSubview(surnameLabel)
        addSubview(birthdayLabel)
        addSubview(image)
        
        image.backgroundColor = .red
    }
    
    func setFields(surname: String, name: String?, birthday: String) {
        surnameLabel.text = surname
        nameLabel.text = name
        birthdayLabel.text = birthday
    }
    
    override var frame: CGRect {
        didSet {
            image.frame = CGRect(x: 20, y: 20, width: 300, height: 300)
            surnameLabel.frame = CGRect(x: 20, y: 320, width: 300, height: 30)
            nameLabel.frame = CGRect(x: 20, y: 370, width: 300, height: 30)
            birthdayLabel.frame = CGRect(x:20, y:420, width: 300, height: 30)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
