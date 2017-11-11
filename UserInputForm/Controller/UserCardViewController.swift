//
//  UserCardViewController.swift
//  UserInputForm
//
//  Created by sm-user on 11.11.2017.
//  Copyright © 2017 Studio Mobile. All rights reserved.
//

import UIKit

class UserCardViewController: UIViewController  {
    
    var viewAsCard: UserCardView {
        get {
            return view as! UserCardView
        }
    }
    
    override func loadView() {
        view = UserCardView()
        view.backgroundColor = .white
    }
}
