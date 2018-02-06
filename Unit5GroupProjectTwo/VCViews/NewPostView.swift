//
//  NewPostView.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 1/29/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit

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
    
    private func customCV() -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .blue
        return cv
    }
    lazy var tagsCV: UICollectionView = customCV()
    
    // MARK:- Set Constraints
    private func setupViews() {
        setupTitleTextfield()
        setupPostImageView()
        setupAddImageButton()
        setupTagsCV()
        setupPostButton()
    }
    
    private func setupTitleTextfield() {
        addSubview(titleTextfield)
        titleTextfield.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(40)
            make.centerX.equalTo(snp.centerX)
            make.width.equalTo(150)
        }
    }
    private func setupPostImageView() {
        addSubview(postImageView)
        postImageView.snp.makeConstraints { (make) in
            make.top.equalTo(titleTextfield.snp.bottom).offset(1)
            make.leading.equalTo(snp.leading)
            make.trailing.equalTo(snp.trailing)
            make.height.equalTo(postImageView.snp.width)
        }
    }
    private func setupAddImageButton() {
        addSubview(addImageButton)
        addImageButton.snp.makeConstraints { (make) in
            make.edges.equalTo(postImageView.snp.edges)
        }
    }
    private func setupTagsCV() {
        addSubview(tagsCV)
        let padding: CGFloat = 10
        tagsCV.snp.makeConstraints { (make) in
            make.top.equalTo(addImageButton.snp.bottom).offset(padding)
            make.leading.equalTo(addImageButton.snp.leading).offset(padding)
            make.trailing.equalTo(addImageButton.snp.trailing).offset(padding)
            make.height.equalTo(snp.height).multipliedBy(0.2)
        }
    }
    private func setupPostButton() {
        addSubview(postButton)
        postButton.translatesAutoresizingMaskIntoConstraints = false
        [postButton.topAnchor.constraint(equalTo: tagsCV.bottomAnchor, constant: 20),
         postButton.centerXAnchor.constraint(equalTo: centerXAnchor)].forEach{$0.isActive = true}
    }
}
