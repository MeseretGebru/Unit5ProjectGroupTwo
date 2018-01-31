//
//  CameraImageViewController.swift
//  Unit5GroupProjectTwo
//
//  Created by C4Q on 1/30/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class CameraImageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let navigationController = navigationController {
            navigationController.popViewController(animated: true)
            print("here")
        }
        // TODO: use KingFisher Pod
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera;
            imagePicker.allowsEditing = false
            navigationController?.pushViewController(imagePicker, animated: false)
        }
    }
}

extension CameraImageViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
//        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
//        imagePicked.image = image
//        dismiss(animated:true, completion: nil)
//    }
}
