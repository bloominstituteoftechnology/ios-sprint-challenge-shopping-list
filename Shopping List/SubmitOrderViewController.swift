//
//  SubmitOrderViewController.swift
//  Shopping List
//
//  Created by Thomas Cacciatore on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class SubmitOrderViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        submitOrderLabel.text = "You have X number of items in the cart."
        // Do any additional setup after loading the view.
    }
   
    
    @IBAction func submitOrderButtonTapped(_ sender: Any) {
//        guard let username = nameTextField.text, let address = addressTextField.text else { return }
//        let alert = UIAlertController(title: "(\(username)", message: <#T##String?#>, preferredStyle: <#T##UIAlertController.Style#>)
//        self.present(alert, aniumated: true)
    }
    
    
    
    
    @IBOutlet weak var submitOrderLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var addressTextField: UITextField!
    
    var shoppingItemController = ShoppingItemController()
    
}
