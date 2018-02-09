//
//  UserLogInViewController.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 1/29/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit
import Firebase

/*TO-DO:
 - Make keyboard disappear when not in use/hit return
 - Add label for frog to indicate one can change the image
 - Round image when it changes
 - Make sure text fields and image clears when view switches or the user creates a user
 
 -TO NOTE:
 -The corner radius looks different for each iphone. Need to learn how to vary them
 */

class UserLogInVC: UIViewController {
    
    let userLoginView = UserLoginView()
    let userSignUpView = SignUpView()
    let viewContainer = SegmentedControlView()
    var verificationTimer: Timer = Timer() //For email verification
    
    lazy var userProfileImage: UIImageView =  {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "frog")
        iv.contentMode = UIViewContentMode.scaleToFill
        iv.layer.cornerRadius = 20
        iv.layer.masksToBounds = true
        return iv
    }()
    
    lazy var logoImage: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "Phlogger")
        iv.contentMode = UIViewContentMode.scaleToFill
        return iv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //To check if user is already logged in.
        if Auth.auth().currentUser != nil {
            let storyboard = UIStoryboard(name: "GlobalPostFeed", bundle: nil)
            let revealVC = storyboard.instantiateViewController(withIdentifier: "SWRealViewController")
            self.present(revealVC, animated: true, completion: nil)
        }
        
        
        let views = [viewContainer, userLoginView, userSignUpView, logoImage] as [UIView]
        
        views.forEach{ ($0).translatesAutoresizingMaskIntoConstraints = false; self.view.addSubview($0) }
        userSignUpView.isHidden = true
        viewContainer.segmentedControl.selectedSegmentIndex = 0
        viewContainer.segmentedControl.addTarget(self, action: #selector(segmentControlPressed), for: .valueChanged)
        viewContainer.segmentedControl.setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.green], for: .selected)
        
        
        //For buttons
        userLoginView.submitInfoButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        userSignUpView.createAccountButton.addTarget(self, action: #selector(signUp), for: .touchUpInside)
        userLoginView.forgotPWButton.addTarget(self, action: #selector(reset), for: .touchUpInside)
        userSignUpView.uploadImageButton.addTarget(self, action: #selector(getImageFromUser), for: .touchUpInside)
        
        //        self.verificationTimer = Timer.scheduledTimer(timeInterval: 200, target: self, selector: #selector(UserLogInVC.signUp) , userInfo: nil, repeats: true)
        
        setUpAccountView()
        userSignUpViewConstraints()
        userCreateAccountConstraints()
        setUpLogoConstraints()
        
        NotificationCenter.default.addObserver(self, selector: #selector(UserLogInVC.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(UserLogInVC.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                //                self.view.frame.origin.y -= (keyboardSize.height + navigationController!.navigationBar.frame.height)
                
                self.view.snp.remakeConstraints({ (make) in
                    make.centerY.equalTo(navigationController!.navigationBar.snp.centerY )
                    make.centerX.equalTo(self.view.snp.centerX)
                })
                //                self.view.safeAreaLayoutGuide..origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
//                self.view.frame.origin.y += (keyboardSize.height + navigationController!.navigationBar.frame.height)
                self.view.snp.remakeConstraints { (make) in
                    make.centerY.equalTo(self.view.snp.centerY)
                    
                    
                }
                
            }
        }
    }
    
    
    
    
    @objc private func login() {
        guard let email = userLoginView.emailTextField.text else { self.alertForErrors(with: "Please enter an email."); return }
        guard !email.isEmpty else { self.alertForErrors(with: "Please enter an email."); return }
        guard let password = userLoginView.passwordTextField.text else { self.alertForErrors(with: "Please enter a password."); return }
        guard !password.isEmpty else { self.alertForErrors(with: "Please enter a password."); return }
        FirebaseAPIClient.manager.login(with: email, an: password) { (user, error) in
            
            if error != nil {
                if let errorCode = AuthErrorCode(rawValue: error!._code) {
                    //Take message for each case and put in a string to use for alert.
                    var message = ""
                    switch errorCode {
                    case .wrongPassword:
                        message = "Wrong password entered."
                    case .userNotFound:
                        message = "User not found. Please check that you entered the correct name and password."
                    case .invalidEmail:
                        message = "Please enter a valid email"
                    case .networkError:
                        message = "There was an error with your connection. Please try again later."
                    default:
                        break
                    }
                    
                    self.alertForErrors(with: message)
                }
            }
            
            if Auth.auth().currentUser?.isEmailVerified != true {
                print("User hasn't verified email")
                self.alertForErrors(with: "Please verify your email.")
                return
            }
                
            else {
                //                self.verificationTimer.invalidate()
            }
            
            if user != nil {
                
                let storyboard = UIStoryboard(name: "GlobalPostFeed", bundle: nil)
                let revealVC = storyboard.instantiateViewController(withIdentifier: "SWRealViewController")
                
                self.present(revealVC, animated: true, completion: nil)
            }
        }
        
    }
    
    
    
    @objc private func signUp() {
        guard let userName = userSignUpView.usernameTextField.text else {  self.alertForErrors(with: "Please enter a valid user name."); return }
        guard !userName.isEmpty else { self.alertForErrors(with: "Please enter a valid user name."); return }
        guard let email = userSignUpView.emailTextField.text else { self.alertForErrors(with: "Please enter an email."); return }
        guard !email.isEmpty else { self.alertForErrors(with: "Please enter a valid email."); return }
        guard let password = userSignUpView.passwordTextField.text else { self.alertForErrors(with: "Password is nil "); return }
        guard !password.isEmpty else { self.alertForErrors(with: "Password field is empty"); return }
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if error == nil && user != nil {
                print("User created!")
                
                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                changeRequest?.displayName = userName
                changeRequest?.commitChanges { error in
                    if error == nil {
                        print ("User display name changed")
                    }
                    
                }
                
                
                
                Auth.auth().currentUser?.sendEmailVerification { (error) in
                    if error == nil {
                        let ac = UIAlertController(title: "Email Verification Sent", message: "Email verification is needed. Please check your email and follow the instructions.", preferredStyle: .alert)
                        let okAction = UIAlertAction(title: "OK", style: .default, handler: { (action) in
                            self.userLoginView.isHidden = false
                            self.userSignUpView.isHidden = true
                            self.viewContainer.segmentedControl.selectedSegmentIndex = 0
                            self.userSignUpView.usernameTextField.text = ""
                            self.userSignUpView.emailTextField.text = ""
                            self.userSignUpView.passwordTextField.text = ""
                            self.userSignUpView.uploadImageButton.setImage(#imageLiteral(resourceName: "profile64"), for: .normal)
                        })
                        ac.addAction(okAction)
                        self.present(ac, animated: true, completion: {
                            if let userImage = self.userProfileImage.image {
                                UserService.manager.saveNewUser(imageProfile: userImage)
                            }
                        })
                        
                        
                        
//                    })
                    }
                }
                
            }
                
            else {
                if let errorCode = AuthErrorCode(rawValue: error!._code) {
                    var message = ""
                    switch errorCode {
                    case .invalidEmail:
                        message = "Please enter a valid email"
                    case .networkError:
                        message = "There was an error with your connection. Please try again later."
                    case .emailAlreadyInUse:
                        message = "There is already an account associated with this email."
                    case .missingEmail:
                        message = "Email textfield empty. Please input a valid email."
                    default:
                        break
                    }
                    self.alertForErrors(with: message)
                    
                }
            }
            print("Error creating user: \(String(describing: error?.localizedDescription))")
        }
    }
    
    
    
    @objc private func reset() {
        let resetVC = ForgotPasswordVC()
        resetVC.modalTransitionStyle = .coverVertical
        resetVC.modalPresentationStyle = .pageSheet
        self.present(ForgotPasswordVC(), animated: true, completion: nil)
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
    
    
    //To check if user is logged in and switch screens if true
    //    private func getStarted() {
    //        let navBar = MainVC()
    //        navigationController?.pushViewController(navBar, animated: true)
    //
    //    }
    
    func setUpLogoConstraints() {
        logoImage.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.width.equalTo(view.snp.width)
            make.bottom.equalTo(viewContainer.snp.top)
            
        }
    }
    
    func setUpAccountView() {
        viewContainer.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(view.snp.height).multipliedBy(0.6)
            make.width.equalTo(view.snp.width)
            make.centerX.equalTo(view.snp.centerX)
            make.bottom.equalTo(view.snp.bottom)
            
        }
    }
    
    func userSignUpViewConstraints() {
        userSignUpView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(viewContainer.segmentedControl.snp.bottom)
            make.width.equalTo(viewContainer.snp.width)
            make.bottom.equalTo(view.snp.bottom)
            make.centerX.equalTo(viewContainer.segmentedControl.snp.centerX)
        }
    }
    
    func userCreateAccountConstraints() {
        userLoginView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(viewContainer.segmentedControl.snp.bottom)
            make.width.equalTo(viewContainer.snp.width)
            make.bottom.equalTo(view.snp.bottom)
            make.centerX.equalTo(viewContainer.segmentedControl.snp.centerX)
            
        }
    }
    
    
    private func alertForErrors(with message: String) {
        let ac = UIAlertController(title: "Problem Logging In", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        ac.addAction(okAction)
        self.present(ac, animated: true, completion: nil)
    }
    
    @objc func segmentControlPressed(sender: UISegmentedControl)  {
        if sender.selectedSegmentIndex == 0 {
            userLoginView.isHidden = false
            userSignUpView.isHidden = true
            print("\(String(describing: sender.titleForSegment(at: 0)))")
            sender.backgroundColor = UIColor(displayP3Red: (229/255), green: (229/255), blue: (229/255), alpha: 1.0)
            
        }
            
        else if sender.selectedSegmentIndex == 1 {
            userLoginView.isHidden = true
            userSignUpView.isHidden = false
            print("\(String(describing: sender.titleForSegment(at: 1)))")
            sender.backgroundColor = UIColor(displayP3Red: (229/255), green: (229/255), blue: (229/255), alpha: 1.0)
            
            
        }
    }
}

extension UserLogInVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let profileImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.userSignUpView.uploadImageButton.setImage(profileImage, for: .normal)
            self.userProfileImage.image = profileImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
}


