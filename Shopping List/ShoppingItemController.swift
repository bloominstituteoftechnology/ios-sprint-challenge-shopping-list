//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Hector Steven on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit


class ShoppingItemController {
	
	
	
	func updateAddedToCart(item: ShoppingItem){
		if let index = indexFromItem(item: item) {
			shoppingItems[index].added.toggle()
		}
	}
	
	func createShoppingItem(name: String) {
		if let image = UIImage(named: name) {
			shoppingItems.append(ShoppingItem(image: image, name: name))
		}
	}
	
	init() {
		for item in itemNames {
			createShoppingItem(name: item)
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
}
