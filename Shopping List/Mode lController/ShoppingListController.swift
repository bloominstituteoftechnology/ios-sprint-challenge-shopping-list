//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Taylor Lyles on 7/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingListController {
	
	var items = [Item]()
	
	//TODO: - Check if this is right
	init(hasBeenAdded: Bool = true, userDefaults: UserDefaults) {
		
	}
	
	var persistentURL: URL? {
		let fileManager = FileManager.default
		guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
		return documents.appendingPathComponent("items.plist")
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
			items = try decoder.decode([Item].self, from: data)
		} catch {
			print("Error loading shopping items from the persistent store: \(error.localizedDescription)")
		}
	}

	
}
