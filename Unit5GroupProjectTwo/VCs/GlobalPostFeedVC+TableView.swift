//
//  GlobalPostFeedVC+TableView.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 2/3/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

extension GlobalPostFeedVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = posts[indexPath.row]
        // TODO: replace with dependency injection
        let commentVC = PostDetailVC()
        commentVC.post = post
        navigationController?.pushViewController(commentVC, animated: true)
    }
    
}

extension GlobalPostFeedVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell", for: indexPath) as! FeedTableViewCell
        cell.layoutIfNeeded()
        cell.moreButton.addTarget(self, action: #selector(moreButtonPressed), for: .touchUpInside)
        
        print(posts.count)
        let post = posts[indexPath.row]
        cell.titleLabel.text = post.postTitle
        //cell.userImageView.image = PostService.manager.getImagePost(urlImage: post.imageURL)
        cell.setNeedsLayout()
        return cell
    }
}
