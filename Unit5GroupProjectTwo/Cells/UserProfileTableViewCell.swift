//
//  UserSettingTableViewCell.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 1/29/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit


class UserProfileTableViewCell: UITableViewCell {

    
    lazy var userPostImage: UIImageView = {
        let userPostImage = UIImageView()
        return userPostImage
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "ProfileCell")
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
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
    
    private func setupViews() {
        addSubview(userPostImage)
        addSubview(descriptionLabel)
        
//        userPostImage.snp.makeConstraints { (image) in
//            image.edges.equalTo(self)
//        }
//        descriptionLabel.snp.makeConstraints { (label) in
//            label.trailing.leading.equalTo(self).inset(8)
//            label.centerY.equalTo(self)
//            label.height.equalTo(80)
//        }
    }
    
    
    
    
    
    
    
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
