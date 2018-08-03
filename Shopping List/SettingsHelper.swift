//
//  SettingsHelper.swift
//  Shopping List
//
//  Created by Samantha Gatt on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

func setUpShoppingItems() -> ShoppingItemController {
    let controller = ShoppingItemController()
    let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
    for item in itemNames {
        controller.createFromProvided(name: item, isAdded: false)
    }
    return controller
}

class SettingsHelper {
    
    init() {
        // If the user hasn't set a default then this code will run and then the default will be set to provided
        guard let _ = shoppingItemsValue else {
            setShoppingItemsToProvided()
            return
        }
    }
    
    // MARK: - Properties
    
    let shoppingItemsKey = "Shopping Items"
    let providedValue = "Provided"
    let interactiveValue = "Interactive"
    
    var shoppingItemController = ShoppingItemController()
    
    var shoppingItemsValue: String? {
        return UserDefaults.standard.string(forKey: shoppingItemsKey)
    }
    
    // MARK: - Methods
    
    func setShoppingItemsToProvided() {
        UserDefaults.standard.set(providedValue, forKey: shoppingItemsKey)
        
    }
    
    // If I have time
    func setShoppingItemsToInteractive() {
        UserDefaults.standard.set(interactiveValue, forKey: shoppingItemsKey)
    }
    
}
