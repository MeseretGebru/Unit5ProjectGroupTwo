//
//  Comment.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 1/30/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase
//import FirebaseAuth

struct Comment {
    var ref: DatabaseReference
    var postId: String
    var user: User
    var textComment: String

    init(ref: DatabaseReference, user: User, postId: String, textComment: String) {
        self.ref = ref
        self.postId = postId
        self.user = user
        self.textComment = textComment
    }
    
 
    init(snapShot: DataSnapshot){
        let value = snapShot.value as? [String: Any]
        self.ref = snapShot.ref
        self.postId = value?["postId"] as? String ?? ""
        self.user = Auth.auth().currentUser!
        self.textComment = value?["textComment"] as? String ?? ""
    }

    func toAnyObject() -> [String: Any] {
        return["ref": ref,
               "postId" : postId,
               "user" : user,
               "textComment": textComment]
    }
    
}
