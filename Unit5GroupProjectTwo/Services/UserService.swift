//
//  UserService.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 2/3/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

struct UserService {
    private init() {
        dbRef = Database.database().reference()
        userRef = dbRef.child("users")
        guard let cUser = Auth.auth().currentUser else {print("No current user available"); return}
        currentUser = cUser
    }
    
    static let manager = UserService()
    private var dbRef: DatabaseReference!
    private var userRef: DatabaseReference!
    private var currentUser: User!
    
    public func getDB()-> DatabaseReference { return dbRef }
    public func getUsers()-> [UserProfile] {
        var users = [UserProfile]()
        userRef.observe(.value) { (dataSnapShop) in
            for user in dataSnapShop.children {
                let user = UserProfile(snapShot: user as! DataSnapshot)
                users.append(user)
            }
        }
        return users
    }
    
    
    public func saveNewUser() {
        let user = UserProfile(ref: userRef, user: currentUser, lastLogin: getDate(), numberOfFlags: 0)
        let newUser = userRef.childByAutoId()
        newUser.setValue(user.toAnyObject())
    }
    
    public func addFlagToUser(from user: User) {
        var reference: DatabaseReference!
        var numFlags = 0
        let userFlag = self.userRef.child("users").queryEqual(toValue: user, childKey: "user")
        userFlag.observe(.value) { (dataSnapShot) in
            if let userOnline = dataSnapShot.children.allObjects[0] as? DatabaseReference {
                reference = userOnline
                if let num = userOnline.value(forKey: "numberOfFlags") as? Int {
                    numFlags = num + 1
                }
            }
        }
        reference.updateChildValues(["numberOfFlags": numFlags])
    }
    
    private func getDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let myDate = Date()
        let dateStr: String = formatter.string(from: myDate)
        return dateStr
    }
}
