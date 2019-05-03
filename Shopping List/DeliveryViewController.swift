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

        cartNumberLabel.text = "You have \(shoppingItemController.selectedItems.count) of items in your shopping list."
    }
    
   
    
    @IBAction func sendOrderButtonPressed(_ sender: Any) {
        
        //dismiss and create Alert
    }
    
}

