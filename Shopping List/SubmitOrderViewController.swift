//
//  SubmitOrderViewController.swift
//  Shopping List
//
//  Created by Thomas Cacciatore on 5/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class SubmitOrderViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        updateOrderLabel()

    }
    
    func updateOrderLabel() {
        let numberOfAddedItems = shoppingListController.itemWasAdded.count
        submitOrderLabel.text = "You have \(numberOfAddedItems) item(s) in your cart"
    }

    func presentAlert() {
        guard let nameText = nameTextField.text, !nameText.isEmpty,
            let addressText = addressTextField.text, !addressText.isEmpty else { return }
        let alert = UIAlertController(title: "Order Placed", message: "\(nameText), your order will be sent to \(addressText)", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    @IBAction func sendOrderButtonTapped(_ sender: Any) {
        presentAlert()
    }
    
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var submitOrderLabel: UILabel!
    
    var shoppingListController = ShoppingListController()
}
