//
//  SegmentedControlView.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 1/30/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

//This view is only for the User Login/Creation Page.

import UIKit
import SnapKit

class SegmentedControlView: UIView {
    
    lazy var segmentedControl: UISegmentedControl = {
        let segCon = UISegmentedControl(items: ["Log In", "Create Account"])
        segCon.tintColor = .orange
        segCon.backgroundColor = .green
        return segCon
    }()
    
    lazy var borderForViews: UIView = {
        let view = UIView()
        view.layer.borderColor = UIColor.orange.cgColor
        view.layer.borderWidth = 2
        return view
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
        setupViews()
    }
    
    private func setupViews() {
        let views = [segmentedControl, borderForViews] as [UIView]
        views.forEach { addSubview($0); ($0).translatesAutoresizingMaskIntoConstraints = false}
        setUpSegCon()
        setUpUserView()
        
    }
    
    private func setUpSegCon() {
        segmentedControl.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(safeAreaLayoutGuide.snp.width)
            make.height.equalTo(safeAreaLayoutGuide.snp.height).multipliedBy(0.2)
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
        }
    }
    
    private func setUpUserView() {
        borderForViews.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(safeAreaLayoutGuide.snp.height).multipliedBy(0.7)
            make.width.equalTo(segmentedControl.snp.width)
            make.top.equalTo(segmentedControl.snp.bottom)
            
        }
        
    }
    
    
}
