//
//  UserCardView.swift
//  UserInputForm
//
//  Created by sm-user on 11.11.2017.
//  Copyright © 2017 Studio Mobile. All rights reserved.
//

import UIKit
let fontsize = CGFloat(integerLiteral: 20)

class UserCardView: UIView {
    
    private var imageView: UIImageView {
        let image = UIImageView()
        return image
    }
    
    private var nameLabel: UILabel = {
        let name = UILabel()
        name.font = name.font.withSize(fontsize)
        name.text = "name: "
        return name
    }()
    
    private var surnameLabel: UILabel = {
        let surname = UILabel()
        surname.font = surname.font.withSize(fontsize)
        surname.text = "surname: "
        return surname
    }()
    
    private var birthdayLabel: UILabel = {
        let birthday = UILabel()
        birthday.font = birthday.font.withSize(fontsize)
        birthday.text = "date of birth: "
        return birthday
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(nameLabel)
        addSubview(surnameLabel)
        addSubview(birthdayLabel)
        addSubview(imageView)
    }
    
    func setFields(surname: String, name: String?, birthday: String) {
        surnameLabel.text! += surname
        nameLabel.text! += name!
        birthdayLabel.text! += birthday
    }
    
    override var frame: CGRect {
        
        didSet {
            let contentDistance = 20
            let contentWidth = Int(self.frame.size.width) - 2 * contentDistance
            
            imageView.frame = CGRect(x: contentDistance, y: 80, width: contentWidth, height: 300)
            surnameLabel.frame = CGRect(x: contentDistance, y: 400, width: contentWidth, height: 30)
            nameLabel.frame = CGRect(x: contentDistance, y: 450, width: contentWidth, height: 30)
            birthdayLabel.frame = CGRect(x: contentDistance, y:500, width: contentWidth, height: 30)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
