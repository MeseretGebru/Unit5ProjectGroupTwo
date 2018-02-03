//
//  FeedVC.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 1/29/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit

class GlobalPostFeedView: UIView {

    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.register(FeedTableViewCell.self, forCellReuseIdentifier: "FeedCell")
        tv.backgroundColor = .purple
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        backgroundColor = .white
        setUpViews()
    }
    
    func setUpViews() {
        setupTableView()
    }
    func setupTableView() {
        addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
        
    }
}

