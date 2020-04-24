//
//  NewOrderViewController.swift
//  Shopping List
//
//  Created by Sherene Fearon on 4/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class NewOrderViewController: UIViewController {

    var foodController: FoodController?
    
    @IBOutlet weak var itemCountLabel: UILabel!
    
    
    @IBOutlet weak var nameTextfield: UITextField!
    
    @IBOutlet weak var addressTextfield: UITextField!
    
    
    
    
    
    @IBAction func sendOrder(_ sender: Any) {
        showAlert()
        dismiss(animated: true, completion: nil)
        
    }
    
    func showAlert() {
        
        
        let alert = UIAlertController(title: "Delivery for \(String(describing:  nameTextfield.text))",
            message: "Your items will be shipped to \(String(describing: addressTextfield.text))",
                                      preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK",
                                     style: .cancel,
                                     handler: nil)
        
        alert.addAction(okAction)
        
        
        present(alert, animated: true, completion: nil)
        
    }
}
