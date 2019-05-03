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
    }
    
    private func updateViews() {
        
        guard let shoppingItemController = shoppingItemController else { return }
        
        let numberOfItemsInCart = shoppingItemController.shoppingItems.filter({ $0.isInCart }).count
        shoppingListLabel.text = "You have \(numberOfItemsInCart) item(s) in your shopping list."
    }
    
    private func showAlert() {
        
    }
}
