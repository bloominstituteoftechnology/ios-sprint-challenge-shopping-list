//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Taylor Lyles on 7/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
	
	var items = [ShoppingItem]()
	
	init() {
		called()
	}

	var persistentURL: URL? {
		let fileManager = FileManager.default
		guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
		return documents.appendingPathComponent("items.plist")
	}
	
	var wasAdded: [ShoppingItem] {
		return items.filter { $0.hasBeenAdded == true}
	}
	
	func toggleHasBeenChanged(itemToggled: ShoppingItem) {
		itemToggled.hasBeenAdded = !itemToggled.hasBeenAdded
		saveToPersistentStore()
	}
	
	func createItems() {
		let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
		for item in itemNames {
			items.append(ShoppingItem(item: item, hasBeenAdded: true, imageName: item))
			
			saveToPersistentStore()
		}
		UserDefaults.standard.set(true, forKey: "WasCalled")
	}
	
	func saveToPersistentStore() {
		let encoder = PropertyListEncoder()
		guard let url = persistentURL else { return }
		
		do {
			let data = try encoder.encode(items)
			try data.write(to: url)
		} catch {
			print("Error saving shopping item to persistent store: \(error.localizedDescription)")
		}
	}
	
	func loadFromPersistentStore() {
		let decoder = PropertyListDecoder()
		let fileManager = FileManager.default
		
		guard let url = persistentURL, fileManager.fileExists(atPath: url.path) else { return }
		
		do {
			let data = try Data(contentsOf: url)
			items = try decoder.decode([ShoppingItem].self, from: data)
		} catch {
			print("Error loading shopping items from the persistent store: \(error.localizedDescription)")
		}
	}
	
	
	func called() {
		let userDefaults = UserDefaults.standard
		
		if userDefaults.bool(forKey: "WasCalled") == false {
			createItems()
		} else {
			loadFromPersistentStore()
		}
	}
}
