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

class VoteService {
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
    
    public func getVotes(from postId: String, completionHandler: @escaping ([Vote]) -> Void) {
        voteRef.observe(.value) { (snapShop) in
            var votes = [Vote]()
            for child in snapShop.children {
                let newVote = Vote(snapShot: child as! DataSnapshot)
                if newVote.postId == postId, newVote.upVote > 0 || newVote.downVote > 0 {
                    votes.append(newVote)
                }
            }
            completionHandler(votes)
        }
    }
    
    public func saveNewVote(postId: String, upVote: Int?, downVote: Int?) {
        let newVote = voteRef.childByAutoId()
        var voteUp = upVote ?? 0
        var voteDown = downVote ?? 0
        voteRef.observe(.value) { (snapShot) in
            for vote in snapShot.children {
                let newVote = Vote(snapShot: vote as! DataSnapshot)
                if newVote.postId == postId, newVote.upVote > 0 {
                    if newVote.upVote > 0 {
                        if voteUp != 0 {
                            voteUp = 0
                        } else {
                            voteUp = 1
                        }
                    }
                    if newVote.downVote > 0 {
                        if voteDown != 0 {
                            voteDown = 0
                        } else {
                            voteDown = 1
                        }
                    }
                }
            }
            let vote = Vote(ref: self.voteRef.ref, postId: postId, userEmail: self.currentUser.email!, voteId: self.voteRef.ref.key, upVote: voteUp, downVote: voteDown)
            newVote.setValue(vote.toAnyObject())
        }
    }
}
