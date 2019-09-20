//
//  ShoppingItemsController.swift
//  Shopping List
//
//  Created by macbook on 9/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemsController {
    
    // MARK: - Creating the Shopping list
    var shoppingItems: [ShoppingItem] {
        
        var itemsNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
        var itemsArray: [ShoppingItem] = []
        
        for item in itemsNames {
            var newItem = ShoppingItem(name: item)
            itemsArray.append(newItem)
        }
        return itemsArray
    }
    
    
    
    
    
    
    
    
    
    
    
    
}


