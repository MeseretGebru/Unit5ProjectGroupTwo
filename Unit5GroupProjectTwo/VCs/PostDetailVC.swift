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
//        currentUser = UserService.manager.getUser(user: Auth.auth().currentUser!)
        delegates()
        viewContraints()
        loadData()
        commentView.tableView.rowHeight = UITableViewAutomaticDimension
        commentView.tableView.estimatedRowHeight = 50
    }
    
    private func delegates() {
        commentView.commentTextField.delegate = self
//        commentView.descriptionView.delegate = self
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
//        print(commentView.contentInset.top)
        commentView.descriptionLabel.text = post.postContent
//        commentView.contentInset.top = 0
//        print(commentView.contentInset.top)
        PostService.manager.getImagePost(urlImage: post.imageURL) { (image) in
            self.commentView.postImageView.image = image
            self.commentView.postImageView.snp.remakeConstraints({ (make) in
                let ratio = image.size.height / image.size.width
                make.width.equalTo(self.commentView.snp.width)
                make.top.equalTo(self.commentView.titleLabel.snp.bottom).offset(8)
                make.centerX.equalTo(self.commentView.snp.centerX)
                make.height.equalTo(self.commentView.postImageView.snp.width).multipliedBy(ratio)
            })
            self.commentView.setNeedsLayout()
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
