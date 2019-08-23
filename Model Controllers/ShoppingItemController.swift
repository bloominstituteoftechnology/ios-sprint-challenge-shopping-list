//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Percy Ngan on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {

	private(set) var items: [ShoppingItem] = []

	var showInitialShoppingItems = [
		ShoppingItem(itemName: "Apple", hasBeenAdded: false),
		ShoppingItem(itemName: "Grapes", hasBeenAdded: false),
		ShoppingItem(itemName: "Milk", hasBeenAdded: false),
		ShoppingItem(itemName: "Muffins", hasBeenAdded: false),
		ShoppingItem(itemName: "Popcorn", hasBeenAdded: false),
		ShoppingItem(itemName: "Soda", hasBeenAdded: false),
		ShoppingItem(itemName: "Strawberries", hasBeenAdded: false)
	]

	let shouldShowShoppingItems = UserDefaults.standard.bool(forKey: .shouldShowSoppingItems)

	private var persistentFileURL: URL? {
		let fileManager = FileManager.default

		guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }

		return documents.appendingPathComponent("items.plist")
	}

	init() {
		loadFromPersistentStore()
	}

	func saveToPersistentStore() {
		guard let url = persistentFileURL else { return }

		do {
			let encoder = PropertyListEncoder()
			let data = try encoder.encode(items)
			try data.write(to: url)
		} catch {
			print("Error saving shopping items: \(error)")
		}
	}

	func loadFromPersistentStore() {
		let fileManager = FileManager.default
		guard let url = persistentFileURL, fileManager.fileExists(atPath: url.path) else { return }

		do {
			let data = try Data(contentsOf: url)
			let decoder = PropertyListDecoder()
			items = try decoder.decode([ShoppingItem].self, from: data)
		} catch {
			print("Error loading shopping items: \(error)")
		}
	}
}
