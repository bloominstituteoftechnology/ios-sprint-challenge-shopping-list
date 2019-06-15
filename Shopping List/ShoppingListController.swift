//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Lambda_School_Loaner_101 on 6/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingListController {
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    
    // create shopping list array
    // create new shopping item for every item in itemNames
    // append new shopping item to the shopping list array
    
    var shoppingList: [ShoppingItem] = []
    
    init() {
        for item in itemNames {
            let shoppingItem = ShoppingItem(itemName: item, imageName: item)
            shoppingList.append(shoppingItem)
        }
    }
    
}
