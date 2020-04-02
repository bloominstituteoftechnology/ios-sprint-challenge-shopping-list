//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Cody Morley on 3/27/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation
import UIKit

class ShoppingItemController {
    
    var shoppingItems: [ShoppingItem] = []
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    var itemPreferenceKey: String = "Key"
    var itemPreferences: [ShoppingItem]?
    
    
    var preferencesSet: Bool {
        if itemPreferences == nil {
            return false
        } else {
            return true
        }
    }
    
    func createItem(name: String) {
        let item = ShoppingItem(name: name, hasBeenAdded: false)
        shoppingItems.append(item)
    }
    
    func saveView() {
        let itemPreferences = itemNames
        UserDefaults.standard.set(itemPreferences, forKey: itemPreferenceKey)
    }
    
    func loadView() {
        let itemPreferences = UserDefaults.standard.array(forKey: itemPreferenceKey)
    }
    
    func updateHasBeenAdded() {
        
        
    }
    
    
    init() {
        if preferencesSet {
            loadView()
            if let preferences = itemPreferences {
                shoppingItems = preferences
            }
        } else {
                for name in itemNames {
                    createItem(name: name)
            }
            saveView()
        }
    }
}
