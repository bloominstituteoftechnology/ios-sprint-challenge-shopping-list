//
//  CartViewController.swift
//  Shopping List
//
//  Created by Rick Wolter on 10/19/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {

    
    
     var shoppingItemController: ShoppingItemController?
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var itemsLabel: UILabel!
    
    
    @IBAction func order(_ sender: Any) {
        // create notification
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateCart()
    }
    
    private func updateCart() {
        var itemNumber = 0
        guard let shoppingItemController = shoppingItemController else {return}
        for item in shoppingItemController.shoppingItems{
            if item.isInList {
                itemNumber += 1
            }
        }
        itemsLabel.text = "You have \(itemNumber) item(s) in your shopping cart."
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
