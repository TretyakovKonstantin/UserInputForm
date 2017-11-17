//
//  UserCell.swift
//  UserInputForm
//
//  Created by sm-user on 09.11.2017.
//  Copyright © 2017 Studio Mobile. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    private let surName = UILabel()
    private let birthDateLabel = UILabel()
    private var nameLabel = UILabel()
    private let userImageView = UIImageView()
    
    private var hasSurname = false
    private var hasPicture = false
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(surName)
        contentView.addSubview(birthDateLabel)
        contentView.addSubview(nameLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fillInFields(surname: String, dateOfBirth: String) {
        surName.text = surname
        birthDateLabel.text = dateOfBirth
    }
    
    func fillInFields(surname: String, name: String, dateOfBirth: String) {
        fillInFields(surname: surname, dateOfBirth: dateOfBirth)
        nameLabel.text = name
        hasSurname = true
    }
    
    override var frame: CGRect {
        
        didSet {
            var birthdayLabelY = 0
            surName.frame = CGRect(x: 100, y: 0, width: 150, height: 30)
            if (hasSurname) {
                nameLabel.frame = CGRect(x: 100, y: 40, width: 150, height: 30)
                birthdayLabelY = 20
            }
            birthDateLabel.frame = CGRect(x: frame.width - 170, y: CGFloat(birthdayLabelY), width: 150, height: 30)
        }
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        if hasSurname {
            return CGSize(width: size.width, height: size.height + 80)
        } else {
            return size
        }
    }
}

