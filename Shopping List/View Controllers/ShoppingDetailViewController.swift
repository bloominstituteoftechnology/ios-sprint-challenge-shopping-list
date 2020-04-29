//
//  ShoppingDetailViewController.swift
//  Shopping List
//
//  Created by Nonye on 4/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingDetailViewController: UIViewController {
    
    var shoppingController: ShoppingController?
    var customerItems = 0
    
    //MARK: - OUTLETS
    @IBOutlet weak var numberOfItemsLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var addressTextField: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let shoppingController = shoppingController else { return }
        customerItems = shoppingController.foodItems.count
        numberOfItemsLabel.text = "You have \(customerItems) items in your shopping bag"
    }
    
    //MARK: - ACTIONS
    @IBAction func sendOrderButton(_ sender: Any) {
        if let name = nameTextField.text,
            !name.isEmpty,
            let address = addressTextField.text,
            !address.isEmpty {
            let alert = UIAlertController(title: "Delivery for \(name)", message: "The \(customerItems) item(s) in your shopping cart will be shipped to \(address)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    
    func updateViews() {
        if let shoppingController = shoppingController {
            
        }
    }
    
}
