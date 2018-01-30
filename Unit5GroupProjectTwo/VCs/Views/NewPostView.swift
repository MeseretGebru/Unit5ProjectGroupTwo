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
        let iv = UIImageView(image: #imageLiteral(resourceName: "addImagePlaceholder"))
        iv.contentMode = .scaleAspectFit
        iv.backgroundColor = .white
        return iv
    }
    lazy var postImageView: UIImageView = customImageView()
    
    private func customAddImageButton() -> UIButton {
        let button = UIButton()
        return button
    }
    lazy var addImageButton: UIButton = customAddImageButton()
    
    private func customPostButton() -> UIButton {
        let button = UIButton()
        button.setTitle("Post", for: .normal)
        button.backgroundColor = .blue
        button.tintColor = UIColor.darkGray
        return button
    }
    lazy var postButton: UIButton = customPostButton()
    
    // MARK:- Set Constraints
    private func setupViews() {
        setupTitleTextfield()
        setupPostImageView()
        setupAddImageButton()
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
    
    private func setupAddImageButton() {
        addSubview(addImageButton)
        addImageButton.translatesAutoresizingMaskIntoConstraints = false
        [addImageButton.topAnchor.constraint(equalTo: postImageView.topAnchor),
         addImageButton.bottomAnchor.constraint(equalTo: postImageView.bottomAnchor),
         addImageButton.leadingAnchor.constraint(equalTo: postImageView.leadingAnchor),
         addImageButton.trailingAnchor.constraint(equalTo: postImageView.trailingAnchor)].forEach{$0.isActive = true}
    }
    private func setupPostButton() {
        addSubview(postButton)
        postButton.translatesAutoresizingMaskIntoConstraints = false
        [postButton.topAnchor.constraint(equalTo: postImageView.bottomAnchor, constant: 20),
         postButton.centerXAnchor.constraint(equalTo: centerXAnchor)].forEach{$0.isActive = true}
    }
}
