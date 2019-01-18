//
//  ShoppingListDetailViewController.swift
//  Shopping List
//
//  Created by Moses Robinson on 1/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListDetailViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateViews()
    }
    
    @IBAction func sendOrderButtonTapped(_ sender: Any) {
        guard let name = nameTextField.text, !name.isEmpty,
        let address = addressTextField.text, !address.isEmpty,
        let shoppingList = shoppingListController?.addedShoppingList, !shoppingList.isEmpty else  { return }
        
        print("Hello \(name), your \(shoppingList.count) item(s) are being sent to: \(address)")
    }
    
    private func updateViews() {
        guard let shoppingList = shoppingListController?.addedShoppingList else  { return }
        
        textLabel.text = "You currently have (\(shoppingList.count)) item(s) in your shopping cart."
    }
    
    //MARK: - Properties

    var shoppingListController: ShoppingItemController?
    
    var shoppingList: [ShoppingItem]? 
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
}
