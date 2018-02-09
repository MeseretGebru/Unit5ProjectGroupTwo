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
    var userId: String
    var user: String
    var displayName: String
    var email: String
    var lastLogin: String
    var numberOfFlags: Int
    var imageURL: String
  
   // var voteGave: Int
    // preparing info to save into firebase
    init(ref: DatabaseReference, user: User, displayName: String, email: String, lastLogin: String, numberOfFlags: Int, imageURL: String){
        self.ref = ref
        self.userId = ref.key
        self.user = user.uid
        self.displayName = displayName
        self.email = email
        self.lastLogin = lastLogin
        self.numberOfFlags = numberOfFlags
        self.imageURL = imageURL
        self.displayName = displayName
    }
    
    // take info from firebase
    init(snapShot: DataSnapshot){
        let value = snapShot.value as? [String: Any]
        self.ref = snapShot.ref
        self.userId = snapShot.ref.key
        self.user = value?["user"] as? String ?? ""
        self.displayName = value?["displayName"] as? String ?? ""
        self.email = value?["email"] as? String ?? ""
        self.lastLogin = value?["lastLogin"] as? String ?? ""
        self.numberOfFlags = value?["numberOfFlags"] as? Int ?? 0
        self.imageURL = value?["imageURL"] as? String ?? ""
        self.displayName = value?["displayName"] as? String ?? ""
        self.email = value?["email"] as? String ?? ""
    }
    
    // transform info previous to save
    func toAnyObject() -> [String: Any] {

        return["userId" : ref.key, "user": user,"displayName": displayName,"email": email, "lastLogin" : lastLogin, "numberOfFlags" : numberOfFlags, "imageURL": imageURL]

    }
    
}
