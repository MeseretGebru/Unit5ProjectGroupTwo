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
    // NOTE:  MENU BUTTON DOES NOT WORK. YOU WILL NOT HAVE A GOOD TIME IF YOU TOUCHY!
    let feedView  = GlobalPostFeedView()
    let menuButt = UIBarButtonItem(image: #imageLiteral(resourceName: "menuButton"), style: .plain, target: self, action: #selector(showMenu))
    
    // MARK: Data Model
    var posts = [Post]() {
        didSet {
            feedView.tableView.reloadData()
        }
    }
    
    private func loadData() {
        // TODO: hide away behind abstraction of PostService class
        let postRef = Database.database().reference().child("posts")
        postRef.observe(.value) { (snapShot) in
            var posts = [Post]()
            for post in snapShot.children {
//              let newPost = Post(snapShot: post as! DataSnapshot)
                let newPost = Post(snapShot: snapShot)
                posts.insert(newPost, at: 0)
            }
            self.posts = posts
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        view.backgroundColor = .orange
        view.addSubview(feedView)
        feedView.tableView.delegate = self
        feedView.tableView.dataSource = self
        
        navigationItem.leftBarButtonItem = menuButt
        feedView.tableView.rowHeight = UITableViewAutomaticDimension
        
        
//        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(showMenu))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPost))
    }
    
    @objc func showMenu() {
        let presentedMenuController = MenuVC()
        presentedMenuController.modalTransitionStyle = .flipHorizontal
        presentedMenuController.modalPresentationStyle = .pageSheet
        present(presentedMenuController, animated: true, completion: nil)
    }
    
    
    // feedView.tableView.estimatedRowHeight = 300
    //    feedView.tableView.rowHeight = UITableViewAutomaticDimension
    //
    //
    //    navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(showMenue))
    //    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add))
    //}
    
    
    @objc func addPost() {
        let newPostvc = NewPostVC()
        newPostvc.modalTransitionStyle = .flipHorizontal
        newPostvc.modalPresentationStyle = .overCurrentContext
        navigationController?.pushViewController(NewPostVC(), animated: true)
//        present(newPostvc, animated: true, completion: nil)
//        present(PostViewController(), animated: true, completion: nil)
//        navigationController?.pushViewController(PostViewController(), animated: true)
    }
}
//extension GlobalPostFeedVC: UITableViewDelegate {
//    //    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//    //        return 300
//    //    }
//}
//extension GlobalPostFeedVC: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 20
//    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell", for: indexPath) as! FeedTableViewCell
//        cell.layoutIfNeeded()
//        switch indexPath.row {
//        case 0:
//            cell.feedImageView.image = #imageLiteral(resourceName: "dogs")
//        case 1:
//            cell.feedImageView.image = #imageLiteral(resourceName: "panda")
//        case 2:
//            cell.feedImageView.image = #imageLiteral(resourceName: "ThumbUp")
//        case 3:
//            cell.feedImageView.image = #imageLiteral(resourceName: "uggDog")
//        case 4:
//            cell.feedImageView.image = #imageLiteral(resourceName: "cards")
//        case 5:
//            cell.feedImageView.image = #imageLiteral(resourceName: "Dakota_instaweb")
//        default:
//            cell.feedImageView.image = #imageLiteral(resourceName: "ante")
//        }
//        
//        return cell
//        
//    }
//}
//
