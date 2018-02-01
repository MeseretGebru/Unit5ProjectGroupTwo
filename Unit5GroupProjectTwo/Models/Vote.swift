//
//  Vote.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 2/1/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase
import FirebaseStorage

//Use this to retrieve User Profile Feature "Latest Post"

struct Vote {
    var userRef: DatabaseReference?
    var postRef: DatabaseReference?
    var upVote: Bool? = false
    var downVote: Bool? = false
    
    
    // preparing info to save into firebase
    init(userRef: DatabaseReference, postRef: DatabaseReference, upVote: Bool, downVote: Bool){
        self.userRef = userRef
        self.postRef = postRef
        self.upVote = upVote
        self.downVote = downVote
            }
    
    // take info from firebase
    init(snapShot: DataSnapshot, userRef: DatabaseReference, postRef: DatabaseReference){
        let value = snapShot.value as? [String: Any]

        
        self.userRef = userRef
        self.postRef = postRef
        self.upVote = value?["upVote"] as? Bool
        self.downVote = value?["downVote"] as? Bool
    }
    
    // transform info previous to save
    func toAnyObject() -> [String: Any] {
        return["userRef": userRef, "postRef" : postRef, "upVote": upVote, "downVote" : downVote ]
    }
    
}
