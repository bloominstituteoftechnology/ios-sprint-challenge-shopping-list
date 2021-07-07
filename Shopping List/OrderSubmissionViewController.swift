//
//  OrderSubmissionViewController.swift
//  Shopping List
//
//  Created by Michael Redig on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit


class OrderSubmissionViewController: UIViewController {
	
	var shoppingItemController: ShoppingItemController?
	
	@IBOutlet var orderInfoLabel: UILabel!
	@IBOutlet var nameTextField: UITextField!
	@IBOutlet var addressTextField: UITextField!
	@IBOutlet var submitOrderButton: UIButton!
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		updateViews()
	}
	
	func updateViews() {
		submitOrderButton.layer.cornerRadius = 10
		guard let controller = shoppingItemController else { return }
		orderInfoLabel.text = "You have \(controller.numberOfItemsOrdered) items in your shopping cart."
		
	}
	
	@IBAction func submitOrderButtonPressed(_ sender: UIButton) {
		guard let name = nameTextField.text, !name.isEmpty, let address = addressTextField.text, !address.isEmpty else { return }
		let ac = UIAlertController(title: "\(name), your order is on the way!", message: "Your order will be shipped out to\n\n\(address)\n\nand you are scheduled to get it yesterday. That's right. This app is time traveling. Now, if you've gotten your order yesterday and you neglect to create an order today for what you got, you will be creating a time paradox and destroy the universe. Don't be that guy. Make your order and keep the universe safe!", preferredStyle: .alert)
		ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
		ac.addAction(UIAlertAction(title: "DESTROY THE UNIVERSE", style: .destructive, handler: { (action) in
			fatalError("There was an error destroying the universe. Please try again.")
		}))
		present(ac, animated: true)
	}
	
	
	
}
