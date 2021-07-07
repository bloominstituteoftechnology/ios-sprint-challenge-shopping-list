//
//  SubmitOrderViewController.swift
//  Shopping List
//
//  Created by Thomas Cacciatore on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class SubmitOrderViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateOrderLabel()
        // Do any additional setup after loading the view.
    }
   
    func updateOrderLabel() {
        for shoppingItem in shoppingItemController.shoppingList {
        var itemsInCart = 0
        if shoppingItem.addedToList == true {
        itemsInCart += 1
    } else {
    continue
    }
    submitOrderLabel.text = "You have \(itemsInCart) in your cart."
        }
        
    }
    
    @IBAction func submitOrderButtonTapped(_ sender: Any) {
//        guard let username = nameTextField.text, let address = addressTextField.text else { return }
//        let alert = UIAlertController(title: "(\(username)", message: <#T##String?#>, preferredStyle: <#T##UIAlertController.Style#>)
//        self.present(alert, aniumated: true)
    }
    
    
    
    
    @IBOutlet weak var submitOrderLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var addressTextField: UITextField!
    
    var shoppingItemController = ShoppingItemController()
    
}
