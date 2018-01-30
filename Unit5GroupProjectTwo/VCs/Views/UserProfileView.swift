//
//  UserSettingView.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 1/29/18.
//  Copyright © 2018 C4Q. All rights reserved.

import UIKit
import SnapKit

class UserProfileView: UIView {
    //TOD:
    // create a table view
    //set up initializers
    //set up properties
    
    lazy var UserProfileTableView: UITableView = {
        let tableview = UITableView()
        tableview.register(UserProfileTableViewCell.self, forCellReuseIdentifier: "ProfileCell")
        return tableview
    }()
    
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
    
    private func setupViews() {
        addSubview(UserProfileTableView)
        
        UserProfileTableView.snp.makeConstraints { (tableView) in
          tableView.edges.equalTo(self)
       }
    }
    
    
}



