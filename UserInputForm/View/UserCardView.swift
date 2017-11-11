//
//  UserCardView.swift
//  UserInputForm
//
//  Created by sm-user on 11.11.2017.
//  Copyright © 2017 Studio Mobile. All rights reserved.
//

import UIKit


class UserCardView: UIView {
    
    private var nameLabel = UILabel()
    private var surnameLabel = UILabel()
    private var birthdayLabel = UILabel()
    private var image = UIImage()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
