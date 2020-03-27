//
//  ShoppingCartViewController.swift
//  Shopping List
//
//  Created by Shawn James on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingCartViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var itemCountLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    
    // MARK: - ShoppingList Property
    
    var shoppingList: ShoppingItemController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateViews()
    }
    
    
// MARK: - Actions
    
    @IBAction func sendOrderButtonTapped(_ sender: Any) { alert() }

    
    // MARK: - Methods
    
    func updateViews() {
        if let shoppingList = shoppingList {
            let addedItems = shoppingList.shoppingItems.filter( { $0.isAdded } )
            itemCountLabel.text = "You have" + " \(addedItems.count) " + "item(s) in your shopping list"
        }
    }
    
    func alert() {
        if let name = nameTextField.text,
            let address = addressTextField.text {
            let alert = UIAlertController(title: "Hello \(name)", message: "Your items will be delivered in 15 minutes to \(address)", preferredStyle: .alert)
            let action = UIAlertAction(title: "Done", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
    }
    
}
