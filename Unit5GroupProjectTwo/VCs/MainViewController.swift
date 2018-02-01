//
//  MainViewController.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 1/29/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit

class MainViewController: UITabBarController {

//    var menuLeftRight: ConstraintMakerExtendable!
//    let menuView = MenuView()
//    var toggle = true
    override func viewDidLoad() {
        super.viewDidLoad()
        addViewControllers()

    }
    

    let menuButt = UIBarButtonItem(image: #imageLiteral(resourceName: "menuButton"), style: .plain, target: self, action: #selector(showMenu))
    
    private func addViewControllers() {
        let feedVC = UINavigationController(rootViewController: FeedViewController())
        let userProfileVC = UINavigationController(rootViewController: UserProfileViewController())
        let postVC = UINavigationController(rootViewController: PostViewController())
        let settingVC = UINavigationController(rootViewController: SettingsViewController())
        let userloginVC = UINavigationController(rootViewController: UserLogInViewController())
        feedVC.tabBarItem = UITabBarItem(title: "Feed", image: #imageLiteral(resourceName: "home"), tag: 0)
        userProfileVC.tabBarItem = UITabBarItem(title: "Profile", image: #imageLiteral(resourceName: "profile"), tag: 1)
        postVC.tabBarItem = UITabBarItem(title: "Post", image: #imageLiteral(resourceName: "post"), tag: 2)
        let tabList = [feedVC, userProfileVC, postVC]
        viewControllers = tabList
        tabList.forEach { $0.navigationItem.leftBarButtonItem = menuButt }

        
        
    }
    
    @objc func showMenu() {
        let presentedMenuController = MenuViewController()
        presentedMenuController.modalTransitionStyle = .coverVertical
        present(presentedMenuController, animated: true, completion: nil)
    }
    
}
