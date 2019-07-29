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
	@IBOutlet weak var itemsButton: UIButton!
	@IBOutlet weak var itemsTextView: UITextView!


	override func viewDidLoad() {
        super.viewDidLoad()
		orderSummaryLabel.text = summaryStatement(count)
		nameTextField.becomeFirstResponder()
		nameTextField.delegate = self
		addressTextField.delegate = self
		submitOrderButton.layer.borderWidth = 2
		submitOrderButton.layer.borderColor = #colorLiteral(red: 0.166592625, green: 0.2496965038, blue: 0.3515625, alpha: 1)
		submitOrderButton.tintColor = #colorLiteral(red: 0.166592625, green: 0.2496965038, blue: 0.3515625, alpha: 1)
		submitOrderButton.layer.cornerRadius = 8
		itemsButton.tintColor = #colorLiteral(red: 0.166592625, green: 0.2496965038, blue: 0.3515625, alpha: 1)
		itemsTextView.isHidden = true
		itemsTextView.text = showListedItems()
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

	func showListedItems() -> String {
		var listedItems = ""
		guard let items = shoppingController?.shoppingItems else { return ""}
		for item in items {
			if item.isAdded {
				listedItems.append("⦿ \(item.name)\n")
			}
		}
		return listedItems
	}
    
	@IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
		nameTextField.resignFirstResponder()
		addressTextField.resignFirstResponder()
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

	
	@IBAction func showItemsTapped(_ sender: UIButton) {
		if itemsTextView.isHidden == true {
			animateView(view: itemsTextView, toHidden: false)
			itemsButton.setTitle("Hide Items", for: .normal)
		} else {
			animateView(view: itemsTextView, toHidden: true)
			itemsButton.setTitle("Show Items", for: .normal)
		}
	}


	private func animateView(view: UIView, toHidden isHidden: Bool) {
		UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 10.0, options:[], animations: {
			view.isHidden = isHidden
		}, completion: nil)
	}
}

extension OrderDetailViewController: UITextFieldDelegate {
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		if let text = textField.text,
			!text.isEmpty {
			switch textField {
			case nameTextField:
				addressTextField.becomeFirstResponder()
			default:
				textField.resignFirstResponder()
			}
		}
		return false
	}
}
