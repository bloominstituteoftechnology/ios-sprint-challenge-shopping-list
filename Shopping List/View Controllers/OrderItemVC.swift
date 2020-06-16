//
//  OrderItemVC.swift
//  Shopping List
//
//  Created by Norlan Tibanear on 6/12/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class OrderItemVC: UIViewController {
    
    // Outlets
    @IBOutlet var itemsLabel: UILabel!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var addressTextField: UITextField!
    
    // Variables
    var shoppingListController: ShoppingListController?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        updateView()
    }
    
    func updateView() {
        
        if let itemList = shoppingListController?.shoppingItems.filter({$0.hasBeenAdded}) {
            itemsLabel.text = "You have \(itemList.count) products in your list"
        } else {
            itemsLabel.text = "Your list is empty"
        }
    }
    
    
    
    @IBAction func sendOrderBtn_TouchUpInside(_ sender: UIButton) {
        showAlert()
    }
    
    
    func showAlert() {
        guard let name = nameTextField.text, !name.isEmpty else { return }
        guard let address = addressTextField.text, !address.isEmpty else { return }
        
        let alert = UIAlertController(title: "\(name) Order", message: "Your order will be delivered to your \(address) soon. Your delivery time is 15 minutes.", preferredStyle: .alert)
        
        let comfirmation = UIAlertAction(title: "Comfirm", style: .default, handler: nil)
        alert.addAction(comfirmation)
        
        self.present(alert, animated: true)
    }
    
    

} // END
