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
    
    //[UIColor colorWithRed:229.0f/255.0f green:229.0f/255.0f blue:229.0f/255.0f alpha:1.0
    lazy var segmentedControl: UISegmentedControl = {
        let segCon = UISegmentedControl(items: ["Log In", "Create Account"])
        segCon.tintColor = UIColor.lightGray
 
        segCon.backgroundColor = UIColor(displayP3Red: (229/255), green: (229/255), blue: (229/255), alpha: 1.0)
        return segCon
    }()
    
//    lazy var borderForViews: UIView = {
//        let view = UIView()
//        view.layer.borderColor = UIColor.orange.cgColor
//        view.layer.borderWidth = 2
//        return view
//    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .blue
        setupViews()
//        configure()
    }
    
    private func setupViews() {
        let views = [segmentedControl] as [UIView]
        views.forEach { addSubview($0); ($0).translatesAutoresizingMaskIntoConstraints = false}
        setUpSegCon()
//        setUpUserView()
        
    }
    
    private func setUpSegCon() {
        segmentedControl.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(self)
            make.height.equalTo(self).multipliedBy(0.2)
            make.centerX.equalTo(self)
            //            make.centerY.equalTo(self)
            make.top.equalTo(self)
        }
        


    }
        
        
        
        
//        let selectedBackgroundColor = UIColor(red: 19/255, green: 59/255, blue: 85/255, alpha: 0.5)
//        var sortedViews: [UIView]!
//        var currentIndex: Int = 0


        
//private func configure() {
//            sortedViews = self.subviews.sorted(by:{$0.frame.origin.x < $1.frame.origin.x})
//            changeSelectedIndex(to: currentIndex)
//        }
//
//        func changeSelectedIndex(to newIndex: Int) {
//            sortedViews[currentIndex].backgroundColor = UIColor.clear
//            currentIndex = newIndex
//            segmentedControl.selectedSegmentIndex = UISegmentedControlNoSegment
//            sortedViews[currentIndex].backgroundColor = selectedBackgroundColor
//        }
//    }

//    private func setUpUserView() {
//        borderForViews.snp.makeConstraints { (make) -> Void in
//            make.height.equalTo(self).multipliedBy(0.8)
//            make.width.equalTo(segmentedControl.snp.width)
//            make.top.equalTo(segmentedControl.snp.bottom)
//            make.centerX.equalTo(segmentedControl.snp.centerX)
//        }
//
    }
    
    

