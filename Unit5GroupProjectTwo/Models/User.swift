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
    var user: User
    var ref: DatabaseReference
    var profileImageUrl: String
    var email: String
    var displayName: String
    var lastLogin: String
    var numberOfFlags: String
    
    // preparing info to save into firebase
    init(user: User, ref: DatabaseReference, profileImageUrl: String, email: String, displayName: String, lastLogin: String, numberOfFlags: String){
        
        self.user = user
        self.ref = ref
        self.profileImageUrl = profileImageUrl
        self.email = email
        self.displayName = displayName
        self.lastLogin = lastLogin
        self.numberOfFlags = numberOfFlags
    }
    

    
    // take info from firebase
    init(snapShot: DataSnapshot){
        let value = snapShot.value as? [String: Any]
        self.user = value?["user"] as! User
        self.ref = snapShot.ref
        self.profileImageUrl = value?["profileImageStringUrl"] as? String ?? ""
        self.email = value?["email"] as? String ?? ""
        self.displayName = value?["displayName"] as? String ?? ""
        self.lastLogin = value?["lastLogin"] as? String ?? ""
        self.numberOfFlags = value?["numberOfFlags"] as? String ?? ""
    }
    
    // transform info previous to save
    func toAnyObject() -> [String: Any] {
        return["ref" : ref, "profileImageUrl" : profileImageUrl, "email": email, "displayName": displayName, "lastLogin" : lastLogin, "numberOfFlags" : numberOfFlags ]
    }
    
}
