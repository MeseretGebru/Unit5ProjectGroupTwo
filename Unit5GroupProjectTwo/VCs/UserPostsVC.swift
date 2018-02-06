//
//  UserPostsViewController.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 2/1/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import SnapKit

class UserPostsVC: UIViewController {

    let userPostsView = UserPostsView()
    var post: Post!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        userPostsView.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .yellow
        //userPostsView.postTableView.delegate = self
        //userPostsView.postTableView.dataSource = self
        addSubViews()
        loadData()
        
    }
    private func configureNavBar() {
        navigationItem.title = "Posts"
        let backButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: self, action: #selector(back))
        navigationItem.leftBarButtonItem = backButton
        //            navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(dismissView))
    }
    
    private func addSubViews(){
        view.addSubview(userPostsView)
        addConstraints()
    }
    
    
    @objc private func back(){
        dismissView()
    }
    
    @objc private func dismissView() {
        dismiss(animated: true, completion: nil)
    }
    
    private func addConstraints(){
        userPostsView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
    }
    
    
    
    private func loadData() {
        // userPostView.userNameLabel.text = post.user
        //userPostView.profileImage.image = #imageLiteral(resourceName: "PrettyCat")
        
    }
}
//extension UserPostsViewController: UITableViewDataSource, UITableViewDelegate {
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? UserPostsTableViewCell
//
//        return UITableViewCell()
//    }

    
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        //TODO: Add array count check if there is a post??
//        return 1
//
//    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


