//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Taylor Lyles on 7/26/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingListController: Codable {
	
	let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
	
	//TODO: - Check if this is right
	init(hasBeenAdded: Bool = true, userDefaults: UserDefaults) {
		
	}
	
	var persistentURL: URL? {
		let fileManager = FileManager.default
		guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
		return documents.appendingPathComponent("items.plist")
	}

	
}
