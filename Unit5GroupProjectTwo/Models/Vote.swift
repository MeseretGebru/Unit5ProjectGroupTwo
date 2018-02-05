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

//Use this to retrieve User Profile Feature "Latest Post"

struct Vote {
    var postRef: DatabaseReference
    var user: User
    var upVote: Bool? = false
    var downVote: Bool? = false
    
    // preparing info to save into firebase
    init(postRef: DatabaseReference, user: User, upVote: Bool, downVote: Bool){
        self.postRef = postRef
        self.user = user
        self.upVote = upVote
        self.downVote = downVote
            }
    
    // take info from firebase
    init(snapShot: DataSnapshot){
        let value = snapShot.value as? [String: Any]
        self.postRef = snapShot.ref
        self.user = Auth.auth().currentUser!
        self.upVote = value?["upVote"] as? Bool
        self.downVote = value?["downVote"] as? Bool
    }
    
    // transform info previous to save
    func toAnyObject() -> [String: Any] {
        return["postRef" : postRef, "user" : user, "upVote": upVote, "downVote" : downVote]
    }
    
}
