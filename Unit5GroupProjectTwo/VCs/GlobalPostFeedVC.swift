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
  
    // segmentView for Nav bar item
    lazy var segmentView: UISegmentedControl = {
        let seg = UISegmentedControl(items: ["Recent", "Popular"])
        seg.selectedSegmentIndex = 0
        seg.accessibilityNavigationStyle = .combined
        seg.layer.borderWidth = 0
        return seg
    }()
    // implement pageControl
    //lazy var width = view.safeAreaLayoutGuide.layoutFrame.width
    lazy var height = view.safeAreaLayoutGuide.layoutFrame.height
    let width = UIScreen.main.bounds.width
   // let height = UIScreen.main.bounds.height
    lazy var scrollView = UIScrollView(frame: CGRect(x:0, y:0, width: width, height: height))
    var colors:[UIColor] = [UIColor.red, UIColor.blue]
    var frame: CGRect = CGRect(x:0, y:0, width:0, height:0)
    
   lazy var pageControl : UIPageControl = UIPageControl(frame: CGRect(x:60,y: height, width: width / 2, height: 50))
   
    // feedView
    let feedView  = GlobalPostFeedView()
    let popularFeedView = GlobalPostFeedView()
   // let menuButt = UIBarButtonItem(image: #imageLiteral(resourceName: "menuButton"), style: .plain, target: self, action: #selector(showMenu))
    
    let menuButt = UIBarButtonItem(image: #imageLiteral(resourceName: "menuButton"), style: .plain, target: self, action: nil)

    // MARK: Data Model
    var populatedPosts = [Post]() {
        didSet {
            DispatchQueue.main.async {
                self.popularFeedView.tableView.reloadData()
                
            }
        }
    }
    var posts = [Post]() {
        didSet {
        DispatchQueue.main.async {
            self.feedView.tableView.reloadData()
            
        }
        }
    }
    
    func loadPosts() {
      
        PostService.manager.getPosts { (onlinePosts) in
            if let safePosts = onlinePosts {
            self.posts = safePosts
            let sortedPosts = safePosts.sorted(by: {$0.countOfUp > $1.countOfUp })
            self.populatedPosts = sortedPosts
        }
        }
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadPosts()
        view.backgroundColor = .orange
       // view.addSubview(feedView)
        feedView.tableView.delegate = self
        feedView.tableView.dataSource = self
        popularFeedView.tableView.delegate = self
        popularFeedView.tableView.dataSource = self
        
        navigationItem.leftBarButtonItem = menuButt
        feedView.tableView.rowHeight = UITableViewAutomaticDimension
        popularFeedView.tableView.rowHeight = UITableViewAutomaticDimension
        
        if self.revealViewController() != nil {
            menuButt.target = self.revealViewController()
            menuButt.action = #selector(SWRevealViewController.revealToggle(_:))
    self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPost))

     // setup segmentView
        segmentView.addTarget(self, action: #selector(segmentValueChanged), for: .valueChanged)
        navigationItem.titleView = segmentView
        
        // set scrollView delegate
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
      
        setupScrollView()
        
        configurePageControl()

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
        PostService.manager.updateUpVote(of: self.posts[sender.tag])
    }
    @objc func downvotePressed(sender: UIButton) {
        PostService.manager.updateDownVote(of: self.posts[sender.tag])
    }

}


