//
//  CustomerDetailViewController.swift
//  Shopping List
//
//  Created by Alex Rhodes on 7/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CustomerDetailViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var itemsInCartLabel: UILabel!
    
    
    var shoppingItemArrayAccess = ShoppingItemController()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateViews()
    }
    
    func updateViews() {
        
        let arrayOfItems = shoppingItemArrayAccess.showItems 
        var count = 0
        for item in arrayOfItems {
            if item.hasBeenAdded == true { count += 1 }
        }
        
        itemsInCartLabel.text = String("You have \(count) items in your basket.")
    }
    
    @IBAction func placeOrderButtonTapped(_ sender: UIButton) {
        let address = addressTextField.text
        let name = nameTextField.text
        let alert = UIAlertController(title: "Thank you for your order \(name ?? "")!", message: "You're order will be delievered to \(address ?? "") in one hour.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }

}
