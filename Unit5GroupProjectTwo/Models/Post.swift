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
    var userRef: DatabaseReference
    var key: String!
    var postId: String
    var postImageStringUrl: String
    var postContent: String
    var postTitle: String

    
    // preparing info to save into firebase
    init(ref: DatabaseReference, userRef: DatabaseReference, key: String, postId: String, postImageStringUrl: String, postContent: String, postTitle: String){
        
        self.ref = ref
        self.userRef = userRef
        self.key = key
        self.postId = postId
        self.postImageStringUrl = postImageStringUrl
        self.postContent = postContent
        self.postTitle = postTitle
    }
    
    // take info from firebase
    init(snapShot: DataSnapshot, user: DatabaseReference){
        let value = snapShot.value as? [String: Any]
        self.ref = snapShot.ref
        self.userRef = user
        self.key = value?["key"] as? String ?? ""
        self.postId = value?["postId"] as?  String ?? ""
        self.postImageStringUrl = value?["postImageStringUrl"] as? String ?? ""
        self.postContent = value?["postContent"] as? String ?? ""
        self.postTitle = value?["postTitle"] as? String ?? ""
        
    }
    
    // transform info previous to save
    func toAnyObject() -> [String: Any] {
        return ["ref" : ref, "userRef" : userRef, "key" : key, "postId" : postId, "postImageStringUrl" : postImageStringUrl, "postContent" : postContent, "postTitle" : postTitle ]
    }
    
}
