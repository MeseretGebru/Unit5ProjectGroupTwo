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
/*
struct Vote {
    var voteRef: DatabaseReference
    var user: User
    var upVote: Bool? = false
    var downVote: Bool? = false
    var countOfUp: Int
    var countOfDown: Int
    // preparing info to save into firebase
    init(voteRef: DatabaseReference, user: User, upVote: Bool, downVote: Bool, countOfUp: Int, countOfDown: Int){
        self.postRef = postRef
        self.user = user
        self.upVote = upVote
        self.downVote = downVote
        self.countOfUp = countOfUp
        self.countOfDown = countOfDown
            }
    
    // take info from firebase
    init(snapShot: DataSnapshot){
        let value = snapShot.value as? [String: Any]
        self.voteRef = snapShot.ref
        self.user = Auth.auth().currentUser!
        self.upVote = value?["upVote"] as? Bool
        self.downVote = value?["downVote"] as? Bool
        self.countOfUp = value?["countOfUp"] as! Int
        self.countOfDown = value?["countOfDown"] as! Int
    }
    
    // transform info previous to save
    func toAnyObject() -> [String: Any] {
        return["voteRef" : voteRef, "user" : user, "upVote": upVote, "downVote" : downVote, "countOfUp": countOfUp, "countOfDown": countOfDown]
    }
    
}
 */
