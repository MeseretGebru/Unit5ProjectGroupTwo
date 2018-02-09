//
//  Post.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 1/30/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase
import FirebaseStorage
import FirebaseAuth

//Use this to retrieve User Profile Feature "Latest Post"

struct Post {
    let ref: DatabaseReference
    let postId: String
    let user: String
    let postContent: String
    let postTitle: String
    let imageURL: String
    let countOfUp: Int
    let countOfDown: Int
    let flaged: Bool
   // let voteUsers: [String]
   
    // preparing info to save into firebase
    init(ref: DatabaseReference,
         user: String, postContent: String,
         postTitle: String,
         imageURL: String, countOfUp: Int, countOfDown: Int, flaged: Bool, voteUsers: [String]){
        
        self.ref = ref
        self.postId = ref.key
        self.user = user
        self.postContent = postContent
        self.postTitle = postTitle
        self.imageURL = imageURL
        self.countOfUp = countOfUp
        self.countOfDown = countOfDown
        self.flaged = flaged
     //   self.voteUsers = voteUsers
    }
    
    // take info from firebase
 
    init(snapShot: DataSnapshot){
        let value = snapShot.value as? [String: Any]
        self.ref = snapShot.ref
        self.postId = snapShot.ref.key
        self.user = value?["user"] as? String ?? ""
        self.postContent = value?["postContent"] as? String ?? ""
        self.postTitle = value?["postTitle"] as? String ?? ""
        self.imageURL = value?["imageURL"] as? String ?? ""
        self.countOfUp = value?["countOfUp"] as? Int ?? 0
        self.countOfDown = value?["countOfDown"] as? Int ?? 0
        self.flaged = value?["flaged"] as? Bool ?? false
      //  self.voteUsers = value?["voteUsers"] as? [String] ?? ["a"]
    }
  
    
    // transform info previous to save
    func toAnyObject() -> [String: Any] {
        return ["postId" : postId, "user": user,
                "postContent" : postContent, "postTitle" : postTitle, "imageURL": imageURL, "countOfUp": countOfUp, "countOfDown": countOfDown, "flaged": flaged, /*"voteUsers": voteUsers*/ ]
    }
  
    
}
