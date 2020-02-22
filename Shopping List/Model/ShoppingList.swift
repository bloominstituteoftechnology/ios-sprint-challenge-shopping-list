//
//  ShoppingList.swift
//  Shopping List
//
//  Created by Breena Greek on 2/21/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class ShoppingList {
    var shoppingItems : [ShoppingItem] {
        var shoppingItems = [
        ShoppingItem(name: "apple", imageName: "Apple"),
        ShoppingItem(name: "grapes", imageName: "Grapes"),
        ShoppingItem(name: "milk", imageName: "Milk"),
        ShoppingItem(name: "muffin", imageName: "Muffin"),
        ShoppingItem(name: "popcorn", imageName: "Popcorn"),
        ShoppingItem(name: "soda", imageName: "Soda"),
        ShoppingItem(name: "strawberries", imageName: "Strawberries")
        ]
        
        if UserDefaults.standard.bool(forKey: .shoppingListKey) {
            shoppingItems.append(ShoppingItem(name: "", imageName: ""))
        }
        return shoppingItems
    }
}
