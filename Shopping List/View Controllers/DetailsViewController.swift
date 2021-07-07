//
//  DetailsViewController.swift
//  Shopping List
//
//  Created by Alexander Supe on 11/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var shoppingItemController: ShoppingItemController?
    @IBOutlet weak var itemsLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabel()
    }
    
    func setLabel() {
        itemsLabel.text = "You have \(shoppingItemController?.addedItems.count ?? 0) item(s) on your shopping list."
    }
    
    @IBAction func sendButton(_ sender: Any) {
        if shoppingItemController?.addedItems.count != 0, nameField.text != "", addressField.text != "" {
            let alert = UIAlertController(title: "Order Received", message: "Hey \(nameField.text!), your order of \(shoppingItemController?.addedItems.count ?? 0) items, will be delivered in the next 15 minutes to \(addressField.text!)", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alert.addAction(okAction)
            
            present(alert, animated: true)
        }
    }
}
