//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by admin on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    var shoppingItems: [ShoppingItem] {
        
        var result = [
            ShoppingItem(itemName: "Apple", imageName: "Apple", added: false),
            ShoppingItem(itemName: "Grapes", imageName: "Grapes", added: false),
            ShoppingItem(itemName: "Milk", imageName: "Milk", added: false),
            ShoppingItem(itemName: "Muffin", imageName: "Muffin", added: false),
            ShoppingItem(itemName: "Popcorn", imageName: "Popcorn", added: false),
            ShoppingItem(itemName: "Soda", imageName: "Soda", added: false),
            ShoppingItem(itemName: "Strawberries", imageName: "Strawberries", added: false)
        ]
        
        return result
    }
}
