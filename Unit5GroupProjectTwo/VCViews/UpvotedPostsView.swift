//
//  UpvotedView.swift
//  TempProject2
//
//  Created by C4Q on 2/3/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit

class UpvotedView: UIView {
    
    lazy var postDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Discription:"
        return label
    }()
    
    lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Category:"
        return label
    }()
    
    lazy var catagoryDisplayLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        return label
    }()
    
    lazy var someFactsLabel: UILabel = {
        let label = UILabel()
        label.text = "Some Facts For You: "
        return label
    }()
    
    lazy var postImage: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "uggDog")
        return image
    }()
    
    
    lazy var addButton: UIButton = {
        let button = UIButton()
        //        button.setTitle("+" , for: .normal)
        button.setImage(#imageLiteral(resourceName: "uggDog"), for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()
    lazy var totalLabel: UILabel = {
        let label = UILabel()
        label.text = "1234 "
        label.textAlignment = .center
        return label
    }()
    
    lazy var minusButton: UIButton = {
        let button = UIButton()
        //button.setTitle("-" , for: .normal)
      //  button.setImage(#imageLiteral(resourceName: "uggDog"), for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()
    lazy var factImage: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "noImage")
        return image
    }()
    
    lazy var upvoteStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = UILayoutConstraintAxis.horizontal
        stackView.distribution = UIStackViewDistribution.fillEqually
        stackView.spacing = 2.0
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .white
        addSubViews()
        addConstraints()
    }
    
    func addSubViews(){
        //view.addSubview(titleLabel)
        addSubview(postDescriptionLabel)
        addSubview(postImage)
        addSubview(categoryLabel)
        //addSubview(addButton)
        //addSubview(minusButton)
        addSubview(someFactsLabel)
        
        addSubview(factImage)
        //addSubview(totalLabel)
        addSubview(upvoteStack)
        upvoteStack.addArrangedSubview(addButton)
        upvoteStack.addArrangedSubview(totalLabel)
        upvoteStack.addArrangedSubview(minusButton)
        
    }
    
    private func addConstraints(){
        
        postDescriptionLabel.snp.makeConstraints {(desc) in
            desc.top.equalTo(self.snp.top).offset(80)
            desc.left.equalTo(self.snp.left).offset(20)
            desc.right.equalTo(self.snp.right).offset(-40)
        }
        
        postImage.snp.makeConstraints { (make) in
            make.top.equalTo(postDescriptionLabel.snp.bottom).offset(20)
            make.centerX.equalTo(self.snp.centerX)
            make.width.height.equalTo(300)
        }
        
        categoryLabel.snp.makeConstraints { (cat) in
            cat.top.equalTo(postImage.snp.bottom).offset(20)
            cat.left.equalTo(self.snp.left).offset(20)
            cat.right.equalTo(self.snp.right).offset(-80)
            cat.centerX.equalTo(self)
        }
        
        
        upvoteStack.snp.makeConstraints {(stack) -> Void in
            stack.top.equalTo(postImage.snp.bottom).offset(30)
            stack.left.equalTo(self.snp.left).offset(250)
            stack.right.equalTo(safeAreaLayoutGuide.snp.right).offset(-40)
            stack.width.equalTo(self.snp.width).multipliedBy(0.3)
        }
        someFactsLabel.snp.makeConstraints { (facts) in
            facts.top.equalTo(upvoteStack.snp.bottom).offset(30)
            facts.centerX.equalTo(self.snp.centerX)
        }
        factImage.snp.makeConstraints { (make) in
            make.top.equalTo(someFactsLabel.snp.bottom).offset(10)
            make.centerX.equalTo(self.snp.centerX)
            make.width.height.equalTo(200)
        }
        
    }
}

