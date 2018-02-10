//
//  UpvotedPostsViewController.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 2/3/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit
import Firebase
class UpvotedPostsVC: UIViewController {
    
    
    let menuButt = UIBarButtonItem(image: #imageLiteral(resourceName: "menuButton"), style: .plain, target: self, action: nil)
    
    
    public static func storyboardInstance() -> UpvotedPostsVC {
        let storyboard = UIStoryboard(name: "GlobalPostFeed", bundle: nil)
        let upvoteVC = storyboard.instantiateViewController(withIdentifier: "UpvotedPostsVC") as! UpvotedPostsVC
        return upvoteVC
    }
    
   
   // let upVotedView = UpvotedView()
    let feedView  = GlobalPostFeedView()
    var posts = [Post]() {
        didSet {
            DispatchQueue.main.async {
                self.feedView.tableView.reloadData()
                
            }
        }
    }
    /*
    func loadPosts() {
        let userUid = Auth.auth().currentUser!.uid
        PostService.manager.getPosts { (onlinePosts) in
            var upvotedPosts = [Post]()
            
            for post in onlinePosts {
                
                    PostService.manager.getVoteUsersDict(childRef: post.postId, completion: { (upvoteArr) in
                        
                        let exist = upvoteArr.index(where: {$0 == userUid })
                        if exist != nil {
                            upvotedPosts.append(post)
                        }
                    })
            }
            self.posts = upvotedPosts
            }
      
    }
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Upvoted"
        view.backgroundColor = .white
       setupFeedView()
        feedView.tableView.delegate = self
        feedView.tableView.dataSource = self
      //  loadPosts()
        navigationItem.leftBarButtonItem = menuButt
        
        if self.revealViewController() != nil {
            menuButt.target = self.revealViewController()
            menuButt.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
    }
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
      //  self.loadPosts()
    }
   
 
 
    
    @objc func dismissView() {
        dismiss(animated: true, completion: nil)
    }
    
    func setupFeedView() {
        self.view.addSubview(feedView)
        feedView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    @objc func moreButtonPressed(sender: UIButton) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let flagActionSheet = UIAlertAction(title: "Report", style: .default) {(action) in
            // configure flag action
            PostService.manager.updateFlaged(of: self.posts[sender.tag])
        }
        
        let cancelActionSheet = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alert.addAction(flagActionSheet)
        alert.addAction(cancelActionSheet)
        present(alert, animated: true, completion: nil)
    }
    
    @objc func upvotePressed(sender: UIButton) {
//        let ref = self.posts[sender.tag].postId
//        let userUid = Auth.auth().currentUser!.uid
      //  PostService.manager.updateVoteUsers(childRef: ref, userUid: userUid)
        PostService.manager.updateUpVote(of: self.posts[sender.tag])
    }
    @objc func downvotePressed(sender: UIButton) {
        PostService.manager.updateDownVote(of: self.posts[sender.tag])
    }

    
}
extension UpvotedPostsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell", for: indexPath) as! FeedTableViewCell
        cell.layoutIfNeeded()
        cell.tag = indexPath.row
        // add handles to these buttons in cell
        cell.moreButton.addTarget(self, action: #selector(moreButtonPressed), for: .touchUpInside)
        cell.upvoteButton.tag = indexPath.row
        cell.downvoteButton.tag = indexPath.row
        cell.moreButton.tag = indexPath.row
        cell.upvoteButton.addTarget(self, action: #selector(upvotePressed(sender:)), for: .touchUpInside)
        cell.downvoteButton.addTarget(self, action: #selector(downvotePressed(sender:)), for: .touchUpInside)
        
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "You have \(posts.count) upvoted posts."
    }
}
