//
//  OrderDetailViewController.swift
//  Shopping List
//
//  Created by Chris Dobek on 3/30/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class OrderDetailViewController: UIViewController {
    
    
    @IBOutlet weak var howManyLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    var shoppingController: ShoppingListController?
    
    @IBAction func sendOrderButton(_ sender: Any) {
        let alert = UIAlertController(title: "\(nameTextField.text ?? "No Name"), thank you for your order!", message: "Your order will be delivered in 15 minutes to \(addressTextField.text ?? "No Address")", preferredStyle: .alert)
               let action = UIAlertAction(title: "Done", style: .default, handler: nil)
               alert.addAction(action)
               present(alert, animated: true, completion: nil)
           }
    
   func updateViews() {
    if let shoppingController = shoppingController {
           let shoppingCart = shoppingController.shoppingItems.filter( { $0.isAdded == true } )
           howManyLabel.text = "You currently have " + " \(shoppingCart.count) " + "item(s) in your shopping cart"
       }
   }
}
