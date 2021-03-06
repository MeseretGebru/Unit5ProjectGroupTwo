//
//  NewPostView.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 1/29/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit

class NewPostView: UIScrollView {
    private let fontSize: CGFloat = 30
    
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
    private func customTitleContainer() -> UIView {
        let tv = UIView()
        tv.layer.shadowColor = UIColor.darkGray.cgColor
        tv.layer.shadowOpacity = 1
        tv.layer.shadowOffset = CGSize(width: 0, height: 3)
        tv.layer.shadowRadius = 3
        tv.clipsToBounds = false
        return tv
    }
    lazy var titleContainer: UIView = customTitleContainer()
    
    private func customTitleTextView() -> UITextView {
        let tv = UITextView()
        tv.text = "Post Title"
        tv.textColor = .lightGray
        tv.font = UIFont.systemFont(ofSize: fontSize)
        tv.backgroundColor = UIColor.white
        tv.autocorrectionType = .no
        return tv
    }
    lazy var titleTextView: UITextView = customTitleTextView()
    
    private func customDescriptionContainer() -> UIView {
        let tv = UIView()
        tv.layer.shadowColor = UIColor.darkGray.cgColor
        tv.layer.shadowOpacity = 1
        tv.layer.shadowOffset = CGSize(width: 0, height: 3)
        tv.layer.shadowRadius = 3
        tv.clipsToBounds = false
        return tv
    }
    lazy var descriptionContainer: UIView = customDescriptionContainer()
    
    private func customDescriptionTextView() -> UITextView {
        let tv = UITextView()
        tv.text = "Post Description(optional)"
        tv.textColor = .lightGray
        tv.font = UIFont.systemFont(ofSize: fontSize / 1.3)
        tv.backgroundColor = UIColor.white
        return tv
    }
    lazy var descriptionTextView: UITextView = customDescriptionTextView()
   
    
    private func customAddImageButton() -> UIButton {
        let button = UIButton()
        button.setTitle("Select an image", for: .normal)
        button.backgroundColor = .white
        button.imageView?.contentMode = .scaleAspectFit
        button.setTitleColor(.lightGray, for: .normal)
        button.layer.shadowColor = UIColor.darkGray.cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowOffset = CGSize(width: 0, height: 3)
        button.layer.shadowRadius = 3
        button.clipsToBounds = false
        return button
    }
    lazy var addImageButton: UIButton = customAddImageButton()
    
    // MARK:- Set Constraints
    private func setupViews() {
        setupTitleContainer()
        setupTitleTextView()
        setupDescriptionContainer()
        setupDescriptionTextView()
        setupAddImageButton()
    }
    
    private func setupTitleContainer() {
        addSubview(titleContainer)
        titleContainer.snp.makeConstraints { (make) in
            make.top.equalTo(snp.top).offset(20)
            make.leading.equalTo(snp.leading)
            make.centerX.equalTo(snp.centerX)
            make.width.equalTo(snp.width)
            make.height.equalTo(snp.height).multipliedBy(0.12)
        }
    }
    private func setupTitleTextView() {
        titleContainer.addSubview(titleTextView)
        titleTextView.snp.makeConstraints { (make) in
            make.edges.equalTo(titleContainer)
//            make.top.equalTo(snp.top).offset(20)
//            make.leading.equalTo(snp.leading)
//            make.centerX.equalTo(snp.centerX)
//            make.width.equalTo(snp.width)
//            make.height.equalTo(snp.height).multipliedBy(0.12)
        }
    }
    
    private func setupDescriptionContainer() {
        addSubview(descriptionContainer)
        descriptionContainer.snp.makeConstraints { (make) in
            make.top.equalTo(titleContainer.snp.bottom).offset(15)
            make.leading.equalTo(titleContainer.snp.leading)
            make.centerX.equalTo(snp.centerX)
            make.width.equalTo(titleContainer.snp.width)
            make.height.equalTo(snp.height).multipliedBy(0.17)
        }
    }
    
    private func setupDescriptionTextView() {
        descriptionContainer.addSubview(descriptionTextView)
        descriptionTextView.snp.makeConstraints { (make) in
//            make.top.equalTo(titleTextView.snp.bottom).offset(15)
//            make.leading.equalTo(titleTextView.snp.leading)
//            make.centerX.equalTo(snp.centerX)
//            make.width.equalTo(titleTextView.snp.width)
//            make.height.equalTo(snp.height).multipliedBy(0.17)
            make.edges.equalTo(descriptionContainer)
        }
    }
    

    private func setupAddImageButton() {
        addSubview(addImageButton)
        addImageButton.snp.remakeConstraints { (make) in
            make.top.equalTo(descriptionTextView.snp.bottom).offset(15)
            make.leading.equalTo(titleTextView.snp.leading)
            make.trailing.equalTo(titleTextView.snp.trailing)
            make.height.equalTo(70)
            make.bottom.equalTo(snp.bottom)
        }
        addImageButton.imageView?.snp.makeConstraints({ (make) in
            make.edges.equalTo(addImageButton)
        })
        addImageButton.titleLabel?.snp.makeConstraints { (make) in
            make.leading.equalTo(addImageButton)
            make.trailing.equalTo(addImageButton)
            make.top.equalTo(addImageButton)
            make.height.equalTo(70)
        }
    }
}

