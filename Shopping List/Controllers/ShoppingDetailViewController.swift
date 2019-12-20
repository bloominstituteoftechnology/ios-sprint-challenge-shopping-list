//
//  ShoppingDetailViewController.swift
//  Shopping List
//
//  Created by Tobi Kuyoro on 20/12/2019.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingDetailViewController: UIViewController {

    @IBOutlet weak var shoppingListLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    var shoppingItem: ShoppingItem?
    var shoppingList: ShoppingItemController?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendOrderTapped(_ sender: Any) {
    }
    

}
