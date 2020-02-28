//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Wyatt Harrell on 2/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation



class ShoppingItemController {
    
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    
    var shoppingList: [ShoppingItem] = []
    
    var items: [ShoppingItem] = []
    
    
    init() {
        for item in itemNames {
            items.append(ShoppingItem(name: item))
        }
        #warning("check user defualts and save")

    }
//    {
//        var result: [ShoppingItem] = []
//
//        for item in itemNames {
//            result.append(ShoppingItem(name: item))
//        }
//
//        #warning("check user defualts and save")
//
//        return result
//    }
    
    func updateHasBeenAdded(for item: ShoppingItem) {
        
        for i in 0..<items.count {
            if items[i] == item {
                if items[i].isAdded {
                    items[i].isAdded = false
                } else {
                    items[i].isAdded = true
                    shoppingList.append(items[i])
                }
            }
        }
        print(shoppingList)
    }
    
}
