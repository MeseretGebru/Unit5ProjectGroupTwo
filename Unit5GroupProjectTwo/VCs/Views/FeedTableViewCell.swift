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
        img.contentMode = .scaleAspectFill
        return img
    }()
    lazy var userLabel: UILabel = {
        let lab = UILabel()
        lab.text = "UserNameHere"
        lab.backgroundColor = UIColor.orange
        return lab
    }()
    lazy var feedImageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        return img
    }()
    lazy var actionsStackView: UIView = {
       let view = UIView()
        return view
    }()
    lazy var upvoteButton: UIButton = {
        let butt = UIButton()
        butt.setTitle("Upvote", for: .normal)
        return butt
    }()
    lazy var downvoteButton: UIButton = {
        let butt = UIButton()
        butt.setTitle("Downvote", for: .normal)
        return butt
    }()
    lazy var commentButton: UIButton = {
        let butt = UIButton()
        butt.setTitle("Comment", for: .normal)
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
        setupFeedImageView()
        setupActionStackView()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setupUserImageView() {
        addSubview(userImageView)
        userImageView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(15)
            make.top.equalToSuperview().offset(15)
        }
    }
    func setupUserLabel() {
        addSubview(userLabel)
        userLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(userImageView.snp.trailing).offset(15)
            make.top.equalToSuperview().offset(15)
        }
    }
    func setupFeedImageView() {
        addSubview(feedImageView)
        feedImageView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalTo(userImageView.snp.bottom).offset(18)
            make.height.equalToSuperview().multipliedBy(0.7)
        }
    }
    func setupActionStackView() {
        addSubview(actionsStackView)
        actionsStackView.addSubview(upvoteButton)
        actionsStackView.addSubview(downvoteButton)
        actionsStackView.addSubview(commentButton)
      
        actionsStackView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview()
            make.top.equalTo(feedImageView.snp.bottom).offset(15)
            make.bottom.equalToSuperview().offset(15)
            
        }
        upvoteButton.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leadingMargin.equalToSuperview().offset(15)
        }
        downvoteButton.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leadingMargin.equalTo(upvoteButton.snp.trailing).offset(20)
        }
        commentButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }

}
