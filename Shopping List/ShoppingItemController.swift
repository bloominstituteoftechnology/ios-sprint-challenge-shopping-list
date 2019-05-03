//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Hector Steven on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit


class ShoppingItemController {
	
	
	func createShoppingItem(name: String) {
		if let image = UIImage(named: name) {
			shoppingList.append(ShoppingItem(image: image, name: name))
		}
	}
	
	init() {
		for item in itemNames {
			createShoppingItem(name: item)
		}
	}
	
	
	private (set) var itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
	private(set) var shoppingList: [ShoppingItem] = []
}
