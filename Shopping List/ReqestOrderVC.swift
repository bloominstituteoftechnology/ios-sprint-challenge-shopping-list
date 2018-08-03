import Foundation
import UIKit
import UserNotifications

class RequestOrderVC: UIViewController
{
	static let NameKey = "ShoppingListName"
	static let AddressKey = "ShoppingListAddress"

	var controller:CartController!

	@IBOutlet weak var cartStatusLabel: UILabel!
	@IBOutlet weak var nameField: UITextField!
	@IBOutlet weak var addressField: UITextField!

	override func viewWillAppear(_ animated: Bool)
	{
		controller.sortItems()
		cartStatusLabel.text = "You have \(controller.addedItems.count) items in your cart"
		let ud = UserDefaults.standard
		nameField.text = ud.string(forKey: RequestOrderVC.NameKey)
		addressField.text = ud.string(forKey: RequestOrderVC.AddressKey)
	}

	@IBAction func requestOrder(_ sender: Any)
	{
		guard let name = nameField.text, name != "",
			let address = addressField.text, address != ""
			else {
				return
		}

		let ud = UserDefaults.standard
		ud.set(name, forKey: RequestOrderVC.NameKey)
		ud.set(address, forKey: RequestOrderVC.AddressKey)

		let center = UNUserNotificationCenter.current()
		var granted = false
		center.requestAuthorization(options: [.badge, .alert], completionHandler: {(innerGranted, error) in granted = innerGranted })
		if granted {
			let content = UNMutableNotificationContent()
			content.title = "Your food will be shipped in 15 minutes!"
			content.body = "Shipping to \(name) at \(address)"
			let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 15, repeats: false)
			let uuid = UUID().uuidString
			let request = UNNotificationRequest(identifier: uuid, content: content, trigger: trigger)
			center.add(request, withCompletionHandler: {(error) in if let error = error {print("Notification error!", error)} })
		}
		
		navigationController?.popViewController(animated: true)
	}
}
