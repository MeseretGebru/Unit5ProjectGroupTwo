//
//  MenuView.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 1/31/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit


class MenuView: UIView {
    
    
    lazy var menuTableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .purple
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "MenuCell")
        return tv
    }()
    
    lazy var userPicImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "profile")
        iv.backgroundColor = .red
        iv.contentMode = UIViewContentMode.scaleAspectFill
        return iv
    }()
    
    lazy var userNameLabel: UILabel = {
        let lab = UILabel()
        lab.text = "MyNameIs"
        lab.numberOfLines = 0
        lab.adjustsFontSizeToFitWidth = true
        lab.backgroundColor = .brown
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
        backgroundColor = .white
        setupViews()
    }
    
    private func setupViews() {
        let views = [userPicImageView, userNameLabel, menuTableView] as [UIView]
        views.forEach{addSubview($0)}
        setUpUserImage()
        setUpNameLabel()
        setUpTV()
    }
    
    
    private func setUpUserImage() {
        userPicImageView.snp.makeConstraints { (make) -> Void in
            make.height.width.equalTo(10)
            make.top.equalTo(self.snp.top).offset(75)
            make.left.equalTo(self.snp.left).offset(10)
            make.size.equalTo(self.snp.size).multipliedBy(0.7)
        }
    }
    
    
    private func setUpNameLabel() {
        userNameLabel.snp.makeConstraints { (make) -> Void in
            //make.height.equalTo(userPicImageView.snp.height)
            //make.right.equalTo(self).offset(5)
            make.left.equalTo(userPicImageView.snp.right).offset(10)
            make.top.equalTo(userPicImageView.snp.top)
            make.height.equalTo(userPicImageView.snp.height)
            make.width.equalTo(self.snp.width).multipliedBy(0.6)
        }
    }
    
    
    private func setUpTV() {
        menuTableView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(userNameLabel.snp.bottom).offset(10)
            make.centerY.equalTo(userNameLabel.snp.centerY)
        }
    }
    
    
    
}
