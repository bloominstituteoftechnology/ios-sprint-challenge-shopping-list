//
//  OrderDetailViewController.swift
//  Shopping List
//
//  Created by Hector Steven on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit
import UserNotifications

class OrderDetailViewController: UIViewController, UNUserNotificationCenterDelegate {

	override func viewDidLoad() {
        super.viewDidLoad()
		guard let itemsInCartCount = itemsInCartCount else { return }
		countLabel.text = "You Curently have \(itemsInCartCount) item(s) in your shopping list."
	}
	
	@IBAction func ordeButtonPressed(_ sender: Any) {
		register()
		schedualLocal()
		nameTextView.text = nil
		adressTextView.text = nil
	}
	
	func zeroItemsAlert() {
		let title = "0 Items in cart"
		let message = "add Iterm To your Cart"
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

extension OrderDetailViewController {
	@objc func register() {
		let center = UNUserNotificationCenter.current()
		center.requestAuthorization(options: [.alert, .sound, .badge]) {
			(granted, error) in
			if granted {
				print("Granted")
			}else {
				print("error!")
			}
		}
	}

	func schedualLocal() {
		let center = UNUserNotificationCenter.current()
		center.removeAllPendingNotificationRequests()
		
		let contet = UNMutableNotificationContent()
		guard let name = nameTextView.text,
			let adress = adressTextView.text else { return }
		contet.title = "Order for \(name)"
		contet.body = "item(s) in cart for \(name),\(adress)"
		contet.categoryIdentifier = "alarm"
		contet.userInfo = ["customData": "itemsInCart2"]
		contet.sound = .default()
		
		let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
		let request = UNNotificationRequest(identifier: UUID().uuidString, content: contet, trigger: trigger)
		
		center.add(request)
	}
}


