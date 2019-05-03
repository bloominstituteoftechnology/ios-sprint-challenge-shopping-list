//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Taylor Lyles on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingListController {
	
	

	var items: [Item] {
		
		var array = [
			Item(name: "Apple", imageName: "apple"),
			Item(name: "Grapes", imageName: "grapes"),
			Item(name: "Milk", imageName: "milk"),
			Item(name: "Muffin", imageName: "muffin"),
			Item(name: "Popcorn", imageName: "popcorn"),
			Item(name: "Soda", imageName: "soda"),
			Item(name: "Strawberries", imageName: "strawberries")
		]
		return array
	
	}
	
	
	
	
}
