//
//  ShoppingCartViewController.swift
//  Shopping List
//
//  Created by Shawn James on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingCartViewController: UIViewController {

    // MARK: - Properties
    var shoppingList: ShoppingItemController?
    
    // MARK: - Outlets
    @IBOutlet weak var itemCountLabel: UILabel!
    @IBOutlet weak var yourNameTextField: UITextField!
    @IBOutlet weak var yourAddressTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    // MARK: - Actions
    @IBAction func sendOrderButtonTapped(_ sender: Any) {
        alert()
    }
    
    // MARK: - Methods
    func updateViews() {
        if let shoppingList = shoppingList {
            let filteredItems = shoppingList.shoppingItems.filter( { $0.added == true } )
            itemCountLabel.text = "You have" + " \(filteredItems.count) " + "item(s) in your shopping list"
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
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }

}
