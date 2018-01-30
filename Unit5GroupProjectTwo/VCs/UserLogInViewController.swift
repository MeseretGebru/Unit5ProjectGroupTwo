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
        
        let views = [userLoginView, userSignUpView, viewContainer] as [UIView]
        views.forEach{ ($0).translatesAutoresizingMaskIntoConstraints = false; self.view.addSubview($0) }
        
//        let segmentedControl = UISegmentedControl(items: ["Title One", "Title Two"])
//        segmentedControl.frame = CGRect(x: 0, y: 64, width: view.bounds.width, height: 44)
//        view.addSubview(segmentedControl)
//        segmentedControl.tintColor = .orange
//        segmentedControl.backgroundColor = .green
//        segmentedControl.addTarget(self, action: #selector(segmentControlPressed), for: .valueChanged)
        
        
        //self.view.addSubview(userLoginView)
//        self.view.addSubview(userSignUpView)
//        let items = [ userLoginView, userSignUpView]
//        let segControl = UISegmentedControl(items: items)
//        self.view.addSubview(segControl)
//        segControl.frame = CGRect(x: 100, y: 200, width: 200, height: 30)
//        segControl.insertSegment(withTitle: "Log In", at: 0, animated: true)
//        segControl.selectedSegmentIndex = 0
//        segControl.addTarget(self, action: "segment", for: UIControlEvents.valueChanged)

    }
    

    
    func setUpAccountView() {
        viewContainer.snp.makeConstraints { (make) -> Void in
            
            
        }
    }
    
    private func getStarted() {
        let navBar = MainViewController()
        navigationController?.pushViewController(navBar, animated: true)
        
    }
    
    func userSignUpViewConstraints() {
        userSignUpView.snp.makeConstraints { (make) -> Void in

        }
    }
    
    func userCreateAccountConstraints() {
        userLoginView.snp.makeConstraints { (make) -> Void in
            
        }
    }
    
    
    @objc func segmentControlPressed(sender: UISegmentedControl)  {
        if sender.selectedSegmentIndex == 0 {
            print("\(String(describing: sender.titleForSegment(at: 0)))")
        }
            
        else if sender.selectedSegmentIndex == 1 {
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
