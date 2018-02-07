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

    var post: Post!
    var user: UserProfile!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        userProfileView.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        
        userProfileView.changePictureButton.addTarget(self, action: #selector(changePicture), for: .touchUpInside)
        userProfileView.postsButton.addTarget(self, action: #selector(posts), for: .touchUpInside)
        addSubViews()
        //configureData(user: user, post: Post)
        
    }
    private func configureNavBar() {
        navigationItem.title = "User Profile"
      
    }
    
    private func addSubViews(){
        view.addSubview(userProfileView)
        addConstraints()
         navigationItem.leftBarButtonItem = menuButt
        
        if self.revealViewController() != nil {
            menuButt.target = self.revealViewController()
            menuButt.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    public static func storyboardInstance() -> UserProfileVC {
        let storyboard = UIStoryboard(name: "GlobalPostFeed", bundle: nil)
        let profileVC = storyboard.instantiateViewController(withIdentifier: "UserProfileVC") as! UserProfileVC
        return profileVC
    }
    
    @objc private func changePicture(){
        
    }
    
    @objc private func posts(){
            let userPostVC = UserPostsVC()
            let navController = UINavigationController(rootViewController: userPostVC)
            self.present(navController, animated: true, completion: nil)
        
    }
    
    @objc private func back(){
        
    }
    
    @objc private func dismissView() {
        dismiss(animated: true, completion: nil)
    }
    
    private func addConstraints(){
        userProfileView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view.safeAreaLayoutGuide.snp.edges)
        }
    }
    
    //    public func configureData(user: UserProfile,post: Post) {
    //        userProfileView.calculatedNumberofPostsLabel.text = ""
    //        userProfileView.calculatedNumberofFlagsLabel.text = "\(user.numberOfFlags)"
    //        //userProfileView.calculatedNumberofUpvotesLabel.text =
    //
    //    }
    
    
}

