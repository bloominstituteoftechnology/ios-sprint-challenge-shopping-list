//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Violet Lavender Love on 5/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

class ShoppingListController {
    
    var shoppingListItems: [ShoppingItem] {
        var shoppingListItems =
        [ShoppingItem(name: "Apple", hasBeenAdded: false, imageName: "Apple"),
         ShoppingItem(name: "Grapes", hasBeenAdded: false, imageName: "Grapes"),
         ShoppingItem(name: "Milk", hasBeenAdded: false, imageName: "Milk"),
         ShoppingItem(name: "Muffin", hasBeenAdded: false, imageName: "Muffin"),
         ShoppingItem(name: "Popcorn", hasBeenAdded: false, imageName: "Popcorn"),
         ShoppingItem(name: "Soda", hasBeenAdded: false, imageName: "Soda"),
         ShoppingItem(name: "Strawberries", hasBeenAdded: false, imageName: "Strawberries")
        ]
        let hasBeenAdded = UserDefaults.standard.bool(forKey: .hasBeenAddedKey)
        
        if hasBeenAdded {
            //change button to show that, something i haven't had time to teach myself because i'm exhausted 
        }
        
        return shoppingListItems
    }
    
    
    
    
}
