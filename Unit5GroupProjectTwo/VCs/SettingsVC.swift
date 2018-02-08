//
//  SettingsViewController.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 1/29/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

/*TO-DO:
 - Add function to upload image button to pop up Alert Sheet
 - Add gallery, camera and url actions to Alert Sheet
 - Save button updates Firebase
 - When field is blank, button does not save anything!!!!
 - Back button is in navigation 
 */

class SettingsVC: UIViewController {
    let settingView = SettingsView()
    
    
    let menuButt = UIBarButtonItem(image: #imageLiteral(resourceName: "menuButton"), style: .plain, target: self, action: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        configureNavBar()
        //        settingView.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .darkGray
        addSubViews()
        settingView.settingOptionsTV.delegate = self
        settingView.settingOptionsTV.dataSource = self
        settingView.editUserImageButton.addTarget(self, action: #selector(getImageFromUser), for: .touchUpInside)
        settingView.saveChangesButton.addTarget(self, action: #selector(saveChanges), for: .touchUpInside)
    }
    //    private func configureNavBar() {
    //        navigationItem.title = "Setting"
    //        let backButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: self, action: #selector(back))
    //        navigationItem.leftBarButtonItem = backButton
    //
    //    }
    
    private func addSubViews(){
        view.addSubview(settingView)
        //        addConstraints()
        navigationItem.leftBarButtonItem = menuButt
        //        settingView.saveButton.addTarget(self, action: #selector(changeSettings), for: .touchUpInside)
        
        settingView.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
        }
        
        if self.revealViewController() != nil {
            menuButt.target = self.revealViewController()
            menuButt.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
    }
    
    
    public static func storyboardInstance() -> SettingsVC {
        let storyboard = UIStoryboard(name: "GlobalPostFeed", bundle: nil)
        let settingVC = storyboard.instantiateViewController(withIdentifier: "SettingsVC") as! SettingsVC
        return settingVC
    }
    
    @objc private func getImageFromUser() {
        let addImageActionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        //        UIAlertAction(title: "take a photo", style: .default, handler: nil)
        let openCamera = UIAlertAction.init(title: "Take A Photo", style: .default) { [weak self] (action) in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = .camera;
                imagePicker.allowsEditing = false
                self?.present(imagePicker, animated: true, completion: nil)
            }
        }
        let openGallery = UIAlertAction(title: "Take Image From Library", style: .default) { [weak self] (action) in
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = .photoLibrary;
                imagePicker.allowsEditing = false
                self?.present(imagePicker, animated: true, completion: nil)
            }
        }
        
        addImageActionSheet.addAction(openCamera)
        addImageActionSheet.addAction(openGallery)
        addImageActionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil) )
        self.present(addImageActionSheet, animated: true, completion: nil)
        
    }
    
    @objc private func saveChanges() {
        //Where user saves image and/or color changes
        let currentUser = Auth.auth().currentUser
        
       
    }
    
    @objc private func dismissView() {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    //    private func addConstraints(){
    //        settingView.snp.makeConstraints { (make) in
    //            make.edges.equalTo(self.view)
    //        }
    //    }
    
    
    //    private func changeEmail() {
    //        guard let email = settingView.enterPasswordTextfield.text else { print("Problem with email"); return }
    //        guard !email.isEmpty else { print("Email is nil"); return }
    //        Auth.auth().currentUser?.updateEmail(to: email, completion: { (error) in
    //            if error != nil {
    //                print("Error updating email: \(String(describing: error?.localizedDescription))")
    //            }
    //        })
    //    }
    
    
    //    @objc private func changeSettings() {
    //        guard let password = settingView.enterPasswordTextfield.text else { print("Problem with password"); return }
    //        guard !password.isEmpty else { print("Password is nil"); return }
    //
    //        let user = Auth.auth().currentUser
    ////        let credential = EmailAuthProvider.credential(withEmail: user?.email, password: user.)
    //
    //        Auth.auth().currentUser?.updatePassword(to: password, completion: { (error) in
    //            if error != nil {
    //                print("Error updating password: \(String(describing: error?.localizedDescription))")
    //            }
    //        })
    //
    //        guard let newUserName = settingView.enterUserNameTextfield.text else { print("Problem with User Name"); return }
    //        guard !newUserName.isEmpty else { print("UserName is nil"); return }
    //        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
    //        changeRequest?.displayName = newUserName
    //        changeRequest?.commitChanges(completion: { (error) in
    //            if error != nil {
    //                print("Error changing user name: \(String(describing: error?.localizedDescription))")
    //            }
    //        })
    //
    //        //Place image change function here
    //
    //    }
    
    
}


