//
//  ShoppingListDetailViewController.swift
//  Shopping List
//
//  Created by Jeremy Taylor on 5/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListDetailViewController: UIViewController {
    // MARK: - Properties
    var addedItemsCount: Int?
    
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let addedItemsCount = addedItemsCount else { return }
        switch addedItemsCount {
        case 0:
            summaryLabel.text = "You currently have no items in your shopping list."
        case 1:
            summaryLabel.text = "You currently have 1 item in your shopping list."
        default:
            summaryLabel.text = "You currently have \(addedItemsCount) items in your shopping list."
        }
        
    }
    
    
    
    @IBAction func submitOrderTapped(_ sender: Any) {
        guard let name = nameTextField.text, !name.isEmpty,
            let address = addressTextField.text, !address.isEmpty else { return }
        let titleString = "\(name), your order will be delivered in 15 minutes to:"
        
        presentAlert(withTitle: titleString, andMessage: address)
    }
    
    func presentAlert(withTitle title: String, andMessage message: String) {
        let alertController = UIAlertController(title: title , message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
    
}
