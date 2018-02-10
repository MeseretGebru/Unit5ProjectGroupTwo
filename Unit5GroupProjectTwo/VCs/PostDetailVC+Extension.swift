//
//  PostDetailViewController+Extension.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 2/1/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

extension PostDetailVC: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            if textView.textColor == .black{
                self.saveComment(text: textView.text)
                textView.text = ""
                textView.endEditing(true)
                loadComments()
            }
        }
        return true
    }
    func textViewDidBeginEditing(_ textView: UITextView)
    {
        if textView.text == "Type your comment..."
        {
            textView.text = ""
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView)
    {
        if textView.text == ""
        {
            textView.text = "Type your comment..."
            textView.textColor = .lightGray
        }
        textView.resignFirstResponder()
    }
}

extension PostDetailVC: UITableViewDelegate {
    
}

extension PostDetailVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CommentTVCell {
            if comments.count % 2 == 0 {
                if indexPath.row % 2 == 0 {
                    cell.backgroundColor = UIColor.lightGray
                } else {
                    cell.backgroundColor = UIColor.white
                }
            } else {
                if indexPath.row % 2 == 1 {
                    cell.backgroundColor = UIColor.lightGray
                } else {
                    cell.backgroundColor = UIColor.white
                }
            }
            let comment = comments[indexPath.row]
            print(comment.textComment)
            cell.configureCell(comment: comment)
            return cell
        }
        return UITableViewCell()
    }
}
