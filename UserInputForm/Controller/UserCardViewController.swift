//
//  UserCardViewController.swift
//  UserInputForm
//
//  Created by sm-user on 11.11.2017.
//  Copyright © 2017 Studio Mobile. All rights reserved.
//

import UIKit

class UserCardViewController: UIViewController  {
    
    private let userCardViewModel: UserCardViewModel
    private let currentUserIndex: Int
    
    var viewAsCard: UserCardView {
        get {
            return view as! UserCardView
        }
    }
    
    init(dataContext: DataContext, userIndex: Int) {
        userCardViewModel = UserCardViewModel(dataContext: dataContext)
        currentUserIndex = userIndex
        super.init(nibName: "PhotoDetailViewController2", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = UserCardView()
        let userProperties: (surname: String, name: String?, birthday: String) = userCardViewModel.getUserPropertiesForIndex(index: currentUserIndex)
        viewAsCard.setFields(surname: userProperties.surname, name: userProperties.name, birthday: userProperties.birthday)
        view.backgroundColor = .white
    }
}
