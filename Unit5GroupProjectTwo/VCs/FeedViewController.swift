//
//  FeedViewController.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 1/29/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit

class FeedViewController: UIViewController {
    
    let feedView  = FeedView()
    let menuButt = UIBarButtonItem(image: #imageLiteral(resourceName: "menuButton"), style: .plain, target: self, action: #selector(showMenu))
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        view.addSubview(feedView)
        feedView.tableView.delegate = self
        feedView.tableView.dataSource = self
        navigationItem.leftBarButtonItem = menuButt
    }
    
    @objc func showMenu() {
        let presentedMenuController = MenuViewController()
        presentedMenuController.modalTransitionStyle = .flipHorizontal
        presentedMenuController.modalPresentationStyle = .pageSheet
        present(presentedMenuController, animated: true, completion: nil)
    }
    
    
    
}

extension FeedViewController: UITableViewDelegate {
    
}
extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell", for: indexPath) as! FeedTableViewCell
        return cell
        
    }
}
