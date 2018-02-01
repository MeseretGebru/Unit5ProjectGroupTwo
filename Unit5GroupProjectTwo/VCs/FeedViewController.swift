//
//  FeedViewController.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 1/29/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit

class FeedViewController: UIViewController {
    
    let feedView  = FeedView()
    let menuButt = UIBarButtonItem(image: #imageLiteral(resourceName: "menuButton"), style: .plain, target: self, action: #selector(showMenu))
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        view.addSubview(feedView)
        feedView.tableView.delegate = self
        feedView.tableView.dataSource = self
        
        navigationItem.leftBarButtonItem = menuButt
        
        feedView.tableView.rowHeight = UITableViewAutomaticDimension
        
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(showMenu))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add))
    }
    
    @objc func showMenu() {
        let presentedMenuController = MenuViewController()
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
    
    
    @objc func add() {
        let newPostvc = NewPostViewController()
        newPostvc.modalTransitionStyle = .flipHorizontal
        newPostvc.modalPresentationStyle = .overCurrentContext
        present(newPostvc, animated: true, completion: nil)
        
    }
}
extension FeedViewController: UITableViewDelegate {
    //    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //        return 300
    //    }
}
extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell", for: indexPath) as! FeedTableViewCell
        cell.layoutIfNeeded()
        switch indexPath.row {
        case 0:
            cell.feedImageView.image = #imageLiteral(resourceName: "dogs")
        case 1:
            cell.feedImageView.image = #imageLiteral(resourceName: "panda")
        case 2:
            cell.feedImageView.image = #imageLiteral(resourceName: "ThumbUp")
        case 3:
            cell.feedImageView.image = #imageLiteral(resourceName: "uggDog")
        case 4:
            cell.feedImageView.image = #imageLiteral(resourceName: "cards")
        case 5:
            cell.feedImageView.image = #imageLiteral(resourceName: "Dakota_instaweb")
        default:
            cell.feedImageView.image = #imageLiteral(resourceName: "ante")
        }
        
        return cell
        
    }
}
