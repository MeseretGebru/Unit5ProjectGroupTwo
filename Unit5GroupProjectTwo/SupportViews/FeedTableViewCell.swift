//
//  FeedTableViewCell.swift
//  
//
//  Created by C4Q on 1/30/18.
//

import UIKit
import SnapKit
import Kingfisher
import Firebase

class FeedTableViewCell: UITableViewCell {
    
    lazy var userImageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        return img
    }()
    lazy var userName: UILabel = {
        let lab = UILabel()
        lab.font = UIFont(name: "Arial", size: 18)
        return lab
    }()
    lazy var userEmail: UILabel = {
        let lab = UILabel()
        lab.font = UIFont(name: "Arial", size: 14)
        lab.textColor = UIColor.lightGray
        return lab
    }()
    lazy var titleLabel: UILabel = {
        let lab = UILabel()
        lab.text = "Title here"
        return lab
    }()
    lazy var feedImageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        return img
    }()
    lazy var actionsStackView: UIView = {
        let view = UIView()
        // view.backgroundColor = .yellow
        return view
    }()
    lazy var upvoteButton: UIButton = {
        let butt = UIButton()
        butt.setImage(#imageLiteral(resourceName: "ThumbUp"), for: .normal)
        butt.imageView?.contentMode = .scaleAspectFit
        return butt
    }()
    lazy var upvoteCount: UILabel = {
       let lab = UILabel()
        lab.textAlignment = .center
        return lab
    }()
    lazy var downvoteButton: UIButton = {
        let butt = UIButton()
        butt.setImage(#imageLiteral(resourceName: "ThumbDown"), for: .normal)
        butt.imageView?.contentMode = .scaleAspectFit
        return butt
    }()
    lazy var commentButton: UIButton = {
        let butt = UIButton()
        butt.setImage(#imageLiteral(resourceName: "CommentIcon"), for: .normal)
        butt.imageView?.contentMode = .scaleAspectFit
        return butt
    }()
    lazy var moreButton: UIButton = {
        let butt = UIButton()
        butt.setImage(#imageLiteral(resourceName: "more"), for: .normal)
        butt.imageView?.contentMode = .scaleAspectFit
        return butt
    }()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "FeedCell")
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    func commonInit() {
        setupViews()
    }
    func setupViews() {
        setupUserImageView()
        setupUserLabel()
        setupTitleLabel()
        setupFeedImageView()
        setupActionStackView()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        userImageView.layer.cornerRadius = userImageView.bounds.width / 2.0
        userImageView.layer.masksToBounds = true
        userImageView.layer.borderColor = UIColor.black.cgColor
        userImageView.layer.borderWidth = 2.0
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func setupUserImageView() {
        addSubview(userImageView)
        userImageView.snp.makeConstraints { (make) in
            make.left.equalTo(snp.left).offset(8)
            make.top.equalTo(snp.top).offset(8)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
    }
    func setupUserLabel() {
        addSubview(userName)
        addSubview(userEmail)
        userName.snp.makeConstraints { (make) in
            make.left.equalTo(userImageView.snp.right).offset(15)
            make.bottom.equalTo(userImageView.snp.centerY).offset(-8)
        }
        userEmail.snp.makeConstraints { (make) in
            make.left.equalTo(userName.snp.left)
            make.top.equalTo(userName.snp.centerY).offset(8)
        }
    }
    func setupTitleLabel() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(userImageView.snp.bottom).offset(8)
            make.left.equalTo(snp.left)
            make.right.equalTo(snp.right)
        }
    }
    func setupFeedImageView() {
        addSubview(feedImageView)
        feedImageView.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.centerX.equalTo(snp.centerX)
            make.width.equalTo(snp.width)
            make.bottom.equalTo(snp.bottom).offset(-44)
        }
    }
    func setupActionStackView() {
        addSubview(actionsStackView)
        
        actionsStackView.snp.makeConstraints { (make) in
            make.left.equalTo(snp.left)
            make.right.equalTo(snp.right)
            make.bottom.equalTo(snp.bottom).offset(-8)
            make.height.equalTo(40)
            
        }
        actionsStackView.addSubview(upvoteButton)
        actionsStackView.addSubview(upvoteCount)
        actionsStackView.addSubview(downvoteButton)
        actionsStackView.addSubview(commentButton)
        actionsStackView.addSubview(moreButton)
        
        upvoteButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(actionsStackView.snp.centerY)
            make.left.equalTo(actionsStackView.snp.left).offset(15)
            make.width.height.equalTo(25)
        }
        upvoteCount.snp.makeConstraints { (make) in
            make.centerY.equalTo(actionsStackView.snp.centerY)
            make.left.equalTo(upvoteButton.snp.right).offset(15)
            make.width.height.equalTo(25)
        }
        downvoteButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(actionsStackView.snp.centerY)
            make.left.equalTo(upvoteCount.snp.right).offset(15)
            make.width.height.equalTo(25)
        }
        commentButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(snp.centerX)
            make.centerY.equalTo(actionsStackView.snp.centerY)
            make.width.height.equalTo(25)
        }
        moreButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(actionsStackView.snp.centerY)
            make.right.equalTo(actionsStackView.snp.right).offset(-15)
            make.width.height.equalTo(25)
        }
    }

    func configureCell(from post: Post) {
        setupViews()
        titleLabel.text = post.postTitle
        upvoteCount.text = "\(post.countOfUp)"
        let postOwnerUID = post.user
        let imageUrl = post.imageURL
        ImageService.manager.getImage(from: imageUrl) { (imageOnline) in
            if let image = imageOnline {
                self.feedImageView.image = image
                self.feedImageView.setNeedsLayout()
            }
        }
        UserService.manager.getUser(uid: postOwnerUID, completion: { (onlineUser) in
            if let userProfile = onlineUser {
                self.userName.text = userProfile.displayName
                self.userEmail.text = userProfile.email
                ImageService.manager.getImage(from: userProfile.imageURL) { (imageOnline) in
                    if let image = imageOnline {
                        self.userImageView.image = image
                        self.userImageView.setNeedsLayout()
                    }
                }
            }
        })
    }
}

