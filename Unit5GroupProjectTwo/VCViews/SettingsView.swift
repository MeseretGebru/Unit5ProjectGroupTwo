//
//  SettingsView.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 1/29/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit

class SettingsView: UIView {
  
    lazy var changeNameLabel: UILabel = {
        let label = UILabel()
        //label.numberOfLines = 0
        label.text = "Change User Name:"
        return label
    }()
    
    lazy var changePasswordLabel: UILabel = {
        let label = UILabel()
        //label.numberOfLines = 0
        label.text = "Change Password:"
        return label
    }()
    
    
    
    lazy var enterUserNameTextfield: UITextField = {
        let textField = UITextField()
        textField.placeholder = "enter user name"
        return textField
    }()
    
    
    lazy var enterPasswordTextfield: UITextField  = {
        let textField = UITextField()
        textField.placeholder = " enter password"
        return textField
    }()
    
    lazy var profilePictureLabel: UILabel = {
        let label = UILabel()
        //label.numberOfLines = 0
        label.text = "Upload profile Picture"
        return label
    }()
    
    lazy var profileImage: UIImageView = {
        let profileImage = UIImageView()
        profileImage.image = #imageLiteral(resourceName: "noImage")
        return profileImage
    }()
    
    //Stack views
    lazy var leftsideStacks: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = UILayoutConstraintAxis.vertical
        stackView.distribution = UIStackViewDistribution.fillEqually
        stackView.spacing = 10.0
        return stackView
    }()
    
    lazy var rightsideStacks: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = UILayoutConstraintAxis.vertical
        stackView.distribution = UIStackViewDistribution.fillEqually
        stackView.spacing = 10.0
        return stackView
    }()
    
    lazy var saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save" , for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
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
        addSubViews()
        addConstraints()
    }
    
    func addSubViews(){
        //view.addSubview(titleLabel)
        addSubview(leftsideStacks)
        addSubview(rightsideStacks)
        addSubview(profilePictureLabel)
        addSubview(profileImage)
        addSubview(saveButton)
        
        leftsideStacks.addArrangedSubview(changeNameLabel)
        leftsideStacks.addArrangedSubview(changePasswordLabel)
        
        rightsideStacks.addArrangedSubview(enterUserNameTextfield)
        rightsideStacks.addArrangedSubview(enterPasswordTextfield)
        
    }
    
    private func addConstraints(){
        
        leftsideStacks.snp.makeConstraints {(left) -> Void in
            left.top.equalTo(self.safeAreaLayoutGuide).offset(80)
            left.left.equalTo(self.snp.left).offset(20)
            left.width.equalTo(self.snp.width).multipliedBy(0.4)
            
        }
        
        rightsideStacks.snp.makeConstraints {(right) -> Void in
            right.top.equalTo(leftsideStacks.snp.top)
            right.left.equalTo(leftsideStacks.snp.right).offset(20)
            right.right.equalTo(self.snp.right).offset(-20)
            
        }
        profilePictureLabel.snp.makeConstraints {(make) in
            make.top.equalTo(self.snp.centerY).offset(-150)
            make.centerX.equalTo(self.snp.centerX)
        }
        profileImage.snp.makeConstraints { (make) in
            make.top.equalTo(profilePictureLabel.snp.bottom).offset(20)
            make.centerX.equalTo(self.snp.centerX)
            make.width.height.equalTo(300)
        }
        
        saveButton.snp.makeConstraints { (save) in
            save.top.equalTo(profileImage.snp.bottom).offset(50)
            save.centerX.equalTo(self)
            save.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-60)
            save.height.equalTo(40)
        }
    }
}
