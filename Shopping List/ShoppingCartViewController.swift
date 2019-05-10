//
//  ShoppingCartViewController.swift
//  Shopping List
//
//  Created by Ryan Murphy on 5/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingCartViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var cartNumberLabel: UILabel!
    @IBOutlet weak var addressTextField: UITextField!
    var shoppingItemController: ShoppingItemController?
    
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
        
        updateViews()
        
        let alert = UIAlertController(title: "Order for \(name)", message: "Your items will be delivered to \(address) in 15 minutes.", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        shoppingItemController?.clearCart()
    }
    private func updateViews() {
        
        guard let shoppingItemController = shoppingItemController else { return }
        
        let numberOfItemsInCart = shoppingItemController.shoppingItems.filter({ $0.isOnList }).count
        cartNumberLabel.text = "You have \(numberOfItemsInCart) item(s) in your shopping list."
        nameTextField.text = ""
        addressTextField.text = ""
    }
    
}
