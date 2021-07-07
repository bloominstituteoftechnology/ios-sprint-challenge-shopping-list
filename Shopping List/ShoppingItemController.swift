//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Michael Redig on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
	private(set) var shoppingItems = [ShoppingItem]()
	
	var numberOfItemsOrdered: Int {
		return shoppingItems.reduce(0) { $0 + ($1.inCart ? 1 : 0) }
	}
	
	private let defaults = UserDefaults.standard
	init() {
		if defaults.bool(forKey: .initializedDataKey) {
			loadData()
		} else {
			let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
			for name in itemNames {
				addShoppingItem(withImageName: name, saveData: false)
			}
			saveData()
			defaults.set(true, forKey: .initializedDataKey)
		}
	}
	
	func addShoppingItem(withImageName imageName: String, inCart: Bool = false, saveData: Bool = true) {
		shoppingItems.append(ShoppingItem(imageName: imageName, inCart: inCart))
		if saveData {
			self.saveData()
		}
	}
	
	func updateShoppingItem(_ item: ShoppingItem, inCart: Bool, saveData: Bool = true) {
		guard let itemIndex = shoppingItems.firstIndex(of: item) else { return }
		shoppingItems[itemIndex].inCart = inCart
		if saveData {
			self.saveData()
		}
	}
	
	
	// MARK:- load/save management
	
	private let fm = FileManager.default
	private var savedFilePath: URL? {
		guard let documents = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
		return documents.appendingPathComponent("shoppingListData.plist")
	}
	private func loadData() {
		guard let path = savedFilePath, fm.fileExists(atPath: path.path) else {
			print("File doesn't exist!")
			return
		}
		let decoder = PropertyListDecoder()
		do {
			let data = try Data(contentsOf: path)
			shoppingItems = try decoder.decode([ShoppingItem].self, from: data)
		} catch {
			fatalError("Error loading data: \(error)")
		}
	}
	
	private func saveData() {
		guard let path = savedFilePath else { return }
		let encoder = PropertyListEncoder()
		do {
			let data = try encoder.encode(shoppingItems)
			try data.write(to: path)
		} catch {
			print("Error saving data!: \(error)")
		}
	}
}
