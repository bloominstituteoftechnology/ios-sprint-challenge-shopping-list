//
//  DeliveryViewController.swift
//  Shopping List
//
//  Created by Ryan Murphy on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class DeliveryViewController: UIViewController {

    let shoppingItemController = ShoppingItemController()
    
    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var addressText: UITextField!
    @IBOutlet weak var cartNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        cartNumberLabel.text = "You have \(shoppingItemController.selectedItems.count) of items in your shopping list."
    }
    
    
    @IBAction func sendOrderButtonPressed(_ sender: Any) {
        let address = addressText.text
        let name = nameText.text
        //dismiss
        let alert = UIAlertController(title: "Order for \(name)", message: "Your items will be delivered to \(address) in 15 minutes.", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    }
    


