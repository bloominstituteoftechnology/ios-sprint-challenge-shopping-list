//
//  ShoppingController.swift
//  Shopping List
//
//  Created by Kenny on 12/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingController {
    //MARK: Class properties
    var shoppingItems: [ShoppingItem] = []
    var wasItemAdded: Bool = false
    
    private let itemNames: [String] = [
        "Apple",
        "Grapes",
        "Milk",
        "Muffin",
        "Popcorn",
        "Soda",
        "Strawberries"
    ]
    
    //MARK: Class Methods
    func update(item: ShoppingItem) {
        print("\(item.name) wasAdded: \(wasItemAdded)")
        for (index, iteratedItem) in shoppingItems.enumerated() where iteratedItem == item {
            let newItem = ShoppingItem(name: item.name, hasBeenAdded: !item.hasBeenAdded)
            shoppingItems[index] = newItem
        }
    }
    
    init() {
        if shoppingItems.count <= 0 {
            for name in itemNames {
                let item = ShoppingItem(name: name)
                self.shoppingItems.append(item)
            }
        }
    }
}
