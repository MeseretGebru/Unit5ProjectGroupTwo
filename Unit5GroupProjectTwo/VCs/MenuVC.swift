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
    
    var currentUser: User!
   
    @IBOutlet weak var userImageButton: UIButton!
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
  
    let menuTitles = ["Post", "Profile", "Upvoted", "Settings"]
    let images: [UIImage] = [#imageLiteral(resourceName: "post64"), #imageLiteral(resourceName: "profile64"), #imageLiteral(resourceName: "thumbs64"), #imageLiteral(resourceName: "settings64")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MenuCell.self, forCellReuseIdentifier: "menuCell")
        self.view.backgroundColor = .white
        
        self.currentUser = Auth.auth().currentUser!
       self.userNameLabel.text = self.currentUser.displayName
        
        UserService.manager.getUser(uid: Auth.auth().currentUser!.uid) { (onlineUser) in
            let imageUrl = onlineUser!.imageURL

            self.userNameLabel.text = Auth.auth().currentUser?.displayName!
            do {
                if let url = URL(string: imageUrl) {
                    let data = try Data.init(contentsOf: url)
                    let image = UIImage.init(data: data)
                    self.userImageButton.setImage(image, for: .normal)
                }
            } catch {
                print("error")
            }
        }
    }
 
    public static func storyboardInstance() -> MenuVC {
        let storyboard = UIStoryboard(name: "GlobalPostFeed", bundle: nil)
        let menuVC = storyboard.instantiateViewController(withIdentifier: "MenuVC") as! MenuVC
        return menuVC
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as! MenuCell
        let title = menuTitles[indexPath.row]
        cell.menuLabel.text = title
        cell.menuImageView.image = images[indexPath.row]
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
        return 45
    }
    
}

