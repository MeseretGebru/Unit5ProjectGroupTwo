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
 - Pop up alerts for wrong password / username
 - Where to check email verification
 - Add forgot password option 
 - Theme and fix constraints
 - Add logo */

class UserLogInViewController: UIViewController {
    
    let userLoginView = UserLoginView()
    let userSignUpView = SignUpView()
    let viewContainer = SegmentedControlView()
    var verificationTimer: Timer = Timer() //For email verification
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        let views = [viewContainer, userLoginView, userSignUpView] as [UIView]
        views.forEach{ ($0).translatesAutoresizingMaskIntoConstraints = false; self.view.addSubview($0) }
        userSignUpView.isHidden = true
        
        viewContainer.segmentedControl.addTarget(self, action: #selector(segmentControlPressed), for: .valueChanged)
        userLoginView.submitInfoButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        userSignUpView.createAccountButton.addTarget(self, action: #selector(signUp), for: .touchUpInside)
        userLoginView.forgotPWButton.addTarget(self, action: #selector(reset), for: .touchUpInside)
        
        self.verificationTimer = Timer.scheduledTimer(timeInterval: 200, target: self, selector: #selector(UserLogInViewController.signUp) , userInfo: nil, repeats: true)
        
        setUpAccountView()
        userSignUpViewConstraints()
        userCreateAccountConstraints()
    }
    
    func getUserNameEmailPW() -> (String, String, String ) {
        let userName = userSignUpView.usernameTextField.text!
        let email = userSignUpView.emailTextField.text!
        let password = userSignUpView.passwordTextField.text!
        return (userName, email, password)
    }
    
    func getEmailPW() -> (String, String) {
        let email = userLoginView.emailTextField.text!
        let password = userLoginView.passWordField.text!
        return (email, password)
    }
    
    
    @objc private func login() {
        let (email, password) = getEmailPW()
        //        FirebaseAPIClient.manager.login(with: email, an: password){ (user, error) in
        //            if let error = error {
        //                print(error)
        //                return
        //            }
        //            if user != nil {
        //                self.present(MainViewController(), animated: true, completion: nil)
        //
        //            }
        //        }
        FirebaseAPIClient.manager.login(with: email, an: password) { (user, error) in
            if let errorCode = AuthErrorCode(rawValue: error!._code) {
                //Take message for each case and put in a string to use for alert.
                var message = ""
                switch errorCode {
                case .wrongPassword:
                    message = "Wrong password entered"
                case .userNotFound:
                    message = "User not found. Please check that you entered the correct name."
                case .missingEmail:
                    message = "Please enter an email to log in"
                case .invalidEmail:
                    message = "You have entered the wrong email"
                case .networkError:
                    message = "There was an error with your connection. Please try again later."
                default:
                    break
                    }
                let ac = UIAlertController(title: "Problem Logging In", message: message, preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                ac.addAction(okAction)
                self.present(ac, animated: true, completion: nil)
            }
            if user != nil {
                
            }
        }
        
    }
    
    
    
    @objc private func signUp() {
        let (userName, email, password) = getUserNameEmailPW()
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if error == nil && user != nil {
                print("User created!")
                
                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                changeRequest?.displayName = userName
                changeRequest?.commitChanges { error in
                    if error == nil {
                        print ("User display name changed")
                        //                        self.present(MainViewController(), animated: true, completion: nil)
                    }
                    
                }
                Auth.auth().currentUser?.sendEmailVerification { (error) in
                    if error == nil {
                        let ac = UIAlertController(title: "Email Verification Sent", message: "Email verification is needed. Please check your email and follow the instructions.", preferredStyle: .alert)
                        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                        ac.addAction(okAction)
                        self.present(ac, animated: true, completion: nil)
                    }
                    
                }
                
            }
            else {
            }
            print("Error creating user: \(String(describing: error?.localizedDescription))")
        }
    }
    
    func isEmailVerfied() {
        Auth.auth().currentUser?.reload{ (error) in
            if error == nil {
                if Auth.auth().currentUser!.isEmailVerified {
                    self.present(MainViewController(), animated: true, completion: nil)
                    self.verificationTimer.invalidate()
                }
                else {
                    print("User hasn't verified email")
                    let ac = UIAlertController(title: "Email Not Verified", message: "Please verify your email to gain access", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                    ac.addAction(okAction)
                    self.present(ac, animated: true, completion: nil)
                }
            }
            else {
                print("Error: \(String(describing: error?.localizedDescription))")
            }
        }
    }
    
    @objc private func reset() {
        let resetVC = ResetPasswordViewController()
        resetVC.modalTransitionStyle = .coverVertical
        resetVC.modalPresentationStyle = .pageSheet
        self.present(ResetPasswordViewController(), animated: true, completion: nil)
    }
    
    
    //To check if user is logged in and switch screens if true
    private func getStarted() {
        let navBar = MainViewController()
        navigationController?.pushViewController(navBar, animated: true)
        
    }
    
    
    func setUpAccountView() {
        viewContainer.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(view.snp.height).multipliedBy(0.8)
            make.width.equalTo(view.snp.width).multipliedBy(0.9)
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.snp.centerY).offset(20)
            
            
        }
    }
    
    func userSignUpViewConstraints() {
        userSignUpView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(viewContainer.segmentedControl.snp.bottom).offset(2)
            make.width.equalTo(viewContainer.snp.width).multipliedBy(0.99)
            make.height.equalTo(viewContainer.borderForViews.snp.height).multipliedBy(0.99)
            make.centerX.equalTo(viewContainer.segmentedControl.snp.centerX)
        }
    }
    
    func userCreateAccountConstraints() {
        userLoginView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(viewContainer.segmentedControl.snp.bottom).offset(2)
            make.width.equalTo(viewContainer.snp.width).multipliedBy(0.99)
            make.height.equalTo(viewContainer.borderForViews.snp.height).multipliedBy(0.99)
            make.centerX.equalTo(viewContainer.segmentedControl.snp.centerX)
            
        }
    }
    
    
    @objc func segmentControlPressed(sender: UISegmentedControl)  {
        if sender.selectedSegmentIndex == 0 {
            userLoginView.isHidden = false
            userSignUpView.isHidden = true
            print("\(String(describing: sender.titleForSegment(at: 0)))")
        }
            
        else if sender.selectedSegmentIndex == 1 {
            userLoginView.isHidden = true
            userSignUpView.isHidden = false
            print("\(String(describing: sender.titleForSegment(at: 1)))")
        }
    }
    
}
