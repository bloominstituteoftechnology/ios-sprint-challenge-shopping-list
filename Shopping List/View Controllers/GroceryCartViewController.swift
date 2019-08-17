//
//  GroceryCartViewController.swift
//  Shopping List
//
//  Created by Dillon P on 8/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class GroceryCartViewController: UIViewController {

    @IBOutlet weak var numberOfItemsLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    var groceryController = GroceryController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    
    @IBAction func sendOrderTapped(_ sender: Any) {
        let numberOfItems = groceryController.itemsInCart.count
        if numberOfItems == 0 {
            let alert = UIAlertController(title: "No Items Selected", message: "Please add some items to your cart before placing an order!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in self.navigationController?.popViewController(animated: true)}))
            self.present(alert, animated: true)
        } else {
            if let address = addressTextField.text, let name = nameTextField.text, !name.isEmpty, !address.isEmpty {
                let alert = UIAlertController(title: "Order Placed!", message: "Your grocery items will be delivered to \(address)", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in self.navigationController?.popViewController(animated: true)}))
                self.present(alert, animated: true)
            } else {
                let alert = UIAlertController(title: "Enter Information", message: "Please enter a name and address before proceeding.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true)
            }
        }
    }
    
    private func updateViews() {
        let numberOfItems = groceryController.itemsInCart.count
        numberOfItemsLabel.text = "You currently have \(numberOfItems) item(s) in your cart."
    }

}
