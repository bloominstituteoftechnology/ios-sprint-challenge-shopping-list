//
//  ShoppingListDetailViewController.swift
//  Shopping List
//
//  Created by Josh Kocsis on 5/1/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListDetailViewController: UIViewController {
    @IBOutlet weak var itemsAddedLabel: UILabel!
    @IBOutlet weak var customersNameText: UITextField!
    @IBOutlet weak var customersAddressText: UITextField!
    
    var itemsAdded: ShoppingItems?
    var shoppingListController: ShoppingListController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }

    func updateViews() {
        guard let itemsAdded = shoppingListController else { return }
        let selectedItems = itemsAdded.shoppingList.filter( { $0.hasBeenAdded == true } )
        itemsAddedLabel.text = "You currently have \(selectedItems.count) item(s) in your shopping list."
    }
    
    @IBAction func sendOrderTapped(_ sender: Any) {
        guard let name = customersNameText.text,
            let address = customersAddressText.text else { return }
        showAlert(name: name, address: address)
    }
    
    func showAlert(name: String, address: String) {
        let alert = UIAlertController(title: "Delivery for \(name)", message: "Your Items will be delieverd to \(address) shortly.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
