//
//  ShoppingListDetailViewController.swift
//  Shopping List
//
//  Created by John Kouris on 8/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListDetailViewController: UIViewController {
    
    @IBOutlet weak var groceryItemCountLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    var shoppingItemController: ShoppingItemController?
    var shoppingItems: [ShoppingItem]?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sendOrderButtonTapped(_ sender: UIButton) {
        guard let name = nameTextField.text,
            let address = addressTextField.text,
            !name.isEmpty,
            !address.isEmpty else {
                let alert = UIAlertController(title: "Error", message: "Please enter your name and an address before submitting your order", preferredStyle: .alert)
                let dismiss = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
                alert.addAction(dismiss)
                present(alert, animated: true, completion: nil)
                return
        }
        
        let alert = UIAlertController(title: "Delivery Scheduled for \(name)", message: "Your order will be delivered in 15 minutes to \(address)", preferredStyle: .alert)
        let okay = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okay)
        present(alert, animated: true, completion: nil)
    }

}
