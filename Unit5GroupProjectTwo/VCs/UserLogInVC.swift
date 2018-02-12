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
    
    var activeTextField: UITextField = UITextField()
    
    let userLoginView = UserLoginView()
    let userSignUpView = SignUpView()
    let viewContainer = SegmentedControlView()
    private var authUserService = AuthUserService()
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
        iv.contentMode = .scaleAspectFit
        iv.backgroundColor = .white
        return iv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userLoginView.emailTextField.delegate = self
        userLoginView.passwordTextField.delegate = self
        userSignUpView.usernameTextField.delegate = self
        userSignUpView.emailTextField.delegate = self
        userSignUpView.passwordTextField.delegate = self
        authUserService.delegate = self
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

                let bottomOfTextField = activeTextField.frame.maxY + userLoginView.frame.origin.y
                let newBottomOfScreen = view.frame.maxY - keyboardSize.height
                print(bottomOfTextField)
                print(newBottomOfScreen)
                if bottomOfTextField > newBottomOfScreen {
                    let amountToShiftUp = bottomOfTextField - newBottomOfScreen
                    self.view.snp.remakeConstraints({ (make) in
                        make.top.equalTo(0).offset(-amountToShiftUp)
                        make.leading.equalTo(0)
                        make.width.equalTo(UIScreen.main.bounds.width)
                        make.height.equalTo(UIScreen.main.bounds.height)
                        make.bottom.equalTo(UIScreen.main.bounds.height).offset(-amountToShiftUp)
                    })
                    
                    // TODO:- fix this part, not working
                    UIView.animate(withDuration: 10, animations: {
                        self.view.updateConstraints()
                        self.view.layoutIfNeeded()
                    })
                }
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if let _ = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                view.snp.remakeConstraints({ (make) in
                    let screenRect = UIScreen.main.bounds
                    make.top.equalTo(0)
                    make.leading.equalTo(0)
                    make.width.equalTo(screenRect.width)
                    make.height.equalTo(screenRect.height)
                })
            }
        }
    }
    
    
    
    
    @objc private func login() {
        guard let email = userLoginView.emailTextField.text else { self.alertForErrors(with: "Please enter an email."); return }
        guard !email.isEmpty else { self.alertForErrors(with: "Please enter an email."); return }
        guard let password = userLoginView.passwordTextField.text else { self.alertForErrors(with: "Please enter a password."); return }
        guard !password.isEmpty else { self.alertForErrors(with: "Please enter a password."); return }
        
        authUserService.signIn(email: email, password: password)
    }
    
    @objc private func signUp() {
        guard let userName = userSignUpView.usernameTextField.text else {  self.alertForErrors(with: "Please enter a valid user name."); return }
        guard !userName.isEmpty else { self.alertForErrors(with: "Please enter a valid user name."); return }
        guard let email = userSignUpView.emailTextField.text else { self.alertForErrors(with: "Please enter an email."); return }
        guard !email.isEmpty else { self.alertForErrors(with: "Please enter a valid email."); return }
        guard let password = userSignUpView.passwordTextField.text else { self.alertForErrors(with: "Password is nil "); return }
        guard !password.isEmpty else { self.alertForErrors(with: "Password field is empty"); return }
        
        authUserService.createUser(email: email, password: password)
        
        
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
    
    func setUpLogoConstraints() {
        logoImage.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.width.equalTo(view.snp.width)
            make.centerX.equalTo(view)
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
    
    
    public func alertForErrors(with message: String) {
        let ac = UIAlertController(title: "Problem Logging In", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        ac.addAction(okAction)
        self.present(ac, animated: true, completion: nil)
    }
    
    @objc func segmentControlPressed(sender: UISegmentedControl)  {
        activeTextField.resignFirstResponder()
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

extension UserLogInVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.activeTextField = textField
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
