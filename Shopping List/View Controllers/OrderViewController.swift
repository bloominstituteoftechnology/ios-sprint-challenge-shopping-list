//
//  OrderViewController.swift
//  Shopping List
//
//  Created by Bohdan Tkachenko on 5/2/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {
    
    
    var shoppingListController: ShoppingListController?
    var orderItems = 0

    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var currentNumberOfItemsLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let shoppingListController = shoppingListController else { return }
        orderItems = shoppingListController.fruitItem.count
        currentNumberOfItemsLabel.text = "You have \(orderItems) items in your shopping cart."
    }
    

    @IBAction func sendOrderButtonTapped(_ sender: Any) {
        if let name = nameTextField.text, !name.isEmpty,
            let address = addressTextField.text, !address.isEmpty {
            let alert = UIAlertController(title: "Delivery for \(name)", message: "The \(orderItems) in your shopping cart will be shipped to \(address) in 30 minutes", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
