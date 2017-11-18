//
//  ViewController.swift
//  UserInputForm
//
//  Created by User on 04/11/2017.
//  Copyright © 2017 Studio Mobile. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let reuseIdentifierUser = "user"
    
    var inputUserView = InputUserView()
    var userTableView = UITableView()
    let viewModel: ViewModel = ViewModel(dataContext: DataContext(), serializeService: SerializeService())
    
    var imagePicker: UIImagePickerController = {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .savedPhotosAlbum;
        imagePicker.allowsEditing = false
        return imagePicker
    }()
    
    override func loadView() {
        view = UIView()
        let frameWidth = Int(UIScreen.main.bounds.width)
        let frameHeight = Int(UIScreen.main.bounds.height)
        let inputViewHeight = 220
        inputUserView.frame = CGRect(x: 0, y: 60, width: frameWidth, height: inputViewHeight)
        view.addSubview(inputUserView)
        userTableView.frame = CGRect(x: 0, y: 280, width: frameWidth, height: frameHeight - inputViewHeight)
        view.addSubview(userTableView)
        
        
        inputUserView.setSubmitButtonAction(action: addUserButtonAction)
        inputUserView.setTakePhotoButtonAction(action: takePhoto)
        view.backgroundColor = .white
        viewModel.loadData()
        print(frameWidth)

    }
    
    @objc func addUserButtonAction(sender: UIButton!) {
        let (surname, name, birthDate) = inputUserView.textFieldValues()
        
        guard !surname.isEmpty && !birthDate.isEmpty else {
            let message = surname.isEmpty ? "Please, fill surname field" : "Please, fill birthday field"
            let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            navigationController?.present(alertController, animated: true, completion: nil)
            return
        }

        let user = User(surname: surname, name: name, birthDate: birthDate)
        viewModel.addData(user: user)
        
        inputUserView.emptyAllTextFields()
        userTableView.reloadData()
        viewModel.saveData()
    }
    
    func handleUserCellPress(index: Int) {
        let userCardViewController = UserCardViewController(dataContext: viewModel.dataContext, serializeService: viewModel.serializeService, userIndex: index)
        navigationController?.pushViewController(userCardViewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userTableView.register(UserCell.self, forCellReuseIdentifier: reuseIdentifierUser)
        userTableView.dataSource = self
        userTableView.delegate = self
        imagePicker.delegate = self
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getUsersCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierUser, for: indexPath)
    
        let userCell = cell as! UserCell
        let user = viewModel.getUser(index: indexPath.row)
        
        userCell.fillInFields(surname: user.surname, name: user.name, dateOfBirth: user.birthDate, image: viewModel.loadImage(index: indexPath.row))
        
        return cell
    }
}

extension ViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @objc func takePhoto(_ sender: UIButton!) {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
        
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        viewModel.saveImage(image: chosenImage)
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        handleUserCellPress(index: indexPath.row)
    }
}

