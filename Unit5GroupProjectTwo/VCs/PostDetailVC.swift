//
//  PostDetailViewController.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 2/1/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import SnapKit

class PostDetailVC: UIViewController {
    var comments = [Comment]() {
        didSet {
            DispatchQueue.main.async {
                self.commentView.tableView.reloadData()
                self.commentView.numComments.text = "\(self.comments.count)"
            }
        }
    }
    var currentUser: UserProfile!
    var post: Post!
    let commentView = PostDetailView()
    init(post: Post) {
        super.init(nibName: nil, bundle: nil)
        self.post = post
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("decoder fail to build: \(aDecoder)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Comments"
        delegates()
        viewContraints()
        loadData()
//        commentView.tableView.rowHeight = UITableViewAutomaticDimension
//        commentView.tableView.estimatedRowHeight = 50
        commentView.upVote.addTarget(self, action: #selector(votes(_:)), for: .touchUpInside)
        commentView.downVote.addTarget(self, action: #selector(votes(_:)), for: .touchUpInside)
    }
    
    @objc func votes(_ sender: UIButton) {
        if sender.tag == 0 {
            VoteService.manager.saveNewVote(postId: post.postId, upVote: 1, downVote: nil)
        } else {
            VoteService.manager.saveNewVote(postId: post.postId, upVote: nil, downVote: 1)
        }
    }
    
    private func delegates() {
        commentView.commentTextField.delegate = self
        commentView.tableView.delegate = self
        commentView.tableView.dataSource = self
    }
    
    private func viewContraints() {
        view.addSubview(commentView)
        commentView.snp.makeConstraints { (make) in
            make.edges.equalTo(view.safeAreaLayoutGuide.snp.edges)
        }
    }
    private func loadData() {
        commentView.titleLabel.text = post.postTitle
        commentView.descriptionLabel.text = post.postContent
        PostService.manager.getImagePost(urlImage: post.imageURL) { (image) in
            self.commentView.postImageView.image = image
        }
        UserService.manager.getUser(uid: post.user) { (userProfileImage) in
            if let userImage = userProfileImage {
                if let imageURL = URL(string: userImage.imageURL) {
                    self.commentView.userPostImageView.kf.setImage(with: imageURL)
                }
            }
        }
        loadComments()
    }
    
    func loadComments() {
        CommentService.manager.getPostComments(from: post.postId) { (commentsOnline) in
            if let comments = commentsOnline {
                self.comments = comments
            }
        }
    }
    
    func saveComment(text: String) {
        CommentService.manager.saveNewComment(postKey: self.post.ref.key, content: text)
    }
}
