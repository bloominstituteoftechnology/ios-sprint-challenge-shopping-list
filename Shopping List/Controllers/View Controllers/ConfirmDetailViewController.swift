//
//  ConfirmDetailViewController.swift
//  Shopping List
//
//  Created by Lambda_School_loaner_226 on 2/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ConfirmDetailViewController: UIViewController {

    @IBOutlet weak var itemCountLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var sendOrderButton: UIButton!
    
    var shoppingList: ShoppingItemController?

    override func viewDidLoad() {
        super.viewDidLoad()
        sendOrderButton.layer.cornerRadius = 25
        updateViews()
    }
    
    //MARK: - UpdateViews
    
    func updateViews() {
        if let shoppingList = shoppingList {
            let selectedItems = shoppingList.shoppingListItem.filter({$0.hasBeenAdded == true})
            itemCountLabel.text = "You have \(selectedItems.count) item(s) in your shopping list"
        }
    }
    
    //MARK: - Alerts
    
    func alert() {
        if let name = nameTextField.text,
            let address = addressTextField.text {
            let alert = UIAlertController(title: "Hi, \(name)", message: "Your items will be delivered to \(address).", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alert.addAction(action)
            
            present(alert, animated: true, completion: nil)
        }
    }

    @IBAction func sendOrderTapped(_ sender: UIButton) {
        alert()
    }
    
}
