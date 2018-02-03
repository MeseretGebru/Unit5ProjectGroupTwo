//
//  ResetPassword.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 2/1/18.
//  Copyright © 2018 C4Q. All rights reserved.
//


/*TO-DO
 - Add dismiss button and dismiss with gesture outside of box
 - Fix transition
 - Make pretty
 */

import UIKit

class ForgotPasswordView: UIView {
    
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter email"
        tf.backgroundColor = .purple
        tf.autocapitalizationType = .none
        return tf
    }()
    
    lazy var resetLabel: UILabel = {
        let lab = UILabel()
        lab.text = "Reset your password here"
        lab.numberOfLines = 0
        lab.backgroundColor = UIColor.green
        return lab
    }()
    
    lazy var submitButton: UIButton = {
        let butt = UIButton()
        butt.titleLabel?.text = "Reset"
        butt.backgroundColor = UIColor.darkGray
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
        backgroundColor = .white
        setupViews()
    }
    
    private func setupViews() {
        let views = [emailTextField, resetLabel, submitButton] as [UIView]
        views.forEach{ addSubview($0) }
        setUpTF()
        setUpLabel()
        setUpSubButt()
    }
    
    private func setUpTF() {
        emailTextField.snp.makeConstraints { (make) -> Void in
            make.centerX.equalTo(self.snp.centerX)
            make.centerY.equalTo(self.snp.centerY)
            make.width.equalTo(self.snp.width).multipliedBy(0.8)
            make.height.equalTo(self.snp.height).multipliedBy(0.1)
        }
    }
    
    private func setUpLabel() {
        resetLabel.snp.makeConstraints { (make) -> Void in
            make.centerX.equalTo(self.snp.centerX)
            make.centerY.equalTo(self.snp.centerY).offset(-70)
            make.width.equalTo(self.snp.width).multipliedBy(0.8)
            make.height.equalTo(self.snp.height).multipliedBy(0.1)
            
            
        }
        
    }
    
    private func setUpSubButt() {
        submitButton.snp.makeConstraints { (make) -> Void in
            make.centerY.equalTo(self.snp.centerY).offset(70)
            make.centerX.equalTo(self.snp.centerX)
            make.width.equalTo(self.snp.width).multipliedBy(0.8)
            make.height.equalTo(self.snp.height).multipliedBy(0.1)
        }
    }
    
}
