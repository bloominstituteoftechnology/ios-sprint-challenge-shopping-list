//
//  CheckoutViewController.swift
//  Shopping List
//
//  Created by ronald huston jr on 4/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class CheckoutViewController: UIViewController {
    @IBOutlet weak var checkoutMsg: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    var itemsCount: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let itemCount = itemsCount else { return }
        checkoutMsg.text = "you currently have \(itemCount) items in your shopping list."
    }

    @IBAction func sendOrder(_ sender: Any) {
        
        let alert = UIAlertController(title: "special delivery for \(nameTextField.text ?? "sorry - not found")" , message: "your shopping list will be delivered to \(addressTextField.text ?? "no such number") in 15 minutes.", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
}
