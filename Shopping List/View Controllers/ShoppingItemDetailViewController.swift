//
//  ShoppingItemDetailViewController.swift
//  Shopping List
//
//  Created by Elizabeth Thomas on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemDetailViewController: UIViewController {
    
    var itemController = ShoppingItemController()
    
    // MARK: - IBOutlets
    @IBOutlet weak var itemsInShoppingListLabel: UILabel!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userAddressTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: - IBActions
    @IBAction func submitOrderButtonTapped(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
        showAlert()
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Order placed!", message: "Your items will be delivered to your address in 15 minutes!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func updateViews() {
        itemsInShoppingListLabel.text = "You currently have \(itemController.itemsAddedCount) item(s) in your shopping list."
    }
}
