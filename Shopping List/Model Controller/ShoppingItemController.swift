//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by John Kouris on 8/17/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    
    var shoppingItems: [ShoppingItem] {
        var temp = [
            ShoppingItem(name: "Apple", imageName: "Apple"),
            ShoppingItem(name: "Grapes", imageName: "Grapes"),
            ShoppingItem(name: "Milk", imageName: "Milk"),
            ShoppingItem(name: "Muffin", imageName: "Muffin"),
            ShoppingItem(name: "Popcorn", imageName: "Popcorn"),
            ShoppingItem(name: "Soda", imageName: "Soda"),
            ShoppingItem(name: "Strawberries", imageName: "Strawberries")
        ]
        
        return temp
    }
    
}
