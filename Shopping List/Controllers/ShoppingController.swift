//
//  ShoppingController.swift
//  Shopping List
//
//  Created by Marlon Raskin on 6/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingController {
	
	private(set) var items: [ShoppingItem] = []
	
	var showInitialShoppingItems = [
	ShoppingItem(itemName: "Apple", hasBeenAdded: true, imageName: "Apple"),
	ShoppingItem(itemName: "Grapes", hasBeenAdded: true, imageName: "Grapes"),
	ShoppingItem(itemName: "Milk", hasBeenAdded: true, imageName: "Milk"),
	ShoppingItem(itemName: "Muffins", hasBeenAdded: true, imageName: "Muffin"),
	ShoppingItem(itemName: "Popcorn", hasBeenAdded: true, imageName: "Popcorn"),
	ShoppingItem(itemName: "Soda", hasBeenAdded: true, imageName: "Soda"),
	ShoppingItem(itemName: "Strawberries", hasBeenAdded: true, imageName: "Strawberries")
	]
	
	let shouldShowShoppingItems = UserDefaults.standard.bool(forKey: .shouldShowSoppingItems)

	private var persistentFileURL: URL? {
		let fileManager = FileManager.default
		
		guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
		
		return documents.appendingPathComponent("items.plist")
	}
	
	init() {
		items = showInitialShoppingItems
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
