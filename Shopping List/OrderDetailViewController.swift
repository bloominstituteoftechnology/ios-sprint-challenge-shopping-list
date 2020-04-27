//
//  OrderDetailViewController.swift
//  Shopping List
//
//  Created by brian vilchez on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class OrderDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    var groceryController: GroceryController?
    @IBOutlet weak var checkoutLabel:UILabel!
    @IBOutlet weak var nameTextField:UITextField!
    @IBOutlet weak var addressTextField:UITextField!

   @IBAction func sendOrderButton(_ sender:UIButton) {
    guard let name = nameTextField.text, let address = addressTextField.text, !name.isEmpty,!address.isEmpty, let groceryController = groceryController else {return}
    present(groceryController.scheduleDelivery(for: name, to: address), animated: true, completion: nil)
    }
    
    private func updateViews() {
        guard let groceryController = groceryController else {return }
        checkoutLabel.text = "there are \(groceryController.checkoutCart.count) items in your cart"
    }

}
