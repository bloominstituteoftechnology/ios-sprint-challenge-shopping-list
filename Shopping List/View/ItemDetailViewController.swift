//
//  ItemDetailViewController.swift
//  Shopping List
//
//  Created by Dillon McElhinney on 9/7/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit
import Photos

class ItemDetailViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    // MARK: - Properties
    var shoppingItemController: ShoppingItemController?

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        //Here I would call updateViews() when I add the ability to update an item.
    }

    // MARK: UI Methods
    @IBAction func addImage(_ sender: Any) {
        // CHeck Authorization Status
        let status = PHPhotoLibrary.authorizationStatus()
        
        if status == .authorized {
            // If authorized, present image picker
            presentImagePickerController()
        } else if status == .notDetermined {
            // If not determined, ask for authorization
            PHPhotoLibrary.requestAuthorization { (status) in
                if status == .authorized {
                    // If it comes back authorized, present the image picker
                    self.presentImagePickerController()
                }
            }
        } else {
            // TODO: - Handle denied access
        }
    }
    
    @IBAction func addShoppingItem(_ sender: Any) {
        guard let name = nameTextField.text, !name.isEmpty,
            let image = itemImageView.image, let imageData = UIImagePNGRepresentation(image) else { return }
        
        shoppingItemController?.createShoppingItem(name: name, imageData: imageData, isOnShoppingList: false)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - UI Image Picker Controller Delegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        itemImageView.image = image
    }
    
    // MARK: - Private Utility Methods
    // Method to present the image picker controller
    private func presentImagePickerController() {
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else { return }
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        
        present(imagePicker, animated: true, completion: nil)
    }
}
