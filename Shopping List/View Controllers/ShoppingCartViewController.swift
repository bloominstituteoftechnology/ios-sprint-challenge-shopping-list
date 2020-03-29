//
//  ShoppingCartViewController.swift
//  Shopping List
//
//  Created by Harmony Radley on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingCartViewController: UIViewController {

     var shoppingList: ShoppingItemController?

     @IBOutlet weak var itemCountLabel: UILabel!
     @IBOutlet weak var yourNameTextField: UITextField!
     @IBOutlet weak var yourAddressTextField: UITextField!


     override func viewDidLoad() {
         super.viewDidLoad()
         updateViews()
     }

     @IBAction func sendOrderButtonTapped(_ sender: Any) {
         alert()
     }

     func updateViews() {
         if let shoppingList = shoppingList {
             let shoppingCart = shoppingList.shoppingItems.filter( { $0.hasBeenAdded == true } )
             itemCountLabel.text = "You currently have " + " \(shoppingCart.count) " + "item(s) in your shopping cart"
         }
     }

     func alert() {
         if let name = yourNameTextField.text,
             let address = yourAddressTextField.text {
             let alert = UIAlertController(title: "Hello \(name)", message: "Your items will be delivered in 15 minutes to \(address)", preferredStyle: .alert)
             let action = UIAlertAction(title: "Done", style: .default, handler: nil)
             alert.addAction(action)
             present(alert, animated: true, completion: nil)
         }
     }
}
