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
            make.leading.equalToSuperview().offset(8)
            make.top.equalToSuperview().offset(8)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
    }
    func setupUserLabel() {
        addSubview(userName)
        addSubview(userEmail)
        userName.snp.makeConstraints { (make) in
            make.leading.equalTo(userImageView.snp.trailing).offset(15)
            make.top.equalToSuperview().offset(15)
        }
        userEmail.snp.makeConstraints { (make) in
            make.leading.equalTo(userName.snp.leading)
            make.top.equalTo(userName.snp.bottom).offset(4)
        }
    }
    func setupTitleLabel() {
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(userImageView.snp.bottom).offset(8)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
    func setupFeedImageView() {
        addSubview(feedImageView)
        feedImageView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.centerX.equalTo(snp.centerX)
            //make.trailing.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom)
            make.bottom.equalTo(snp.bottom).offset(-30)
        }
    }
    func setupActionStackView() {
        addSubview(actionsStackView)
        
        actionsStackView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalTo(feedImageView.snp.bottom)
            make.bottom.equalToSuperview().offset(-8)
            make.height.equalTo(40)
            
        }
        actionsStackView.addSubview(upvoteButton)
        actionsStackView.addSubview(upvoteCount)
        actionsStackView.addSubview(downvoteButton)
        actionsStackView.addSubview(commentButton)
        actionsStackView.addSubview(moreButton)
        
        upvoteButton.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leadingMargin.equalToSuperview().offset(15)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(25)
        }
        upvoteCount.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leadingMargin.equalTo(upvoteButton.snp.trailing).offset(15)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(25)
        }
        downvoteButton.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leadingMargin.equalTo(upvoteCount.snp.trailing).offset(15)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(25)
        }
        commentButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(snp.centerX)
            make.centerY.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(25)
        }
        moreButton.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.trailingMargin.equalToSuperview().offset(-15)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(25)
        }
    }

    func configureCell(from post: Post) {
        titleLabel.text = post.postTitle
        upvoteCount.text = "\(post.countOfUp)"
        // userLabel.text =
        let postOwnerUID = post.user
        UserService.manager.getUser(uid: postOwnerUID, completion: { (onlineUser) in
            if let userProfile = onlineUser {
                self.userName.text = userProfile.displayName
                self.userEmail.text = userProfile.email
                do {
                    if let url = URL(string: userProfile.imageURL) {
                        let data = try Data.init(contentsOf: url)
                        let image = UIImage.init(data: data)
                        self.userImageView.image = image
                        //self.userImageButton.setImage(image, for: .normal)
                    }
                } catch {
                    print("error")
                }
            }
            
        })
        let imageUrl = post.imageURL
        feedImageView.kf.indicatorType = .activity
        feedImageView.kf.setImage(with: URL.init(string: imageUrl) , placeholder: #imageLiteral(resourceName: "noImage"), options: nil, progressBlock: nil) { (image, error, cacheType, url) in
            
        }
        
    }
}

