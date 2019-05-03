//
//  ShoppingCartViewController.swift
//  Shopping List
//
//  Created by Jeffrey Carpenter on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingCartViewController: UIViewController {
    
    var shoppingItemController: ShoppingItemController?

    @IBOutlet weak var shoppingListLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    @IBAction func submitOrderButtonPressed(_ sender: UIButton) {
        
        guard let address = addressTextField.text,
        !address.isEmpty,
        let name = nameTextField.text,
        !name.isEmpty
        else { return }
        
        let alert = UIAlertController(title: "Order for \(name)", message: "Your items will be delivered to \(address) in 15 minutes.", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    private func updateViews() {
        
        guard let shoppingItemController = shoppingItemController else { return }
        
        let numberOfItemsInCart = shoppingItemController.shoppingItems.filter({ $0.isInCart }).count
        shoppingListLabel.text = "You have \(numberOfItemsInCart) item(s) in your shopping list."
    }
}
