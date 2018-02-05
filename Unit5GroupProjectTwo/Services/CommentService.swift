//
//  CommentService.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 2/3/18.
//  Copyright © 2018 C4Q. All rights reserved.
//


import Foundation
import FirebaseAuth
import FirebaseDatabase

struct CommentService {
    private init() {
        dbRef = Database.database().reference()
        commentRef = dbRef.child("comments")
        guard let cUser = Auth.auth().currentUser else {print("No current user available"); return}
        currentUser = cUser
    }
    
    static let manager = CommentService()
    private var dbRef: DatabaseReference!
    private var commentRef: DatabaseReference!
    private var currentUser: User!
    
    public func getDB()-> DatabaseReference { return dbRef }
    public func getPostComments(from post: String)-> [Comment] {
        var comments = [Comment]()
        let userComments = commentRef.child(post)
        userComments.observe(.value) { (dataSnapShop) in
            for comment in dataSnapShop.children {
                let postCom = Comment(snapShot: comment as! DataSnapshot)
                comments.append(postCom)
            }
        }
        return comments
    }
    
    public func saveNewPost(postKey: String, content: String) {
        let newComment = commentRef.childByAutoId()
        let comment = Comment(ref: newComment, user: Auth.auth().currentUser!, postId: postKey, textComment: content)
        newComment.setValue(comment.toAnyObject())
    }
    
}
