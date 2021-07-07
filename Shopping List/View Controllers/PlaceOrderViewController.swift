//
//  PlaceOrderViewController.swift
//  Shopping List
//
//  Created by Angelique Abacajan on 11/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class PlaceOrderViewController: UIViewController {
    
    @IBOutlet weak var itemsLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    var itemCount: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    @IBAction func orderSent(_ sender: Any) {
        guard let name = nameTextField.text, let address = addressTextField.text, !name.isEmpty, !address.isEmpty else { return }
        sendAlert(to: name, at: address)
        
    }
    
    private func updateViews() {
        guard let itemCount = itemCount else { return }
        
        itemsLabel.text = "You have \(itemCount) item(s) in your shopping list."
    }
    
    private func sendAlert(to name: String, at address: String) {
        let title = "Delivery for \(name)!"
        let message = "Your items will be delivered to \(address) in 15 minutes."
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        
        let action = UIAlertAction(title: "Ok", style: .default) { alert in self.navigationController?.popToRootViewController(animated: true)}
        alert.addAction(action)
        
        present(alert, animated: true)
    }
}
