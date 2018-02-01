//
//  PostViewController.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 1/29/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class PostViewController: UIViewController {
    var posts = [Post]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.delegate = self
//        tableView.dataSource = self
        navigationController?.navigationBar.barTintColor = .red
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        navigationController?.navigationBar.isTranslucent = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "add"), style: .done, target: self, action: #selector(addPost))
        navigationItem.title = "Posts"
        loadData()
        view.backgroundColor = .orange
        viewConstrainsts()
    }
    
    private func viewConstrainsts() {
        view.addSubview(tableView)
        tableView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor).isActive = true
        tableView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tableView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
    }
    
    private func loadData() {
        let postRef = Database.database().reference().child("posts")
        postRef.observe(.value) { (snapShot) in
            var posts = [Post]()
            for post in snapShot.children {
                let newPost = Post(snapShot: post as! DataSnapshot)
                posts.insert(newPost, at: 0)
            }
            self.posts = posts
        }
    }
    
    @objc private func addPost() {
        let newPost = UIAlertController(title: "New Post", message: "Please write your post", preferredStyle: .alert)
        newPost.addTextField { (textField) in
            textField.placeholder = "New post"
        }
        newPost.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        newPost.addAction(UIAlertAction(title: "Save", style: .default, handler: { (action) in
            if let message = newPost.textFields?.first?.text {
                self.savePost(text: message)
            }
        }))
        present(newPost, animated: true, completion: nil)
    }
    
    private func savePost(text: String) {
        let id = Database.database().reference().child("posts").childByAutoId()
        let post = Post(postId: id.key, postImageStringUrl: "No post image so far", userImageStringUrl: "No user image so far", content: text, userName: "User1")
        id.setValue(post.toAnyObject())
        self.loadData()
    }
}
