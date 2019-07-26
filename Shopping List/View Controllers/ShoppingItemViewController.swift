//
//  ShoppingItemViewController.swift
//  Shopping List
//
//  Created by Taylor Lyles on 7/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemViewController: UIViewController {
	
	var shoppingItemController: ShoppingItemController?

	@IBOutlet weak var numberOfItemsAdded: UILabel!
	@IBOutlet weak var usersName: UITextField!
	@IBOutlet weak var usersAddress: UITextField!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
	}
	
	@IBAction func sendOrder(_ sender: UIButton) {
		guard let name = usersName.text, !name.isEmpty,
		let address = usersAddress.text, !address.isEmpty
		else { return }
		alert(userName: name, userAddress: address)
	}
	
	func updateLabel() {
		guard let number = shoppingItemController?.wasAdded.count, isViewLoaded else { return }
		var text = ""
		switch number {
		case 0:
			text = "You currently have \(number) items in your shopping cart"
		case 1:
			text = "You currently have \(number) item in your shopping cart"
		case 2...10:
			text = "You currently have \(number) items in your shopping cart"
		default:
			text = "Error, cannot determine how many things you have in your shopping cart."
		}
		numberOfItemsAdded.text = text
	}
	
	
	func alert(userName: String, userAddress: String){
		let alert = UIAlertController(title: "Alert message", message: "\(userName), your order will be delivered in 15 minutes to your address \(userAddress)", preferredStyle: .alert)
		
		alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
			self.navigationController?.popToRootViewController(animated: true) }))
		
		present(alert, animated: true, completion: nil)
	}
	
	
}
