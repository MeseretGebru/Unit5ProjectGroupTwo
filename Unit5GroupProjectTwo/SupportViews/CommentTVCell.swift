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
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
//    lazy var mainStackView: UIStackView = {
//        let stView = UIStackView()
//        stView.axis  = UILayoutConstraintAxis.horizontal
//        stView.distribution  = UIStackViewDistribution.fill
//        stView.alignment = UIStackViewAlignment.center
//        stView.spacing   = 8.0
//        return stView
//    }()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        constraintsViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        constraintsViews()
    }
    
    func configureCell(comment: Comment) {
//        constraintsViews()
        commentLabel.text = comment.textComment
//        setNeedsLayout()
    }
    
    private func constraintsViews() {
//        addSubview(mainStackView)
//        mainStackView.addArrangedSubview(profileImageView)
//        mainStackView.addArrangedSubview(commentLabel)
        addSubview(profileImageView)
        addSubview(commentLabel)
        profileImageView.snp.makeConstraints { (make) in
            make.height.width.equalTo(32)
//            make.top.equalTo(snp.top).offset(8)
            make.leading.equalTo(snp.leading).offset(8)
            make.centerY.equalTo(snp.centerY)
        }
        commentLabel.snp.makeConstraints { (make) in
            //make.height.equalTo(64)
            make.top.equalTo(snp.top).offset(8)
            make.leading.equalTo(profileImageView.snp.trailing).offset(16)
            make.trailing.equalTo(snp.trailing).offset(-8)
            make.centerY.equalTo(profileImageView.snp.centerY)
            make.bottom.equalTo(snp.bottom).offset(-8)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2
    }
    
}
