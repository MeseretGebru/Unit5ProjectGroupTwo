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
        //        userPostsView.postTableView.estimatedRowHeight = 200
        addSubViews()
        loadData()
        //        fetchPosts()
        //        if let user = Auth.auth().currentUser {
        //            self.user = user
        //        }
        
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
    
    //    func fetchPosts(){
    
    //        Database.database().reference().child("posts").observeEventType(.childAdded, withBlock: {(snapshot) in
    //            if let dictionary = snapshot.value as? [String: AnyObject] {
    //                let posts = [Post]()
    //                posts.setValuesForkeyWithDictionary(dictionary)
    //                self.userPostsView.post.append(posts)
    //                dispatch_async(dispatch_get_main_queue(), {
    //
    //                    userPostsView.postTableView.reloadData()
    //                })
    //                posts.description = dictionary["name"]
    //            }
    //        }, withCancelBlock: nil)
    //   }
    
    
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //TODO: Add array count check if there is a post??
        return posts.count
        
    }
    /* func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? UserPostsTableViewCell
     let post = posts[indexPath.row]
     
     PostService.manager.getImagePost(urlImage: post.imageURL) { (image) in
     cell?.userPostImage.image = image
     //cell?.feedImageView.image = image
     cell?.layoutIfNeeded()
     }
     cell?.descriptionLabel.text = post.postContent
     //cell?.titleLabel.text = post.postContent
     
     return cell!
     
     }*/
    
    //copied from feed table view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! FeedTableViewCell
        tableView.estimatedRowHeight = 150
        tableView.rowHeight = UITableViewAutomaticDimension
        
         cell.layoutIfNeeded()
        if tableView == userPostsView.postTableView {
            let post = posts[indexPath.row]
            
            cell.titleLabel.text = post.postTitle
            let haveUser: (UserProfile?) -> Void = { user in
                guard let user = user else { return }
                cell.userLabel.text = user.displayName
                let userImageUrl = user.imageURL
                cell.userImageView.kf.setImage(with: URL(string: userImageUrl), placeholder: #imageLiteral(resourceName: "frog"), options: nil, progressBlock: nil) { (image, error, cacherType, url) in
                }
            }
                let postOwnerUID = post.user
                UserService.manager.getUser(uid: postOwnerUID, completion: haveUser)
                let imageUrl = post.imageURL
                cell.feedImageView.kf.indicatorType = .activity
                cell.feedImageView.kf.setImage(with: URL.init(string: imageUrl) , placeholder: #imageLiteral(resourceName: "noImage"), options: nil, progressBlock: nil) { (image, error, cacheType, url) in
                    
            
           /*cell.configureCell(from: post)
            cell.setNeedsLayout()
            return cell*/
//            PostService.manager.getImagePost(urlImage: post.imageURL) { (image) in
//                cell.feedImageView.image = image
//                cell.titleLabel.text = post.postContent
//                cell.layoutIfNeeded()
//            }
//            // add handles to these buttons in cell
//            cell.moreButton.addTarget(self, action: #selector(moreButtonPressed), for: .touchUpInside)
//            cell.upvoteButton.tag = indexPath.row
//            cell.downvoteButton.tag = indexPath.row
//            cell.moreButton.tag = indexPath.row
//            cell.upvoteButton.addTarget(self, action: #selector(self.upvotePressed(sender:)), for: .touchUpInside)
//            cell.downvoteButton.addTarget(self, action: #selector(downvotePressed(sender:)), for: .touchUpInside)
//
//        }
//        return cell
    }
    
//    @objc func upvotePressed(sender: UIButton) {
//        PostService.manager.updateUpVote(of: self.posts[sender.tag])
//    }
//    @objc func downvotePressed(sender: UIButton) {
//        PostService.manager.updateDownVote(of: self.posts[sender.tag])
//    }
//    @objc func moreButtonPressed() {
//
    
    return cell
    }
        return cell
}
    
   
}


