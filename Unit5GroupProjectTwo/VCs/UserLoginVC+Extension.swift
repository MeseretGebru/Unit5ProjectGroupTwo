//
//  UserLoginVC+Extension.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 2/11/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import Firebase

extension UserLogInVC: AuthUserServiceDelegate {
    
    // Create user
    func didCreateUser(_ userService: AuthUserService, user: User) {
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
    }
    
    func didFailCreatingUser(_ userService: AuthUserService, error: Error) {
        if let errorCode = AuthErrorCode(rawValue: error._code) {
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
    
    func didFailToEmailVerify() {
        let message = "Please verify your E-mail."
        self.alertForErrors(with: message)
    }
    
    // SignIn
    func didFailToSignIn(_ userService: AuthUserService, error: Error) {
        if let errorCode = AuthErrorCode(rawValue: error._code) {
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
    
    func didSignIn(_ userService: AuthUserService, user: User) {
        let storyboard = UIStoryboard(name: "GlobalPostFeed", bundle: nil)
        let revealVC = storyboard.instantiateViewController(withIdentifier: "SWRealViewController")
        self.present(revealVC, animated: true, completion: nil)
    }
    
    // SignOut
    func didFailSigningOut(_ userService: AuthUserService, error: Error) {
        
    }
    
    func didSignOut(_ userService: AuthUserService) {
        
    }
}
