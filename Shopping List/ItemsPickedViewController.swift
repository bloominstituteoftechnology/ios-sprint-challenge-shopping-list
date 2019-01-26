//
//  ItemsPickedViewController.swift
//  Shopping List
//
//  Created by Diante Lewis-Jolley on 1/25/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ItemsPickedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func SendOrder(_ sender: Any) {
         navigationController?.popViewController(animated: true)
    }

    

    @IBOutlet var amountOfItemsLabel: UILabel!
    var shoppingListController: ShoppingItemController?
    @IBOutlet var addressTextField: UITextField!
    @IBOutlet var nameTextField: UITextField!
    
}
