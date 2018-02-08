//
//  CommentView.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 2/1/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class PostDetailView: UIScrollView {

    lazy var postImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        //image.image = #imageLiteral(resourceName: "c4q-logo")
        image.image = #imageLiteral(resourceName: "panda")
        image.layer.cornerRadius = image.frame.size.width / 2
        image.clipsToBounds = true
//        image.backgroundColor = .orange
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.gray
        label.font = UIFont(name: "Arial", size: 16)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var upVote: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "ThumbUp"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.backgroundColor = .red
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
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.backgroundColor = .red
        return button
    }()
    
//    lazy var voteStackView: UIStackView = {
//        let stView = UIStackView()
//        stView.axis  = UILayoutConstraintAxis.horizontal
//        stView.distribution  = UIStackViewDistribution.fillEqually
//        stView.alignment = .center
//        stView.spacing = 8.0
//        return stView
//    }()
    
    lazy var numComments: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textAlignment = .center
        return label
    }()
    
    lazy var newComment: UIButton = {
        let button = UIButton()

       // button.setImage(#imageLiteral(resourceName: "icoComment"), for: .normal)
        button.setImage(#imageLiteral(resourceName: "CommentIcon"), for: .normal)
        return button
    }()
    
//    lazy var headerL2: UIStackView = {
//        let stView = UIStackView()
//        stView.axis  = UILayoutConstraintAxis.horizontal
//        stView.distribution  = UIStackViewDistribution.fill
//        stView.alignment = UIStackViewAlignment.center
//        stView.spacing   = 8.0
//        return stView
//    }()
    
    lazy var profileImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.layer.borderColor = UIColor.lightGray.cgColor
        image.layer.borderWidth = 1.5
        image.layer.cornerRadius = image.frame.size.width / 2
        image.clipsToBounds = true

        image.image = #imageLiteral(resourceName: "panda")
//        image.backgroundColor = .orange
        return image
    }()
    
    lazy var commentTextField: UITextView = {
        let textField = UITextView()
        textField.isEditable = true
        textField.textColor = .lightGray
        textField.text = "Type your comment..."
        textField.font = UIFont(name: "Arial", size: 16)
//        textField.backgroundColor = .green
        return textField
    }()
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.register(CommentTVCell.self, forCellReuseIdentifier: "Cell")
        //tv.translatesAutoresizingMaskIntoConstraints = false
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
        // make profile image a circle
        profileImageView.setNeedsLayout()
        //profileImageView.layer.cornerRadius = profileImageView.bounds.width / 2
    }
    
    private func commonInit() {
//        backgroundColor = .cyan
//        addSubview(headerStackView)
        addSubview(postImageView)
        addSubview(titleLabel)
////        addSubview(headerL2)
//        addSubview(voteStackView)
        addSubview(upVote)
        addSubview(numVotes)
        addSubview(downVote)
        addSubview(numComments)
        addSubview(newComment)
////        addSubview(commentStackView)
        addSubview(profileImageView)
        addSubview(commentTextField)
        addSubview(tableView)
        constraints()
    }
    
    private func constraints() {
//        headerStackView.snp.makeConstraints { (make) in
//            make.top.equalTo(self.snp.top).offset(8)
//            make.left.equalTo(self.snp.left).offset(8)
//            make.right.equalTo(self.snp.right).offset(-8)
//            make.height.equalTo(self.snp.height).multipliedBy(0.5)
//        }
//        commentStackView.snp.makeConstraints { (make) in
//            make.centerX.equalTo(headerStackView.snp.centerX)
//            make.bottom.equalTo(headerStackView.snp.bottom).offset(-8)
//        }
        postImageView.snp.makeConstraints { (make) in
//            make.bottom.equalTo(titleLabel.snp.top)
            make.width.equalTo(snp.width)
            make.top.equalTo(snp.top).offset(8)
            make.centerX.equalTo(snp.centerX)
            make.height.equalTo(postImageView.snp.width)
        }
        titleLabel.snp.makeConstraints { (make) in
            make.width.equalTo(snp.width)
            make.top.equalTo(postImageView.snp.bottom)
            //            make.bottom.equalTo(profileImageView.snp.top)
        }
        upVote.snp.makeConstraints { (make) in
            let ratio = (upVote.imageView?.image?.size.width)! / (upVote.imageView?.image?.size.height)!
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
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
//            make.trailing.equalTo(postImageView).offset(-8)
//            make.width.equalTo(<#T##other: ConstraintRelatableTarget##ConstraintRelatableTarget#>)
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
            make.left.equalTo(snp.left).offset(16)
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
//            make.top.equalTo(commentTextField.snp.bottom).offset(8)
            make.leading.equalTo(postImageView.snp.leading).offset(8)
            make.trailing.equalTo(postImageView.snp.trailing).offset(-8)
            make.bottom.equalTo(self.snp.bottom).offset(-8)
            make.height.equalTo(self).multipliedBy(0.7)
        }
    }
}
