//
//  UserDetailedViewController.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_167 on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class UserDetailedViewController: UIViewController {
    
    var shoppingItemController:  ShoppingListController?
    
    override func viewDidLoad() {
           super.viewDidLoad()
            displayShoppingItems()
       }
       

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBAction func submitOrderButtonTapped(_ sender: UIButton) {
        shoppingAlert()
    }
    
    func shoppingAlert() {
        if shoppingItemController!.addedItems.count != 0 {
            let alert = UIAlertController(title: "Order Recieved", message: "Thanks \(nameTextField.text!)! The item(s) you selected will be Delivered to your address at \(addressTextField.text!) in 15 minutes ", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Proceed", style: .default, handler: {_ in
                let alert = UIAlertController(title: "Thank You", message: "You have successfuly submitted your order.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Proceed", style: .default
                    , handler: {_ in self.navigationController?.popViewController(animated: true)
                }))
                self.present(alert, animated: true)
        }))
            alert.addAction((UIAlertAction(title: "Undo", style: .default, handler: nil)))
            self.present(alert, animated: true)}
    }
 
    func displayShoppingItems() {
    if let numberOfItems = shoppingItemController?.addedItems.count {
        messageLabel.text = "You currently have \(numberOfItems) item(s) in your shopping list. "
    }
}
}
