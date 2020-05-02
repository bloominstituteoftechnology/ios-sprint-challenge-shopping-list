//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Jeffrey Santana on 7/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingListController {
	
	private let notFirstTimeKey = "notFirstTime"
	private(set) var list = [Item]()
	
	var filteredList: [(cartStatus: String, list: [Item])] {
		var newList = [(cartStatus: String, list: [Item])]()
		let added = list.filter({$0.isInCart})
		let notAdded = list.filter({!$0.isInCart})
		
		if !added.isEmpty {
			newList.append((cartStatus: "Added", list: added))
		}
		if !notAdded.isEmpty {
			newList.append((cartStatus: "Not Added", list: notAdded))
		}
		
		return newList
	}
	
	init() {
		checkFirstTime()
	}
	
	func updateItemStatus(item: Item) {
		guard let index = list.index(of: item) else { return }
		list[index].isInCart.toggle()
		saveToPersistentStore()
	}
	
	private func checkFirstTime() {
		if UserDefaults.standard.bool(forKey: notFirstTimeKey) == false {
			list = [
				Item(name: "Apple", isInCart: false),
				Item(name: "Grapes", isInCart: false),
				Item(name: "Milk", isInCart: false),
				Item(name: "Muffin", isInCart: false),
				Item(name: "Popcorn", isInCart: false),
				Item(name: "Soda", isInCart: false),
				Item(name: "Strawberries", isInCart: false)
			]
			UserDefaults.standard.setValue(true, forKey: notFirstTimeKey)
			saveToPersistentStore()
		} else {
			loadFromPersistenStore()
		}
	}
	
	//MARK: - Persistence
	
	private func saveToPersistentStore() {
		guard let url = persistentFileURL else { return }
		
		do {
			let encoder = PropertyListEncoder()
			let data = try encoder.encode(list)
			try data.write(to: url)
		} catch {
			print("Error saving shoppingList data: \(error.localizedDescription)")
		}
	}
	
	private func loadFromPersistenStore() {
		let fm = FileManager.default
		guard let url = persistentFileURL, fm.fileExists(atPath: url.path) else { return }
		
		do {
			let data = try Data(contentsOf: url)
			let decoder = PropertyListDecoder()
			list = try decoder.decode([Item].self, from: data)
		} catch {
			print("Error loading shoppingList data: \(error.localizedDescription)")
		}
	}
	
	private var persistentFileURL: URL? {
		let fm = FileManager.default
		guard let dir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
		
		return dir.appendingPathComponent("shoppingList.plist")
	}

}
