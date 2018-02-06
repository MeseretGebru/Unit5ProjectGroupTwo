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
            commentView.tableView.reloadData()
            commentView.numComments.text = "\(self.comments.count) comment(s)"
        }
    }
    
    var post: Post!
    let commentView = PostDetailView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Comments"
//        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "add"), style: .done, target: self, action: #selector(addComment))
        viewContraints()
        loadData()
        view.backgroundColor = .white
        delegates()
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
        commentView.titleLabel.text = post.postContent
        let postRef = self.post.ref
        self.comments = CommentService.manager.getPostComments(from: postRef.key)
        commentView.tableView.delegate = self
        commentView.tableView.dataSource = self
    }
    
    func saveComment(text: String) {
        CommentService.manager.saveNewComment(postKey: self.post.ref.key, content: text)
    }
    
}
