//
//  ViewController.swift
//  UserInputForm
//
//  Created by User on 04/11/2017.
//  Copyright © 2017 Studio Mobile. All rights reserved.
//

import UIKit

private let reuseIdentifierInput = "input"
private let reuseIdentifierUser = "user"

var inputUserView: InputUserView = InputUserView()

var source:[User] = []

class ViewController: UIViewController {
    
    var viewAsTable: UITableView {
        get {
            return view as! UITableView
        }
    }
    
    override func loadView() {
        view = UITableView()
        inputUserView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 220)
        view.addSubview(inputUserView)
        viewAsTable.tableHeaderView = inputUserView

        inputUserView.setButtonAction(action: addUserButtonAction)
       
        view.backgroundColor = .white
        
    }
    
    @objc func addUserButtonAction(sender: UIButton!) {
        let (surname, name, birthDate) = inputUserView.textFieldValues()

        guard !surname.isEmpty && !birthDate.isEmpty else {
            return
        }

        let user = User(surname: surname, birthDate: birthDate)
        if !name.isEmpty {
            user.name = name
        }
        source += [user]
        inputUserView.emptyAllTextFields()
        viewAsTable.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewAsTable.register(UserCell.self, forCellReuseIdentifier: reuseIdentifierUser)
        viewAsTable.dataSource = self
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return source.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierUser, for: indexPath)
    
        let userCell = cell as! UserCell
        let user = source[indexPath.row]
        if (user.name == nil) {
            userCell.fillInFields(surname: user.surname, dateOfBirth: user.birthDate)
        } else {
            userCell.fillInFields(surname: user.surname, name: user.name!, dateOfBirth: user.birthDate)
        }
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

