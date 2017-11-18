//
//  UserCell.swift
//  UserInputForm
//
//  Created by sm-user on 09.11.2017.
//  Copyright © 2017 Studio Mobile. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    private let surnameLabel = UILabel()
    private let birthDateLabel = UILabel()
    private var nameLabel = UILabel()
    private var contentHeight = 0
    
    let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(surnameLabel)
        contentView.addSubview(birthDateLabel)
        contentView.addSubview(nameLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fillInFields(surname: String, name: String?, dateOfBirth: String, image: UIImage?) {
        surnameLabel.text = surname
        nameLabel.text = name
        birthDateLabel.text = dateOfBirth
        userImageView.image = image
        if (name != nil && name != "") || image != nil {
            contentHeight = 80
        }
    }
    
    override var frame: CGRect {
        didSet {
            let space = 10
            let imageSize = 60
            let labelWidth = 150
            let labelHeight = 30
            var birthdayLabelY = 0
            var spaceBeforeLabels = 10
            
            if surnameLabel.text != nil && surnameLabel.text! != "" {
                birthdayLabelY = 20
            }
            if userImageView.image != nil {
                spaceBeforeLabels = 80
            }
            surnameLabel.frame = CGRect(x: spaceBeforeLabels, y: 0, width: labelWidth, height: labelHeight)
            nameLabel.frame = CGRect(x: spaceBeforeLabels, y: 40, width: labelWidth, height: labelHeight)
            userImageView.frame = CGRect(x:space, y: 20, width: imageSize, height: imageSize)
            birthDateLabel.frame = CGRect(x: Int(frame.width) - (labelWidth + space), y: birthdayLabelY, width: labelWidth, height: labelHeight)
        }
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: size.width, height: CGFloat(contentHeight))
    }
}

