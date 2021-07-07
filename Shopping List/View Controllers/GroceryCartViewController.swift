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
    
    var groceryController: GroceryController?
    var numberOfItems: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateViews()
    }
    
    
    @IBAction func sendOrderTapped(_ sender: Any) {
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
        numberOfItemsLabel.text = "You currently have \(numberOfItems) item(s) in your cart."
    }

}
