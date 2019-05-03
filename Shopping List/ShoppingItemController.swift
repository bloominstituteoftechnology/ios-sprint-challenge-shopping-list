//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Michael Redig on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
	var shoppingItems = [ShoppingItem]()
	
	func addShoppingItem(withImageName imageName: String, inCart: Bool = false) {
		shoppingItems.append(ShoppingItem(imageName: imageName, inCart: inCart))
	}
}
