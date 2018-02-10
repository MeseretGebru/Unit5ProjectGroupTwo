//
//  CommentView.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 2/1/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class PostDetailView: UIScrollView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.gray
        label.font = UIFont(name: "Arial", size: 20)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var postImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.contentCompressionResistancePriority(for: .vertical)
        image.contentHuggingPriority(for: .vertical)
        image.image = #imageLiteral(resourceName: "panda")
        image.clipsToBounds = true
        return image
    }()
    
    lazy var userPostImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 6
        image.layer.borderColor = UIColor.black.cgColor
        image.layer.borderWidth = 2
        image.clipsToBounds = true
        return image
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.font = UIFont(name: "Arial", size: 20)
        return label
    }()
    
    lazy var upVote: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "ThumbUp"), for: .normal)
        button.tag = 0
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var numVotes: UILabel = {
        let label = UILabel()
        label.text = "# 0"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var downVote: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "ThumbDown"), for: .normal)
        button.tag = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    lazy var numComments: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textAlignment = .center
        return label
    }()
    
    lazy var newComment: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "CommentIcon"), for: .normal)
        return button
    }()
    
    lazy var profileImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.layer.borderColor = UIColor.lightGray.cgColor
        image.layer.borderWidth = 1.5
        image.clipsToBounds = true
        image.image = #imageLiteral(resourceName: "panda")
        return image
    }()
    
    lazy var commentTextField: UITextView = {
        let tv = UITextView()
        tv.isEditable = true
        tv.textColor = .lightGray
        tv.text = "Type your comment..."
        tv.font = UIFont(name: "Arial", size: 20)
        return tv
    }()
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.register(CommentTVCell.self, forCellReuseIdentifier: "Cell")
        tv.separatorStyle = .none
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        commentTextField.setNeedsLayout()
        profileImageView.setNeedsLayout()
        userPostImageView.setNeedsLayout()
        //profileImageView.layer.cornerRadius = profileImageView.bounds.width / 2
    }
    
    private func commonInit() {
        addSubview(titleLabel)
        addSubview(postImageView)
        addSubview(userPostImageView)
        addSubview(descriptionLabel)
        addSubview(upVote)
        addSubview(numVotes)
        addSubview(downVote)
        addSubview(numComments)
        addSubview(newComment)
        addSubview(profileImageView)
        addSubview(commentTextField)
        addSubview(tableView)
        constraints()
    }
    
    private func constraints() {
        titleLabel.snp.makeConstraints { (make) in
            make.width.equalTo(snp.width)
            make.top.equalTo(snp.top).offset(8)
            make.centerX.equalTo(snp.centerX)
        }
        postImageView.snp.makeConstraints { (make) in
            make.width.height.equalTo(snp.width)
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.centerX.equalTo(snp.centerX)
        }
        userPostImageView.snp.makeConstraints { (make) in
            make.centerY.equalTo(postImageView.snp.bottom)
            make.leading.equalTo(snp.leading).offset(16)
            make.height.width.equalTo(64)
        }
        descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(postImageView.snp.bottom).offset(8)
            make.leading.equalTo(userPostImageView.snp.trailing).offset(8)
            make.trailing.equalTo(postImageView.snp.trailing).offset(-8)
        }
        upVote.snp.makeConstraints { (make) in
            let ratio = (upVote.imageView?.image?.size.width)! / (upVote.imageView?.image?.size.height)!
            make.top.equalTo(descriptionLabel.snp.bottom).offset(8)
            make.leading.equalTo(postImageView.snp.leading).offset(8)
            make.height.equalTo(32)
            make.width.equalTo(upVote.snp.height).multipliedBy(ratio)
        }
        numVotes.snp.makeConstraints { (make) in
            make.leading.equalTo(upVote.snp.trailing).offset(8)
            make.width.equalTo(69)
            make.centerY.equalTo(upVote.snp.centerY)
        }
        downVote.snp.makeConstraints { (make) in
            let ratio = (downVote.imageView?.image?.size.width)! / (downVote.imageView?.image?.size.height)!
            make.leading.equalTo(numVotes.snp.trailing).offset(8)
            make.height.equalTo(upVote)
            make.width.equalTo(upVote.snp.height).multipliedBy(ratio)
            make.centerY.equalTo(upVote)
        }

        numComments.snp.makeConstraints { (make) in
            make.leading.equalTo(downVote.snp.trailing).offset(69)
            make.centerY.equalTo(upVote)
            make.height.equalTo(upVote)
        }
        newComment.snp.makeConstraints { (make) in
            let ratio = (newComment.image(for: .normal)?.size.width)! / (newComment.image(for: .normal)?.size.height)!
            make.leading.equalTo(numComments.snp.trailing).offset(8)
            make.height.equalTo(upVote)
            make.width.equalTo(newComment.snp.height).multipliedBy(ratio)
            make.centerY.equalTo(numComments)
        }

        profileImageView.snp.makeConstraints { (make) in
            make.height.width.equalTo(40)
            make.leading.equalTo(postImageView.snp.leading).offset(16)
            make.top.equalTo(upVote.snp.bottom).offset(8)
        }
        commentTextField.snp.makeConstraints { (make) in
            make.leading.equalTo(profileImageView.snp.trailing).offset(16)
            make.trailing.equalTo(postImageView.snp.trailing).offset(-8)
            make.centerY.equalTo(profileImageView.snp.centerY)
            make.height.equalTo(profileImageView)
        }

        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(profileImageView.snp.bottom).offset(32)
            make.leading.equalTo(postImageView.snp.leading).offset(8)
            make.trailing.equalTo(postImageView.snp.trailing).offset(-8)
            make.bottom.equalTo(self.snp.bottom).offset(-8)
            make.height.equalTo(self).multipliedBy(0.7)
        }
    }
}
