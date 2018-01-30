//
//  SignUpView.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 1/29/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class SignUpView: UIView {
    
    lazy var appNameLabel  : UILabel = {
        let lab = UILabel()
        return lab
    }()
    
    lazy var usernameTextField: UITextField = {
        let txt = UITextField()
        return txt
    }()
    
    lazy var emailTextField: UITextField = {
        let txt = UITextField()
        return txt
    }()
    
    lazy var passwordTextField: UITextField  = {
        let txt = UITextField()
        return txt
    }()
    
    lazy var submitAccountButton: UIButton = {
        let butt = UIButton()
        return butt
    }()
    
    lazy var offerLoginLabel: UILabel = {
        let lab = UILabel()
        return lab
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
            backgroundColor = .purple
            setupViews()
        }
    
        private func setupViews() {
        }
    
    
}
