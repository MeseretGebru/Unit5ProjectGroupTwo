//
//  FeedTableViewCell.swift
//  
//
//  Created by C4Q on 1/30/18.
//

import UIKit
import SnapKit

class FeedTableViewCell: UITableViewCell {

    lazy var userImageView: UIImageView = {
        let img = UIImageView()
        img.backgroundColor = .blue
        img.contentMode = .scaleAspectFill
        return img
    }()
    lazy var userLabel: UILabel = {
        let lab = UILabel()
        lab.text = "UserNameHere"
        lab.backgroundColor = UIColor.orange
        return lab
    }()
    lazy var titleLabel: UILabel = {
        let lab = UILabel()
        lab.text = "Title here"
        return lab
    }()
    lazy var feedImageView: UIImageView = {
        let img = UIImageView()
        img.backgroundColor = .red
       img.contentMode = .scaleAspectFit
        return img
    }()
    lazy var actionsStackView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    lazy var upvoteButton: UIButton = {
        let butt = UIButton()
        butt.setImage(#imageLiteral(resourceName: "ThumbUp"), for: .normal)
        butt.imageView?.contentMode = .scaleAspectFit
        return butt
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
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "FeedTableCell")
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
        addSubview(userLabel)
        userLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(userImageView.snp.trailing).offset(15)
            make.top.equalToSuperview().offset(15)
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
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
         
        }
    }
    func setupActionStackView() {
        addSubview(actionsStackView)
      
        actionsStackView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalTo(feedImageView.snp.bottom).offset(15)
            make.bottom.equalToSuperview().offset(-8)
            make.height.equalTo(25)

        }
        actionsStackView.addSubview(upvoteButton)
        actionsStackView.addSubview(downvoteButton)
        actionsStackView.addSubview(commentButton)
        
        upvoteButton.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leadingMargin.equalToSuperview().offset(15)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.equalTo(25)
        }
        downvoteButton.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leadingMargin.equalTo(upvoteButton.snp.trailing).offset(20)
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
    }

}
