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
import FirebaseStorage

struct Comment {
    var userRef: DatabaseReference
    var postRef: DatabaseReference
    var textComment: String

    init(userRef: DatabaseReference, postRef: DatabaseReference, textComment: String) {
        self.userRef = userRef
        self.postRef = postRef
        self.textComment = textComment
    
    }
    
 
    init(snapShot: DataSnapshot, userRef: DatabaseReference, postRef: DatabaseReference){
        let value = snapShot.value as? [String: Any]
        self.textComment = value?["textComment"] as? String ?? ""
        self.userRef = userRef
        self.postRef = postRef
    
    }

    func toAnyObject() -> [String: Any] {
        return["userRef": userRef, "postRef" : postRef, "textComment" : textComment]
    }
    
}
