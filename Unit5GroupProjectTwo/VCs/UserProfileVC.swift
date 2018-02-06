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

class UserProfileVC: UIViewController {

    let userProfileView = UserProfileView()
    let menuButt = UIBarButtonItem(image: #imageLiteral(resourceName: "menuButton"), style: .plain, target: self, action: nil)

    // Title should be big, bold and center
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = " User Profile"
        label.textAlignment = .center
        return label
    }()
    
    //Stack of right side labels
    lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "User Name:"
        return label
    }()
    
    lazy var lastLoginLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Last Login:"
        return label
    }()
    
    lazy var numberOfPostsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Number of Posts:"
        return label
    }()
    
    lazy var numberofFlagsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Number of flags:"
        return label
    }()
    
    // Outputs: stack of left side labels execpt for user name
    lazy var userNameTextfield: UITextField = {
        let textField = UITextField()
        textField.placeholder = "enter user name"
        return textField
    }()
    
    
    lazy var lastLoginDisplayLabel: UILabel = {
        let label = UILabel()
        label.text = " loging" //last login date shoul popup from the database
        return label
    }()
    
    lazy var numberOfPostsDisplayLabel: UILabel = {
        let label = UILabel()
        label.text = "number" //number of posts should be calculated..
        return label
    }()
    lazy var numberofFlagsDisplayLabel: UILabel = {
        let label = UILabel()
        label.text = "number"
        return label
    }()
    
    //Stack views
    lazy var leftsideStacks: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = UILayoutConstraintAxis.vertical
        stackView.distribution = UIStackViewDistribution.fillEqually
        stackView.spacing = 2.0
        return stackView
    }()
    
    lazy var rightsideStacks: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = UILayoutConstraintAxis.vertical
        stackView.distribution = UIStackViewDistribution.fillEqually
        stackView.alignment = .center
        stackView.spacing = 2.0
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        addSubViews()
        addConstraints()
         navigationItem.leftBarButtonItem = menuButt
        
        if self.revealViewController() != nil {
            menuButt.target = self.revealViewController()
            menuButt.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    public static func storyboardInstance() -> UserProfileVC {
        let storyboard = UIStoryboard(name: "GlobalPostFeed", bundle: nil)
        let profileVC = storyboard.instantiateViewController(withIdentifier: "UserProfileVC") as! UserProfileVC
        return profileVC
    }
    
    func addSubViews(){
        // view.addSubview(userProfileView)
        view.addSubview(titleLabel)
        view.addSubview(leftsideStacks)
        view.addSubview(rightsideStacks)
        
        leftsideStacks.addArrangedSubview(userNameLabel)
        leftsideStacks.addArrangedSubview(lastLoginLabel)
        leftsideStacks.addArrangedSubview(numberOfPostsLabel)
        leftsideStacks.addArrangedSubview(numberofFlagsLabel)
        
        rightsideStacks.addArrangedSubview(userNameTextfield)
        rightsideStacks.addArrangedSubview(lastLoginDisplayLabel)
        rightsideStacks.addArrangedSubview(numberOfPostsDisplayLabel)
        rightsideStacks.addArrangedSubview(numberofFlagsDisplayLabel)
        
        view.addSubview(userProfileView)
    }
    
    private func addConstraints(){
        titleLabel.snp.makeConstraints {(title) in
            title.width.equalTo(view)
            title.top.equalTo(view).offset(30)
            title.centerX.equalTo(view)
        }
        leftsideStacks.snp.makeConstraints {(left) -> Void in
            left.left.equalTo(view.snp.left).offset(20)
            left.top.equalTo(titleLabel.snp.bottom).offset(50)
            left.right.equalTo(rightsideStacks.snp.left).offset(20)
            left.height.equalTo(view.snp.height).multipliedBy(0.4)
        }
        
        rightsideStacks.snp.makeConstraints {(right) -> Void in
            right.left.equalTo(leftsideStacks.snp.right).offset(20)
            right.top.equalTo(titleLabel.snp.bottom).offset(50)
            right.right.equalTo(view.snp.right).offset(40)
            right.height.equalTo(view.snp.height).multipliedBy(0.4)
        }
        userProfileView.snp.makeConstraints { (make) in
            make.top.equalTo(rightsideStacks.snp.bottom)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.left.equalTo(view.safeAreaLayoutGuide.snp.left)
            make.right.equalTo(view.safeAreaLayoutGuide.snp.right)
        }
        
    }
    
}



