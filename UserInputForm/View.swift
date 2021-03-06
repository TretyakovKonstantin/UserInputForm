//
//  View.swift
//  UserInputForm
//
//  Created by User on 08/11/2017.
//  Copyright © 2017 Studio Mobile. All rights reserved.
//



class UserCell: UITableViewCell {
    private let surName = UILabel()
    private let birthDateLabel = UILabel()
    private var nameLabel = UILabel()
    private var isExpanded = false
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(surName)
        contentView.addSubview(birthDateLabel)
        contentView.addSubview(nameLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setFields(surname: String, dateOfBirth: String) {
        surName.text = surname
        birthDateLabel.text = dateOfBirth
    }
    
    func setFields(surname: String, name: String, dateOfBirth: String) {
        setFields(surname: surname, dateOfBirth: dateOfBirth)
        nameLabel.text = name
        isExpanded = true
    }
    
    override var frame: CGRect {
        didSet {
            var birthdayLabelY = 0
            surName.frame = CGRect(x: 20, y: 0, width: 150, height: 30)
            if (isExpanded) {
                nameLabel.frame = CGRect(x: 20, y: 40, width: 150, height: 30)
                birthdayLabelY = 20
            }
            birthDateLabel.frame = CGRect(x: frame.width - 170, y: CGFloat(birthdayLabelY), width: 150, height: 30)
        }
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        if isExpanded {
            return CGSize(width: size.width, height: size.height + 80)
        } else {
            return size
        }
    }
}

