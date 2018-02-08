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
import FirebaseStorage
import Kingfisher

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
    public func getUsersRef()-> DatabaseReference { return userRef }
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
    
    public func getUser(user: User) -> UserProfile {
        var user: UserProfile!
        userRef.child("users").queryEqual(toValue: user, childKey: "user").observe(.value, with: { (dataSnapShot) in
            let userP = UserProfile(snapShot: dataSnapShot.children.allObjects[0] as! DataSnapshot)
            user = userP
            
        })
        return user
    }
    
    
    public func saveNewUser(imageProfile: UIImage) {
        let newUser = userRef.childByAutoId()
        let user = UserProfile(ref: newUser, user: currentUser, lastLogin: getDate(), numberOfFlags: 0, imageURL: "")
        newUser.setValue(user.toAnyObject()){ (error, dbRef) in
            if let error = error {
                print("addUser error: \(error)")
            } else {
                print("User added @ database reference: \(dbRef)")
                
                // add an image to storage
                StorageService.manager.storeImage(image: imageProfile, postId: newUser.key, userId: self.currentUser.uid)
                // TODO: add image to database
            }
        }
    }
    
    public func getImageProfile(urlImage: String) -> UIImage {
        let image = UIImageView()
        if let imageURL = URL(string: urlImage) {
            DispatchQueue.main.async {
                image.kf.setImage(with: imageURL, placeholder: UIImage.init(named: "uggDog"), options: nil, progressBlock: nil) { (image, error, cacheType, url) in
                    
                }
            }
        }
        return image.image ?? #imageLiteral(resourceName: "uggDog")
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
