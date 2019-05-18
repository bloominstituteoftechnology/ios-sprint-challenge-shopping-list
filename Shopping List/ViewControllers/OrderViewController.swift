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
    
    @IBOutlet weak var shoppingListLbl: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var sendOrderBtn: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        sendOrderBtn.layer.cornerRadius = sendOrderBtn.frame.height / 3
        

        // Do any additional setup after loading the view.
    }
    
    func updateShoppingListLbl() {
        guard let itemCount = shoppingItemController?.addedItems.count, isViewLoaded else { return }
        var text = ""
        switch itemCount {
        case 0:
            text = "You currently have: \(itemCount) items/n in your shopping list"
        case 1:
            text = "You currently have: \(itemCount) item/n in your shopping list"
        case 2...7:
            text = "You currently have: \(itemCount) items/n in your shopping list"
        default:
            text = "Something is wrong with your/n shopping list"
        }
        shoppingListLbl.text = text
    }
    
    @IBAction func sendOrderBtnPressed(_ sender: UIButton) {
        orderAlert()
        clearTextFields()
    }
    
    func clearTextFields() {
        nameTextField.text    = nil
        addressTextField.text = nil
    }
    
    func orderAlert() {
        guard let name = nameTextField.text,
        let address = addressTextField.text
        else { return }
        
        let alert = UIAlertController(title: name, message: address, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true)
    }
    
}
