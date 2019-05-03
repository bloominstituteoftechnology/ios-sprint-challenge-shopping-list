//
//  OrderDetailViewController.swift
//  Shopping List
//
//  Created by Hector Steven on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class OrderDetailViewController: UIViewController {

	override func viewDidLoad() {
        super.viewDidLoad()
		guard let itemsInCartCount = itemsInCartCount else { return }
		countLabel.text = "You Curently have \(itemsInCartCount) item(s) in your shopping list."
		
	}
	
	
	@IBAction func ordeButtonPressed(_ sender: Any) {
		guard let itemsInCartCount = itemsInCartCount else { return }
		guard let name = nameTextView.text,
		let adress = adressTextView.text else { return }
		
		let title = "\(itemsInCartCount) item(s) in cart for \(name)"
		let message = "to: \(adress)"
		let alerController = UIAlertController(title: title, message: message, preferredStyle: .alert)
		
		alerController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
		alerController.addAction(UIAlertAction(title: "canel", style: .destructive, handler: nil))
		present(alerController, animated: true)
	}
	
	@IBOutlet var adressTextView: UITextField!
	@IBOutlet var nameTextView: UITextField!
	@IBOutlet var countLabel: UILabel!
	var itemsInCartCount: Int?
}
