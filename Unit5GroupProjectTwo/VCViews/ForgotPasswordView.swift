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
    
    lazy var dismissButton: UIButton = {
        let butt = UIButton()
        butt.setImage(#imageLiteral(resourceName: "add"), for: .normal)
        return butt
    }()
    
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter email"
        tf.autocapitalizationType = .none
        return tf
    }()
    
    lazy var resetLabel: UILabel = {
        let lab = UILabel()
        lab.text = "Reset your password here"
        lab.numberOfLines = 0
        lab.textColor = .orange
        return lab
    }()
    
    lazy var submitButton: UIButton = {
        let butt = UIButton()
        butt.setTitle("Submit", for: .normal)
        butt.backgroundColor = UIColor.orange
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
        let views = [dismissButton,emailTextField, resetLabel, submitButton] as [UIView]
        views.forEach{ addSubview($0) }
        setUpDismissButt()
        setUpTF()
        setUpLabel()
        setUpSubButt()
    }
    
    private func setUpDismissButt() {
        dismissButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.snp.top)
            make.left.equalTo(self.snp.left)
            make.size.equalTo(self.snp.size).multipliedBy(0.1)
            
        }
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
            
            submitButton.layer.cornerRadius = 10
            submitButton.layer.masksToBounds = true
        }
    }
    
}
