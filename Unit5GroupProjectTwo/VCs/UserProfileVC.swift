//
//  UserProfileViewController.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 1/29/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit

// will have titleLabel,userNameLabel,lastLoginLabel,numberOfPostsLabel and latestPostLabel
//text fields accordingly
//tableView

class UserProfileVC: UIViewController {

    let userProfileView = UserProfileView()
    var post: Post!
    var user: UserProfile!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        userProfileView.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        
        userProfileView.changePictureButton.addTarget(self, action: #selector(changePicture), for: .touchUpInside)
        userProfileView.postsButton.addTarget(self, action: #selector(posts), for: .touchUpInside)
        addSubViews()
        //configureData(user: user, post: Post)
        
    }
    private func configureNavBar() {
        navigationItem.title = "User Profile"
        let backButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: self, action: #selector(back))
        navigationItem.leftBarButtonItem = backButton
        //            navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(dismissView))
    }
    
    private func addSubViews(){
        view.addSubview(userProfileView)
        addConstraints()
    }
    
    @objc private func changePicture(){
        
    }
    
    @objc private func posts(){
            let userPostVC = UserPostsVC()
            let navController = UINavigationController(rootViewController: userPostVC)
            self.present(navController, animated: true, completion: nil)
        
    }
    
    @objc private func back(){
        
    }
    
    @objc private func dismissView() {
        dismiss(animated: true, completion: nil)
    }
    
    private func addConstraints(){
        userProfileView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view.safeAreaLayoutGuide.snp.edges)
        }
    }
    
    //    public func configureData(user: UserProfile,post: Post) {
    //        userProfileView.calculatedNumberofPostsLabel.text = ""
    //        userProfileView.calculatedNumberofFlagsLabel.text = "\(user.numberOfFlags)"
    //        //userProfileView.calculatedNumberofUpvotesLabel.text =
    //
    //    }
    
    
}

