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
    
    var user: User!
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
        addSubViews()
        loadData()
        fetchPosts()
        if let user = Auth.auth().currentUser {
            self.user = user
        }
        
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
    
    func fetchPosts(){
        
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
        
    }
//        PostService.manager.getImagePost(urlImage: posts.imageURL) { (onlineimage) in
//
//            user = UserService.manager.getUsers(user)
//
//            userPostView.profileImage.image = UserService.manager.getImageProfile(urlImage: user.imageURL)
//            
//            //#imageLiteral(resourceName: "PrettyCat")
//            userPostsView.postTableView.reloadData()
//        }
    
}

extension UserPostsVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //TODO: Add array count check if there is a post??
        return posts.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? UserPostsTableViewCell
        let post = posts[indexPath.row]
        
        PostService.manager.getImagePost(urlImage: post.imageURL) { (image) in
            cell?.userPostImage.image = image
            cell?.layoutIfNeeded()
        }
        cell?.descriptionLabel.text = post.postContent
        //cell.userImageView.image = PostService.manager.getImagePost(urlImage: post.imageURL)
        return cell!

    }

    
   
}
    


