//
//  ShoppingListController.swift
//  Shopping List
//
//  Created by Ryan Murphy on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    
    var shoppingItems: [ShoppingItem] {
        
     let items =
           [ ShoppingItem(name: "Apple", imageName: "apple", hasBeenAdded: false),
            ShoppingItem(name: "Grapes", imageName: "grapes", hasBeenAdded: false),
            ShoppingItem(name: "Milk", imageName: "milk", hasBeenAdded: false),
            ShoppingItem(name: "Muffin", imageName: "muffin", hasBeenAdded: false),
            ShoppingItem(name: "Popcorn", imageName: "popcorn", hasBeenAdded: false),
            ShoppingItem(name: "Soda", imageName: "soda", hasBeenAdded: false),
            ShoppingItem(name: "Strawberries", imageName: "strawberries", hasBeenAdded: false)
        ]
      return items
        
    }

    
    func updateHasBeenSelected(for ShoppingItem: ShoppingItem) {
        guard let itemIndex = shoppingItems.firstIndex(of: ShoppingItem) else { return }
        
        var updatedShoppingItem = shoppingItems[itemIndex]
        
        switch updatedShoppingItem.hasBeenAdded == false {
        case true:
            updatedShoppingItem.hasBeenAdded = true
        case false:
            updatedShoppingItem.hasBeenAdded = false
            
    }
}



    var selectedItems: [ShoppingItem] {
        return shoppingItems.filter({ $0.hasBeenAdded == true})
    }



}
