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
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
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
        commentLabel.text = comment.textComment
        constraintsViews()
    }
    
    private func constraintsViews() {
        addSubview(profileImageView)
        addSubview(commentLabel)
        profileImageView.snp.makeConstraints { (make) in
            make.height.width.equalTo(32)
            make.leading.equalTo(snp.leading).offset(8)
            make.centerY.equalTo(snp.centerY)
        }
        commentLabel.snp.makeConstraints { (make) in
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
