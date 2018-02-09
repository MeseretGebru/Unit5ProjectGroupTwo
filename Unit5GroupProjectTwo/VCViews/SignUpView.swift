//
//  SignUpView.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 1/29/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class SignUpView: UIView {
    
    //    lazy var appNameLabel  : UILabel = {
    //        let lab = UILabel()
    //        return lab
    //    }()
    
    lazy var uploadImageButton: UIButton = {
        let butt = UIButton()
        butt.setImage(#imageLiteral(resourceName: "frog"), for: .normal)
        butt.contentMode = UIViewContentMode.scaleToFill
        return butt
    }()
    
    lazy var usernameTextField: UITextField = {
        let txt = UITextField()
        txt.placeholder = "Username"
        txt.autocapitalizationType = .none
        underLine(from: txt)
        return txt
    }()
    
    lazy var emailTextField: UITextField = {
        let txt = UITextField()
        txt.placeholder = "Email Address"
        txt.autocapitalizationType = .none
        underLine(from: txt)
        return txt
    }()
    
    lazy var passwordTextField: UITextField  = {
        let txt = UITextField()
        txt.placeholder = "Password"
        txt.autocapitalizationType = .none
        txt.isSecureTextEntry = true
        underLine(from: txt)
        return txt
    }()
    
    lazy var createAccountButton: UIButton = {
        let butt = UIButton()
        butt.setTitle("Sign Up", for: .normal)
        butt.backgroundColor = .orange
        return butt
    }()
    
    //    lazy var offerLoginLabel: UILabel = {
    //        let lab = UILabel()
    //        return lab
    //    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .white
        setupViews()
    }
    
    private func setupViews() {
        let views = [uploadImageButton, usernameTextField, emailTextField, passwordTextField, createAccountButton] as [UIView]
        views.forEach { ($0).translatesAutoresizingMaskIntoConstraints = false; addSubview($0)}
        setupUploadIV()
        setUpUserNameTF()
        setUpEmailTF()
        setUpPWTF()
        setUpCreateButt()
        
    }
    
    private func setupUploadIV() {
        uploadImageButton.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(self).offset(10)
            make.height.equalTo(self).multipliedBy(0.2)
            make.width.equalTo(self).multipliedBy(0.2)
            make.centerX.equalTo(self)
//            make.centerY.equalTo(self)
        }
    }
    
    
    private func setUpUserNameTF() {
        usernameTextField.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(self).multipliedBy(0.9)
            make.height.equalTo(self).multipliedBy(0.1)
            make.top.equalTo(uploadImageButton.snp.bottom).offset(20)
            make.centerX.equalTo(self)
        }
    }
    
    private func setUpEmailTF() {
        emailTextField.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(self).multipliedBy(0.9)
            make.height.equalTo(self).multipliedBy(0.1)
            make.top.equalTo(usernameTextField.snp.bottom).offset(20)
            make.centerX.equalTo(self)
            
        }
    }
    
    private func setUpPWTF() {
        passwordTextField.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(self).multipliedBy(0.9)
            make.height.equalTo(self).multipliedBy(0.1)
            make.top.equalTo(emailTextField.snp.bottom).offset(20)
            make.centerX.equalTo(self)
        }
    }
    
    
    private func setUpCreateButt() {
        createAccountButton.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(self).multipliedBy(0.3)
            make.height.equalTo(self).multipliedBy(0.1)
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.centerX.equalTo(self)
            
            
            createAccountButton.layer.cornerRadius = 15
            createAccountButton.layer.masksToBounds = true
        }
    }
    
    func underLine(from txt: UITextField) {
        let border = UIView()
        border.backgroundColor = UIColor(displayP3Red: (229/255), green: (229/255), blue: (229/255), alpha: 1.0)
        border.translatesAutoresizingMaskIntoConstraints = false
        txt.addSubview(border)
        border.heightAnchor.constraint(equalToConstant: 1).isActive = true
        border.widthAnchor.constraint(equalTo: txt.widthAnchor).isActive = true
        border.bottomAnchor.constraint(equalTo: txt.bottomAnchor, constant: -1).isActive = true
        border.leftAnchor.constraint(equalTo: txt.leftAnchor).isActive = true
    }
}
