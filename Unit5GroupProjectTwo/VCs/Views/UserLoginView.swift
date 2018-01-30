//
//  UserLoginView.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 1/29/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit


class UserLoginView: UIView {
    
    lazy var appNameLabel: UILabel = {
        let lab = UILabel()
        return lab
    }()
    
    
    lazy var userNameTextField: UITextField = {
        let txt = UITextField()
        txt.placeholder = "Username"
        return txt
    }()
    
    lazy var passWordField: UITextField = {
        let txt = UITextField()
        txt.placeholder = "Password"
        return txt
    }()
    
    lazy var submitInfoButton: UIButton = {
        let butt = UIButton()
        return butt
    }()
    
    lazy var offerRegisterLabel: UILabel = {
        let lab = UILabel()
        return lab
    }()
    
    lazy var registerButton: UIButton = {
        let butt = UIButton()
        return butt
    }()
    

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
        }
        
        private func setupViews() {
        }
        
    
}
