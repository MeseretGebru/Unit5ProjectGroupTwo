//
//  User.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 2/1/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation

import Firebase
import FirebaseDatabase
import FirebaseStorage
import FirebaseAuth

struct UserProfile {
    var ref: DatabaseReference
    var user: User
    var lastLogin: String
    var numberOfFlags: Int
    
    // preparing info to save into firebase
    init(ref: DatabaseReference, user: User, lastLogin: String, numberOfFlags: Int){
        self.ref = ref
        self.user = user
        self.lastLogin = lastLogin
        self.numberOfFlags = numberOfFlags
    }
    
    // take info from firebase
    init(snapShot: DataSnapshot){
        let value = snapShot.value as? [String: Any]
        self.ref = snapShot.ref
        self.user = value?["user"] as! User
        self.lastLogin = value?["lastLogin"] as? String ?? ""
        self.numberOfFlags = value?["numberOfFlags"] as? Int ?? 0
    }
    
    // transform info previous to save
    func toAnyObject() -> [String: Any] {
        return["ref" : ref, "lastLogin" : lastLogin, "numberOfFlags" : numberOfFlags ]
    }
    
}
