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
    
    lazy var settingTitleLabel: UILabel = {
        let lab = UILabel()
        lab.text = "Settings"
        lab.textAlignment = .center
        lab.font = UIFont(name: "Arial", size: 25)
        lab.numberOfLines = 0
        lab.backgroundColor = .green
        return lab
    }()
    
    lazy var changeNameTextField: UITextField = {
        let txt = UITextField()
        txt.backgroundColor = .green
        return txt
    }()
    
    lazy var changeNameLabel: UILabel = {
        let lab = UILabel()
        lab.text = "Change User Name:"
        lab.font = UIFont(name: "Arial", size: 15)
        lab.backgroundColor = .green
        lab.numberOfLines = 0
        return lab
    }()
    
    lazy var changePassTextField: UITextField = {
        let txt = UITextField()
        txt.backgroundColor = .green
        return txt
    }()
    
    lazy var changePassLabel: UILabel = {
        let lab = UILabel()
        lab.text = "Change Password:"
        lab.font = UIFont(name: "Arial", size: 15)
        lab.backgroundColor = .green
        lab.numberOfLines = 0
        return lab
    }()
    
    lazy var changeUserPicTextField: UITextField = {
        let txt = UITextField()
        txt.backgroundColor = .green
        return txt
        
    }()
    
    lazy var changeUserPicLabel: UILabel = {
        let lab = UILabel()
        lab.text = "Upload A Picture"
        lab.font = UIFont(name: "Arial", size: 15)
        lab.backgroundColor = .green
        lab.numberOfLines = 0
        return lab
    }()
    
    lazy var uploadPicButton: UIButton = {
        let butt = UIButton()
        butt.titleLabel?.text = "Upload"
        butt.backgroundColor = .blue
        butt.titleLabel?.textColor = .black
        //When pressed, the button will show an alert sheet!
        return butt
    }()
    
    lazy var saveButton: UIButton = {
        let butt = UIButton()
        butt.titleLabel?.text = "Save"
        butt.backgroundColor = .green
        butt.titleLabel?.textColor = .black
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
        let views = [settingTitleLabel, changeNameLabel, changeNameTextField, changePassLabel, changePassTextField, changeUserPicLabel, changeUserPicTextField, uploadPicButton, saveButton] as [UIView]
        views.forEach { addSubview($0); ($0).translatesAutoresizingMaskIntoConstraints = false }
        setUpSettingsLabel()
        setUpChangeNameLabel()
        setUpChangeNameTF()
        setUpChangePWLab()
        setUpChangePWTF()
        setUpChangeUserPicLab()
        setUpChangeUserPicTF()
        setUpUploadButt()
        setUpSaveButt()
    }
    
    private func setUpSettingsLabel() {
        settingTitleLabel.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(safeAreaLayoutGuide.snp.height).multipliedBy(0.1)
            make.width.equalTo(safeAreaLayoutGuide.snp.width).multipliedBy(0.8)
            make.centerY.equalTo(safeAreaLayoutGuide.snp.centerY).offset(-210)
            make.centerX.equalTo(safeAreaLayoutGuide.snp.centerX)
            
        }
    }
    
    private func setUpChangeNameLabel() {
        changeNameLabel.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(safeAreaLayoutGuide.snp.height).multipliedBy(0.1)
            make.width.equalTo(safeAreaLayoutGuide.snp.width).multipliedBy(0.43)
            make.top.equalTo(settingTitleLabel.snp.bottom).offset(30)
            make.left.equalTo(safeAreaLayoutGuide.snp.left).offset(5)
        }
    }
    
    private func setUpChangeNameTF() {
        changeNameTextField.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(changeNameLabel.snp.height)
            make.width.equalTo(safeAreaLayoutGuide.snp.width).multipliedBy(0.52)
            make.top.equalTo(settingTitleLabel.snp.bottom).offset(30)
            make.left.equalTo(changeNameLabel.snp.right).offset(5)
        }
    }
    
    private func setUpChangePWLab() {
        changePassLabel.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(changeNameLabel.snp.height)
            make.width.equalTo(changeNameLabel.snp.width)
            make.top.equalTo(changeNameLabel.snp.bottom).offset(20)
            make.left.equalTo(safeAreaLayoutGuide.snp.left).offset(5)
        }
    }
    
    private func setUpChangePWTF() {
        changePassTextField.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(changeNameTextField.snp.height)
            make.width.equalTo(changeNameTextField.snp.width)
            make.top.equalTo(changeNameTextField.snp.bottom).offset(20)
            make.left.equalTo(changePassLabel.snp.right).offset(5)
        }
        
    }
    
    private func setUpChangeUserPicLab() {
        changeUserPicLabel.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(changeNameLabel.snp.height)
            make.width.equalTo(changeNameLabel.snp.width)
            make.top.equalTo(changePassLabel.snp.bottom).offset(20)
            make.left.equalTo(safeAreaLayoutGuide.snp.left).offset(5)
        }
    }
    
    private func setUpChangeUserPicTF() {
        changeUserPicTextField.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(changeNameTextField.snp.height)
            make.width.equalTo(changeNameTextField.snp.width)
            make.top.equalTo(changePassTextField.snp.bottom).offset(20)
            make.left.equalTo(changeUserPicLabel.snp.right).offset(5)
        }
    }
    
    private func setUpUploadButt() {
        uploadPicButton.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(changeUserPicTextField.snp.bottom).offset(10)
            make.height.equalTo(changeUserPicTextField.snp.height)
            make.width.equalTo(safeAreaLayoutGuide.snp.width).multipliedBy(0.3)
            make.right.equalTo(safeAreaLayoutGuide.snp.right).offset(-5)
        }
    }
    
    private func setUpSaveButt() {
        saveButton.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom).offset(-20)
            make.height.equalTo(uploadPicButton.snp.height)
            make.width.equalTo(uploadPicButton.snp.width)
            make.centerX.equalTo(settingTitleLabel.snp.centerX)
        }
    }
}
