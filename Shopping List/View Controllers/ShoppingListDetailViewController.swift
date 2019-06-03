//
//  ShoppingListDetailViewController.swift
//  Shopping List
//
//  Created by patelpra on 6/1/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListDetailViewController: UIViewController {
    
    
    @IBOutlet weak var listCountLabel: UILabel!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    var shoppingListController: ShoppingListController?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateViews()
    }
    
    @IBAction func sendOrderTapped(_ sender: UIButton) {
        guard let name = self.nameTextField.text, !name.isEmpty,
            let address = self.addressTextField.text, !address.isEmpty else { return }
        
        if self.shoppingListController!.shoppingItemsAdded.count > 0 {
            self.showAlert(withName: name, withAddress: address)
        } else {
            self.showNoItemsAlert()
        }
    }
    
    private func updateViews() {
        if let controller = self.shoppingListController {
            self.listCountLabel.text = "You currently have \(controller.shoppingItemsAdded.count) item(s) in your shopping list."
        }
    }
    private func showAlert(withName name: String, withAddress address: String) {
        let alert = UIAlertController(title: "Delivery for \(name)", message: "Your shopping items will be delivered to \(address) in 15 minutes.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    private func showNoItemsAlert() {
        let alert = UIAlertController(title: "Uh Oh", message: "You don't have any items in your shopping list. Please go back and add some.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        self.present(alert, animated: true)
    }
}
