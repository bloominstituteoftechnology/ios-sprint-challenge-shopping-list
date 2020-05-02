//
//  ShoppingDetailViewController.swift
//  Shopping List
//
//  Created by Rob Vance on 5/1/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingDetailViewController: UIViewController {

    //Instances
    var shoppingController: ShoppingController?
    var customerItems = 0
    
    
    // Mark: IBOutlets
    @IBOutlet weak var numberOfItemsLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let shoppingController = shoppingController else { return }
        customerItems = shoppingController.foodItems.count
        numberOfItemsLabel.text = "You have \(customerItems) item(s) in your shopping cart."
    }

    // Mark: IBActions
    @IBAction func sendOrderTapped(_ sender: Any) {
        if let name = nameTextField.text, !name.isEmpty,
            let address = addressTextField.text, !address.isEmpty {
            let alert = UIAlertController(title: "Delivery for \(name)", message: "The \(customerItems) items in your shopping cart will be shipped to \(address) in 15 minutes.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    
}
