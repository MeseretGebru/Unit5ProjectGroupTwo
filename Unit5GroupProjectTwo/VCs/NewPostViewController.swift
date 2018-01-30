//
//  NewPostViewController.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 1/29/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class NewPostViewController: UIViewController {
    
    var newPostView = NewPostView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
        newPostView.postButton.addTarget(self, action: #selector(postButtonPressed), for: .touchUpInside)
        
        
        // TEST
        newPostView.backgroundColor = UIColor.darkGray
    }
    
    private func setupViews() {
        view.addSubview(newPostView)
        newPostView.translatesAutoresizingMaskIntoConstraints = false
        [newPostView.topAnchor.constraint(equalTo: view.topAnchor),
         newPostView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
         newPostView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
         newPostView.trailingAnchor.constraint(equalTo: view.trailingAnchor)].forEach{$0.isActive = true}
    }
    
    @objc private func postButtonPressed() {
        guard let title = newPostView.titleTextfield.text else {
            // TODO: handle nil titletextfield?
            return
        }
        guard !title.isEmpty else {
            let noTitleAlert = UIAlertController(title: "No Title", message: "Please pick a title for your post before posting", preferredStyle: .alert)
            noTitleAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(noTitleAlert, animated: true, completion: nil)
            
            return
        }
        print(title)
    }
}
