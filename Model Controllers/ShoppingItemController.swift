//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Percy Ngan on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {

	var items: [ShoppingItem] = []


	private var shoppingListURL: URL? {
		let fileManager = FileManager.default
		guard let directory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
		return directory.appendingPathComponent("shoppingList.plist")
	}


	init() {
		createItemList()
		loadFromPersistentStore()
		print(items)
		print(UserDefaults.standard.bool(forKey: "hasLaunch"))
	}


	func toggleHasBeenAdded(item: ShoppingItem) {
		item.hasBeenAdded = !item.hasBeenAdded
		saveToPersistentStore()
	}


	// Create the shopping list
	func createItemList() {
		let userDefault = UserDefaults.standard
		if !userDefault.bool(forKey: "hasLaunch") {
			let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
			for itemName in itemNames {
				let newItem = ShoppingItem(name: itemName, hasBeenAdded: false)
				print(newItem)
				items.append(newItem)
			}
			userDefault.set(true, forKey: "hasLaunch")
			saveToPersistentStore()
		}
	}


	func saveToPersistentStore() {

		let encoder = PropertyListEncoder()

		do {
			guard let url = shoppingListURL else { return }
			let data = try encoder.encode(items)
			try data.write(to: url)
		} catch {
			print("Error saving shopping items: \(error)")
		}
	}


	func loadFromPersistentStore() {
		
		do {
			guard let url = shoppingListURL else { return }
			let data = try Data(contentsOf: url)
			let decoder = PropertyListDecoder()
			self.items = try
				decoder.decode([ShoppingItem].self, from: data)
		} catch {
			print("Error loading shopping items: \(error)")
		}
	}
}
