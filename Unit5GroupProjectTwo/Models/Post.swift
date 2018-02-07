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
    var ref: DatabaseReference
    var postId: String
    var user: String
    var postContent: String
    var postTitle: String
    var imageURL: String
    var countOfUp: Int
  //  var countOfDown: Int
   // var flaged: Bool
    // preparing info to save into firebase
    init(ref: DatabaseReference,
         user: User, postContent: String,
         postTitle: String,
         imageURL: String, countOfUp: Int){
        
        self.ref = ref
        self.postId = ref.key
        self.user = user.uid
        self.postContent = postContent
        self.postTitle = postTitle
        self.imageURL = imageURL
        self.countOfUp = countOfUp
        //self.countOfDown = countOfDown
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
      //  self.vote = value?["vote"] as? Vote
        self.countOfUp = value?["countOfUp"] as? Int ?? 0
    }
  
    
    // transform info previous to save
    func toAnyObject() -> [String: Any] {
        return ["postId" : postId, "user": user, "postContent" : postContent, "postTitle" : postTitle, "imageURL": imageURL]
    }
  
    
}
