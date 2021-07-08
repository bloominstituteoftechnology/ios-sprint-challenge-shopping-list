//
//  OrderViewController.swift
//  Shopping List
//
//  Created by Seschwan on 5/17/19.
//  Copyright © 2019 Seschwan. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {
    
    var shoppingItemController: ShoppingItemController?
    var addedItemsTotalCount: Int?
    
    @IBOutlet weak var shoppingListLbl: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var sendOrderBtn: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        sendOrderBtn.layer.cornerRadius = sendOrderBtn.frame.height / 3
        updateShoppingListLbl(addedItemsTotalCount: addedItemsTotalCount)
        

        // Do any additional setup after loading the view.
    }
    
    func updateShoppingListLbl(addedItemsTotalCount: Int?) {
        guard let itemCount = addedItemsTotalCount else { return }
        var text = ""
        switch itemCount {
        case 0:
            text = "You currently have: \(itemCount) items\n in your shopping list"
        case 1:
            text = "You currently have: \(itemCount) item\n in your shopping list"
        case 2...7:
            text = "You currently have: \(itemCount) items\n in your shopping list"
        default:
            text = "Something is wrong with your/n shopping list"
        }
        shoppingListLbl.text = text
    }
    
    @IBAction func sendOrderBtnPressed(_ sender: UIButton) {
        guard let name = nameTextField.text, !name.isEmpty,
            let address = addressTextField.text, !address.isEmpty else { return }
        
        if addedItemsTotalCount == 0 {
            noItemsInListAlert()
        } else {
            orderAlert()
            clearTextFields()
        }
        
    }
    
    func clearTextFields() {
        nameTextField.text    = nil
        addressTextField.text = nil
    }
    
    func orderAlert() {
        guard let name = nameTextField.text,
        let address = addressTextField.text
        else { return }
        
        let alert = UIAlertController(title: "Thanks for your order \(name)!", message: "Your order will be delivered in 15 minutes to \(address)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true)
    }
    
    func noItemsInListAlert() {
        let alert = UIAlertController(title: "Your list is empty!", message: "Please select some items to add to your list", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Select Items", style: .default, handler: { action in self.navigationController?.popToRootViewController(animated: true)}))
        present(alert, animated: true)
    }
    
    
}
