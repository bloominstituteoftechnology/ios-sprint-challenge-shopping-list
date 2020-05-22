//
//  ShoppingItemsController.swift
//  Shopping List
//
//  Created by Jason Hoover on 5/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    
    var itemsAvailable: [ShoppingItem] {
        
        let items = [
        ShoppingItem(name: "Apple", imageName: "Apple"),
        ShoppingItem(name: "Grapes", imageName: "Grapes"),
        ShoppingItem(name: "Milk", imageName: "Milk"),
        ShoppingItem(name: "Muffins", imageName: "Muffins"),
        ShoppingItem(name: "Popcorn", imageName: "Popcorn"),
        ShoppingItem(name: "Soda", imageName: "Soda"),
        ShoppingItem(name: "Strawberry", imageName: "Strawberry")
        ]
        
        return items
    }
}
