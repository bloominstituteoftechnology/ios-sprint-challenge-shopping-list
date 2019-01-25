//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Vijay Das on 1/25/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ShoppingItemController {
    // properties
    // need to implement:

    // updateIsAdded method
    // filter methods for added and notadded items
    // persistence
    //
    
    // properties
    
    private(set) var shoppingList: [ShoppingItem] = []
    
    // create initial items and initialize
    // use provided snippet: let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
    
    func createItems() {
        let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
        for name in itemNames {
            let item = ShoppingItem(image: name, name: name)
            shoppingList.append(item)
        }
        
    }
    
    
    
    
}
