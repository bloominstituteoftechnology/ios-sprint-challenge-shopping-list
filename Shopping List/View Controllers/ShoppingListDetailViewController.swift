//
//  ShoppingListDetailViewController.swift
//  Shopping List
//
//  Created by Alex Ladines on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListDetailViewController: UIViewController {

    // MARK: - Properties
    var shoppinglistController: ShoppingListController?
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var numberOfItemsDescriptionLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    // MARK: - IBActions
    @IBAction func sendOrderButtonPressed(_ sender: Any) {
        guard let name = self.nameTextField.text, !name.isEmpty,
        let address = self.addressTextField.text, !address.isEmpty,
            let shoppingList = self.shoppinglistController?.addedShoppingListItems else { return }
        
        let alert = UIAlertController(title: "Hello", message: "Hello \(name), your \(shoppingList.count) item(s) are being sent to: \(address)", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    // MARK: - ShoppingListDetailViewController
    func updateViews() {
        guard let list = self.shoppinglistController?.addedShoppingListItems else { return }
        
        self.numberOfItemsDescriptionLabel.text = "You currently have \(list.count) item(s) in your shopping cart."
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.updateViews()
    }
    

}
