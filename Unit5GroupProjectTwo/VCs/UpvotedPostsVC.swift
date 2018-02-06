//
//  UpvotedPostsViewController.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 2/3/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class UpvotedPostsVC: UIViewController {

    let menuButt = UIBarButtonItem(image: #imageLiteral(resourceName: "menuButton"), style: .plain, target: self, action: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
       navigationItem.leftBarButtonItem = menuButt
        
        if self.revealViewController() != nil {
            menuButt.target = self.revealViewController()
            menuButt.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }

    public static func storyboardInstance() -> UpvotedPostsVC {
        let storyboard = UIStoryboard(name: "GlobalPostFeed", bundle: nil)
        let upvoteVC = storyboard.instantiateViewController(withIdentifier: "UpvotedPostsVC") as! UpvotedPostsVC
        return upvoteVC
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
