//
//  CommentTVCell.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 2/1/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit

class CommentTVCell: UITableViewCell {

    lazy var profileImageView: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "panda")
        image.clipsToBounds = true
        return image
    }()
    
    lazy var commentLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .justified
        label.numberOfLines = 0
        return label
    }()
    
    lazy var mainStackView: UIStackView = {
        let stView = UIStackView()
        stView.axis  = UILayoutConstraintAxis.horizontal
        stView.distribution  = UIStackViewDistribution.fill
        stView.alignment = UIStackViewAlignment.center
        stView.spacing   = 8.0
        return stView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        constraintsViews()
    }
    
    func configureCell(comment: Comment) {
        
        commentLabel.text = comment.textComment
    }
    
    private func constraintsViews() {
        addSubview(mainStackView)
        mainStackView.addArrangedSubview(profileImageView)
        mainStackView.addArrangedSubview(commentLabel)
        profileImageView.snp.makeConstraints { (make) in
            make.height.width.equalTo(64)
            make.top.equalTo(snp.top).offset(8)
            make.left.equalTo(snp.left).offset(8)
        }
        commentLabel.snp.makeConstraints { (make) in
            make.height.equalTo(64)
            make.left.equalTo(profileImageView).offset(16)
            make.right.equalTo(snp.right).offset(-8)
            make.centerY.equalTo(profileImageView.snp.centerY)
        }
    }

}
