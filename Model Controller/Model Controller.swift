//
//  Model Controller.swift
//  Shopping List
//
//  Created by Osha Washington on 12/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation


class ShoppingItemController {
var shoppingItem: [ShoppingItem] {
    var result = [
        ShoppingItem(itemName: "Apple", isAdded: false, image: "apple"),
        ShoppingItem(itemName: "Grapes", isAdded: false, image: "grapes"),
        ShoppingItem(itemName: "Milk", isAdded: false, image: "milk"),
        ShoppingItem(itemName: "Muffin", isAdded: false, image: "muffin"),
        ShoppingItem(itemName: "Popcorn", isAdded: false, image: "popcorn"),
        ShoppingItem(itemName: "Soda", isAdded: false, image: "soda"),
        ShoppingItem(itemName: "Strawberries", isAdded: false, image: "strawberries"),
        ShoppingItem(
    ]
    
    }
    
    return result
}
}
