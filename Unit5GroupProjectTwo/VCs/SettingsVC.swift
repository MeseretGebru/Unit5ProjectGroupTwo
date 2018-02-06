//
//  SettingsViewController.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 1/29/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

/*TO-DO:
- Add function to upload image button to pop up Alert Sheet
 - Add gallery, camera and url actions to Alert Sheet
 - Save button updates Firebase
 - When field is blank, button does not save anything!!!!
 - Back button is in navigation 
 */

class SettingsVC: UIViewController {
    let settingView = SettingsView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        settingView.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        
        //        settingView.changePictureButton.addTarget(self, action: #selector(changePicture), for: .touchUpInside)
        //        settingView.postsButton.addTarget(self, action: #selector(posts), for: .touchUpInside)
        addSubViews()
        
    }
    private func configureNavBar() {
        navigationItem.title = "Setting"
        let backButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: self, action: #selector(back))
        navigationItem.leftBarButtonItem = backButton
        //            navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(dismissView))
    }
    
    private func addSubViews(){
        view.addSubview(settingView)
        addConstraints()
    }
    
    /* @objc private func changePicture(){
     
     }
     
     @objc private func posts(){
     
     }*/
    
    @objc private func back(){
        
    }
    
    @objc private func dismissView() {
        dismiss(animated: true, completion: nil)
    }
    
    private func addConstraints(){
        settingView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
    }
    
    
    

}



