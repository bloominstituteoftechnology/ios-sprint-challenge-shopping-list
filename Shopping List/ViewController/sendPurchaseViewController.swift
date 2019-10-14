//
//  sendPurchaseViewController.swift
//  Shopping List
//
//  Created by denis cedeno on 10/12/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class sendPurchaseViewController: UIViewController {
    
    var shoppingListContorller: ShoppingItemController?

    @IBOutlet weak var itemsInCartLabel: UILabel!
    @IBOutlet weak var customerNameTextField: UITextField!
    @IBOutlet weak var customerDeliveryAddress: UITextField!
    @IBAction func submitOrderButton(_ sender: Any) {
        showAlert()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let shoppingListContorller = shoppingListContorller else {return}
        let purchaseList = shoppingListContorller.shoppingLists.filter {$0.addedItem == true}
        itemsInCartLabel.text = "You have added \(String(describing: purchaseList.count)) (s) in your shopping list"
    }
    
    func showAlert() {
        let alert = UIAlertController(
            title: "Delivery for \(customerNameTextField.text!)!",
            message: "Your shopping items will be delivered to: \(customerDeliveryAddress.text!) , in 15 minutes.",
            preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

}
