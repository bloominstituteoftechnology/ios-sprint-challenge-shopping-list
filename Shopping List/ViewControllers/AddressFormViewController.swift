//
//  AddressFormViewController.swift
//  Shopping List
//
//  Created by Carolyn Lea on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class AddressFormViewController: UIViewController
{
    @IBOutlet weak var promptAndItemCountLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    var shoppingItemController = ShoppingItemController()
    var shoppingItem: ShoppingItem?
    var itemCount: Int = 0
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(true)
        updateViews()
    }

    
    @IBAction func sendOrder(_ sender: Any)
    {
        
    }
    
    func updateViews()
    {
        promptAndItemCountLabel.text = "You currently have \(itemCount) item(s) in your shopping list."
    }
    
}
