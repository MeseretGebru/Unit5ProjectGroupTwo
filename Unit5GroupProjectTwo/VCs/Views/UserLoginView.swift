//
//  UserLoginView.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 1/29/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit


class UserLoginView: UIView {
    
    //    lazy var appNameLabel: UILabel = {
    //        let lab = UILabel()
    //        return lab
    //    }()
    
    
    lazy var userNameTextField: UITextField = {
        let txt = UITextField()
        txt.placeholder = "Username"
        txt.backgroundColor = .red
        return txt
    }()
    
    lazy var passWordField: UITextField = {
        let txt = UITextField()
        txt.placeholder = "Password"
        txt.backgroundColor = .red
        return txt
    }()
    
    lazy var submitInfoButton: UIButton = {
        let butt = UIButton()
        butt.backgroundColor = .green
        return butt
    }()
    
    //    lazy var offerRegisterLabel: UILabel = {
    //        let lab = UILabel()
    //        return lab
    //    }()
    //
    //    lazy var registerButton: UIButton = {
    //        let butt = UIButton()
    //        return butt
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
        backgroundColor = .blue
        setupViews()
        setUpUserNameTF()
        setUpPWTF()
        setUpSubmitButt()
    }
    
    private func setupViews() {
        let views = [userNameTextField, passWordField, submitInfoButton] as [UIView]
        views.forEach { addSubview($0); ($0).translatesAutoresizingMaskIntoConstraints = false}
    }
    
    private func setUpUserNameTF () {
        userNameTextField.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(self).multipliedBy(0.9)
            make.height.equalTo(self).multipliedBy(0.1)
            make.top.equalTo(self).offset(50)
            make.centerX.equalTo(self)
        }
    }
    
    private func setUpPWTF () {
        passWordField.snp.makeConstraints { (make) -> Void in 
            make.width.equalTo(self).multipliedBy(0.9)
            make.height.equalTo(self).multipliedBy(0.1)
            make.top.equalTo(userNameTextField.snp.bottom).offset(20)
            make.centerX.equalTo(self)
        }
    }
    
    private func setUpSubmitButt () {
        submitInfoButton.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(self).multipliedBy(0.3)
            make.height.equalTo(self).multipliedBy(0.1)
            make.top.equalTo(passWordField.snp.bottom).offset(20)
            make.centerX.equalTo(self)
        }
        
    }
    
    
}
