//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Jonathan Ferrer on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    var shoppingList: [ShoppingItem] {
        let items = [
            ShoppingItem(name: "Apple", imageName: "apple", added: false),
            ShoppingItem(name: "Grapes", imageName: "grapes", added: false),
            ShoppingItem(name: "Milk", imageName: "milk", added: false),
            ShoppingItem(name: "Muffin", imageName: "muffin", added: false),
            ShoppingItem(name: "Popcorn", imageName: "popcorn", added: false),
            ShoppingItem(name: "Soda", imageName: "soda", added: false),
            ShoppingItem(name: "Strawberries", imageName: "strawberries", added: false)
            
            
            ]
            return items
    }
    
    func updateItemHasBeenAdded(shoppingItem: ShoppingItem) {
        print("Item Has Been Updated")
        guard let itemIndex = shoppingList.firstIndex(of: shoppingItem) else { return }
        var updatedItem = shoppingList[itemIndex]
        if updatedItem.added == false {
            updatedItem.added = true
        } else {
            updatedItem.added = false
        }
        
        
    }
    
}
