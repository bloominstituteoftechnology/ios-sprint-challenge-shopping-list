//
//  ShoppingListDetailViewController.swift
//  Shopping List
//
//  Created by Chad Rutherford on 11/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListDetailViewController: UIViewController {
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Outlets
    @IBOutlet weak var shoppingListNumberLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Properties
    var shoppingController: ShoppingItemController?
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - View Configuration
    /// Function to set up the views for the scene.
    private func updateViews() {
        guard let items = shoppingController?.items.filter( { $0.hasBeenAdded } ) else { return }
        if items.count == 1 {
            shoppingListNumberLabel.text = "You currently have 1 item in your\n shopping list."
        } else {
            shoppingListNumberLabel.text = "You currently have \(items.count) items in your\n shopping list."
        }
    }
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Helper Methods
    private func showGroceryAlert(name: String, address: String) {
        let alert = UIAlertController(title: "\(name)'s items are on the way", message: "Items will be delivered to \(address) in 15 minutes.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { [weak self] _ in
            guard let self = self else { return }
            self.navigationController?.popViewController(animated: true)
        })
        present(alert, animated: true)
    }
    
    // --- --- --- --- --- --- --- --- --- --- --- --- --- --- ---
    // MARK: - Actions
    @IBAction func sendOrderWasTapped(_ sender: UIButton) {
        guard let name = nameTextField.text, !name.isEmpty, let address = addressTextField.text, !address.isEmpty else { return }
        showGroceryAlert(name: name, address: address)
    }
}
