//
//  UserProfileViewController.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 1/29/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit

// will have titleLabel,userNameLabel,lastLoginLabel,numberOfPostsLabel and latestPostLabel
//text fields accordingly
//tableView

class UserProfileViewController: UIViewController {

    let userProfile = UserProfileView()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = " User Profile"
        return label
    }()
    
    lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    lazy var lastLoginLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    lazy var numberOfPostsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    lazy var latestPostLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    lazy var userNameTextfield: UITextField = {
        let textField = UITextField()
        textField.text = "enter user name"
        return textField
    }()
    
    //TODO: I am not sure if it has to b TextField or label
    lazy var lastLoginTextfield: UITextField = {
        let textField = UITextField()
        textField.text = "" //last login date shoul popup from the database
        return textField
    }()
    
    //TODO: I am not sure if it has to b TextField or label
    lazy var numberOfPostsTextfield: UITextField = {
        let textField = UITextField()
        textField.text = "" //number of posts should be calculated..
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        userProfile.UserProfileTableView.delegate = self
        userProfile.UserProfileTableView.dataSource = self
        addSubViews()
       
    }
    func addSubViews(){
        view.addSubview(userProfile)
        view.addSubview(titleLabel)
        //i am using the old way because sna is not working eventhough i installed pod.
//    titleLabel.translatesAutoresizingMaskIntoConstraints = false
//    titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 20).isActive = true
//        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        
        
    }

}

extension UserProfileViewController: UITableViewDelegate {
    
}
extension UserProfileViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4 //temp
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
    
    
}
