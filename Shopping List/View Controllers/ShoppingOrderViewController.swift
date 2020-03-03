//
//  ShoppingOrderViewController.swift
//  Shopping List
//
//  Created by Bhawnish Kumar on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ShoppingOrderViewController: UIViewController {

    @IBOutlet weak var orderSummaryLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!

    var itemInCount: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }

    private func updateViews() {
        guard let itemInCount = itemInCount else { return }
        orderSummaryLabel.text = "You currently have \(itemInCount) item(s) in your shopping list."
    }

    @IBAction func sendOrderButtonPressed(_ sender: UIButton) {
        let alert = UIAlertController(title: "Delivery for \(nameTextField.text!)!", message: "Your delivery will be delivered to the address \(addressTextField.text!) in just 15 minutes! ", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)

        self.present(alert, animated: true, completion: nil)
    }
}

