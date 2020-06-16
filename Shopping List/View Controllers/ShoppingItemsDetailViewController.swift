//
//  ShoppingItemsDetailViewController.swift
//  Shopping List
//
//  Created by John McCants on 6/12/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemsDetailViewController: UIViewController {
    
    //MARK: -Variables
    
    var shoppingController: ShoppingController?

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var itemsLabel: UILabel! {
        didSet {
            guard let shoppingController = shoppingController else {return}
            itemsLabel.text = "You have \(shoppingController.calculateTotalAddedItems()) items in your order."
               }
    }
    @IBOutlet weak var sendOrderButton: UIButton! {
        didSet {
            guard let shoppingController = shoppingController else {return}
            if shoppingController.calculateTotalAddedItems() == 0 { sendOrderButton.isEnabled = false
        }
    }
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func sendButtonTapped(_ sender: Any) {
        showAlert()
    }
    
    //MARK: - UIAlertController Function
    
    func showAlert() {
        
        guard let name = nameTextField.text, !name.isEmpty, let address = addressTextField.text, !address.isEmpty else {
            
            let alert = UIAlertController(title: "Please fill out info", message: "Make sure to fill in both your name and your address", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
            
            return}
         
        let alert = UIAlertController(title: "\(name)'s order Received", message: "Order will be shipped to \(address) in 15 minutes", preferredStyle: .alert)
           let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
           alert.addAction(okAction)
           present(alert, animated: true, completion: nil)
        
       }
    
}
