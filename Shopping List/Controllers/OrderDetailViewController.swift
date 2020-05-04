//
//  OrderDetailViewController.swift
//  Shopping List
//
//  Created by Ian French on 5/3/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class OrderDetailViewController: UIViewController {

  
    @IBOutlet weak var quantityLabel: UILabel!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    
    @IBOutlet weak var addressTextField: UITextField!
    
    
    
    @IBAction func sendOrderClicked(_ sender: Any) {
        if let name = nameTextField.text, !name.isEmpty,
           
           let address = addressTextField.text, !address.isEmpty {
             
            let alert = UIAlertController(title: "Order for \(name)", message: " The order shipping to \(address) will be delivered in 15 minutes.", preferredStyle: .alert)
             alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
             present(alert, animated: true, completion: nil)
             
            }
    }
    
    
    
    
    

        
        var shopController: ShoppingController?
        var cartItems = 0
        
        
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            guard let shopController = shopController else
            { return }
            
            
            cartItems = shopController.foods.count
            quantityLabel.text = "You currently have \(cartItems) item(s) in your shopping list"
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

//}
