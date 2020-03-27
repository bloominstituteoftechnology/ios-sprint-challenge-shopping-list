//
//  SubmitOrderViewController.swift
//  Shopping List
//
//  Created by Nichole Davidson on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class SubmitOrderViewController: UIViewController {
    
    @IBOutlet weak var shoppingListMessage: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    var shoppingListController: ShoppingListController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
       
    }
    
    func updateViews() {
        
        let numberOfItemsAdded = shoppingListController.items.filter( { $0.itemAdded}).count
        shoppingListMessage.text = "You currently have \(numberOfItemsAdded) item(s) on your shopping list."
    }
    
    @IBAction func submitOrderTapped(_ sender: Any) {
        showAlert()
    }

    func showAlert() {
        
        let alert = UIAlertController(title: "Thanks for submitting your order, \(nameTextField.text ?? "")!", message: "Your shopping items will be delivered to \(addressTextField.text ?? "") in 15 minutes.", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Cool", style: .cancel, handler: nil)
        
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
        
    }
}
