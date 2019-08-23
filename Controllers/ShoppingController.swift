//
//  ShoppingController.swift
//  Shopping List
//
//  Created by William Chen on 8/23/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingController{
    var shoppingItems: [ShoppingItem] = []
    func createShoppingItems(shoppingItem: ShoppingItem){
        let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
        
        for itemName in itemNames{
            let item = ShoppingItem(name: itemName, hasBeenAdded: false)
            shoppingItems.append(item)
        }
        
        var itemAdded = UserDefaults.standard.bool(forKey: "hasBeenRead")
        
        if itemAdded == false{
            itemAdded = true
        }
        
    }
}
