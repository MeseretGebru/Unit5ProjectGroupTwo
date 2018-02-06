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

struct Comment {
    var ref: DatabaseReference
    var commentId: String
    var postId: String
    var user: String
    var textComment: String

    init(ref: DatabaseReference, user: User, postId: String, textComment: String) {
        self.ref = ref
        self.commentId = ref.key
        self.postId = postId
        self.user = user.uid
        self.textComment = textComment
    }
    
 
    init(snapShot: DataSnapshot){
        let value = snapShot.value as? [String: Any]
        self.ref = snapShot.ref
        self.commentId = snapShot.ref.key
        self.postId = value?["postId"] as? String ?? ""
        self.user = value?["user"] as? String ?? ""
        self.textComment = value?["textComment"] as? String ?? ""
    }

    func toAnyObject() -> [String: Any] {
        return["commentId": ref.key,
               "postId" : postId,
               "user" : user,
               "textComment": textComment]
    }
    
}
