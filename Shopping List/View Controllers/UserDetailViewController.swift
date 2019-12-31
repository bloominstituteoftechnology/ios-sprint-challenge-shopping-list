//
//  UserDetailViewController.swift
//  Shopping List
//
//  Created by Gerardo Hernandez on 12/30/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit



class UserDetailViewController: UIViewController {

    
    @IBOutlet weak var itemCountLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    
    var itemsOrderedCount: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()

        
    }
    
    private func updateViews() {
        guard let itemCount = itemsOrderedCount else { return }
        
        itemCountLabel.text = "You have \(itemCount) item(s)"
    }

    private func alert(to name: String, at address: String) {
        let alertTitle = "Thank you for your order, \(name)!"
        let message = "In 15 minutes your order will be delivered to \(address)"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Confirm", style: .default)
        { alert in
            self.navigationController?.popViewController(animated: true)}
        alert.addAction(action)
        
        present(alert, animated: true)
        }
    
    //Mark: - IBAaction
    @IBAction func submitOrderButtonTapped(_ sender: UIButton) {
        
        guard let name = nameTextField.text,
            let address = addressTextField.text,
            !name.isEmpty,
            !address.isEmpty else { return }
        
        alert(to: name, at: address)
            
    }
}
    

