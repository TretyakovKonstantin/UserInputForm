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

var source:[User] = []

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
            inputCell.submitButton.addTarget(self, action: #selector(addUserButtonAction), for: .touchDown)
            break
    
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
    
    @objc func addUserButtonAction(sender: UIButton!) {
        let inputView = viewAsTable.cellForRow(at: IndexPath(row: 0, section: 0)) as! InputCell
        let (surname, name, birthDate) = inputView.getTextFieldValues()
        
        guard !surname.isEmpty && !birthDate.isEmpty else {
            return
        }
        
        let user = User(surname: surname, birthDate: birthDate)
        if !name.isEmpty {
            user.name = name
        }
        source += [user]
        inputView.emptyAllTextFields()
        viewAsTable.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
}