extension SettingsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = settingView.settingOptionsTV.dequeueReusableCell(withIdentifier: "SettingsCell", for: indexPath)
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "Change User Name"
            
        case 1:
            cell.textLabel?.text = "Change Password"
        default:
            break
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let alertVC = UIAlertController(title: "Change User Name", message: "Please enter a new user name.", preferredStyle: .alert)
            alertVC.addTextField { (tf) in
                tf.placeholder = "User Name"
            }
            
            let submitUN = UIAlertAction(title: "Submit", style: .default, handler: {
                (alert) -> Void in
                let usernameTF = alertVC.textFields![0] as UITextField
                
                //To change user name on Firebase
                guard let newUserName = usernameTF.text else { print("Username is nil");return }
                guard !newUserName.isEmpty else { print("Username is empty"); return }
                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                changeRequest?.displayName = newUserName
                changeRequest?.commitChanges(completion: { (error) in
                    if error != nil {
                        print("Error changing user name: \(String(describing: error?.localizedDescription))")
                    }
                    else if error == nil {
                        let ac = UIAlertController(title: "Changes Saved", message: "New username updated.", preferredStyle: .alert)
                        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                        ac.addAction(okAction)
                        self.present(ac, animated: true, completion: nil)
                        
                    }
                }
                    
                )
                
                
            })
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alertVC.addAction(submitUN)
            alertVC.addAction(cancelAction)
            
            present(alertVC, animated: true, completion: nil)
            
            //Add Auth Here
            
            
        case 1:
            let alertVC = UIAlertController(title: "Change Password", message: "Enter a your current password followed by your new one.", preferredStyle: .alert)
            alertVC.addTextField { (tf) in
                tf.placeholder = "Current Password"
                tf.autocapitalizationType = .none
                tf.isSecureTextEntry = true
            }
            alertVC.addTextField(configurationHandler: { (tf) in
                tf.placeholder = "New Password"
                tf.autocapitalizationType = .none
                tf.isSecureTextEntry = true
            })
            let submitPW = UIAlertAction(title: "Submit", style: .default, handler: {
                (alert) -> Void in
                let currentPWTF = alertVC.textFields![0] as UITextField
                let newPWTF = alertVC.textFields![1] as UITextField
                
                
                //To change password on firebase
                guard let currentPW = currentPWTF.text else { print("Password is nil");return }
                guard !currentPW.isEmpty else { print("Password is empty"); return }
                guard let newPW =  newPWTF.text else { print("Password is nil");return }
                guard !newPW.isEmpty else { print("Password is empty"); return }
                
                let user = Auth.auth().currentUser
                let credential = EmailAuthProvider.credential(withEmail: (user?.email)!, password: currentPW)
                user?.reauthenticate(with: credential, completion: { (error) in
                    if error != nil {
                        print("Error Authenticating User")
                    }
                    else {
                        Auth.auth().currentUser?.updatePassword(to: newPW, completion: { (error) in
                            if error != nil {
                                print("Error updating password: \(String(describing: error?.localizedDescription))")
                            }
                        })
                        let ac = UIAlertController(title: "Changes Saved", message: "Password updated.", preferredStyle: .alert)
                        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                        ac.addAction(okAction)
                        self.present(ac, animated: true, completion: nil)
                    }
                })
                
                
                
            })
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alertVC.addAction(submitPW)
            alertVC.addAction(cancelAction)
            present(alertVC, animated: true, completion: nil)
            //Add Auth here
            
        default:
            break
            
        }
    }
    
}


extension SettingsVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let profileImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.settingView.profileImage.image = profileImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
}
