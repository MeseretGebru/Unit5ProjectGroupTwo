//
//  GlobalPostFeedVC+TableView.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 2/3/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import Firebase
extension GlobalPostFeedVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        // TODO: replace with dependency injection
        
        var selectedPost: Post!
        switch tableView {
        case feedView.tableView:
            selectedPost = self.posts[indexPath.row]
        default:
            selectedPost = self.populatedPosts[indexPath.row]
        }
        let commentVC = PostDetailVC(post: selectedPost)
        
        navigationController?.pushViewController(commentVC, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if posts.count == 0 {
            return view.layer.bounds.height * 0.70
        } else {
            return UITableViewAutomaticDimension
        }
    }
    
}

extension GlobalPostFeedVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //  let cell = UITableViewCell()
        //  if tableView == feedView.tableView {
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
        
        if tableView == feedView.tableView {
            let post = posts[indexPath.row]
            cell.configureCell(from: post)
            cell.setNeedsLayout()
            return cell
        } else {
            //    if tableView == popularFeedView.tableView {
            //             let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell", for: indexPath) as! FeedTableViewCell
            let post = populatedPosts[indexPath.row]
            cell.configureCell(from: post)
            cell.setNeedsLayout()
            return cell
        }
    }
}
