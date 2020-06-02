//
//  SendOrderViewController.swift
//  Shopping List
//
//  Created by Dennis Rudolph on 10/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class SendOrderViewController: UIViewController {
    
    var addedItems: [ShoppingItem]?
    var addedCount = 0
    
    @IBOutlet weak var itemCountLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let addedCount = addedItems?.count {
            itemCountLabel.text = "You currently have \(addedCount) item(s) in your shopping list."
        }
    }
    
    @IBAction func sendOrderTapped(sender: UIButton) {
        guard let realName = nameTextField.text,
            !realName.isEmpty,
            let realAddress = addressTextField.text,
            !realAddress.isEmpty else { return }
        showAlert(userName: realName, userAdress: realAddress)
    }
    
    private func showAlert(userName: String, userAdress: String) {
        let alert = UIAlertController(title: "Thank You", message: "\(userName) your order will be delivered to \(userAdress) in 15 minutes", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
