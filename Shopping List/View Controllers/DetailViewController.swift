//
//  DetailViewController.swift
//  Shopping List
//
//  Created by Matthew Martindale on 2/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var cartInfoLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    let shoppingListController = ShoppingListController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cartInfoLabel.text = "You have \(shoppingListController.getAddedItems().count) item/s in your cart"
    }
    
    
    
    @IBAction func sendOrderButtonPressed(_ sender: Any) {
        if let name = nameTextField.text,
            let address = addressTextField.text,
            !name.isEmpty,
            !address.isEmpty,
        shoppingListController.getAddedItems().count != 0{
        let alert = UIAlertController(title: "Order Received", message: "Thank you \(name)! Your order will be delivered to \(address) in 15 mins.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
        
        navigationController?.popViewController(animated: true)
        } else if shoppingListController.getAddedItems().count != 0 {
            let alert = UIAlertController(title: "Missing Information", message: "Please provide your name and address", preferredStyle: .actionSheet)
            let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "No items in cart", message: "Go back to shopping..", preferredStyle: .actionSheet)
            let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: {(alert: UIAlertAction!) in
                self.navigationController?.popViewController(animated: true)
            })
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
        
    }
    

}
