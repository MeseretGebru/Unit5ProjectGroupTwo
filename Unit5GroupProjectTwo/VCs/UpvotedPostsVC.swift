//
//  UpvotedPostsViewController.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 2/3/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit
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
    func loadPosts() {
        
        PostService.manager.getPosts { (onlinePosts) in
          
            }
      
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        view.backgroundColor = .white
        addSubViews()
        
        navigationItem.leftBarButtonItem = menuButt
        
        if self.revealViewController() != nil {
            menuButt.target = self.revealViewController()
            menuButt.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        
    }
    func configureNavBar() {
        navigationItem.title = "Upvoted"
       // let backButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: self, action: #selector(back))
      //  navigationItem.leftBarButtonItem = backButton
        //            navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(dismissView))
        
    }
    
    func addSubViews(){
       // view.addSubview(upVotedView)
        addConstraints()
    }
    
 
    
    @objc func dismissView() {
        dismiss(animated: true, completion: nil)
    }
    
    func addConstraints(){
//        upVotedView.snp.makeConstraints { (make) in
//            make.edges.equalTo(self.view)
//        }
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    
}
