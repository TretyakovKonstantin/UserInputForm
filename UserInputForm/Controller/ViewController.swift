//
//  ViewController.swift
//  UserInputForm
//
//  Created by User on 04/11/2017.
//  Copyright © 2017 Studio Mobile. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var mainView: MainView {
        get {
            return view as! MainView
        }
    }
    private let reuseIdentifierUser = "user"
    var viewModel: ViewModel?
    
    var imagePicker: UIImagePickerController = {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .savedPhotosAlbum;
        imagePicker.allowsEditing = false
        return imagePicker
    }()
    
    override func loadView() {
        view = MainView()
        
        mainView.assignActions(userButtonAction: addUserButtonAction, takePhotoAction: takePhoto)
        viewModel!.loadData()
    }
    
    @objc func addUserButtonAction(sender: UIButton!) {
        let (surname, name, birthDate) = mainView.inputUserView.textFieldValues()
        
        guard !surname.isEmpty && !birthDate.isEmpty else {
            let message = surname.isEmpty ? "Please, fill surname field" : "Please, fill birthday field"
            let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            navigationController?.present(alertController, animated: true, completion: nil)
            return
        }

        let user = User(surname: surname, name: name, birthDate: birthDate)
        viewModel!.addUser(user: user)
        
        mainView.inputUserView.emptyAllTextFields()
        mainView.userTableView.reloadData()
        viewModel!.saveData()
    }
    
    init(dataContext: DataContext, storageService: StorageService) {
        viewModel = ViewModel(dataContext: dataContext, storageService: storageService)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func handleUserCellPress(index: Int) {
        let userCardViewController = UserCardViewController(dataContext: viewModel!.dataContext, storageService: viewModel!.storageService, userIndex: index)
        navigationController?.pushViewController(userCardViewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.userTableView.register(UserCell.self, forCellReuseIdentifier: reuseIdentifierUser)
        mainView.userTableView.dataSource = self
        mainView.userTableView.delegate = self
        imagePicker.delegate = self
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel!.getUsersCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierUser, for: indexPath)
    
        let userCell = cell as! UserCell
        let user = viewModel!.getUser(index: indexPath.row)
        
        userCell.fillInFields(surname: user.surname, name: user.name, dateOfBirth: user.birthDate, image: viewModel!.loadImage(index: indexPath.row))
        
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
        viewModel!.saveImage(image: chosenImage)
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

