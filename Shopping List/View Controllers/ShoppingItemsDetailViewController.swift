//
//  ShoppingItemsDetailViewController.swift
//  Shopping List
//
//  Created by John McCants on 6/12/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemsDetailViewController: UIViewController {
    
    var shoppingItems: ShoppingModelController?

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var itemsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        setLabelText()
    }
    
    @IBAction func sendButtonTapped(_ sender: Any) {
        showAlert()
    }
    
    func setLabelText() {
        guard let shoppingItems = shoppingItems else {return}
        itemsLabel.text = "You currently have \(shoppingItems.addedItems.count) items in your cart"
    }
    
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
