//
//  PostService.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 2/2/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

struct PostService {
    private init() {
        dbRef = Database.database().reference()
        postRef = dbRef.child("posts")
        guard let cUser = Auth.auth().currentUser else {print("No current user available"); return}
        currentUser = cUser
    }
    
    static let manager = PostService()
    private var dbRef: DatabaseReference!
    private var postRef: DatabaseReference!
    private var currentUser: User!
    
    public func getDB()-> DatabaseReference { return dbRef }
    public func getPosts()-> [Post] {
        var posts = [Post]()
        postRef.observe(.value) { (dataSnapShop) in
            for post in dataSnapShop.children {
                let post = Post(snapShot: post as! DataSnapshot)
                posts.append(post)
            }
        }
        return posts
    }
    public func getUserPosts(from user: User) -> [Post] {
        var posts = [Post]()
        let userPosts = postRef.child("posts").queryEqual(toValue: user, childKey: "user")
        userPosts.observe(.value) { (dataSnapShot) in
            let postsOnline = dataSnapShot.children
            for post in postsOnline {
                let post = Post(snapShot: post as! DataSnapshot)
                posts.append(post)
            }
        }
        return posts
    }
    
    public func saveNewPost(content: String, title: String) {
        let newPost = postRef.childByAutoId()
        let post = Post(ref: newPost, user: currentUser, postContent: content, postTitle: title)
        newPost.setValue(post.toAnyObject())
    }
}
