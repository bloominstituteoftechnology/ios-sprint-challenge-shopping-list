//
//  PlaceYourOrderViewController.swift
//  Shopping List
//
//  Created by Joel Groomer on 8/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class PlaceYourOrderViewController: UIViewController {

    @IBOutlet weak var lblYouHaveItems: UILabel!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtAddr1: UITextField!
    @IBOutlet weak var txtAddr2: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtState: UITextField!
    @IBOutlet weak var txtZip: UITextField!
    @IBOutlet weak var btnSendOrder: UIButton!
    @IBOutlet weak var txtvListOfItems: UITextView!
    
    var items: [ShoppingItem]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let items = items else { return }
        
        lblYouHaveItems.text = "You have \(items.count) item\(items.count != 1 ? "s" : "") in your shopping list."
        var orderedItems = ""
        if items.count > 0 {
            for item in items {
                orderedItems += item.name + "\n"
            }
        } else {
            orderedItems = "You haven't added any items to your list! Go back and add some now."
        }
        txtvListOfItems.text = orderedItems
        
        txtName.delegate = self
        txtAddr1.delegate = self
        txtAddr2.delegate = self
        txtCity.delegate = self
        txtState.delegate = self
        txtZip.delegate = self
        
        txtName.text = UserDefaults.standard.string(forKey: "shoppingName")
        txtAddr1.text = UserDefaults.standard.string(forKey: "shoppingAddr1")
        txtAddr2.text = UserDefaults.standard.string(forKey: "shoppingAddr2")
        txtCity.text = UserDefaults.standard.string(forKey: "shoppingCity")
        txtState.text = UserDefaults.standard.string(forKey: "shoppingState")
        txtZip.text = UserDefaults.standard.string(forKey: "shoppingZip")
    }

    @IBAction func sendOrderTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Your order has been placed", message: "Thanks for your order, \(txtName.text ?? "")! You can expect delivery in just 15 minutes to \(txtAddr1.text ?? "").", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
}

extension PlaceYourOrderViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if !txtName.text!.isEmpty &&
            !txtAddr1.text!.isEmpty &&
            // Addr 2 isn't required
            !txtCity.text!.isEmpty &&
            !txtState.text!.isEmpty &&
            !txtZip.text!.isEmpty
        {
            UserDefaults.standard.set(txtName.text, forKey: "shoppingName")
            UserDefaults.standard.set(txtAddr1.text, forKey: "shoppingAddr1")
            UserDefaults.standard.set(txtAddr2.text, forKey: "shoppingAddr2")
            UserDefaults.standard.set(txtCity.text, forKey: "shoppingCity")
            UserDefaults.standard.set(txtState.text, forKey: "shoppingState")
            UserDefaults.standard.set(txtZip.text, forKey: "shoppingZip")
            
            if let items = items, items.count > 0 {
                btnSendOrder.isEnabled = true
            }
        } else {
            btnSendOrder.isEnabled = false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text, !text.isEmpty {
            switch textField {
            case txtName:
                txtAddr1.becomeFirstResponder()
            case txtAddr1:
                txtAddr2.becomeFirstResponder()
            case txtAddr2:
                txtCity.becomeFirstResponder()
            case txtCity:
                txtState.becomeFirstResponder()
            case txtState:
                txtZip.becomeFirstResponder()
            default:
                textField.resignFirstResponder()
            }
        }
        return false
    }
}
