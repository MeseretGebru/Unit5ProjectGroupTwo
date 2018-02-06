//
//  UpvotedPostsViewController.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 2/3/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit
class UpvotedPostsVC: UIViewController {

    let upVotedView = UpvotedView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        upVotedView.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .yellow
        addSubViews()
        
    }
    private func configureNavBar() {
        navigationItem.title = "Upvoted"
        let backButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: self, action: #selector(back))
        navigationItem.leftBarButtonItem = backButton
        //            navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(dismissView))
    }
    
    private func addSubViews(){
        view.addSubview(upVotedView)
        addConstraints()
    }
    
    
    @objc private func back(){
        
    }
    
    @objc private func dismissView() {
        dismiss(animated: true, completion: nil)
    }
    
    private func addConstraints(){
        upVotedView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
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
