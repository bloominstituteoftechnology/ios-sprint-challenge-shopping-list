//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Marlon Raskin on 7/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation


class ShoppingItemController {

	init() {
		loadFromPersistentStore()
	}


	// MARK: - Properties

	var persistentFileURL: URL? {
		let fm = FileManager.default
		guard let directory = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
		return directory.appendingPathComponent("shoppingList.plist")
	}

	var shoppingItems: [ShoppingItem] = [
										ShoppingItem(name: "Apples", imageName: "Apple"),
										ShoppingItem(name: "Grapes", imageName: "Grapes"),
										ShoppingItem(name: "Milk", imageName: "Milk"),
										ShoppingItem(name: "Muffin", imageName: "Muffin"),
										ShoppingItem(name: "Popcorn", imageName: "Popcorn"),
										ShoppingItem(name: "Soda", imageName: "Soda"),
										ShoppingItem(name: "Strawberries", imageName: "Strawberries")
										]


	// MARK: - Shopping Item Functions

	func toggleItemsAdded(item: ShoppingItem) {
		guard let index = shoppingItems.firstIndex(of: item) else { return }
		shoppingItems[index].isAdded = !shoppingItems[index].isAdded
		saveToPersistentStore()
	}


	// MARK: - Persistence

	private func saveToPersistentStore() {
		guard let url = persistentFileURL else { return }
		do {
			let encoder = PropertyListEncoder()
			let data = try encoder.encode(shoppingItems)
			try data.write(to: url)
		} catch {
			print("Error saving data: \(error)")
		}
	}

	private func loadFromPersistentStore() {
		let fm = FileManager.default
		guard let url = persistentFileURL,
			fm.fileExists(atPath: url.path) else { return }
		do {
			let decoder = PropertyListDecoder()
			let data = try Data(contentsOf: url)
			shoppingItems = try decoder.decode([ShoppingItem].self, from: data)
		} catch {
			print("Error loading data: \(error)")
		}
	}

}
