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
    
    private let imageView = UIImageView()
    
    private let nameLabel: UILabel = {
        let name = UILabel()
        name.font = name.font.withSize(fontsize)
        name.text = "name: "
        return name
    }()
    
    private let surnameLabel: UILabel = {
        let surname = UILabel()
        surname.font = surname.font.withSize(fontsize)
        surname.text = "surname: "
        return surname
    }()
    
    private let birthdayLabel: UILabel = {
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
    
    func setFields(surname: String, name: String?, birthday: String, image: UIImage?) {
        surnameLabel.text! += surname
        nameLabel.text! += name!
        birthdayLabel.text! += birthday
        imageView.image = image
    }
    
    override var frame: CGRect {
        didSet {
            let contentDistance = 20
            let labelHeight = 30
            let labelHeightWithSpace = labelHeight + contentDistance
            let contentWidth = Int(self.frame.size.width) - 2 * contentDistance
            var topBorderDistance = 80
            let imageHeight = 300
            
            if imageView.image != nil {
                imageView.frame = CGRect(x: contentDistance, y: topBorderDistance, width: contentWidth, height: imageHeight)
                topBorderDistance += imageHeight
            }
            
            surnameLabel.frame = CGRect(x: contentDistance, y: topBorderDistance, width: contentWidth, height: labelHeight)
            topBorderDistance += labelHeightWithSpace
            
            if nameLabel.text! != "name: " {
                nameLabel.frame = CGRect(x: contentDistance, y: topBorderDistance, width: contentWidth, height: labelHeight)
                topBorderDistance += labelHeightWithSpace
            }
            
            birthdayLabel.frame = CGRect(x: contentDistance, y:topBorderDistance, width: contentWidth, height: labelHeight)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
