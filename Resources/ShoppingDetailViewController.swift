//
//  ShoppingDetailViewController.swift
//  Shopping List
//
//  Created by Mark Poggi on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingDetailViewController: UIViewController {
    
    //MARK: - Properties
    
    var shoppingController: ShoppingController?
    var shoppingList: ShoppingList?
    var address: Address?
    
    @IBOutlet weak var shoppingLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    //MARK:- Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    //MARK: - Helper Methods
    
    
    private func updateView() {
        guard let myshoppingList = shoppingController?.shoppingList.self else {return}
        countBool()
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Order", message: "Thank you, \(nameTextField.text ?? "not found"). Your order will be delivered to \(addressTextField.text ?? "not found")", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        
        present(alert, animated: true)
    }
    
    private func countBool() {
        guard let item = shoppingController?.shoppingList.filter({return $0.itemAdded == true}) else {return}
        let myItems = item.count
        if myItems == 0 {
            shoppingLabel.text = "Please add an item to your cart."
        } else {
            if myItems == 1 {
                shoppingLabel.text = "You have \(myItems) item in your cart."
            } else {
                if myItems > 1 {
                    shoppingLabel.text = "You have \(myItems) items in your cart."
                }
            }
        }
    }
    
    
    @IBAction func saveButton(_ sender: Any) {
        guard let name = nameTextField.text, !name.isEmpty, let address = addressTextField.text, !address.isEmpty else {return}
        showAlert()
        
        //shoppingController?.storeAddress(name: name, address: address)
        
        navigationController?.popViewController(animated: true)
        
    }
}
