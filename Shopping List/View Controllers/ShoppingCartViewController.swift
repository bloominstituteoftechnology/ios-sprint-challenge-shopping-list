//
//  ShoppingItemCartViewController.swift
//  Shopping List
//
//  Created by Jordan Davis on 5/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingCartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
     func updateViews() {
        guard let shoppingItemController = shoppingItemController else { return }
        
        let numberOfItemsInCart = shoppingItemController.shoppingItems.filter({ $0.isOnList }).count
        cartNumberLabel.text = "You have \(numberOfItemsInCart) items(s) in your shopping list."
        nameTextField.text = ""
        addressTextField.text = ""
    }
    
    //MARK: - Actions
    
    @IBAction func submitOrderButtonPressed(_ sender: Any) {
        
        guard let address = addressTextField.text,
        !address.isEmpty,
        let name = nameTextField.text,
        !name.isEmpty
        else { return }
        
        updateViews()
        
        let alert = UIAlertController(title: "Order for \(name)", message: "Your items will be delivered in 15 minutes.", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    //MARK: -Properties
    
    @IBOutlet var cartNumberLabel: UILabel!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var addressTextField: UITextField!
    
    
    
    var shoppingItemController: ShoppingItemController?

}
