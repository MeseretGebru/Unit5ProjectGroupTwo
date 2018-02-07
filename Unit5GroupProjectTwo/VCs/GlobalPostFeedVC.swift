//
//  FeedViewController.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 1/29/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit
import Firebase

class GlobalPostFeedVC: UIViewController {
  
    let feedView  = GlobalPostFeedView()
   // let menuButt = UIBarButtonItem(image: #imageLiteral(resourceName: "menuButton"), style: .plain, target: self, action: #selector(showMenu))
    
    let menuButt = UIBarButtonItem(image: #imageLiteral(resourceName: "menuButton"), style: .plain, target: self, action: nil)

    // MARK: Data Model
    var posts = [Post]() {
        didSet {
            DispatchQueue.main.async {
                self.feedView.tableView.reloadData()
            }
        }
    }
    
    private func loadData() {
        // TODO: hide away behind abstraction of PostService class
        PostService.manager.getPosts { (postOnline) in
            if let posts = postOnline {
                self.posts = posts
            }
        }
        
        print(posts.count)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        view.addSubview(feedView)
        feedView.tableView.delegate = self
        feedView.tableView.dataSource = self
        
        navigationItem.leftBarButtonItem = menuButt
        feedView.tableView.rowHeight = UITableViewAutomaticDimension
        
        
        if self.revealViewController() != nil {
            menuButt.target = self.revealViewController()
            menuButt.action = #selector(SWRevealViewController.revealToggle(_:))
    self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPost))
        
        
        loadData()
    }
// create instance for storyBoard
    public static func storyboardInstance() -> GlobalPostFeedVC {
        let storyboard = UIStoryboard(name: "GlobalPostFeed", bundle: nil)
        let feedVC = storyboard.instantiateViewController(withIdentifier: "GlobalPostFeedVC") as! GlobalPostFeedVC
        return feedVC
    }
    
   
    
    @objc func showMenu() {
        let presentedMenuController = MenuVC()
        presentedMenuController.modalTransitionStyle = .flipHorizontal
        presentedMenuController.modalPresentationStyle = .pageSheet
        present(presentedMenuController, animated: true, completion: nil)
    }
    
    
    
    @objc func addPost() {
        let newPostvc = NewPostVC()
        newPostvc.modalTransitionStyle = .flipHorizontal
        newPostvc.modalPresentationStyle = .overCurrentContext
        navigationController?.pushViewController(NewPostVC(), animated: true)
//        present(newPostvc, animated: true, completion: nil)
//        present(PostViewController(), animated: true, completion: nil)
//        navigationController?.pushViewController(PostViewController(), animated: true)
    }
    @objc func moreButtonPressed() {
    let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let flagActionSheet = UIAlertAction(title: "Report", style: .default) {[weak self] (action) in
            // TODO: configure flag action
        }
        let cancelActionSheet = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alert.addAction(flagActionSheet)
        alert.addAction(cancelActionSheet)
        present(alert, animated: true, completion: nil)
    }
    
}


