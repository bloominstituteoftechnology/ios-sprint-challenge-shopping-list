//
//  AddShoppingItemViewController.swift
//  Shopping List
//
//  Created by Simon Elhoej Steinmejer on 03/08/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit
import Photos

class AddShoppingItemViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    var shoppingItemController: ShoppingItemController?
    
    //MARK: - UI Objects
    
    let shoppingItemNameTextField: UITextField =
    {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.placeholder = "Shopping item name"
        tf.addTarget(self, action: #selector(handleEditingChanged), for: .editingChanged)
        
        return tf
    }()
    
    let addImageButton: UIButton =
    {
        let button = UIButton(type: .system)
        button.setTitle("Add Photo", for: .normal)
        button.addTarget(self, action: #selector(handlePhotoLibraryPermission), for: .touchUpInside)
        
        return button
    }()
    
    let shoppingItemImageView: UIImageView =
    {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.backgroundColor = .lightGray
        
        return iv
    }()
    
    let addShoppingItemButton: UIButton =
    {
        let button = UIButton(type: .system)
        button.setTitle("Add Item", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 6
        button.isEnabled = false
        button.addTarget(self, action: #selector(handleAddShoppingItem), for: .touchUpInside)
        
        return button
    }()
    
    //MARK: - Functions
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavBar()
        setupUI()
    }
    
    @objc func handleAddShoppingItem()
    {
        guard let name = shoppingItemNameTextField.text, let image = shoppingItemImageView.image, let data = UIImagePNGRepresentation(image) else { return }
        shoppingItemController?.addShoppingItem(with: name, imageData: data)
        navigationController?.popViewController(animated: true)
    }
    
    @objc func handlePhotoLibraryPermission()
    {
        PHPhotoLibrary.requestAuthorization { (status) in
            if status == .authorized
            {
                DispatchQueue.main.async {
                    self.handleImageController()
                }
            }
            else
            {
                let alert = UIAlertController(title: "Warning", message: "We need permission to your photo library before you can add a shopping item.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Okay", style: .cancel, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }

    private func handleImageController()
    {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary)
        {
            let imagePicker = UIImagePickerController()
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = true
            imagePicker.delegate = self
        
            present(imagePicker, animated: true, completion: nil)
        }
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        if let editedPhoto = info["UIImagePickerControllerEditedImage"] as? UIImage
        {
            shoppingItemImageView.image = editedPhoto
        }
        else if let photo = info["UIImagePickerControllerOriginalImage"] as? UIImage
        {
            shoppingItemImageView.image = photo
        }
    
        handleEditingChanged()
        dismiss(animated: true, completion: nil)
    }
    
    
    @objc private func handleEditingChanged()
    {
        guard let name = shoppingItemNameTextField.text else { return }
        let isValid = name.count > 0 && shoppingItemImageView.image != nil
        
        addShoppingItemButton.backgroundColor = isValid ? .green : .lightGray
        addShoppingItemButton.isEnabled = isValid ? true : false
    }
    
    private func setupNavBar()
    {
        title = "New Shopping Item"
    }
    
    //MARK: - AutoLayout Constraints
    
    fileprivate func setupUI()
    {
        view.addSubview(shoppingItemImageView)
        view.addSubview(addImageButton)
        view.addSubview(shoppingItemNameTextField)
        view.addSubview(addShoppingItemButton)
        
        shoppingItemNameTextField.anchor(top: nil, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 0, paddingLeft: 12, paddingRight: 12, paddingBottom: 0, width: 0, height: 30)
        shoppingItemNameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        addImageButton.anchor(top: nil, left: view.safeAreaLayoutGuide.leftAnchor, bottom: shoppingItemNameTextField.topAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 0, paddingLeft: 12, paddingRight: 12, paddingBottom: -12, width: 0, height: 20)
        
        shoppingItemImageView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: addImageButton.topAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 20, paddingLeft: 12, paddingRight: 12, paddingBottom: -12, width: 0, height: 0)
        
        addShoppingItemButton.anchor(top: shoppingItemNameTextField.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: nil, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 20, paddingLeft: 12, paddingRight: 12, paddingBottom: 0, width: 0, height: 40)
    }
    
    
}





















