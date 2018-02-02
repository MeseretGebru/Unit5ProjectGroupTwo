//
//  PostDetailViewController+Extension.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 2/1/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

extension PostDetailViewController: UITableViewDelegate {
    
}

extension PostDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return comments.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.lightGray
        }
        let comment = comments[indexPath.row]
        cell.textLabel?.text = comment.content
        cell.textLabel?.numberOfLines = 0
        cell.detailTextLabel?.text = "User1"
        //            cell.configureCell(image: nil, message: comment.content)
        //            cell.profileImageView.layer.cornerRadius = cell.profileImageView.frame.size.width / 2
        return cell
        
        //return UITableViewCell()
    }
    
    
  

}
