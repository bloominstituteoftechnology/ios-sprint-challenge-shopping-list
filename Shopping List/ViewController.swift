//
//  ViewController.swift
//  Shopping List
//
//  Created by Spencer Curtis on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //check for data
    var shoppingItemController: ShoppingItemController?
    
    //properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //update button corners
        sendButton.layer.masksToBounds = true
        sendButton.layer.cornerRadius = 15
        updateViews()
    }
    
    //shows pop up for button presed
    @IBAction func sendButtonPressed(_ sender: Any) {
        
        //unwrapping data
        guard let shoppingItemController = shoppingItemController else {return}
        //checking cart items
        let numberOfItems = shoppingItemController.shoppingItems.filter({$0.isAddedToList}).count
        
        //error handling
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
    
    //updates title
    private func updateViews() {
        guard let shoppingItemController = shoppingItemController else { return }
        let numberOfItems = shoppingItemController.shoppingItems.filter({$0.isAddedToList})
        self.navigationItem.title = "\(numberOfItems.count) item(s) in cart"
    }

}

