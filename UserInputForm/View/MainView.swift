//
//  MainView.swift
//  UserInputForm
//
//  Created by sm-user on 19.11.2017.
//  Copyright © 2017 Studio Mobile. All rights reserved.
//

import UIKit

class MainView: UIView {
    let inputUserView = InputUserView()
    let userTableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(inputUserView)
        addSubview(userTableView)
        backgroundColor = .white
    }
    
    func assignActions(userButtonAction: @escaping (UIButton!)->(), takePhotoAction: @escaping (UIButton!)->()) {
        inputUserView.assignSubmitButtonAction(action: userButtonAction)
        inputUserView.assignTakePhotoButtonAction(action: takePhotoAction)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var frame: CGRect {
        didSet {
            let inputViewHeight = 220
            let frameWidth = Int(UIScreen.main.bounds.width)
            let frameHeight = Int(UIScreen.main.bounds.height)
            let topBorderDistance = 60
            
            inputUserView.frame = CGRect(x: 0, y: topBorderDistance, width: frameWidth, height: inputViewHeight)
            userTableView.frame = CGRect(x: 0, y: 280, width: frameWidth, height: frameHeight - (inputViewHeight + topBorderDistance))
        }
    }
}
