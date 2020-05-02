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
    
    var itemsAdded: [ShoppingItems]?
    var numberOfItemsAdded: Int? {
        return itemsAdded?.count
    }

    func updateViews() {
        guard let itemsAdded = numberOfItemsAdded else { return }
        itemsAddedLabel.text = "You currently have \(itemsAdded) item(s) int your shopping list."
    }
    
    @IBAction func sendOrderTapped(_ sender: Any) {
        guard let numberOfItems = numberOfItemsAdded,
        numberOfItems > 0,
        let name = customersNameText.text,
        let address = customersAddressText.text else { return }
        dismiss(animated: true, completion: nil)
        showAlert(name: name, address: address)
    }
    
    func showAlert(name: String, address: String) {
        let alert = UIAlertController(title: "Delivery for \(name)", message: "Your Items will be delieverd to \(address) shortly.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
}
