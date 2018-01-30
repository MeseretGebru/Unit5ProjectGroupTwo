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

class SettingsViewController: UIViewController {
    
    let setView = SettingsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(setView)
        setView.translatesAutoresizingMaskIntoConstraints = false
        setUpView()

    }
    
    func setUpView() {
        setView.snp.makeConstraints { (make) -> Void in
            make.size.equalTo(view.safeAreaLayoutGuide.snp.size)
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
