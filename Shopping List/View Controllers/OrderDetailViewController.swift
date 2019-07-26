//
//  OrderDetailViewController.swift
//  Shopping List
//
//  Created by Marlon Raskin on 7/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class OrderDetailViewController: UIViewController {

	var shoppingController: ShoppingItemController?

	@IBOutlet weak var orderSummaryLabel: UILabel!
	@IBOutlet weak var nameTextField: UITextField!
	@IBOutlet weak var addressTextField: UITextField!
	@IBOutlet weak var submitOrderButton: UIButton!


	override func viewDidLoad() {
        super.viewDidLoad()
		orderSummaryLabel.text = summaryStatement(count)

    }

	func summaryStatement(_ count: Int) -> String {
		if count == 1 {
			return "You have \(count) item in your shopping list"
		} else {
			return "You have \(count) items in your shopping list"
		}
	}

	var count: Int {
		var count = 0
		if let shoppingController = shoppingController {
			for item in shoppingController.shoppingItems {
				if item.isAdded == true {
					count += 1
					}
				}
			}
		return count
	}
    
	@IBAction func submitOrderTapped(_ sender: UIButton) {
		guard let name = nameTextField.text,
			let address = addressTextField.text,
			!name.isEmpty,
			!address.isEmpty else { return }

		let alert = UIAlertController(title: "Thank you, \(name)!", message: "Your order will be delivered to \(address) in 15 minutes!", preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (dismiss) in
			self.navigationController?.popToRootViewController(animated: true)
		}))
		present(alert, animated: true, completion: nil)
	}
}

//extension OrderDetailViewController: UITextFieldDelegate {
//	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//		switch textField {
//		case <#pattern#>:
//			<#code#>
//		default:
//			<#code#>
//		}
//	}
//}
