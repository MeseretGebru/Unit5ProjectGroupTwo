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
    
}

extension GlobalPostFeedVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if tableView == feedView.tableView {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell", for: indexPath) as! FeedTableViewCell
        cell.layoutIfNeeded()
            // add handles to these buttons in cell
        cell.moreButton.addTarget(self, action: #selector(moreButtonPressed), for: .touchUpInside)
        cell.upvoteButton.tag = indexPath.row
        cell.downvoteButton.tag = indexPath.row
        cell.moreButton.tag = indexPath.row
        cell.upvoteButton.addTarget(self, action: #selector(upvotePressed(sender:)), for: .touchUpInside)
        cell.downvoteButton.addTarget(self, action: #selector(downvotePressed(sender:)), for: .touchUpInside)
          
            
            guard posts.count > 0 else {
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

        print(posts.count)

        let post = posts[indexPath.row]
        cell.titleLabel.text = post.postTitle
        //cell.userImageView.image = PostService.manager.getImagePost(urlImage: post.imageURL)
        cell.setNeedsLayout()
        return cell
        } else if tableView == popularFeedView.tableView {
             let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell", for: indexPath) as! FeedTableViewCell
            cell.titleLabel.text = "it's popular feed cell"
            return cell
        }
        return cell
    }
}
