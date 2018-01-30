//
//  MainViewController.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 1/29/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addViewControllers()
    }
    
    private func addViewControllers() {
        let feedVC = UINavigationController(rootViewController: FeedViewController())
        
        let userProfileVC = UINavigationController(rootViewController: UserProfileViewController())
        let postVC = UINavigationController(rootViewController: PostViewController())
        feedVC.tabBarItem = UITabBarItem(title: "Feed", image: #imageLiteral(resourceName: "home"), tag: 0)
        userProfileVC.tabBarItem = UITabBarItem(title: "Profile", image: #imageLiteral(resourceName: "profile"), tag: 1)
        postVC.tabBarItem = UITabBarItem(title: "Post", image: #imageLiteral(resourceName: "post"), tag: 2)
        let tabList = [feedVC, userProfileVC, postVC]
        viewControllers = tabList
    }

}
