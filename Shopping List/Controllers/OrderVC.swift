//
//  OrderVC.swift
//  Shopping List
//
//  Created by Spencer Curtis on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class OrderVC: UIViewController {

	@IBOutlet weak var itemCountLbl: UILabel!
	@IBOutlet weak var nameTextField: UITextField!
	@IBOutlet weak var addressTextField: UITextField!
	
	var shoppingListController: ShoppingListController?
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		configTextFields()
		updateViews()
    }

	@IBAction func sendBtnAction(_ sender: Any) {
		guard let name = nameTextField.optionalText, let address = addressTextField.optionalText else { return }
		createAlert(name: name, address: address)
	}
	
	private func updateViews() {
		let count = shoppingListController?.list.filter({$0.isInCart == true}).count ?? 0
		
		itemCountLbl.text = "You currently have \(count) item(s) in your shopping list"
		nameTextField.becomeFirstResponder()
	}
	
	private func createAlert(name: String, address: String) {
		let alert = UIAlertController(title: "Order Placed", message: "\(name), your order is being sent to \(address)", preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { (alert) in
			self.navigationController?.popViewController(animated: true)
		}))
		alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
		
		present(alert, animated: true)
	}
	
}

extension UITextField {
	var optionalText: String? {
		let trimmedText = self.text?.trimmingCharacters(in: .whitespacesAndNewlines)
		return (trimmedText ?? "").isEmpty ? nil : trimmedText
	}
}

extension OrderVC: UITextFieldDelegate {
	
	private func configTextFields() {
		nameTextField.delegate = self
		addressTextField.delegate = self
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		let nextTag = textField.tag + 1
		
		if let nextResponder = textField.superview?.viewWithTag(nextTag) {
			nextResponder.becomeFirstResponder()
		} else {
			textField.resignFirstResponder()
		}
		
		return true
	}
}
