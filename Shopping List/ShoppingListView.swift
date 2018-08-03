//
//  ShoppingListView.swift
//  Shopping List
//
//  Created by William Bundy on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

/*
The story so far...

UICollectionViewCell has a property called "isSelected",
which determines whether or not a cell should be considered selected.

As far as I can find, the ONLY WAY to know, from the cell's point
of view, if it has been clicked on is BY LISTENING TO THIS. The problem:
OTHER THINGS SET THIS PROPERTY--there's no guarantee these are real changes
based on real user input.
*/


import Foundation
import UIKit
import UserNotifications

protocol CartCellDelegate: class
{
	func updateItem(_ item:CartItem, _ new:Bool)
}

class CartItemCell:UICollectionViewCell
{
	@IBOutlet weak var imgView: UIImageView!
	@IBOutlet weak var nameLabel: UILabel!
	weak var delegate:CartCellDelegate!

	var modifyingInternally:Bool = false

	func updateViews()
	{
		imgView.image = item.img
		nameLabel.text = isSelected ? "\(item.name) ⭐️" : item.name
		backgroundColor = isSelected ? UIColor(red:0.8, green:0.9, blue:1, alpha:1) : UIColor(named: "White")

	}

	var item:CartItem! {
		didSet {
			isSelected = item.requested
			updateViews()
		}
	}

	override var isSelected: Bool {
		didSet {
			delegate.updateItem(item, isSelected)
			updateViews()
		}
	}
}

class CartListCVC: UICollectionViewController, CartCellDelegate
{
	var controller = CartController()

	func updateItem(_ item: CartItem, _ new:Bool)
	{
		guard let index = controller.items.index(of:item) else {return}
		controller.items[index] = item
		controller.items[index].requested = new
	}

	override func viewWillAppear(_ animated: Bool)
	{
		collectionView?.allowsMultipleSelection = true
		collectionView?.reloadData()
	}

	override func numberOfSections(in collectionView: UICollectionView) -> Int
	{
		return 1
	}
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
	{
		return controller.items.count
	}

	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath:IndexPath) -> UICollectionViewCell
	{
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CartItemCell", for: indexPath) as! CartItemCell
		cell.delegate = self
		cell.item = controller.items[indexPath.item]
		return cell
	}

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if let dest = segue.destination as? RequestOrderVC {
			dest.controller = controller
		}
	}

	override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool
	{
		return true
	}
	override func collectionView(_ collectionView: UICollectionView, shouldDeselectItemAt indexPath: IndexPath) -> Bool
	{
		print("Should Deselect?")
		collectionView.deselectItem(at: indexPath, animated: false)
		controller.items[indexPath.item].requested = false
		return false
	}

	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
	{
		print("Selected")
		controller.items[indexPath.item].requested = true
		collectionView.reloadSections([0])
	}
	override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath)
	{
		print("Deselected")
		controller.items[indexPath.item].requested = false
		collectionView.reloadSections([0])
	}

}

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
