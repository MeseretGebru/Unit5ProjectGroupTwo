//
//  NewPostViewController.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 1/29/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit
import SnapKit
import Firebase

class NewPostVC: UIViewController {
    
    // Retain Reference to Main TabBar
    //    var tabBarVCControllers = [UIViewController]()
    var newPostView = NewPostView()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        connectViewFunctions()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Create", style: .done, target: self, action: #selector(createPost))
        
        
        // TEST
        newPostView.backgroundColor = UIColor.white
    }
    
    @objc private func createPost() {
        guard let title = newPostView.titleTextView.text else {
            // TODO: handle nil titletextfield?
            return
        }
        guard !title.isEmpty else { // PlaceHolderImage
            let noTitleAlert = UIAlertController(title: "No Title", message: "Please pick a title for your post before posting", preferredStyle: .alert)
            noTitleAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(noTitleAlert, animated: true, completion: nil)
            return
        }
        
        guard let image = newPostView.addImageButton.image(for: .normal) else {
            let noTitleAlert = UIAlertController(title: "No Image", message: "Please pick an image for your post before posting", preferredStyle: .alert)
            noTitleAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(noTitleAlert, animated: true, completion: nil)
            return
        }
//        
//        guard let image = newPostView.postImageView.image else {
//            let noTitleAlert = UIAlertController(title: "No Image", message: "Please pick an image for your post before posting", preferredStyle: .alert)
//            noTitleAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//            present(noTitleAlert, animated: true, completion: nil)
//            return
//        }
        let description = newPostView.descriptionTextView.text
        PostService.manager.saveNewPost(content: description ?? "", title: title, image: image)
        // the alert view
        let alert = UIAlertController(title: "", message: "post is being uploaded", preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
        
        // change to desired number of seconds (in this case 5 seconds)
        let when = DispatchTime.now() + 1
        DispatchQueue.main.asyncAfter(deadline: when){
            // your code with delay
            alert.dismiss(animated: true, completion: {
                self.navigationController?.popViewController(animated: true)
            })
        }
    }
    
    
    private func setupViews() {
        view.addSubview(newPostView)
        newPostView.snp.makeConstraints { (make) in
            make.edges.equalTo(view.snp.edges)
        }
    }
    
    
    // MARK:- connect dataSources, delegates, and targets
    private func connectViewFunctions() {
        newPostView.titleTextView.delegate = self
        newPostView.descriptionTextView.delegate = self
//        newPostView.categoryPicker.dataSource = self
//        newPostView.categoryPicker.delegate = self
//        newPostView.postButton.addTarget(self, action: #selector(postButtonPressed), for: .touchUpInside)
        newPostView.addImageButton.addTarget(self, action: #selector(addImageButtonPressed), for: .touchUpInside)
//        newPostView.categoryButton.addTarget(self, action: #selector(categoryButtonPressed), for: .touchUpInside)
    }
    
//    @objc private func postButtonPressed() {
//        guard let title = newPostView.titleTextView.text else {
//            // TODO: handle nil titletextfield?
//            return
//        }
//        guard !title.isEmpty else { // PlaceHolderImage
//            let noTitleAlert = UIAlertController(title: "No Title", message: "Please pick a title for your post before posting", preferredStyle: .alert)
//            noTitleAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//            present(noTitleAlert, animated: true, completion: nil)
//            return
//        }
//
//        guard  newPostView.postImageView.image != #imageLiteral(resourceName: "addImagePlaceholder") else {
//            let noTitleAlert = UIAlertController(title: "No Image", message: "Please pick an image for your post before posting", preferredStyle: .alert)
//            noTitleAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//            present(noTitleAlert, animated: true, completion: nil)
//            return
//        }
//
//        guard  let image = newPostView.postImageView.image else {
//            let noTitleAlert = UIAlertController(title: "No Image", message: "Please pick an image for your post before posting", preferredStyle: .alert)
//            noTitleAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//            present(noTitleAlert, animated: true, completion: nil)
//            return
//        }
//        //print(title)
//        // TODO: Make new post and upload it
//        // TODO: replace with PostService class
//        PostService.manager.saveNewPost(content: title, title: title, image: image)
//    }
//    @objc private func categoryButtonPressed() {
//        UIView.animate(withDuration: 0.5, animations: {
//            self.newPostView.categoryButton.layer.opacity = 0
//            self.newPostView.categoryContainerView.snp.updateConstraints({ (make) in
//                make.height.equalTo(250)
//            })
//            self.newPostView.updateConstraints()
//            self.newPostView.layoutIfNeeded()
//            self.newPostView.categoryContainerView.layoutIfNeeded()
//        }) { (finished) in
//            if finished {
//                self.newPostView.categoryButton.layer.zPosition -= 1
//            }
//        }
//    }
    
//    private func setCategory(to string: String) {
//        newPostView.categoryButton.setTitle("Category: \(string)", for: .normal)
//    }
//    private func hideCategoryPicker() {
//        // show CategoryButton
//        UIView.animate(withDuration: 0.5, animations: {
//            self.newPostView.categoryButton.layer.zPosition += 1
//            self.newPostView.categoryButton.layer.opacity = 1
//            self.newPostView.categoryContainerView.snp.updateConstraints({ (make) in
//                make.height.equalTo(70)
//            })
//            self.newPostView.updateConstraints()
//            self.newPostView.layoutIfNeeded()
//        }) { (finished) in
//            if finished {
//            }
//        }
//    }
//
    
    // TODO: remove function and let UserService class handle this
    private func getUser() -> DatabaseReference? {
        let currentUser = Auth.auth().currentUser
        let user = Database.database().reference().child("users").queryEqual(toValue: currentUser).value(forKey: "userRef") as? DatabaseReference
        return user
    }
    
    @objc private func addImageButtonPressed() {
        let addImageActionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        //        UIAlertAction(title: "take a photo", style: .default, handler: nil)
        let openCamera = UIAlertAction.init(title: "take a photo", style: .default) { [weak self] (action) in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = .camera;
                imagePicker.allowsEditing = false
                self?.present(imagePicker, animated: true, completion: nil)
            }
        }
        let openGallery = UIAlertAction(title: "take from library", style: .default) { [weak self] (action) in
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = .photoLibrary;
                imagePicker.allowsEditing = false
                self?.present(imagePicker, animated: true, completion: nil)
            }
        }
        
        addImageActionSheet.addAction(openCamera)
        addImageActionSheet.addAction(openGallery)
        addImageActionSheet.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: nil) )
        self.present(addImageActionSheet, animated: true, completion: nil)
        
        print("opened camera maybe?")
    }
    
}
// MARK: Camera and gallery stuff
extension NewPostVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
//            self.newPostView.postImageView.image = pickedImage
            self.newPostView.addImageButton.setImage(pickedImage, for: .normal)
            self.newPostView.addImageButton.setTitle("", for: .normal)
            updateImageViewSize()
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    private func updateImageViewSize() {
        guard let width = newPostView.addImageButton.image(for: .normal)?.size.width,
            let height = newPostView.addImageButton.image(for: .normal)?.size.height else {
                return
        }
        let ratio = height / width
        print(ratio)
        newPostView.addImageButton.snp.remakeConstraints { (make) in
            make.top.equalTo(self.newPostView.descriptionTextView.snp.bottom).offset(5)
            make.leading.equalTo(self.newPostView.titleTextView.snp.leading)
            make.trailing.equalTo(self.newPostView.titleTextView.snp.trailing)
            make.height.equalTo(self.newPostView.addImageButton.snp.width).multipliedBy(ratio)
            make.bottom.equalTo(self.newPostView.snp.bottom)
        }
        
    }
}

// MARK: TitleTextView handling
extension NewPostVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
//        if textView == newPostView.titleTextView {
            if textView.textColor == .lightGray {
                textView.text = nil
                textView.textColor = .black
            }
//        } else if textView == newPostView.descriptionTextView {
//            if textView.textColor == .lightGray {
//                textView.text = nil
//                textView.textColor = .black
//            }
//        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView == newPostView.titleTextView {
        if textView.text.isEmpty {
            textView.text = "Post Title"
            textView.textColor = .lightGray
        }
        } else if textView == newPostView.descriptionTextView {
            if textView.text.isEmpty {
                textView.text = "Post Description(optional)"
                textView.textColor = .lightGray
            }
        }
    }
}

// MARK:- CategoryPicker handling
extension NewPostVC: UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "PlaceHolder"
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
}

extension NewPostVC: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        self.setCategory(to: "PlaceHolder")
//        self.hideCategoryPicker()
    }
}





