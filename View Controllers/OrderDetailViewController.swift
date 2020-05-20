//
//  OrderDetailViewController.swift
//  Shopping List
//
//  Created by Percy Ngan on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class OrderDetailViewController: UIViewController {

	let shoppingCell = ShoppingItemCollectionViewCell()
	var numberOfItemsSelected = 0


	@IBOutlet weak var orderSummaryLabel: UILabel!
	@IBOutlet weak var nameTextField: UITextField!
	@IBOutlet weak var addressTextField: UITextField!



	override func viewDidLoad() {
        super.viewDidLoad()
		orderSummaryLabel.text = "You have \(numberOfItemsSelected) items in your order"
	}
    

	@IBAction func orderButtonTapped(_ sender: UIButton) {
		showAlert()
		nameTextField.text = nil
		addressTextField.text = nil
	}


	
	// MARK: - METHODS

	func showAlert() {
		guard let name = nameTextField.text else { return }
		guard let address = addressTextField.text else { return }
		let alert = UIAlertController(title: "Delivery for \(name)!", message: "Your shopping items will be delivered to \(address) in 15 minutes!", preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
		present(alert, animated: true, completion: nil)
	}


	// MARK: - Navigation


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
}
