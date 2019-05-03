//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Jonathan Ferrer on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    var shopingList: [ShoppingItem] {
        let items = [
            ShoppingItem(name: "Apple", imageName: "apple"),
            ShoppingItem(name: "Grapes", imageName: "grapes"),
            ShoppingItem(name: "Milk", imageName: "milk"),
            ShoppingItem(name: "Muffin", imageName: "muffin"),
            ShoppingItem(name: "Popcorn", imageName: "popcorn"),
            ShoppingItem(name: "Soda", imageName: "soda"),
            ShoppingItem(name: "Strawberries", imageName: "strawberries")
            ]
            return items
    }
    
}
