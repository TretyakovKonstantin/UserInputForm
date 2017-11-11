//
//  InputCell.swift
//  UserInputForm
//
//  Created by sm-user on 09.11.2017.
//  Copyright © 2017 Studio Mobile. All rights reserved.
//

import UIKit
class InputUserView: UIView{
    
    private let nameTextField: UITextField = {
        var name = UITextField()
        name.borderStyle = .roundedRect
        name.placeholder = "name"
        return name
    }()
    
    private var surnameTextField: UITextField = {
        var surname = UITextField()
        surname.borderStyle = .roundedRect
        surname.placeholder = "surname"
        return surname
    }()
    
    private var birthdateTextField:UITextField = {
        let birthdate = UITextField()
        birthdate.borderStyle = .roundedRect
        birthdate.placeholder = "date of birth"
        
        let birthdayPicker = UIDatePicker()
        birthdayPicker.datePickerMode = .date
        birthdate.inputView = birthdayPicker
        return birthdate
    }()
    
    private var submitButton:UIButton = {
        let submit = UIButton()
        submit.backgroundColor = .blue
        submit.setTitle("addUser", for: .normal)
        return submit
    }()

    private var action: ((UIButton)->())?
    
    @objc private func addUserButtonAction(sender: UIButton!) {
        action!(sender)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(nameTextField)
        addSubview(surnameTextField)
        addSubview(birthdateTextField)
        addSubview(submitButton)
        
        (birthdateTextField.inputView as! UIDatePicker).addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        
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
    
    func textFieldValues() -> (surname: String, name: String, birthdate: String) {
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
