//
//  ShoppingListDetailViewController.swift
//  Shopping List
//
//  Created by macbook on 9/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListDetailViewController: UIViewController {
    
    var numberOfAddedItems: Int = 8
    
    var shoppingItemsController: ShoppingItemsController?
    
    // MARK : - IBOutlets
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    
    // VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = "You currently have \(shoppingItemsController!.shoppingList.filter({$0.isAdded}).count) Item(s) in your shopping list."
        
      
    }
    
    
    // MARK: - IBAction Submit Button
    @IBAction func submitOrderButton(_ sender: UIButton) {
        guard let name = nameTextField.text,
            let address = addressTextField.text else { return }
        
        
        
        let alert = UIAlertController(title: "Delivery for \(name)", message: "Your order will be sent to \(address) in 15 mins!", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    

}
