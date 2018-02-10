//
//  UserProfileViewController.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 1/29/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit
import FirebaseAuth
import Kingfisher

// will have titleLabel,userNameLabel,lastLoginLabel,numberOfPostsLabel and latestPostLabel
//text fields accordingly
//tableView

class UserProfileVC: UIViewController {

    let userProfileView = UserProfileView()
    var user: UserProfile!
    

    let menuButt = UIBarButtonItem(image: #imageLiteral(resourceName: "menuButton"), style: .plain, target: self, action: nil)


    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        userProfileView.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        
        userProfileView.postsButton.addTarget(self, action: #selector(showPostsVC), for: .touchUpInside)
        addSubViews()
        loadData()
    }
    
    private func configureNavBar() {
        navigationItem.title = "User Profile"
      
    }
    //addSubviews
    private func addSubViews(){
        view.addSubview(userProfileView)
        addConstraints()
         navigationItem.leftBarButtonItem = menuButt
        
        if self.revealViewController() != nil {
            menuButt.target = self.revealViewController()
            menuButt.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    func loadData() {
        if let user = Auth.auth().currentUser {
            UserService.manager.getUser(uid: user.uid, completion: { (userOnline) in
                if let userProfile = userOnline {
                    ImageService.manager.getImage(from: userProfile.imageURL, completion: { (onlineImage) in
                        if let image = onlineImage {
                            self.userProfileView.profileImage.image = image
                            self.userProfileView.profileImage.setNeedsLayout()
                        }
                    })
                }
            })
            var posts = [Post]()
            PostService.manager.getUserPosts(from: user.uid, completion: { (postsOnline) in
                if let postFirebase = postsOnline {
                    posts = postFirebase
                    self.userProfileView.numberOfPostsLabel.text = "Number of posts: \(posts.count)"
                    self.userProfileView.numberofFlagsLabel.text = "Number of Flags: \(posts.filter{$0.flaged}.count)"
                    self.userProfileView.userNameLabel.text = "\(user.displayName ?? "No user name")"
                    self.userProfileView.numberofUpvotesLabel.text = "Number of Upvotes: \(posts.filter{$0.countOfUp > 0}.count)"
                }
            })
            userProfileView.numberOfPostsLabel.text = "Number of posts: \(posts.count)"
            userProfileView.numberofFlagsLabel.text = "Number of Flags: \(posts.filter{$0.flaged}.count)"
            userProfileView.userNameLabel.text = "\(user.displayName ?? "No user name")"
            userProfileView.numberofUpvotesLabel.text = "Number of Upvotes: \(posts.filter{$0.countOfUp > 0}.count)"
            
        }
    }
    
    public static func storyboardInstance() -> UserProfileVC {
        let storyboard = UIStoryboard(name: "GlobalPostFeed", bundle: nil)
        let profileVC = storyboard.instantiateViewController(withIdentifier: "UserProfileVC") as! UserProfileVC
        return profileVC
    }
    
    @objc private func showPostsVC(){
        let userPostVC = UserPostsVC()
        userPostVC.user = self.user
        
        let navController = UINavigationController(rootViewController: userPostVC)
        self.present(navController, animated: true, completion: nil)
    }

    
    @objc private func dismissView() {
        dismiss(animated: true, completion: nil)
    }
    
    private func addConstraints(){
        userProfileView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view.safeAreaLayoutGuide.snp.edges)
        }
    }
    
}

