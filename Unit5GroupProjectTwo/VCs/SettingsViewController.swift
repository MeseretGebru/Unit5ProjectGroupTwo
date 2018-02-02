//
//  SettingsViewController.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 1/29/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

/*TO-DO:
- Add function to upload image button to pop up Alert Sheet
 - Add gallery, camera and url actions to Alert Sheet
 - Save button updates Firebase
 - When field is blank, button does not save anything!!!!
 - Back button is in navigation 
 */

class SettingsViewController: UIViewController {
    // Title should be big, bold and center
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Setting"
        label.textAlignment = .center
        return label
    }()
    
    //Stack of right side labels
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
    
    
    // Outputs: stack of left side labels execpt for user name
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
        button.setTitle("Save", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        addSubViews()
        addConstraints()
    }
    
    func addSubViews(){
        view.addSubview(titleLabel)
        view.addSubview(leftsideStacks)
        view.addSubview(rightsideStacks)
        view.addSubview(profilePictureLabel)
        view.addSubview(profileImage)
        view.addSubview(saveButton)
        
        leftsideStacks.addArrangedSubview(changeNameLabel)
        leftsideStacks.addArrangedSubview(changePasswordLabel)
        
        rightsideStacks.addArrangedSubview(enterUserNameTextfield)
        rightsideStacks.addArrangedSubview(enterPasswordTextfield)
        
    }
    
    private func addConstraints(){
        
        titleLabel.snp.makeConstraints {(title) in
            title.width.equalTo(view.snp.width)
            title.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(50)
            title.centerX.equalTo(view.snp.centerX)
        }
        leftsideStacks.snp.makeConstraints {(left) -> Void in
            left.top.equalTo(titleLabel.snp.bottom).offset(20)
            left.left.equalTo(view.snp.left).offset(20)
            left.width.equalTo(view.snp.width).multipliedBy(0.4)
            
        }
        
        rightsideStacks.snp.makeConstraints {(right) -> Void in
            right.top.equalTo(leftsideStacks.snp.top)
            right.left.equalTo(leftsideStacks.snp.right).offset(20)
            right.right.equalTo(view.snp.right).offset(-20)
            
        }
        profilePictureLabel.snp.makeConstraints {(make) in
            make.top.equalTo(view.snp.centerY).offset(-150)
            make.centerX.equalTo(view.snp.centerX)
        }
        profileImage.snp.makeConstraints { (make) in
            make.top.equalTo(profilePictureLabel.snp.bottom).offset(20)
            make.centerX.equalTo(view.snp.centerX)
            make.width.height.equalTo(300)
        }
        saveButton.snp.makeConstraints { (save) in
            save.top.equalTo(profileImage.snp.bottom).offset(20)
            save.centerX.equalTo(view.snp.centerX)
        }
    }
    
}



