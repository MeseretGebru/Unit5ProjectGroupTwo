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
    
    lazy var usernameTextField: UITextField = {
        let txt = UITextField()
        txt.placeholder = "Username"
        txt.autocapitalizationType = .none
        return txt
    }()
    
    lazy var emailTextField: UITextField = {
        let txt = UITextField()
        txt.placeholder = "Email Address"
        txt.autocapitalizationType = .none
        return txt
    }()
    
    lazy var passwordTextField: UITextField  = {
        let txt = UITextField()
        txt.placeholder = "Password"
        txt.autocapitalizationType = .none
        txt.isSecureTextEntry = true
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
        let views = [usernameTextField, emailTextField, passwordTextField, createAccountButton] as [UIView]
        views.forEach { ($0).translatesAutoresizingMaskIntoConstraints = false; addSubview($0)}
        setUpUserNameTF()
        setUpEmailTF()
        setUpPWTF()
        setUpCreateButt()
        
    }
    
    private func setUpUserNameTF() {
        usernameTextField.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(self).multipliedBy(0.9)
            make.height.equalTo(self).multipliedBy(0.1)
            make.top.equalTo(self).offset(50)
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
            
            
            createAccountButton.layer.cornerRadius = 10
            createAccountButton.layer.masksToBounds = true
        }
    }
}
