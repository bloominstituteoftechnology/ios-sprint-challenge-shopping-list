//
//  ShoppingListDetailViewController.swift
//  Shopping List
//
//  Created by Paul Yi on 9/14/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class ShoppingListDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func sendOrder(_ sender: Any) {
        
    }
    
    
   
    @IBOutlet weak var currentItemsLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    var shoppingItemController: ShoppingItemController?
    var localNotificationHelper: LocalNotificationHelper?
}

