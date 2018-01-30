//
//  GalleryImageViewController.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 1/30/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class GalleryImageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // TODO: use KingFisher Pod
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            var imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
}

extension GalleryImageViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
//        imagePicked.image = image
        dismiss(animated:true, completion: nil)
    }
}
