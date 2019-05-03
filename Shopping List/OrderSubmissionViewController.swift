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
	}
	
	
	
}
