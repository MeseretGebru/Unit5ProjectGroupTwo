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
//        guard posts.count > 0 else {
//            return
//        }
      //  let post = posts[indexPath.row]
        // TODO: replace with dependency injection
        let commentVC = PostDetailVC()
      //  commentVC.post = post
        navigationController?.pushViewController(commentVC, animated: true)
    }
    
}

extension GlobalPostFeedVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard posts.count > 0 else {
            return 20
        }
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell", for: indexPath) as! FeedTableViewCell
        cell.layoutIfNeeded()
        cell.moreButton.addTarget(self, action: #selector(moreButtonPressed), for: .touchUpInside)
        
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
        let post = posts[indexPath.row]
        cell.titleLabel.text = post.postTitle
        cell.userLabel.text = post.userRef.key

        return cell
    }
}
