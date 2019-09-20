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
    var shoppingList: [ShoppingItem] {
        
        var itemsNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
        var itemsArray: [ShoppingItem] = []
        
        for item in itemsNames {
            
            var newItem = ShoppingItem(name: item, isAdded: false)
            
            
//            let userDefault = UserDefaults.standard
//            userDefault.set(false, forKey: .itemsHaveBeenCreated)
            
            itemsArray.append(newItem)
        }
        
        
        
//        Use a Bool and the UserDefaults to make sure that new shopping items are initialized only once.
//        Save the shopping list to a file using a PropertyListEncoder as the user makes changes.
        
//        You’ll use an init and within that you’ll want to call the functions to create the shopping list items (you’ll want to check the user defaults key within that function) and load from persistent store

    
        return itemsArray
    }
    
    
    
    init() {
        let userDefault = UserDefaults.standard
        userDefault.set(false, forKey: .itemsHaveBeenCreated)
    }
    
    
    
    
    
    
    
    
}


