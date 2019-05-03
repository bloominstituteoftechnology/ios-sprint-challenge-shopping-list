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
    }
    
    private func updateViews() {
        guard let shoppingItemController = shoppingItemController else { return }
        //let numberOfItems = shoppingItemController.shoppingItems.count
        let numberOfItems = shoppingItemController.shoppingItems.filter({$0.isAddedToList})
        placeOrderLabel.text = "You currently have \(numberOfItems.count) item(s) in your shopping list."
    }

}

