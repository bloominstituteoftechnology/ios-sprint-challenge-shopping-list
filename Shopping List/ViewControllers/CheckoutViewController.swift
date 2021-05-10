//
//  CheckoutViewController.swift
//  Shopping List
//
//  Created by Kobe McKee on 5/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class CheckoutViewController: UIViewController {

    var shoppingItemController: ShoppingItemController?
    
    @IBOutlet weak var checkoutLabel: UILabel!
    @IBOutlet weak var customerNameTextField: UITextField!
    @IBOutlet weak var customerAddressTextField: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let items = shoppingItemController?.shoppingCart else { return }
        checkoutLabel.text = "You currently have \(items) in your cart."
    }

    
    
    
    @IBAction func submitOrderButtonPressed(_ sender: UIButton) {
        
        guard let customerName = customerNameTextField.text,
            let customerAddress = customerAddressTextField.text
            else { return }
        
        showAlert(customerName: customerName, customerAddress: customerAddress)
    }
    
    
    
    
    func showAlert(customerName: String, customerAddress: String) {
        
        let alert = UIAlertController(title: "Delivery", message: "Your items will be delivered to \(customerName) at \(customerAddress) in 15 minutes.", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
       
}
