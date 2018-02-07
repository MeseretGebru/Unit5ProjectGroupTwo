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
 - Timer for reset password and verification
 - Check if user is logged in
 - Theme and fix constraints
 - Add logo */

class UserLogInVC: UIViewController {
    
    let userLoginView = UserLoginView()
    let userSignUpView = SignUpView()
    let viewContainer = SegmentedControlView()
    var verificationTimer: Timer = Timer() //For email verification
    
    lazy var logoImage: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "Phlogger")
        iv.contentMode = UIViewContentMode.scaleToFill
        return iv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        view.backgroundColor = .yellow
        let views = [viewContainer, userLoginView, userSignUpView, logoImage] as [UIView]
        views.forEach{ ($0).translatesAutoresizingMaskIntoConstraints = false; self.view.addSubview($0) }
        userSignUpView.isHidden = true
        viewContainer.segmentedControl.selectedSegmentIndex = 0
        viewContainer.segmentedControl.addTarget(self, action: #selector(segmentControlPressed), for: .valueChanged)
        userLoginView.submitInfoButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        userSignUpView.createAccountButton.addTarget(self, action: #selector(signUp), for: .touchUpInside)
        userLoginView.forgotPWButton.addTarget(self, action: #selector(reset), for: .touchUpInside)
        userSignUpView.uploadImageButton.addTarget(self, action: #selector(saveUser), for: .touchUpInside)
        
        self.verificationTimer = Timer.scheduledTimer(timeInterval: 200, target: self, selector: #selector(UserLogInVC.signUp) , userInfo: nil, repeats: true)
        
        setUpAccountView()
        userSignUpViewConstraints()
        userCreateAccountConstraints()
        setUpLogoConstraints()
        
        
        
        viewContainer.segmentedControl.setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.green], for: .selected)
        
        
        
        
    }

    
    func getUserNameEmailPW() -> (String, String, String ) {
        let userName = userSignUpView.usernameTextField.text!
        let email = userSignUpView.emailTextField.text!
        let password = userSignUpView.passwordTextField.text!
        return (userName, email, password)
    }
    
//    func getEmailPW() -> (String, String) {
//        let email = userLoginView.emailTextField.text!
//        let password = userLoginView.passWordField.text!
//        return (email, password)
//    }
    
    
    @objc private func login() {
        guard let email = userLoginView.emailTextField.text else { self.alertForErrors(with: "Please enter an email."); return }
        guard !email.isEmpty else { self.alertForErrors(with: "Please enter an email."); return }
        guard let password = userLoginView.passwordTextField.text else { self.alertForErrors(with: "Please enter a password."); return }
        guard !password.isEmpty else { self.alertForErrors(with: "Please enter a password."); return }
        FirebaseAPIClient.manager.login(with: email, an: password) { (user, error) in
            if Auth.auth().currentUser?.isEmailVerified != true {
                print("User hasn't verified email")

                self.alertForErrors(with: "Please verify your email.")
                return
            }
                
            else {
                self.verificationTimer.invalidate()
            }
      

            
            
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
            
            
            if user != nil {
                //self.present(MainVC(), animated: true, completion: nil)
                let storyboard = UIStoryboard(name: "GlobalPostFeed", bundle: nil)
                let revealVC = storyboard.instantiateViewController(withIdentifier: "SWRealViewController")
             // self.navigationController?.pushViewController(revealVC, animated: true)
                self.present(revealVC, animated: true, completion: nil)
            }
        }
        
    }
    
    
    
    @objc private func signUp() {
        guard let userName = userSignUpView.usernameTextField.text else {  self.alertForErrors(with: "Please enter a valid user name."); return }
        guard !userName.isEmpty else { self.alertForErrors(with: "Please enter a valid user name."); return }
        guard let email = userSignUpView.emailTextField.text else { self.alertForErrors(with: "Please enter an email."); return }
        guard !email.isEmpty else { self.alertForErrors(with: "Please enter a valid email."); return }
        guard let password = userSignUpView.passwordTextField.text else { self.alertForErrors(with: "Please enter a vaild password."); return }
        guard !password.isEmpty else { self.alertForErrors(with: "Please enter a vaild password."); return }

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
                
//                UserService.manager.saveNewUser(imageProfile: <#T##UIImage#>)
                
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
                        })
                        ac.addAction(okAction)
                        self.present(ac, animated: true, completion: nil)
                        
                        
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
    
    
    
    //    func isEmailVerfied() {
    //        Auth.auth().currentUser?.reload{ (error) in
    //            if error == nil {
    //                if Auth.auth().currentUser!.isEmailVerified {
    //                    self.present(MainViewController(), animated: true, completion: nil)
    //                    self.verificationTimer.invalidate()
    //                }
    //                else {
    //                    print("User hasn't verified email")
    //                    let ac = UIAlertController(title: "Email Not Verified", message: "Please verify your email.", preferredStyle: .alert)
    //                    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    //                    ac.addAction(okAction)
    //                    self.present(ac, animated: true, completion: nil)
    //                }
    //            }
    //            else {
    //                print("Error: \(String(describing: error?.localizedDescription))")
    //            }
    //        }
    //    }
    
    @objc private func reset() {
        let resetVC = ForgotPasswordVC()
        resetVC.modalTransitionStyle = .coverVertical
        resetVC.modalPresentationStyle = .pageSheet
        self.present(ForgotPasswordVC(), animated: true, completion: nil)
    }
    
    @objc private func saveUser() {
        
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
            //            make.height.equalTo(view.snp.height).multipliedBy(0.8)
            //            make.width.equalTo(view.snp.width).multipliedBy(0.9)
            make.height.equalTo(view.snp.height).multipliedBy(0.65)
            make.width.equalTo(view.snp.width)
            make.centerX.equalTo(view.snp.centerX)
            //            make.centerY.equalTo(view.snp.centerY).offset(20)
            make.bottom.equalTo(view.snp.bottom)
            
        }
    }
    
    func userSignUpViewConstraints() {
        userSignUpView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(viewContainer.segmentedControl.snp.bottom)
            make.width.equalTo(viewContainer.snp.width)
            //            make.height.equalTo(viewContainer.borderForViews.snp.height).multipliedBy(0.99)
            make.bottom.equalTo(view.snp.bottom)
            make.centerX.equalTo(viewContainer.segmentedControl.snp.centerX)
        }
    }
    
    func userCreateAccountConstraints() {
        userLoginView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(viewContainer.segmentedControl.snp.bottom)
            make.width.equalTo(viewContainer.snp.width)
            //            make.height.equalTo(viewContainer.borderForViews.snp.height).multipliedBy(0.99)
            make.bottom.equalTo(view.snp.bottom)
            make.centerX.equalTo(viewContainer.segmentedControl.snp.centerX)
            
        }
    }
    
    
    func alertForErrors(with message: String) {
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

