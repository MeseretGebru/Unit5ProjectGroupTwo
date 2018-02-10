//
//  UserPostsViewController.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 2/1/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import SnapKit

class UserPostsVC: UIViewController {
    
    let userPostsView = UserPostsView()
    var user: UserProfile!
    
    public var posts = [Post](){
        didSet{
            userPostsView.postTableView.reloadData()
            DispatchQueue.main.async {
                self.userPostsView.postTableView.reloadData()
                //self.userPostsView.userNameLabel.text = "\(self.posts.user) comment(s)"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavBar()
        userPostsView.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .yellow
        userPostsView.postTableView.delegate = self
        userPostsView.postTableView.dataSource = self
        userPostsView.postTableView.rowHeight = 150
        addSubViews()
        loadData()
        
    }
    private func configureNavBar() {
        navigationItem.title = "Posts"
        let backButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: self, action: #selector(back))
        navigationItem.leftBarButtonItem = backButton
        //            navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(dismissView))
    }
    
    private func addSubViews(){
        view.addSubview(userPostsView)
        addConstraints()
    }
    
    
    @objc private func back(){
        dismissView()
    }
    
    @objc private func dismissView() {
        dismiss(animated: true, completion: nil)
    }
    
    private func addConstraints(){
        userPostsView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
    }
    
    
    private func loadData() {
        if let currentUser = Auth.auth().currentUser {
            userPostsView.userNameLabel.text! = currentUser.displayName ?? "No user's name"
            
            UserService.manager.getUser(uid: currentUser.uid, completion: { (userOnline) in
                if let userProfile = userOnline {
                    if let imageURL = URL(string: userProfile.imageURL) {
                        self.userPostsView.profileImage.kf.setImage(with: imageURL)
                    }
                }
            })
            
            PostService.manager.getUserPosts(from: currentUser.uid, completion: { (postsOnline) in
                if let posts = postsOnline {
                    self.posts = posts
                }
                self.userPostsView.NumberofPostsLabel.text! = "Number of posts: \(self.posts.count)"
            })
            
        }
        
    }
}

extension UserPostsVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if posts.count == 0 {
            return view.layer.bounds.height * 0.40
        } else {
            return UITableViewAutomaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.layer.bounds.height * 0.40
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //TODO: Add array count check if there is a post??
        return posts.count
        
    }
    
    //copied from feed table view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! FeedTableViewCell
        tableView.estimatedRowHeight = 150
        tableView.rowHeight = UITableViewAutomaticDimension
        
        cell.layoutIfNeeded()
        if tableView == userPostsView.postTableView {
            let post = posts[indexPath.row]
            cell.upvoteCount.text = " \(post.countOfUp)"
            cell.titleLabel.text = post.postTitle
            let haveUser: (UserProfile?) -> Void = { user in
                guard let user = user else { return }
                cell.userName.text = user.displayName
                let userImageUrl = user.imageURL
                cell.userImageView.kf.setImage(with: URL(string: userImageUrl), placeholder: #imageLiteral(resourceName: "frog"), options: nil, progressBlock: nil) { (image, error, cacherType, url) in
                }
            }
            let postOwnerUID = post.user
            UserService.manager.getUser(uid: postOwnerUID, completion: haveUser)
            let imageUrl = post.imageURL
            cell.feedImageView.kf.indicatorType = .activity
            cell.feedImageView.kf.setImage(with: URL.init(string: imageUrl) , placeholder: #imageLiteral(resourceName: "noImage"), options: nil, progressBlock: nil) { (image, error, cacheType, url) in
            }
            
            return cell
        }
        return cell
    }
    
    
}


