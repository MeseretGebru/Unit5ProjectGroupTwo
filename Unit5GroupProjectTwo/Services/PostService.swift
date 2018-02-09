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

class PostService {
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
    public func getPostsRef() -> DatabaseReference {return postRef}

    public func getPosts(completionHandler: @escaping ([Post]) -> Void) {
        var posts = [Post]()
        postRef.observe(.value) { (snapShot) in
            for post in snapShot.children {
                let newPost = Post(snapShot: post as! DataSnapshot)
                posts.insert(newPost, at: 0)
            }
            completionHandler(posts)
        }
    }
    
    public func getUserPosts(from user: String, completion: @escaping ([Post]?) -> Void) {
        var posts = [Post]()
        postRef.observe(.value) { (snapShopt) in
            for post in snapShopt.children {
                let postModel = Post(snapShot: post as! DataSnapshot)
                if postModel.user == user {
                    posts.insert(postModel, at: 0)
                }
            }
            completion(posts)
        }
    }
    
    public func saveNewPost(content: String, title: String, image: UIImage) {
        let newPost = postRef.childByAutoId()
        let post = Post(ref: newPost, user: currentUser.uid, postContent: content, postTitle: title, imageURL: "", countOfUp: 0, countOfDown: 0, flaged: false, voteUsers: ["a"])
        newPost.setValue(post.toAnyObject()){ (error, dbRef) in
            if let error = error {
                print("addPost error: \(error)")
            } else {
                print("Post added @ database reference: \(dbRef)")
                
                // add an image to storage
                StorageService.manager.storeImage(image: image, postId: newPost.key, userId: nil)
                // TODO: add image to database
            }
        }
    }
    
    public func getImagePost(urlImage: String, completion: @escaping (UIImage) -> Void) {
        let image = UIImageView()
        if let imageURL = URL(string: urlImage) {
            DispatchQueue.main.async {
                image.kf.setImage(with: imageURL, placeholder: UIImage.init(named: "uggDog"), options: nil, progressBlock: nil) { (image, error, cacheType, url) in
                    if let error = error {
                        print(error)
                    }
                    if let image = image {
                        completion(image)
                    }
                }
            }
        }
    }
    public func updateUpVote(of post: Post) {
      var currentUps = post.countOfUp
       let updatedCount = currentUps + 1
        post.ref.child("countOfUp").setValue(updatedCount)
}
    public func updateDownVote(of post: Post) {
        var currentDowns = post.countOfDown
        let updatedCount = currentDowns + 1
        post.ref.child("countOfDown").setValue(updatedCount)
    }
    public func updateFlaged(of post: Post) {
        if post.flaged == true {
          return
        }
        post.ref.child("flaged").setValue(true)
    }
    public func getVoteUsersDict(childRef: String, completion: @escaping ([String]) -> Void) {
        postRef.child(childRef).child("voteUsers").observe(.value) { (snapshot) in
            var result = [String]()
            print("====================\n")
            for value in snapshot.children {
                let newValue = value as! DataSnapshot
                    if let something = newValue.value as? String {
                    result.append(something)
                    }
            }
            completion(result)
//            let dict = snapshot.value as! [String]
//            print("the snapShot data is \n")
//            print(dict)
//            result = dict
        }
    }
    
    public func updateVoteUsers(childRef: String, userUid: String) {
          var arr = [String]()
        PostService.manager.getVoteUsersDict(childRef: childRef) { (onlineArr) in
            print("==================")
            print(onlineArr)
            arr = onlineArr
            arr.append(userUid)
            self.postRef.child(childRef).child("voteUsers").setValue(arr)
        }
       
      
    }
}

