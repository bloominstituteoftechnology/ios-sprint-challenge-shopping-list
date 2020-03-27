//
//  AddItemViewController.swift
//  Shopping List
//
//  Created by Vuk Radosavljevic on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit
import Photos

class AddItemViewController: UIViewController {

    //MARK: - PROPERTIES
    var listController: ListController?
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    
    
    //MARK: - METHODS
    @IBAction func saveItem(_ sender: Any) {
        guard let name = nameTextField.text,
            let image = imageView.image, let data = UIImagePNGRepresentation(image) else {return}
        listController?.addItem(name: name, imageData: data)
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addPhoto(_ sender: Any) {
        PHPhotoLibrary.requestAuthorization { (status) in
            guard status == .authorized else {return}
            DispatchQueue.main.async {
                self.presentImagePickerController()
            }
        }
    }
    
    private func presentImagePickerController() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
}

//MARK: - UIImagePickerControllerDelegate
extension AddItemViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerControllerOriginalImage] as? UIImage else {return}
        imageView.image = image
    }
}
