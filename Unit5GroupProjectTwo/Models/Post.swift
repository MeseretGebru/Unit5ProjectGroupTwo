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
    var user: User
    var postContent: String
    var postTitle: String

    
    // preparing info to save into firebase
    init(ref: DatabaseReference,
         userRef: DatabaseReference,
         user: User, postContent: String,
         postTitle: String){
        
        self.ref = ref
        self.user = user
        self.postContent = postContent
        self.postTitle = postTitle
    }
    
    // take info from firebase
    init(snapShot: DataSnapshot){
        let value = snapShot.value as? [String: Any]
        self.ref = snapShot.ref
        self.user = value?["user"] as! User
        self.postContent = value?["postContent"] as? String ?? ""
        self.postTitle = value?["postTitle"] as? String ?? ""
        
    }
    
    // transform info previous to save
    func toAnyObject() -> [String: Any] {
        return ["ref" : ref, "userRef" : userRef, "user": user, "postContent" : postContent, "postTitle" : postTitle ]
    }
    
}
