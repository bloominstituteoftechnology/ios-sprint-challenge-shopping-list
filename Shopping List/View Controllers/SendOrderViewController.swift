//
//  SendOrderViewController.swift
//  Shopping List
//
//  Created by Alex Shillingford on 7/25/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class SendOrderViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var itemNumberLabel: UILabel!
    @IBOutlet weak var addressTextField: UITextField!
    
    var addedItems: [ShoppingItem]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let addedItems = addedItems else { return }
        
        if addedItems.count > 1 || addedItems.count < 1 {
            itemNumberLabel?.text = "There are \(addedItems.count) items in your shopping list."
        } else {
            itemNumberLabel?.text = "There is \(addedItems.count) item in your shopping list."
        }
    }
    
    @IBAction func sendOrderButtonTapped(_ sender: UIButton) {
        showAlert()
    }
    
    func showAlert() {
        if let name = nameTextField.text,
            let address = addressTextField.text {
            if !name.isEmpty && !address.isEmpty {
                let alert = UIAlertController(title: "Delivery for \(name)!", message: "Your shopping items will be delivered to \(address) in 15 minutes!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
            }
        }
    }
}
