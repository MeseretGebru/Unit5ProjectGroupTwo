//
//  UserSettingView.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 1/29/18.
//  Copyright © 2018 C4Q. All rights reserved.

import UIKit
import SnapKit

class UserProfileView: UIView {
    //TOD:
    // create a table view
    //set up initializers
    //set up properties
    
    
    lazy var userPostImage: UIImageView = {
        let userPostImage = UIImageView()
        userPostImage.image = #imageLiteral(resourceName: "noImage")
        return userPostImage
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Description"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
        addSubview(userPostImage)
        addSubview(descriptionLabel)
        
        userPostImage.snp.makeConstraints { (image) in
            image.edges.equalTo(self)
        }
        descriptionLabel.snp.makeConstraints { (label) in
            //label.trailing.leading.equalTo(self).inset(8)
            label.centerX.equalTo(self.snp.centerX)
            label.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).offset(-20)
        }
    }
}
