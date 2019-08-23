//
//  ShoppingController.swift
//  Shopping List
//
//  Created by Joshua Franklin on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingListController {
    
    var shoppingItem: [ShoppingItem] {
        
       var shoppingList = [
        
            ShoppingItem(name: "Apple", addedItem: true),
            ShoppingItem(name: "Grape", addedItem: true),
            ShoppingItem(name: "Milk", addedItem: true),
            ShoppingItem(name: "Muffin", addedItem: true),
            ShoppingItem(name: "Popcorn", addedItem: true),
            ShoppingItem(name: "Soda", addedItem: true),
            ShoppingItem(name: "Strawberries", addedItem: true),
            ]
        
        let shouldShowList = UserDefaults.standard.bool(forKey: .shouldShowShoppingKey)
        if shouldShowList {
            shoppingList.append(ShoppingItem(name: "Bannana", addedItem: true))
        }
        return shoppingList
    }
}
