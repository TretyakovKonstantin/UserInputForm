//
//  InputCell.swift
//  UserInputForm
//
//  Created by sm-user on 09.11.2017.
//  Copyright © 2017 Studio Mobile. All rights reserved.
//

import UIKit
var formatter: DateFormatter = DateFormatter()
class InputUserView: UIView {
    
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
    
    private var birthdateTextField: UITextField = {
        let birthdate = UITextField()
        birthdate.borderStyle = .roundedRect
        birthdate.placeholder = "date of birth"
        
        let birthdayPicker = UIDatePicker()
        birthdayPicker.datePickerMode = .date
        formatter.dateFormat = "dd.MM.yyyy"
        birthdate.inputView = birthdayPicker
        birthdayPicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
        birthdate.addTarget(self, action: #selector(setDateOnTextField), for: UIControlEvents.editingDidBegin)
        return birthdate
    }()
    
    @objc func setDateOnTextField(textField: UITextField) {
        textField.text = formatter.string(for: (textField.inputView as! UIDatePicker).date)
    }
    
    private var submitButton: UIButton = {
        let submit = UIButton()
        submit.backgroundColor = .blue
        submit.setTitle("addUser", for: .normal)
        return submit
    }()
    
    private var takePhotoButton: UIButton = {
        let takePhoto = UIButton()
        takePhoto.backgroundColor = .blue
        takePhoto.setTitle("take photo", for: .normal)
        return takePhoto
    }()

    @objc private var submitButtonAction: ((UIButton)->())?
    @objc private var takePhotoButtonAction: ((UIButton)->())?
    
    @objc private func addSubmitButtonAction(sender: UIButton!) {
        submitButtonAction!(sender)
    }

    @objc private func addTakePhotoButtonAction(sender: UIButton!) {
        takePhotoButtonAction!(sender)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(nameTextField)
        addSubview(surnameTextField)
        addSubview(birthdateTextField)
        addSubview(submitButton)
        addSubview(takePhotoButton)
        
        self.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 250/255, alpha: 1)
    }
    
    func setSubmitButtonAction(action: @escaping (UIButton!)->()) {
        self.submitButtonAction = action
//        submitButton.addTarget(self, action: #selector(setter: submitButtonAction), for: .touchDown)
        submitButton.addTarget(self, action: #selector(addSubmitButtonAction), for: .touchDown)
    }
    
    func setTakePhotoButtonAction(action: @escaping (UIButton!)->()) {
        self.takePhotoButtonAction = action
        takePhotoButton.addTarget(self, action: #selector(addTakePhotoButtonAction
            ), for: .touchDown)
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
        print("Helo")
        birthdateTextField.text = formatter.string(from: sender.date)
    }
    
    override var frame: CGRect {
        didSet {
            let frameWidth = Int(self.frame.size.width)
            let contentDistance = 20
            let standartHeight = 30
            let contentWidth = frameWidth - 2 * contentDistance
            let buttonWidth = (frameWidth - 3 * contentDistance) / 2
            
            nameTextField.frame = CGRect(x: contentDistance, y: 20, width: contentWidth, height: standartHeight)
            surnameTextField.frame = CGRect(x: contentDistance, y: 70, width: contentWidth, height: standartHeight)
            birthdateTextField.frame = CGRect(x: contentDistance, y: 120, width: contentWidth, height: standartHeight)
            submitButton.frame = CGRect(x: contentDistance, y: 170, width: buttonWidth, height: standartHeight)
            takePhotoButton.frame = CGRect(x: buttonWidth + 2 * contentDistance, y: 170, width: buttonWidth, height: standartHeight)
        }
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let size = super.sizeThatFits(size)
        return CGSize(width: size.width, height: 200 + 20)
    }
}
