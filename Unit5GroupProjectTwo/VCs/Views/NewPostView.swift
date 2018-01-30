//
//  NewPostView.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 1/29/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class NewPostView: UIView {
    convenience init() {
        self.init(frame: UIScreen.main.bounds)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit() {
        backgroundColor = .white
        setupViews()
    }
    
    // MARK:- Subviews
    private func customTextField() -> UITextField {
        let tf = UITextField()
        tf.placeholder = "Title"
        tf.font = UIFont.systemFont(ofSize: 30)
        tf.backgroundColor = UIColor.white
        return tf
    }
    lazy var titleTextfield: UITextField = customTextField()
    
    private func customImageView() -> UIImageView {
        let iv = UIImageView(image: #imageLiteral(resourceName: "profile"))
        iv.contentMode = .scaleAspectFit
        iv.backgroundColor = .white
        return iv
    }
    lazy var postImageView: UIImageView = customImageView()
    
    private func customButton() -> UIButton {
        let button = UIButton()
        button.setTitle("Post", for: .normal)
        button.backgroundColor = .blue
        button.tintColor = UIColor.darkGray
        return button
    }
    lazy var postButton: UIButton = customButton()
    
    // MARK:- Set Constraints
    private func setupViews() {
        setupTitleTextfield()
        setupPostImageView()
        setupPostButton()
    }
    
    private func setupTitleTextfield() {
        addSubview(titleTextfield)
        titleTextfield.translatesAutoresizingMaskIntoConstraints = false
        [titleTextfield.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
         titleTextfield.centerXAnchor.constraint(equalTo: centerXAnchor),
         titleTextfield.widthAnchor.constraint(equalToConstant: 150)].forEach{$0.isActive = true}
    }
    
    private func setupPostImageView() {
        addSubview(postImageView)
        postImageView.translatesAutoresizingMaskIntoConstraints = false
        [postImageView.topAnchor.constraint(equalTo: titleTextfield.bottomAnchor, constant: 1),
         postImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
         postImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
         postImageView.heightAnchor.constraint(equalTo: postImageView.widthAnchor)].forEach{$0.isActive = true}
    }
    
    private func setupPostButton() {
        addSubview(postButton)
        postButton.translatesAutoresizingMaskIntoConstraints = false
        [postButton.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 20),
         postButton.centerXAnchor.constraint(equalTo: centerXAnchor)].forEach{$0.isActive = true}
    }
}
