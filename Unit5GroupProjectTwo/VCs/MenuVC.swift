//
//  MenuViewController.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 1/31/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit
import Firebase

/*TO DO:
 - Fix modal presentation
 - Resize everything
 - Get TV to load
 - Get cells to segue or perform an action */

class MenuVC: UIViewController {
    
    
    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    let menuView = MenuView()
    
    let menuTitles = ["Post", "Profile", "Upvoted", "Settings"]
    let images: [UIImage] = [#imageLiteral(resourceName: "post64"), #imageLiteral(resourceName: "profile64"), #imageLiteral(resourceName: "thumbs64"), #imageLiteral(resourceName: "settings64")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.view.backgroundColor = .white
        
        
    }
 

    @IBAction func signoutButtonPressed(_ sender: UIButton) {
        FirebaseAPIClient.manager.logOutCurrentUser()
        let loginVC = UserLogInVC()
        present(loginVC, animated: true, completion: nil)
    }
    
}


extension MenuVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = menuView.menuTableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath)
        let title = menuTitles[indexPath.row]
        cell.textLabel?.text = title
        cell.imageView?.image = images[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
        switch indexPath.row {
        case 0:
            performSegue(withIdentifier: "Posts", sender: self)
        case 1:
             performSegue(withIdentifier: "Profile", sender: self)
        case 2:
             performSegue(withIdentifier: "Upvoted", sender: self)
        case 3:
             performSegue(withIdentifier: "Settings", sender: self)
        default:
           break
        }
     
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}

