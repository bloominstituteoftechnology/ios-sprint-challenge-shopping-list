//
//  OrderSubmitterViewController.swift
//  Shopping List
//
//  Created by Bryan Cress on 5/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class OrderSubmitterViewController: UIViewController {
    
    var shoppingList: ShoppingItemController?
    var itemsInCart: Int = 0 {
        didSet {
            totalItemsLabel.text = "You currently have \(itemsInCart) item(s) in your shopping cart"
        }
    }
    
    @IBOutlet weak var totalItemsLabel: UILabel!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userAddressTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    
    @IBAction func sendOrderButton(_ sender: UIButton) {
        shoppingList?.saveToPersistentStore()
        alert()
    }
    
    
    func updateViews() {
        if let shoppingList = shoppingList {
            let totalItems = shoppingList.shoppingItems
            for item in totalItems {
                if item.addedToCart == false {
                    itemsInCart += 1
                }
            }
            totalItemsLabel.text = "You currently have \(itemsInCart) item(s) in your shopping cart"
            shoppingList.saveToPersistentStore()
        }
    }
    
    func alert() {
        if let name = userNameTextField.text,
            let address = userAddressTextField.text {
            let alert = UIAlertController(title: "Hello \(name)", message: "Your items will be delivered in 15 minutes to \(address)", preferredStyle: .alert)
            let action = UIAlertAction(title: "Done", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
    }
}
