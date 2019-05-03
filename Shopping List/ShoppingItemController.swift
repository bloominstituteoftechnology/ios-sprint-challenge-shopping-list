//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Hector Steven on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit
/*
to save : let data = uiimagepngpresentation(image)
to load: let image = UIImge(data: data)

*/
class ShoppingItemController {
	
	
	
	func updateAddedToCart(item: ShoppingItem){
		if let index = indexFromItem(item: item) {
			shoppingItems[index].added.toggle()
		}
	}
	
	func createShoppingItem(name: String) {
		if let image = UIImage(named: name) {
			guard let data = UIImagePNGRepresentation(image) else { return }
			shoppingItems.append(ShoppingItem(image: data, name: name))
		}
	}
	
	init() {
		
		guard let check = checkForFirsrLoad() else {
			let defaults = UserDefaults.standard
			for item in itemNames {
				createShoppingItem(name: item)
			}
			saveToPersistentStore()
			defaults.set(false, forKey: "DidRun")
			return
		}
		print(check)
		
		if !check {
			loadFromPersistentStore()
//			defaults.set(true, forKey: "DidRun")
		}
		
		
		
	}
	
	private func indexFromItem(item: ShoppingItem) -> Int?{
		guard let index = shoppingItems.firstIndex(of: item) else { return nil}
		return index
	}
	
	private (set) var itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
	private(set) var shoppingItems: [ShoppingItem] = []
	
	var itemsInCartCount: Int {
		var count = 0
		for item in shoppingItems {
			if item.added {
				count += 1
			}
		}
		return count
	}
	
	private var readingListURL: URL? {
		let fileManager = FileManager.default
		guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
		let fileName = "ShoppingList.plist"
		let document = documents.appendingPathComponent(fileName)
		return document
	}
	
	
	
}

extension ShoppingItemController {
	
	///return check for defult valuue
	func checkForFirsrLoad() -> Bool? {
		let defaults = UserDefaults.standard
		if let didRun = (defaults.object(forKey: "DidRun") as? Bool) {
			return didRun
		}
		return nil
	}
	
	
	
	func saveToPersistentStore() {
		guard let url = readingListURL else { return }
		
		do {
			let encoder = PropertyListEncoder()
			let data = try encoder.encode(shoppingItems)
			try data.write(to: url)
		} catch {
			NSLog("Error saving book data: \(error)")
		}
	}
	
	func loadFromPersistentStore() {
		let fileManager = FileManager.default
		
		guard let url = readingListURL,
			fileManager.fileExists(atPath: url.path) else {
				print("error: loadFromPersistentStore()")
				return
		}
		
		do {
			let data = try Data(contentsOf: url)
			let decoder = PropertyListDecoder()
			let decodedBooks = try decoder.decode([ShoppingItem].self, from: data)
			shoppingItems = decodedBooks
		}catch {
			NSLog("Error loading book data: \(error)")
			}
		}
	
}
