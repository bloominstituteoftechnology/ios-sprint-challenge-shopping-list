//
//  ShoppingItemsDetailViewController.swift
//  Shopping List
//
//  Created by Marissa Gonzales on 4/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemsDetailViewController: UIViewController {
    
    // Out lets
    
    @IBOutlet weak var currentItemLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var sendOrderButton: UIButton!
    
    var shoppingItemCount: Int?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        
        if let _ = shoppingItemCount {
            
            updateViews()
        }
    }
    
    func updateViews() {
        
        if let count = shoppingItemCount {
            
            sendOrderButton.isEnabled =  true
            
            if count > 1 {
                
                currentItemLabel.text = "Order The \(count) Items From Your Shopping List"
                
            } else if count == 1 {
                
                currentItemLabel.text = "Order The \(count) Item From Your Shopping List"
                
            } else if count < 1 {
                
                currentItemLabel.text = "There's No Items In Your Shopping List"
                sendOrderButton.isEnabled = false
            }
        }
    }
    
    @IBAction func sendOrderTapped(_ sender: Any) {
        
        if let name = nameTextField.text, !name.isEmpty, let address = addressTextField.text, !address.isEmpty {
            
            let alert = UIAlertController(title: "Delivery for \(name) is getting whipped up!", message: "Your order will be delivered to \(address) in 30 minutes!", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(action)
            
            present(alert, animated: true)
        }
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
