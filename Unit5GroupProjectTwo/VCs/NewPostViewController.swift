//
//  NewPostViewController.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 1/29/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class NewPostViewController: UIViewController {
    
    // Retain Reference to Main TabBar
//    var tabBarVCControllers = [UIViewController]()
    
    var newPostView = NewPostView()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
//        if let tabBarController = tabBarController {
//            if tabBarController.viewControllers! != tabBarVCControllers {
//            tabBarController.setViewControllers(tabBarVCControllers, animated: true)
////            tabBarVCControllers = tabBarController.viewControllers!
//            }
//        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        if let tabBarController = tabBarController {
//            tabBarVCControllers = tabBarController.viewControllers!
//        }
        setupViews()
        
        newPostView.postButton.addTarget(self, action: #selector(postButtonPressed), for: .touchUpInside)
        newPostView.addImageButton.addTarget(self, action: #selector(addImageButtonPressed), for: .touchUpInside)
        
        // TEST
        newPostView.backgroundColor = UIColor.darkGray
    }
    
    private func setupViews() {
        view.addSubview(newPostView)
        newPostView.translatesAutoresizingMaskIntoConstraints = false
        [newPostView.topAnchor.constraint(equalTo: view.topAnchor),
         newPostView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
         newPostView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
         newPostView.trailingAnchor.constraint(equalTo: view.trailingAnchor)].forEach{$0.isActive = true}
    }
    
    @objc private func postButtonPressed() {
        guard let title = newPostView.titleTextfield.text else {
            // TODO: handle nil titletextfield?
            return
        }
        guard !title.isEmpty else { // PlaceHolderImage
            let noTitleAlert = UIAlertController(title: "No Title", message: "Please pick a title for your post before posting", preferredStyle: .alert)
            noTitleAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(noTitleAlert, animated: true, completion: nil)
            
            return
        }
        guard  newPostView.postImageView.image != #imageLiteral(resourceName: "profile") else {
            let noTitleAlert = UIAlertController(title: "No Image", message: "Please pick an image for your post before posting", preferredStyle: .alert)
            noTitleAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(noTitleAlert, animated: true, completion: nil)
            
            return
        }
        print(title)
    }
    @objc private func addImageButtonPressed() {
        let addImageActionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
//        UIAlertAction(title: "take a photo", style: .default, handler: nil)
        let openCamera = UIAlertAction.init(title: "take a photo", style: .default) { [weak self] (action) in
//            self?.navigationController?.pushViewController(CameraImageViewController(), animated: true)
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                let imagePicker = UIImagePickerController()
//                imagePicker.delegate = self
                imagePicker.sourceType = .camera;
                imagePicker.allowsEditing = false
                self?.navigationController?.pushViewController(imagePicker, animated: false)
            }
        }
        
        
        addImageActionSheet.addAction(openCamera)
        addImageActionSheet.addAction(UIAlertAction(title: "take from gallery", style: .default, handler: nil))
//        addImageActionSheet.addAction(UIAlertAction(title: "upload from url", style: .default, handler: nil))
        self.present(addImageActionSheet, animated: true, completion: nil)
        
        
//        let cameraVC = CameraImageViewController()
//        let galleryVC = GalleryImageViewController()
//        // PlaceHolders
//        cameraVC.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
//        galleryVC.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
//        let tabBarVC = UITabBarController()
//        tabBarVC.viewControllers = [cameraVC, galleryVC]
//        tabBarController?.tabBar.isHidden = true
//        navigationController?.pushViewController(tabBarVC, animated: true)
        print("opened camera maybe?")
    }

}
