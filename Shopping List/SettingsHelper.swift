//
//  SettingsHelper.swift
//  Shopping List
//
//  Created by Samantha Gatt on 8/3/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class SettingsHelper {
    
    init() {
        // If the user hasn't set a default then this code will run and then the default will be set to provided
        guard shoppingItemsValue else {
            setShoppingItemsToProvided()
            return
        }
    }
    
    // MARK: - Properties
    
    let shoppingItemsKey = "Shopping Items"
    let providedValue = true
    let interactiveValue = false
    
    var shoppingItemController = ShoppingItemController()
    
    var shoppingItemsValue: Bool {
        return UserDefaults.standard.bool(forKey: shoppingItemsKey)
    }
    
    // MARK: - Methods
    
    func setShoppingItemsToProvided() {
        UserDefaults.standard.set(providedValue, forKey: shoppingItemsKey)
        shoppingItemController.saveGivenItemsToPersistentStore()
    }
    
    // If I have time
    func setShoppingItemsToInteractive() {
        UserDefaults.standard.set(interactiveValue, forKey: shoppingItemsKey)
    }
    
}
