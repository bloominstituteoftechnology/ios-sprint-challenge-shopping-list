//
//  OrderViewController.swift
//  Shopping List
//
//  Created by Gi Pyo Kim on 9/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {
    @IBOutlet weak var howManyItemLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    var shoppingItemController: ShoppingItemController?
    var numOfItems = 0
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let shoppingItemController = shoppingItemController else { return }
        
        numOfItems = shoppingItemController.addedItems.count
        howManyItemLabel.text = "You Currently have \(numOfItems) items(s) in your shopping list"
    }
    
    @IBAction func sendOrderTabbed(_ sender: UIButton) {
        if let name = nameTextField.text,
                !name.isEmpty,
                let address = addressTextField.text,
            !address.isEmpty {
                let alert = UIAlertController(title: "Delivery for \(name)", message: "\(numOfItems) items in you shopping list will be shipped to \(address) in 15 minutes", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
        }
    }
    
}
