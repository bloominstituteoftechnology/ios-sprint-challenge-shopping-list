//
//  DetailViewController.swift
//  Shopping List
//
//  Created by Ciara Beitel on 9/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var itemController: ShoppingItemController?
    
    @IBOutlet weak var itemsInList: UILabel!
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    @IBAction func sendOrder(_ sender: Any) {
        showAlert()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let itemController = itemController else { return }
        let addedItems = itemController.shoppingList.filter { $0.addedToList == true }
        itemsInList.text = "You have \(addedItems.count) in your shopping list."
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Delivery for \(fullNameTextField.text!)", message: "Your shopping items will be delivered to \(addressTextField.text!) in 15 minutes.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
