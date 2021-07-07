//
//  ShoppingItemController.swift
//  Shopping List
//
//  Created by Lisa Sampson on 5/3/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class ShoppingItemController {
    
    // MARK: - Initializer
    
    init() {
        if UserDefaults.standard.bool(forKey: "ShoppingKey") {
            loadFromPersistence()
        } else {
            UserDefaults.standard.set(true, forKey: "ShoppingKey")
            let itemNames = ["apple", "grapes", "milk", "muffin", "popcorn", "soda", "strawberries"]
            for item in itemNames {
                create(image: item, item: item.capitalized)
            }
        }
    }
    
    // MARK: - Properties
    var shoppingItems: [ShoppingItem] = []
    
    var addedItem: [ShoppingItem] {
        return shoppingItems.filter({$0.isAdded})
    }
    
    var notAddedItem: [ShoppingItem] {
        return shoppingItems.filter({$0.isAdded == false})
    }
    
    // MARK: - CRUD
    
    func create(image: String, item: String) {
        let shoppingItem = ShoppingItem(image: image, item: item)
        shoppingItems.append(shoppingItem)
        
        saveToPersistence()
    }
    
    func updateIsAdded(shoppingItem: ShoppingItem) {
        guard let index = shoppingItems.index(of: shoppingItem) else { return }
        
        var scratch = shoppingItem
        scratch.isAdded = !shoppingItem.isAdded
        
        shoppingItems.remove(at: index)
        shoppingItems.insert(scratch, at: index)
        
        saveToPersistence()
    }
}
