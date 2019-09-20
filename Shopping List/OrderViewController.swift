//
//  OrderViewController.swift
//  Shopping List
//
//  Created by Isaac Lyons on 9/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {

    @IBOutlet weak var shoppingListCountLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    var count: Int?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateViews()
    }
    
    private func updateViews() {
        guard let count = count else { return }
        let shoppingListCountText = "You currently have \(count) item\(count == 1 ? "" : "s") in your shopping list."
        shoppingListCountLabel.text = shoppingListCountText
    }
    
    @IBAction func sendOrderTapped(_ sender: UIButton) {
        showAlert()
    }
    
    private func showAlert() {
        guard let name = nameTextField.text,
            let address = addressTextField.text else { return }
        
        let alert = UIAlertController(title: "Order for \(name) Successful", message: "Your order will be delivered to \(address) in 15 minutes.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}
