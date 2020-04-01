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
    
    var itemHelper = ItemHelper()
    var shoppingItems: [ShoppingItem] = []
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    var preferencesSet: Bool {
        if itemHelper.itemPreferences == nil {
            return false
        } else {
            return true
        }
    }
    
    func createItem(name: String) {
        let item = ShoppingItem(name: name, hasBeenAdded: false)
        shoppingItems.append(item)
    }
    
    init() {
        if !preferencesSet {
        for name in itemNames {
            createItem(name: name)
            itemHelper.saveView()
            }
        } else {
            itemHelper.loadView()
            if let preferences = itemHelper.itemPreferences {
                shoppingItems = preferences
            }
        }
    }
}
