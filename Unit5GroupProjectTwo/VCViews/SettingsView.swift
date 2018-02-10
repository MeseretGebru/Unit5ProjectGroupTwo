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

    lazy var imageContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var profileImage: UIImageView = {
        let profileImage = UIImageView()
        profileImage.image = #imageLiteral(resourceName: "profile64")
        return profileImage
    }()
    
    lazy var editUserImageButton: UIButton = {
        let butt = UIButton()
        //label.numberOfLines = 0
        butt.setTitle("Edit Photo", for: .normal )
        butt.setTitleColor(.orange, for: .normal)
        return butt
    }()
    
    lazy var settingLabel: UILabel = {
        let lab = UILabel()
        lab.text = "   Account Settings"
        lab.textAlignment = .left
        lab.numberOfLines = 0
        lab.textColor = .darkGray
        return lab
    }()
    
    lazy var settingOptionsTV: UITableView = {
        let tv = UITableView()
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "SettingsCell")
        tv.isScrollEnabled = false
        
        
        return tv
    }()
    
    lazy var saveChangesButton: UIButton = {
        let butt = UIButton()
        butt.setTitle("Save Changes", for: .normal)
        butt.setTitleColor(.orange, for: .normal)
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
        backgroundColor =  UIColor(displayP3Red: (229/255), green: (229/255), blue: (229/255), alpha: 1.0)
        setupViews()
    }
    
    private func setupViews() {
        let view = [ imageContainer, profileImage, editUserImageButton, settingLabel, settingOptionsTV, saveChangesButton] as [UIView]
        view.forEach{ addSubview($0)}
        setUpImageContainer()
        setUpProfileImage()
        setupeditUserImageButton()
        setUpSettingLab()
        setUpTableView()
        setUpSaveButton()
    }
    
    private func setUpImageContainer() {
        imageContainer.snp.makeConstraints { (make) in
            make.width.equalTo(self.snp.width)
            make.height.equalTo(self.snp.height).multipliedBy(0.3)
            make.top.equalTo(self.snp.top)
            make.centerX.equalTo(self.snp.centerX)
        }
        imageContainer.layer.cornerRadius = 5
        imageContainer.layer.shadowColor = UIColor.black.cgColor
        imageContainer.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        imageContainer.layer.shadowRadius = 2.0
        imageContainer.layer.shadowOpacity = 2.0
        imageContainer.layer.masksToBounds = true
    }
    
    private func setUpProfileImage() {
        profileImage.snp.makeConstraints { (make) in
            make.top.equalTo(imageContainer.snp.top).offset(10)
            make.centerX.equalTo(imageContainer.snp.centerX)
            make.width.height.equalTo(snp.width).multipliedBy(0.2)
        }
        
    }
    
    private func setupeditUserImageButton() {
        editUserImageButton.snp.makeConstraints { (make) in
            make.top.equalTo(profileImage.snp.bottom).offset(1)
            make.centerX.equalTo(self.snp.centerX)
            make.width.equalTo(self.snp.width).multipliedBy(0.3)
            make.height.equalTo(self.snp.height).multipliedBy(0.1)
        }
    }
    
    private func setUpSettingLab() {
        settingLabel.snp.makeConstraints { (make) in
            make.top.equalTo(imageContainer.snp.bottom).offset(5)
            //            make.left.equalTo(self.snp.left).offset(10)
            make.width.equalTo(self.snp.width)
            make.height.equalTo(self.snp.height).multipliedBy(0.1)
            
        }
    }
    
    private func setUpTableView() {
        settingOptionsTV.snp.makeConstraints { (make) in
            make.top.equalTo(settingLabel.snp.bottom).offset(10)
            make.width.equalTo(self.snp.width).multipliedBy(0.9)
            make.centerX.equalTo(self.snp.centerX)
            make.height.equalTo(self.snp.height).multipliedBy(0.15)
        }
        
        //to round the corners
        settingOptionsTV.layer.borderWidth = 0.5
        settingOptionsTV.layer.cornerRadius = 2
        //Add shadow
        settingOptionsTV.layer.shadowColor = UIColor.black.cgColor
        settingOptionsTV.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        settingOptionsTV.layer.shadowRadius = 1.0
        settingOptionsTV.layer.shadowOpacity = 1.0
        settingOptionsTV.layer.masksToBounds = true
    }
    
    private func setUpSaveButton() {
        saveChangesButton.snp.makeConstraints{ (make) in
            make.centerX.equalTo(self.snp.centerX)
            make.bottom.equalTo(self.snp.bottom).offset(5)
            make.width.equalTo(self.snp.width).multipliedBy(0.5)
            make.height.equalTo(self.snp.height).multipliedBy(0.1)
            
        }
    }
}

