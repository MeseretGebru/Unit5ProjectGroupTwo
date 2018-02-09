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
    let ref: DatabaseReference
    let postId: String
    let userEmail: String
    let voteId: String
    let upVote: Int
    let downVote: Int
    // preparing info to save into firebase
    init(ref: DatabaseReference, postId: String, userEmail: String, voteId: String, upVote: Int, downVote: Int){
        self.ref = ref
        self.postId = postId
        self.userEmail = userEmail
        self.voteId = voteId
        self.upVote = upVote
        self.downVote = downVote
            }
    
    // take info from firebase
    init(snapShot: DataSnapshot){
        let value = snapShot.value as? [String: Any]
        self.ref = snapShot.ref
        self.postId = value?["postId"] as? String ?? ""
        self.userEmail = Auth.auth().currentUser?.email ?? "no-email"
        self.voteId = value?["voteId"] as? String ?? ""
        self.upVote = value?["upVote"] as? Int ?? 0
        self.downVote = value?["downVote"] as? Int ?? 0
    }
    
    // transform info previous to save
    func toAnyObject() -> [String: Any] {
        return["postId": postId, "userEmail" : userEmail, "voteId": voteId, "upVote": upVote, "downVote" : downVote]
    }    
}

