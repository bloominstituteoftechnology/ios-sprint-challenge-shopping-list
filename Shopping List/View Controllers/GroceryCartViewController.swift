//
//  GroceryCartViewController.swift
//  Shopping List
//
//  Created by Dillon P on 8/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class GroceryCartViewController: UIViewController {

    @IBOutlet weak var numberOfItemsLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    var groceryController = GroceryController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    

    @IBAction func sendOrderTapped(_ sender: Any) {
    }
    
    private func updateViews() {
        let numberOfItems = groceryController.itemsInCart.count
        numberOfItemsLabel.text = "You currently have \(numberOfItems) item(s) in your cart."
    }

}
