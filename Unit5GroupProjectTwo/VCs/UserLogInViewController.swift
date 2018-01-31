//
//  UserLogInViewController.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 1/29/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit

class UserLogInViewController: UIViewController {
    
    let userLoginView = UserLoginView()
    let userSignUpView = SignUpView()
    let viewContainer = SegmentedControlView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        
        let views = [viewContainer, userLoginView, userSignUpView] as [UIView]
        views.forEach{ ($0).translatesAutoresizingMaskIntoConstraints = false; self.view.addSubview($0) }
        userSignUpView.isHidden = true
    
        viewContainer.segmentedControl.addTarget(self, action: #selector(segmentControlPressed), for: .valueChanged)
        userLoginView.submitInfoButton.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControlEvents#>)
        userSignUpView.createAccountButton.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControlEvents#>)

        setUpAccountView()
        userSignUpViewConstraints()
        userCreateAccountConstraints()
    }
    
    
    
    func setUpAccountView() {
        viewContainer.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(view.snp.height).multipliedBy(0.8)
            make.width.equalTo(view.snp.width).multipliedBy(0.9)
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.snp.centerY).offset(20)
            
            
        }
    }
    
    //To check if user is logged in and switch screens if true
    private func getStarted() {
        let navBar = MainViewController()
        navigationController?.pushViewController(navBar, animated: true)
        
    }
    
    func userSignUpViewConstraints() {
        userSignUpView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(viewContainer.segmentedControl.snp.bottom).offset(2)
            make.width.equalTo(viewContainer.snp.width).multipliedBy(0.99)
            make.height.equalTo(viewContainer.borderForViews.snp.height).multipliedBy(0.99)
            make.centerX.equalTo(viewContainer.segmentedControl.snp.centerX)
        }
    }
    
    func userCreateAccountConstraints() {
        userLoginView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(viewContainer.segmentedControl.snp.bottom).offset(2)
            make.width.equalTo(viewContainer.snp.width).multipliedBy(0.99)
            make.height.equalTo(viewContainer.borderForViews.snp.height).multipliedBy(0.99)
            make.centerX.equalTo(viewContainer.segmentedControl.snp.centerX)
            
        }
    }
    
    
    @objc func segmentControlPressed(sender: UISegmentedControl)  {
        if sender.selectedSegmentIndex == 0 {
            userLoginView.isHidden = false
            userSignUpView.isHidden = true
            print("\(String(describing: sender.titleForSegment(at: 0)))")
        }
            
        else if sender.selectedSegmentIndex == 1 {
            userLoginView.isHidden = true
            userSignUpView.isHidden = false
            print("\(String(describing: sender.titleForSegment(at: 1)))")
        }
    }
    
    

    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
