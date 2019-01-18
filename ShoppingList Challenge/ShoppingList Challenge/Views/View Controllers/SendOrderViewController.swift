//
//  SendOrderViewController.swift
//  ShoppingList Challenge
//
//  Created by Michael Flowers on 1/18/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import UIKit

class SendOrderViewController: UIViewController {

    //pass in shoppingItems controller to get the .count on the array YOU NEED TO COUNT THE OBJECTS WITH "ADDED" USE FILTER FUNCTION
    var shoppingItemConroller: ShoppingItemController?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var itemsLabel: UILabel!
 
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let addedArray = shoppingItemConroller?.items.filter({$0.isAdded == true}) else { return }
        itemsLabel.text = "You have \(addedArray.count) item(s) on your shoppinglist"
    }
    
    @IBAction func sendOrder(_ sender: UIButton) {
        guard let name = nameTextField.text, !name.isEmpty, let address = addressTextField.text, !address.isEmpty else { return }
        print("\(name), your order will be ready to deliver to \(address) in fifteen minutes!")
        nameTextField.text = nil
        addressTextField.text = nil
        self.navigationController?.popToRootViewController(animated: true)
    }
}
