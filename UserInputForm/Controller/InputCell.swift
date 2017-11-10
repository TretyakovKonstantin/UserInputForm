//
//  InputCell.swift
//  UserInputForm
//
//  Created by sm-user on 09.11.2017.
//  Copyright © 2017 Studio Mobile. All rights reserved.
//

import UIKit
class InputCell: UITableViewCell {
    private let nameTextField = UITextField()
    private let surnameTextField = UITextField()
    private let  birthdateTextField = UITextField()
    private let submitButton = UIButton()
    private var action: ((UIButton)->())?
    
    @objc private func addUserButtonAction(sender: UIButton!) {
        action!(sender)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(nameTextField)
        contentView.addSubview(surnameTextField)
        
        let birthdayPicker = UIDatePicker()
        birthdayPicker.datePickerMode = .date
        birthdayPicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        birthdateTextField.inputView = birthdayPicker
        
        contentView.addSubview(birthdateTextField)
        contentView.addSubview(submitButton)
        
        nameTextField.borderStyle = .roundedRect
        nameTextField.placeholder = "name"
        
        surnameTextField.borderStyle = .roundedRect
        surnameTextField.placeholder = "surname"
        
        birthdateTextField.borderStyle = .roundedRect
        birthdateTextField.placeholder = "date of birth"
        submitButton.backgroundColor = .blue
        submitButton.setTitle("addUser", for: .normal)
        
        self.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 250/255, alpha: 1)
    }
    
    func setButtonAction(action: @escaping (UIButton!)->()) {
        self.action = action
        submitButton.addTarget(self, action: #selector(addUserButtonAction), for: .touchDown)
        
    }
    
    func emptyAllTextFields() {
        surnameTextField.text = ""
        nameTextField.text = ""
        birthdateTextField.text = ""
    }
    
    func getTextFieldValues() -> (String, String, String) {
        return (surnameTextField.text!, nameTextField.text!, birthdateTextField.text!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func dateChanged(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        birthdateTextField.text = formatter.string(from: sender.date)
    }
    
    override var frame: CGRect {
        didSet {
            nameTextField.frame = CGRect(x: 20, y: 20, width: 360, height: 30)
            surnameTextField.frame = CGRect(x: 20, y: 70, width: 360, height: 30)
            birthdateTextField.frame = CGRect(x: 20, y: 120, width: 360, height: 30)
            submitButton.frame = CGRect(x: 120, y: 170, width: 160, height: 30)
        }
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let size = super.sizeThatFits(size)
        return CGSize(width: size.width, height: 200 + 20)
    }
}
