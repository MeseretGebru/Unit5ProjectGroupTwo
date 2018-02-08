//
//  VoteService.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 2/3/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase
/*
struct VoteService {
    private init() {
        dbRef = Database.database().reference()
        voteRef = dbRef.child("Vote")
        guard let cUser = Auth.auth().currentUser else {print("No current user available"); return}
        currentUser = cUser
    }
    
    static let manager = VoteService()
    private var dbRef: DatabaseReference!
    private var voteRef: DatabaseReference!
    private var currentUser: User!
    
    public func getDB()-> DatabaseReference { return dbRef }
    
    public func getVotes(from post: String, completionHandler: @escaping ([Vote]) -> Void) {
        var votes = [Vote]()
       // let someV = voteRef.child("Vote")
        voteRef.observe(.value) { (snapShop) in
            for child in snapShop.children {
              let dataSnapshot = child as! DataSnapshot
                let vote = Vote(snapShot: dataSnapshot)
               votes.append(vote)
            }
            completionHandler(votes)
        }
    }
    
    public func saveNewVote(voteKey: String, upVote: Bool, downVote: Bool) {
        let newVote = voteRef.childByAutoId()
        
//        let vote = Vote(voteRef: newVote, user: currentUser, upVote: upVote, downVote: downVote, countOfUp: <#T##Int#>, countOfDown: <#T##Int#>)
//        voteRef.setValue(<#T##value: Any?##Any?#>) { (<#Error?#>, <#DatabaseReference#>) in
//            <#code#>
//        }
//
    }
    
}
 */
