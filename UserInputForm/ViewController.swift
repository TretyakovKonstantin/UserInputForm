//
//  ViewController.swift
//  UserInputForm
//
//  Created by User on 04/11/2017.
//  Copyright © 2017 Studio Mobile. All rights reserved.
//

import UIKit

let reuseIdentifierInput = "input"
let reuseIdentifierUser = "user"

var source = [User(surname: "Ivanov",  birthDate: "01.01.1995")]

class InputCell: UITableViewCell {
    let nameTextField = UITextField()
    let surnameTextField = UITextField()
    let birthdateTextField = UITextField()
    let submitButton = UIButton()
    
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
        submitButton.addTarget(self, action: #selector(addUserButtonAction), for: .touchDown)
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
    
    @objc func addUserButtonAction(sender: UIButton!) {
        let surname = surnameTextField.text!
        let birthDate = birthdateTextField.text!
        guard !surname.isEmpty && !birthDate.isEmpty else {
            return
        }
        
        let user = User(surname: surname, birthDate: birthDate)
        let name = nameTextField.text!
        if !name.isEmpty {
            user.name = name
        }
        source += [user]
        surnameTextField.text = ""
        nameTextField.text = ""
        birthdateTextField.text = ""
        (self.superview as! UITableView).reloadData()
    }
}

class UserCell: UITableViewCell {
    let surName = UILabel()
    let birthDateLabel = UILabel()
    var nameLabel = UILabel()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(surName)
        contentView.addSubview(birthDateLabel)
        contentView.addSubview(nameLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var isExpanded = false
    
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

class ViewController: UIViewController {
    
    var viewAsTable: UITableView {
        get {
            return view as! UITableView
        }
    }
    
    override func loadView() {
        view = UITableView()
        view.backgroundColor = .white
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        viewAsTable.register(UserCell.self, forCellReuseIdentifier: reuseIdentifierUser)
        viewAsTable.register(InputCell.self, forCellReuseIdentifier: reuseIdentifierInput)

        viewAsTable.dataSource = self
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : source.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: indexPath.section == 0 ? reuseIdentifierInput : reuseIdentifierUser, for: indexPath)
        
        switch indexPath.section {
        case 0:
            let inputCell = cell as! InputCell
    
        case 1:
            let userCell = cell as! UserCell
            let user = source[indexPath.row]
            if (user.name == nil) {
                userCell.setFields(surname: user.surname, dateOfBirth: user.birthDate)
            } else {
                userCell.setFields(surname: user.surname, name: user.name!, dateOfBirth: user.birthDate)
            }
        default:
            break
        }
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
}

