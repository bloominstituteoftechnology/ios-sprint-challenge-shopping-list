//
//  OrderDetailViewController.swift
//  Shopping List
//
//  Created by Alex Shillingford on 6/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class OrderDetailViewController: UIViewController {
    
    @IBOutlet weak var itemsAddedLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func submitOrderButtonTapped(_ sender: Any) {
        showAlert()
    }
    
    func showAlert() {
        if let name = nameTextField.text,
            let address = addressTextField.text {
            
            let alert = UIAlertController(title: "Order Submitted!", message: "Hi \(name)! Your order will be delivered to \(address) in 15 minutes!", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
            
        }
        
    }
    
}
