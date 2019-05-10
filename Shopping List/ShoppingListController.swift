//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Taylor Lyles on 5/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingListController {
	
	var items = [Item]()
	
	init() {
		
		called()
	}
	
	
	func toggleHasBeenChanged(shoppingItem: Item){
		
		shoppingItem.added = !shoppingItem.added
		saveToPersistentStore()
		
	}
	//
	//	func toggleHasBeenChanged(item: Item) {
	//		guard let index = shoppingItems.firstIndex(of: item) else { return }
	//		var updatedItem = item
	//		updatedItem.added = !updatedItem.added
	//
	//		shoppingItems[index].added = false
	//	}
	
	
	var persistentURL: URL? {
		
		let fileManager = FileManager.default
		
		guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
		
		return documents.appendingPathComponent("items.plist")
	}
	
	
	func createItems() {
		
		let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
		
		for item in itemNames {
			
			items.append(Item(name: item, imageName: item))
			
			saveToPersistentStore()
		}
		
		UserDefaults.standard.set(true, forKey: "WasCalled")
		
	}
	
	
	func saveToPersistentStore(){
		
		let encoder = PropertyListEncoder()
		
		guard let url = persistentURL else { return }
		
		do {
			
			let data = try encoder.encode(items)
			
			try data.write(to: url)
			
		} catch {
			
			print("Error saving shopping item to persistent store: \(error.localizedDescription)")
			
		}
	}
	
	func loadFromPersistentStore(){
		
		let decoder = PropertyListDecoder()
		
		let fileManager = FileManager.default
		
		guard let url = persistentURL, fileManager.fileExists(atPath: url.path)  else { return }
		
		do {
			
			let data = try Data(contentsOf: url)
			
			items = try decoder.decode([Item].self, from: data)
			
		} catch  {
			
			print("Error loading shopping items from the persistent store: \(error.localizedDescription)")
			
		}
	}
	
	
	
	var wasAdded: [Item] {
		
		return items.filter { $0.added == true }
		
	}
	
	//
	//	var items: [Item] {
	//
	//		var array = [
	//			Item(name: "Apple", imageName: "apple"),
	//			Item(name: "Grapes", imageName: "grapes"),
	//			Item(name: "Milk", imageName: "milk"),
	//			Item(name: "Muffin", imageName: "muffin"),
	//			Item(name: "Popcorn", imageName: "popcorn"),
	//			Item(name: "Soda", imageName: "soda"),
	//			Item(name: "Strawberries", imageName: "strawberries")
	//		]
	//		return array
	//
	//	}
	
	func called() {
		
		let userDefaults = UserDefaults.standard
		
		if userDefaults.bool(forKey: "WasCalled") == false {
			
			createItems()
			
		} else {
			
			loadFromPersistentStore()
		}
	}
	
	
}
