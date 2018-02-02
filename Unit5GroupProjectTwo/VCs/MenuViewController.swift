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

class MenuViewController: UIViewController {
    
    let menuView = MenuView() 
    
    let menuTitles = ["Profile", "Post History", "Upvoted Posts", "Settings", "Logout"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(menuView)
        menuViewConstraints()
        self.view.backgroundColor = .cyan
        menuView.menuTableView.delegate = self
        menuView.menuTableView.dataSource = self
        
    }
    
    private func menuViewConstraints() {
        menuView.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(view.snp.width)
            make.height.equalTo(view.snp.height).multipliedBy(0.7)
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.snp.centerY).offset(10)
        }
    }

}


extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = menuView.menuTableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath)
        let title = menuTitles[indexPath.row]
        cell.textLabel?.text = title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let segueIdentifier: String
        switch indexPath.row {
        case 0:
            segueIdentifier = "Profile"
        case 1:
            segueIdentifier = "Post History"
        case 2:
            segueIdentifier = "Upvoted Posts"
        case 3:
            segueIdentifier = "Settings"
        case 4:
            segueIdentifier = "Logout"
            FirebaseAPIClient.manager.logOutCurrentUser()
        default:
            segueIdentifier = "Logout"
        }
        performSegue(withIdentifier: segueIdentifier, sender: self)
    }
    
}
