//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Jon Bash on 2019-10-18.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    // MARK: - Settings
    let itemNames = ["Apple", "Grapes", "Milk", "Muffin", "Popcorn", "Soda", "Strawberries"]
    var itemsListInitialized: Bool {
        // returns false if key not found
        return UserDefaults.standard.bool(forKey: .itemsListInitializedKey)
    }
    
    // MARK: - Properties
    
    var items = [ShoppingItem]()
    
    init() {
        if !itemsListInitialized {
            initializeItemsList()
        } else {
        }
    }
    
    // MARK: - Public Methods
    
    // MARK: - Private Methods
    
    private func initializeItemsList() {
        for itemName in itemNames {
            items.append(ShoppingItem(name: itemName, added: false))
        }
        UserDefaults.standard.set(true, forKey: .itemsListInitializedKey)
    }
}

extension String {
    static let itemsListInitializedKey = "ItemsListInitialized"
}
