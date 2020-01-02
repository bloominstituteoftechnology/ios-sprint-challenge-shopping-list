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

    private func showAlert(to name: String, at address: String) {
        
        let alert = UIAlertController(title: "Delivery for \(name)", message: "In 15 minutes your order will be delivered to \(address)", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
            self.present(alert, animated: true, completion: nil)
        }
    
    //Mark: - IBAaction
    @IBAction func submitOrderButtonTapped(_ sender: UIButton) {
        
        guard let name = nameTextField.text,
            let address = addressTextField.text,
            !name.isEmpty,
            !address.isEmpty else { return }
            
        
        
            
    }
}
    

