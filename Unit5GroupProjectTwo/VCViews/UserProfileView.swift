//
//  UserSettingView.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 1/29/18.
//  Copyright © 2018 C4Q. All rights reserved.

import UIKit
import SnapKit

class UserProfileView: UIView {
    
    lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Default User"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    lazy var profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "profile64")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
//
//    lazy var changePictureButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("Change Pictuer" , for: .normal)
//        button.setTitleColor(.blue, for: .normal)
//        // button.imageView?.contentMode = .scaleAspectFill
//        return button
//    }()
    
    // Number of posts label
    lazy var numberOfPostsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "Number of Posts: 20"
        return label
    }()
    
    //number of Flags Label
    lazy var numberofFlagsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "Number of flags: 0"
        return label
    }()
    
    //number of upvotes
    lazy var numberofUpvotesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "Number of upvote recived: 16"
        return label
    }()
    
    // Labels StackView
    lazy var labelsStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = UILayoutConstraintAxis.vertical
        stackView.distribution = UIStackViewDistribution.fill
        stackView.spacing = 20.0
        return stackView
    }()
    
    // A button that shows posts View
    lazy var postsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Posts" , for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // make profile image a circle
        profileImage.layer.cornerRadius = profileImage.bounds.width/2.0
        profileImage.layer.masksToBounds = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        backgroundColor = .white
        setupViews()
    }
    
    private func setupViews() {
        setupHeader()
        setupContent()
        setupButton()
    }
    
    private func setupHeader() {
        addSubview(userNameLabel)
        addSubview(profileImage)
        profileImage.snp.makeConstraints { (image) in
            image.top.equalTo(self.snp.top).offset(16)
            image.centerX.equalTo(snp.centerX)
            image.width.height.equalTo(snp.width).multipliedBy(0.4)
        }
        
        userNameLabel.snp.makeConstraints { (label) in
            label.top.equalTo(profileImage.snp.bottom).offset(16)
            label.centerX.equalTo(snp.centerX)
        }
    }
    
    private func setupContent() {
        addSubview(labelsStack)
        labelsStack.addArrangedSubview(numberOfPostsLabel)
        labelsStack.addArrangedSubview(numberofFlagsLabel)
        labelsStack.addArrangedSubview(numberofUpvotesLabel)
        
        labelsStack.snp.makeConstraints { (stack) in
            stack.top.equalTo(userNameLabel.snp.bottom).offset(32)
            stack.centerX.equalTo(snp.centerX)
        }
    }
    
    private func setupButton() {
        addSubview(postsButton)
        postsButton.snp.makeConstraints { (button) in
            button.bottom.equalTo(snp.bottom).offset(-32)
            button.centerX.equalTo(snp.centerX)
        }
    }
    
}


