//
//  CreateOrderViewController.swift
//  Shopping List
//
//  Created by Wyatt Harrell on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class CreateOrderViewController: UIViewController {

    
    @IBOutlet weak var shoppingListLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    
    var shoppingItemController: ShoppingItemController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let shoppingItemController = shoppingItemController else { return }
        
        shoppingListLabel.text = "You currently have \(shoppingItemController.shoppingList.count) item(s) in your shopping list."
        
    }

    @IBAction func sendOrderButtonTapped(_ sender: Any) {
        
        guard let name = nameTextField.text, !name.isEmpty, let address = addressTextField.text, !address.isEmpty else { return }
        
        let alert = UIAlertController(title: "Ordered", message: "Thank you for your order, \(name). It will be delivered to \(address) in 15 minutes.", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true)
    }
}
