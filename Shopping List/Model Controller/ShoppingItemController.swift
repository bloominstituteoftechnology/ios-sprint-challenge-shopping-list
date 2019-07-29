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
										ShoppingItem(name: "Apples", imageName: "apple 2"),
										ShoppingItem(name: "Grapes", imageName: "grapes 2"),
										ShoppingItem(name: "Milk", imageName: "milk 2"),
										ShoppingItem(name: "Muffin", imageName: "muffin 2"),
										ShoppingItem(name: "Popcorn", imageName: "popcorn 2"),
										ShoppingItem(name: "Soda", imageName: "soda 2"),
										ShoppingItem(name: "Strawberries", imageName: "strawberries 2")
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
