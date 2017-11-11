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

var viewModel = ViewModel()

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
        viewModel.deserializeData()
    }
    
    @objc func addUserButtonAction(sender: UIButton!) {
        let (surname, name, birthDate) = inputUserView.textFieldValues()
        
        guard !surname.isEmpty && !birthDate.isEmpty else {
            let message = surname.isEmpty ? "Please, fill surname field" : "Please, fill birthday field"
            let c = UIAlertController(title: message, message: "Can't see that because of allertAction", preferredStyle: .actionSheet)
            c.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            let newNavigationController = UINavigationController(rootViewController: c)
            navigationController?.present(newNavigationController, animated: true, completion: nil)
            return
        }

        let user = User(surname: surname, name: name, birthDate: birthDate)
        viewModel.addData(user: user)
        
        inputUserView.emptyAllTextFields()
        viewAsTable.reloadData()
        viewModel.serializeData()
    }
    
    
    func handleUserCellPress(index: Int) {
        let c = UserCardViewController()
        navigationController?.pushViewController(c, animated: true)
    }
    
    @objc func hideModal() {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewAsTable.register(UserCell.self, forCellReuseIdentifier: reuseIdentifierUser)
        viewAsTable.dataSource = self
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getDataCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierUser, for: indexPath)
    
        let userCell = cell as! UserCell
        let user = viewModel.getData(index: indexPath.row)
        if (user.name == nil || user.name == "") {
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

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        handleUserCellPress(index: indexPath.row)
    }
}

