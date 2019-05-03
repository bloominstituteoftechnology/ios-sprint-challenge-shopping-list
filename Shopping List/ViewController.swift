//
//  ViewController.swift
//  Shopping List
//
//  Created by Spencer Curtis on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var shoppingItemController: ShoppingItemController?
    
    @IBOutlet weak var placeOrderLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    
    @IBAction func sendButtonPressed(_ sender: Any) {
        //pop alert
        guard let shoppingItemController = shoppingItemController else {return}
        let numberOfItems = shoppingItemController.shoppingItems.filter({$0.isAddedToList}).count
        guard let name = nameTextField.text, name != "", let address = addressTextField.text, address != "", numberOfItems > 0 else {
            
            let alert = UIAlertController(title: "Order Invalid", message: "Please make sure you have name, address, and have at least one item. Thank You", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
    
            return
        }
        let alert = UIAlertController(title: "Delivery For \(name)!", message: "Your items will be delivered to \(address)", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
        
    }
    
    private func updateViews() {
        guard let shoppingItemController = shoppingItemController else { return }
        //let numberOfItems = shoppingItemController.shoppingItems.count
        let numberOfItems = shoppingItemController.shoppingItems.filter({$0.isAddedToList})
        placeOrderLabel.text = "You currently have \(numberOfItems.count) item(s) in your shopping list."
    }

}

